From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v6 1/8] drm/mediatek: recalculate hdmi phy clock of
 MT2701 by querying hardware
Date: Wed, 6 Mar 2019 18:07:34 +0800
Message-ID: <1551866854.1001.6.camel@mtksdaap41>
References: <20190225020912.29120-1-wangyan.wang@mediatek.com>
         <20190225020912.29120-2-wangyan.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190225020912.29120-2-wangyan.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: wangyan wang <wangyan.wang@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>, Colin Ian King <colin.king@canonical.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hi, Wangyan:

On Mon, 2019-02-25 at 10:09 +0800, wangyan wang wrote:
> From: chunhui dai <chunhui.dai@mediatek.com>
> 
> Recalculate the rate of this clock, by querying hardware.
> 
> Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> Signed-off-by: wangyan wang <wangyan.wang@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.c        |  7 ++----
>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.h        |  3 +--
>  drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 35 ++++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c |  8 ++++++
>  4 files changed, 46 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> index 4ef9c57ffd44..13c5e65b9ead 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> @@ -29,12 +29,9 @@ long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>  	return rate;
>  }
>  
> -unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
> -				       unsigned long parent_rate)
> +u32 mtk_hdmi_phy_read(struct mtk_hdmi_phy *hdmi_phy, u32 offset)
>  {
> -	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> -
> -	return hdmi_phy->pll_rate;
> +	return readl(hdmi_phy->regs + offset);
>  }
>  
>  void mtk_hdmi_phy_clear_bits(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> index f39b1fc66612..fdad8b17a915 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> @@ -41,6 +41,7 @@ struct mtk_hdmi_phy {
>  	unsigned int ibias_up;
>  };
>  
> +u32 mtk_hdmi_phy_read(struct mtk_hdmi_phy *hdmi_phy, u32 offset);
>  void mtk_hdmi_phy_clear_bits(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
>  			     u32 bits);
>  void mtk_hdmi_phy_set_bits(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
> @@ -50,8 +51,6 @@ void mtk_hdmi_phy_mask(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
>  struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw);
>  long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>  			     unsigned long *parent_rate);
> -unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
> -				       unsigned long parent_rate);
>  
>  extern struct platform_driver mtk_hdmi_phy_driver;
>  extern struct mtk_hdmi_phy_conf mtk_hdmi_phy_8173_conf;
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> index fcc42dc6ea7f..b25c9dfc432a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> @@ -153,6 +153,41 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  			  RG_HDMITX_DRV_IBIAS_MASK);
>  	return 0;
>  }
> +static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
> +				       unsigned long parent_rate)
> +{
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +	unsigned long out_rate, val;
> +
> +	val = (mtk_hdmi_phy_read(hdmi_phy, HDMI_CON6)
> +			& RG_HTPLL_PREDIV_MASK) >> RG_HTPLL_PREDIV;
> +	switch (val) {
> +	case 0x00:
> +		out_rate = parent_rate;
> +		break;
> +	case 0x01:
> +		out_rate = parent_rate / 2;
> +		break;
> +	default:
> +		out_rate = parent_rate / 4;
> +		break;
> +	}
> +
> +	val = (mtk_hdmi_phy_read(hdmi_phy, HDMI_CON6)
> +			& RG_HTPLL_FBKDIV_MASK) >> RG_HTPLL_FBKDIV;
> +	out_rate *= (val + 1) * 2;
> +	val = (mtk_hdmi_phy_read(hdmi_phy, HDMI_CON2)
> +			& RG_HDMITX_TX_POSDIV_MASK);
> +
> +	out_rate >>= (val >> RG_HDMITX_TX_POSDIV);
> +
> +	if (mtk_hdmi_phy_read(hdmi_phy, HDMI_CON2) & RG_HDMITX_EN_TX_POSDIV)
> +		out_rate = out_rate / 5;
> +

All the register you read here is set in mtk_hdmi_pll_set_rate(), so I
think you could determine the out_rate in mtk_hdmi_pll_set_rate().

Regards,
CK

> +	hdmi_phy->pll_rate = out_rate;
> +
> +	return hdmi_phy->pll_rate;
> +}
>  
>  static const struct clk_ops mtk_hdmi_phy_pll_ops = {
>  	.prepare = mtk_hdmi_pll_prepare,
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> index ed5916b27658..cb23c1e4692a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> @@ -285,6 +285,14 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  	return 0;
>  }
>  
> +static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
> +				       unsigned long parent_rate)
> +{
> +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> +
> +	return hdmi_phy->pll_rate;
> +}
> +
>  static const struct clk_ops mtk_hdmi_phy_pll_ops = {
>  	.prepare = mtk_hdmi_pll_prepare,
>  	.unprepare = mtk_hdmi_pll_unprepare,

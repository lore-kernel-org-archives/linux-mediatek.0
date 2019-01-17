From: Chunhui Dai <chunhui.dai@mediatek.com>
Subject: Re: [PATCH 2/9] drm/mediatek: move the setting of fixed divider
Date: Thu, 17 Jan 2019 16:49:38 +0800
Message-ID: <1547714978.4664.10.camel@mszsdaap41>
References: <1546585439-30455-1-git-send-email-chunhui.dai@mediatek.com>
         <1546585439-30455-3-git-send-email-chunhui.dai@mediatek.com>
         <1547108895.31582.1.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547108895.31582.1.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: --to=Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, wangyan.wang@mediatek.com, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Colin Ian King <colin.king@canonical.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, srv_heupstream@mediatek.com, bibby.hsieh@mediatek.com, jamesjj.liao@mediatek.com, jitao.shi@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2019-01-10 at 16:28 +0800, CK Hu wrote:
> Hi, Chunhui:
> 
> On Fri, 2019-01-04 at 15:03 +0800, chunhui dai wrote:
> > move the setting of fixed divider from enable/disable
> > to the function of setting rate.
> 
> Please describe more about _WHY_ of this patch. Does it fix any bug, or
> enhance some thing, or a new feature?

.recalc_rate would calculate the clock rate by get the setting of
hardward. the bit which modify in this patch, would affect the clock
divider. we need to do the modify of this bit before ".recal_rate".So,
we move it to the ops of clock. Otherwise, the .recalc_rate would get
wrong setting of divider, and return wrong rate.
we would describe more in the V2.

> 
> Regards,
> CK
> 
> > 
> > Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> > index b5ed6b7..68b124f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> > @@ -79,7 +79,6 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
> >  	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
> >  	usleep_range(80, 100);
> >  	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
> > -	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
> >  	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
> >  	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
> >  	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
> > @@ -94,7 +93,6 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
> >  	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
> >  	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
> >  	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
> > -	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
> >  	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
> >  	usleep_range(80, 100);
> >  	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
> > @@ -123,6 +121,7 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> >  
> >  	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_PREDIV_MASK);
> >  	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
> > +	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
> >  	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0x1 << RG_HTPLL_IC),
> >  			  RG_HTPLL_IC_MASK);
> >  	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0x1 << RG_HTPLL_IR),
> > @@ -223,7 +222,6 @@ static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
> >  	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
> >  	usleep_range(80, 100);
> >  	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
> > -	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
> >  	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
> >  	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
> >  	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
> > @@ -235,7 +233,6 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
> >  	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
> >  	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
> >  	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
> > -	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
> >  	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
> >  	usleep_range(80, 100);
> >  	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
> 
> 

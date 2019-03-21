From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH V6 8/8] drm/mediatek: fix the rate of parent for hdmi
 phy in MT2701
Date: Thu, 21 Mar 2019 13:32:57 +0800
Message-ID: <1553146377.18216.30.camel@mtksdaap41>
References: <20190225020912.29120-1-wangyan.wang@mediatek.com>
 <20190225020912.29120-9-wangyan.wang@mediatek.com>
 <1551867194.1001.8.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551867194.1001.8.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: wangyan wang <wangyan.wang@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, chunhui dai <chunhui.dai@mediatek.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Colin Ian King <colin.king@canonical.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Wangyan:

On Wed, 2019-03-06 at 18:13 +0800, CK Hu wrote:
> Hi, Wangyan:
> 
> On Mon, 2019-02-25 at 10:09 +0800, wangyan wang wrote:
> > From: chunhui dai <chunhui.dai@mediatek.com>
> > 
> > We should not change the rate of parent for hdmi phy when
> > doing round_rate for this clock. The parent clock of hdmi
> > phy must be the same as it. We change it when doing set_rate
> > only.
> > 
> > Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> > Signed-off-by: wangyan wang <wangyan.wang@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_hdmi_phy.c        | 14 --------------
> >  drivers/gpu/drm/mediatek/mtk_hdmi_phy.h        |  3 ---
> >  drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 11 +++++++++++
> >  drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c | 14 ++++++++++++++
> >  4 files changed, 25 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> > index 370309d684ec..ca8bc1489f37 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> > @@ -15,20 +15,6 @@ static const struct phy_ops mtk_hdmi_phy_dev_ops = {
> >  	.owner = THIS_MODULE,
> >  };
> >  
> > -long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > -			     unsigned long *parent_rate)
> > -{
> > -	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> > -
> > -	hdmi_phy->pll_rate = rate;
> > -	if (rate <= 74250000)
> > -		*parent_rate = rate;
> > -	else
> > -		*parent_rate = rate / 2;
> > -
> > -	return rate;
> > -}
> > -
> >  u32 mtk_hdmi_phy_read(struct mtk_hdmi_phy *hdmi_phy, u32 offset)
> >  {
> >  	return readl(hdmi_phy->regs + offset);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> > index 446e2acd1926..c6061ad15ff0 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> > @@ -50,9 +50,6 @@ void mtk_hdmi_phy_set_bits(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
> >  void mtk_hdmi_phy_mask(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
> >  		       u32 val, u32 mask);
> >  struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw);
> > -long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > -			     unsigned long *parent_rate);
> > -
> >  extern struct platform_driver mtk_hdmi_phy_driver;
> >  extern struct mtk_hdmi_phy_conf mtk_hdmi_phy_8173_conf;
> >  extern struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf;
> > diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> > index 88dd9e812ca0..33893a180c2e 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> > @@ -152,6 +152,17 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> >  			  RG_HDMITX_DRV_IBIAS_MASK);
> >  	return 0;
> >  }
> > +
> > +static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > +			     unsigned long *parent_rate)
> > +{
> > +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> > +
> > +	hdmi_phy->pll_rate = rate;
> 
> I think you don't need to save the rate into pll_rate here, pll_rate
> would be set in set_rate() or recalc_rate().

As offline discuss, you mention that this function just need to return
current rate. I think you could just remove this line
'hdmi_phy->pll_rate = rate;' and return rate only. You don't need to
assign hdmi_phy->pll_rate here because it would be set later in
set_rate().

Regards,
CK

> 
> Regards,
> CK
> 
> > +
> > +	return rate;
> > +}
> > +
> >  static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
> >  				       unsigned long parent_rate)
> >  {
> > diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> > index 63dde42521b8..3a339f516613 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> > @@ -285,6 +285,20 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> >  	return 0;
> >  }
> >  
> > +static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > +			     unsigned long *parent_rate)
> > +{
> > +	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> > +
> > +	hdmi_phy->pll_rate = rate;
> > +	if (rate <= 74250000)
> > +		*parent_rate = rate;
> > +	else
> > +		*parent_rate = rate / 2;
> > +
> > +	return rate;
> > +}
> > +
> >  static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
> >  				       unsigned long parent_rate)
> >  {
> 

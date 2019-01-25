From: mtk14994 <wangyan.wang@mediatek.com>
Subject: Re: [PATCH V2,4/8] drm/mediatek: fix the rate and divder of hdmi
 phy for MT2701
Date: Fri, 25 Jan 2019 10:28:35 +0800
Message-ID: <1548383315.19561.4.camel@mszsdaap41>
References: <20190118125928.3279-1-wangyan.wang@mediatek.com>
         <20190118125928.3279-5-wangyan.wang@mediatek.com>
         <1548310639.4220.3.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548310639.4220.3.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, chunhui dai <chunhui.dai@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Colin Ian King <colin.king@canonical.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, jitao.shi@mediatek.com, bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Dear CK,

      OK,I will modify according your comments in V3.

Best Regards
Wangyan Wang


On Thu, 2019-01-24 at 14:17 +0800, CK Hu wrote:
> On Fri, 2019-01-18 at 20:59 +0800, Wangyan Wang wrote:
> > From: chunhui dai <chunhui.dai@mediatek.com>
> 
> Describe something here.
> 
> > 
> > Fixes: 0fc721b2968e ("drm/mediatek: add hdmi driver for MT2701 and MT7623")
> > Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> 
> Any one who pass a patch should sign off it.
> 
> Regards,
> CK
> 
> > ---
> >  drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> > index 43bc058d5528..88dd9e812ca0 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> > @@ -114,8 +114,8 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> >  
> >  	if (rate <= 64000000)
> >  		pos_div = 3;
> > -	else if (rate <= 12800000)
> > -		pos_div = 1;
> > +	else if (rate <= 128000000)
> > +		pos_div = 2;
> >  	else
> >  		pos_div = 1;
> >  
> 
> 

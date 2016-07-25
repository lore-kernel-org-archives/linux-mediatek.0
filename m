From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: Re: [PATCH 3/4] drm/mediatek: fix the wrong pixel clock when
 resolution is 4K
Date: Mon, 25 Jul 2016 14:25:37 +0800
Message-ID: <1469427937.26205.19.camel@mtksdaap41>
References: <1468987385-37353-1-git-send-email-bibby.hsieh@mediatek.com>
	 <1468987385-37353-4-git-send-email-bibby.hsieh@mediatek.com>
	 <1469007718.5809.32.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469007718.5809.32.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, CK Hu <ck.hu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Junzhi Zhao <junzhi.zhao@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi, Philipp,

Thanks for your comment.

On Wed, 2016-07-20 at 11:41 +0200, Philipp Zabel wrote:
> Am Mittwoch, den 20.07.2016, 12:03 +0800 schrieb Bibby Hsieh:
> > From: Junzhi Zhao <junzhi.zhao@mediatek.com>
> > 
> > Pixel clock should be 297MHz when resolution is 4K.
> > 
> > Signed-off-by: Junzhi Zhao <junzhi.zhao@mediatek.com>
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c |  184 +++++++++++++++++++++++++-----------
> >  1 file changed, 131 insertions(+), 53 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index d05ca79..c0f04d2 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -60,14 +60,35 @@ enum mtk_dpi_out_color_format {
> >  	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
> >  };
> >  
> > +enum mtk_dpi_clk_id {
> > +	MTK_DPI_CLK_DPI_ENGINE,
> > +	MTK_DPI_CLK_DPI_PIXEL,
> > +	MTK_DPI_CLK_TVD_PLL,
> > +	MTK_DPI_CLK_TVDPLL_MUX,
> > +	MTK_DPI_CLK_TVDPLL_D2,
> > +	MTK_DPI_CLK_TVDPLL_D4,
> > +	MTK_DPI_CLK_TVDPLL_D8,
> > +	MTK_DPI_CLK_TVDPLL_D16,
> > +	MTK_DPI_CLK_COUNT,
> > +};
> 
> I think this is going in the wrong direction. If the pixel clock output
> isn't correct after a clk_set_rate(dpi->pixel_clk, rate), the clock
> drivers should be fixed, not worked around in the dpi driver.
> 
> The TVDPLL_* mux and dividers are not direct inputs to the DPI module:
> 
>    tvdpll ("pll")
>      |               ..|\
>      v               ..| | mm_sel ----> mm_dpi_engine ("engine")
>    tvdpll_594m(1/3)  ..|/
>      |
>      |`-> tvdpll_d2 -->|\
>      |`-> tvdpll_d4 -->| | dpi0_sel --> mm_dpi_pixel ("pixel")
>      |`-> tvdpll_d8 -->| |
>      `--> tvdpll_d16 ->|/
> 
> Currently the code first sets the "pll" to the desired multiple of the
> pixel clock manually (*3*4, *3*8) and than calls clk_set_rate on the
> "pixel" clock which gets propagated by the clock framework up to
> dpi0_sel. Since dpi0_sel doesn't have the CLK_SET_RATE_PARENT flag set,
> it should just choose the tvdpll_d* input divider. I'd like not to give
> the dpi driver direct access to all the intermediate clocks.
> 
Ok, I will make some modifications according to your comment.

> regards
> Philipp

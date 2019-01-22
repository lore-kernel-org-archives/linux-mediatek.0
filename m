From: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH 9/9] drm/mediatek: add dpi dual edge support
Date: Tue, 22 Jan 2019 14:41:10 +0800
Message-ID: <1548139270.1697.1.camel@mszsdaap41>
References: <1546585439-30455-1-git-send-email-chunhui.dai@mediatek.com>
         <1546585439-30455-10-git-send-email-chunhui.dai@mediatek.com>
         <6021c8950c3146bb941ed1355391106d@mtkmbs01n1.mediatek.inc>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6021c8950c3146bb941ed1355391106d@mtkmbs01n1.mediatek.inc>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>
Cc: Chunhui Dai =?UTF-8?Q?=28=E6=88=B4=E6=98=A5=E6=99=96=29?= <Chunhui.Dai@mediatek.com>, --to=Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Sean Wang <Sean.Wang@mediatek.com>, Ryder Lee =?UTF-8?Q?=28=E6=9D=8E=E5=BA=9A=E8=AB=BA=29?= <Ryder.Lee@mediatek.com>, Colin Ian King <colin.king@canonical.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, dri-devel@lists.freedesktop.org
List-Id: linux-mediatek@lists.infradead.org

Hi CK,

Ok, I'll send it again in an independent patch.

Best Regards
Jitao

On Wed, 2019-01-16 at 14:52 +0800, CK Hu (胡俊光) wrote:
> Hi, Chunhui:
> 
> > -----Original Message-----
> > From: chunhui dai [mailto:chunhui.dai@mediatek.com]
> > Sent: Friday, January 04, 2019 3:04 PM
> > To: --to=Michael Turquette; Stephen Boyd; CK Hu (胡俊光)
> > Cc: Matthias Brugger; Philipp Zabel; David Airlie; Chunhui Dai (戴春晖); Sean
> > Wang; Ryder Lee (李庚諺); Colin Ian King; linux-clk@vger.kernel.org;
> > linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-mediatek@lists.infradead.org; dri-devel@lists.freedesktop.org;
> > srv_heupstream; Bibby Hsieh (謝濟遠); JamesJJ Liao (廖建智); Jitao Shi (石记
> > 涛)
> > Subject: [PATCH 9/9] drm/mediatek: add dpi dual edge support
> > 
> > DPI sample on rising and falling edge. It can reduce half data io.
> 
> This patch looks like a patch for MT8183. For MT8173 and MT2701, dual_edge is false.
> For now, we have not support MT8183 yet.
> So you could just set dual_edge to false and remove MT8183 part in this patch.
> You could send the MT8183 part in an independent patch, not in a series of MT2701.
> 
> Regards,
> CK
> 
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 30
> > ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 4a2f4a6..acb4f47 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -117,6 +117,7 @@ struct mtk_dpi_conf {
> >  	unsigned int (*cal_factor)(int clock);
> >  	u32 reg_h_fre_con;
> >  	bool edge_sel_en;
> > +	bool dual_edge;
> >  };
> > 
> >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
> > @@ -353,6 +354,15 @@ static void mtk_dpi_config_disable_edge(struct
> > mtk_dpi *dpi)
> >  		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);  }
> > 
> > +static void mtk_dpi_config_dual_edge(struct mtk_dpi *dpi) {
> > +	if (dpi->conf->dual_edge) {
> > +		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN |
> > +				DDR_4PHASE, DDR_EN | DDR_4PHASE);
> > +		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, EDGE_SEL, EDGE_SEL);
> > +	}
> > +}
> > +
> >  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> >  					enum mtk_dpi_out_color_format format)  { @@
> > -509,6 +519,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> >  	mtk_dpi_config_color_format(dpi, dpi->color_format);
> >  	mtk_dpi_config_2n_h_fre(dpi);
> >  	mtk_dpi_config_disable_edge(dpi);
> > +	mtk_dpi_config_dual_edge(dpi);
> >  	mtk_dpi_sw_reset(dpi, false);
> > 
> >  	return 0;
> > @@ -669,6 +680,16 @@ static unsigned int mt2701_calculate_factor(int
> > clock)
> >  		return 1;
> >  }
> > 
> > +static unsigned int mt8183_calculate_factor(int clock) {
> > +	if (clock <= 27000)
> > +		return 8;
> > +	else if (clock <= 167000)
> > +		return 4;
> > +	else
> > +		return 2;
> > +}
> > +
> >  static const struct mtk_dpi_conf mt8173_conf = {
> >  	.cal_factor = mt8173_calculate_factor,
> >  	.reg_h_fre_con = 0xe0,
> > @@ -680,6 +701,12 @@ static unsigned int mt2701_calculate_factor(int
> > clock)
> >  	.edge_sel_en = true,
> >  };
> > 
> > +static const struct mtk_dpi_conf mt8183_conf = {
> > +	.cal_factor = mt8183_calculate_factor,
> > +	.reg_h_fre_con = 0xe0,
> > +	.dual_edge = true,
> > +};
> > +
> >  static int mtk_dpi_probe(struct platform_device *pdev)  {
> >  	struct device *dev = &pdev->dev;
> > @@ -775,6 +802,9 @@ static int mtk_dpi_remove(struct platform_device
> > *pdev)
> >  	{ .compatible = "mediatek,mt8173-dpi",
> >  	  .data = &mt8173_conf,
> >  	},
> > +	{ .compatible = "mediatek,mt8183-dpi",
> > +	  .data = &mt8183_conf,
> > +	},
> >  	{ },
> >  };
> > 
> > --
> > 1.9.1
> 

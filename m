From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 9/9] drm/mediatek: add dpi dual edge support
Date: Wed, 9 Jan 2019 17:58:44 +0100
Message-ID: <ae8eeb33-43cd-f4b8-a564-95eeecea7d31@gmail.com>
References: <1546585439-30455-1-git-send-email-chunhui.dai@mediatek.com>
 <1546585439-30455-10-git-send-email-chunhui.dai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546585439-30455-10-git-send-email-chunhui.dai@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: chunhui dai <chunhui.dai@mediatek.com>, --to=Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Colin Ian King <colin.king@canonical.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, srv_heupstream@mediatek.com, bibby.hsieh@mediatek.com, jamesjj.liao@mediatek.com, jitao.shi@mediatek.com
List-Id: linux-mediatek@lists.infradead.org



On 04/01/2019 08:03, chunhui dai wrote:
> DPI sample on rising and falling edge. It can reduce half data io.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 4a2f4a6..acb4f47 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -117,6 +117,7 @@ struct mtk_dpi_conf {
>  	unsigned int (*cal_factor)(int clock);
>  	u32 reg_h_fre_con;
>  	bool edge_sel_en;
> +	bool dual_edge;
>  };
>  
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
> @@ -353,6 +354,15 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
>  		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
>  }
>  
> +static void mtk_dpi_config_dual_edge(struct mtk_dpi *dpi)

I think it is clearer if you rename the function to something like:
mtk_dpi_enable_dual_edge and call it in mtk_dpi_set_display_mode if
dpi->conf->dual_edge is true.

Regards,
Matthias

> +{
> +	if (dpi->conf->dual_edge) {
> +		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN |
> +				DDR_4PHASE, DDR_EN | DDR_4PHASE);
> +		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, EDGE_SEL, EDGE_SEL);
> +	}
> +}
> +
>  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
>  					enum mtk_dpi_out_color_format format)
>  {
> @@ -509,6 +519,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  	mtk_dpi_config_color_format(dpi, dpi->color_format);
>  	mtk_dpi_config_2n_h_fre(dpi);
>  	mtk_dpi_config_disable_edge(dpi);
> +	mtk_dpi_config_dual_edge(dpi);
>  	mtk_dpi_sw_reset(dpi, false);
>  
>  	return 0;
> @@ -669,6 +680,16 @@ static unsigned int mt2701_calculate_factor(int clock)
>  		return 1;
>  }
>  
> +static unsigned int mt8183_calculate_factor(int clock)
> +{
> +	if (clock <= 27000)
> +		return 8;
> +	else if (clock <= 167000)
> +		return 4;
> +	else
> +		return 2;
> +}
> +
>  static const struct mtk_dpi_conf mt8173_conf = {
>  	.cal_factor = mt8173_calculate_factor,
>  	.reg_h_fre_con = 0xe0,
> @@ -680,6 +701,12 @@ static unsigned int mt2701_calculate_factor(int clock)
>  	.edge_sel_en = true,
>  };
>  
> +static const struct mtk_dpi_conf mt8183_conf = {
> +	.cal_factor = mt8183_calculate_factor,
> +	.reg_h_fre_con = 0xe0,
> +	.dual_edge = true,
> +};
> +
>  static int mtk_dpi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -775,6 +802,9 @@ static int mtk_dpi_remove(struct platform_device *pdev)
>  	{ .compatible = "mediatek,mt8173-dpi",
>  	  .data = &mt8173_conf,
>  	},
> +	{ .compatible = "mediatek,mt8183-dpi",
> +	  .data = &mt8183_conf,
> +	},
>  	{ },
>  };
>  
> 

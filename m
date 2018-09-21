From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v3 06/12] drm/mediatek: add dpi driver for mt2701 and
 mt7623
Date: Fri, 21 Sep 2018 17:50:04 +0800
Message-ID: <1537523404.20660.10.camel@mtksdaap41>
References: <20180921032822.30771-1-bibby.hsieh@mediatek.com>
         <20180921032822.30771-7-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921032822.30771-7-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, YT Shen <yt.shen@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, Mao Huang <littlecvr@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, chunhui dai <chunhui.dai@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi, Bibby:

On Fri, 2018-09-21 at 11:28 +0800, Bibby Hsieh wrote:
> From: chunhui dai <chunhui.dai@mediatek.com>
> 
> This patch adds dpi dirver suppot for both mt2701 and mt7623.
> And also support other (existing or future) chips that use
> the same binding and driver.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c     | 21 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 7a4868a0afec..a9d8231a0a9e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -688,11 +688,29 @@ static unsigned int mt8173_calculate_factor(int clock)
>  		return 3 << 1;
>  }
>  
> +static unsigned int mt2701_calculate_factor(int clock)
> +{
> +	if (clock <= 64000)
> +		return 16;
> +	else if (clock <= 128000)
> +		return 8;
> +	else if (clock <= 256000)
> +		return 4;
> +	else
> +		return 2;
> +}
> +
>  static const struct mtk_dpi_conf mt8173_conf = {
>  	.cal_factor = mt8173_calculate_factor,
>  	.reg_h_fre_con = 0xe0,
>  };
>  
> +static const struct mtk_dpi_conf mt2701_conf = {
> +	.cal_factor = mt2701_calculate_factor,
> +	.reg_h_fre_con = 0xb0,
> +	.edge_sel_en = true,
> +};
> +
>  static int mtk_dpi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -784,6 +802,9 @@ static int mtk_dpi_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id mtk_dpi_of_ids[] = {
> +	{ .compatible = "mediatek,mt2701-dpi",
> +	  .data = &mt2701_conf,
> +	},
>  	{ .compatible = "mediatek,mt8173-dpi",
>  	  .data = &mt8173_conf,
>  	},
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 39721119713b..d961112fa2f5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -424,6 +424,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DSI },
>  	{ .compatible = "mediatek,mt8173-dsi",
>  	  .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt2701-dpi",
> +	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt8173-dpi",
>  	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt2701-disp-mutex",

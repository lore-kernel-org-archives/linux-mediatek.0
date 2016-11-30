From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v10 13/13] drm/mediatek: add support for Mediatek SoC
 MT2701
Date: Wed, 30 Nov 2016 15:03:04 +0100
Message-ID: <1be9b66b-eff2-4232-fe17-5d1735999d0b@gmail.com>
References: <1480070076-6196-1-git-send-email-yt.shen@mediatek.com>
 <1480070076-6196-14-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480070076-6196-14-git-send-email-yt.shen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YT Shen <yt.shen@mediatek.com>, dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>, Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, Jie Qiu <jie.qiu@mediatek.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chris Wilson <chris@chris-wilson.co.uk>, shaoming chen <shaoming.chen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Dan Carpenter <dan.carpenter@oracle.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, yingjoe.chen@mediatek.com, emil.l.velikov
List-Id: linux-mediatek@lists.infradead.org



On 25/11/16 11:34, YT Shen wrote:

>  static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
> +	{ .compatible = "mediatek,mt2701-disp-rdma",
> +	  .data = &mt2701_rdma_driver_data},
>  	{ .compatible = "mediatek,mt8173-disp-rdma",
>  	  .data = &mt8173_rdma_driver_data},
>  	{},

[...]

>  static const struct of_device_id ddp_driver_dt_match[] = {
> +	{ .compatible = "mediatek,mt2701-disp-mutex", .data = mt2701_mutex_mod},
>  	{ .compatible = "mediatek,mt8173-disp-mutex", .data = mt8173_mutex_mod},
>  	{},
>  };

[...]

>
>  static const struct of_device_id mtk_disp_color_driver_dt_match[] = {
> +	{ .compatible = "mediatek,mt2701-disp-color",
> +	  .data = &mt2701_color_driver_data},
>  	{ .compatible = "mediatek,mt8173-disp-color",
>  	  .data = &mt8173_color_driver_data},
>  	{},

[...]

>  static const struct of_device_id mtk_drm_of_ids[] = {
> +	{ .compatible = "mediatek,mt2701-mmsys",
> +	  .data = &mt2701_mmsys_driver_data},
>  	{ .compatible = "mediatek,mt8173-mmsys",
>  	  .data = &mt8173_mmsys_driver_data},
>  	{ }
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 0569f2e..f63cc91 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1203,6 +1203,7 @@ static int mtk_dsi_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id mtk_dsi_of_match[] = {
> +	{ .compatible = "mediatek,mt2701-dsi" },
>  	{ .compatible = "mediatek,mt8173-dsi" },
>  	{ },
>  };

[...]

>
>  static const struct of_device_id mtk_mipi_tx_match[] = {
> +	{ .compatible = "mediatek,mt2701-mipi-tx",
> +	  .data = &mt2701_mipitx_data },
>  	{ .compatible = "mediatek,mt8173-mipi-tx",
>  	  .data = &mt8173_mipitx_data },
>  	{},

I'm not sure if I missed some, but you should update the binding 
description for newly added bindings.

Thanks a lot,
Matthias

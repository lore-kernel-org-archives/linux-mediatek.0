From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 5/5] drm/mtk: add panel orientation property
Date: Tue, 11 Jun 2019 09:42:17 +0800
Message-ID: <1560217337.15546.1.camel@mtksdaap41>
References: <20190611002256.186969-1-dbasehore@chromium.org>
         <20190611002256.186969-6-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611002256.186969-6-dbasehore@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Derek Basehore <dbasehore@chromium.org>
Cc: linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, thierry.reding@gmail.com, sam@ravnborg.org, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, p.zabel@pengutronix.de, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Derek:

On Mon, 2019-06-10 at 17:22 -0700, Derek Basehore wrote:
> This inits the panel orientation property for the mediatek dsi driver
> if the panel orientation (connector.display_info.panel_orientation) is
> not DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
> 

Looks good to me,

Acked-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 4a0b9150a7bb..08ffdc7526dd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -782,10 +782,18 @@ static int mtk_dsi_create_connector(struct drm_device *drm, struct mtk_dsi *dsi)
>  			DRM_ERROR("Failed to attach panel to drm\n");
>  			goto err_connector_cleanup;
>  		}
> +
> +		ret = drm_connector_init_panel_orientation_property(&dsi->conn);
> +		if (ret) {
> +			DRM_ERROR("Failed to init panel orientation\n");
> +			goto err_panel_detach;
> +		}
>  	}
>  
>  	return 0;
>  
> +err_panel_detach:
> +	drm_panel_detach(dsi->panel);
>  err_connector_cleanup:
>  	drm_connector_cleanup(&dsi->conn);
>  	return ret;

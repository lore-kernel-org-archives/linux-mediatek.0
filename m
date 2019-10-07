From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v8 4/4] drm/mtk: add panel orientation property
Date: Mon, 7 Oct 2019 12:48:02 -0400
Message-ID: <20191007164802.GD126146@art_vandelay>
References: <20190925225833.7310-1-dbasehore@chromium.org>
 <20190925225833.7310-5-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190925225833.7310-5-dbasehore@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Derek Basehore <dbasehore@chromium.org>
Cc: linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Sep 25, 2019 at 03:58:33PM -0700, Derek Basehore wrote:
> This inits the panel orientation property for the mediatek dsi driver
> if the panel orientation (connector.display_info.panel_orientation) is
> not DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
> 
> Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 224afb666881..2936932344eb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -792,10 +792,18 @@ static int mtk_dsi_create_connector(struct drm_device *drm, struct mtk_dsi *dsi)
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
> -- 
> 2.23.0.351.gc4317032e6-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS

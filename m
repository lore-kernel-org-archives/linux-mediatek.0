From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 3/4] drm: mediatek: call drm_atomic_helper_shutdown()
 when unbinding driver
Date: Thu, 30 May 2019 10:22:45 +0800
Message-ID: <1559182965.6868.2.camel@mtksdaap41>
References: <20190529102555.251579-1-hsinyi@chromium.org>
         <20190529102555.251579-4-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529102555.251579-4-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Hsin-Yi:

On Wed, 2019-05-29 at 18:25 +0800, Hsin-Yi Wang wrote:
> shutdown all CRTC when unbinding drm driver.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index e7362bdafa82..8718d123ccaa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -311,6 +311,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>  static void mtk_drm_kms_deinit(struct drm_device *drm)
>  {
>  	drm_kms_helper_poll_fini(drm);
> +	drm_atomic_helper_shutdown(drm);
>  
>  	component_unbind_all(drm->dev, drm);
>  	drm_mode_config_cleanup(drm);

From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 4/4] drm: mediatek: clear num_pipes when unbind driver
Date: Thu, 30 May 2019 10:28:54 +0800
Message-ID: <1559183334.6868.3.camel@mtksdaap41>
References: <20190529102555.251579-1-hsinyi@chromium.org>
         <20190529102555.251579-5-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529102555.251579-5-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Hsin-Yi:

On Wed, 2019-05-29 at 18:25 +0800, Hsin-Yi Wang wrote:
> num_pipes is used for mutex created in mtk_drm_crtc_create(). If we
> don't clear num_pipes count, when rebinding driver, the count will
> be accumulated. From mtk_disp_mutex_get(), there can only be at most
> 10 mutex id. Clear this number so it starts from 0 in every rebind.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 8718d123ccaa..bbfe3a464aea 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -400,6 +400,7 @@ static void mtk_drm_unbind(struct device *dev)
>  	drm_dev_unregister(private->drm);
>  	mtk_drm_kms_deinit(private->drm);
>  	drm_dev_put(private->drm);
> +	private->num_pipes = 0;
>  	private->drm = NULL;
>  }
>  

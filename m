From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2] gpu/drm: mediatek: call mtk_dsi_stop() after
 mtk_drm_crtc_atomic_disable()
Date: Thu, 21 Mar 2019 09:28:42 +0800
Message-ID: <1553131722.18216.10.camel@mtksdaap41>
References: <20190320071825.20268-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190320071825.20268-1-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi, Hsin-yi:

On Wed, 2019-03-20 at 15:18 +0800, Hsin-Yi Wang wrote:
> mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(), which needs
> ovl irq for drm_crtc_wait_one_vblank(), since after mtk_dsi_stop() is called,
> ovl irq will be disabled. If drm_crtc_wait_one_vblank() is called after last
> irq, it will timeout with this message: "vblank wait timed out on crtc 0". This
> happens sometimes when turning off the screen.
> 
> In drm_atomic_helper.c#disable_outputs(),
> the calling sequence when turning off the screen is:
> 
> 1. mtk_dsi_encoder_disable()
>      --> mtk_output_dsi_disable()
>        --> mtk_dsi_stop();  // sometimes make vblank timeout in atomic_disable
>        --> mtk_dsi_poweroff();
> 2. mtk_drm_crtc_atomic_disable()
>      --> drm_crtc_wait_one_vblank();
>      ...
>        --> mtk_dsi_ddp_stop()
>          --> mtk_dsi_poweroff();
> 
> mtk_dsi_poweroff() has reference count design, change to make mtk_dsi_stop()
> called in mtk_dsi_poweroff() when refcount is 0.
> 
> Fixes: 0707632b5bac ("drm/mediatek: update DSI sub driver flow for sending commands to panel")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> change log:
> v1->v2:
>  * update commit message.
>  * call mtk_dsi_stop() in mtk_dsi_poweroff() when refcount is 0.
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index b00eb2d2e086..e152f37af57d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -630,6 +630,8 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>  	if (--dsi->refcount != 0)
>  		return;
>  
> +	mtk_dsi_stop(dsi);
> +
>  	if (!mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500)) {
>  		if (dsi->panel) {
>  			if (drm_panel_unprepare(dsi->panel)) {

I think you just move mtk_dsi_stop() into mtk_dsi_poweroff() would works
fine, but I would rather like calling mtk_dsi_start() and mtk_dsi_stop()
in a symmetric manner. That means you may also move below functions into
mtk_dsi_poweron():

mtk_dsi_set_mode(dsi);
mtk_dsi_clk_hs_mode(dsi, 1);
mtk_dsi_start(dsi);


> @@ -696,7 +698,6 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
>  		}
>  	}
>  
> -	mtk_dsi_stop(dsi);
>  	mtk_dsi_poweroff(dsi);
>  
>  	dsi->enabled = false;
> @@ -1178,6 +1179,8 @@ static int mtk_dsi_remove(struct platform_device *pdev)
>  	struct mtk_dsi *dsi = platform_get_drvdata(pdev);
>  
>  	mtk_output_dsi_disable(dsi);
> +	mtk_dsi_stop(dsi);
> +	mtk_dsi_poweroff(dsi);

I think mtk_output_dsi_disable() would call mtk_dsi_poweroff(), and
mtk_dsi_poweroff() would call mtk_dsi_stop(), so these two line are
redundant. And I think you should remove mtk_dsi_stop() in
mtk_output_dsi_disable(), why not in this patch?

Regards,
CK

>  	component_del(&pdev->dev, &mtk_dsi_component_ops);
>  
>  	return 0;

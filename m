From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: [PATCH 2/2] drm/mediatek: Add Mediatek framebuffer device
Date: Thu, 17 Jan 2019 15:14:12 +0100
Message-ID: <trinity-1adab8be-573a-4816-9e9f-feddf07bdcd3-1547734452313@3c-app-gmx-bs28>
References: <20190116013924.11345-1-ck.hu@mediatek.com>
 <20190116013924.11345-2-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116013924.11345-2-ck.hu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?Q?=22Noralf_Tr=EF=BF=BDnnes=22?= <noralf@tronnes.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, CK Hu <ck.hu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi,

this Patchset does not hang on Bananapi R2, but does not show anything on FB-Console...seems anything is missing

https://github.com/frank-w/BPI-R2-4.14/tree/4.20-fbdev

dmesg | grep 'fb\|framebuffer'
[    0.000000] Linux version 4.20.0-rc7-bpi-r2-fbdev (frank@frank-N56VZ) (gcc version 7.3.0 (Ubuntu/Linaro 7.3.0-27ubuntu1~18.04)) 9
[    0.000000] cma: Reserved 64 MiB at 0xfb800000
[    0.000000] Kernel command line: board=bpi-r2 console=earlyprintk console=tty1 fbcon=map:0 console=ttyS0,115200 root=/dev/mmcblk7
[    5.733185] [drm:drm_fb_helper_generic_probe] surface width(1280), height(1024) and bpp(32)
[    5.754452] [drm:drm_mode_addfb2] [FB:44]
[    5.792878] mediatek-drm 14000000.dispsys: fb0: DRM emulated frame buffer device
[    5.814067] [drm:drm_fb_helper_hotplug_event.part.11] 
[    6.203083] mediatek-drm 14000000.dispsys: [drm:drm_client_dev_hotplug] fbdev: ret=0
[   24.930347] mediatek-drm 14000000.dispsys: [drm:drm_client_dev_restore] fbdev: ret=0
[   25.196872] mediatek-drm 14000000.dispsys: [drm:drm_client_dev_restore] fbdev: ret=0
[   25.281184] [drm:drm_mode_addfb2] [FB:49]
[   27.947962] [drm:drm_mode_addfb2] [FB:49]

regards Frank


> Gesendet: Mittwoch, 16. Januar 2019 um 02:39 Uhr
> Von: "CK Hu" <ck.hu@mediatek.com>
> An: "Philipp Zabel" <p.zabel@pengutronix.de>, "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Noralf Tr�nnes" <noralf@tronnes.org>, "Frank Wunderlich" <frank-w@public-files.de>
> Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, "CK Hu" <ck.hu@mediatek.com>
> Betreff: [PATCH 2/2] drm/mediatek: Add Mediatek framebuffer device
>
> For Mediatek drm driver, use fbdev emulation to create a framebuffer
> device.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 6ec4ca070382..5fcc0e294696 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -16,6 +16,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_of.h>
> @@ -378,6 +379,10 @@ static int mtk_drm_bind(struct device *dev)
>  	if (ret < 0)
>  		goto err_deinit;
>  
> +	ret = drm_fbdev_generic_setup(drm, 32);
> +	if (ret)
> +		DRM_ERROR("Failed to initialize fbdev: %d\n", ret);
> +
>  	return 0;
>  
>  err_deinit:
> -- 
> 2.18.1
> 
>

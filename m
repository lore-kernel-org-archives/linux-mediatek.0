From: Sean Paul <seanpaul@google.com>
Subject: Re: [PATCH 1/2] drm/rockchip: add missing header dependencies
Date: Tue, 27 Sep 2016 12:34:04 -0400
Message-ID: <CAOw6vbJLhUHdditnN6W2K=NQ71b_+oHyDF6GfxOEvw9zPHrn3A@mail.gmail.com>
References: <1474789109-22010-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474789109-22010-1-git-send-email-baoyou.xie@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: CK HU <ck.hu@mediatek.com>, p.zabel@pengutronix.de, Dave Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?B?5aea5pm65oOF?= <mark.yao@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, dri-devel <dri-devel@lists.freedesktop.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Baoyou Xie <xie.baoyou@zte.com.cn>, han.fei@zte.com.cn, tang.qiang007@zte.com.cn
List-Id: linux-mediatek@lists.infradead.org

On Sun, Sep 25, 2016 at 3:38 AM, Baoyou Xie <baoyou.xie@linaro.org> wrote:
> We get 2 warnings when building kernel with W=1:
> drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c:130:5: warning: no previous prototype for 'rockchip_drm_fbdev_init' [-Wmissing-prototypes]
> drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c:173:6: warning: no previous prototype for 'rockchip_drm_fbdev_fini' [-Wmissing-prototypes]
>
> In fact, these functions are declared
> in drivers/gpu/drm/rockchip/rockchip_drm_fbdev.h,
> so this patch adds missing header dependencies.
>
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>


Applied to -misc, thanks.

Sean

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
> index 207e01d..a16c69f 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
> @@ -20,6 +20,7 @@
>  #include "rockchip_drm_drv.h"
>  #include "rockchip_drm_gem.h"
>  #include "rockchip_drm_fb.h"
> +#include "rockchip_drm_fbdev.h"
>
>  #define PREFERRED_BPP          32
>  #define to_drm_private(x) \
> --
> 2.7.4
>

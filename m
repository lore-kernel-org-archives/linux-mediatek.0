From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm: mediatek: add Maintainers entry for Mediatek DRM
 drivers
Date: Fri, 15 Jul 2016 11:26:53 +0200
Message-ID: <1468574813.7213.4.camel@pengutronix.de>
References: <1468561924-45582-1-git-send-email-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468561924-45582-1-git-send-email-ck.hu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Am Freitag, den 15.07.2016, 13:52 +0800 schrieb CK Hu:
> Add CK Hu and Philipp Zabel as maintainers for Mediatek DRM drivers.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

> ---
>  MAINTAINERS |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7304d2e..2a04cdc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3973,6 +3973,14 @@ S:	Orphan / Obsolete
>  F:	drivers/gpu/drm/i810/
>  F:	include/uapi/drm/i810_drm.h
>  
> +DRM DRIVERS FOR MEDIATEK
> +M:	CK Hu <ck.hu@mediatek.com>
> +M:	Philipp Zabel <p.zabel@pengutronix.de>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +F:	drivers/gpu/drm/mediatek/
> +F:	Documentation/devicetree/bindings/display/mediatek/
> +
>  DRM DRIVER FOR MSM ADRENO GPU
>  M:	Rob Clark <robdclark@gmail.com>
>  L:	linux-arm-msm@vger.kernel.org

regards
Philipp

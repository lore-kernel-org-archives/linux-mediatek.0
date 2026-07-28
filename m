Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D04C54F4D
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0Iz8TThM6LbJccIvna4PYCj+25iDZgE4Lkbbj4Ba1Y=; b=rqrq/+8UiY/XxHXvnRiDAKSms0
	jXcudT3dal/6NXqVpkyWe6zutAWhZUqZ+dDGg5bRQO0BxTRebd3wCnQuALE+f8zd6fMY5aVJ9/LXC
	kd7tlkss8LcTSzQrH7PN3nDNIgI5kZZL/lq977z3jas7obIK2JVX+A7cUmdo8JayFlWAQFH6dKgJN
	P4DX1sw5w0RnR1r/tMi92azJFFJ2u91v9V+7Qcx754/xl04EXAln4nlqWCWGRL119r3Ps+ZLi8izT
	nBpKwfO19zAWME3D9wNdrodHoYiZNTug1ji2wUm4o15MLOquiVFWgmqNOVCfAwzSGqFkMLqI9URfC
	6UeY02hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokaH-00000005ouV-1Dmx;
	Tue, 28 Jul 2026 16:23:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokaE-00000005otY-3ZDr
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 16:23:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98319175D
	for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 09:23:05 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E3E73F763
	for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 09:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785255789; bh=MuoYv/trvB+apkFilFU7ge8EmIYL0Cz7Mp4H5bYBY04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cGU/Wk3ZnH3c7owZWTV052yqd9zyhMAC6fYfpLKGgPGKyognDSo9cCj+3KdFRbWYU
	 Ol/VxMawYLPWQj16JhPZQdaS6V651Bp2HifPtszr04EUQChIQWU2DZ8doFLu1eZZ6/
	 CZwRV0CKBAWpQVG44esYQehYsgvS4ancS3hvKOyQ=
Date: Tue, 28 Jul 2026 17:21:58 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Michal Simek <michal.simek@amd.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
	Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 12/15] drm/arm/komeda: remove dependency on DRM simple
 helpers
Message-ID: <amjXJrbgka00CQX2@e142607>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-12-a78c509e3062@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260719-drm_simple_encoder_init-v1-12-a78c509e3062@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_092310_975755_4851F4E3 
X-CRM114-Status: GOOD (  18.00  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jul 19, 2026 at 01:35:43AM +0200, Diogo Silva wrote:
> The simple KMS helpers are deprecated because they only add an
> intermediate layer between drivers and atomic modesetting.
> 
> Open-code drm_simple_encoder_init() by calling drm_encoder_init()
> directly and providing driver-local drm_encoder_funcs.
> 
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index e8cb782a6f8e..719568d9f7c2 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -11,9 +11,9 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_encoder.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
> -#include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_bridge.h>
>  
>  #include "komeda_dev.h"
> @@ -635,6 +635,10 @@ static int komeda_attach_bridge(struct device *dev,
>  	return err;
>  }
>  
> +static const struct drm_encoder_funcs komeda_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
>  static int komeda_crtc_add(struct komeda_kms_dev *kms,
>  			   struct komeda_crtc *kcrtc)
>  {
> @@ -658,7 +662,8 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
>  	 * bridge
>  	 */
>  	kcrtc->encoder.possible_crtcs = drm_crtc_mask(crtc);
> -	err = drm_simple_encoder_init(base, encoder, DRM_MODE_ENCODER_TMDS);
> +	err = drm_encoder_init(base, encoder, &komeda_encoder_funcs,
> +			       DRM_MODE_ENCODER_TMDS, NULL);
>  	if (err)
>  		return err;
>  
> 
> -- 
> 2.54.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯


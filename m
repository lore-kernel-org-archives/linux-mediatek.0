Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D10CC54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th4qUGAQmONQpV+kI8SbHIRMMuBLYIJeDLPEGp9xy/A=; b=VGLg1UQrObo777V/op6LKD38eX
	iPW1mDO+kEiqr45k/CvUvx9iud6mlw/75hE7H2p7AZkiYSlyfjcZ95iJBHTdAjNI6HaABHwba/NhD
	JVwysK/K3CNEajJJlZAwtK78gsbIrDSZ6MoSFJmgG+bO/PGTxZlZ5qjPQ82jc3kHo+LjE4aavIEPS
	1e909Ex4naLChsHPkhtjJ8r81FrvAr9boO6tLEk4HPr9eD+B5XBFdyQUxB+LaSeYjQahd/5UsDqRB
	9tV3hw8eI7M20fdZp6IHmTK5eYCIFgaqky/wr1CUh+7t6fu2AATJQigd9md+Ie5D2chRapBQ2ja+P
	OfyCtgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIwv-00Cbk1-No; Mon, 19 Sep 2022 15:44:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIlp-00CVGm-DR; Mon, 19 Sep 2022 15:33:23 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80399499;
	Mon, 19 Sep 2022 17:33:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1663601595;
	bh=MbDlzyC148qNXvwyKHqdaCM7o7Bh+YX+upobqm/8Vtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uvmNNUem8DEhgEZZMwOGF4CE66lVo7zzG+emU4x9XMhA3t4THr0xm+fu2i8kK+Ibx
	 fkoDH3dtTCUulK9hgudCuxkAgJcbOsZvuM/vuUo3aO95npzsZH46pbrIXVcJpCYTO7
	 4Z1FykxUekRM2TyOcHhJ5EpslmhGBgvx/mvZfC+g=
Date: Mon, 19 Sep 2022 18:33:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Benson Leung <bleung@chromium.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	chrome-platform@lists.linux.dev,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Philip Chen <philipchen@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v1 10/12] drm/omapdrm: Use drm_bridge_funcs.atomic_check
Message-ID: <YyiLrhs4J4khMqzn@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717175801.78668-3-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_083317_956031_9B5D2426 
X-CRM114-Status: GOOD (  20.21  )
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

Hi Sam,

Thank you for the patch.

On Sun, Jul 17, 2022 at 07:57:59PM +0200, Sam Ravnborg wrote:
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
> 
> drm_bridge_funcs.atomic_check() requires the atomic state operations,
> update these to the default implementations.
> Likewise update enable/disable to their atomic variants.
> 
> With these changes omapdrm now implement the full bridge atomic API.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Cai Huoqing <cai.huoqing@linux.dev>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dpi.c  | 31 ++++++++++++++++++------------
>  drivers/gpu/drm/omapdrm/dss/sdi.c  | 31 ++++++++++++++++++------------
>  drivers/gpu/drm/omapdrm/dss/venc.c | 28 +++++++++++++++++----------
>  3 files changed, 56 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
> index 030f997eccd0..0a0b49750eca 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dpi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
> @@ -21,6 +21,7 @@
>  #include <linux/string.h>
>  #include <linux/sys_soc.h>
>  
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  
>  #include "dss.h"
> @@ -454,21 +455,22 @@ dpi_bridge_mode_valid(struct drm_bridge *bridge,
>  	return MODE_OK;
>  }
>  
> -static bool dpi_bridge_mode_fixup(struct drm_bridge *bridge,
> -				   const struct drm_display_mode *mode,
> -				   struct drm_display_mode *adjusted_mode)
> +static int dpi_bridge_atomic_check(struct drm_bridge *bridge,
> +				   struct drm_bridge_state *bridge_state,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state)
>  {
>  	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
> -	unsigned long clock = mode->clock * 1000;
> +	unsigned long clock = crtc_state->mode.clock * 1000;
>  	int ret;
>  
>  	ret = dpi_clock_update(dpi, &clock);
>  	if (ret < 0)
> -		return false;
> +		return ret;
>  
> -	adjusted_mode->clock = clock / 1000;
> +	crtc_state->adjusted_mode.clock = clock / 1000;
>  
> -	return true;
> +	return 0;
>  }
>  
>  static void dpi_bridge_mode_set(struct drm_bridge *bridge,
> @@ -480,7 +482,8 @@ static void dpi_bridge_mode_set(struct drm_bridge *bridge,
>  	dpi->pixelclock = adjusted_mode->clock * 1000;
>  }
>  
> -static void dpi_bridge_enable(struct drm_bridge *bridge)
> +static void dpi_bridge_atomic_enable(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *old_bridge_state)
>  {
>  	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
>  	int r;
> @@ -531,7 +534,8 @@ static void dpi_bridge_enable(struct drm_bridge *bridge)
>  		regulator_disable(dpi->vdds_dsi_reg);
>  }
>  
> -static void dpi_bridge_disable(struct drm_bridge *bridge)
> +static void dpi_bridge_atomic_disable(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *old_bridge_state)
>  {
>  	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
>  
> @@ -552,10 +556,13 @@ static void dpi_bridge_disable(struct drm_bridge *bridge)
>  static const struct drm_bridge_funcs dpi_bridge_funcs = {
>  	.attach = dpi_bridge_attach,
>  	.mode_valid = dpi_bridge_mode_valid,
> -	.mode_fixup = dpi_bridge_mode_fixup,
> +	.atomic_check = dpi_bridge_atomic_check,
>  	.mode_set = dpi_bridge_mode_set,
> -	.enable = dpi_bridge_enable,
> -	.disable = dpi_bridge_disable,
> +	.atomic_enable = dpi_bridge_atomic_enable,
> +	.atomic_disable = dpi_bridge_atomic_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>  
>  static void dpi_bridge_init(struct dpi_data *dpi)
> diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
> index 91eaae3b9481..73b728722c2f 100644
> --- a/drivers/gpu/drm/omapdrm/dss/sdi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
> @@ -15,6 +15,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/string.h>
>  
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  
>  #include "dss.h"
> @@ -159,12 +160,13 @@ sdi_bridge_mode_valid(struct drm_bridge *bridge,
>  	return MODE_OK;
>  }
>  
> -static bool sdi_bridge_mode_fixup(struct drm_bridge *bridge,
> -				  const struct drm_display_mode *mode,
> -				  struct drm_display_mode *adjusted_mode)
> +static int sdi_bridge_atomic_check(struct drm_bridge *bridge,
> +				   struct drm_bridge_state *bridge_state,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state)
>  {
>  	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
> -	unsigned long pixelclock = mode->clock * 1000;
> +	unsigned long pixelclock = crtc_state->mode.clock * 1000;
>  	struct dispc_clock_info dispc_cinfo;
>  	unsigned long fck;
>  	unsigned long pck;
> @@ -172,7 +174,7 @@ static bool sdi_bridge_mode_fixup(struct drm_bridge *bridge,
>  
>  	ret = sdi_calc_clock_div(sdi, pixelclock, &fck, &dispc_cinfo);
>  	if (ret < 0)
> -		return false;
> +		return ret;
>  
>  	pck = fck / dispc_cinfo.lck_div / dispc_cinfo.pck_div;
>  
> @@ -181,9 +183,9 @@ static bool sdi_bridge_mode_fixup(struct drm_bridge *bridge,
>  			"pixel clock adjusted from %lu Hz to %lu Hz\n",
>  			pixelclock, pck);
>  
> -	adjusted_mode->clock = pck / 1000;
> +	crtc_state->adjusted_mode.clock = pck / 1000;
>  
> -	return true;
> +	return 0;
>  }
>  
>  static void sdi_bridge_mode_set(struct drm_bridge *bridge,
> @@ -195,7 +197,8 @@ static void sdi_bridge_mode_set(struct drm_bridge *bridge,
>  	sdi->pixelclock = adjusted_mode->clock * 1000;
>  }
>  
> -static void sdi_bridge_enable(struct drm_bridge *bridge)
> +static void sdi_bridge_atomic_enable(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *old_bridge_state)
>  {
>  	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
>  	struct dispc_clock_info dispc_cinfo;
> @@ -258,7 +261,8 @@ static void sdi_bridge_enable(struct drm_bridge *bridge)
>  	regulator_disable(sdi->vdds_sdi_reg);
>  }
>  
> -static void sdi_bridge_disable(struct drm_bridge *bridge)
> +static void sdi_bridge_atomic_disable(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *old_bridge_state)
>  {
>  	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
>  
> @@ -274,10 +278,13 @@ static void sdi_bridge_disable(struct drm_bridge *bridge)
>  static const struct drm_bridge_funcs sdi_bridge_funcs = {
>  	.attach = sdi_bridge_attach,
>  	.mode_valid = sdi_bridge_mode_valid,
> -	.mode_fixup = sdi_bridge_mode_fixup,
> +	.atomic_check = sdi_bridge_atomic_check,
>  	.mode_set = sdi_bridge_mode_set,
> -	.enable = sdi_bridge_enable,
> -	.disable = sdi_bridge_disable,
> +	.atomic_enable = sdi_bridge_atomic_enable,
> +	.atomic_disable = sdi_bridge_atomic_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>  
>  static void sdi_bridge_init(struct sdi_device *sdi)
> diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
> index 4480b69ab5a7..994e6399d574 100644
> --- a/drivers/gpu/drm/omapdrm/dss/venc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/venc.c
> @@ -25,6 +25,7 @@
>  #include <linux/component.h>
>  #include <linux/sys_soc.h>
>  
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  
>  #include "omapdss.h"
> @@ -564,11 +565,13 @@ venc_bridge_mode_valid(struct drm_bridge *bridge,
>  	}
>  }
>  
> -static bool venc_bridge_mode_fixup(struct drm_bridge *bridge,
> -				   const struct drm_display_mode *mode,
> -				   struct drm_display_mode *adjusted_mode)
> +static int venc_bridge_atomic_check(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *bridge_state,
> +				    struct drm_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state)
>  {
>  	const struct drm_display_mode *venc_mode;
> +	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>  
>  	switch (venc_get_videomode(adjusted_mode)) {
>  	case VENC_MODE_PAL:
> @@ -580,14 +583,14 @@ static bool venc_bridge_mode_fixup(struct drm_bridge *bridge,
>  		break;
>  
>  	default:
> -		return false;
> +		return -EINVAL;
>  	}
>  
>  	drm_mode_copy(adjusted_mode, venc_mode);
>  	drm_mode_set_crtcinfo(adjusted_mode, CRTC_INTERLACE_HALVE_V);
>  	drm_mode_set_name(adjusted_mode);
>  
> -	return true;
> +	return 0;
>  }
>  
>  static void venc_bridge_mode_set(struct drm_bridge *bridge,
> @@ -613,14 +616,16 @@ static void venc_bridge_mode_set(struct drm_bridge *bridge,
>  	dispc_set_tv_pclk(venc->dss->dispc, 13500000);
>  }
>  
> -static void venc_bridge_enable(struct drm_bridge *bridge)
> +static void venc_bridge_atomic_enable(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *old_bridge_state)
>  {
>  	struct venc_device *venc = drm_bridge_to_venc(bridge);
>  
>  	venc_power_on(venc);
>  }
>  
> -static void venc_bridge_disable(struct drm_bridge *bridge)
> +static void venc_bridge_atomic_disable(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *old_bridge_state)
>  {
>  	struct venc_device *venc = drm_bridge_to_venc(bridge);
>  
> @@ -654,11 +659,14 @@ static int venc_bridge_get_modes(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs venc_bridge_funcs = {
>  	.attach = venc_bridge_attach,
>  	.mode_valid = venc_bridge_mode_valid,
> -	.mode_fixup = venc_bridge_mode_fixup,
> +	.atomic_check = venc_bridge_atomic_check,
>  	.mode_set = venc_bridge_mode_set,
> -	.enable = venc_bridge_enable,
> -	.disable = venc_bridge_disable,
> +	.atomic_enable = venc_bridge_atomic_enable,
> +	.atomic_disable = venc_bridge_atomic_disable,
>  	.get_modes = venc_bridge_get_modes,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>  
>  static void venc_bridge_init(struct venc_device *venc)

-- 
Regards,

Laurent Pinchart


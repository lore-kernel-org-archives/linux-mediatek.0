Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE6BC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 21:06:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E245E2371F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 21:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E245E2371F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Hj1AyKvFWz9K8HjsfUURETRf6ByZXLr0hFie+2bF40=; b=al/Zt67hGhH5iNeXkhS0GQ4/o
	eoISw/Cm8kyDFrl07lBtCkQGUS/AoO44fWF2279ZJ/FH+brdNdzt7VIph8AGkAiJBZIHq0y1tYBO9
	B9mEkv/oubwm9eUv81ib3sT0c0hwUrr4zUPRbcGLE3qLzSxuYTUMir9g6TqLro/uvT+KpmobP4l3W
	0zeftbswIMFuSd2A/ISO9TT6YGyecAWv2Z6OmPZTiSYgfPjrY6NReldDWzMhJfmKul4DTmqXyRgBl
	9eXcSMnvgl61z8IjmaEy2hWipsrBcN9K/TjNV6xOFDPtncwy4kMWe/OCzXy9Gd1YmWV6eHcEQPggK
	vZea93BWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0WIn-0003LW-Jc; Fri, 15 Jan 2021 21:06:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0WIj-0003K7-SL; Fri, 15 Jan 2021 21:06:34 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D77A258B;
 Fri, 15 Jan 2021 22:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610744792;
 bh=T6hbV1O1oRjYL8zdng4qI1ulSsCeoFenYqaoA4x2R1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p+HucoNHt8b2/xNw2SqwXz+mxRCAMPmim4GRd9N7lVM740JU7m+MeQeAmI23QbbZJ
 5b2DgI1hHEzzRPPfkCkaIrro6c0Xzs3tmqlHK++ZReexfl/MjcWXoizCyFa49MR3MP
 FeLurhztnooLUnIirndDiO8cTiqI3R4yaO82o0cg=
Date: Fri, 15 Jan 2021 23:06:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 09/10] drm/atomic: Pass the full state to planes atomic
 disable and update
Message-ID: <YAIDxoyUtQooCsET@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-9-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-9-maxime@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_160634_038494_F9A7DCAE 
X-CRM114-Status: GOOD (  24.48  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Roland Scheidegger <sroland@vmware.com>,
 Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Edmund Dea <edmund.j.dea@intel.com>,
 virtualization@lists.linux-foundation.org, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Dave Airlie <airlied@redhat.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 John Stultz <john.stultz@linaro.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Brian Starkey <brian.starkey@arm.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>, linux-tegra@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alison Wang <alison.wang@nxp.com>, spice-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Tomi Valkeinen <tomba@kernel.org>,
 Philippe Cornu <philippe.cornu@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Paul Cercueil <paul@crapouillou.net>,
 Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Russell King <linux@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jyri Sarha <jyri.sarha@iki.fi>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Maxime,

Thank you for the patch.

On Fri, Jan 15, 2021 at 01:57:01PM +0100, Maxime Ripard wrote:
> The current atomic helpers have either their object state being passed as
> an argument or the full atomic state.
> 
> The former is the pattern that was done at first, before switching to the
> latter for new hooks or when it was needed.
> 
> Let's start convert all the remaining helpers to provide a consistent

s/start convert/convert/ ?

> interface, starting with the planes atomic_update and atomic_disable.

You're not starting anymore, its 09/10 already :-)

> The conversion was done using the coccinelle script below, built tested on
> all the drivers.
> 
> @@
> identifier plane, plane_state;
> symbol state;
> @@
> 
>  struct drm_plane_helper_funcs {
>  	...
> 	void (*atomic_update)(struct drm_plane *plane,
> -			      struct drm_plane_state *plane_state);
> +			      struct drm_atomic_state *state);
>  	...
>  }
> 
> @@
> identifier plane, plane_state;
> symbol state;
> @@
> 
>  struct drm_plane_helper_funcs {
> 	...
> 	void (*atomic_disable)(struct drm_plane *plane,
> -			       struct drm_plane_state *plane_state);
> +			       struct drm_atomic_state *state);
> 	...
>  }
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> (
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_update = func,
> 	...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_disable = func,
> 	...,
>  };
> )
> 
> @@
> struct drm_plane_helper_funcs *FUNCS;
> identifier f;
> identifier crtc_state;
> identifier plane, plane_state, state;
> expression e;
> @@
> 
>  f(struct drm_crtc_state *crtc_state)
>  {
>  	...
>  	struct drm_atomic_state *state = e;
>  	<+...
> (
> -	FUNCS->atomic_disable(plane, plane_state)
> +	FUNCS->atomic_disable(plane, state)
> |
> -	FUNCS->atomic_update(plane, plane_state)
> +	FUNCS->atomic_update(plane, state)
> )
>  	...+>
>  }
> 
> @@
> identifier plane_atomic_func.func;
> identifier plane;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane,
> -    struct drm_plane_state *state)
> +    struct drm_plane_state *old_plane_state)
>  {
> 	<...
> -	state
> +	old_plane_state
> 	...>
>  }
> 
> @ ignores_old_state @
> identifier plane_atomic_func.func;
> identifier plane, old_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *old_state)
>  {
> 	... when != old_state
>  }
> 
> @ adds_old_state depends on plane_atomic_func && !ignores_old_state @
> identifier plane_atomic_func.func;
> identifier plane, plane_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *plane_state)
>  {
> +	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
>  	...
>  }
> 
> @ depends on plane_atomic_func @
> identifier plane_atomic_func.func;
> identifier plane, plane_state;
> @@
> 
>  func(struct drm_plane *plane,
> -     struct drm_plane_state *plane_state
> +     struct drm_atomic_state *state
>      )
>  { ... }
> 
> @ include depends on adds_old_state @
> @@
> 
>  #include <drm/drm_atomic.h>
> 
> @ no_include depends on !include && adds_old_state @
> @@
> 
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
> 
> @@
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier plane_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_atomic_state *state) {
>  	...
>  	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
>  	<+...
> -	plane_state->state
> +	state
>  	...+>
>  }
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[snip]

>  drivers/gpu/drm/drm_atomic_helper.c           |  8 ++++----
>  drivers/gpu/drm/drm_simple_kms_helper.c       |  4 +++-
>  drivers/gpu/drm/omapdrm/omap_plane.c          |  4 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  4 +++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  4 +++-
>  include/drm/drm_modeset_helper_vtables.h      |  4 ++--

For these,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

For drivers/gpu/drm/xlnx/zynqmp_disp.c, please see below.

[snip]

> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index e278680b7d5a..39f9e6e76064 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1166,8 +1166,10 @@ zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
>  
>  static void
>  zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
> -				 struct drm_plane_state *old_state)
> +				 struct drm_atomic_state *state)
>  {
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> +									   plane);
>  	struct zynqmp_disp_layer *layer = plane_to_layer(plane);
>  
>  	if (!old_state->fb)
> @@ -1178,8 +1180,10 @@ zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
>  
>  static void
>  zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
> -				struct drm_plane_state *old_state)
> +				struct drm_atomic_state *state)
>  {
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> +								           plane);
>  	struct drm_plane_state *new_state = plane->state;
>  	struct zynqmp_disp_layer *layer = plane_to_layer(plane);
>  	bool format_changed = false;
> @@ -1485,20 +1489,12 @@ static void
>  zynqmp_disp_crtc_atomic_disable(struct drm_crtc *crtc,
>  				struct drm_atomic_state *state)
>  {
> -	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
> -									      crtc);
>  	struct zynqmp_disp *disp = crtc_to_disp(crtc);
> -	struct drm_plane_state *old_plane_state;
>  
>  	/*
> -	 * Disable the plane if active. The old plane state can be NULL in the
> -	 * .shutdown() path if the plane is already disabled, skip
> -	 * zynqmp_disp_plane_atomic_disable() in that case.
> +	 * Disable the plane if active.
>  	 */
> -	old_plane_state = drm_atomic_get_old_plane_state(old_crtc_state->state,
> -							 crtc->primary);
> -	if (old_plane_state)

You're removing this check, but there's no safeguard in
zynqmp_disp_plane_atomic_disable(). Can drm_atomic_get_old_plane_state()
return NULL there ?

> -		zynqmp_disp_plane_atomic_disable(crtc->primary, old_plane_state);
> +	zynqmp_disp_plane_atomic_disable(crtc->primary, state);
>  
>  	zynqmp_disp_disable(disp);
>  

[snip]
> 

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

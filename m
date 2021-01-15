Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C99BC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 20:58:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9B923A57
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 20:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD9B923A57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9nuP9aDQw7oN0rnQlP6NF+c3gkK+TQI7rXtbbkcdPyg=; b=MthId39JPt6m/EmwyRYt1MXJ0
	0K67dpUbLLaNBaRTCHuhj9aUaVXKEsmVUvYmpFJ5neaNbbATayWgaDhWt1w9dfwoY637idzj6jMFB
	PdTZBx7ebgaqisv5KKDa1So/kdIXdTt4FG30DDssZge9ZirxNK2q1s/b5L+gaL4su5Q6Ufg3A4C/T
	2atq1JcG23CC3iZCESh4I2sD20xSOuoz5RTpQBH+6TI3JXi//Hv+uTlemgSqHZjIqMeWPhxPYTSfu
	ML+TLc9Mdv4MzKERsGv7+QYc2VQLHeL+LLE7yexw+RSsBwrBniLwH9zXdiTpX27D9B8f/NDudhOmS
	Vo5ACXAdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0WAe-0001bs-Nu; Fri, 15 Jan 2021 20:58:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0WAY-0001a5-Qm; Fri, 15 Jan 2021 20:58:09 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F32CB58B;
 Fri, 15 Jan 2021 21:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610744277;
 bh=VjE+h+vZVJvv9Us4y8H19WCA00VSbF5Mv39d7q0MA9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BV3hEMjlk7/sEuKZRq6pt0i2HuaqsH60PVECUzrsL2O1TD7ANDlEjKgpfLxpsno0J
 V+GDPEX+RT1JaaqsMkgbVNMHG6qTeG7N7mWXbGklvGmCYKw1yxb3d/evRKRLjIbvkr
 5xrKIgguJLiN4CHn4qNUfx/2EFxHOtUVq3DDfbUg=
Date: Fri, 15 Jan 2021 22:57:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 07/10] drm: Store new plane state in a variable for
 atomic_update and disable
Message-ID: <YAIBxF2kiy0twoV+@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-7-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-7-maxime@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_155807_000594_BF771967 
X-CRM114-Status: GOOD (  18.21  )
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 Melissa Wen <melissa.srw@gmail.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Chen-Yu Tsai <wens@csie.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Dave Airlie <airlied@redhat.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Edmund Dea <edmund.j.dea@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, spice-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Brian Starkey <brian.starkey@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Maxime,

Thank you for the patch.

On Fri, Jan 15, 2021 at 01:56:59PM +0100, Maxime Ripard wrote:
> In order to store the new plane state in a subsequent helper, let's move
> the plane->state dereferences into a variable.
> 
> This was done using the following coccinelle script, plus some hand
> changes for vmwgfx:
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> (
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_disable = func,
> 	...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_update = func,
> 	...,
>  };
> )
> 
> @ has_new_state_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> identifier new_state;
> symbol old_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *old_state)
>  {
>  	...
>  	struct drm_plane_state *new_state = plane->state;
> 	...
>  }
> 
> @ depends on !has_new_state_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol old_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *old_state)
>  {
> +	struct drm_plane_state *new_state = plane->state;
>  	<+...
> -	plane->state
> +	new_state
> 	...+>
>  }
> 
> @ has_new_state_state @
> identifier plane_atomic_func.func;
> identifier plane;
> identifier new_state;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *state)
>  {
>  	...
>  	struct drm_plane_state *new_state = plane->state;
> 	...
>  }
> 
> @ depends on !has_new_state_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *state)
>  {
> +	struct drm_plane_state *new_plane_state = plane->state;
>  	<+...
> -	plane->state
> +	new_plane_state
> 	...+>
>  }
> 
> @ has_new_state_old_s @
> identifier plane_atomic_func.func;
> identifier plane;
> identifier new_state;
> symbol old_s;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *old_s)
>  {
>  	...
>  	struct drm_plane_state *new_state = plane->state;
> 	...
>  }
> 
> @ depends on !has_new_state_old_s @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol old_s;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *old_s)
>  {
> +	struct drm_plane_state *new_s = plane->state;
>  	<+...
> -	plane->state
> +	new_s
> 	...+>
>  }

I may have taken this as an opportunity to align naming conventions for
variables across drivers, but that may just be me.

> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[snip]

>  drivers/gpu/drm/omapdrm/omap_plane.c          |  5 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  5 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  3 +-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c            |  7 ++--

For these, with the small issue below addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[snip]

> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index 1042e1147e74..de5ad69af4cb 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -88,11 +88,12 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
>  static void omap_plane_atomic_disable(struct drm_plane *plane,
>  				      struct drm_plane_state *old_state)
>  {
> +	struct drm_plane_state *new_state = plane->state;
>  	struct omap_drm_private *priv = plane->dev->dev_private;
>  	struct omap_plane *omap_plane = to_omap_plane(plane);
>  
> -	plane->state->rotation = DRM_MODE_ROTATE_0;
> -	plane->state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
> +	new_state->rotation = DRM_MODE_ROTATE_0;
> +	new_state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
>  			   ? 0 : omap_plane->id;

Can you fix the indentation ?

>  	dispc_ovl_enable(priv->dispc, omap_plane->id, false);

[snip]

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

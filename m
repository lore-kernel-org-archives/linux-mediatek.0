Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862DDECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 15:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2QuxV6KDGtftWXw3MRj+l51s6QLsXNabw6I6+9k7Ro=; b=cpJh0BpGpChMH5TqyxqBxtXEX+
	RL5AEt0yeEeARaDhUvpSSwvOvHloGV9+5SQyBkTH7Ip4pQNf2ohvcugMCVN7NNF+LSxcxETJ5w+/K
	vS+wVA2VXguP0K299YefJ3o61RzPto13a5WyWditCCwqXr7oAtoGFq8W21XYd+s0t3H0yKF9LZK8p
	bEBAXy7F1ZyAxJ+0Zj9aEFz3a4leUffsu4W8h5r3hR7Uft2fl6AW+K+nyjKJhFGWttVsZlnM1mzUw
	shRxvKw1T/A7rHU0g6WQd7ANsU5yMZwK5v567SEp2T6AxnNx0ovquR5ICFOPLoE09ctSy80Cd24gZ
	F6gNuyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIpe-00CXkw-3G; Mon, 19 Sep 2022 15:37:14 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIiY-00CTLv-Pv; Mon, 19 Sep 2022 15:29:56 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2472E499;
	Mon, 19 Sep 2022 17:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1663601393;
	bh=jDkXVBjY35lMOtjDJwJDXPYBRkII1bXO22Gtm2g2nhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3PfNgG0bw9Qa+rKEjsQmpYSVhr2H7UyBp4Ao1fbdRJuCiwV0SnGu3hpDIZE9Pg16
	 IkMC82Mo/1UJoy63TUrMk/21MGGEA+PCVQCr29ixFLiaNfEs5l4uZrp6DMyBE7dOaJ
	 fKLoyunNe0GTgA1nRB9O2Xz2UPeSoXsQJlTw2Brw=
Date: Mon, 19 Sep 2022 18:29:40 +0300
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
Subject: Re: [PATCH v1 07/12] drm/bridge: tc358767: Use
 drm_bridge_funcs.atomic_check
Message-ID: <YyiK5GK7TYNxI7eS@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717174454.46616-8-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717174454.46616-8-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_082955_033112_6EB3A145 
X-CRM114-Status: GOOD (  18.69  )
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

On Sun, Jul 17, 2022 at 07:44:49PM +0200, Sam Ravnborg wrote:
> When atomic_check() is defined, then mode_fixup() is ignored,
> so it had no effect that drm_bridge_funcs.mode_fixup was assigned.
> Embed the original implementation in the caller and drop the function.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/tc358767.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 02bd757a8987..b2ab967504af 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1496,26 +1496,18 @@ tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
>  		dev_err(tc->dev, "main link disable error: %d\n", ret);
>  }
>  
> -static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
> -				 const struct drm_display_mode *mode,
> -				 struct drm_display_mode *adj)
> -{
> -	/* Fixup sync polarities, both hsync and vsync are active low */
> -	adj->flags = mode->flags;
> -	adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> -	adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> -
> -	return true;
> -}
> -
>  static int tc_common_atomic_check(struct drm_bridge *bridge,
>  				  struct drm_bridge_state *bridge_state,
>  				  struct drm_crtc_state *crtc_state,
>  				  struct drm_connector_state *conn_state,
>  				  const unsigned int max_khz)
>  {
> -	tc_bridge_mode_fixup(bridge, &crtc_state->mode,
> -			     &crtc_state->adjusted_mode);
> +	struct drm_display_mode *adj = &crtc_state->adjusted_mode;
> +
> +	/* Fixup sync polarities, both hsync and vsync are active low */
> +	adj->flags = crtc_state->mode.flags;
> +	adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +	adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>  
>  	if (crtc_state->adjusted_mode.clock > max_khz)
>  		return -EINVAL;
> @@ -1783,7 +1775,6 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
>  	.atomic_check = tc_edp_atomic_check,
>  	.atomic_enable = tc_edp_bridge_atomic_enable,
>  	.atomic_disable = tc_edp_bridge_atomic_disable,
> -	.mode_fixup = tc_bridge_mode_fixup,
>  	.detect = tc_bridge_detect,
>  	.get_edid = tc_get_edid,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,

-- 
Regards,

Laurent Pinchart


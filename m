Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F31FC54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 15:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2lfP5VtQIxYtfwLc6JpL6F4cI2C9QlI3zICv2v/x+0=; b=jCaQPL1i5MS164b046F1QjUNCw
	FQmk9+Zf5ssag3tufrlY4Tqf22n0vr4UjUJdUR7SgrqkFPV73YpDaMTZsc7uqKKCSsSFkYHcTQ1mn
	sOsuHs7waz+Ye8oMxJGxrN3tjfVoAecV/3qJIXXzrBCHhMeDYUtxsY4tqXYheNFshHGlpq1Dbcev+
	ZZyf9rCU/8ndhS8xqRdfjgnx+7BXrK2u9C1k6pEZbJr0AXJOdmkmB4DU16Em5b6IZmLhB+nnA85bX
	08ULqOywbJnT9+WByfMVPd69vUavAvj4wwwYd9wcZPTCeeugVhx09zBOE3lSu4LNUTWRVmKd+dqOu
	ieRJ0tsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIvc-00Cb3D-LI; Mon, 19 Sep 2022 15:43:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIkL-00CUJ8-0F; Mon, 19 Sep 2022 15:31:46 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4867D499;
	Mon, 19 Sep 2022 17:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1663601503;
	bh=xj+FXHZun7Tq2dFujf6besSXQvCHP1Rn25a1rvSb5ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kbgwRAU2yAb5P6lfEc4xG6kfAJyc+96nTqzByEhr8ACzvuioMONQQ0p9+sLB9lcKg
	 n86vQt8oXnNUst7jy1xSUN4Uq1gnJYpTzE6o35wFzWEc4z+ELb+iIxWGKBRWDxZiSu
	 bdtZB8khxJkL/kFnzjH8V2IkgPMgsnzhsYqpnjjU=
Date: Mon, 19 Sep 2022 18:31:30 +0300
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
Subject: Re: [PATCH v1 09/12] drm/rcar-du: lvds: Use
 drm_bridge_funcs.atomic_check
Message-ID: <YyiLUg4KSEizU4EE@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717175801.78668-2-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_083145_380535_5B90E0EF 
X-CRM114-Status: GOOD (  19.99  )
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

On Sun, Jul 17, 2022 at 07:57:58PM +0200, Sam Ravnborg wrote:
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
> The driver implements the state operations, so no other changes
> are required for the replacement.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I assume you'll merge this through drm-misc with the rest of the series,
so I won't take it in my tree unless you ask me so.

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 830aac0a2cb4..c4adbcede090 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -554,10 +554,12 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>  	clk_disable_unprepare(lvds->clocks.mod);
>  }
>  
> -static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
> -				 const struct drm_display_mode *mode,
> -				 struct drm_display_mode *adjusted_mode)
> +static int rcar_lvds_atomic_check(struct drm_bridge *bridge,
> +				  struct drm_bridge_state *bridge_state,
> +				  struct drm_crtc_state *crtc_state,
> +				  struct drm_connector_state *conn_state)
>  {
> +	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>  	int min_freq;
>  
> @@ -569,7 +571,7 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
>  	min_freq = lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL ? 5000 : 31000;
>  	adjusted_mode->clock = clamp(adjusted_mode->clock, min_freq, 148500);
>  
> -	return true;
> +	return 0;
>  }
>  
>  static int rcar_lvds_attach(struct drm_bridge *bridge,
> @@ -591,7 +593,7 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.atomic_enable = rcar_lvds_atomic_enable,
>  	.atomic_disable = rcar_lvds_atomic_disable,
> -	.mode_fixup = rcar_lvds_mode_fixup,
> +	.atomic_check = rcar_lvds_atomic_check,
>  };
>  
>  bool rcar_lvds_dual_link(struct drm_bridge *bridge)

-- 
Regards,

Laurent Pinchart


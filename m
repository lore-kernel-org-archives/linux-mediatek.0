Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B4BC6FA90
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGSfSe+ZV354HH4IF8OukKHcZO/p7pS1aGA1subYHnU=; b=SuSjfR5riBTTRtdK5PljXq1nq8
	2cvmDu/A/Y1o6X3QEWDcfinRSD2mxUJcrLEIl3B5KzX/4toRtXcZa6yvHfiBzWes/lI/snfw1DRg/
	zXirmJ2mxiPWjkbuNFCVNlKmkdwnKtN+DFUkDr/M66N6qOWYI/vCmDVKQqEjnPdqdyuy7w3w6dAMt
	///F+68RlUD0MOA9StW6SKsQXIKubZoBJJisPJVudPUwew+u96vrs/jtB7hBSvFkeDg0355qxPpV4
	j4NJO0k/g81+bawMOxqai/KiplbbGYlERV/GtavWaffHm7joBdvypM/MOJxT0k3gvCTVxup0WEqsL
	mw2JE1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIiE-00CTA3-So; Mon, 19 Sep 2022 15:29:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIYq-00CO9E-Vb; Mon, 19 Sep 2022 15:19:55 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57FAA499;
	Mon, 19 Sep 2022 17:19:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1663600791;
	bh=PQGPD6rFfQ4c9/wXNerOZd6lDaZMOvrBsAqiWgV3tp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IN7WVwhttqy9kKXcxIP20OMJA/V4fQBWil7pAMKkG4AXtYpceTw0TlNljB0cvxArg
	 j84YQ52vuqaWmmH8XoIwtQDvRnjs6BaIjUEnRbNhEPsnQoe+SVh2sbQey79MGxtSGd
	 BVX8UoQgAKAq5H8L+7APt1mi8Zwpf4AbIFAIkNL8=
Date: Mon, 19 Sep 2022 18:19:38 +0300
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
Subject: Re: [PATCH v1 04/12] drm/bridge: Drop drm_bridge_chain_mode_fixup
Message-ID: <YyiIineQ/Ib4rQH/@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717174454.46616-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717174454.46616-5-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_081953_448289_65A80792 
X-CRM114-Status: GOOD (  20.24  )
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

On Sun, Jul 17, 2022 at 07:44:46PM +0200, Sam Ravnborg wrote:
> There are no users left of drm_bridge_chain_mode_fixup() and we
> do not want to have this function available, so drop it.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_bridge.c | 37 ------------------------------------
>  include/drm/drm_bridge.h     |  3 ---
>  2 files changed, 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index bb7fc09267af..b6f56d8f3547 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -430,43 +430,6 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>   *   needed, in order to gradually transition to the new model.
>   */
>  
> -/**
> - * drm_bridge_chain_mode_fixup - fixup proposed mode for all bridges in the
> - *				 encoder chain
> - * @bridge: bridge control structure
> - * @mode: desired mode to be set for the bridge
> - * @adjusted_mode: updated mode that works for this bridge
> - *
> - * Calls &drm_bridge_funcs.mode_fixup for all the bridges in the
> - * encoder chain, starting from the first bridge to the last.
> - *
> - * Note: the bridge passed should be the one closest to the encoder
> - *
> - * RETURNS:
> - * true on success, false on failure
> - */
> -bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
> -				 const struct drm_display_mode *mode,
> -				 struct drm_display_mode *adjusted_mode)
> -{
> -	struct drm_encoder *encoder;
> -
> -	if (!bridge)
> -		return true;
> -
> -	encoder = bridge->encoder;
> -	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> -		if (!bridge->funcs->mode_fixup)
> -			continue;
> -
> -		if (!bridge->funcs->mode_fixup(bridge, mode, adjusted_mode))
> -			return false;
> -	}
> -
> -	return true;
> -}
> -EXPORT_SYMBOL(drm_bridge_chain_mode_fixup);
> -
>  /**
>   * drm_bridge_chain_mode_valid - validate the mode against all bridges in the
>   *				 encoder chain.
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 1eca9c4c3346..7496f41535b1 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -845,9 +845,6 @@ drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
>  #define drm_for_each_bridge_in_chain(encoder, bridge)			\
>  	list_for_each_entry(bridge, &(encoder)->bridge_chain, chain_node)
>  
> -bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
> -				 const struct drm_display_mode *mode,
> -				 struct drm_display_mode *adjusted_mode);
>  enum drm_mode_status
>  drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
>  			    const struct drm_display_info *info,

-- 
Regards,

Laurent Pinchart


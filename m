Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460FDC54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 15:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HcKd/xa1eRVdn1Xitr0iDFwc9G2t+3KEuhFBkRd+Q0=; b=2NGA+z/P+nLFdHUBdu5U8Zzho3
	jGSLMyVprJBE55weJReOuaXP27Ytg9j6YKVKvSLGo7Yk4cJLGv/LeELGQn/xYLMfQmjw2jGwM55Cq
	GTIis+3VllgjaACWnL3aBM4LpvEzvQ2I/MFNGHYwjiT9KqgtYZgOsgBLSkF67wjgLn7aP/EnGC4Gp
	NuxILb3YhB29E/uppwDM5pEwdQjUkxwMUcpBtOTgocIBRVDjhkAxxot6LMm+riL0JKeINdjt7CI+d
	/CivxvMIrSI6gpouM8BrniWNDO+4KNCSi587HuwmpuydB0cB4uyNDmJE10YtB9k56lsAwvkjuURTx
	hZItAHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIy4-00CcKn-1f; Mon, 19 Sep 2022 15:45:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIn5-00CWCQ-Sg; Mon, 19 Sep 2022 15:34:38 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44236499;
	Mon, 19 Sep 2022 17:34:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1663601674;
	bh=5Obobqkdm/QseGlldjU1Tkl0Aau1csirOHQ2CjvpOIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6AgUzxS3VJ+xsDHgxrsI53uLkcYTt0/KBNeOpnY4ofzE6XgUVNhrWUVaQFhGCj4a
	 Odq3CbDwQvNjrhW6lvi7RdXsY64HvJ3QplgAY+BUN6Lon2Fo1l5g98qs0madIADBpf
	 7EsxsT9lWtt1UzkALUy58W6BB7+Da2gWu2WK2jjw=
Date: Mon, 19 Sep 2022 18:34:21 +0300
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
Subject: Re: [PATCH v1 11/12] drm/bridge: Drop drm_bridge_funcs.mode_fixup
Message-ID: <YyiL/Q8X76I+ZzEu@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717175801.78668-4-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_083436_246565_14E10966 
X-CRM114-Status: GOOD (  37.16  )
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

On Sun, Jul 17, 2022 at 07:58:00PM +0200, Sam Ravnborg wrote:
> All users are converted over to drm_bridge_funcs.atomic_check()
> so it is safe to drop the mode_fixup support.
> 
> Update the comment for atomic_check with relevant parts from mode_fixup.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_bridge.c |  7 +----
>  include/drm/drm_bridge.h     | 60 ++++++++++--------------------------
>  2 files changed, 17 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b6f56d8f3547..3f5acb19957c 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -685,10 +685,6 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
>  						  crtc_state, conn_state);
>  		if (ret)
>  			return ret;
> -	} else if (bridge->funcs->mode_fixup) {
> -		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
> -					       &crtc_state->adjusted_mode))
> -			return -EINVAL;
>  	}
>  
>  	return 0;
> @@ -934,8 +930,7 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
>   * @conn_state: new connector state
>   *
>   * First trigger a bus format negotiation before calling
> - * &drm_bridge_funcs.atomic_check() (falls back on
> - * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder chain,
> + * &drm_bridge_funcs.atomic_check() op for all the bridges in the encoder chain,
>   * starting from the last bridge to the first. These are called before calling
>   * &drm_encoder_helper_funcs.atomic_check()
>   *
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 7496f41535b1..8c93369bcc74 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -106,7 +106,7 @@ struct drm_bridge_funcs {
>  	 * to look at anything else but the passed-in mode, and validate it
>  	 * against configuration-invariant hardward constraints. Any further
>  	 * limits which depend upon the configuration can only be checked in
> -	 * @mode_fixup.
> +	 * @atomic_check.
>  	 *
>  	 * RETURNS:
>  	 *
> @@ -116,46 +116,6 @@ struct drm_bridge_funcs {
>  					   const struct drm_display_info *info,
>  					   const struct drm_display_mode *mode);
>  
> -	/**
> -	 * @mode_fixup:
> -	 *
> -	 * This callback is used to validate and adjust a mode. The parameter
> -	 * mode is the display mode that should be fed to the next element in
> -	 * the display chain, either the final &drm_connector or the next
> -	 * &drm_bridge. The parameter adjusted_mode is the input mode the bridge
> -	 * requires. It can be modified by this callback and does not need to
> -	 * match mode. See also &drm_crtc_state.adjusted_mode for more details.
> -	 *
> -	 * This is the only hook that allows a bridge to reject a modeset. If
> -	 * this function passes all other callbacks must succeed for this
> -	 * configuration.
> -	 *
> -	 * The mode_fixup callback is optional. &drm_bridge_funcs.mode_fixup()
> -	 * is not called when &drm_bridge_funcs.atomic_check() is implemented,
> -	 * so only one of them should be provided.
> -	 *
> -	 * NOTE:
> -	 *
> -	 * This function is called in the check phase of atomic modesets, which
> -	 * can be aborted for any reason (including on userspace's request to
> -	 * just check whether a configuration would be possible). Drivers MUST
> -	 * NOT touch any persistent state (hardware or software) or data
> -	 * structures except the passed in @state parameter.
> -	 *
> -	 * Also beware that userspace can request its own custom modes, neither
> -	 * core nor helpers filter modes to the list of probe modes reported by
> -	 * the GETCONNECTOR IOCTL and stored in &drm_connector.modes. To ensure
> -	 * that modes are filtered consistently put any bridge constraints and
> -	 * limits checks into @mode_valid.
> -	 *
> -	 * RETURNS:
> -	 *
> -	 * True if an acceptable configuration is possible, false if the modeset
> -	 * operation should be rejected.
> -	 */
> -	bool (*mode_fixup)(struct drm_bridge *bridge,
> -			   const struct drm_display_mode *mode,
> -			   struct drm_display_mode *adjusted_mode);
>  	/**
>  	 * @disable:
>  	 *
> @@ -466,9 +426,7 @@ struct drm_bridge_funcs {
>  	 * &drm_bridge_funcs.atomic_check() hooks are called in reverse
>  	 * order (from the last to the first bridge).
>  	 *
> -	 * This method is optional. &drm_bridge_funcs.mode_fixup() is not
> -	 * called when &drm_bridge_funcs.atomic_check() is implemented, so only
> -	 * one of them should be provided.
> +	 * This method is optional.
>  	 *
>  	 * If drivers need to tweak &drm_bridge_state.input_bus_cfg.flags or
>  	 * &drm_bridge_state.output_bus_cfg.flags it should happen in
> @@ -478,6 +436,20 @@ struct drm_bridge_funcs {
>  	 * &drm_connector.display_info.bus_flags if the bridge is the last
>  	 * element in the chain.
>  	 *
> +	 * NOTE:
> +	 *
> +	 * This function is called in the check phase of atomic modesets, which
> +	 * can be aborted for any reason (including on userspace's request to
> +	 * just check whether a configuration would be possible). Drivers MUST
> +	 * NOT touch any persistent state (hardware or software) or data
> +	 * structures except the passed in @state parameter.
> +	 *
> +	 * Also beware that userspace can request its own custom modes, neither
> +	 * core nor helpers filter modes to the list of probe modes reported by
> +	 * the GETCONNECTOR IOCTL and stored in &drm_connector.modes. To ensure
> +	 * that modes are filtered consistently put any bridge constraints and
> +	 * limits checks into @mode_valid.
> +	 *
>  	 * RETURNS:
>  	 * zero if the check passed, a negative error code otherwise.
>  	 */

-- 
Regards,

Laurent Pinchart


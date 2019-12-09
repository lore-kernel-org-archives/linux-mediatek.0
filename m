Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9403FC43603
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 00:56:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BDF2206DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 00:56:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n09Sj+Ex";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aPM7SCEV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BDF2206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSXbZJMhf6dULjQ/lQ39QLZxR6MuZZvqpGAiHCDQjz4=; b=n09Sj+ExuApq60
	Bya7TQ7KO2o19BbPbD2Aw0AdcMRsNJWZzjh3xnceyI6e/nZGHPaHneWaXAkD3iOddGY58bSE5vbW7
	B/szcCjCMown1yuBuElc6VlgdIKWCljPg6c2JGIt6+yefZiWorVKC0T3iTMbbQPntUwPAQichTzf3
	NRmUh8UhUKXv5SxcPdBeQY8PfnancUA+KmMzXf/JTBG8broqDPnEQJpIw9be97DBc8ZLV0CuuiqC0
	R+Z/IuvBiGXScJgkY7/h+LtUtBGREFzo0QG4UVH3QSlqcgzYsr4rwKSDkWbhdy8QqJIUSv7Rt/WDc
	QhnY/Y1lx1deCZC5fzlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ie7LL-0007D2-LO; Mon, 09 Dec 2019 00:56:07 +0000
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ie7LB-00075M-DG; Mon, 09 Dec 2019 00:55:59 +0000
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE90A52B;
 Mon,  9 Dec 2019 01:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1575852625;
 bh=05qu6A8LjmvyF+V1mQN3igr/hkyti8yhAOb0TcMEjBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aPM7SCEVSQZJXE7EyZ2dRxMJ+M1xpN1dnPsbeDQZ7R6amo1/qxXroZt3KnEHlq8aF
 jp/X4dSfBpcS6P7eA+PLl37xwevqOUhRe3+jf+WOPqMAhk7GVf0kN7+T4oqhk3Konp
 TpKjRjJSuaJsGi2it/bEbmeLOBvSCx989iQjdPdY=
Date: Mon, 9 Dec 2019 02:50:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 01/25] drm/drm_panel: no error when no callback
Message-ID: <20191209005018.GJ14311@pendragon.ideasonboard.com>
References: <20191207140353.23967-1-sam@ravnborg.org>
 <20191207140353.23967-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191207140353.23967-2-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_165557_887364_F72ED4E9 
X-CRM114-Status: GOOD (  19.34  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stefan Agner <stefan@agner.ch>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sam,

Thank you for the patch.

On Sat, Dec 07, 2019 at 03:03:29PM +0100, Sam Ravnborg wrote:
> The callbacks in drm_panel_funcs are optional, so do not
> return an error just because no callback is assigned.
> 
> v2:
> - Document what functions in drm_panel_funcs are optional (Laurent)
> - Return -EOPNOTSUPP if get_modes() is not assigned (Laurent)
>   (Sam: -EOPNOTSUPP seems to best error code in this situation)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_panel.c | 35 +++++++++++++++++++++++++----------
>  include/drm/drm_panel.h     | 18 ++++++++++++++++--
>  2 files changed, 41 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index ed7985c0535a..4ab7229fb22b 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -151,10 +151,13 @@ EXPORT_SYMBOL(drm_panel_detach);
>   */
>  int drm_panel_prepare(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->prepare)
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->funcs && panel->funcs->prepare)
>  		return panel->funcs->prepare(panel);
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_prepare);
>  
> @@ -171,10 +174,13 @@ EXPORT_SYMBOL(drm_panel_prepare);
>   */
>  int drm_panel_unprepare(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->unprepare)
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->funcs && panel->funcs->unprepare)
>  		return panel->funcs->unprepare(panel);
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_unprepare);
>  
> @@ -190,10 +196,13 @@ EXPORT_SYMBOL(drm_panel_unprepare);
>   */
>  int drm_panel_enable(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->enable)
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->funcs && panel->funcs->enable)
>  		return panel->funcs->enable(panel);
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_enable);
>  
> @@ -209,10 +218,13 @@ EXPORT_SYMBOL(drm_panel_enable);
>   */
>  int drm_panel_disable(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->disable)
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->funcs && panel->funcs->disable)
>  		return panel->funcs->disable(panel);
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_disable);
>  
> @@ -228,10 +240,13 @@ EXPORT_SYMBOL(drm_panel_disable);
>   */
>  int drm_panel_get_modes(struct drm_panel *panel)
>  {
> -	if (panel && panel->funcs && panel->funcs->get_modes)
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->funcs && panel->funcs->get_modes)
>  		return panel->funcs->get_modes(panel);
>  
> -	return panel ? -ENOSYS : -EINVAL;
> +	return -EOPNOTSUPP;
>  }
>  EXPORT_SYMBOL(drm_panel_get_modes);
>  
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index ce8da64022b4..d71655b2634c 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -65,6 +65,8 @@ struct drm_panel_funcs {
>  	 * @prepare:
>  	 *
>  	 * Turn on panel and perform set up.
> +	 *
> +	 * This function is optional.
>  	 */
>  	int (*prepare)(struct drm_panel *panel);
>  
> @@ -72,6 +74,8 @@ struct drm_panel_funcs {
>  	 * @enable:
>  	 *
>  	 * Enable panel (turn on back light, etc.).
> +	 *
> +	 * This function is optional.
>  	 */
>  	int (*enable)(struct drm_panel *panel);
>  
> @@ -79,6 +83,8 @@ struct drm_panel_funcs {
>  	 * @disable:
>  	 *
>  	 * Disable panel (turn off back light, etc.).
> +	 *
> +	 * This function is optional.
>  	 */
>  	int (*disable)(struct drm_panel *panel);
>  
> @@ -86,14 +92,20 @@ struct drm_panel_funcs {
>  	 * @unprepare:
>  	 *
>  	 * Turn off panel.
> +	 *
> +	 * This function is optional.
>  	 */
>  	int (*unprepare)(struct drm_panel *panel);
>  
>  	/**
>  	 * @get_modes:
>  	 *
> -	 * Add modes to the connector that the panel is attached to and
> -	 * return the number of modes added.
> +	 * Add modes to the connector that the panel is attached to.
> +	 *
> +	 * This function is mandatory.
> +	 *
> +	 * Returns the number of modes added, -EOPNOTSUPP if callback
> +	 * is missing, -EINVAL if panel is NULL.

This applies to drm_panel_get_modes, not &drm_panel_funcs.get_modes.
Here you should just have

 	 *
 	 * Add modes to the connector that the panel is attached to and
 	 * return the number of modes added.
+	 *
+	 * This function is mandatory.
 	 */
 	int (*get_modes)(struct drm_panel *panel);
 
>  	 */
>  	int (*get_modes)(struct drm_panel *panel);
>  
> @@ -102,6 +114,8 @@ struct drm_panel_funcs {
>  	 *
>  	 * Copy display timings into the provided array and return
>  	 * the number of display timings available.
> +	 *
> +	 * This function is optional.
>  	 */
>  	int (*get_timings)(struct drm_panel *panel, unsigned int num_timings,
>  			   struct display_timing *timings);

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

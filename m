Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F62C4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 10:19:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9261B6109E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 10:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9261B6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3I78DKDsK0o7NGbQS9nKhw87fgroVFUb5FVm1E6AbNM=; b=jlHr6pMT7uDjcz
	98+axkBellRxEu71K29NYlOX0wY9KDi7SEVXOVI7dfTeb0aUuZjOPxHx+ClD2jMF6qNovRlbPPOIH
	9w05SxOQo+Agg0/rFc5OC1CSDj4HEqB1fRuNnCpDDhm1caZ/5fy5KWp8Vw75HJIsWDp48TXoABGcn
	a8NfAghW87nOWWTTqMY5Ak6FxoyBikogQD+mZrLTg2ConkAExB4K8ruGmdPHFrrkoaTzuVSTsHos0
	FneMqPTU1vbVOuDZwv4MHadqd1/NCry78BPQMXqox2oJQ3VAvGzPKR26uzCWRV6BnfeEcJjd5FBne
	o2Ck9HVxYvmoCSk5iQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDOqO-003UJY-Iw; Tue, 10 Aug 2021 10:18:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDOqJ-003UHz-As
 for linux-mediatek@lists.infradead.org; Tue, 10 Aug 2021 10:18:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id h13so25517879wrp.1
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Aug 2021 03:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ypz43Y7ht5yYPrHsmCF+aueU4gZCkS1cG/1GAPtZPFc=;
 b=R+OW/xFuOkLahmCf4qAPxmhZ0v0kNmMW8QPSLqB83Ihp6rlDsVgu3zCMRpFZdHI8L5
 EO9zUOTjLrZckWIMazJuhc9wx9MUiAHuFJnK5r5irvffTxUcLQw+TscabHn9fkt+Ox6/
 kYCi1+bs1d48eKqq5cXH8sw9Ny5ATK9r62gMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ypz43Y7ht5yYPrHsmCF+aueU4gZCkS1cG/1GAPtZPFc=;
 b=AEJNCXZHwE2JvvD0qzEsjld2lKUyI68CC0ZFIoKemjlDvPUNbsv5fUNdToxx/qU/OW
 MdwgyInxYET4ZmLCxnC0XOFBqSPPTVBpbwewoGHfJNGB7kcm+xKzPEIn7E13vFEOfmg/
 lLTNnnJHdD8ojgkVpSaiEahYzyWDvdMTYmDs58zW+0xyDGuPf2PPhEpCV3FuwAYGcQVe
 q+IypOxXv1swH9BELTaVuYiTiM4YRO9FPzIUVTBdWVK3aX8x8xSggQCeFJSggXAqsg+k
 OLGKR7px/dWokNIoCIvoCnGvicqG3KzOpFUsPuFm7Y6HKIZjVhDs5UHeYSnbiThQYyhq
 WDdA==
X-Gm-Message-State: AOAM533m893Qz9beET+Sb98HIUbeTzqS2Dxss0V8maUlljbuw0pjnZhq
 UsHPTM/zAZ0RP5izKauIFvghcA==
X-Google-Smtp-Source: ABdhPJyJynbXqePsNSwEyVY1512w9lGozC+ZnWM7Y5j68AQk7xYtQOTJceaK4TGRZ3ho9pMitB0j/Q==
X-Received: by 2002:a5d:4309:: with SMTP id h9mr15828319wrq.299.1628590720316; 
 Tue, 10 Aug 2021 03:18:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j6sm2332384wmq.29.2021.08.10.03.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:18:39 -0700 (PDT)
Date: Tue, 10 Aug 2021 12:18:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 cawa.cheng@mediatek.com, bibby.hsieh@mediatek.com,
 ck.hu@mediatek.com, stonea168@163.com
Subject: Re: [PATCH v2 1/3] drm/panel: seperate panel power control from
 panel prepare/unprepare
Message-ID: <YRJSfdsAv9gZCO2R@phenom.ffwll.local>
Mail-Followup-To: Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 cawa.cheng@mediatek.com, bibby.hsieh@mediatek.com,
 ck.hu@mediatek.com, stonea168@163.com
References: <20210808125218.63029-1-jitao.shi@mediatek.com>
 <20210808125218.63029-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210808125218.63029-2-jitao.shi@mediatek.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_031843_421486_D867BEA6 
X-CRM114-Status: GOOD (  30.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Aug 08, 2021 at 08:52:16PM +0800, Jitao Shi wrote:
> Some dsi panels require the dsi lanes keeping low before panel power
> on. So seperate the panel power control and the communication with panel.
> 
> And put the power control in drm_panel_prepare_power and
> drm_panel_unprepare_power. Put the communication with panel in
> drm_panel_prepare and drm_panel_unprepare.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

This solves your problem, but it breaks the panel standard for everyone
else since you're not converting them over.

There needs to be more thought here in how to make this all compatible.

Also I think we need very precise spec for how this is supposed to work
with DSI panels, and then making sure existing drivers mostly follow this.

Hacking up a shared interface that's used by lots of drivers just to then
fix a bug in one user and one implementation is not good.
-Daniel

> ---
>  drivers/gpu/drm/bridge/panel.c | 17 +++++++++++++++
>  drivers/gpu/drm/drm_panel.c    | 38 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h       |  2 ++
>  include/drm/drm_panel.h        | 17 +++++++++++++++
>  4 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index c916f4b8907e..3a846ac8e24c 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -137,6 +137,23 @@ static int panel_bridge_get_modes(struct drm_bridge *bridge,
>  	return drm_panel_get_modes(panel_bridge->panel, connector);
>  }
>  
> +int panel_bridge_prepare_power(struct drm_bridge *bridge)
> +{
> +	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +
> +	return drm_panel_prepare_power(panel_bridge->panel);
> +}
> +EXPORT_SYMBOL(panel_bridge_prepare_power);
> +
> +int panel_bridge_unprepare_power(struct drm_bridge *bridge)
> +{
> +        struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +
> +        return drm_panel_unprepare_power(panel_bridge->panel);
> +}
> +EXPORT_SYMBOL(panel_bridge_unprepare_power);
> +
> +
>  static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
>  	.attach = panel_bridge_attach,
>  	.detach = panel_bridge_detach,
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371c717a..7bb5185db17d 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -115,6 +115,24 @@ int drm_panel_prepare(struct drm_panel *panel)
>  }
>  EXPORT_SYMBOL(drm_panel_prepare);
>  
> +/**
> + * drm_panel_prepare_power - power on a panel's power
> + * @panel: DRM panel
> + *
> + * Calling this function will enable power and deassert any reset signals to
> + * the panel.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_prepare_power(struct drm_panel *panel)
> +{
> +	if (panel && panel->funcs && panel->funcs->prepare_power)
> +		return panel->funcs->prepare_power(panel);
> +
> +	return panel ? -ENOSYS : -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_panel_prepare_power);
> +
>  /**
>   * drm_panel_unprepare - power off a panel
>   * @panel: DRM panel
> @@ -138,6 +156,26 @@ int drm_panel_unprepare(struct drm_panel *panel)
>  }
>  EXPORT_SYMBOL(drm_panel_unprepare);
>  
> +/**
> + * drm_panel_unprepare_power - power off a panel
> + * @panel: DRM panel
> + *
> + * Calling this function will completely power off a panel (assert the panel's
> + * reset, turn off power supplies, ...). After this function has completed, it
> + * is usually no longer possible to communicate with the panel until another
> + * call to drm_panel_prepare_power and drm_panel_prepare().
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_unprepare_power(struct drm_panel *panel)
> +{
> +	if (panel && panel->funcs && panel->funcs->unprepare_power)
> +		return panel->funcs->unprepare_power(panel);
> +
> +	return panel ? -ENOSYS : -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_panel_unprepare_power);
> +
>  /**
>   * drm_panel_enable - enable a panel
>   * @panel: DRM panel
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 2195daa289d2..cc94c9da47d8 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -892,6 +892,8 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>  						   struct drm_panel *panel,
>  						   u32 connector_type);
>  struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
> +int panel_bridge_prepare_power(struct drm_bridge *bridge);
> +int panel_bridge_unprepare_power(struct drm_bridge *bridge);
>  #endif
>  
>  #endif
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 33605c3f0eba..48e83712ad44 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -68,6 +68,13 @@ enum drm_panel_orientation;
>   * functionality to enable/disable backlight.
>   */
>  struct drm_panel_funcs {
> +	/**
> +	 * @prepare_power:
> +	 *
> +	 * Turn on panel power.
> +	 */
> +	int (*prepare_power)(struct drm_panel *panel);
> +
>  	/**
>  	 * @prepare:
>  	 *
> @@ -115,6 +122,13 @@ struct drm_panel_funcs {
>  	int (*get_modes)(struct drm_panel *panel,
>  			 struct drm_connector *connector);
>  
> +	/**
> +	 * @unprepare_power:
> +	 *
> +	 * Turn off panel_power.
> +	 */
> +	int (*unprepare_power)(struct drm_panel *panel);
> +
>  	/**
>  	 * @get_timings:
>  	 *
> @@ -180,6 +194,9 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
>  void drm_panel_add(struct drm_panel *panel);
>  void drm_panel_remove(struct drm_panel *panel);
>  
> +int drm_panel_prepare_power(struct drm_panel *panel);
> +int drm_panel_unprepare_power(struct drm_panel *panel);
> +
>  int drm_panel_prepare(struct drm_panel *panel);
>  int drm_panel_unprepare(struct drm_panel *panel);
>  
> -- 
> 2.25.1

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

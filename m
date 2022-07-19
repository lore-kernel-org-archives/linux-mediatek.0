Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45691C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 14:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8sLlbZKcYVwqChBzOR8a7SbN4VOIEkVLaJpmGxf1u8=; b=joqw2L8wptDaXNmvZTrzkuD3rA
	c3312eEyk1K7lwFotALycM+M6ALMsRCGgyuuJ8lRHX5ziycGuMhuAMzwEnoY0FbkC+Ho6jh+ycaUh
	9or02NX9H+lA3SPJg5RZqPJ50RRGO1AjOSAqC4yebZZPOH07ry7qUXLJJB6DtgCpuD6xzwurFwLM2
	0wbVxTj/37fpoAHA++sDBUoEfqa1qJsMMkMEDSXuc6NmQPdBMt8SZYDuwzTSzWcM4bIk4fzP08enj
	qRVt2B61KVdeZnhiGpTv8KmU2eP7vUQ0qeGH+JQc2gTavubTpex1OO+bK/NPSiKWYcwNlY6FHQibU
	BSd54fHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnuw-009W30-Mw; Tue, 19 Jul 2022 14:09:42 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnuY-009VqN-La
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 14:09:20 +0000
Received: by mail-ej1-x631.google.com with SMTP id mf4so27422123ejc.3
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 07:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u8sLlbZKcYVwqChBzOR8a7SbN4VOIEkVLaJpmGxf1u8=;
        b=S4sSw4dPG9SoIscVCdBbw23gLQXegfD1TkIApRxUyVaz4Lk+4tqsgVjhX7TOzjd6Is
         /5DnmmmSvRPYTOQnlVzVSdPc/EEPWSixLP80fWE5TRy0sVDHHSidsaUXEDv3dmwvt19n
         wDF6u4wZBZskt7/AQ8kG+73zWr1KFlEQDV/t6r2v/SU5fpBxDgQzRwbhLqatihkNuoQ5
         TreVDvedfrbpmBjJNp8iihxBQWHqaqEFPuBJvNjcZAw/gisZ5vXx5VZESnFkLl2GOCNL
         T8QFk5vB1DXMLTK3C2tSP8Lfs+f5/nSrsh+72N8UWxmFfb4/FrAr/QrEi6e+kV9vpiB6
         mHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u8sLlbZKcYVwqChBzOR8a7SbN4VOIEkVLaJpmGxf1u8=;
        b=3ODhUDyNNvZq8PuPuKHMt7XzEh+c9fqWUjzx/EmxAju2xidXPbn09fGCo5hT6TrGS0
         7M5yGpB3BSP03u+lhk+zf3R7eo1GHJHNpMjizwpjaI02Awl2TvkqQdmLmzid5R0Hyuf7
         Ee9AkrAIHHOowo6bfGE4IOS9R51n6Nr6kCke1j+SO2NwFjVXtzBtEeK3uvNoI+hnM0ip
         /f9pqRk6m+BBxvCoykdyvxiclHs5XhDANHDX6Xkru5FOKfaCYqXra3KW263U8VN8sVA6
         hGop5BmAPYQjbucipbd5zMmnFf8ZjeVZHS2Eew87TnKHzoShXuIo133J9kkqsEQmnGgK
         0Glw==
X-Gm-Message-State: AJIora+DbZZ0ICGKMKxf5yfKqcsDR8BKm/0yjaK+l9E/lXIv90n5ydzg
	2/1vz88zQHJm1Bk6evdXJcHoNlrstzJvKhjd9K4RXQ==
X-Google-Smtp-Source: AGRyM1udjkXGNICxc5l46Ad38az3eGQyrcMk/c2xHDg4URlYogp6zX3h1ScYex5vj2vhyr7QFOwl7+d/nHFljbt8Hdw=
X-Received: by 2002:a17:906:5a67:b0:72b:610d:4aa4 with SMTP id
 my39-20020a1709065a6700b0072b610d4aa4mr31450934ejc.294.1658239754935; Tue, 19
 Jul 2022 07:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717174454.46616-8-sam@ravnborg.org>
In-Reply-To: <20220717174454.46616-8-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 15:08:58 +0100
Message-ID: <CAPY8ntCk=q1n+bCwJdv5MXbAc8PeRUUrwZ352BW_Ax6d550GKg@mail.gmail.com>
Subject: Re: [PATCH v1 07/12] drm/bridge: tc358767: Use drm_bridge_funcs.atomic_check
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, David Airlie <airlied@linux.ie>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Philip Chen <philipchen@chromium.org>, linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Cai Huoqing <cai.huoqing@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_070918_920663_63050A6D 
X-CRM114-Status: GOOD (  18.70  )
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

On Sun, 17 Jul 2022 at 18:45, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> When atomic_check() is defined, then mode_fixup() is ignored,
> so it had no effect that drm_bridge_funcs.mode_fixup was assigned.
> Embed the original implementation in the caller and drop the function.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

(There was a point when drm_bridge_chain_mode_fixup still existed, but
that's gone/going now).

> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 02bd757a8987..b2ab967504af 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1496,26 +1496,18 @@ tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
>                 dev_err(tc->dev, "main link disable error: %d\n", ret);
>  }
>
> -static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
> -                                const struct drm_display_mode *mode,
> -                                struct drm_display_mode *adj)
> -{
> -       /* Fixup sync polarities, both hsync and vsync are active low */
> -       adj->flags = mode->flags;
> -       adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> -       adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> -
> -       return true;
> -}
> -
>  static int tc_common_atomic_check(struct drm_bridge *bridge,
>                                   struct drm_bridge_state *bridge_state,
>                                   struct drm_crtc_state *crtc_state,
>                                   struct drm_connector_state *conn_state,
>                                   const unsigned int max_khz)
>  {
> -       tc_bridge_mode_fixup(bridge, &crtc_state->mode,
> -                            &crtc_state->adjusted_mode);
> +       struct drm_display_mode *adj = &crtc_state->adjusted_mode;
> +
> +       /* Fixup sync polarities, both hsync and vsync are active low */
> +       adj->flags = crtc_state->mode.flags;
> +       adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +       adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>
>         if (crtc_state->adjusted_mode.clock > max_khz)
>                 return -EINVAL;
> @@ -1783,7 +1775,6 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
>         .atomic_check = tc_edp_atomic_check,
>         .atomic_enable = tc_edp_bridge_atomic_enable,
>         .atomic_disable = tc_edp_bridge_atomic_disable,
> -       .mode_fixup = tc_bridge_mode_fixup,
>         .detect = tc_bridge_detect,
>         .get_edid = tc_get_edid,
>         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> --
> 2.34.1
>


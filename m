Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920FDC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 14:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsrPg7hNziGYnKEMeRo9/Xmgr6YPnnv44viQ9ITtKBs=; b=yQqUUnchkne1xgRHxYaKaEuFqF
	D1j6sll/mefGEkyH+yv82bE4hYYeyc3ovrupIsYGh/AmYcmtkNPa8opXZ/RJFxDxqFoeveAD1szlV
	vcMCmGghdrtfY9NhDknIDkLJRZYu7c4wLtXj7WGkOE2TwUSIuXYWMU5E5/pRxJcYcOmZvi2NfwBOL
	ul3K+ubSXxMLcOCoSGbomyaNNdIdlbIlxNSC33mxr0erPCE80b0Sjq3noTUtET+H4wZSZQFFAOdX6
	juvdg9hnvdFQjOv9e6sVtvlGjSDNFO9dwxeLboOwzOyT+e91BSW8KF9xE2OVF1JfHL9dsuuULZZUz
	q/foXpSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnpZ-009Tix-RG; Tue, 19 Jul 2022 14:04:09 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnpT-009TbW-Mi
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 14:04:07 +0000
Received: by mail-ej1-x635.google.com with SMTP id va17so27447424ejb.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 07:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rsrPg7hNziGYnKEMeRo9/Xmgr6YPnnv44viQ9ITtKBs=;
        b=hcrWa6vWZpuZeT/weDaTEGbN3DEpdRro7xoVb4o+uwLjgB56NzRAi9aBxJOiXo46i8
         GuWJcq1fTmIxp/+3QbJwr6o2ybN7NhTGX3XkgM6ytZnIjW4ACTOWHNjnCqzUDkI2Dh4b
         C+f5LKxSjA1g5Kv2ajS/hMk7Bw85wXsXPtZyyBcvlerTzUzmGSvhv4HsmNZHCzS95Npr
         4J5L862bdMERC4am/H8+8cfLIM2mPz8PcOSQB6wsAZXXkHiNOIEpL1lNjDmVojXCA6rH
         SnL1eqoIwEphGJ1he9YKX+meZw8/YjBICdb5/EPQyamTZIiJ7v/TLgrFLjO9Sz/jZb5S
         n1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rsrPg7hNziGYnKEMeRo9/Xmgr6YPnnv44viQ9ITtKBs=;
        b=YV/ctJgHm5wNDWH388s/a4NqelnmiyYposMQATZTSJ51BnvxRul8/YqtUNJX6Tfc9O
         DP0ZC5q3fwRmaUG7bGWbflbQhTwDFlO2E4IeodykqQWPrzwxiC1iYvTAxt2qKlv4iAVJ
         NzYgAu1qaZw4EMXPd4lCwXbwdB8JTehqIoSMmbAIzVDpQJ1mDmpT2spKN0kHYTru/dgh
         O3mP5wFlZadqLttqoKP0p9pbYukr1ZKjVc5lbHhXa/q/YXQejUYE9CXZlTi1/2HoyZj+
         8pIGKVhSi5/EGR1AxEe62u6W+5C9+MC7HK+j6LSODyXcggzhoPdrb2PsptMh1HbqdEay
         ssdg==
X-Gm-Message-State: AJIora/CSScJ8U8nKN8XvznXWXm34Fi2ZwoW6fkQpF7cLspnRfhIUhkW
	9xLdb0Kx8sPoOYkpLn/J+DmVTsl/G25iEwL7zQVOow==
X-Google-Smtp-Source: AGRyM1usGvb/5X/2EHmga3QTDIzhjHhcpsEt1FiyvphTnQ1PPKWozSvoBeBm+WGVDP7skJ/Yhj3i8y0QB3PUqHMHIA4=
X-Received: by 2002:a17:906:5a67:b0:72b:610d:4aa4 with SMTP id
 my39-20020a1709065a6700b0072b610d4aa4mr31426400ejc.294.1658239436732; Tue, 19
 Jul 2022 07:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717174454.46616-7-sam@ravnborg.org>
In-Reply-To: <20220717174454.46616-7-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 15:03:40 +0100
Message-ID: <CAPY8ntAUS0GMik2=PGeg8209yWjqUxmWV8az=YQczkE-tAw0XQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/12] drm/bridge: cros-ec-anx7688: Use drm_bridge_funcs.atomic_check
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
X-CRM114-CacheID: sfid-20220719_070403_756033_12E8C8FE 
X-CRM114-Status: GOOD (  19.80  )
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
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
>
> drm_bridge_funcs.atomic_check() requires the atomic state operations,
> update these to the default implementations.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: chrome-platform@lists.linux.dev
> ---
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c | 28 +++++++++++++++---------
>  1 file changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> index 0f6d907432e3..fc19ea87926f 100644
> --- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> +++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> @@ -5,6 +5,7 @@
>   * Copyright 2020 Google LLC
>   */
>
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_print.h>
>  #include <linux/i2c.h>
> @@ -45,9 +46,10 @@ bridge_to_cros_ec_anx7688(struct drm_bridge *bridge)
>         return container_of(bridge, struct cros_ec_anx7688, bridge);
>  }
>
> -static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
> -                                             const struct drm_display_mode *mode,
> -                                             struct drm_display_mode *adjusted_mode)
> +static int cros_ec_anx7688_bridge_atomic_check(struct drm_bridge *bridge,
> +                                              struct drm_bridge_state *bridge_state,
> +                                              struct drm_crtc_state *crtc_state,
> +                                              struct drm_connector_state *conn_state)
>  {
>         struct cros_ec_anx7688 *anx = bridge_to_cros_ec_anx7688(bridge);
>         int totalbw, requiredbw;
> @@ -56,13 +58,13 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
>         int ret;
>
>         if (!anx->filter)
> -               return true;
> +               return 0;
>
>         /* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
>         ret = regmap_bulk_read(anx->regmap, ANX7688_DP_BANDWIDTH_REG, regs, 2);
>         if (ret < 0) {
>                 DRM_ERROR("Failed to read bandwidth/lane count\n");
> -               return false;
> +               return ret;
>         }
>         dpbw = regs[0];
>         lanecount = regs[1];
> @@ -71,28 +73,34 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
>         if (dpbw > 0x19 || lanecount > 2) {
>                 DRM_ERROR("Invalid bandwidth/lane count (%02x/%d)\n", dpbw,
>                           lanecount);
> -               return false;
> +               return -EINVAL;
>         }
>
>         /* Compute available bandwidth (kHz) */
>         totalbw = dpbw * lanecount * 270000 * 8 / 10;
>
>         /* Required bandwidth (8 bpc, kHz) */
> -       requiredbw = mode->clock * 8 * 3;
> +       requiredbw = crtc_state->mode.clock * 8 * 3;
>
>         DRM_DEBUG_KMS("DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
>                       totalbw, dpbw, lanecount, requiredbw);
>
>         if (totalbw == 0) {
>                 DRM_ERROR("Bandwidth/lane count are 0, not rejecting modes\n");
> -               return true;
> +               return 0;
>         }
>
> -       return totalbw >= requiredbw;
> +       if (totalbw < requiredbw)
> +               return -EINVAL;
> +
> +       return 0;
>  }
>
>  static const struct drm_bridge_funcs cros_ec_anx7688_bridge_funcs = {
> -       .mode_fixup = cros_ec_anx7688_bridge_mode_fixup,
> +       .atomic_check = cros_ec_anx7688_bridge_atomic_check,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>
>  static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
> --
> 2.34.1
>


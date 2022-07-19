Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6C5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OD3NNQx/dnqD+0Cs+fXr4LXV6Ye4MYxeJ4nPZD4GszE=; b=b3q4Y8onYO8v8aT66upHkQAup2
	o4H4QFRdpGqrscGL5dlJl6rsyWKsFpXR2DBLIAP6Qp4c8mg1I/Wq33DCuUd4AoRllE7M37U4bcCYU
	UnDHbbRBFLDLL6uPlX76lcJXDGkQ9eiSH5C/r5gT42M9CvNBgqsc3NdX+fORlc0DuhyIs0yFih9c3
	DjlwAb2nSFw1uUI+0u/wTm2Ntjg6tWoiJ+pAKkn419VP6aj/bYG1wn4kt4v/s9/Sf/pQT/5p8aDpL
	4GPhJTXAVz7u1acjotDEHog4UNp9k6Fi+TpcoxCe6v5+kGrmB8vkVgFcfxcMlszMqHQsBSZKgYdBz
	U3fhHgIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnlk-009SF0-Ah; Tue, 19 Jul 2022 14:00:12 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnlh-009SAF-V8
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 14:00:11 +0000
Received: by mail-ej1-x62f.google.com with SMTP id b11so27311752eju.10
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 07:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OD3NNQx/dnqD+0Cs+fXr4LXV6Ye4MYxeJ4nPZD4GszE=;
        b=KRbPahA4lFzwgk1dPu0dYjc5HI3Y+D0dxd62DcPU4ogSQZ64caMPwZVzbpx73J5Kc1
         eaEMkOYtMeTIYH6d3tYbTI31Zpk6YPeEHme+XqB6TB9vweuaBCzadZE54jjqEcIAS/Jf
         pzYTNENzXg+3E79ccZwG+0AO9oqg2VDxVgFkHvRNiXy7aIvjIH3seHu/ncpcbTZ7PS82
         gV4Uc4P8NeQN5INx5ZzZSJl5OpV/PcFLmN2hPWUojY2geEaue3bSrIyK7NibMwK9pdcK
         O1jLIZnNHFsb8ssyIcISmoy2tFgywNjOo7bd37jOZ8uS76xPibNCxglV/JSG62NQzbUF
         B9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OD3NNQx/dnqD+0Cs+fXr4LXV6Ye4MYxeJ4nPZD4GszE=;
        b=v/jRUhpKKAoRzT5JtOdt8txBH5kMXDBrQAbYqyZJh+O01By/hnY0Ww7aF+uakY73lj
         Rzep0AUtSKjb+8kmyCvDznnsZrYFcezEzU5e5W10JgieMLOHxKvfi5p0bhNWdrX2H6ma
         NTCrTAGMgA3CXkAU8lJr8t3+DvlB5HOuoALBD/UCMR+dJwnWPs8Nt4l3lhNNoH0X4cDY
         n+03dtl1OhsDjx0TemXpjkveoqmS07GvPIsnfUyG7V/F71wcFrQk+JydQk5QLsU6PLHC
         FnF1Nm20p98DJOxovogpwZynKBvFpAY0Ufp0VhRDFociBtOOIp7zThoKd5EDF4Ozrnf3
         +oaA==
X-Gm-Message-State: AJIora/MUDyeMgQuKm8gT5PIqD6RDipmlLIt8DDCT5Jj2C1mWR46ka24
	9x4+Aq1QeaID0yhvx2g1Ep5sd8cAmGANZa3LVgRzyA==
X-Google-Smtp-Source: AGRyM1tWkD5ndkU51YMn3Zy/3SBBUnKXW/elXPy0MwiGbgYk7yLn606w46OmkL1nPHs9nxQiSkrrhnOhpxFcOHfz/3U=
X-Received: by 2002:a17:907:d92:b0:72e:e94d:b675 with SMTP id
 go18-20020a1709070d9200b0072ee94db675mr21493011ejc.742.1658239204549; Tue, 19
 Jul 2022 07:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717174454.46616-6-sam@ravnborg.org>
In-Reply-To: <20220717174454.46616-6-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 14:59:48 +0100
Message-ID: <CAPY8ntAALp=vtofLjKjEjH89k_fGtLWv9b4L=7fmFZr9+Dd6jg@mail.gmail.com>
Subject: Re: [PATCH v1 05/12] drm/bridge: sii8620: Use drm_bridge_funcs.atomic_check
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
X-CRM114-CacheID: sfid-20220719_070010_009550_BD2CDE0F 
X-CRM114-Status: GOOD (  17.87  )
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
> ---
>  drivers/gpu/drm/bridge/sil-sii8620.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> index ab0bce4a988c..b6e5c285c8ea 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -8,6 +8,7 @@
>
>  #include <asm/unaligned.h>
>
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/bridge/mhl.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> @@ -2262,26 +2263,30 @@ static enum drm_mode_status sii8620_mode_valid(struct drm_bridge *bridge,
>         }
>  }
>
> -static bool sii8620_mode_fixup(struct drm_bridge *bridge,
> -                              const struct drm_display_mode *mode,
> -                              struct drm_display_mode *adjusted_mode)
> +static int sii8620_atomic_check(struct drm_bridge *bridge,
> +                               struct drm_bridge_state *bridge_state,
> +                               struct drm_crtc_state *crtc_state,
> +                               struct drm_connector_state *conn_state)
>  {
>         struct sii8620 *ctx = bridge_to_sii8620(bridge);
>
>         mutex_lock(&ctx->lock);
>
> -       ctx->use_packed_pixel = sii8620_is_packing_required(ctx, adjusted_mode);
> +       ctx->use_packed_pixel = sii8620_is_packing_required(ctx, &crtc_state->adjusted_mode);
>
>         mutex_unlock(&ctx->lock);
>
> -       return true;
> +       return 0;
>  }
>
>  static const struct drm_bridge_funcs sii8620_bridge_funcs = {
>         .attach = sii8620_attach,
>         .detach = sii8620_detach,
> -       .mode_fixup = sii8620_mode_fixup,
> +       .atomic_check = sii8620_atomic_check,
>         .mode_valid = sii8620_mode_valid,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>
>  static int sii8620_probe(struct i2c_client *client,
> --
> 2.34.1
>


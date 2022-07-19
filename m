Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E046BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnWAYtgDrYhGZC/PZ1B5ZCm3OmGHZOVctKEIlU+z6rI=; b=DXO35uPck5eDn4lP84kwwV+d7A
	LP47e4aK4AeTHuyB8WWDH32IrgywrgU7jC+UCIGaYxYy+gPELMBUIowE1CQ6IAPWgH1NzwWb9HX/H
	zSh8hTbdf/aWZyrKhoWC/u5vyWmiY+Zp/ppQN9dLAiM3LzDc2O5AGy3HJVn8Z3piZhjn3f/MrI+R9
	bcRgoCsTYYOV7W9qrvF1+W5cLQRsMoSmGq+wbEmqm1OILxBEgE7ETYpSRmO9hgm7Dibz2ZkhWLCYp
	d5nJ6vDf24lQ70xb463z46CKqXfvSmfrYMjMuNB8Pg6vwVHNF8Dz681dUm+w42TcSJZuRawrTpQ0L
	Baa4rhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnx9-009Xde-3R; Tue, 19 Jul 2022 14:11:59 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnx4-009XY8-FM
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 14:11:56 +0000
Received: by mail-ed1-x530.google.com with SMTP id w12so19729491edd.13
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 07:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RnWAYtgDrYhGZC/PZ1B5ZCm3OmGHZOVctKEIlU+z6rI=;
        b=PpOMFXjn4g8lzVw5rHY4cup+bAESdluj4/3YOF7f+Nf6pVaKQIAOCl03o9pc+ycEg8
         JzGF5OksPZHIYo8KnyZYmZrW0WECIAz29OUSWAxfSBkt+qSOGEMeFW+lYpOJ57/DLLk7
         PYdg8BrOQbM/KkKhw1ljgw+DJ9JyqPEhrGlv2s2Xvji0jloqJWQx744c24n/HazvLKzM
         WP4RxGlwmQKNkwOHSxdqcVxD+OllnYAgIwd9FtDOhTQtG2CjkBm7BK7nWEWdcovEANB6
         3gYZHINxB0I37Oya/rNkBvm7c6jRL+syTFjrov0FBNiRiOJ7LGx5YQEWJkrCKPAmY03h
         pSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RnWAYtgDrYhGZC/PZ1B5ZCm3OmGHZOVctKEIlU+z6rI=;
        b=7a245gbM0R1fxMnVk9hVxJaraimBgMGcAe6LCVQgZny+PbPutmIKr3Yy7Sdy2DUjxZ
         9KQ1h15hM7OgFK/I1yk56phk9bLrANF3DBd/mgzDmb4huTALn8mAM3y+vE28GtSrnKuB
         2qCZqYYvCwdivQ0jddOkqlGf+hoCf4W/Btc90rNatiTo1C5Vn/uJEpXArEgPgMIV3G6p
         ga5jV4/v/O3uS1TR4YGj5J6s3R2D43x+PV9uu107NfHgaTazcQveOwsg7VvZxgaUKVLn
         G5wjgOlfQM9CfAcvrIVzY3hGni35SmXNb5OySpqfy8SblZdh4LciGL9G9rqASnAffO1Y
         iIPw==
X-Gm-Message-State: AJIora9h1Yxv6SxNB/e2QSqwsn/lr0bA+csz4I3fg7bP0BFYc1k6O3YH
	a8ow/tJ68J+8KerRZtBAbpsSAPRGD3ogoR0CoTXlaQ==
X-Google-Smtp-Source: AGRyM1u8NJW8Er8LUi8nkjhRDlt2K9GTp5JSpALaf1s7vzpZ3L6Y6cv9xNTWc9xabCNHNsVc63LyB1SwXY5mz2IiJeg=
X-Received: by 2002:a05:6402:42d3:b0:435:2c49:313d with SMTP id
 i19-20020a05640242d300b004352c49313dmr43193671edc.86.1658239910831; Tue, 19
 Jul 2022 07:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-2-sam@ravnborg.org>
In-Reply-To: <20220717175801.78668-2-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 15:11:34 +0100
Message-ID: <CAPY8ntDMPG3GxP3kuTi74DXMFCAYbh7AY3ZhWSWG1MFYjBdr0A@mail.gmail.com>
Subject: Re: [PATCH v1 09/12] drm/rcar-du: lvds: Use drm_bridge_funcs.atomic_check
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
X-CRM114-CacheID: sfid-20220719_071154_564668_FFE5FE51 
X-CRM114-Status: GOOD (  18.46  )
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

On Sun, 17 Jul 2022 at 18:58, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
> The driver implements the state operations, so no other changes
> are required for the replacement.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 830aac0a2cb4..c4adbcede090 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -554,10 +554,12 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>         clk_disable_unprepare(lvds->clocks.mod);
>  }
>
> -static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
> -                                const struct drm_display_mode *mode,
> -                                struct drm_display_mode *adjusted_mode)
> +static int rcar_lvds_atomic_check(struct drm_bridge *bridge,
> +                                 struct drm_bridge_state *bridge_state,
> +                                 struct drm_crtc_state *crtc_state,
> +                                 struct drm_connector_state *conn_state)
>  {
> +       struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>         struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>         int min_freq;
>
> @@ -569,7 +571,7 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
>         min_freq = lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL ? 5000 : 31000;
>         adjusted_mode->clock = clamp(adjusted_mode->clock, min_freq, 148500);
>
> -       return true;
> +       return 0;
>  }
>
>  static int rcar_lvds_attach(struct drm_bridge *bridge,
> @@ -591,7 +593,7 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
>         .atomic_reset = drm_atomic_helper_bridge_reset,
>         .atomic_enable = rcar_lvds_atomic_enable,
>         .atomic_disable = rcar_lvds_atomic_disable,
> -       .mode_fixup = rcar_lvds_mode_fixup,
> +       .atomic_check = rcar_lvds_atomic_check,
>  };
>
>  bool rcar_lvds_dual_link(struct drm_bridge *bridge)
> --
> 2.34.1
>


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338B6C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJMDPQ6JxZqQ5e3bQhZhMXmqqZrhAcVL6XK53qf+yZo=; b=YuAju2szka8xJ1s/33bd19u+a6
	gLegGoGaXsbEiE8dbOnOjd1XnLpZCRA+FbBHhFOveu9NqTWsJifehdbd37oGz49s8OSM/hMO79mGu
	X6BtaLGYH3AP3N1+TY8S+Prw7ebjn6HmZYdwnuBk6Lq2YAQ96If9ULKSAaApgPTphT1mdSiQlJqtQ
	yDDDiLDTSEj95IQ1MbSemG1U7fje0osvB/StuoK3VkOsxOuc4Kx+Ylfn53CaQ/9kcYIxqFF0lMk5I
	IGImo1OukQ+zRTiF3attA9KshUvELUADXYzigg1Zh3kKkiKeFTin24X1djRdlXE6usdeQi6rnOMYA
	qdPYusGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnvV-009WP8-Ke; Tue, 19 Jul 2022 14:10:17 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnvB-009WDG-Pf
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 14:09:59 +0000
Received: by mail-ej1-x636.google.com with SMTP id mf4so27426357ejc.3
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vJMDPQ6JxZqQ5e3bQhZhMXmqqZrhAcVL6XK53qf+yZo=;
        b=dF2CF31GTyulq3yHsXUA1vHe2kfxBlnZD2GJKEsvd21wdJODJxisNWK5q2qqnE8jRu
         dVdbJZgJTdqzovcJwW3t3CbaOdfS7JC++7wFa1cueWGgZqoHtEShGi3yiRc+wcJrYe4R
         1LFTz0mj3OE37GgsKHiR2JRreETgNkWJL5b224HFw8FerDiKE6dZ30/Pr4BcZoTpNWO6
         LjMlrr9ctQA+eOUZrwmG9DpU0IgSFYaJsGs4ivXnZeU0dsPshkBt2jV5QpyyshaVtwXy
         CjnkN3P/7C7EvzeYPIrklHPAh3suJ7JUpSe25X3FMsfE1SytE7IEz7Itd2ae7s+4mmvN
         HKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vJMDPQ6JxZqQ5e3bQhZhMXmqqZrhAcVL6XK53qf+yZo=;
        b=XNaTfXooUdgJtVFrt2NUD2HrhASIGlXLUTcpBvNG0iIzwiokTyHndT+Iw+xUM9fWYC
         mgxLzp0pimNQpr6i5HSMVq4NNMlyBCbtpbEgEs82lRN2ZcsjfHaE3UzleejjpzquqUyP
         xpG8K3mw9X5uTPrYK/JhrwOSW1yWQYCEQgK8ShwDeijgQmJ7WjgmaBz4NF14o5C4I6BF
         Cx4FaLA6b0UxqW7ULsgKtLdk10+7StTrIVSb25fwys1mIy1+hz1LBbJpPGDTZhFpMJYH
         fP22nBzkTDy0yfFicfVtk6/R796vAYFzevx7e3kbqfTb8ew3Kegjoi5kq8pmTOV2jsmd
         6y5Q==
X-Gm-Message-State: AJIora+Mc0niYqG2YG28kjIw5nT/qpklfIKrPUG+8RV6ivX6/BAEVWEg
	lGJWJuQ6M+UhJggVQoXMtLIWqj7wJlAH3uJaUjwzsQ==
X-Google-Smtp-Source: AGRyM1vIvrL+ynTCXW9jozSCwBKEDF7zOHgYSDXBTQzuGSuKy/E6HIdmsx6PziOBLoPRrbpWd3BC/TOOutSHeTbYer0=
X-Received: by 2002:a17:907:97c2:b0:72b:9ec4:9a60 with SMTP id
 js2-20020a17090797c200b0072b9ec49a60mr29861218ejc.154.1658239795128; Tue, 19
 Jul 2022 07:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717175801.78668-1-sam@ravnborg.org>
In-Reply-To: <20220717175801.78668-1-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 15:09:38 +0100
Message-ID: <CAPY8ntBVhdixytMMMxAZcnCYf=zCB14RGucgD+hsTrD5RFP_fw@mail.gmail.com>
Subject: Re: [PATCH v1 08/12] drm/mediatek: Drop mtk_hdmi_bridge_mode_fixup
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
X-CRM114-CacheID: sfid-20220719_070957_851458_07EBFAEE 
X-CRM114-Status: GOOD (  17.26  )
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
> The implementation of drm_bridge_funcs.mode_fixup is optional
> so there is no need to provide an empty implementation.
> Drop mtk_hdmi_bridge_mode_fixup() so the driver no longer uses the
> deprecated drm_bridge_funcs.mode_fixup() operation.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index a63b76055f81..7321aa1ee6f0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1293,13 +1293,6 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
>         return 0;
>  }
>
> -static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
> -                                      const struct drm_display_mode *mode,
> -                                      struct drm_display_mode *adjusted_mode)
> -{
> -       return true;
> -}
> -
>  static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>                                            struct drm_bridge_state *old_bridge_state)
>  {
> @@ -1399,7 +1392,6 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
>         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>         .atomic_reset = drm_atomic_helper_bridge_reset,
>         .attach = mtk_hdmi_bridge_attach,
> -       .mode_fixup = mtk_hdmi_bridge_mode_fixup,
>         .atomic_disable = mtk_hdmi_bridge_atomic_disable,
>         .atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
>         .mode_set = mtk_hdmi_bridge_mode_set,
> --
> 2.34.1
>


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CB2CA5FA5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 22:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JArXmWr/mVGoLLKcByjQ5+EXzcvGruMpOpTO8U+lXSI=; b=JXYz1ddfai5w4d7UJ067gCvz67
	AF5mqmp/8JvTcMcbloURGFj7gfEOkqWZympj4I0XqBST/ncpLNaNS0qYZg8NfsatpjY/5Q4caDp6b
	hzbIWaTSq7Jgyn0Oe0gLyDJb5qqMsLUeTYPZBeWzvmzY0zx7IEkJBD1D274WP8y0LNvAyENeitfAD
	HkItm9o8Py92ffEBYRM/8rT+Tfxo7WfVZ03klOuqeATAccRMWh+/ge7YFEU0EcTctBfy/rUFKut3C
	iqQMYLAGS5VqR/Y+RWoBqebncHz1eSOlqwgnodSW2OSHRMJI05K+PfTliYar9P1ffdP4mdQ6GAoIq
	Z0lq6U1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJnc-00000001kPR-1nV3;
	Mon, 28 Sep 2026 22:26:16 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJnZ-00000001kOL-1rIx
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 22:26:14 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b8f333dc2aso1951155e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 15:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790634371; x=1791239171; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JArXmWr/mVGoLLKcByjQ5+EXzcvGruMpOpTO8U+lXSI=;
        b=fih0zIriGAdvyjst6ei3zsf9qKrXHfG+D1FNW3NZCa5FrlIhVhv2/PI+6CKNcojnFa
         /WUwXWSxciBaEWhOlKHlDyiedOxMnEVNok+oyA21KXeu70Gbg0lmR5w9bdI7EcQ8w457
         Vv/g/Ah6qVdV/ycOTdtQaVqoO8CiaWGLIxizI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790634371; x=1791239171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JArXmWr/mVGoLLKcByjQ5+EXzcvGruMpOpTO8U+lXSI=;
        b=X0OrV50nXSUfCVYUv+AOZ6hJljip39qle/Bv8ZHnfq01t9rv40buj9p+XODDWw7ItB
         8X8aY1hnNaD0t2krdc237zqRqC+NX3rXie8Hdf//bJMWurceYI4b/9Ez7WcY9glbqZ+z
         rv8wlc+yixgz8f/Lt6be65IItiAiB9ZSj3tKmC3YZiGTy+PqyieXSEh+cMN83yAJtYIv
         OKke/Tdlh+3VPMq31F+6DJzHF0xTZm1xbYlV7qJKVH1AuJfHiz4vFAq0+d/NOSS4Uj9o
         xHuI0gYXcEfayYpyzKpYwQh5GVWwXwgQtpmaDnT3n6h3bt2v8P3v6uWIkAfI0D/FX6oM
         1WYg==
X-Forwarded-Encrypted: i=1; AKwUvBzeQLn3ffW4IgOja2OppmzYUW8n1YoMTPAiTpkvHNTKdg9+CBFZHXLv/G8UBR5XM85hgt3tIQX8msf+vWkURw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIOcKTgdB9drP2TWuloK7R81gymKk9FfrP1kZA6JYFdoS9AWszh
	B5XYoFMuaT3bBni4p1XNLL2jMN1Faw3Ofzvr7Xv4IC9IvQCscPHf8Rxi5/RPpgYxAilFfB30oVb
	y6U22kQ==
X-Gm-Gg: AYBFou1IDkaeP/nptu8IDUiC9coZpuxCXEiBZ8IgJcP9HznFBHZxw1W1ypmVhm6azmO
	VZmEL+SO7MHzhu1aM4ik+N50MQ/J6wB+SZTegdDAslJzhaLZz7KO131lVdgdjCASF57M2OtFQpc
	GwLDuyB3Vk3/ZBUobhFB7SPw+Geue6g7LwxZv0xXBFJ1huDaCW6fA7BLPJ5zjK13vs38gWLQp7H
	uxcAZa3IbEzT4xQSwgxSndIeyjOiYnh/lx968RgQ00ysZ/PpPjVKdwdd/l1ACyX0RHTF0aOIoVj
	BXW5v2aihn7YVrwM7bbLcudHxxMCyRdL9UE1/vy1B+JzBr0nyEh1PPEld/iGMFT70rvCORVjDgR
	97RmNfZcXdKeqBZsSd7/1VX6lPrWdGvUc8GCBtj8CRf/ilgePqtNz78/wVB68+fP+HSECDHfUae
	uBVpU9oPu/M/i8fdud4+b2JovYRQipM+aQoPzcp0A34kFt0I1ANZlZXB1cnl6EZG7KSfRr9EpIF
	wlW0F607b4cb9DTmORdRBe8WmDxqUUMiJHNaag=
X-Received: by 2002:a05:6512:15a8:b0:5b8:ea21:7baf with SMTP id 2adb3069b0e04-5b8ea217ce2mr3656283e87.58.1790634371051;
        Mon, 28 Sep 2026 15:26:11 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb8514sm859426e87.47.2026.09.28.15.26.10
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 15:26:10 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f333dc2aso1951146e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 15:26:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlSEmdGob+LSRqTwqj7yJSLfRhj2MI/60Bz/GKIH0t4Wzin35oEgrx2LlrvM3n+2Cw312zJoR8cpk1l2oAmA==@lists.infradead.org
X-Received: by 2002:a05:600c:6986:b0:49c:fa21:e73c with SMTP id
 5b1f17b1804b1-49fe66f147bmr235241965e9.18.1790634033791; Mon, 28 Sep 2026
 15:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260928161605.2271412-1-arnd@kernel.org>
In-Reply-To: <20260928161605.2271412-1-arnd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Sep 2026 15:20:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzWmSjWZ96sBYvRLr=EbYqqBZ71o2BqotUsxRf5zqjTg@mail.gmail.com>
X-Gm-Features: AclHuK-sVszmxzKslRXTzUjiQ3wDqpSD15BZhQhdtvRJFSFfPWjQSieqaRkgVN0
Message-ID: <CAD=FV=UzWmSjWZ96sBYvRLr=EbYqqBZ71o2BqotUsxRf5zqjTg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: add missing drm/drm_panel.h inclusions
To: Arnd Bergmann <arnd@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_152613_546885_07B89D4B 
X-CRM114-Status: GOOD (  17.07  )
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

Hi,

On Mon, Sep 28, 2026 at 9:16=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The devm_drm_of_get_bridge() declaration moved to drm_panel.h, but
> not all callers include this, which leads to build failures in
> some configurations:
>
> drivers/gpu/drm/imx/lcdc/imx-lcdc.c: In function 'imx_lcdc_probe':
> drivers/gpu/drm/imx/lcdc/imx-lcdc.c:404:18: error: implicit declaration o=
f function 'devm_drm_of_get_bridge' [-Wimplicit-function-declaration]
>   404 |         bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0, 0=
);
>       |                  ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/verisilicon/vs_bridge.c: In function 'vs_bridge_init':
> drivers/gpu/drm/verisilicon/vs_bridge.c:306:16: error: implicit declarati=
on of function 'devm_drm_of_get_bridge' [-Wimplicit-function-declaration]
>   306 |         next =3D devm_drm_of_get_bridge(drm_dev->dev, drm_dev->de=
v->of_node,
>       |                ^~~~~~~~~~~~~~~~~~~~~~
>
> Include the new header in all files that need it.
>
> Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

[ ... ]

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index e7f9e6d58927..e50737432071 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -36,6 +36,7 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>
>  #include "drm_crtc_internal.h"

The above one might not be necessary. drm_bridge.c only references
devm_drm_of_get_bridge() in comments.

Other than that, this looks OK to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll assume Luca will apply the fix since he landed aa8a8c7e4641.

-Doug


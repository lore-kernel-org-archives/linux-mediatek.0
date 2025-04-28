Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A90C369DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 21:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HZyp8budJTYWJ9MOmTZnBjDzB8PV0g52ckHb+nyRQs=; b=qEsucmjqlvDCQsPOX5QJXMkFkt
	KVhOl5fCclpI3ZTP+nTNjVzRKHF9HXmmUPNlO3/VbH8V/WbWdQrdYNXeiJciG944KkLy0MKEqvNg6
	FeksBB0PcPe7Kz8etqI03Hy9/UTvNepClEgQocBPyQY8sHsbyNN6fbMgjmb4yzEHhgwRCjrv9LBK7
	/Ug5Wv5/HM8PQYllAlMHZS2gWFk6yNFD4NKz6OvXwQErIpuRsHQOxYwVpqc/r6rBQvPvSBNh4oodH
	Vvw0wg+VOAeaWfM7P7o7qPk0khw4RQ3cxSHMvirVkbZ6m5lErCubbKQW+QeJXTqoZgYFbKzE2w4n5
	zDmwH+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Vbt-00000007XvS-0HFM;
	Mon, 28 Apr 2025 21:01:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VaD-00000007XZr-3Njg
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 21:00:11 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2279915e06eso60182765ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 14:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745874006; x=1746478806; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HZyp8budJTYWJ9MOmTZnBjDzB8PV0g52ckHb+nyRQs=;
        b=FEEKci4KRqR5H4rPxOGUg589xVsXj+IDF5a1f9kMa8hD4b7Nt/QCnoIqtQAnFw6BWg
         3ZC8yCSN3UxbWUuYTpLuA7of83IsTQicBIAi1RBM/S5HnSI0AgGWlX9ydo8GVAE6Do17
         Hw8MknghJoqpoD1YUi3f/HDtk4sphjjyGVi0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874006; x=1746478806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HZyp8budJTYWJ9MOmTZnBjDzB8PV0g52ckHb+nyRQs=;
        b=lsBNbY5D5OUtCTDTV1pLrYydZsAuc+MO1DQTlgknYNNv+aUgVe+qgVdfSPk6kBHloT
         hKVMelITgpadsHM3R85Y6kxHy4CoXKzUB5/0QjgAjNaJFHYZmZw5Rv4Sy3sRR7nwHVzo
         t89zwzczuMBcmQ4WbTM0n+XvyudTB3ymaLQX/3RpNaWm9BrNEnwQ/v1tz1fRSluTt4eA
         7cW8CBiwAWMf/nxBM95uYlVNFShNRGQYq72bKVRkkYGKhl/oSp+LXceu97NUXJGDNexo
         gF5NpT5GLMI2wriFwejZLqEQxAqTDp32UEuxqgqUl+ty0fKSqnrHwFCfO+5+KCAhF00f
         OWlw==
X-Forwarded-Encrypted: i=1; AJvYcCW87bfeWEfaI22UCv0GsLEe0+O5vLbYjsGeY/atq1e4Z1HZKoCfBQdBe0fkk+ABJrjO95eOX6AI8lwiWcQ0Rg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0wv0YZ+hoejEUITmVthBBQNHiUhCqJJr6fBQ19QHtHlymK111
	ME8oYnNF5saytTKGBqiAhLYitY+kkHvWGZTpqJbwCRr6cCE137XCenVwyeCxrwmYhNmyyf1GSPs
	=
X-Gm-Gg: ASbGncvBgmqa4wGig13kJqWAPPv9trX4Fs001YZfR38+Pr9bmLdXhSxvwZjWupNWA/E
	8n72SPHcOQzwa2adJ/WafDw5ZqBnzhhcX3sqGeurE/vv6YwFgh25iOnFEEtPE0VGvtrGgjZnKxZ
	YludMJgt7G2MkvZ0j7ro7YSDL81o6dsYxY0kBYhCTHImAdlJ5iNOEhqe4dHJ1ifKCOtgmGTmJnn
	Nw0HJKsNOykzv6W6pQd3gnLD7vQBDyA7qLfR2E25NbXMsdljhUntjWFakyc+ljymE+g1a56/w3G
	UMghRuwcNVZJObpOVvrPISy/SVdzUf56wGdWun5unwWsfWytUbMZC6E6WYGecw+rlG/RrqIrbQO
	WPVS2
X-Google-Smtp-Source: AGHT+IFI8rHpJvP1Bp2KbgsmkJ790w1sKWpmBzQh7Y8PuwnK4rsFh/dMCl3Sgf9uoukObkCRXK7EhA==
X-Received: by 2002:a17:902:f708:b0:224:1074:6393 with SMTP id d9443c01a7336-22dc6a87a2emr181369735ad.43.1745874006289;
        Mon, 28 Apr 2025 14:00:06 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76e16sm87649755ad.44.2025.04.28.14.00.02
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:00:02 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3081f72c271so4996340a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 14:00:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3qvERwB2Jn48UjZAP0mnZH9XD2wSZ7OarGmBEjOYDHHECNFU/ouPR6g5ls8zM0VIy+q68kX3fF6Y2W+zACA==@lists.infradead.org
X-Received: by 2002:a17:90b:2e03:b0:2fa:1a23:c01d with SMTP id
 98e67ed59e1d1-30a0132e771mr15291417a91.21.1745874002058; Mon, 28 Apr 2025
 14:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:59:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
X-Gm-Features: ATxdqUFp3e4vRAA9U9jS3-gUD9FhwChMaNCvlfej-PAqltrXksVDq12UxaUaXqM
Message-ID: <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Christoph Fritz <chf.fritz@googlemail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_140009_867971_24067481 
X-CRM114-Status: GOOD (  18.58  )
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

On Thu, Apr 24, 2025 at 11:59=E2=80=AFAM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> devm_drm_bridge_alloc() is the new API to be used for allocating (and
> partially initializing) a private driver struct embedding a struct
> drm_bridge.
>
> For many drivers having a simple code flow in the probe function, this
> commit does a mass conversion automatically with the following semantic
> patch. The changes have been reviewed manually for correctness as well as
> to find any false positives.
>
>   @@
>   type T;
>   identifier C;
>   identifier BR;
>   expression DEV;
>   expression FUNCS;
>   @@
>   -T *C;
>   +T *C;
>    ...
>   (
>   -C =3D devm_kzalloc(DEV, ...);
>   -if (!C)
>   -    return -ENOMEM;
>   +C =3D devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>   +if (IS_ERR(C))
>   +     return PTR_ERR(C);
>   |
>   -C =3D devm_kzalloc(DEV, ...);
>   -if (!C)
>   -    return ERR_PTR(-ENOMEM);
>   +C =3D devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>   +if (IS_ERR(C))
>   +     return PTR_ERR(C);
>   )
>    ...
>   -C->BR.funcs =3D FUNCS;
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Adrien Grassein <adrien.grassein@gmail.com>
> Cc: Aleksandr Mishin <amishin@t-argos.ru>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Christoph Fritz <chf.fritz@googlemail.com>
> Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Cc: Detlev Casanova <detlev.casanova@collabora.com>
> Cc: Dharma Balasubiramani <dharma.b@microchip.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Janne Grunau <j@jannau.net>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Jesse Van Gavere <jesseevg@gmail.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Phong LE <ple@baylibre.com>
> Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Cc: Sugar Zhang <sugar.zhang@rock-chips.com>
> Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: Vitalii Mordan <mordan@ispras.ru>
>
> Changed in v2:
> - added missing PTR_ERR() in the second spatch alternative
> ---
>  drivers/gpu/drm/adp/adp-mipi.c                      |  8 ++++----
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c        |  9 ++++-----
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c  |  9 ++++-----
>  drivers/gpu/drm/bridge/aux-bridge.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c             |  9 +++++----
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  8 ++++----
>  drivers/gpu/drm/bridge/chipone-icn6211.c            |  9 ++++-----
>  drivers/gpu/drm/bridge/chrontel-ch7033.c            |  8 ++++----
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c            |  9 ++++-----
>  drivers/gpu/drm/bridge/fsl-ldb.c                    |  7 +++----
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c      |  9 ++++-----
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        | 10 ++++------
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  8 ++++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |  8 ++++----
>  drivers/gpu/drm/bridge/ite-it6263.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/ite-it6505.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/ite-it66121.c                |  9 ++++-----
>  drivers/gpu/drm/bridge/lontium-lt8912b.c            |  9 ++++-----
>  drivers/gpu/drm/bridge/lontium-lt9211.c             |  8 +++-----
>  drivers/gpu/drm/bridge/lontium-lt9611.c             |  9 ++++-----
>  drivers/gpu/drm/bridge/lvds-codec.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/microchip-lvds.c             |  8 ++++----
>  drivers/gpu/drm/bridge/nwl-dsi.c                    |  8 ++++----
>  drivers/gpu/drm/bridge/parade-ps8622.c              |  9 ++++-----
>  drivers/gpu/drm/bridge/parade-ps8640.c              |  9 ++++-----
>  drivers/gpu/drm/bridge/sii9234.c                    |  9 ++++-----
>  drivers/gpu/drm/bridge/sil-sii8620.c                |  9 ++++-----
>  drivers/gpu/drm/bridge/simple-bridge.c              | 10 ++++------
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  8 ++++----
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c       |  8 ++++----
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c      |  8 ++++----
>  drivers/gpu/drm/bridge/tc358762.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/tc358764.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/tc358768.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/tc358775.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/thc63lvd1024.c               |  8 ++++----
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                |  9 ++++-----
>  drivers/gpu/drm/bridge/ti-tdp158.c                  |  8 ++++----
>  drivers/gpu/drm/bridge/ti-tfp410.c                  |  9 ++++-----
>  drivers/gpu/drm/bridge/ti-tpd12s015.c               |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_dp.c                   |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_dpi.c                  |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_dsi.c                  |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  9 ++++-----
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c          | 12 ++++++------
>  drivers/gpu/drm/meson/meson_encoder_dsi.c           | 12 ++++++------
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c          | 12 ++++++------
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  9 ++++-----
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++------
>  49 files changed, 201 insertions(+), 237 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640


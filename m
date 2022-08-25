Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA20ECAAA2
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 21:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVyA5Z8on1cy579HoV3noOGIo3WqfSZOmskPQryMgtM=; b=BcdORufF3Jtg4JuYMYP8t6NDTi
	vec+047qmz0oNgjTVIrPslxj12uI/wzzUDL7V/rTiaVvGrPpnBmL7zzdCIZ9HUNpIYk7mW2HjM4mE
	WqfpS4dx9xPxWi7jmn9UjsXDt857NV0bVeFzQP9K7i8hKoaonIB24wQX/KpjiXEjGibgwIQBtI8y2
	3U6/UZ6XiC1ekYoiPOFwOp3l3IB3m90REwqvVT81mCplVqdjVKiIaHm2aVECAC5qddF9XpsLthmsC
	jjuze8TuDx7zYYFfUHaLe4gtY8IwcaTB8aMHxEczI4/RLee8IQQcKQFgKXuTFaNgpbBsGe1GvMPJU
	+QIUVjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKNz-003RY2-UP; Thu, 25 Aug 2022 21:27:35 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKNx-003RW2-41; Thu, 25 Aug 2022 21:27:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so3155017wmb.4;
        Thu, 25 Aug 2022 14:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gVyA5Z8on1cy579HoV3noOGIo3WqfSZOmskPQryMgtM=;
        b=eh/92dgXe0iyyY3sIgffq4zQH1CFGZMuz44bFe8eqZHrFui9w/sE6IF5yB6Fdl31m9
         q/giSA6K9TF82r9Z7/3a4lVAFzW09wfSy/165AHuuX16K0vRUPKCGD88QxiQrmNNKFx/
         PNqEaEBMyUErAL98l5VkqMECNhnqLIbgF9x4D6cHJgp36/cUymxzMzQQUJrrxSPR1sbt
         tHiJVRpf39VhrJtrS58T4jfliailuywTFaV0Thv6p9mpo8wn9z+7N1sXsoBeOU89UV5s
         QbzmqMrzJx9P96pqjjVEkAMxG/vEgHLJT3Oq/CqKdjvYxbHH4kMnlj0pz7TUi/E6SNFj
         m1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gVyA5Z8on1cy579HoV3noOGIo3WqfSZOmskPQryMgtM=;
        b=VVV7u+VRTi9kxg6XrgwptQKcIixXLb6jtI30AwjIgtauywAyIhOaSd2u9r1UZh34f7
         7hCoXU2Bpej9TSTp0TWR8d1wkn8P1Xw+r0hDMbCRrf1ANgej+0XAoTP7DVulDHSnkMZS
         1NlfD9xc7ZQlI+U1Aq2KBlPu2yoTK1P9N8runrFmOcY88rR5MaazyJRKcyReu1ihI6dJ
         mc3CPWBCjAzDZt+mw6sD5WxKMdFAL91JKTOx6EOG7RJCC9jymdjwTqHXmFHRE3rg4q+I
         aefuGhV671HYUsUSRO4Y/QvPVdjyDMET542Cv5YbYnkMyt0n4GIMT4KaxryAO7m8Qgft
         qr6A==
X-Gm-Message-State: ACgBeo2B/4r2bgovmh4TKR5EAHdZJa0A1J/ynQWDCjE/JNFc9ZrM4qNS
	J1+XNofzHWi8eYeQQogOj0I=
X-Google-Smtp-Source: AA6agR6cucYg/Du4YLrUO/NU1z88fXBAfmGuIRfE4Qrrqd+tO0lSZk3dovhgHxZZ4bK1jgQbd4MAWw==
X-Received: by 2002:a05:600c:198e:b0:3a5:d4a2:8896 with SMTP id t14-20020a05600c198e00b003a5d4a28896mr8967780wmq.140.1661462851646;
        Thu, 25 Aug 2022 14:27:31 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d6e81000000b0021e8d205705sm242110wrz.51.2022.08.25.14.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:27:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Evan Quan <evan.quan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Russell King <linux@armlinux.org.uk>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] gpu: move from strlcpy with unused retval to strscpy
Date: Thu, 25 Aug 2022 23:27:29 +0200
Message-ID: <22761203.6Emhk5qWAg@kista>
In-Reply-To: <20220818210008.6721-1-wsa+renesas@sang-engineering.com>
References: <20220818210008.6721-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_142733_189954_11913C57 
X-CRM114-Status: GOOD (  11.28  )
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

Dne =C4=8Detrtek, 18. avgust 2022 ob 23:00:07 CEST je Wolfram Sang napisal(=
a):
> Follow the advice of the below link and prefer 'strscpy' in this
> subsystem. Conversion is 1:1 because the return value is not used.
> Generated by a coccinelle script.
>=20
> Link:
> https://lore.kernel.org/r/CAHk-=3DwgfRnXz0W3D37d01q3JFkr_i_uTL=3DV6A6G1oU=
Zcprmk
> nw@mail.gmail.com/ Signed-off-by: Wolfram Sang
> <wsa+renesas@sang-engineering.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/amd/amdgpu/atom.c                   | 2 +-
>  drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c      | 2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 6 +++---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           | 2 +-
>  drivers/gpu/drm/display/drm_dp_helper.c             | 2 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c       | 2 +-
>  drivers/gpu/drm/drm_mipi_dsi.c                      | 2 +-
>  drivers/gpu/drm/i2c/tda998x_drv.c                   | 2 +-
>  drivers/gpu/drm/i915/selftests/i915_perf.c          | 2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c             | 2 +-
>  drivers/gpu/drm/radeon/radeon_atombios.c            | 4 ++--
>  drivers/gpu/drm/radeon/radeon_combios.c             | 4 ++--
>  drivers/gpu/drm/rockchip/inno_hdmi.c                | 2 +-
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c              | 2 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c              | 2 +-
>  15 files changed, 19 insertions(+), 19 deletions(-)





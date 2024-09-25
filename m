Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4122DCCF9E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjGKEXG/YIg5uwQvEVpB+Au2CtHAgTgzoyA92gxhP0w=; b=jNhNPWr+hO66TbXyMTpXtc8MIi
	XkwdPChwj2xoZfqSholvHCv72ldct1c3dGWhQi8wmRbWH9MhE6WZhV6jUARR9EdvxgSAO1ZfMLy67
	WrTQeHwlYfR+siFK4SdFFKQhmZys24TAxMg6t3D3X3wzWf9GW9yjJL/aZQI3dU2t7hnbs4nS49p7Y
	j3O2yb56ELtXu5Wx+mwJgSFMg8mnsT4Xivome/8OdzN2QNjDprLIkaSokopHqTITxPQNAFGl4OSry
	z0EHOaAs83lrBbVn4AKjIgtTdVe1dDQ/qfudnobIdEGw8u2bX6hmJGB8ZvTEUsukf5Jomq3tjkl8W
	mJ4erriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stUF5-00000005wVe-0dlk;
	Wed, 25 Sep 2024 15:47:51 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stUAZ-00000005uxh-2wEa;
	Wed, 25 Sep 2024 15:43:13 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so1143083566b.1;
        Wed, 25 Sep 2024 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727278989; x=1727883789; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjGKEXG/YIg5uwQvEVpB+Au2CtHAgTgzoyA92gxhP0w=;
        b=TzK7F+f+2uvKKLdG9IE22Bw52BRpP+asi0ksK6iKyR6Soqqn2iEZiwcdVSsCL6ENke
         geea0Zrlz2/NOlggYcDipl+9xfthEFbZabz/G4D8foaJImIduZ8Y066EovE00UmI/Y0j
         bbZCMLAOBdp8h6D616XclV7EsAfK8DtxxR4GlyQpoDeUAYPACUcKFsEYqaLyDeSCStJi
         l+ZMLCc+etqe4B47XyqGTqskzV5FU4GUm7nyFKahLFSyAPlH9xTHlib8qpwjV7aHDyLJ
         kej0idIEshypTLlrhcI3vEJsPlMpnYhDCpA/jvv/k21BD2gfYC6DGBPaYy+gT2IHQvX2
         rQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727278989; x=1727883789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjGKEXG/YIg5uwQvEVpB+Au2CtHAgTgzoyA92gxhP0w=;
        b=qKQmI76ErtASed/ZGVh+YYiJCd0RJAI++8hnbAfeFOeVUQM8b01WoDluVenUEEonr5
         sV4rBvnPcETmvzsxdhweK3YwU/jEsWcCdlKBih8wC7y1didDGF4dyfwIsKmBHReUK+I7
         s+tKjuHlfIxkvB+zHMK7W6kTxanDxyoTj9nq1RBuY0k+eojke91RrMZpIffRmCH3YIac
         3Q3fUgSrnoNua1m3LCgHYgyuHDl5s8v+d6OdX4Oajrh4yLUXV/02tMNnvkKxrI9pkeuo
         76uRJiPjBSQFiaRxU3f8lsIt0g/B83Ay8KVbjvHeNxZPMetxQaOkQ/riFixZ06m7Xe2P
         t/ag==
X-Forwarded-Encrypted: i=1; AJvYcCUyEAszzldNNAJkcRpcUPY3sK66REit5uMqdTAdTCnG0izEeSLuS1HGfSakwNS4nQshb0hba5/m+W6AKR8nz/E=@lists.infradead.org, AJvYcCVxGH190jhXjtBVc6ESuhOjdRJ/0nfvdoT6ZeSioCbUr68XwGIYihEJogDlMslyPpKbdphlNstoTP0BD7x6@lists.infradead.org, AJvYcCXV4q1xLRZ1rRGy2dVsL0N4bk7gxZtctGslCyH86b6k0xOtY9DvNQ5p1p9Appq6brNtqSdij6mKjgHtyrsha5ADSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxW16i+l50BZX1MWsAGGabeM8yFSk4LmzS/SdgQGlJNJkDa2o9/
	yg+zhFbD3i0pSlfNq9go6tQTKCaYNg6kf56ygV9UX3t8VYK9m9sdJnpWovIi
X-Google-Smtp-Source: AGHT+IGAQfbPRbsfTpM0aK4D6fvZG1rsiktVYt61uGomOVbKMmopBwPFSptvkm9mzsan2gR9cCCh1g==
X-Received: by 2002:a17:907:36c1:b0:a86:7924:11bd with SMTP id a640c23a62f3a-a93a05fff3amr378300766b.41.1727278989391;
        Wed, 25 Sep 2024 08:43:09 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:43:09 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 25 Sep 2024 17:42:43 +0200
Subject: [PATCH 4/6] drm/meson: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-drm-const-regmap-v1-4-e609d502401b@gmail.com>
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
In-Reply-To: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727278971; l=797;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=5LX2h6KUZ5if9Uj2vao0DwqWNuvKw18cUv/GkRmqevw=;
 b=i/26hRvR0+ATIZUcXlMm3e7auzpYVGdXGLS4TiyMLWDOmWVpEOZntFsYtA6UIGOAGHiXCzB2L
 ugbC+ZKd/ssD1Wn8wgdhVT2jaSlKi3OSJfOxsagoBy2dqeu80xbwgz/
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_084311_838534_DD9BF8A5 
X-CRM114-Status: GOOD (  11.89  )
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

`meson_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 4bd0baa2a4f5..6c8677d1f562 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -126,7 +126,7 @@ static bool meson_vpu_has_available_connectors(struct device *dev)
 	return false;
 }
 
-static struct regmap_config meson_regmap_config = {
+static const struct regmap_config meson_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.43.0



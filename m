Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB44E77188
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2024 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=; b=1R3ROIYLEtwftJAH2rm7sR2dOa
	BUB70Je0mDhNl8NYewoTiAIM+Raf0mtN98vbv94f3wwCTd7xUrYadE1yIqjVaE1F6wPlF4gHRA/uK
	OVJ2OmGjbDS/Bbn/pxQTmOyhRHsbXzoh/814Ri7+jLRnsu27Ux7+637X/S2CNvFyYNk6xVNDKvMik
	Wq1uScseCqZ5r4wj92uIu0rHhl+/KFtMvnl3p3W6Y4rQ0bYuFNu+A5caVWibsJutDX4JsZDw5/7J+
	3LHm2HQpleI+3R2ipnDHP2a9b9gOMiwepijTSpFV+DhTHRxhAx7ZA0aNiKeS60L9kOnZtzid50lL7
	Wv7ea8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOig6-00000005wUS-10S2;
	Fri, 20 Dec 2024 19:28:50 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiV6-00000005tfb-3Jdz
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Dec 2024 19:17:30 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54021daa6cbso2364187e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Dec 2024 11:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722247; x=1735327047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
        b=MeHVQ8X/4nYVNtF6FwXYtLRawVJtD9f630kvcsdYDpsZyC8gupfMV4bxv9tS96ut+3
         sdw4zqNzrDgQMS1m2TYIUB3DGqnWkBQwRRbn/7mEiYHC28XVVyT4AogXcWew6a00nPEf
         kOeF+foHSgoFW0+9F7Cl61x57OEzdSBwo+VI0ZgNYJBjm6N8Nq2zfTD2koh5YzHdBjIm
         LUw24aIiaWmMRzuUZDH684EDsPSAqhT4busV5s1DQQljMJSAklxqN2ONbEa2YR7ZXV+r
         QkVmncC6MWM0tP9FRR5kBXtKlmxcG4qEO69iXbySDWYRFpF43/LmcVN54sA5Lk3Cqpdz
         9b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722247; x=1735327047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
        b=d9EIQWd5fiqcIh79h4XlZNJHbVGz9WHUEfjZYPZuwHrOwb1l0nUP77reTva4YW3MuC
         sP0OvGZEZeornhJI4dxSutet3jnneKczFMP/TRfVD4SdRwdp3OOaXmFIAluO3Yry8trL
         4B3zfNjgYU4BE2pfA29BeIacYR7vV/fxqZPk1pJ2oumAxdjRfcu9A41ZiOSt2a9Qpsgv
         pYIhmhJOha6MWpdmPJXw4uGl1G7iEc4PcXYpWdSTWvEU1QVxi54O6x4G0HJ5biJVnTJA
         vW6zOoEgkt14tx5GMfnxo2AN1xEQrlv7QB7ROnkjOMWZIYGgCSRSyjZBunSqlRJTCCCM
         2iKw==
X-Forwarded-Encrypted: i=1; AJvYcCVMa7QFEFTsML+Sr7yke7fm5V+Y+8BS0UWwRg5nefGMJJghHxlMpaLyojejvCwBpXHSHmKShXBShXjTbw/xFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaOCGa1AlJXxbdVJ17MMpufPiRCTrLRq4QeLylHUDbJ7zmPQxM
	hdrN58Mo5TVGP52cPknhNe02XXioV+k2MC3sNYmrrN8wu8OgOL3H5zb/rifzdCM=
X-Gm-Gg: ASbGncvfArodKD0S2xGTfKK3TOlaC87WuxD0BlnfqQDlVD/SDokWDIv85ZmLs2gYn1t
	MFn492k1500cuTJdKXuHCERJsyH/5lux6GR42FYxDTasrLqygGS0QWoJjeoUyvvZaTf04/dOGW0
	kR+wtSKVRjh4D2pveGRrK2KtUOxfFkmSpOGnhCSqJkI/WyjQOzzaQSVY7YCMYHICcBrLEbx7oLu
	hOn/Wyq3UpG+sJ+ctGvi/w8unkJZJkkoZWTh1Ikb/GFXogWXRUYUty+HwOXhsAS
X-Google-Smtp-Source: AGHT+IHe0mc2T0S/fidLlcXnIvV7arb5jH5l4ZSKmlo5D0G6qA4hbXh5msEHs+cmKpxC6EOLciu+6g==
X-Received: by 2002:a05:6512:4019:b0:540:202f:4955 with SMTP id 2adb3069b0e04-542295603c8mr1276517e87.46.1734722247275;
        Fri, 20 Dec 2024 11:17:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:07 +0200
Subject: [PATCH v8 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-10-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XEE5uVlLO0AwRnx9UbXjwAPIkR4mEqLYJ4bDyDXWCRU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKve9DZuQ8ppU/Q/ZnyEt45kRCo+xjVXVr/0
 f2RRu93maOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrwAKCRCLPIo+Aiko
 1eW0B/93izm2Wfmdhsv3zy3rGU9m1u1l5dcOmfJb35f/JiJzpMofuBUPhBiSOWvd/xJyc4tPmAi
 V80XUFJHu877in1Juq8fESbqqMCPvLTEDfMXFnmUvu8oboli6HpOqnnb6g9JhbJvNtL6HsDxvZt
 KgZFkLtZeGCpHWBDeaWXihbv2a7VhnSpusAa0AcqSAdlvM9psDa1JF8yYo3tkqxTeRODSb+QDKu
 l9biQtscdPSlOgu/xKywBpVtaNFC0rbQj12YLxzL/BOf6Q60quSYWiwXp4pC/0A2NjFTe9Bby7o
 nutFS8MabwTox6OJ+b76xLxzmyaD1PeBBPIoGgP5pBsG2cop
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_111728_889767_FEA9670B 
X-CRM114-Status: GOOD (  12.91  )
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

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5282dd765cc9478361a705dca85f615015b12e8e..82eeb08c183420b000b351da1e05f9a47baeda90 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -383,7 +383,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -405,17 +404,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	drm_edid_connector_update(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
-	if (!drm_edid)
+	if (status != connector_status_connected)
 		return;
 
-	drm_edid_free(drm_edid);
-
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
 		if (ret == -EDEADLK) {
@@ -549,6 +545,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5



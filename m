Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DBAE7718E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 03:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=; b=W1aHxXFObmQlvS9LJxSV3p5ccf
	NAzOOCeM1QA+uEidQ2W/TzXCOPVvdxB2qb5J31lVp+pU3PDttsxnFfB6xgKbKyR9PCiYcwhyFxbFy
	ZDgOqQg5eTTxHcINDYih87y8ltQcesAf0V0ZMkFh4mNiRZHIL/SDtyIWk+Z/2Awolc1FMJVXta/ZL
	lf96lJWETXrvJggHDFQ0g2LVrjJ2fPWvcxIY3XZW68u38KzgLzoDvyIGUFXdDa+dmjJwoUdmsxnJa
	VgeAmNbgILZ+P30y9ugb/XeRCL3HujZGhtwiQTQp/CdwEXaFJInkngMZNt3U6QVqORbvCouZHebAy
	fSI5lJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYnC-00000009EBi-39Pk;
	Mon, 23 Dec 2024 03:07:38 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYf8-00000009Bwa-2buV
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 02:59:20 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53f22fd6832so4048282e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Dec 2024 18:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922757; x=1735527557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=;
        b=J+f/1ro41Pp0wxcON+cxM3Z4WXjgIZDzfbGAhB8UZmSGPAbB2+oFZUi6M3qw7EEE8T
         czfACt+G1al2Z3wupRuytpvUwnPHQy2YD3thsjvfrgKah50+o33Cj04DT7vOK9UYcZvt
         5rzzVGGPQCIurvSoPtCoWo7aaL/41X4sjf9Q7IUc3nMDQAWY1MH0I7aqvnzjybV2d/WP
         kSy6wwgWa0YTRltRSDMWRB1DlDL310UR3EJiutOH6Z1c0s2aDeFFieEtmb7ZusmU3RI/
         sKfJdQa4pQQhrkEQGiHrj2QfYT49XL9GXIU4RDqZV5AyVvw8EHY1svIEMEezLovoU32r
         iUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922757; x=1735527557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=;
        b=Gyc/ChFZlgW/N+bNJPRm/dAtEE+nn3tHBcIWp/+TaOflmVBV0AozfILFowQRKPKiiU
         QJVFWZFRX7qQ16bTQP7xxl/TYhkqASi/uHfb2IaI0tAhWZSEhO1X5Ti1t0CxBjc/XwIi
         bfUZjfArK8IChWaG0KlS9OEZjW7qXkCl1P/2fq8yv5UraNp06F2o8Bm4la1smqUZer0y
         RRwzc2z8jQCZcebczg6M7z1iBuoGC+5y4Uj6MubFt5CaM+rtNim437Bn75kjIUQy4wMS
         llXnJTtseykoX5JNYoktbSy5WkyzaGRmTIfRRbnbnXLhtNreLUvcwSh/WZTlmXDYoU89
         RnvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ6L4og/lReVPvE8r4Y89Sumgg9tCPdVw7uJudqcwyqZFYOwcrI7nd82PaoL3HYedHQXbArxJ+tv1MX3QAsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyK8JaQV5ptexc/j81jlvaeqglREVygJ9jtQ0a1zwSOgBr7i0HQ
	8RoCOypfMETx2ZXrd8JAtxKBQ46/zv3DeydHzYytEZOy02YtdkQSrUPgu5dEHZM=
X-Gm-Gg: ASbGncs5FS9xEZzBmm14lLyUEquw9YFhjGXPqDRVzmcYzS2hTatlZvQso+eO1CGXbHo
	YoLhBjHnL7NeK84aWoc9l81d+yP/WBwn7R2xhEfVmqe/xCWG5p3fc8KHoKqGtrYufqqW5HGXTlc
	GEjFy0+zyQDuqnA3XF7lhXYE4K62tleVeib1jn9NSunFz3v8w7/64cGa+I/jNqLav4n4xQNLVmz
	OGeZVPUEP1lWZd5aCYUDKC3XE/cL16hWrbBcrLf6LnjS1LKvrnYx04npwGDmigH
X-Google-Smtp-Source: AGHT+IEsAJNSOOaV9y+nIfiI5YFrovLlSSoOsQwRPv3DQ9rP0DXXCsbsdQs9e6lOh7MvObzo8vwB4A==
X-Received: by 2002:a05:6512:10cd:b0:542:2a20:e696 with SMTP id 2adb3069b0e04-5422a20e763mr3184995e87.12.1734922757058;
        Sun, 22 Dec 2024 18:59:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:58:58 +0200
Subject: [PATCH v9 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-7-6ce16bcedb8b@linaro.org>
References: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
In-Reply-To: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4313;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qie1G35P6Yl7cippcpWCMVmv6O7BDmJcfLKNOKKg6kE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHxc64kwoBabpycJjPJSrQzZBWx0rjDhWX0g
 hu7SI/TS3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1cRAB/0Y9MaFBTfXRl+OHwE9mEz9kBDl4uUf9S6zWWs5/Zspm3g4ocdNYQPOVPvzfLv3YzIz4yx
 07/Txug+JO/W7Gc8yBtcurFBnkP9QHxdv3R6RXY50q1W2f3vYxo13mVHjvUjRH8ARihdxR1sl3B
 Vi+VFMo928lRyBfodzdLdjEpD7Q5GAVwjtKAiA6kyt6UBaL0HagIRPmPPd/hz7LvUu79Detl5Rk
 6xGL1yl5xvss0d2T4mlB9aMCNSgKrF+9qFBRcUSYwyqwjq7t2bRd/Bqg2EkROAPFELoBK18uEEZ
 2mVg1jyCMy06rHFflzxviEd1a/5+MhQjaHaBrksBliJeH57c
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_185918_706232_1F28AB26 
X-CRM114-Status: GOOD (  15.83  )
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

Extend drm_bridge_connector code to read the EDID and use it to update
connector status if the bridge chain implements HDMI bridge. Performing
it from the generic location minimizes individual bridge's code and
enforces standard behaviour from all corresponding drivers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index cc955ee008d843d73fedb891e97143a4168fd311..66e4ab81fa0c2717490193e896389757f0a903f2 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
@@ -180,11 +181,15 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi)
+			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -203,6 +208,16 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
+static void drm_bridge_connector_force(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
+
+	if (hdmi)
+		drm_atomic_helper_connector_hdmi_force(connector);
+}
+
 static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 					      struct dentry *root)
 {
@@ -231,6 +246,7 @@ static void drm_bridge_connector_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
+	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -276,6 +292,14 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
+	/*
+	 * If there is a HDMI bridge, EDID has been updated as a part of
+	 * the .detect(). Just update the modes here.
+	 */
+	bridge = bridge_connector->bridge_hdmi;
+	if (bridge)
+		return drm_edid_connector_add_modes(connector);
+
 	/*
 	 * If display exposes EDID, then we parse that in the normal way to
 	 * build table of supported modes.
@@ -368,10 +392,25 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
 }
 
+static const struct drm_edid *
+drm_bridge_connector_read_edid(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_edid;
+	if (!bridge)
+		return NULL;
+
+	return drm_bridge_edid_read(bridge, connector);
+}
+
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
 	.clear_infoframe = drm_bridge_connector_clear_infoframe,
 	.write_infoframe = drm_bridge_connector_write_infoframe,
+	.read_edid = drm_bridge_connector_read_edid,
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)

-- 
2.39.5



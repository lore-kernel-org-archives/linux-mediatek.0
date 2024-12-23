Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09F7E77188
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 03:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7p88hGbKo1uih9Z+JpGgwcv2sHMDRbjp3gmcwjLlOTk=; b=Da2anTTLGAX8i7U2I65QX6FwuI
	qS+xn2gdp6L9DfqLmakhidZA4zOFsmDK4O5OaDndVpATrdCKym8+mC9RlxoHO+X6QFqBxU0qg2fwm
	T6sPbxVQsMJ2nVKTDtFweoKe/+V6wYdIGvZysbBZJC6q8YBxJvy1i5sk2vviMTmIy9vkcK4xNlOPO
	NddSF1Ra2ZuNb46VedwmE4dOOlvf8qesdoJ186dQ6ZjoXakRs1aRXAWe+jEJTKhOiSrx8qV03wzrm
	JS83kB1fFh27XfnjqE5Z0O8tKBlTP7JNLtF46X08tWX/jEQb/R/6OuaBD573D6snp7Co6lOQjlbWH
	B9r9DJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYnB-00000009EB3-3TvJ;
	Mon, 23 Dec 2024 03:07:37 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYf6-00000009Bun-0Yql
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 02:59:17 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso4152341e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Dec 2024 18:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922754; x=1735527554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7p88hGbKo1uih9Z+JpGgwcv2sHMDRbjp3gmcwjLlOTk=;
        b=h/Rw+0s6FvB61FNAzRLK6byfluddPk8zbVRUAxjRK/CW5Th5oGyvs+8od8iu/qTVzZ
         elj8QQ0hON3Ou+tqr2bOwtMYEsBtVHE8DquRmUcoYfN22nNyKD4yHPx3yNnAbdLU5wa6
         rSMVRn35YccliiVnWzBy4QOTXmgk4t5WjjGixk5O2KKgL8xflOPlpbW+It19jGFkHbb7
         ikbqYySYjAzSgk0WAxrMRQbJXZLtirp7PZb53SbYnVOxMpiQgDsF9SlmdbZBNdxi25mn
         EWa4affK58VxXzcY9Hi0DbKJIhQrLnAFlmhWinoI3oRAjBOGDH4RLgF/yTOSBQuD8/5B
         88zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922754; x=1735527554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7p88hGbKo1uih9Z+JpGgwcv2sHMDRbjp3gmcwjLlOTk=;
        b=hyRWr4mjRki7jPm0GeZkUWh1JXj2wzzZ+8xQ6vzCV8Sbn23M1H/y6bIxSV19rfMtRW
         tZCK1Qi7z2TsKiFbUAeGeQkHjKFjWPFq4lC9aKGIYOKrbutsY9nc/b9abVgL4dcdyeGK
         0YkMV4ZBZGJJ6tXSJcx2DQk93JV4noYphz7MU4eYO8zZcgJQnTMAdbzQK1fr0rp9iYKX
         VSTyN50Af19SdwUiaUy8rM42OATUHCifAPVpPHWHyAETf5WEtWcoiAid4sK4j0V+dRAL
         Wx+b3T9N97NlMTFlmrY+ty15j6jFshdvE9COdqV/7+nJOjnsQ8x/XN5dXSGrq7zEH1LF
         /mAw==
X-Forwarded-Encrypted: i=1; AJvYcCUsJ+VGCAUxhR89vjl1D2BMx/nt9mUkcs+oJljjDM0rRl34pTDJxuLizCrlvgTT60ch9MzL5vCGl7dhl17ZqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwydW1fN6CgfL6vKJPOBEWAmBARrQeYjKfif+1F7LC5q/tZneFM
	dT7XMxCpKDtF66ybPNyfOGHE8uDeC3awR6xI966sfK9P8Gx0y5SQMHDUPWEfzso=
X-Gm-Gg: ASbGnct0YFZd70j702lFTmuK5rdvUPE9jzC96eOfxoQQNGYAaBXg37yGaQKVBEvfCqx
	NceWCh0P+OyvzdoQppCRRutIX4WI32vfTsqXJVfN9wib1vqWwM/xYwvrUaY7qBI5oPKB760Vx+t
	P8fksnqRh5zkWc3WSPq1pyMxMmjUpFuh+aVZGhn9E04WI7GeR3721w6UKAmpKSPxidcXnK2fyeO
	pyFJ+34r0uY4k033h0hPPv+wqC+a+h9Z197RImKO1vwccbtTMPzbYIrH2B/ftb+
X-Google-Smtp-Source: AGHT+IElKH4AKPUYEYwbRiJbo0TOgI8/1Bub9raYIL6A6gVp2y+xa77oR6tX2ceL196VX8lXaSaG7w==
X-Received: by 2002:a05:6512:12c9:b0:53e:389d:8ce4 with SMTP id 2adb3069b0e04-54229549444mr2872252e87.34.1734922754488;
        Sun, 22 Dec 2024 18:59:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:58:57 +0200
Subject: [PATCH v9 06/10] drm/display/hdmi: implement hotplug functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-6-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6334;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8xjDZrREhEUluDXr5YjpzwQecn9uFR1J/BTqu2XC7qY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHxgulOkyvS3PYhadszFeaFieSG8X644nZnu
 CWX+02hF7yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1QwuCACGZvQYsz8/sLbdD0s10ZUattTKxi/7AUUbQTKEj6EQ+TxiRZzfVdSHi85mEUbfGJUBAEV
 uydF9Xt3g9HkdjXCuRitamdw+qya9RquK8AcM1VDsoOokR4Vvcx7Gfj5osj/MsRA7Aj/dgKR1wu
 zI0QgvO2bxCoAr6R0C60yyeKtXOvlzVIOut/+i2vXyvz//CtVTUxcypHhiHQ85td15mo+i5rTx+
 0RBVpVdLMQAftM98QEK5cobNjDi2y3l6jvyg+25Z4HhW8doBp991mxbvwR9OJi8JktoXFwrTYUs
 86Ozq4Ok193yS0LxJa2x0+jWLImFw8ggzgWiFWnI/hESo4f1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_185916_305434_4E7E9816 
X-CRM114-Status: GOOD (  17.85  )
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

The HDMI Connectors need to perform a variety of tasks when the HDMI
connector state changes. Such tasks include setting or invalidating CEC
address, notifying HDMI codec driver, updating scrambler data, etc.

Implementing such tasks in a driver-specific callbacks is error prone.
Start implementing the generic helper function (currently handling only
the HDMI Codec framework) to be used by drivers utilizing HDMI Connector
framework.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig                 |  1 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 56 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  5 +++
 include/drm/drm_connector.h                     | 16 +++++++
 4 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 2619fa2476eb149e1befc3135131ed5aaeb5bb4c..8d22b7627d41f7bc015decf24ae02a05bc00f055 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -89,6 +89,7 @@ config DRM_DISPLAY_HDMI_HELPER
 
 config DRM_DISPLAY_HDMI_STATE_HELPER
 	bool
+	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	help
 	  DRM KMS state helpers for HDMI.
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index d678c635a6935050ca9c1ccafbb0865f21df5d4e..f4935b3e630cd89ec6373eb67b06e6a3a3b3a55a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -777,3 +777,59 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+static void
+drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
+					enum drm_connector_status status)
+{
+	const struct drm_edid *drm_edid;
+
+	if (status == connector_status_disconnected) {
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		drm_connector_hdmi_audio_plugged_notify(connector, false);
+	}
+
+	if (connector->hdmi.funcs->read_edid)
+		drm_edid = connector->hdmi.funcs->read_edid(connector);
+	else
+		drm_edid = drm_edid_read(connector);
+
+	drm_edid_connector_update(connector, drm_edid);
+
+	drm_edid_free(drm_edid);
+
+	if (status == connector_status_connected) {
+		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		drm_connector_hdmi_audio_plugged_notify(connector, true);
+	}
+}
+
+/**
+ * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event for the HDMI connector
+ * @connector: A pointer to the HDMI connector
+ * @status: Connection status
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * callbacks, updating the HDMI-specific connector's data.
+ */
+void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					      enum drm_connector_status status)
+{
+	drm_atomic_helper_connector_hdmi_update(connector, status);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
+
+/**
+ * drm_atomic_helper_connector_hdmi_force - HDMI Connector implementation of the force callback
+ * @connector: A pointer to the HDMI connector
+ *
+ * This function implements the .force() callback for the HDMI connectors. It
+ * can either be used directly as the callback or should be called from within
+ * the .force() callback implementation to maintain the HDMI-specific
+ * connector's data.
+ */
+void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_hdmi_update(connector, connector->status);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_force);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index d6d65da6d8f9ee46de33114cce2d6fbe6098a862..9ae19f3caf727f9a0fe06e6afe5fc46db924444f 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -8,6 +8,8 @@ struct drm_connector;
 struct drm_connector_state;
 struct hdmi_audio_infoframe;
 
+enum drm_connector_status;
+
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_conn_state);
 
@@ -19,6 +21,9 @@ int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector);
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
+void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					      enum drm_connector_status status);
+void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector);
 
 enum drm_mode_status
 drm_hdmi_connector_mode_valid(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 19e4256296657b0f1d203266d152cbba42f9726a..dac8048c82f913b9cfaf785cafe85080a9b2655c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -45,6 +45,7 @@ struct drm_property;
 struct drm_property_blob;
 struct drm_printer;
 struct drm_privacy_screen;
+struct drm_edid;
 struct edid;
 struct hdmi_codec_daifmt;
 struct hdmi_codec_params;
@@ -1247,6 +1248,21 @@ struct drm_connector_hdmi_funcs {
 	int (*write_infoframe)(struct drm_connector *connector,
 			       enum hdmi_infoframe_type type,
 			       const u8 *buffer, size_t len);
+
+	/**
+	 * @read_edid:
+	 *
+	 * This callback is used by the framework as a replacement for reading
+	 * the EDID from connector->ddc. It is still recommended to provide
+	 * connector->ddc instead of implementing this callback. Returned EDID
+	 * should be freed via the drm_edid_free().
+	 *
+	 * The @read_edid callback is optional.
+	 *
+	 * Returns:
+	 * Valid EDID on success, NULL in case of failure.
+	 */
+	const struct drm_edid *(*read_edid)(struct drm_connector *connector);
 };
 
 /**

-- 
2.39.5



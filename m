Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6774CE7718B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2024 19:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HzhgiMxv2Db80VG+KMSWbYP6O7BGF88n2kIxBCX2f8=; b=0Uqk27uhrpckyXe8tUvPugYVss
	fDoJfW31K/023N/DguyoZxIYzstQTeeMOSfGHwM8qcHES07XHcyH9ektxFb3m1vS+QXUyyb7h8G9Y
	M3fMOrHiZJs9OKH0/R0kx12q2tzSKCe/cybhnWkPxfbT+y+vMRkeWZ70Drl+It+S7doEdYj79sQpj
	5jjDhECBgYaCqaMSa3J7eZ7Ju5SVrT7IE+OJG07aFZpzCcUjn7RaylOMmUSkChz/aqcp5b3qLj846
	a8SOMfPBkFgL/is/NYFXMQsFrwfvG/7Bn2d5yWMWPtkTH6RKRj8sc2SqIDB5oQCX34QX1D+zklNXy
	1hS536UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOibb-00000005vT0-2IN2;
	Fri, 20 Dec 2024 19:24:11 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiUy-00000005tXO-3laq
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Dec 2024 19:17:22 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54024ecc33dso2635056e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Dec 2024 11:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722239; x=1735327039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HzhgiMxv2Db80VG+KMSWbYP6O7BGF88n2kIxBCX2f8=;
        b=drFJD0i/e+rzi9/9vURKlb8hcFEfKneYZls03usZd+Q6jSVcXFzK1NrHh8L8eFbb6E
         96tcMtrxPGwV4deWIhZpBE54SgoumQ9wNL8vpfwXuDJCxefPGWirwGrgLVz5259LKYmt
         1KU4AR9zgBeaVedO3F6DfRJ4CAO6GKy3t5R6nxipyd0ymfjRpQ14y5fOEC8+IZwUB0tf
         AEM12lny7abY8RNpsZl7cFalRfu49b9Fc2dvYvjlX5MmUtxsIbaI846E7CI5DHDK3j7D
         wSVYY4aaUzwQ8HhLUFn+rJngEWBZOwOwPNdWFStaFxUoO/898eJZCchNhA0w8KDjfIJS
         8DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722239; x=1735327039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HzhgiMxv2Db80VG+KMSWbYP6O7BGF88n2kIxBCX2f8=;
        b=QPb9KFnakCkHLsboOI62PZJRzoL5NRitZUKlVeE/bCqMgt9SId+rt6FHfOIzsSDHj+
         hJrdAQb4MLNY5w98/neM5PAuEpobZd5SN8aw/m5GKwTaSMHD2eF6D0/gKDS7Ymzsp0NW
         D24FW+2GwPYWuXpz+ZYHfXm/BnBv+VSnDpORQONpqLjZQqekVnOUkOQ/hpVSrwA7LRFs
         ++5cmuT5xXjuMJa3id6cWi4B1NdVlxzxoaq42diO8n7xsd98bHGITbchfTKN4Evy3I2f
         el0jRg9voxl/+Hy9Z4HFA3Ck+NHOVWt9RjKamyclH0iQl3wTLC+E1GSMosGpqwUxtfAa
         zDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnSdKMDeu276PLF5Hgadx2W2UqNQkfTZjrIYQIZJb6emmdKxiZTRALbEGZYVL9xHQClnFXtDcCj93IrQd+Nw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmv0l1iLxcuErdiuUceQWyue+RhZZOx0oMdR9MLX9aVQsQ0zRg
	V7aRm39k8FaAULXOtnVd8JzyL28T5rCnibmkMe9ajBePqzV0ov7Qbjmu04KE9NQ=
X-Gm-Gg: ASbGnctqfyotgq+JGktyz7JPm77EUGDVsbaCPmJ7N6NPJDy9QU/y3X0fqkpeYWDRb9o
	N4sLmCnUg/FyJLc59HlfmeiuwUewFMwfeXd2ignTf6hPGklQdRwYEmP8xHrZH0PyqShbdnMvnxg
	cVMOIe1CCIZVsJ8RcnQNtjunCqxha2p7TRGWJb4/AzazKgLKHD6G2cA7aROw95s554VaEObI4Nc
	Tg2tFghkESI6SzwYHzl5toyFpaO40FyDFkYDBBnXfMj5cBe0xlECrPYOTgKe5RJ
X-Google-Smtp-Source: AGHT+IG+R3K3voHplSfjL03KDUvgoZtw33SEZ8WVtANcb0AAyGXIHD8NReTbHW4+7YSPFOXEXe+wtQ==
X-Received: by 2002:a05:6512:1245:b0:53e:2c74:d65a with SMTP id 2adb3069b0e04-5422958201dmr1589853e87.41.1734722239334;
        Fri, 20 Dec 2024 11:17:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:03 +0200
Subject: [PATCH v8 06/10] drm/display/hdmi: implement hotplug functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-6-2399dbae2990@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5803;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iKnhAGg7468g7orLpFdKJtkRp4+W6L6GVAIMc8oYKc4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKunctM/w08a1CycyuUyrKgqJE0Bzd71O8uo
 WVpbib0Zf6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrgAKCRCLPIo+Aiko
 1bouCACI/hyYhbo3BsoNBQmAzhkYtIbnylod9euQ2clpHTsmnWDdqwUgcPm0KYBF0eap7exoKlo
 fkeiA3vngkcPEWY8l9Ii7PBWjvkZX4xcUgsckX5Xrx/3V92Z5Q+YFgVBCFloiLeiI/HDbYaiqhL
 x4jKmdSqR0hb9ui6+mASE2iI8vLQCC56dA+O3bNof7h2wspVF4OB/8/FM9TWY6+hkYNvE/3hQoc
 kgs4Q1lkc/MfCG6R6tqK8n3Z3L19zxTdlbXhdl3ytgCa1MxKI+O3jING72+B/IWQxYELQ0weNIA
 xY4wwi3PDBIXl874ysTbU8OYBTQhAqqEhsSb+9IDem4XdejG
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_111721_007052_23F97F8D 
X-CRM114-Status: GOOD (  17.19  )
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
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 56 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  5 +++
 include/drm/drm_connector.h                     | 16 +++++++
 3 files changed, 77 insertions(+)

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
index ecd3dce94ffcfefacdb554efdc00ea19d6c18f24..9ea08a283018301449895602f3f50ffbf22429ce 100644
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



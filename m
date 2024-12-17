Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED753E77184
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 00:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kk1NgVU9MqJJyiCuMa+6xWyC5169sd0WY/Qbv8YeNNg=; b=VchmE1ZAQrqa1Ju9DPt8GflBrB
	ybYE/lf4pt1Vlv9Hv3WJyBcsSQk86EhZ4dvFLgbjO1cE2evuDIVH3LGbkSamTJXNWsFM8dGQnUOd8
	zWfwe9cG+YGpu2LdzaIcSJCu8+VoIGm+XBZvR6rwPZtVWU0xX+jAmdt7INd+TmvdzvFl3Zw6QfX7X
	Gg4s6a1xaikW9y+IQu7tZMbZASvkScu4BDsLZn/9D5uNF7MoOECa4FYL6OHZ2TVap5AwGWWivMZGA
	ZekFPg4QdS/kB+E6zKzYwLXruYfZZ+Zj5pAhWPv/OU9tQPITY3RxL4XgDF9f5UID71sDbvaqeTH8N
	qd9V3WCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLl4-0000000BmyS-0O7l;
	Tue, 17 Dec 2024 00:48:18 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLdn-0000000Bkmr-0mpr
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Dec 2024 00:40:48 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so4985843e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2024 16:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734396046; x=1735000846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kk1NgVU9MqJJyiCuMa+6xWyC5169sd0WY/Qbv8YeNNg=;
        b=Tn5DPQyJEN+GGuyCCwnr2At4gWsX04lY7iqI94UKqTUSpW63POIVVwLLbfH5UdGcKi
         LgChtztBkxL2LBFMjakE4twPE74Z0YDGW6QU1UTlpkzx43Y696xqB6F2szJrXTGhgxjI
         LMzCrGfYKt9ErM7jmd1GB/l8vzpT4oVq7X+1PagGK/i301cy236ntnbUrgcUhHG2auU6
         TQFWGpuL1vcrtcetXkrVGWkor1TI1cdgMlAIPtaaVTntwLbFVBjRM8TuKA4M+humoDL/
         x1d+NJPOSud7eQsWpJroh0cr8o8yrOsef/FHWd0LxD+lyEURlFO6XuJ6hstGadbofcuy
         Q6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396046; x=1735000846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kk1NgVU9MqJJyiCuMa+6xWyC5169sd0WY/Qbv8YeNNg=;
        b=ZZuQ9Ha4C8N7uLYTxtVaNnyHGE3U122/sgwl71/y+9EQ6IbzMkOXjbmNNRn7/RzL6/
         LvFxhQ/8qJRcijxi0DOGPFstOj4VXLvwjDfF9xTO7m1+18t9UQwoIx3VzSwf/E1FQyWI
         l7+xQCka/CxEOzUplJhA/vIJYmiY3+myq0zsG6smDgX0rwMw6gOjWwfn5qf6dsJoou/u
         ERDPZ40/KWJiRHXiHpLBEjMmAhlo6DIgZ4b5YNidXx2Xx1RTltBFe6dskcAhkLe97RWH
         MYsoXUOhX9D32S/wt4rWw34CVjYfh895zJifz0ZWCD2yfMo2Hzt5FapYAL6DW0+nxXw/
         hoqg==
X-Forwarded-Encrypted: i=1; AJvYcCVhEzqgEYp5ChZ66LkraGC5FWR4U5JnDWjV3SOr7lMAKIuTUr8A11q8Qmzl6ZZqgjB9UORWst0FpDm/cTV0DA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/3gXgH9ePZAovPVDDIF37gAaeJQIEP+wsLW2zKYccacX1ZJs8
	/Ec+1zOc3sY4WRUl4gKwDduM4S+Fnx4QD3Q3rwt4DsP6FNkAt+UgY+GmWmInTgw=
X-Gm-Gg: ASbGncvlfj4D4ACaeKXq+YJXhozrnpDIelGdOG0pr5h0+RNsUw1Awi9YCEgXFfaaome
	ayPKqQVQW/plBiLzYfglEikCAY3pVTj9tMoqxFCLn9SyuKLaI2rJ2DYRZuUV8mRcDHSc0mmh4ia
	Or2y7TUKHJs8TNEJy3y45KuiC7hJDqUU2klIM++eDEmme2cUIaLiiqcM2of1XLTIl60j/HhJ60P
	nLL415A9jmEaFjHjUQl8Be/QxzycTc6wP/mQnpI2p/14IUcIjVpoG14MKBivigF
X-Google-Smtp-Source: AGHT+IET2hsK0OXoi9N+0DoJgdc3STTzo/Y1LCeRb61WgG4K30Ajpfu7jwJe7zMdAQ8z86I/brROdw==
X-Received: by 2002:ac2:4c49:0:b0:540:357a:a0e9 with SMTP id 2adb3069b0e04-54090560c03mr5833698e87.31.1734396045638;
        Mon, 16 Dec 2024 16:40:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:29 +0200
Subject: [PATCH v7 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-7-cb9df2b6a515@linaro.org>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4204;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pAvR5YZJCNBmhdGZoqKZfJpmIHLV5ppYUTPIUoiUc9U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYMh5ja5pCrotWtSWn+8ziDDwUoBX/oLBj0chS
 dbg/ZRFEfaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2DIeQAKCRCLPIo+Aiko
 1Qq2B/0VnneaHJMvRwVb6YfJDzbyhliurPCaV/7H2ECjfBfZWIQuk0ftoOjwQ7d1PkhHnMUFXDK
 PmRMZ1NGkdME6oKsNuQMEwkmbCcy7AAfAGKBD+xa1xscEqY2pRGjlEy/h7QYT7d9OaCe23peZb2
 uGnH9NHBgiuSLQZt7gTSqFHQMPhbO5wJ5O8KCXfVAqD6h4aePy8j9TZU8W6nP9qlnyG6WMGcEEW
 HaVKeKuY3bjcRA/2ADaF6YAUjAsz/s/4i8S8LfTLfJwk1IUwsEnYSuI3R1ZWc8Ig8My7GZiHTfL
 LdoDZoLu/0eJ4k2FMRY/9Gv3Hw0M5jkk0fMkbYEf3v6whYxA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_164047_259796_FE6E5CBF 
X-CRM114-Status: GOOD (  16.12  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index be46d2e7cb5cec262ca5dd6f42f8f31b0187a0f7..4bc044e73fbd8c9fa32ea11f54f268acf024f55f 100644
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



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A28DD5E36C
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Nov 2024 13:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0No8ap6yrBgF/zpJhH8LFZGYsC9p4wbKlDOOUj0WtE=; b=m3a/FrwSI7zCx7OhTHKCNiAxsG
	1Qv9pJcWSCjlT3C0FnlKgr3MWdx2E9sS1EKVDmm5kmelaCXjWAEgslXaHpVYVuiDl9/IV23a7d5c8
	9VLaJwlItwqPeSuNOhTUMf9pis5VmFylcoe7Dq6xUhnTZ5ZaeyDpSsUzSkO/7YAvWLifXtjLp2+um
	1myzu05qqsQtj62S22F3L3djB3+cNvpd/tfvwbgwxkIxPbh4LcTKz89YI5kZooA8EZeZhTVgbu72n
	QHWGCGGWvBQeRFkeF/mZrprQgDY8zhfII0LoMUs8GhD2pp2E1oKuDV8OzrXUCUjzv1IBfvEGqzbsm
	smVUfZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9lDh-0000000DNo5-12ZS;
	Sat, 09 Nov 2024 13:09:41 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ktT-0000000DL7E-25Dh
	for linux-mediatek@lists.infradead.org;
	Sat, 09 Nov 2024 12:48:52 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539e8607c2aso3599721e87.3
        for <linux-mediatek@lists.infradead.org>; Sat, 09 Nov 2024 04:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731156526; x=1731761326; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0No8ap6yrBgF/zpJhH8LFZGYsC9p4wbKlDOOUj0WtE=;
        b=c3XvO5FS05kDi7L638Itjm2tz74NTv2qq+ppbborlATxyZv+qmLltWetUd1U5MPlhQ
         pJFTP67vnH/WFFMN4vMaPexJSb4JBBv9qmBCskZ5qGAyiu6HnWXcPVNp9Rl98uoOgwoa
         xbyPFEdehABcbzSRYrDkK3I5PxgqtFtoJYDWf4AZjY7mH8PA3zb49cKP0qoZyGHxtk1p
         8O6rTJSfvfa21WBK9FsAkm58zRc250kv8xhzlQDuxujptVNCTca3MiQMKUbSOSef9Zt2
         nS7kUWwaxcc1JCyiTPl200JXyOeoxQe/JCus6knvwXWAuxpVPIOwc5OjRhuHQwpVx4DY
         L2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156526; x=1731761326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0No8ap6yrBgF/zpJhH8LFZGYsC9p4wbKlDOOUj0WtE=;
        b=qLHd7H++Pohry9zojRIv10XJ4QdjHhCMonlyjZcofRhTQYKA+cD5+20hIonIFtzBuz
         VLS+JhTxjRBs2WG8NIr4lL4T9cIrT7nfKet2RZO/f1NxpwvoekWo/m0IMtzY4tpkjkEJ
         pswwwunj8Wa2WMDuwLVxRrPvkI/X5bb2nAe3qaeDPrOQ3bD2Mo8r/gd8fosEaNoK16y6
         GTrWQaGnxyEtKcJxbCb9a5nFspsvAMIt9ry906ghYZGA+hrUpGaAA+0V3UTD/PfKXlA6
         bXJszHAeQMUg5W/DKiMcCecETspGAMxshvroObPP3NK4tD2RF7QePJXKkKa1IQsSUENq
         oHHA==
X-Forwarded-Encrypted: i=1; AJvYcCVDW2I42JRjLjHY958I7wfv7pWpRuNWjWz1ylMDUxxdsnepsSet9nnM8ZWue2xobGNC7jDQqP5ffLFHckFTlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCr+y9vbm3TFo7LRW+atgnObyb/MzSfnl6/HCZOnGOtkOb4DWd
	zDJf9+4yMJlgkMHDMavLsM+RUZdlV/LvjzckcEe+L7e4pWglEGAFR8e7OT9j/3A=
X-Google-Smtp-Source: AGHT+IF1snp8hmbIprhuLbAaPklMzRONrEfLzKFk3MHXaYlX7Kfdq5ocDentIlF/eo4E/8CWA9vtDg==
X-Received: by 2002:a05:6512:3c97:b0:539:e776:71f2 with SMTP id 2adb3069b0e04-53d862eb5bamr3254572e87.52.1731156525731;
        Sat, 09 Nov 2024 04:48:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9b76sm929967e87.172.2024.11.09.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:48:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:48:32 +0200
Subject: [PATCH v3 6/7] drm/display/hdmi: implement connector update
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-drm-bridge-hdmi-connector-v3-6-c15afdca5884@linaro.org>
References: <20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org>
In-Reply-To: <20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org>
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
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3860;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0rIRHIOV78l4xOlDNT90+qbvGFV0Mz2FHXQAMpwi9s8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1oeIblR/unQZIwmnM6WdC96PZBguzu1woQcD
 SVQdlnYBieJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9aHgAKCRCLPIo+Aiko
 1ZOyB/9p6aVrjmHtzLjrNly9np+bYEQfuJ0QIYM/EXaWea+FP44i4iA6sf8TWgd/MRGZSJNjwWn
 pOuP30YciUdt6CB0jFvYmqKXQSFfDKvHj4qsgQl5dlC4J/1NXp/H+ndbMA6LtyFbnPcotAEad+1
 405gfgt8h8uIOTegJXrH2jon/Tz5gLToAX/76eQEDXYRAArBK6m3jfQpLW0Dt6eb7iQ1r7wOFGF
 ZMt5zjfqbobPGkXshJrL3DysSuhsEbVuY66N0oCjBlexOXcdIL7p3QRNBseAQIGqcZ1W4NAxpB4
 tKJ5Xpn2k6sPIaiV85FgyP1bO84YR/aNqxQdf2VVWprNjybJ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_044847_889720_763FD863 
X-CRM114-Status: GOOD (  14.89  )
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
the HDMI Codec framework) to be used by driver utilizing HDMI Connector
framework.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 59 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  4 ++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..91073456cadb4a48caacf661cbc8236c7857de9d 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -748,3 +748,62 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+/**
+ * __drm_atomic_helper_connector_hdmi_update_edid - Update the HDMI Connector basing on passed EDID
+ * @connector: A pointer to the HDMI connector
+ * @drm_edid: EDID to process
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data. Most of
+ * the drivers should be able to use @drm_atomic_helper_connector_hdmi_update()
+ * instead.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+					     const struct drm_edid *drm_edid)
+{
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (!drm_edid) {
+		drm_connector_hdmi_codec_plugged_notify(connector, false);
+
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+
+		return 0;
+	}
+
+	drm_connector_hdmi_codec_plugged_notify(connector, true);
+
+	// TODO: also handle CEC and scramber, HDMI sink is now connected.
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_edid);
+
+/**
+ * drm_atomic_helper_connector_hdmi_update - Update the HDMI Connector after reading the EDID
+ * @connector: A pointer to the HDMI connector
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector)
+{
+	const struct drm_edid *drm_edid;
+	int ret;
+
+	drm_edid = drm_edid_read(connector);
+	ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
+	drm_edid_free(drm_edid);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..9698351307eb3d3dd69bafdff8e321a90a15495f 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -20,4 +20,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
 
+int drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+						 const struct drm_edid *drm_edid);
+int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
+
 #endif // DRM_HDMI_STATE_HELPER_H_

-- 
2.39.5



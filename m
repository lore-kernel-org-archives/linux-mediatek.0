Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEAEE6B243
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2024 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGgjAKyLcDyP//XG7JzBSUmff5/dvBkAhC31JU8OV0g=; b=iPsakh3KQCOPcxUOna8G08J9PK
	1LGdcSgG3DT177h9wZ7nKYMoe6eOZDgjOzko7GIpfERfT12pxmPOX1plvWwy6r78SvQdkqUL4CRDS
	bHII+wVvTk2j3MpuK0b+umKO/7XjZHNDTC4jANMrcRUwmgJ0y5s+wTxNQIlzLx0Juc8gWIAJiTW+7
	sujKtvHVN94CaU/iNfQ5/zW2GtylYlvoK+atMw9GUmYB2yz3Oq7GZmmFHwM9KUPk747IzEIVyTSRM
	Jtc1YO2aqcetnf6bxJYLEN/mob3VnEVaOz1VWZCFVJ0nuIk5mYZ0C4y2tURbyLtWiTLaETcET8GQ/
	ZaMER85w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oyl-00000006aaQ-4BUh;
	Fri, 01 Nov 2024 10:34:08 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6okY-00000006Y2L-1Fxp
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Nov 2024 10:19:30 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so18156451fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Nov 2024 03:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730456365; x=1731061165; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGgjAKyLcDyP//XG7JzBSUmff5/dvBkAhC31JU8OV0g=;
        b=xUDbCqTMZl5afs0MrBOUxEUjOB6jw5sT0mbqH8jkFtTstEvEFkXFg25CfgFYjbwkPB
         Z77QcQNlR9Kqr/HQHETuytior7PtAQi3cOKvscqzSNf6M6OmaOuBGEFQUSnxl5d9E9zy
         YCSTz3Yv7cSo6RFOxQUHJNzMtpSVFl/dg4aRxsNrJmFqoeIwwyvRy/uf62T9x99CrfFs
         GpPT6WSSdjMOxAmiCXa4lEUASeh/PQA/FKQpFrmd2L5AC/b/P4tsYa+J9STL40TvGnfw
         vudkDJGlyuru+laP+L3i4+XtMg/x8mVJdmc9QTzTMOBMLERWW0a4Dhd+SKw50bpy4zvW
         8NoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730456365; x=1731061165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGgjAKyLcDyP//XG7JzBSUmff5/dvBkAhC31JU8OV0g=;
        b=n+0C6F/K/k6VC6VE0Q3dB9EP0neCasfXySJuyTlvN5T/vv0qTgcu9hdZVHOcPE0DVw
         63pnknsBDvU2KFV5hBNL36kq/21W6Yrnm//4QB58ShdtILfZ2TdATqh1FmB9ZTGs0Hvv
         A8tOZBPnFGIdP6XJydj7LN8WMpoYUod4U72eTIHq1Z0/FwaKcNwGPqLWKIeeNVa8A6zl
         TW3o+5IwDCb+cVn+brYoIO5gLZl3GsxOGLpwT5JkHg0hj2i1Ls+oq0JanADbVnCKtFnD
         G4QJCAE+z2KvkiAyTdxOmvp6dCb5LG4MbRtWcHmTsbS6kwNDYi3mVwtgEpVJHuoTc3eU
         Rirg==
X-Forwarded-Encrypted: i=1; AJvYcCXZiNxdKe/76x7QB+hNy8q4XoRD0+5edNLn5p8ltdWO1gP7kPB/QnXhB3EoyGkr3bW7SvQ1pD8lVFCSOJ4c0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIC/ltK4AgttKKig/QSc329XDl0wGKiip3B1RXBfhXG1bcFY4z
	KRkxMmeqJlyCn7/vmsLw69gybx5/NS6GIVhxwkgVE9aAXP6b3eFAiaW48fC7mpY=
X-Google-Smtp-Source: AGHT+IGrg+MWNfrCkOop6SzsPvLBRfWp/DqEaW2dXOspXiW0SLaKOKmN4JT+lZ8wzfmuDxerrXaXhA==
X-Received: by 2002:a2e:bc0b:0:b0:2fb:403c:268b with SMTP id 38308e7fff4ca-2fd059d28c8mr58307211fa.34.1730456364657;
        Fri, 01 Nov 2024 03:19:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d6ef4sm5197031fa.48.2024.11.01.03.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 03:19:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 12:19:07 +0200
Subject: [PATCH RFC v2 6/7] drm/display/hdmi: implement connector update
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-drm-bridge-hdmi-connector-v2-6-739ef9addf9e@linaro.org>
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
In-Reply-To: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3910;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=o8zF22Q3lPENAEm/ZYvkUJMiXNxulV8OozkqO4RXQvk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJKsZVEQyQuPw+HstvVa+ywD0DzMiBOlZfnHVE
 KF1rHV9ULuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZySrGQAKCRCLPIo+Aiko
 1fMQCACgMN9amTdAcyKL+du1jF5SGu+FJ0bpmOX/kii6kS9fkFmW3LameFMLXWArrtscsYb0BjH
 aDoCZmihQEAP8h2xj6l8plf0wv8gfO6BMDn/iXRyNNPoDy+V6aFvFwpm5tVCGyHHghH0z4obR+V
 pE4Y5Osy7/1lliErcrZZgpCgoOTgIRlGiL1BafbuEgz+0qG5wFZfQO0mcz6c876TN9ml+Uo/ezl
 tVuxyHU4FxXr/WsNhnV2H5HimCa55xnzoLoHnAU8c1tX5S6FcvR9PR1OBbVO9RcyouOgv8Ky/Id
 fu2VYo2hsea/slZ4EpRbcAWw1S16Zcmcf4ZKPK+rJq80q2cX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_031926_409481_E3610B65 
X-CRM114-Status: GOOD (  15.97  )
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
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 56 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  4 ++
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..dc9d0cc162b2197dcbadda26686a9c5652e74107 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -748,3 +748,59 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
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
+ * and .force() callbacks, updating the HDMI-specific connector's data. The
+ * function consumes passed EDID, there is no need to free it afterwards. Most
+ * of the drivers should be able to use
+ * @drm_atomic_helper_connector_hdmi_update() instead.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+__drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+					       const struct drm_edid *drm_edid)
+{
+	drm_edid_connector_update(connector, drm_edid);
+	drm_edid_free(drm_edid);
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
+EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_update_edid);
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
+	const struct drm_edid *drm_edid = drm_edid_read(connector);
+
+	return __drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..ea0980aa25cbbfdd36f44201888c139b0ee943da 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -20,4 +20,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
 
+int __drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+						   const struct drm_edid *drm_edid);
+int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
+
 #endif // DRM_HDMI_STATE_HELPER_H_

-- 
2.39.5



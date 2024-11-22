Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B31E65D0A
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2024 00:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AekznUw/DJYmSVBNFKXzyv34fWwrWZN8k5LwtkQDlbE=; b=Fe+g0ZRW63/ugQoIiqjQ2JB46c
	RBSDy6TJsz9Gkxw+vs24otZkLE/l1kG0QDqkjrl3vG3Xm/AsjIVQ8r1nCuvpUO+2JQILnqTuYwL8A
	GHNP6mMYtIVC6co58lTbbOwhXElbqTP7m2RnfRtSA8j4ndoDjDtASY0lVqC/ouJ6Bxfk0mAuazYp9
	cIKlAsqna2BLm/zfzBW2T0q0mN0VSzFEBSLDjj+rPkXE9XkGuCBybxCibzGmHF1s8FDqJje4WE58k
	2g4BV68XLAsq8/lZ9l8GHdQK8dJF/57ZtXu6gGa4a5oUl8KQNXtGYknsl82F7pz+AfVjZo8Mbx8bl
	tLmOXwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHvW-00000001H97-2NbP;
	Fri, 22 Nov 2024 00:53:38 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHq1-00000001G66-1D9e
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Nov 2024 00:47:58 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2fb5743074bso13560341fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Nov 2024 16:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732236476; x=1732841276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AekznUw/DJYmSVBNFKXzyv34fWwrWZN8k5LwtkQDlbE=;
        b=SvI5qQQuph8IgYj+dy96JnRN/vjjTNH0wIYRV9NWKKFD4Q1hMTfbjxrdtSPz6FBV0X
         5eb3517IE53HEH3J5UMqv9Vp2R01tJHNlNnwI8mqSpSdciwTm/GWBfKdVRhYMS+fBWa2
         e+Wg3A9IgiYDOVLcvqCLHM3VM8Y5N3m+iIEAOcNFyoEwE8pVhYFjuQ13xeCD7Y8QdKPb
         a2PBJ9jA+vvDiDfPvks15avnaiFaFTzKEwQrRYj8XwVE5EKSwRJTF4ptiKueTjhe8ZS6
         O6oxQdJn+MqEwvJr0JKTR9k1nipeFzuADRTePuvVgdYnxCCtOWHXJaKnLo4GaGuqQ4NX
         VtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732236476; x=1732841276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AekznUw/DJYmSVBNFKXzyv34fWwrWZN8k5LwtkQDlbE=;
        b=omUkNGcbC+uUCFv5ctbyYQd8LpbIeKqxKWMdkJvl0m3/MraTp9fiU6dZxvP4o1BJhF
         ZJ33/ixIi6+RHEZHyvOzS5R79uO86xdQPaAs9138sjE8ZxMcuEKetlkngTyDT83s1Dgs
         7+uDvO83w0Oq4ZdQEA4lZiSG4SitWtqhsDcxtSod9I+FaJu4gcDbY2w/l88Nm7wQtHf9
         pgFMwYUoao9HQkoSdeW0SAnLo0iQ/CsZ0kVCI22eQR99EeAebBumfqCQzanlukFp0RJm
         dSM9eL1Y4HE61qkzVn6NspYrqamRnlYuS7jT8TPXggIP9/g/n8y4EMBGvOrDjIDMgyE3
         3oRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA/tIZSLEMoO3EtPKmy8+6AtpziKNAIAx70GoanROU8GbbqFN1FxqkhvyxGgS/45VYl36Q87Tu+tUpidtRCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZgt3hDPT7R+BZi+Ir8hZRCNEeKGy6Zk4OYXJoe2FhtEDwQPpm
	k0w2dxdUMfgD0Of+Xo19zRaL1NTrJNns/aPzA/idEkbUVsvypzW06FHcAlWGFXA=
X-Gm-Gg: ASbGncvqXIxWwgL5gFAQwxXEmPy4m8iU9RzyBhkPoMJOPcH3t82ogorv4vX45mahb2U
	3jwM+z0pidyz3dwOVYUXfIn6qLJtK8AZT+cgQQ5JMAjyn6Z5ETkRbCHAzCDINEo3hY7TxkqWd90
	+8BX6lw/LrsspPtcFkmefH6PjjEfVG/A9o0qhysX3D4G221pW/9NaTPornyzvZCAtP6jPKNA0EU
	V8C6mSkA4WSLHm4MKo1dUj1v6pdE9UG9kFal1AtUOMZ6m08bzbBpEnzpg==
X-Google-Smtp-Source: AGHT+IHkN4nXkCVt6nZPpHcWzC2bWbGpwg4sMZCFQ0fvcq24XIw4gri2A5l4rqWLYlEyB/ESg+byOw==
X-Received: by 2002:a2e:a593:0:b0:2fa:d086:bca0 with SMTP id 38308e7fff4ca-2ff969a16ddmr15367841fa.10.1732236475685;
        Thu, 21 Nov 2024 16:47:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa5375caesm1083071fa.85.2024.11.21.16.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 16:47:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 02:47:36 +0200
Subject: [PATCH v4 6/7] drm/display/hdmi: implement connector update
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-drm-bridge-hdmi-connector-v4-6-b4d69d6e3bd9@linaro.org>
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
In-Reply-To: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
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
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4091;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h4SDlLdLeTf2M3phGYhMa3icgLWVQxFU2Yi+KA0yVFA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnP9SoeZGpNl267MxKzahXC2JqO9fXLs+4r7B2b
 jseNQkh83WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZz/UqAAKCRCLPIo+Aiko
 1RYrCACo07vR5CSktkmxVEZbETbBqQjxDEeirXgkPjqknr/6Ldh0teXQADgZkx9HHdy58CDSdc+
 ga4kgK0+ZJXjgpg7TnqA4pPgCDv7PJoOvu6y0R7OjtUAaSt01YNT2WdetJ/IKZIgYMz5us0+iaQ
 k0/tU7kVnXK5+fblJV+pE18lR12Yt+SV+MVUlmv/ftN7GvhZJEJ6Df6cHgmGNg/Sdy8rSrFHBFR
 w3uWFPjcHPScLXfZLrdBHstD1OaRB/6FKaVApC2rme2tOi4WXrmB2Itk78OwNOC/b64r9oLTmhO
 inwbgxXewxRuJicQQlp2xm2P+7/BdBVJMjpy58NyXHJAQ+3f
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_164757_344125_683F8C0D 
X-CRM114-Status: GOOD (  14.91  )
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
 include/drm/display/drm_hdmi_state_helper.h     |  5 +++
 2 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..2230b7fc92cfee46a9cad2479edce71822d30934 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -748,3 +748,62 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+/**
+ * drm_atomic_helper_connector_hdmi_update_edid - Update the HDMI Connector basing on passed EDID
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
index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..61c43e744051886ba5f2024197fcc90688670ebe 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -6,6 +6,7 @@
 struct drm_atomic_state;
 struct drm_connector;
 struct drm_connector_state;
+struct drm_edid;
 struct hdmi_audio_infoframe;
 
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
@@ -20,4 +21,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
 
+int drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+						 const struct drm_edid *drm_edid);
+int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
+
 #endif // DRM_HDMI_STATE_HELPER_H_

-- 
2.39.5



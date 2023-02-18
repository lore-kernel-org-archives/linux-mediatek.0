Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC4AC61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 11:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6dHGa2Xgzvsmpkv1OMI3GGLXSZg9rQflTYWwQPQ1MY=; b=mOdDXdXNaeQ4OL+gUzTdtyjhR3
	jovyOvSB4Fao5SKiDUUBdJriRY6EhjC3Se0ngJ2c1pZdowYILzkqDmJsyZiae6PEZCRgkimScxsOk
	MWSsKt53oxKkzpfi522O7hyWdtKFt7RrO7zNFqKqF8oWfsc4IAfYgdnjqCv2gr5RAhS9vJ6dOVdbH
	34ZR85V3tD0qSwlk8g6Ql/TYFgb6HrhSKVDICi5mQz50qhsgtmMA5gDy52HDi5n6HQFkOtWgO3SOr
	W9vkmgT3RsT6EAPQlzuHW40a9gzy7M4DZ9oYmy0HbcfIiSDbKWcXcoM5BYhe1NuLnF8hKWiNQMK3/
	zEAIie+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLEJ-00GqqQ-JS; Sat, 18 Feb 2023 11:18:11 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLDj-00GqX2-Qk
	for linux-mediatek@lists.infradead.org; Sat, 18 Feb 2023 11:17:39 +0000
Received: by mail-pj1-x102f.google.com with SMTP id rm14-20020a17090b3ece00b00229ca6a4636so594296pjb.0
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Feb 2023 03:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6dHGa2Xgzvsmpkv1OMI3GGLXSZg9rQflTYWwQPQ1MY=;
        b=JY77n9tlE/HK4ICl9GMTuT3xOecSN1t2rBwKN2r6bw9DpB3ugVZniqFJmEP/ZS6pdn
         FZrSdrEN79gLPWOMUK+L66wCzzs3r3Q8uln5PXzclN7b87DKiNVjqYU3DiNx/XLz0qPb
         Of7YZ4EvDZl+ErstHa8fMnpIbvTchMOkO2RII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6dHGa2Xgzvsmpkv1OMI3GGLXSZg9rQflTYWwQPQ1MY=;
        b=WWDmwBk0kdhxjfyieeECZQmjmRRd8fjVOmkVsTWJtlyLAStLYoMJxJDTI2x774XwLi
         fcB07Nq6NJjImPLQhMQFCz4wIpLTsgGi8Gzk0QCEfBYCZaFxBTyBWD0Bq45HkUlfRABe
         t5okuO2I4a3OGj7jAPfSRxIsx3OIkJCGCsSXXSaQTEIUJVbTSttXxDui5v8BH6Fn6xHR
         pSQB7s+SgUy6CCNIJ25lr4hAp7tYANsutxQJKVohtJnRiIG8uX6I6EpmBlxOrLuaXvNX
         VdRZ4jxkGNFEq6/F4htpFPPr3h0LmeNTfjezQ1c57Q5pU1w5uA6tidTMQWhaqCgBsRJD
         +1dg==
X-Gm-Message-State: AO0yUKX4LvRiJ50UvsmUkSrc/J2zzLJBmxwuntHgX7SIPrB8N/OXE/FK
	CxsoHs9Mi+Cx+AiaBSpY2+D1wQ==
X-Google-Smtp-Source: AK7set/hFbuR6/pwEBTsgMDjBxXuhNwX/DV7X+3lXNMmHiMnzFAlbjwwtNwH3GYu9AIwOZM3LSHFcw==
X-Received: by 2002:a05:6a20:4e27:b0:c6:858d:81b7 with SMTP id gk39-20020a056a204e2700b000c6858d81b7mr3115816pzb.25.1676719054085;
        Sat, 18 Feb 2023 03:17:34 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:88dd:be84:8f65:fec2])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79157000000b005a8686b72fcsm4457829pfi.75.2023.02.18.03.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 03:17:33 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Benson Leung <bleung@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	devicetree@vger.kernel.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3 2/5] drm/bridge: Add .get_edid callback for anx7688 driver
Date: Sat, 18 Feb 2023 19:17:09 +0800
Message-Id: <20230218111712.2380225-3-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230218111712.2380225-1-treapking@chromium.org>
References: <20230218111712.2380225-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_031736_835976_4A556188 
X-CRM114-Status: GOOD (  13.71  )
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

Allow the driver to read EDID when ddc-i2c-bus phandle is present in
the device node.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v3:
- New in v3

 drivers/gpu/drm/bridge/cros-ec-anx7688.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
index fa91bdeddef0..a16294c87940 100644
--- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
+++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
@@ -6,6 +6,7 @@
  */
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -91,14 +92,24 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
 	return totalbw >= requiredbw;
 }
 
+static struct edid *cros_ec_anx7688_get_edid(struct drm_bridge *bridge,
+					     struct drm_connector *connector)
+{
+	struct cros_ec_anx7688 *anx7688 = bridge_to_cros_ec_anx7688(bridge);
+
+	return drm_get_edid(connector, anx7688->bridge.ddc);
+}
+
 static const struct drm_bridge_funcs cros_ec_anx7688_bridge_funcs = {
 	.mode_fixup = cros_ec_anx7688_bridge_mode_fixup,
+	.get_edid = cros_ec_anx7688_get_edid,
 };
 
 static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct cros_ec_anx7688 *anx7688;
+	struct device_node *phandle;
 	u16 vendor, device, fw_version;
 	u8 buffer[4];
 	int ret;
@@ -153,6 +164,19 @@ static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
 		DRM_WARN("Old ANX7688 FW version (0x%04x), not filtering\n",
 			 fw_version);
 
+
+	phandle = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
+	if (phandle) {
+		anx7688->bridge.ddc = of_get_i2c_adapter_by_node(phandle);
+		of_node_put(phandle);
+		if (!anx7688->bridge.ddc)
+			return -EPROBE_DEFER;
+	} else {
+		dev_dbg(dev, "No I2C bus specified, disabling EDID readout\n");
+	}
+	if (anx7688->bridge.ddc)
+		anx7688->bridge.ops |= DRM_BRIDGE_OP_EDID;
+
 	anx7688->bridge.funcs = &cros_ec_anx7688_bridge_funcs;
 	drm_bridge_add(&anx7688->bridge);
 
-- 
2.39.2.637.g21b0678d19-goog



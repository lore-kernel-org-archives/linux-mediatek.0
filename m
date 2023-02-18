Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3919DC636CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 11:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrZswIO3s0BfCLiWcvjWhA4ILZgxpyay+bftO3KZDHg=; b=fFdy34YDCK84ZklD4CMlh8stWQ
	CKNqzMwBgeACpS6kg/TG3CNSkZ2GECOnqUGmLAyY65hTvLeH8OBdaGmcUdfbhMYTH7MTzVintENjq
	wG68jZjryr9pOfzy+b9YLgY3pEHK8UT3ecDiUzflyzxFqZcbukn8qq2UnSnsF7EYLEVi10TThTuqB
	P3+wGHCzmtF6ANSdwiOJ9uOf6Wx2Sdk1OLIxAiOs1Alh+llyP7/miEaKNaxJ56vk4+Skw5L/AvEUr
	uQTdz21VQK4L3MzZOwkyEP6Sjn65W9zX/l0e1Os8miHAsmf6lieuoXPbZlYlzYCTGBx28fVka1B9/
	ZcA9uuRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLEb-00Gr0N-H0; Sat, 18 Feb 2023 11:18:29 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLDt-00GqSl-Jq
	for linux-mediatek@lists.infradead.org; Sat, 18 Feb 2023 11:17:47 +0000
Received: by mail-pf1-x432.google.com with SMTP id d19so242375pfo.9
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Feb 2023 03:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrZswIO3s0BfCLiWcvjWhA4ILZgxpyay+bftO3KZDHg=;
        b=ba9IojY/CUj+zzZ/UQHSrVd/cwQfpf6fCIPaEsCNLLepX6wnF3HgOqg3YWXfV31SSH
         Dgpb2oe2njMUAn8gHjEYk3ypaIoyjbybV16Brug2JRVblYSygzOi/VLJB0juzLK3bYkY
         4Rbyeuq8O58WHOcm7PAIUhanqDM4bO0ozTQtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrZswIO3s0BfCLiWcvjWhA4ILZgxpyay+bftO3KZDHg=;
        b=WLpWP6UCARCsgEsTJE7F8vOpUCEEDc7zgVIOLFhqLnupvRp2iuuOB7FFN6i+7xudif
         mC/THnC/2rdfOThhS4/9nbMZo1GmDauaIwqEMB19qqZAaC+4sde6QxhaHWU3oqscTQxo
         lX33PJGMH1cDJ96Q3TRTpgApPuL/8C5J4WxWmaMsDX92/NATb2bhop8Z5yJRNODzbK3P
         YPNsQnPbpLU9n5dnS6CLdzQnp8wXsm8B1YQEv9UZEioyW4m06QQxEFH/Mmv3sjnlw20h
         tcYEk+usVZQKaH7W0nR+bBdW/DrLJUAxsn+D1OVhqvIbhwe70i9LGuldakz/L6O8oa41
         uxuQ==
X-Gm-Message-State: AO0yUKUMoN0HKevzD2OpGQFF1wlR5/4DMHBMKZSgmSdJKcLBR5RVMW9A
	lXO0pFSoSKGS2HojeHrzn8UKIw==
X-Google-Smtp-Source: AK7set/2EtDLkb5CN95kCgHnoYzFvMY65qtuHhNEFZiMAKbzehZIhs0gSwBpIhugJj7RooT5OoFOTQ==
X-Received: by 2002:aa7:9402:0:b0:5a8:aae8:1160 with SMTP id x2-20020aa79402000000b005a8aae81160mr3998360pfo.20.1676719065217;
        Sat, 18 Feb 2023 03:17:45 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:88dd:be84:8f65:fec2])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79157000000b005a8686b72fcsm4457829pfi.75.2023.02.18.03.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 03:17:44 -0800 (PST)
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
Subject: [PATCH v3 4/5] dt-bindings: display: bridge: Add GPIO display mux binding
Date: Sat, 18 Feb 2023 19:17:11 +0800
Message-Id: <20230218111712.2380225-5-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230218111712.2380225-1-treapking@chromium.org>
References: <20230218111712.2380225-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_031745_704733_4DDECAFA 
X-CRM114-Status: GOOD (  15.35  )
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

From: Nicolas Boichat <drinkcat@chromium.org>

Add bindings for Generic GPIO mux driver.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---
Rob mentioned that this series can probably use the common MUX bindings.
Those bindings are designed for MUX consumers that requests a certain
MUX configuration, while this driver is reading a GPIO pin controlled
by the other parts of the system (in our use case, it's the embedded
controller firmware).

Changes in v3:
- Removed ddc-i2c-bus in the bindings

Changes in v2:
- Referenced existing dt-binding schemas from graph.yaml
- Added ddc-i2c-bus into the bindings

 .../bindings/display/bridge/gpio-mux.yaml     | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
new file mode 100644
index 000000000000..e6b82ea2f45c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic display mux (1 input, 2 outputs)
+
+maintainers:
+  - Nicolas Boichat <drinkcat@chromium.org>
+
+description: |
+  This bindings describes a simple display (e.g. HDMI) mux, that has 1
+  input, and 2 outputs. The mux status is controlled by hardware, and
+  its status is read back using a GPIO.
+
+properties:
+  compatible:
+    const: gpio-display-mux
+
+  detect-gpios:
+    maxItems: 1
+    description: GPIO that indicates the active output
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          Video port for input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          2 video ports for output.
+          The reg value in the endpoints matches the GPIO status: when
+          GPIO is asserted, endpoint with reg value <1> is selected.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - detect-gpios
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    hdmi_mux: hdmi_mux {
+      compatible = "gpio-display-mux";
+      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&hdmi_mux_pins>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 { /* input */
+          reg = <0>;
+
+          hdmi_mux_in: endpoint {
+            remote-endpoint = <&hdmi0_out>;
+          };
+        };
+
+        port@1 { /* output */
+          reg = <1>;
+
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          hdmi_mux_out_anx: endpoint@0 {
+            reg = <0>;
+            remote-endpoint = <&dp_bridge_in>;
+          };
+
+          hdmi_mux_out_hdmi: endpoint@1 {
+            reg = <1>;
+            remote-endpoint = <&hdmi_connector_in>;
+          };
+        };
+      };
+    };
-- 
2.39.2.637.g21b0678d19-goog



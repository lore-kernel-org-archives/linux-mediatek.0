Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B23C77B7C
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Apr 2023 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qBW7voqUuCZ1/G9Ruo0KBFBVOsPyocZSL7gk/zrdikA=; b=SlsFmahYtxO1F6GMBcY567LKT3
	yGl/UhrUoOZq10++ttHtuNjMtkowpSh/QywXu2OGS1i3DgYf7Z28I2B+UwqLla4ZroZOLL2fDwg1E
	d8YMZzTBl70/hlcb11FfeyFXFW/RPRStHL4x6EsOZ2g55DIJQ6ADyLX1rDKjDi0zbMQSGQ0pG2EFC
	H7jtipW4xdotIyP71P0tltH3AlCUjerSZKxjngtdujDd2qN+omIfjGKWsHSCssimHpS4jGigKSJoe
	5G2P7wS27Xq1UG+ow0UVarhfxPYMmpV22mui6ELLj300PacD1btXj1tzuJKlsGqN+M8A5SYJqvmuH
	Mr5joFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pncfh-00Bm0E-0f;
	Sat, 15 Apr 2023 09:58:17 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pncfe-00Blyr-0l
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Apr 2023 09:58:15 +0000
Received: by mail-ej1-x634.google.com with SMTP id q23so42213190ejz.3
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Apr 2023 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681552693; x=1684144693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qBW7voqUuCZ1/G9Ruo0KBFBVOsPyocZSL7gk/zrdikA=;
        b=vV0UVC8YX5hmGr0O97HyyHm2Xo8rJmT7MUThJiturG/vbsOZEQRCW+4Z0YLug1TOuA
         9Fl8JfgAPV0dxpjL6yz1awbckIWcCiv4Hd8gj0dA972smjEZDmZv4JjOqq7iZVpBW1sY
         mF5wUG94gjCJkPbW3xKn1lVAPzwYVtZa1qeOWVyYbG8fUaE7YKWfd8oS2zh10JImfbRT
         O8lCVvmjaHsSea0ZY/SQAum9EPpDkCtdmnt2u3aFbMLw2G9sg2x+R/EdSXH/RcSPmxwH
         Iu3rdR7zRs4CK/5xpJtAtfDsmNTydHU8iff+2leZXDusAHTEaDLK7m0Ywax1Mb5TkID/
         qMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681552693; x=1684144693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBW7voqUuCZ1/G9Ruo0KBFBVOsPyocZSL7gk/zrdikA=;
        b=SD4Ue3PZrlT8hvhst2Ji7uSbKi9397Dw6aiFgf6Hk9azD/N8Ic9nXuOhrdktU9TLKt
         t7IpV+ygMPD4hpGqv3B5LCU8ZXU+WbLPiGrnJcL8pSIzO+XqclZOvV8iArz2beDA6jB9
         hkZYoa0KnvLamzEIsc69eqZA1NgQ6mwUTSThxRd+tRP0EoxRjUkio5RC3yMy+enTLkSE
         4lXkBwiQ5+v77q7CDrPPhthk8xVxnfGHj75o5GFRgIsKc1mnHjNuG75y9HR+p+Bqt99b
         E0mRVzrjvWhCmwPWQfZ+C2qIzyUJwDCaq+BgQvsikIAs/HdinPKVLqcoX2x8V7A74FOb
         DlyA==
X-Gm-Message-State: AAQBX9f3OSS301K1ixnwepsDOfM6rWKngERLKclWWfymX+wfywLpisa7
	WE7HdbtmTA2QJBvwzBFv76G2TQ==
X-Google-Smtp-Source: AKy350ZYKRSYuyMEh5n5Qwf2//t0LPyGrPZqab6XuiqTfYLkjAF0dCA9it0pvgVfMz92eYuf6M/tYA==
X-Received: by 2002:a17:907:1245:b0:94e:6294:9d23 with SMTP id wc5-20020a170907124500b0094e62949d23mr1342399ejb.26.1681552692687;
        Sat, 15 Apr 2023 02:58:12 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm3594248ejc.161.2023.04.15.02.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 02:58:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sander Vanheule <sander@svanheule.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fu Wei <fu.wei@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Justin Chen <justinpopo6@gmail.com>,
	=?UTF-8?q?=82ecki?= <rafal@milecki.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Anson Huang <Anson.Huang@nxp.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
	Srinivas Neeli <srinivas.neeli@xilinx.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/6] dt-bindings: watchdog: drop duplicated GPIO watchdog bindings
Date: Sat, 15 Apr 2023 11:51:07 +0200
Message-Id: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_025814_281078_13257C36 
X-CRM114-Status: GOOD (  15.70  )
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

Two conversions to DT schema of GPIO watchdog binding happened and came
through different trees.  Merge them into one:
1. Combine maintainers,
2. Use more descriptive property descriptions and constraints from
   gpio-wdt.yaml,
3. Switch to unevaluatedProperties:false, to allow generic watchdog
   properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/watchdog/gpio-wdt.yaml           | 55 -------------------
 .../bindings/watchdog/linux,wdt-gpio.yaml     | 17 +++++-
 2 files changed, 15 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml b/Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml
deleted file mode 100644
index 155dc7965e9b..000000000000
--- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml
+++ /dev/null
@@ -1,55 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/watchdog/gpio-wdt.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: GPIO controlled watchdog
-
-maintainers:
-  - Robert Marko <robert.marko@sartura.hr>
-
-properties:
-  compatible:
-    const: linux,wdt-gpio
-
-  gpios:
-    maxItems: 1
-    description: GPIO connected to the WDT reset pin
-
-  hw_algo:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: Algorithm used by the driver
-    oneOf:
-      - description:
-          Either a high-to-low or a low-to-high transition clears the WDT counter.
-          The watchdog timer is disabled when GPIO is left floating or connected
-          to a three-state buffer.
-        const: toggle
-      - description:
-          Low or high level starts counting WDT timeout, the opposite level
-          disables the WDT.
-          Active level is determined by the GPIO flags.
-        const: level
-
-  hw_margin_ms:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description: Maximum time to reset watchdog circuit (in milliseconds)
-    minimum: 2
-    maximum: 65535
-
-  always-running:
-    type: boolean
-    description:
-      If the watchdog timer cannot be disabled, add this flag to have the driver
-      keep toggling the signal without a client.
-      It will only cease to toggle the signal when the device is open and the
-      timeout elapsed.
-
-required:
-  - compatible
-  - gpios
-  - hw_algo
-  - hw_margin_ms
-
-unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
index 50af79af6416..499f1b7e03f9 100644
--- a/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
+++ b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
@@ -8,6 +8,7 @@ title: GPIO-controlled Watchdog
 
 maintainers:
   - Guenter Roeck <linux@roeck-us.net>
+  - Robert Marko <robert.marko@sartura.hr>
 
 properties:
   compatible:
@@ -19,11 +20,23 @@ properties:
 
   hw_algo:
     description: The algorithm used by the driver.
-    enum: [ level, toggle ]
+    oneOf:
+      - description:
+          Either a high-to-low or a low-to-high transition clears the WDT counter.
+          The watchdog timer is disabled when GPIO is left floating or connected
+          to a three-state buffer.
+        const: toggle
+      - description:
+          Low or high level starts counting WDT timeout, the opposite level
+          disables the WDT.
+          Active level is determined by the GPIO flags.
+        const: level
 
   hw_margin_ms:
     description: Maximum time to reset watchdog circuit (milliseconds).
     $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 2
+    maximum: 65535
 
   always-running:
     type: boolean
@@ -42,7 +55,7 @@ required:
 allOf:
   - $ref: watchdog.yaml#
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1



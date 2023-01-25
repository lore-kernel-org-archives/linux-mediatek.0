Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE974C54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 14:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+hdoITDtYQdRah2TmgE8D0Rqy5YhdMJSbiS7Eipx1Q=; b=rKdxVD2xFi8+DXzGrH7X/ucCGz
	I7R5llioUzCpriEz9mI49U47zguPHmzCDPB3eYfXAsR+830+63eHzATLPs/Q1jO8CFOlnDywvlyCu
	ChgM6pWGppUQ2hOTBy5GXu/TsE5fUBw6LeC5RxJDw+smjNw3fLfANrg4F4RG5d/6Lu7LnCvAxQ2T6
	hyLguBxa93M7HS2YFa902mo5X3ivZr0ubZ+dpmHraBB06pxJPdHEZzXcOydmS3UZQk0c5WmD7y69v
	PydG+GlyfWexFTuGvggm9swSV/P3GLyytnCZJaLlfACIhux7ZnKxZkOd+3bmu3I5ZQV/iOgzK9RzO
	ekQ7U/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKguA-007ajV-99; Wed, 25 Jan 2023 14:37:38 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgro-007ZSi-NQ
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 14:35:18 +0000
Received: by mail-ej1-x630.google.com with SMTP id az20so48235978ejc.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 06:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+hdoITDtYQdRah2TmgE8D0Rqy5YhdMJSbiS7Eipx1Q=;
        b=SHnHfos/l3FQGYctapeGDvlA0F6o8EpKc3T3n7XRDf3LRc514rHbW4vVTZa7B29eZu
         JEkvi6QCtW3hPIOySROOFCgOCG10ePfpee9rEO4JF0BnjHIEEocHyKLSXXwwb0EF55Vw
         0TRQF01xNSYOlB2SMxF/wUnjnptfpYnK6i4A5Yf/1gEXveSkL/DiiBYqgZBTb2SzRAny
         AV1rUFOAv9A1f2r4gq8b/mE58/zaq1A/aym700hzpw+D3Xp7sPRSft/AFq6mejfJvmze
         6Erh2ZNmBiEgJQrNIVPQHuRUXnEC/y3wmo4gbgYGcPSRc69LSsQVQnWPE/M73lQg+Wce
         iEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+hdoITDtYQdRah2TmgE8D0Rqy5YhdMJSbiS7Eipx1Q=;
        b=W+3dE5+SkX/YEktKUk1rTXgHtDxZyhs0t89/pHKtv7+/Jrd4cAVDjrFwSithRVSQVO
         USQGZ0ioCC00MMIUhwZUbbwZEHt8k/PoTMr0FY/WBw+TFZEx3cIqXrKBjpRoVEja0syE
         ypBgT+cpsfA3drcMPKwNjhFw8BFXfaKC9okpIAwqGtbgZhXPlsoFEiXwb4Q68Y4YWFNW
         lPzceco8qQszHCAcVMe7Hn3+l5VNlWdoXiwGTeagspAJUYE9dJVQZwih+6FDwwU4Nmjy
         fL/WP5RseUeF/4f2CMTxLXfYwkfFT+iHDhiv4/154GQNlH5F2DGlA/Les6cr9zEC63XE
         Sq2g==
X-Gm-Message-State: AFqh2kqXHMYB6jdrWAeyLQyJ2o4r1FWm9WrUaPgozJOZ/eGF3/DRJApQ
	xC6aqJ98CYSsyQxDPQvTi9SowfhDZo3wat3J
X-Google-Smtp-Source: AMrXdXvpnaPN3DIGx28duMmt22RIPa3PVOhbzeBY2JXBj0NVu79klDzsc61FMsPQt6hWnGzA9DIS2Q==
X-Received: by 2002:a17:906:f49:b0:864:8c78:e7ff with SMTP id h9-20020a1709060f4900b008648c78e7ffmr28543678ejj.23.1674657310876;
        Wed, 25 Jan 2023 06:35:10 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:10 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	daniel.lezcano@linaro.org,
	chunfeng.yun@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v9 4/9] dt-bindings: pinctrl: add bindings for Mediatek MT8365 SoC
Date: Wed, 25 Jan 2023 15:34:58 +0100
Message-Id: <20230125143503.1015424-5-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125143503.1015424-1-bero@baylibre.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063512_837702_307D6E06 
X-CRM114-Status: GOOD (  17.30  )
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

Add devicetree bindings for Mediatek MT8365 pinctrl driver.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 197 ++++++++++++++++++
 1 file changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
new file mode 100644
index 0000000000000..4b96884a1afc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
@@ -0,0 +1,197 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8365-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8365 Pin Controller
+
+maintainers:
+  - Zhiyong Tao <zhiyong.tao@mediatek.com>
+  - Bernhard Rosenkränzer <bero@baylibre.com>
+
+description: |
+  The MediaTek's MT8365 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt8365-pinctrl
+
+  reg:
+    maxItems: 1
+
+  mediatek,pctl-regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      maxItems: 1
+    minItems: 1
+    maxItems: 2
+    description: |
+      Should be phandles of the syscfg node.
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      Number of cells in GPIO specifier. Since the generic GPIO
+      binding is used, the amount of cells must be specified as 2. See the below
+      mentioned gpio binding representation for description of particular cells.
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 2
+
+patternProperties:
+  "-pins$":
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "pins$":
+        type: object
+        additionalProperties: false
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pinmux:
+            description:
+              integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in <soc>-pinfunc.h directly.
+
+          bias-disable: true
+
+          bias-pull-up:
+            description: |
+              Besides generic pinconfig options, it can be used as the pull up
+              settings for 2 pull resistors, R0 and R1. User can configure those
+              special pins.
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          input-disable: true
+
+          output-low: true
+
+          output-high: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          mediatek,drive-strength-adv:
+            description: |
+              Describe the specific driving setup property.
+              For I2C pins, the existing generic driving setup can only support
+              2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
+              can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
+              driving setup, the existing generic setup will be disabled.
+              The specific driving setup is controlled by E1E0EN.
+              When E1=0/E0=0, the strength is 0.125mA.
+              When E1=0/E0=1, the strength is 0.25mA.
+              When E1=1/E0=0, the strength is 0.5mA.
+              When E1=1/E0=1, the strength is 1mA.
+              EN is used to enable or disable the specific driving setup.
+              Valid arguments are described as below:
+              0: (E1, E0, EN) = (0, 0, 0)
+              1: (E1, E0, EN) = (0, 0, 1)
+              2: (E1, E0, EN) = (0, 1, 0)
+              3: (E1, E0, EN) = (0, 1, 1)
+              4: (E1, E0, EN) = (1, 0, 0)
+              5: (E1, E0, EN) = (1, 0, 1)
+              6: (E1, E0, EN) = (1, 1, 0)
+              7: (E1, E0, EN) = (1, 1, 1)
+              So the valid arguments are from 0 to 7.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+          mediatek,pull-up-adv:
+            description: |
+              Pull up setings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,pull-down-adv:
+            description: |
+              Pull down settings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,tdsel:
+            description: |
+              An integer describing the steps for output level shifter duty
+              cycle when asserted (high pulse width adjustment). Valid arguments
+              are from 0 to 15.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          mediatek,rdsel:
+            description: |
+              An integer describing the steps for input level shifter duty cycle
+              when asserted (high pulse width adjustment). Valid arguments are
+              from 0 to 63.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+        required:
+          - pinmux
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pio: pinctrl@1000b000 {
+        compatible = "mediatek,mt8365-pinctrl";
+        reg = <0 0x1000b000 0 0x1000>;
+        mediatek,pctl-regmap = <&syscfg_pctl>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+
+        pio-pins {
+          pins {
+            pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>, <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
+            mediatek,pull-up-adv = <3>;
+            mediatek,drive-strength-adv = <00>;
+            bias-pull-up;
+          };
+        };
+      };
+    };
-- 
2.39.1



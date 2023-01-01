Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD76C46467
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Jan 2023 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/YvHElO1B1L96Q/ryL2GcQHBR6R6iwvqncvsZcjNEM=; b=ZHT26SxPPA9kT87NVd77xvSrFJ
	VDTCd5N8Zyk2aR1L2+DRf2LJiS9k3CcWZeQgifnflFq/6eAx7vFnk8AUyJrlWBapqJOuUglT00iMy
	jtCComhZtnJaPKnYkUSLWQMJnT+elY7zvvk+saVIHQI+MP6YE7O29adOLASRTKWWM2U7m32G5kqds
	pXrx4vNl7XmRQJaV6cgVXWuFPSHnWXkpZR3PfoYfaVM5nDKvLrO/WcpLsdvPJKKfHzVFrpk+le653
	qHcCOGx36W9Cf+FaQnA8C8gYGUoE5UYdBSUfvcnrRmxZxgEjXM0y0B9dT6wccVP4tX3d8Bjy31+pn
	O29Q5HAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6WT-005juf-1r; Sun, 01 Jan 2023 22:09:41 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6P0-005f6f-9D
	for linux-mediatek@lists.infradead.org; Sun, 01 Jan 2023 22:02:07 +0000
Received: by mail-ej1-x630.google.com with SMTP id t17so62923075eju.1
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Jan 2023 14:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/YvHElO1B1L96Q/ryL2GcQHBR6R6iwvqncvsZcjNEM=;
        b=PL/7VFABbftOZo2szu3AblcfijGlLQfJk1ickQXxRfGe9f70BdSj425vyk4U7e6o7M
         hFKk/96B75Dq+0pT8lOhqVrnmUxmwK9BQkzZEdeupmCq5yq0bwY9BdAjHkh72racR6ef
         px8R/QvVe7RsAO3Y2QiicJxS6DTXEMfiKNEI3qQQVjGUuPSR6vZ2ZknRWIS1EKmC+8bO
         WwOWfpLEpXbrMG3bapmvjqQA2ovHXjVP1msf+5FjNeU66QtloJ7e725sljla5EqKpds0
         CSu5vnZIrUCJmyvipzIt2c9OUhWtZ72XUV8DTIIwRVgcYaKw0fJdctTFaxs7m5VE7t2o
         w/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/YvHElO1B1L96Q/ryL2GcQHBR6R6iwvqncvsZcjNEM=;
        b=nHOmoevc6HImRe4TS80t6PtUIkWUMRZ88UaHnb9FA7PSo6cA1Eu9bj0SR49Ln3hPIt
         TEVObvSY68EB8PEcDZfHzpLFEkEk8UWKA4zfCx0obKEugHXZ40u6QmjZ6Gck3an2dDNb
         u40Bax/7fKLU7HRApkZm2BdVKgkWfXVFeH6Hj9AfjO7ps2Dejev+NGzr+E4PWed3jTsM
         eGs7xvrOhfSGNC/qWs4VxKbUQ5Sq1FpPrkftzaZlnDb9arSLQcovLPiIROiRJTATsDY/
         Do7hiaLOEMI/y3rCwsHpk4+xJx7C/c3CImmHi0naYLa79xgAT+gOiGTMx19FuYbw1trI
         V8/Q==
X-Gm-Message-State: AFqh2kqlpg2ii2VMH6vz6D2r8N+g6MlYzfaZ7LratzMYYvooZ3C8arx5
	63f5kQ0E4lfZNDuSfKm2K0s6EA==
X-Google-Smtp-Source: AMrXdXvrts/wULFurfFjqpmycwAXrztlaV2mg8bMCc6qPeQ4QiyC75xGMkpWBsvLKTrdOaA1pZ4qrA==
X-Received: by 2002:a17:907:7e83:b0:7c0:e6d8:7770 with SMTP id qb3-20020a1709077e8300b007c0e6d87770mr38819922ejc.74.1672610516953;
        Sun, 01 Jan 2023 14:01:56 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c23-7c55-d800-0fbe-25d2-487e-ae5c.c23.pool.telefonica.de. [2a01:c23:7c55:d800:fbe:25d2:487e:ae5c])
        by smtp.gmail.com with ESMTPSA id d12-20020a170906304c00b007c17b3a4163sm12486807ejd.15.2023.01.01.14.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 14:01:56 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	nfraprado@collabora.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v7 4/7] dt-bindings: pinctrl: add bindings for Mediatek MT8365 SoC
Date: Sun,  1 Jan 2023 23:01:46 +0100
Message-Id: <20230101220149.3035048-5-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101220149.3035048-1-bero@baylibre.com>
References: <20230101220149.3035048-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230101_140159_836372_CDBB2569 
X-CRM114-Status: GOOD (  17.45  )
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
2.39.0



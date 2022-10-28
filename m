Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2F3C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rjM9lCoFGf3RT/o2EnifjQmQBBIlv25kewk8GPQmYY=; b=M/NOI9G9+DVkmGaICpsBAstW1y
	OHvtyBQ6tULoUNws8h3YrqNZE91KKvzjQBvi6r+oD0nTqfuPITPjV54tSRkryUwFISH/vny9+3aGt
	gD3Wbry+VbPUnjXHhRP7xUdIVLwUv8HHc+Wa2rfcz6zNI5MMVzCjyfoO2jOYuu4vDAmHGi8Gwa2HU
	TEd/iMqB3Dbh6roZBcz8VxkEK3ZfH2hxD+zekz2Ue2a+5a3yTIdQW53KqmaTNPAYapj37LzFzrcP+
	G/MKNm/wjnsSOHyzYq+Zpg3CMGFuuW6F91zW9nz9MSnu1n7kXgnzbstBOIMYiT9Eg9lvg+jm0BQoz
	tpocljPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRQG-000YxY-HU; Fri, 28 Oct 2022 15:37:28 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROP-000Y62-3z; Fri, 28 Oct 2022 15:35:37 +0000
Received: by mail-ed1-x530.google.com with SMTP id l11so7221116edb.4;
        Fri, 28 Oct 2022 08:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rjM9lCoFGf3RT/o2EnifjQmQBBIlv25kewk8GPQmYY=;
        b=KDT+rSVUgOWeJ3sAzuxMMsYPGPM22sEw6ANWwnNL0mv1cneOlqTbJ8r0o+BX7Ut8pe
         21tz7WBjrQWJD7Xj9Pb0ynCQE8WkPzMFlQm1zldUU6r/DUqmt9lS9KMX/7/oxLJg2XmE
         xGLzF7NcyePzwmcPBwfNpTjyRWKRhTdqqOez/1EVvSKhmL1gjOVyIq7LafTW6Z7u6QSc
         eWEQMEgeHtNzGuH+s5jE3CjInJedto78Fi/kXPdwLjaB6+kT+Y1+z6I6kHAUY+FbE4I/
         d7vOHpGfK7ggMSH0fCmLb5UZVBYd/4trph4JGKne4Arvmu/kQLEjUDjhA5Av+OYAOk4r
         Yspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rjM9lCoFGf3RT/o2EnifjQmQBBIlv25kewk8GPQmYY=;
        b=bwfAlu9nqK8VfgGRCAeTJBZkgAgsdJdrRIVAauh+8BzrrUTF4YFq4L4TPRwSHXmjEp
         /ExYO4yYLuRBX7KC/tPyvbjUYaCSp2r95T6UAcieX+sC/jeIlqFic0dnuBsqX9e6QJhi
         K9S78H2TsQo1HIoNdL+U8r0yHyRWkWxyT5EP8k7lLEsZVmG+0C2ecWRXhmH3H0VkRmSJ
         Pk44bqPQfMLrRXi0LbRzBDbEWmQsQtROUQCJwk7AtUz9s4BhYaRcY6D6hq0rJpsoe7yX
         aYm3c0nS40a6aMF6GAKozDQTI/Pm3lxMdy0iJ4our92flUmUzD4EOJ6B9pKqUIVe6/XP
         GsLg==
X-Gm-Message-State: ACrzQf0w25CLnLJlx76EEzgpNiB4H4k06pkgMVuhSMC6klA6axPcUUPI
	JqvpQsAGT+E8iklLmTC6ZNB4ZT4zkXHocg==
X-Google-Smtp-Source: AMsMyM6pLB8Ryr3cpAAdfXhy4Xwkl9uCmBdpeiyTeIY0KxCS5JGchDWuRxkAB2v9g+owHellobl7+g==
X-Received: by 2002:a05:6402:4411:b0:437:b723:72 with SMTP id y17-20020a056402441100b00437b7230072mr47700eda.38.1666971329105;
        Fri, 28 Oct 2022 08:35:29 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00461aebb2fe2sm2830635edb.54.2022.10.28.08.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:35:28 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 04/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6797
Date: Fri, 28 Oct 2022 18:34:56 +0300
Message-Id: <20221028153505.23741-5-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028153505.23741-1-y.oudjana@protonmail.com>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_083533_203079_F9F6D3D0 
X-CRM114-Status: GOOD (  18.80  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Combine MT6797 pin controller document into MT6779 one. reg and
reg-names property constraints are set using conditionals.
A conditional is also used to make interrupt-related properties
required on the MT6779 pin controller only, since the MT6797
controller doesn't support interrupts (or not yet, at least).
drive-strength and slew-rate properties which weren't described
in the MT6779 document before are brought in from the MT6797 one.
Both pin controllers share a common driver core so they should
both support these properties.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  87 ++++++---
 .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 176 ------------------
 MAINTAINERS                                   |   2 +-
 3 files changed, 67 insertions(+), 198 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index d45f0e75a698..a2141eb0854e 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -8,6 +8,7 @@ title: Mediatek MT6779 Pin Controller
 
 maintainers:
   - Andy Teng <andy.teng@mediatek.com>
+  - Sean Wang <sean.wang@kernel.org>
 
 description:
   The MediaTek pin controller on MT6779 is used to control pin
@@ -15,23 +16,14 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt6779-pinctrl
+    enum:
+      - mediatek,mt6779-pinctrl
+      - mediatek,mt6797-pinctrl
 
   reg:
-    minItems: 9
-    maxItems: 9
-
-  reg-names:
-    items:
-      - const: "gpio"
-      - const: "iocfg_rm"
-      - const: "iocfg_br"
-      - const: "iocfg_lm"
-      - const: "iocfg_lb"
-      - const: "iocfg_rt"
-      - const: "iocfg_lt"
-      - const: "iocfg_tl"
-      - const: "eint"
+    description: Physical addresses for GPIO base(s) and EINT registers.
+
+  reg-names: true
 
   gpio-controller: true
 
@@ -58,18 +50,65 @@ properties:
   "#interrupt-cells":
     const: 2
 
-allOf:
-  - $ref: "pinctrl.yaml#"
-
 required:
   - compatible
   - reg
   - reg-names
   - gpio-controller
   - "#gpio-cells"
-  - interrupt-controller
-  - interrupts
-  - "#interrupt-cells"
+
+allOf:
+  - $ref: "pinctrl.yaml#"
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6779-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+
+        reg-names:
+          items:
+            - const: gpio
+            - const: iocfg_rm
+            - const: iocfg_br
+            - const: iocfg_lm
+            - const: iocfg_lb
+            - const: iocfg_rt
+            - const: iocfg_lt
+            - const: iocfg_tl
+            - const: eint
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6797-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+
+        reg-names:
+          items:
+            - const: gpio
+            - const: iocfgl
+            - const: iocfgb
+            - const: iocfgr
+            - const: iocfgt
+  - if:
+      properties:
+        reg-names:
+          contains:
+            const: eint
+    then:
+      required:
+        - interrupts
+        - interrupt-controller
+        - "#interrupt-cells"
 
 patternProperties:
   '-[0-9]*$':
@@ -111,6 +150,12 @@ patternProperties:
 
           input-schmitt-disable: true
 
+          drive-strength:
+            enum: [2, 4, 8, 12, 16]
+
+          slew-rate:
+            enum: [0, 1]
+
           mediatek,pull-up-adv:
             description: |
               Pull up setings for 2 pull resistors, R0 and R1. User can
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
deleted file mode 100644
index 637a8386e23e..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
+++ /dev/null
@@ -1,176 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6797-pinctrl.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mediatek MT6797 Pin Controller
-
-maintainers:
-  - Sean Wang <sean.wang@kernel.org>
-
-description: |+
-  The MediaTek's MT6797 Pin controller is used to control SoC pins.
-
-properties:
-  compatible:
-    const: mediatek,mt6797-pinctrl
-
-  reg:
-    minItems: 5
-    maxItems: 5
-
-  reg-names:
-    items:
-      - const: gpio
-      - const: iocfgl
-      - const: iocfgb
-      - const: iocfgr
-      - const: iocfgt
-
-  gpio-controller: true
-
-  "#gpio-cells":
-    const: 2
-    description: |
-      Number of cells in GPIO specifier. Since the generic GPIO
-      binding is used, the amount of cells must be specified as 2. See the below
-      mentioned gpio binding representation for description of particular cells.
-
-  interrupt-controller: true
-
-  interrupts:
-    maxItems: 1
-
-  "#interrupt-cells":
-    const: 2
-
-allOf:
-  - $ref: "pinctrl.yaml#"
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - gpio-controller
-  - "#gpio-cells"
-
-patternProperties:
-  '-[0-9]+$':
-    type: object
-    additionalProperties: false
-    patternProperties:
-      'pins':
-        type: object
-        additionalProperties: false
-        description: |
-          A pinctrl node should contain at least one subnodes representing the
-          pinctrl groups available on the machine. Each subnode will list the
-          pins it needs, and how they should be configured, with regard to muxer
-          configuration, pullups, drive strength, input enable/disable and input
-          schmitt.
-        $ref: "/schemas/pinctrl/pincfg-node.yaml"
-
-        properties:
-          pinmux:
-            description:
-              integer array, represents gpio pin number and mux setting.
-              Supported pin number and mux varies for different SoCs, and are
-              defined as macros in <soc>-pinfunc.h directly.
-
-          bias-disable: true
-
-          bias-pull-up: true
-
-          bias-pull-down: true
-
-          input-enable: true
-
-          input-disable: true
-
-          output-enable: true
-
-          output-low: true
-
-          output-high: true
-
-          input-schmitt-enable: true
-
-          input-schmitt-disable: true
-
-          drive-strength:
-            enum: [2, 4, 8, 12, 16]
-
-          slew-rate:
-            enum: [0, 1]
-
-          mediatek,pull-up-adv:
-            description: |
-              Pull up setings for 2 pull resistors, R0 and R1. User can
-              configure those special pins. Valid arguments are described as below:
-              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
-              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
-              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
-              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1, 2, 3]
-
-          mediatek,pull-down-adv:
-            description: |
-              Pull down settings for 2 pull resistors, R0 and R1. User can
-              configure those special pins. Valid arguments are described as below:
-              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
-              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
-              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
-              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1, 2, 3]
-
-          mediatek,tdsel:
-            description: |
-              An integer describing the steps for output level shifter duty
-              cycle when asserted (high pulse width adjustment). Valid arguments
-              are from 0 to 15.
-            $ref: /schemas/types.yaml#/definitions/uint32
-
-          mediatek,rdsel:
-            description: |
-              An integer describing the steps for input level shifter duty cycle
-              when asserted (high pulse width adjustment). Valid arguments are
-              from 0 to 63.
-            $ref: /schemas/types.yaml#/definitions/uint32
-
-        required:
-          - pinmux
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/pinctrl/mt6797-pinfunc.h>
-
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        pio: pinctrl@10005000 {
-            compatible = "mediatek,mt6797-pinctrl";
-            reg = <0 0x10005000 0 0x1000>,
-                  <0 0x10002000 0 0x400>,
-                  <0 0x10002400 0 0x400>,
-                  <0 0x10002800 0 0x400>,
-                  <0 0x10002C00 0 0x400>;
-            reg-names = "gpio", "iocfgl", "iocfgb", "iocfgr", "iocfgt";
-            gpio-controller;
-            #gpio-cells = <2>;
-
-            uart_pins_a: uart-0 {
-                pins1 {
-                    pinmux = <MT6797_GPIO232__FUNC_URXD1>,
-                            <MT6797_GPIO233__FUNC_UTXD1>;
-                };
-            };
-        };
-    };
diff --git a/MAINTAINERS b/MAINTAINERS
index e9759eb08c57..4fd8037263d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16309,7 +16309,7 @@ M:	Sean Wang <sean.wang@kernel.org>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
-F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
 F:	drivers/pinctrl/mediatek/
-- 
2.38.1



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E44C43219
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 17:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inEZQuAh3+2xjqZB82Qf4LpqdPPsY2GuQ5Pi+s62aV0=; b=k3+3u+Q+nzgMDKwVcW1DuaRuPc
	5NVh1jWezydILuZDLU683is6AWUyokjIo5NDfFaDHQa8A7DJnqoxr/f3zLdni4g2suof48D20tb7c
	ECSGxb/ImCx57n3UtuGiS0D3CwomhlO60b0wyH0Jo+JebmUq8CNcK1SzkpDawxm4M+RY1r5P/x+rS
	ZJmslzVNbI9z6DxDwhAY4JglOElLHD2SLCUh0bKDmYksdmZdwqcPK3U1uxNCog/rMjI82GKabCvSt
	nIlz138bT15vIvIn1TCEU3+KHfNHdxsL6B9WpYLsFYj41BS1Cx0oVPpsu+HqnEcbZwEXyC1fW8lhv
	xBltt/xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8S4-00FSFp-Ix; Wed, 05 Oct 2022 17:45:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8RT-00FRwH-MD; Wed, 05 Oct 2022 17:44:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id t4so11221040wmj.5;
        Wed, 05 Oct 2022 10:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=inEZQuAh3+2xjqZB82Qf4LpqdPPsY2GuQ5Pi+s62aV0=;
        b=B5Sv1aJtGc8M0xvKtwPx8k0VUdCf2E44pn6m539p7E0LsSIZnmfRufbRh1K++UoDcP
         3GYRm2hmcN8wBelrW3x7U2WqVdLola/gkUscCvzLZpZTZ2jNOkDnoFAkFzsCL8kdBHAL
         8fooh1bwU/jj1dBTw+CK2whFeY8cyJc/N2fTjlhf22nXZwBn+Xp9jfq4J1TTAf8qf1ik
         hTV7/0SkhavsC9V1WlbQKyFHUxzKo9sXbZJD2gUrfMwrien/BhGnFvb50BzN+lUgDWjG
         ySuxf5AN8pCSB51Mo2+WNX1RqQUeHM+7gRLM6DJ6PLPVE6ENx6rUK+Yamor3gvhj8G31
         UvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=inEZQuAh3+2xjqZB82Qf4LpqdPPsY2GuQ5Pi+s62aV0=;
        b=R4VWG14tC/d06AfEHUud6a4gHmKJRHGF2IAewANToxumPHzpYjbEJ/gjFB+IK6Cbcx
         ZdPH6ahCYlrYu2T2wpvnyClTvevxOSuBv/IlwKcNEx5G8iLsw/WLUQype6eJ4SHLJ6ph
         Ki/ng9tBw0wwrhi5BlZbAEAlyoK7hHdc1WjqQ94i1OXqbkcKM/fD07qHSG6+HCaytolL
         0h+l9/Lg87V8t4CDQLEaGiAeauzi2QTy4lt1xsIvyO8lUKgkuF85sEIlB/1sy5kTJo/Z
         5fLHWB1KPh2ILs6RZIHMSthAxRcHPnfTVWawm6YCKgk3ZZ/4twmM+D8Uzgvdo2gwO7Q1
         Wclw==
X-Gm-Message-State: ACrzQf3pyPnqT7ATLSzbh7zdegv1Lo3jwjzxe0uP1UNCjMl0pWbRAAPw
	k3HlIwH9fiRpEfCirVah5Ao=
X-Google-Smtp-Source: AMsMyM48FS9/tR2IUJCk4Ja69SZGj+glskWPgRapRy+PA3Ndcp0CNLJkJGXcAO3+CmC55X9Q7BXX8g==
X-Received: by 2002:a05:600c:1caa:b0:3a8:4066:981d with SMTP id k42-20020a05600c1caa00b003a84066981dmr4180125wms.54.1664991862344;
        Wed, 05 Oct 2022 10:44:22 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4146000000b0022a403954c3sm16075491wrq.42.2022.10.05.10.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:44:22 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6797
Date: Wed,  5 Oct 2022 20:43:37 +0300
Message-Id: <20221005174343.24240-5-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221005174343.24240-1-y.oudjana@protonmail.com>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_104423_881705_658C762C 
X-CRM114-Status: GOOD (  19.16  )
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
index 99330a7e4ab2..184519342e45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16282,7 +16282,7 @@ M:	Sean Wang <sean.wang@kernel.org>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
-F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
 F:	drivers/pinctrl/mediatek/
-- 
2.38.0



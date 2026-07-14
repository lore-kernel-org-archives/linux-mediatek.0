Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B13C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2026 11:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dta68QNbLoWzOS6PweKTXaAA6m2oOUeYKxDIVzU2tCk=; b=V+rlvD9W2pQLOs+ygv82ec2G1A
	doKBN3RAB0rUjpZuFwGCLBuB6ao84arkvTh0Vh05pzgtrpUX6pNix3TZMghunUNlLzVnRilAUYH/d
	tChG2jgJuy32T3KzkzyTJbUUlLXxB3sdJsEVbKyQjh35jg2QbODhHdJ51EV0x1NunvXQvW/yRgf5D
	KcqKMyJW3cFcUzHAynke7mTsMmNYG2p5Mon9lBrg4u8ooTzNHmh3tHwFeWJneBY4lhMpjxXA+6uJZ
	i9BPV0O0mRTGyy3iu3YPqbZVInOgNCHLvMw9WehL20bqPi3yi74eB+NEoQYTxUrWeNfapXkKlvq3q
	EE8DjDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbn7-0000000Bp4D-0Exy;
	Tue, 14 Jul 2026 11:59:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbmx-0000000Bou7-3ZjW
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jul 2026 11:59:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493c7902f47so37955525e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2026 04:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030342; x=1784635142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dta68QNbLoWzOS6PweKTXaAA6m2oOUeYKxDIVzU2tCk=;
        b=PJcAvWPmNfFE+f3gZ2AC5Ml8YHdbG752/mAkWilQnYI0A53DVressfTKLImsKhVFFB
         JfVdH4RTM+J00Sw1iBwGn4WA8vw65+92JISTBiUU7LFn7F3s1mJdTVewtNmEhXzkHRCg
         AbBzBSVY1E00xngDI9r3AO5BMrR7qHR8tATzGY0vkSVkZlYKRyM1K3ood/54qbiXHeqd
         weysiWLDW43AFaeuPtpSt3aIeHQp2x+fEWpCh2yk0WY3VQlERFZprkE3MkpNzLmTAzwU
         aA5T3H64wLI6AYjB6tDKnIMGtvVFhHU3YH63n0K5lryyGVMEfZw3QKN0lM2D8O5DEqCq
         TU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030342; x=1784635142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dta68QNbLoWzOS6PweKTXaAA6m2oOUeYKxDIVzU2tCk=;
        b=NYIGZVX0gxU1olrUp80xYd0+clb3OB/i1z2P/TgQV1DjKv1IxE7blRHLgQ/s8CyFxd
         Fo7h8kSwLsf/WYXtAcApcwoJiXrBWjeCTaOjf5lwVQy3Tqq/TL2RutSeLW/DfCTYxi0A
         sNONKXKjXMmSiwQ40sk1JU5A9DIvxu1PKBfcn9YCOR9tCHgkyVT9bJ+mvxja7N0FZ01F
         YCkA90zKRlJomDX3a7p69sk867EtR7l1iXkdir01StnvNC+YGgf8GHrGYqu4+8S0xyiK
         vHVo+TNbAHF23qLSqU/3EMVXwNeAStggy3Hy6JlRLBUInQD/AYmJ6N2QWg+hffTx8TVv
         sc4A==
X-Forwarded-Encrypted: i=1; AHgh+Rpw3zE6yK6lu8Y0OsZsCbGmStYgc8dDU9jN6XpoBJZDnwFKx+SwJJQ7MRrJ3OokxhvBqpl61ZQdLyo9mexXLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVdMFEU6my5huM02NcrSkfR5av48o+IqjwwqtUNOi9Pj+mUFUX
	Fc7dJs7XQj+sw8T7A+bXMRdGS5bbjaKNx3FZ+n3iuc6VI+a9VEPxSPIS
X-Gm-Gg: AfdE7cn8X1Wa5lKzfcyAzIuPf1Q48xhY3y5PBHWxxNX2Yl9gk5oG5euiih4Lyq2j54m
	a6Yoc+o/P9QJTQZYvxG+rXfuXgA3yA/NrMe8KFwKjg7MXeljeEP4kMySPstPiG+tee+JjRgpF3E
	mUDxkyP4FQtQxLx4FwSvJYmlLBsgDqh2Pu8caqTP916m27LFvDBnKU1iS5G0IfcpeOfpaubU9/o
	E/i3OEYLIrG3Tn2RHDgdpm+HSJUz/QpisbOE+Odt9Yw+2ROTN7VcHZC1O1E84baxJDnz5EmsZe2
	42RAzF4UBy7F1+yHe0hCyUKQIGTTI35DMkqjdVqJtfqx40cUl7KMFpyw63sMLFUrN427YLu8ich
	O8TglN/4Popx/Gg0yUncERYIj76n4dKXYCm7hYpy8nTmDOOLkDGFIURnsAk2iujuAfbc+CXiZpQ
	QUAaQk/OMmmaqlG1SjEJ+4Qrb8hZSmMLcZW5whvQIdA1H+MYK8FtKamIVLLkRPid8XtsOprVtar
	LrioGUB
X-Received: by 2002:a05:600c:a4a:b0:493:e9c2:ba60 with SMTP id 5b1f17b1804b1-493f8820ab3mr130769725e9.22.1784030341641;
        Tue, 14 Jul 2026 04:59:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm180531655e9.2.2026.07.14.04.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:59:01 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/4] dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document 2-lanes
Date: Tue, 14 Jul 2026 13:58:45 +0200
Message-ID: <20260714115848.8537-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714115848.8537-1-ansuelsmth@gmail.com>
References: <20260714115848.8537-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_045904_979973_04C1B481 
X-CRM114-Status: GOOD (  18.69  )
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

To permit proper documentation of required property to support PCIe
configured for 2-lanes mode, split the Airoha schema part from the
mediatek-gen3 schema to a dedicated schema.

A PCIe configured for 2-lanes mode require an additional reg for the
secondary PCIe to be configured and the airoha,scu phandle to correctly
configure the PCIe MUX.

Rework the mediatek-gen3 schema to drop any redundant constraint previsouly
introduced for Airoha PCIe properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/pci/airoha,en7581-pcie.yaml      | 244 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 2 files changed, 249 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml b/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
new file mode 100644
index 000000000000..78a181a3b599
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
@@ -0,0 +1,244 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Gen3 PCIe controller on Airoha SoCs
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: |+
+  PCIe Gen3 MAC controller for Airoha SoCs, it supports Gen3 speed
+  and compatible with Gen2, Gen1 speed.
+
+  This PCIe controller supports up to 256 MSI vectors, the MSI hardware
+  block diagram is as follows:
+
+                    +-----+
+                    | GIC |
+                    +-----+
+                       ^
+                       |
+                   port->irq
+                       |
+               +-+-+-+-+-+-+-+-+
+               |0|1|2|3|4|5|6|7| (PCIe intc)
+               +-+-+-+-+-+-+-+-+
+                ^ ^           ^
+                | |    ...    |
+        +-------+ +------+    +-----------+
+        |                |                |
+  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
+  |0|1|...|30|31|  |0|1|...|30|31|  |0|1|...|30|31| (MSI sets)
+  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
+   ^ ^      ^  ^    ^ ^      ^  ^    ^ ^      ^  ^
+   | |      |  |    | |      |  |    | |      |  |  (MSI vectors)
+   | |      |  |    | |      |  |    | |      |  |
+
+    (MSI SET0)       (MSI SET1)  ...   (MSI SET7)
+
+  With 256 MSI vectors supported, the MSI vectors are composed of 8 sets,
+  each set has its own address for MSI message, and supports 32 MSI vectors
+  to generate interrupt.
+
+properties:
+  compatible:
+    const: airoha,en7581-pcie
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  ranges:
+    maxItems: 1
+
+  resets:
+    minItems: 1
+    maxItems: 4
+
+  reset-names:
+    minItems: 1
+    maxItems: 4
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: sys-ck
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: pcie-phy
+
+  num-lanes:
+    enum: [1, 2]
+
+  mediatek,pbus-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to pbus-csr syscon
+          - description: offset of pbus-csr base address register
+          - description: offset of pbus-csr base address mask register
+    description:
+      Phandle with two arguments to the syscon node used to detect if
+      a given address is accessible on PCIe controller.
+
+  airoha,scu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to airoha SCU syscon
+    description:
+      Phandle to SCU syscon to configure PCIe MUX for 2 lines support.
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller:
+    description: Interrupt controller node for handling INTx PCI interrupts.
+    type: object
+    properties:
+      '#address-cells':
+        const: 0
+      '#interrupt-cells':
+        const: 1
+      interrupt-controller: true
+
+    required:
+      - '#address-cells'
+      - '#interrupt-cells'
+      - interrupt-controller
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - ranges
+  - clocks
+  - clock-names
+  - '#interrupt-cells'
+  - interrupt-controller
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - if:
+      properties:
+        num-lanes:
+          const: 2
+    then:
+      properties:
+        reg:
+          minItems: 2
+
+        reg-names:
+          items:
+            - const: pcie-mac
+            - const: sec-pcie-mac
+
+        resets:
+          minItems: 4
+
+        reset-names:
+          items:
+            - const: phy-lane0
+            - const: phy-lane1
+            - const: perstout
+            - const: sec-perstout
+
+      required:
+        - airoha,scu
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - const: pcie-mac
+
+        resets:
+          minItems: 2
+          maxItems: 3
+
+        reset-names:
+          minItems: 2
+          items:
+            - enum: [ phy-lane0, phy-lane1, phy-lane2 ]
+            - enum: [ phy-lane1, perstout ]
+            - const: phy-lane2
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1fc00000 {
+            compatible = "airoha,en7581-pcie";
+            device_type = "pci";
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            reg = <0x0 0x1fc00000 0x0 0x1670>,
+                  <0x0 0x1fc20000 0x0 0x1670>;
+            reg-names = "pcie-mac", "sec-pcie-mac";
+
+            clocks = <&scuclk 7>;
+            clock-names = "sys-ck";
+
+            phys = <&pciephy>;
+            phy-names = "pcie-phy";
+
+            ranges = <0x02000000 0 0x20000000 0x0 0x20000000 0 0x4000000>;
+
+            resets = <&scuclk 48>,
+                     <&scuclk 49>,
+                     <&scuclk 53>,
+                     <&scuclk 54>;
+            reset-names = "phy-lane0", "phy-lane1",
+                          "perstout", "sec-perstout";
+
+            num-lanes = <2>;
+
+            mediatek,pbus-csr = <&pbus_csr 0x0 0x4>;
+
+            airoha,scu = <&scuclk>;
+
+            interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+            bus-range = <0x00 0xff>;
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &pcie_intc 0>,
+                            <0 0 0 2 &pcie_intc 1>,
+                            <0 0 0 3 &pcie_intc 2>,
+                            <0 0 0 4 &pcie_intc 3>;
+            pcie_intc: interrupt-controller {
+                      #address-cells = <0>;
+                      #interrupt-cells = <1>;
+                      interrupt-controller;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 4db700fc36ba..510f1f2b1c5a 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -59,7 +59,6 @@ properties:
           - const: mediatek,mt8196-pcie
       - const: mediatek,mt8192-pcie
       - const: mediatek,mt8196-pcie
-      - const: airoha,en7581-pcie
 
   reg:
     maxItems: 1
@@ -83,20 +82,20 @@ properties:
 
   resets:
     minItems: 1
-    maxItems: 3
+    maxItems: 2
 
   reset-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 2
     items:
-      enum: [ phy, mac, phy-lane0, phy-lane1, phy-lane2 ]
+      enum: [ phy, mac ]
 
   clocks:
-    minItems: 1
+    minItems: 4
     maxItems: 6
 
   clock-names:
-    minItems: 1
+    minItems: 4
     maxItems: 6
 
   assigned-clocks:
@@ -115,17 +114,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  mediatek,pbus-csr:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      - items:
-          - description: phandle to pbus-csr syscon
-          - description: offset of pbus-csr base address register
-          - description: offset of pbus-csr base address mask register
-    description:
-      Phandle with two arguments to the syscon node used to detect if
-      a given address is accessible on PCIe controller.
-
   '#interrupt-cells':
     const: 1
 
@@ -177,16 +165,6 @@ allOf:
             - const: peri_26m
             - const: top_133m
 
-        resets:
-          minItems: 1
-          maxItems: 2
-
-        reset-names:
-          minItems: 1
-          maxItems: 2
-
-        mediatek,pbus-csr: false
-
   - if:
       properties:
         compatible:
@@ -208,16 +186,6 @@ allOf:
             - const: peri_26m
             - const: peri_mem
 
-        resets:
-          minItems: 1
-          maxItems: 2
-
-        reset-names:
-          minItems: 1
-          maxItems: 2
-
-        mediatek,pbus-csr: false
-
   - if:
       properties:
         compatible:
@@ -246,8 +214,6 @@ allOf:
             - const: phy
             - const: mac
 
-        mediatek,pbus-csr: false
-
   - if:
       properties:
         compatible:
@@ -257,7 +223,6 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
           maxItems: 4
 
         clock-names:
@@ -267,38 +232,6 @@ allOf:
             - const: peri_26m
             - const: top_133m
 
-        resets:
-          minItems: 1
-          maxItems: 2
-
-        reset-names:
-          minItems: 1
-          maxItems: 2
-
-        mediatek,pbus-csr: false
-
-  - if:
-      properties:
-        compatible:
-          const: airoha,en7581-pcie
-    then:
-      properties:
-        clocks:
-          maxItems: 1
-
-        clock-names:
-          items:
-            - const: sys-ck
-
-        resets:
-          minItems: 3
-
-        reset-names:
-          items:
-            - const: phy-lane0
-            - const: phy-lane1
-            - const: phy-lane2
-
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0



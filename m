Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5390CDE00B
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 21:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXBSiVYw4dw99aOLLsw4EHudQGFh22uKX4umeTTHsO4=; b=vnHs5LipyuaR1wOMd2NlS/hWIr
	iBpIg0sh3kV571w0W8u1qQFIpgpt7u7wG+Zgn8Hdfz2W7HNKS0q/sjFVp0vPw0/dJl7MoJwuBt38G
	OQKBCxX8JMQgFwSt9+WUwcQo0F1IHBtYmypP1dcW+FrRSdtCnwJ36pFgSJe4Q9Q6njESxNIxHE+Xh
	88mQ1O+X3VvSL3GLUW6dJSYRTxseqGEJkUi7nAJgBeppEVSwhaRltf+vxswU7P/5C3fTLkZLYsH2u
	cyXAokjT+TzZVRraql3OtLOl9z3rwXtUdir9JNSUYuAvBOu5l1P7DNFXeN3gYg93Hvuwt1/v50bTw
	WaAK5nXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5P-00000009tmt-2ycY;
	Thu, 25 Jun 2026 21:58:15 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5E-00000009tek-3emW
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 21:58:06 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so10599885e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2026 14:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424682; x=1783029482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXBSiVYw4dw99aOLLsw4EHudQGFh22uKX4umeTTHsO4=;
        b=U5UWA22hfbjN/+JbEDyw/vQiS0LgnTIYpAefbeyv+0kIYPEHQVtEmJ2kd4pv+fen7a
         HMP64LpeHHIJ9MZ8LvK2FcWh3fOG1eufKJkGKYAUVvwH9glyFLQeytKSRFSZ+Rup2fVf
         jV3A95tsHteSc3uczASdmhUROeZ3tkzGVe1jdZzT32iqUAKbpeY75AG5HUamcri6iu8L
         iQWwn+hcLtVVHp4CPAPK1EZSFFAIgklrSkLs4zj0YxtK4757yyih2wY5EZLP+T/fEMbI
         AA52OcoP0oBDtJzUDEWQPZa3IwtVG6WLUlM5ftyi+ppFoOhPeZNytNls8iImQC89Jt5A
         sYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424682; x=1783029482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wXBSiVYw4dw99aOLLsw4EHudQGFh22uKX4umeTTHsO4=;
        b=EeFiWaJiZvNMe37ZJTJ8XzkhVQFQgVitHm2M/b05c7/oiDQ9NPW/gFFWUao2qFfMiH
         qWS2crTJqLs51uiHUEMMJSu/tE6PhMVFpWE/eJ5T0cc3mvqfXJ0NiIPA3f5OFuz2gQhX
         mz8CypRYoWkZDL91t+6wGjPGxYxOhKNzDgqAkrqq/pmZuPkGdY90w+jcFDQNgI2VZHzv
         tUBV4iNIbYifFB3/tCai9VlYgE7tMrdeZbBwDoXq42udnCOzVaXjcxQV1QsqgWyN7xUw
         E57O7YgkniF1Mdq56NaaXthHLCbqu3MpKNDjF5xBOhnw4FS1OuIfb2SNcBYX74XrdWZo
         6RiA==
X-Forwarded-Encrypted: i=1; AFNElJ+DL2VVX1eg3ytuo6Uvbq5bs5Dyv+ClW8Vl6/HjGvTtSgOTbMrBxJCK3rUpScs0PEuux3VwGMRp9muYbFDR9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaNxlk/Sde8OKTu38iJp2pjrFosMWVp0DziinsaYt9BRJjHZpG
	PMWiDA6DFQKJfwslr0V/ZYuzZGpJGJbiulg+dFpQIv8C2G/7zaOGLH4O
X-Gm-Gg: AfdE7cnIvN4/WR7wcOBrz+YCCD3T1BCQcy1j/OzmZFZ51MbmPVjc6py44N2WsRxDlBK
	y+4Vh+5EwcVBSYaNViPrZ9TLzAbQhzrqVaND4oR6rZW2+jAkyq1ADXpepVTAWweenC5j2WIwHfC
	tXeu3N0iH8lBhXCNojuTrVLCL/Um5rvzFfumozZBqkefFovmaT8JdLQ5CavVfRRwcSK2aT4Mbuz
	gk3Iaou8EZNowNHAyr56B7qu4ufEQXk05FFgsRCp4fY6G83V+Ym+hl5Uro6FQ6ZZCcVpFk2yt92
	gTEBWEtf1ZBLS2KE99v4H40RlPvbkoNhQmlRq4RHTKOWLPBSaD2CF0y+DNZ+7hBlBRH9dC+q0Ah
	eeq06JH/tq5wYMXLPqGvpeb1thFLAy0tzx+NBC8gyY7oXStwQhcPHjbUrVQARkJbobN9+Yoxc49
	ArAp8n1C7X3uCkyZ4NuEdpSiOGfgvXiEHsOncqbBnEcQQU1zBMEkLXeyo1fEs3UHPowXkkYP+ZP
	PKNxFC20oq2
X-Received: by 2002:a05:600c:638e:b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-492663ea3d3mr48190505e9.8.1782424682103;
        Thu, 25 Jun 2026 14:58:02 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:58:01 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH 3/4] dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document 2-lanes
Date: Thu, 25 Jun 2026 23:57:36 +0200
Message-ID: <20260625215741.3253212-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625215741.3253212-1-ansuelsmth@gmail.com>
References: <20260625215741.3253212-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_145804_954667_0C5F600F 
X-CRM114-Status: GOOD (  18.64  )
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
 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 2 files changed, 256 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml b/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
new file mode 100644
index 000000000000..977c1816572c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
@@ -0,0 +1,251 @@
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
+    minItems: 1
+    maxItems: 8
+
+  iommu-map:
+    maxItems: 1
+
+  iommu-map-mask:
+    const: 0
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
+    description: Interrupt controller node for handling legacy PCI interrupts.
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
+        regs:
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
+            - enum: [ phy-lane0, phy-lane1, phy-lan2 ]
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



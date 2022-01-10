Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7213FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 05:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BYiwO2mrMelS+Np7XgiMExkk3qc1QsOZxBhC7DRMiK4=; b=3k5M2mqnEeimwG
	bV51PYt4wbMgcBK9t6GRoPSkj67ie93Qux0lVuR2aFQnJuYXrw6EeH5b+hoUMcjKO6H5jgJmQu787
	Nkzq9tu3uvMOekWLc4k8Yx1uvIv3DSWC84kJ3XzeiO3/mySfVRbw/0waG//z6gu/+xtqrO3T5CV+N
	H3U1R3zoOh5TDc3e+WtAceuyAIGjvtGyRLUg0xOvXanXQ/P424qwWu9aE9kwx9oOqLY6BkEwkHtF2
	2JD/uS3S9JYyorWhzGMgxKBQSD8JPaaez4hyyUlQKHM7TipyL9htttuFZIZ2NHIYbvB7kQ5IqEm+B
	Qd09Qpful0rL+8XvsFVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6nR0-009LSF-Bs; Mon, 10 Jan 2022 05:41:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6nQd-009LMx-An; Mon, 10 Jan 2022 05:41:14 +0000
X-UUID: 1ef59fdd4c984a5a9add0a647887e1d6-20220109
X-UUID: 1ef59fdd4c984a5a9add0a647887e1d6-20220109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 512163961; Sun, 09 Jan 2022 22:41:04 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 9 Jan 2022 21:38:00 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 10 Jan 2022 13:37:52 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Jan 2022 13:37:52 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Leilk Liu
 <leilk.liu@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: spi: Convert spi-mt65xx & spi-slave-mt27xx
 to json-schema
Date: Mon, 10 Jan 2022 13:37:43 +0800
Message-ID: <20220110053744.30323-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_214111_409200_1DC8279B 
X-CRM114-Status: GOOD (  19.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert Mediatek ARM SOC's SPI Master & Slave controller binding
to json-schema format.

Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
---
 .../bindings/spi/mediatek,spi-mt65xx.yaml     | 96 +++++++++++++++++++
 .../spi/mediatek,spi-slave-mt27xx.yaml        | 69 +++++++++++++
 .../devicetree/bindings/spi/spi-mt65xx.txt    | 68 -------------
 .../bindings/spi/spi-slave-mt27xx.txt         | 33 -------
 4 files changed, 165 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-mt65xx.txt
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-slave-mt27xx.txt

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
new file mode 100644
index 000000000000..cfa36977eea1
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPI Bus controller for MediaTek ARM SoCs
+
+maintainers:
+  - Leilk Liu <leilk.liu@mediatek.com>
+
+allOf:
+  - $ref: /spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt7629-spi
+          - const: mediatek,mt7622-spi
+      - items:
+          - enum:
+              - mediatek,mt8516-spi
+          - const: mediatek,mt2712-spi
+      - items:
+          - enum:
+              - mediatek,mt6779-spi
+              - mediatek,mt8192-spi
+              - mediatek,mt8195-spi
+          - const: mediatek,mt6765-spi
+      - const: mediatek,mt2701-spi
+      - const: mediatek,mt6589-spi
+      - const: mediatek,mt6893-spi
+      - const: mediatek,mt8135-spi
+      - const: mediatek,mt8173-spi
+      - const: mediatek,mt8183-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock used for the parent clock
+      - description: clock used for the muxes clock
+      - description: clock used for the clock gate
+
+  clock-names:
+    items:
+      - const: parent-clk
+      - const: sel-clk
+      - const: spi-clk
+
+  mediatek,pad-select:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 4
+    items:
+      enum: [0, 1, 2, 3]
+    description:
+      specify which pins group(ck/mi/mo/cs) spi controller used.
+      This is an array.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi@1100a000 {
+      compatible = "mediatek,mt8173-spi";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      reg = <0x1100a000 0x1000>;
+      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>;
+      clocks = <&topckgen CLK_TOP_SYSPLL3_D2>,
+               <&topckgen CLK_TOP_SPI_SEL>,
+               <&pericfg CLK_PERI_SPI0>;
+      clock-names = "parent-clk", "sel-clk", "spi-clk";
+      cs-gpios = <&pio 105 GPIO_ACTIVE_LOW>, <&pio 72 GPIO_ACTIVE_LOW>;
+      mediatek,pad-select = <1>, <0>;
+    };
diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
new file mode 100644
index 000000000000..783b16c52928
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/mediatek,spi-slave-mt27xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPI Slave controller for MediaTek ARM SoCs
+
+maintainers:
+  - Leilk Liu <leilk.liu@mediatek.com>
+
+allOf:
+  - $ref: /spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt2712-spi-slave
+      - const: mediatek,mt8195-spi-slave
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock used for the clock gate
+
+  clock-names:
+    items:
+      - const: spi
+
+  assigned-clocks:
+    maxItems: 1
+    description: |
+      The mux clock for the given platform.
+
+  assigned-clock-parents:
+    maxItems: 1
+    description: |
+      The parent of mux clock for the given platform.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt2712-clk.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi@10013000 {
+      compatible = "mediatek,mt2712-spi-slave";
+      reg = <0x10013000 0x100>;
+      interrupts = <GIC_SPI 283 IRQ_TYPE_LEVEL_LOW>;
+      clocks = <&infracfg CLK_INFRA_AO_SPI1>;
+      clock-names = "spi";
+      assigned-clocks = <&topckgen CLK_TOP_SPISLV_SEL>;
+      assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL1_D2>;
+    };
diff --git a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
deleted file mode 100644
index 2a24969159cc..000000000000
--- a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
+++ /dev/null
@@ -1,68 +0,0 @@
-Binding for MTK SPI controller
-
-Required properties:
-- compatible: should be one of the following.
-    - mediatek,mt2701-spi: for mt2701 platforms
-    - mediatek,mt2712-spi: for mt2712 platforms
-    - mediatek,mt6589-spi: for mt6589 platforms
-    - mediatek,mt6765-spi: for mt6765 platforms
-    - mediatek,mt7622-spi: for mt7622 platforms
-    - "mediatek,mt7629-spi", "mediatek,mt7622-spi": for mt7629 platforms
-    - mediatek,mt8135-spi: for mt8135 platforms
-    - mediatek,mt8173-spi: for mt8173 platforms
-    - mediatek,mt8183-spi: for mt8183 platforms
-    - mediatek,mt6893-spi: for mt6893 platforms
-    - "mediatek,mt8192-spi", "mediatek,mt6765-spi": for mt8192 platforms
-    - "mediatek,mt8195-spi", "mediatek,mt6765-spi": for mt8195 platforms
-    - "mediatek,mt8516-spi", "mediatek,mt2712-spi": for mt8516 platforms
-    - "mediatek,mt6779-spi", "mediatek,mt6765-spi": for mt6779 platforms
-
-- #address-cells: should be 1.
-
-- #size-cells: should be 0.
-
-- reg: Address and length of the register set for the device
-
-- interrupts: Should contain spi interrupt
-
-- clocks: phandles to input clocks.
-  The first should be one of the following. It's PLL.
-   -  <&clk26m>: specify parent clock 26MHZ.
-   -  <&topckgen CLK_TOP_SYSPLL3_D2>: specify parent clock 109MHZ.
-				      It's the default one.
-   -  <&topckgen CLK_TOP_SYSPLL4_D2>: specify parent clock 78MHZ.
-   -  <&topckgen CLK_TOP_UNIVPLL2_D4>: specify parent clock 104MHZ.
-   -  <&topckgen CLK_TOP_UNIVPLL1_D8>: specify parent clock 78MHZ.
-  The second should be <&topckgen CLK_TOP_SPI_SEL>. It's clock mux.
-  The third is <&pericfg CLK_PERI_SPI0>. It's clock gate.
-
-- clock-names: shall be "parent-clk" for the parent clock, "sel-clk" for the
-  muxes clock, and "spi-clk" for the clock gate.
-
-Optional properties:
--cs-gpios: see spi-bus.txt.
-
-- mediatek,pad-select: specify which pins group(ck/mi/mo/cs) spi
-  controller used. This is an array, the element value should be 0~3,
-  only required for MT8173.
-    0: specify GPIO69,70,71,72 for spi pins.
-    1: specify GPIO102,103,104,105 for spi pins.
-    2: specify GPIO128,129,130,131 for spi pins.
-    3: specify GPIO5,6,7,8 for spi pins.
-
-Example:
-
-- SoC Specific Portion:
-spi: spi@1100a000 {
-	compatible = "mediatek,mt8173-spi";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0 0x1100a000 0 0x1000>;
-	interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&topckgen CLK_TOP_SYSPLL3_D2>,
-		 <&topckgen CLK_TOP_SPI_SEL>,
-		 <&pericfg CLK_PERI_SPI0>;
-	clock-names = "parent-clk", "sel-clk", "spi-clk";
-	cs-gpios = <&pio 105 GPIO_ACTIVE_LOW>, <&pio 72 GPIO_ACTIVE_LOW>;
-	mediatek,pad-select = <1>, <0>;
-};
diff --git a/Documentation/devicetree/bindings/spi/spi-slave-mt27xx.txt b/Documentation/devicetree/bindings/spi/spi-slave-mt27xx.txt
deleted file mode 100644
index 9192724540fd..000000000000
--- a/Documentation/devicetree/bindings/spi/spi-slave-mt27xx.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Binding for MTK SPI Slave controller
-
-Required properties:
-- compatible: should be one of the following.
-    - mediatek,mt2712-spi-slave: for mt2712 platforms
-    - mediatek,mt8195-spi-slave: for mt8195 platforms
-- reg: Address and length of the register set for the device.
-- interrupts: Should contain spi interrupt.
-- clocks: phandles to input clocks.
-  It's clock gate, and should be <&infracfg CLK_INFRA_AO_SPI1>.
-- clock-names: should be "spi" for the clock gate.
-
-Optional properties:
-- assigned-clocks: it's mux clock, should be <&topckgen CLK_TOP_SPISLV_SEL>.
-- assigned-clock-parents: parent of mux clock.
-  It's PLL, and should be one of the following.
-   -  <&topckgen CLK_TOP_UNIVPLL1_D2>: specify parent clock 312MHZ.
-				       It's the default one.
-   -  <&topckgen CLK_TOP_UNIVPLL1_D4>: specify parent clock 156MHZ.
-   -  <&topckgen CLK_TOP_UNIVPLL2_D4>: specify parent clock 104MHZ.
-   -  <&topckgen CLK_TOP_UNIVPLL1_D8>: specify parent clock 78MHZ.
-
-Example:
-- SoC Specific Portion:
-spis1: spi@10013000 {
-	compatible = "mediatek,mt2712-spi-slave";
-	reg = <0 0x10013000 0 0x100>;
-	interrupts = <GIC_SPI 283 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&infracfg CLK_INFRA_AO_SPI1>;
-	clock-names = "spi";
-	assigned-clocks = <&topckgen CLK_TOP_SPISLV_SEL>;
-	assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL1_D2>;
-};
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21635C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvrlkLrz5+UjuVkDlu4+ivxlhxLYfVuU8BW6gZPMLcU=; b=e/v/fMRrYqRyFG
	fhNdIWZmJ6fSdAcKOGak/PiBPWPm2sa7G0Xpoq2sdOTiCocu0/gATzMpoGUyed9qX+wZGOJAicxlq
	23JfqBCWgr8TClZ7a78B5SBon9E3DnIcDTO9bSpVvgeYe5bL4JaW1Y1dyMfF3gm+5EktMwkvwAMnK
	9FcDH68kh/6qWvRHjDW54OFua/jajDbhZI+dxcVb5wIII4XeNN8AdPzH7inAMKIiHHtyf8d2//8sv
	qNPOmuE7EyrqZy3x0e0ppDsJ7Thxy5G/O5Z0tjokzFyHCg5kIyzmF93anwLeAwnmS7zl1Ft2h3qVd
	+q6pakWSJrdP8Gb0kf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7b0D-0029Yd-48; Wed, 12 Jan 2022 10:37:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7azN-0029BX-Ep; Wed, 12 Jan 2022 10:36:23 +0000
X-UUID: e41ee720899f468598342e7568d06d31-20220112
X-UUID: e41ee720899f468598342e7568d06d31-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1686796104; Wed, 12 Jan 2022 03:36:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 02:36:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 12 Jan 2022 18:36:15 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Jan 2022 18:36:14 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Leilk Liu
 <leilk.liu@mediatek.com>
Subject: [PATCH V2 2/3] dt-bindings: spi: Convert spi-mt65xx to json-schema
Date: Wed, 12 Jan 2022 18:36:08 +0800
Message-ID: <20220112103609.17421-3-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112103609.17421-1-leilk.liu@mediatek.com>
References: <20220112103609.17421-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_023621_547075_8539ABAE 
X-CRM114-Status: GOOD (  19.10  )
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

Convert Mediatek ARM SOC's SPI Master controller binding
to json-schema format.

Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
---
 .../bindings/spi/mediatek,spi-mt65xx.yaml     | 99 +++++++++++++++++++
 .../devicetree/bindings/spi/spi-mt65xx.txt    | 68 -------------
 2 files changed, 99 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-mt65xx.txt

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
new file mode 100644
index 000000000000..71f0cf6e5d70
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -0,0 +1,99 @@
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
+      - const: mediatek,mt2712-spi
+      - const: mediatek,mt6589-spi
+      - const: mediatek,mt6765-spi
+      - const: mediatek,mt6893-spi
+      - const: mediatek,mt7622-spi
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
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

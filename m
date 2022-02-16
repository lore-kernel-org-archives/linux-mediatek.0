Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB21C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 11:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E0jv1BsezAAVeHb5GbAdyxhHeFLtrTtnhAhmgKVIrDg=; b=Gim3yjzYcXgNcL
	iTEIJXvOoo/vH/V51No0+tGMz5YjVvsRsdEvidZ/dz9IXHOqgSzzSoqICMZopVx/yBtS8zOYrDv7M
	Rle+mNGBHm+4Mupbw0hKc9+xuZbnbyPkWIyf5vDqOpRCZF3Zy49FhnrSdvbcQz7pfZ75h3H5ZVSV7
	M7HNqvjlNNNmIf8XHqmkoHgmlbtiOHfNVGDLC8WLLpiLGKtjnUHAqgt3v3MbdiMKyRvR/Wt7R2g6E
	ijGzXF7U7DfZzPWy5nLTtM2MUas6cwqzyFRLxgx/Vsa1B2r9KnH1/Q89qAE/F8lOnpyXCOfpO89zB
	EPSOLIioF2cABuEUTgYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKIgP-006m4I-9j; Wed, 16 Feb 2022 11:41:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKIgB-006m1b-68; Wed, 16 Feb 2022 11:41:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 656A61F44D54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645011660;
 bh=b8gU2yyRE9zuDbE6QcLKI6uc2ZtLgxWDdeRbcJsIeFE=;
 h=From:To:Cc:Subject:Date:From;
 b=QYKEFkTSLfs7h8SzJiOIgPUAScdTU8uky5S4dm1fEkCBAkhr+63WoaapyKK3PCjqZ
 LcSxpyACu2nG/ndKeB32J4/siV3rcTE2xJim85NTztYDpCjnkES2TFhJ34/ZZeLLYw
 oqPQYFS18ai1S/IpVsi9aXsDB3c09an+1kMNRUkMfpYXEbTXVkRUs7oWvmmfg75TIO
 2FqZ+DT1qJ/q33jr0r65bcg3goeQDr5M4s+ijTyl0Y2OM7mSqg0ArXVz/u0jDlIPQa
 lwW5X/d1cFji62DatDLNc2cXoOmGx4VCED7Eckxc0E5pCkmidlU2Q9krIA+miMQLdx
 0tN0+kRZj2aDg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: vkoul@kernel.org
Cc: robh+dt@kernel.org, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 long.cheng@mediatek.com, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: dma: Convert mtk-uart-apdma to DT schema
Date: Wed, 16 Feb 2022 12:40:54 +0100
Message-Id: <20220216114054.269656-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_034103_658181_E13FE361 
X-CRM114-Status: GOOD (  15.15  )
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

Convert the MediaTek UART APDMA Controller binding to DT schema.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/dma/mediatek,uart-dma.yaml       | 112 ++++++++++++++++++
 .../bindings/dma/mtk-uart-apdma.txt           |  56 ---------
 2 files changed, 112 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt

diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
new file mode 100644
index 000000000000..4583c8f535b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/mediatek,uart-dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek UART APDMA controller
+
+maintainers:
+  - Long Cheng <long.cheng@mediatek.com>
+
+description: |
+  The MediaTek UART APDMA controller provides DMA capabilities
+  for the UART peripheral bus.
+
+allOf:
+  - $ref: "dma-controller.yaml#"
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt2712-uart-dma
+              - mediatek,mt8516-uart-dma
+          - const: mediatek,mt6577-uart-dma
+      - enum:
+          - mediatek,mt6577-uart-dma
+
+  reg:
+    minItems: 1
+    maxItems: 16
+
+  interrupts:
+    description: |
+      TX, RX interrupt lines for each UART APDMA channel
+    minItems: 1
+    maxItems: 32
+
+  clocks:
+    description: Must contain one entry for the APDMA main clock
+    maxItems: 1
+
+  clock-names:
+    const: apdma
+
+  "#dma-cells":
+    const: 1
+    description: |
+      The first cell specifies the UART APDMA channel number
+
+  dma-requests:
+    description: |
+      Number of virtual channels of the UART APDMA controller
+    maximum: 16
+
+  mediatek,dma-33bits:
+    type: boolean
+    description: Enable 33-bits UART APDMA support
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#dma-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt2712-clk.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        apdma: dma-controller@11000400 {
+            compatible = "mediatek,mt2712-uart-dma",
+                         "mediatek,mt6577-uart-dma";
+            reg = <0 0x11000400 0 0x80>,
+                  <0 0x11000480 0 0x80>,
+                  <0 0x11000500 0 0x80>,
+                  <0 0x11000580 0 0x80>,
+                  <0 0x11000600 0 0x80>,
+                  <0 0x11000680 0 0x80>,
+                  <0 0x11000700 0 0x80>,
+                  <0 0x11000780 0 0x80>,
+                  <0 0x11000800 0 0x80>,
+                  <0 0x11000880 0 0x80>,
+                  <0 0x11000900 0 0x80>,
+                  <0 0x11000980 0 0x80>;
+            interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_LOW>,
+                         <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
+                         <GIC_SPI 105 IRQ_TYPE_LEVEL_LOW>,
+                         <GIC_SPI 106 IRQ_TYPE_LEVEL_LOW>,
+                         <GIC_SPI 107 IRQ_TYPE_LEVEL_LOW>,
+                         <GIC_SPI 108 IRQ_TYPE_LEVEL_LOW>,
+                         <GIC_SPI 109 IRQ_TYPE_LEVEL_LOW>,
+                         <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>,
+                         <GIC_SPI 111 IRQ_TYPE_LEVEL_LOW>,
+                         <GIC_SPI 112 IRQ_TYPE_LEVEL_LOW>,
+                         <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>,
+                         <GIC_SPI 114 IRQ_TYPE_LEVEL_LOW>;
+            dma-requests = <12>;
+            clocks = <&pericfg CLK_PERI_AP_DMA>;
+            clock-names = "apdma";
+            mediatek,dma-33bits;
+            #dma-cells = <1>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
deleted file mode 100644
index fef9c1eeb264..000000000000
--- a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-* Mediatek UART APDMA Controller
-
-Required properties:
-- compatible should contain:
-  * "mediatek,mt2712-uart-dma" for MT2712 compatible APDMA
-  * "mediatek,mt6577-uart-dma" for MT6577 and all of the above
-  * "mediatek,mt8516-uart-dma", "mediatek,mt6577" for MT8516 SoC
-
-- reg: The base address of the APDMA register bank.
-
-- interrupts: A single interrupt specifier.
- One interrupt per dma-requests, or 8 if no dma-requests property is present
-
-- dma-requests: The number of DMA channels
-
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: The APDMA clock for register accesses
-
-- mediatek,dma-33bits: Present if the DMA requires support
-
-Examples:
-
-	apdma: dma-controller@11000400 {
-		compatible = "mediatek,mt2712-uart-dma",
-			     "mediatek,mt6577-uart-dma";
-		reg = <0 0x11000400 0 0x80>,
-		      <0 0x11000480 0 0x80>,
-		      <0 0x11000500 0 0x80>,
-		      <0 0x11000580 0 0x80>,
-		      <0 0x11000600 0 0x80>,
-		      <0 0x11000680 0 0x80>,
-		      <0 0x11000700 0 0x80>,
-		      <0 0x11000780 0 0x80>,
-		      <0 0x11000800 0 0x80>,
-		      <0 0x11000880 0 0x80>,
-		      <0 0x11000900 0 0x80>,
-		      <0 0x11000980 0 0x80>;
-		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 105 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 106 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 107 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 108 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 109 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 111 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 112 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 114 IRQ_TYPE_LEVEL_LOW>;
-		dma-requests = <12>;
-		clocks = <&pericfg CLK_PERI_AP_DMA>;
-		clock-names = "apdma";
-		mediatek,dma-33bits;
-		#dma-cells = <1>;
-	};
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

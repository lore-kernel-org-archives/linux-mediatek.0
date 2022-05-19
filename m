Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE1BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CYFhOpwYBZiSiTcP8gls5a7PA9RDh5FD37Ib46vLM5c=; b=1/KkT+oPcLj1/i
	8KqYOff/jKSDmt/iQbGpKCM5njOicK8PmCj+7Oxuv+Uri3mKNtJiYNTQEOhDgyvmlxD/s4VIi5qZq
	nY7b9YC0iaZ07XOAyKCO6uUTGl99vs0pxz+qM1I5JEpxlpee5getXTD6sxondrEF0HOUqQJ6/MHkJ
	ujqrfAn4fgH4spk+Vv6Q5dZkO0ARwNkVM/3lnq2lZfJSMgoVF0BpwWrF9nOtAVkbnJeYPOL4C6eJO
	c7nYoqjPJcGd46HuVZECHZDQpL3yPiA/1u/piDkZEvEwWb4PdQBE0Bhu78OausXQH0S6UdxlEnw5U
	1+3SKhDhr6icuZWADSNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrdsg-006NT1-Re; Thu, 19 May 2022 10:59:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrdsV-006NQ2-1J; Thu, 19 May 2022 10:59:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3EE6B1F45A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652957973;
 bh=OvdE5DqVSmf6V3Hh/uC4yUE8G4B1Yfty3nshezlJAsg=;
 h=From:To:Cc:Subject:Date:From;
 b=nhEwpfQ7OcyAG8+NvJfjAWbHIuJCuFL5Yr8eR25H/8B9s5IY1U+edXuk06f1ZKe1c
 25CEKVxv7p4eZeLy8/xqr5ylaXy3c1HoIMVo8JUXe2yH+HYwJkm02WtOVNyGtOGMMN
 dxEP4HtlYhPx3ZarMbWCA8F3yCvqt/NUZyGtjWl45StroWjbtdNxTagU763/LQKm0k
 x9kPn0yjr3Tf68HhhR0VcI1Df754uiDHzYc1vZzJLrTPaD1KlRs5V4BYVwkD+cf0rA
 9ZpVByocxPmrgXWWl047AkXiDDr93laTHnrCGc3Q8udVtuPtqpK5NGk01DUxhHhAw2
 jmZn1m0I1ZWPA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: serial: mtk-uart: Convert txt to json-schema
Date: Thu, 19 May 2022 12:59:28 +0200
Message-Id: <20220519105928.22826-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_035935_385722_B63424E8 
X-CRM114-Status: GOOD (  18.31  )
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

Convert the mtk-uart documentation from freeform text to a json-schema.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/serial/mediatek,uart.yaml        | 118 ++++++++++++++++++
 .../devicetree/bindings/serial/mtk-uart.txt   |  59 ---------
 2 files changed, 118 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/mediatek,uart.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/mtk-uart.txt

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
new file mode 100644
index 000000000000..d5a1386162cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/mediatek,uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Universal Asynchronous Receiver/Transmitter (UART)
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+allOf:
+  - $ref: serial.yaml#
+
+description: |+
+  The MediaTek UART is based on the basic 8250 UART and compatible
+  with 16550A, with enhancements for high speed baud rates and
+  support for DMA.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt2701-uart
+          - mediatek,mt2712-uart
+          - mediatek,mt6580-uart
+          - mediatek,mt6582-uart
+          - mediatek,mt6589-uart
+          - mediatek,mt6755-uart
+          - mediatek,mt6765-uart
+          - mediatek,mt6779-uart
+          - mediatek,mt6795-uart
+          - mediatek,mt6797-uart
+          - mediatek,mt7622-uart
+          - mediatek,mt7623-uart
+          - mediatek,mt7629-uart
+          - mediatek,mt7986-uart
+          - mediatek,mt8127-uart
+          - mediatek,mt8135-uart
+          - mediatek,mt8173-uart
+          - mediatek,mt8183-uart
+          - mediatek,mt8186-uart
+          - mediatek,mt8192-uart
+          - mediatek,mt8195-uart
+          - mediatek,mt8516-uart
+      - const: mediatek,mt6577-uart
+
+  reg:
+    description: The base address of the UART register bank
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: The clock the baudrate is derived from
+      - description: The bus clock for register accesses
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: baud
+      - const: bus
+
+  dmas:
+    items:
+      - description: phandle to TX DMA
+      - description: phandle to RX DMA
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    description:
+      The UART interrupt and optionally the RX in-band wakeup interrupt.
+    minItems: 1
+    items:
+      - const: uart
+      - const: wakeup
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    serial@11006000 {
+        compatible = "mediatek,mt6589-uart", "mediatek,mt6577-uart";
+        reg = <0x11006000 0x400>;
+        interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_LOW>,
+                     <GIC_SPI 52 IRQ_TYPE_EDGE_FALLING>;
+        interrupt-names = "uart", "wakeup";
+        clocks = <&uart_clk>, <&bus_clk>;
+        clock-names = "baud", "bus";
+        pinctrl-0 = <&uart_pin>;
+        pinctrl-1 = <&uart_pin_sleep>;
+        pinctrl-names = "default", "sleep";
+    };
diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
deleted file mode 100644
index 113b5d6a2245..000000000000
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-* MediaTek Universal Asynchronous Receiver/Transmitter (UART)
-
-Required properties:
-- compatible should contain:
-  * "mediatek,mt2701-uart" for MT2701 compatible UARTS
-  * "mediatek,mt2712-uart" for MT2712 compatible UARTS
-  * "mediatek,mt6580-uart" for MT6580 compatible UARTS
-  * "mediatek,mt6582-uart" for MT6582 compatible UARTS
-  * "mediatek,mt6589-uart" for MT6589 compatible UARTS
-  * "mediatek,mt6755-uart" for MT6755 compatible UARTS
-  * "mediatek,mt6765-uart" for MT6765 compatible UARTS
-  * "mediatek,mt6779-uart" for MT6779 compatible UARTS
-  * "mediatek,mt6795-uart" for MT6795 compatible UARTS
-  * "mediatek,mt6797-uart" for MT6797 compatible UARTS
-  * "mediatek,mt7622-uart" for MT7622 compatible UARTS
-  * "mediatek,mt7623-uart" for MT7623 compatible UARTS
-  * "mediatek,mt7629-uart" for MT7629 compatible UARTS
-  * "mediatek,mt7986-uart", "mediatek,mt6577-uart" for MT7986 compatible UARTS
-  * "mediatek,mt8127-uart" for MT8127 compatible UARTS
-  * "mediatek,mt8135-uart" for MT8135 compatible UARTS
-  * "mediatek,mt8173-uart" for MT8173 compatible UARTS
-  * "mediatek,mt8183-uart", "mediatek,mt6577-uart" for MT8183 compatible UARTS
-  * "mediatek,mt8186-uart", "mediatek,mt6577-uart" for MT8183 compatible UARTS
-  * "mediatek,mt8192-uart", "mediatek,mt6577-uart" for MT8192 compatible UARTS
-  * "mediatek,mt8195-uart", "mediatek,mt6577-uart" for MT8195 compatible UARTS
-  * "mediatek,mt8516-uart" for MT8516 compatible UARTS
-  * "mediatek,mt6577-uart" for MT6577 and all of the above
-
-- reg: The base address of the UART register bank.
-
-- interrupts:
-  index 0: an interrupt specifier for the UART controller itself
-  index 1: optional, an interrupt specifier with edge sensitivity on Rx pin to
-           support Rx in-band wake up. If one would like to use this feature,
-           one must create an addtional pinctrl to reconfigure Rx pin to normal
-           GPIO before suspend.
-
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names:
-  - "baud": The clock the baudrate is derived from
-  - "bus": The bus clock for register accesses (optional)
-
-For compatibility with older device trees an unnamed clock is used for the
-baud clock if the baudclk does not exist. Do not use this for new designs.
-
-Example:
-
-	uart0: serial@11006000 {
-		compatible = "mediatek,mt6589-uart", "mediatek,mt6577-uart";
-		reg = <0x11006000 0x400>;
-		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 52 IRQ_TYPE_EDGE_FALLING>;
-		clocks = <&uart_clk>, <&bus_clk>;
-		clock-names = "baud", "bus";
-		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&uart_pin>;
-		pinctrl-1 = <&uart_pin_sleep>;
-	};
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

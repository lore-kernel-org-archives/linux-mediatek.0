Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2148C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 01:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSOyGWAeh8UTZbrxRngH3/uDCehvpqy706Ei20DliX8=; b=dZOQg9Iur9//7/
	auXYALmeq3YWNpCleYiavQ555Yh5ywG9o/hhQsO20fDosLd+75/gal8NTIIS5cgdiQnC0vUqWFvx6
	yYOFD0p56Gc84BGPa9G8o/0x0OqgFfClbOtIHReuifbRwqmUBych48LRi0C8jGdnReAziyf3Le+lM
	YJU5C7jPw0tNeXIqIvhqwU38TxZcIgOW6W1lWopHccy/JyRFE0DfVYKrABIZejNOWEJdZmEi4w24b
	SnZ0xYYsrQPMGJTi5TdJ8ZouvVW1qeJ7M6YyHg7remmAeKnHXtlBWTWOfKBlCDGh7Wb8g8nQ6mRsY
	Xxm7NaOnsoJ1lRo7bjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHc8v-00FvLg-MT; Wed, 09 Feb 2022 01:51:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHc8b-00FvIH-6Z; Wed, 09 Feb 2022 01:51:18 +0000
X-UUID: 38f2ee6008eb43b28b665fb45cb27820-20220208
X-UUID: 38f2ee6008eb43b28b665fb45cb27820-20220208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 969948460; Tue, 08 Feb 2022 18:51:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Feb 2022 17:44:50 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Feb 2022 09:44:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Feb 2022 09:44:48 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Leilk Liu
 <leilk.liu@mediatek.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH V5 1/3] dt-bindings: spi: Convert spi-slave-mt27xx to
 json-schema
Date: Wed, 9 Feb 2022 09:44:41 +0800
Message-ID: <20220209014443.12443-2-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209014443.12443-1-leilk.liu@mediatek.com>
References: <20220209014443.12443-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_175117_269134_F2F90B41 
X-CRM114-Status: GOOD (  16.11  )
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

Convert Mediatek ARM SOC's SPI Slave controller binding
to json-schema format.

Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../spi/mediatek,spi-slave-mt27xx.yaml        | 58 +++++++++++++++++++
 .../bindings/spi/spi-slave-mt27xx.txt         | 33 -----------
 2 files changed, 58 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-slave-mt27xx.txt

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
new file mode 100644
index 000000000000..7977799a8ee1
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-slave-mt27xx.yaml
@@ -0,0 +1,58 @@
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
+  - $ref: "/schemas/spi/spi-controller.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2712-spi-slave
+      - mediatek,mt8195-spi-slave
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: spi
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

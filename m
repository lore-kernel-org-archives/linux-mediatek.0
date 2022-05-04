Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EDDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 09:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=307W0X4ayDgGSqKpzu4ALk7xqTAbZtV3Jra50e9vn1w=; b=pTxg3v0bus8T41
	YPkDThsWm6LcI1tGOLAhqsiT6WgEkHNbisn4oR1qHxjTlbSzZf6D/QSWlyZ8E2CIzPutRNOa+k7Z1
	Sprxi0eJk0mQKULKSDvGgdydp9ZzvjCy9bbUENvZZjEh63bQn2+sDIa6SBqAB1POsxFbgi3/3LCQw
	pnVi348bpXAWO185KwcGRSgxmaFn1eyrRAldFTr8cqU2fPlGcyRHnQ+PRCR7ZK5PgnNChqg4aomU4
	81GjpbeQhLCAjCwDzam1hEIjMUq85tNSweExgM0HtiqS97lpAFCNHXoMVsYiA+4DJgV1TjgqxtFS3
	SpgMseMEVRErMJLj+U9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmBR0-009w2p-0e; Wed, 04 May 2022 09:36:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmBFk-009pQz-HI; Wed, 04 May 2022 09:25:02 +0000
X-UUID: 293a513cf1ea44cf983e496d5584d325-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a56db062-356b-4139-80bd-4ab612acb921, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:5
X-CID-META: VersionHash:faefae9, CLOUDID:e4e774c7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 293a513cf1ea44cf983e496d5584d325-20220504
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1977236813; Wed, 04 May 2022 02:24:51 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 02:19:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 17:19:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 4 May 2022 17:19:27 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <jitao.shi@mediatek.com>, <xinlei.lee@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v6 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
Date: Wed, 4 May 2022 17:19:20 +0800
Message-ID: <20220504091923.2219-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220504091923.2219-1-rex-bc.chen@mediatek.com>
References: <20220504091923.2219-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_022500_615977_27BD2609 
X-CRM114-Status: GOOD (  18.60  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Convert mediatek,dsi.txt to mediatek,dsi.yaml format

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 .../display/mediatek/mediatek,dsi.txt         |  62 ----------
 .../display/mediatek/mediatek,dsi.yaml        | 115 ++++++++++++++++++
 2 files changed, 115 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
deleted file mode 100644
index 36b01458f45c..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-Mediatek DSI Device
-===================
-
-The Mediatek DSI function block is a sink of the display subsystem and can
-drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized for dual-
-channel output.
-
-Required properties:
-- compatible: "mediatek,<chip>-dsi"
-- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
-- reg: Physical base address and length of the controller's registers
-- interrupts: The interrupt signal from the function block.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- clock-names: must contain "engine", "digital", and "hs"
-- phys: phandle link to the MIPI D-PHY controller.
-- phy-names: must contain "dphy"
-- port: Output port node with endpoint definitions as described in
-  Documentation/devicetree/bindings/graph.txt. This port should be connected
-  to the input port of an attached DSI panel or DSI-to-eDP encoder chip.
-
-Optional properties:
-- resets: list of phandle + reset specifier pair, as described in [1].
-
-[1] Documentation/devicetree/bindings/reset/reset.txt
-
-MIPI TX Configuration Module
-============================
-
-See phy/mediatek,dsi-phy.yaml
-
-Example:
-
-mipi_tx0: mipi-dphy@10215000 {
-	compatible = "mediatek,mt8173-mipi-tx";
-	reg = <0 0x10215000 0 0x1000>;
-	clocks = <&clk26m>;
-	clock-output-names = "mipi_tx0_pll";
-	#clock-cells = <0>;
-	#phy-cells = <0>;
-	drive-strength-microamp = <4600>;
-	nvmem-cells= <&mipi_tx_calibration>;
-	nvmem-cell-names = "calibration-data";
-};
-
-dsi0: dsi@1401b000 {
-	compatible = "mediatek,mt8173-dsi";
-	reg = <0 0x1401b000 0 0x1000>;
-	interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
-	clocks = <&mmsys MM_DSI0_ENGINE>, <&mmsys MM_DSI0_DIGITAL>,
-		 <&mipi_tx0>;
-	clock-names = "engine", "digital", "hs";
-	resets = <&mmsys MT8173_MMSYS_SW0_RST_B_DISP_DSI0>;
-	phys = <&mipi_tx0>;
-	phy-names = "dphy";
-
-	port {
-		dsi0_out: endpoint {
-			remote-endpoint = <&panel_in>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
new file mode 100644
index 000000000000..fa5bdf28668a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek DSI Controller Device Tree Bindings
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Jitao Shi <jitao.shi@mediatek.com>
+  - Xinlei Lee <xinlei.lee@mediatek.com>
+
+description: |
+  The MediaTek DSI function block is a sink of the display subsystem and can
+  drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized for dual-
+  channel output.
+
+allOf:
+  - $ref: /schemas/display/dsi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-dsi
+      - mediatek,mt7623-dsi
+      - mediatek,mt8167-dsi
+      - mediatek,mt8173-dsi
+      - mediatek,mt8183-dsi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Engine Clock
+      - description: Digital Clock
+      - description: HS Clock
+
+  clock-names:
+    items:
+      - const: engine
+      - const: digital
+      - const: hs
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: dphy
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port node. This port should be connected to the input
+      port of an attached DSI panel or DSI-to-eDP encoder chip.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/reset/mt8183-resets.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dsi0: dsi@14014000 {
+            compatible = "mediatek,mt8183-dsi";
+            reg = <0 0x14014000 0 0x1000>;
+            interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DSI0_MM>,
+                <&mmsys CLK_MM_DSI0_IF>,
+                <&mipi_tx0>;
+            clock-names = "engine", "digital", "hs";
+            resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
+            phys = <&mipi_tx0>;
+            phy-names = "dphy";
+            port {
+                dsi0_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

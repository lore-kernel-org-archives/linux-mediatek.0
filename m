Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643F7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 10:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=780WCijeJvwAXgvNZuLOolI427grTsSsZovkttf18Fs=; b=JDWeLLjfJUjb+b
	v3+l8CanuKHmdDlgxnO4JX0QLGJL66MiIYg5xaz50nYCJ26yNaz1fuz449w9huU479oSetlzB1SEW
	e96iNDtItplOWVOywNebvlA3LizmLqqL2vNEiu0tER+HE88tppQ55fA2TMPh4iaJSa2N7ZUjEn/ak
	ZXwsnM/ayztYor8/wNRswSCFtHPECn8Xc/senBEzE9OzcdnM2PVeHMQ0NS1L5yV79wJxFoGoCYWvb
	eDN8AtDDm7trtmxFyC14YhqS65coekebABnfV10cXfy6XbkRxdRLykEk5byX/KsUUrMR14TDScWrb
	WWfiqkRN9Cw4/HNKi5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL0Ba-00DkI1-NK; Fri, 18 Feb 2022 10:08:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL0BM-00DkBo-Ni; Fri, 18 Feb 2022 10:08:10 +0000
X-UUID: e6c2e3caa36f4ee78390e04aee70a312-20220218
X-UUID: e6c2e3caa36f4ee78390e04aee70a312-20220218
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 353493208; Fri, 18 Feb 2022 03:08:05 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Feb 2022 02:08:03 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 18 Feb 2022 18:08:01 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 18 Feb 2022 18:07:58 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <jitao.shi@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <rex-bc.chen@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [PATCH v2,
 1/3] dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to
 .yaml
Date: Fri, 18 Feb 2022 18:07:47 +0800
Message-ID: <1645178869-18048-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
References: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_020808_808205_DC0397BD 
X-CRM114-Status: GOOD (  15.50  )
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
---
 .../display/mediatek/mediatek,dsi.txt         | 62 --------------
 .../display/mediatek/mediatek,dsi.yaml        | 85 +++++++++++++++++++
 2 files changed, 85 insertions(+), 62 deletions(-)
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
index 000000000000..552a013786fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek DSI Controller Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao Shi <jitao.shi@mediatek.com>
+  - Xinlei Lee <xinlei.lee@mediatek.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-dsi
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
+      - description: Hs Clock
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+
+additionalProperties: false
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
+    dsi0: dsi@14014000 {
+        compatible = "mediatek,mt8183-dsi";
+        reg = <0x14014000 0x1000>;
+        interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+        clocks = <&mmsys CLK_MM_DSI0_MM>,
+            <&mmsys CLK_MM_DSI0_IF>,
+            <&mipi_tx0>;
+        clock-names = "engine", "digital", "hs";
+        resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
+        phys = <&mipi_tx0>;
+        phy-names = "dphy";
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

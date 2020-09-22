Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302B0C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 07:55:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEEA022574
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 07:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nfnmGXZM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LsiF621A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEEA022574
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s4NXpFiL59ti2IST1XfzvO4OI027nbceshjkpeAi5Bc=; b=nfnmGXZMTmVQX1gYgnvVQ6FWX3
	kP8IKelnxfPKRMHaXGmNOsBMhRtq6+dcUr0hF+eEPA3WKc9HWVmGiB0gsZej1U8LzVJ3ZWlPfKggm
	KJH0dDfw3BsYfAcr3U2R4EQTMznfiBJuKg94BUtyqD4t0nCh8oa/YaOVihT3rjCVgTSMxb+esCv11
	WZNbIX6eKSEdruO1PsVCDF37ktpha7aDAHVzRPOx9pOpPGfd0Rwl63A+h3bGBfdiFsZMaA05cWRss
	2zrXVHMr8YL9+bkx58+lrxE2KTOsPKEGc3f5mjwX6BZzU7z1StXvd7Qv/Vc//dJdOjjS/9LEUf4Kz
	MQbApOmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKd91-0002FI-JR; Tue, 22 Sep 2020 07:55:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKd8x-0002Di-B7; Tue, 22 Sep 2020 07:55:20 +0000
X-UUID: 8ab2a69fa67644b392e5c72b98b9726c-20200921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hq5x9xZuRCXn9RiN7WIPWNOzdWvbKOV5nFcOM1vUYe0=; 
 b=LsiF621AggH9q9yaE8fH5nBC1AN8fABA1S2WWxlL4qdxcFrdAVok7O8LG6xEoh80g/Pq4c1y0XlYn6SNHu9oZjVPgUI2T9+31LaMeuNWPdRqafX1VT+vYTf/PUREPZ0nnqWguq1tBsq7WtvM8l1TqM4O0JQycLPqcwBZ/fKNsug=;
X-UUID: 8ab2a69fa67644b392e5c72b98b9726c-20200921
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2008637433; Mon, 21 Sep 2020 23:55:12 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Sep 2020 00:55:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Sep 2020 15:55:08 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Sep 2020 15:55:07 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Stanley Chu
 <stanley.chu@mediatek.com>
Subject: [PATCH 1/4] dt-bindings: phy: convert phy-mtk-xsphy.txt to YAML schema
Date: Tue, 22 Sep 2020 15:55:05 +0800
Message-ID: <5af7c097d1c71a180d8ed1f1a44055859b42f1a0.1600760719.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_035519_699578_AAA1787C 
X-CRM114-Status: GOOD (  20.98  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert phy-mtk-xsphy.txt to YAML schema mediatek,xsphy.yaml

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../bindings/phy/mediatek,xsphy.yaml          | 203 ++++++++++++++++++
 .../devicetree/bindings/phy/phy-mtk-xsphy.txt | 109 ----------
 2 files changed, 203 insertions(+), 109 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt

diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
new file mode 100644
index 000000000000..0aaa10640b5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
@@ -0,0 +1,203 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek XS-PHY Controller Device Tree Bindings
+
+maintainers:
+  - Chunfeng Yun <chunfeng.yun@mediatek.com>
+
+description: |
+  The XS-PHY controller supports physical layer functionality for USB3.1
+  GEN2 controller on MediaTek SoCs.
+
+properties:
+  $nodename:
+    pattern: "^xs-phy@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt3611-xsphy
+          - enum:
+              - mediatek,xsphy
+      - items:
+          - const: mediatek,xsphy
+
+  reg:
+    description: |
+      Register shared by multiple U3 ports, exclude port's private register,
+      if only U2 ports provided, shouldn't use the property.
+    maxItems: 1
+
+  "#address-cells":
+      enum: [1, 2]
+
+  "#size-cells":
+      enum: [1, 2]
+
+  ranges: true
+
+  mediatek,src-ref-clk-mhz:
+    description:
+      Frequency of reference clock for slew rate calibrate
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 26
+
+  mediatek,src-coef:
+    description:
+      Coefficient for slew rate calibrate, depends on SoC process
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 17
+
+# Required child node:
+patternProperties:
+  "^usb-phy@[0-9a-f]+$":
+    type: object
+    description: |
+      A sub-node is required for each port the controller provides.
+      Address range information including the usual 'reg' property
+      is used inside these nodes to describe the controller's topology.
+
+    properties:
+      reg:
+        maxItems: 1
+
+      clocks:
+        items:
+          - description: Reference clock, (HS is 48Mhz, SS/P is 24~27Mhz)
+
+      clock-names:
+        items:
+          - const: ref
+
+      "#phy-cells":
+        const: 1
+        description: |
+          The cells contain the following arguments.
+
+          - description: The PHY type
+              enum:
+                - PHY_TYPE_USB2
+                - PHY_TYPE_USB3
+
+      #The following optional vendor properties are only for debug or HQA test
+      mediatek,eye-src:
+        description:
+          The value of slew rate calibrate (U2 phy)
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        maximum: 7
+
+      mediatek,eye-vrt:
+        description:
+          The selection of VRT reference voltage (U2 phy)
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        maximum: 7
+
+      mediatek,eye-term:
+        description:
+          The selection of HS_TX TERM reference voltage (U2 phy)
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        maximum: 7
+
+      mediatek,efuse-intr:
+        description:
+          The selection of Internal Resistor (U2/U3 phy)
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        maximum: 63
+
+      mediatek,efuse-tx-imp:
+        description:
+          The selection of TX Impedance (U3 phy)
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        maximum: 31
+
+      mediatek,efuse-rx-imp:
+        description:
+          The selection of RX Impedance (U3 phy)
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        maximum: 31
+
+    required:
+      - reg
+      - clocks
+      - clock-names
+      - "#phy-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+#Banks layout of xsphy
+#-------------------------------------------------------------
+#port        offset    bank
+#u2 port0    0x0000    MISC
+#            0x0100    FMREG
+#            0x0300    U2PHY_COM
+#u2 port1    0x1000    MISC
+#            0x1100    FMREG
+#            0x1300    U2PHY_COM
+#u2 port2    0x2000    MISC
+#            ...
+#u31 common  0x3000    DIG_GLB
+#            0x3100    PHYA_GLB
+#u31 port0   0x3400    DIG_LN_TOP
+#            0x3500    DIG_LN_TX0
+#            0x3600    DIG_LN_RX0
+#            0x3700    DIG_LN_DAIF
+#            0x3800    PHYA_LN
+#u31 port1   0x3a00    DIG_LN_TOP
+#            0x3b00    DIG_LN_TX0
+#            0x3c00    DIG_LN_RX0
+#            0x3d00    DIG_LN_DAIF
+#            0x3e00    PHYA_LN
+#            ...
+#DIG_GLB & PHYA_GLB are shared by U31 ports.
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    u3phy: xs-phy@11c40000 {
+        compatible = "mediatek,mt3611-xsphy", "mediatek,xsphy";
+        reg = <0x11c43000 0x0200>;
+        mediatek,src-ref-clk-mhz = <26>;
+        mediatek,src-coef = <17>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        u2port0: usb-phy@11c40000 {
+            reg = <0x11c40000 0x0400>;
+            clocks = <&clk48m>;
+            clock-names = "ref";
+            mediatek,eye-src = <4>;
+            #phy-cells = <1>;
+        };
+
+        u3port0: usb-phy@11c43000 {
+            reg = <0x11c43400 0x0500>;
+            clocks = <&clk26m>;
+            clock-names = "ref";
+            mediatek,efuse-intr = <28>;
+            #phy-cells = <1>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt
deleted file mode 100644
index e7caefa0b9c2..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt
+++ /dev/null
@@ -1,109 +0,0 @@
-MediaTek XS-PHY binding
---------------------------
-
-The XS-PHY controller supports physical layer functionality for USB3.1
-GEN2 controller on MediaTek SoCs.
-
-Required properties (controller (parent) node):
- - compatible	: should be "mediatek,<soc-model>-xsphy", "mediatek,xsphy",
-		  soc-model is the name of SoC, such as mt3611 etc;
-		  when using "mediatek,xsphy" compatible string, you need SoC specific
-		  ones in addition, one of:
-		  - "mediatek,mt3611-xsphy"
-
- - #address-cells, #size-cells : should use the same values as the root node
- - ranges: must be present
-
-Optional properties (controller (parent) node):
- - reg		: offset and length of register shared by multiple U3 ports,
-		  exclude port's private register, if only U2 ports provided,
-		  shouldn't use the property.
- - mediatek,src-ref-clk-mhz	: u32, frequency of reference clock for slew rate
-		  calibrate
- - mediatek,src-coef	: u32, coefficient for slew rate calibrate, depends on
-		  SoC process
-
-Required nodes	: a sub-node is required for each port the controller
-		  provides. Address range information including the usual
-		  'reg' property is used inside these nodes to describe
-		  the controller's topology.
-
-Required properties (port (child) node):
-- reg		: address and length of the register set for the port.
-- clocks	: a list of phandle + clock-specifier pairs, one for each
-		  entry in clock-names
-- clock-names	: must contain
-		  "ref": 48M reference clock for HighSpeed analog phy; and 26M
-			reference clock for SuperSpeedPlus analog phy, sometimes is
-			24M, 25M or 27M, depended on platform.
-- #phy-cells	: should be 1
-		  cell after port phandle is phy type from:
-			- PHY_TYPE_USB2
-			- PHY_TYPE_USB3
-
-The following optional properties are only for debug or HQA test
-Optional properties (PHY_TYPE_USB2 port (child) node):
-- mediatek,eye-src	: u32, the value of slew rate calibrate
-- mediatek,eye-vrt	: u32, the selection of VRT reference voltage
-- mediatek,eye-term	: u32, the selection of HS_TX TERM reference voltage
-- mediatek,efuse-intr	: u32, the selection of Internal Resistor
-
-Optional properties (PHY_TYPE_USB3 port (child) node):
-- mediatek,efuse-intr	: u32, the selection of Internal Resistor
-- mediatek,efuse-tx-imp	: u32, the selection of TX Impedance
-- mediatek,efuse-rx-imp	: u32, the selection of RX Impedance
-
-Banks layout of xsphy
--------------------------------------------------------------
-port        offset    bank
-u2 port0    0x0000    MISC
-            0x0100    FMREG
-            0x0300    U2PHY_COM
-u2 port1    0x1000    MISC
-            0x1100    FMREG
-            0x1300    U2PHY_COM
-u2 port2    0x2000    MISC
-            ...
-u31 common  0x3000    DIG_GLB
-            0x3100    PHYA_GLB
-u31 port0   0x3400    DIG_LN_TOP
-            0x3500    DIG_LN_TX0
-            0x3600    DIG_LN_RX0
-            0x3700    DIG_LN_DAIF
-            0x3800    PHYA_LN
-u31 port1   0x3a00    DIG_LN_TOP
-            0x3b00    DIG_LN_TX0
-            0x3c00    DIG_LN_RX0
-            0x3d00    DIG_LN_DAIF
-            0x3e00    PHYA_LN
-            ...
-
-DIG_GLB & PHYA_GLB are shared by U31 ports.
-
-Example:
-
-u3phy: usb-phy@11c40000 {
-	compatible = "mediatek,mt3611-xsphy", "mediatek,xsphy";
-	reg = <0 0x11c43000 0 0x0200>;
-	mediatek,src-ref-clk-mhz = <26>;
-	mediatek,src-coef = <17>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-	ranges;
-
-	u2port0: usb-phy@11c40000 {
-		reg = <0 0x11c40000 0 0x0400>;
-		clocks = <&clk48m>;
-		clock-names = "ref";
-		mediatek,eye-src = <4>;
-		#phy-cells = <1>;
-	};
-
-	u3port0: usb-phy@11c43000 {
-		reg = <0 0x11c43400 0 0x0500>;
-		clocks = <&clk26m>;
-		clock-names = "ref";
-		mediatek,efuse-intr = <28>;
-		#phy-cells = <1>;
-	};
-};
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

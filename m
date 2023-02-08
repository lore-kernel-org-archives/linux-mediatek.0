Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D47EC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 09:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMr9KDANkq6TC7wPHlHBzMnxVz9frFbOetK3BNIplc8=; b=mb7WEHzrZLQG7/AQftcEXIErAJ
	VjYlBQIE7xyuv4yAmBcfxwkQo+FUwwPgzvkMizUo5D5wVK3Y38toQvG0z8OBYpDMgJyRJLBHPPHGW
	0bOEPRJf2Weg05/tEIGwharnBcDnL4AHSCqS6bNbFjz9EglzmN90litXxY3eBoT7jTs+1yvf37Y7s
	EkI0YEvQ4lskhvVYhGctDd2t+qbz7z6tmanWiZ6FmY47eWqrIUyyx7s1YESpHnMUcYlLDIv8Qij3A
	8G7Ltncj1QB3Hodum5SQFe+rXkzUxPYsz4yYJOJ+YQ9hWi2Ie7cN9brdXQBZKTLx0rptF/PVSFusM
	qjxqkDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgj7-00Epie-SF; Wed, 08 Feb 2023 09:26:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgfD-00Enw0-PE; Wed, 08 Feb 2023 09:22:54 +0000
X-UUID: 25438ee4a79211edbbe3f76fe852e059-20230208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oMr9KDANkq6TC7wPHlHBzMnxVz9frFbOetK3BNIplc8=;
	b=dwd6HnH5JIubT85nkxqAuTxVqTyPo0RY21afH///cQN4axFz/zyrkrSE1DEfjMqtQiK6OZn7kPB/pZLD7LxMQcwl/m43nmZZc0vJYsqxb7oJJqYE8pUcAHYmjA+ibWIXsDJMTQBfKGflJ8viPnTir4il1jRNycftf4yVOBJQIpA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:f353f0aa-ed37-4088-8c29-b85ef7cf236a,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:885ddb2,CLOUDID:5e8a458e-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 25438ee4a79211edbbe3f76fe852e059-20230208
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1290068665; Wed, 08 Feb 2023 02:22:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 8 Feb 2023 17:22:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 8 Feb 2023 17:22:10 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v4 03/16] dt-binding: mediatek: add MediaTek mt8195 MDP3 components
Date: Wed, 8 Feb 2023 17:21:56 +0800
Message-ID: <20230208092209.19472-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230208092209.19472-1-moudy.ho@mediatek.com>
References: <20230208092209.19472-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_012251_939682_C25120D7 
X-CRM114-Status: GOOD (  17.94  )
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

Adds support for MT8195 MDP3 RDMA, and introduce more MDP3 components
present in MT8195.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../bindings/media/mediatek,mdp3-rdma.yaml    |  30 +--
 .../bindings/media/mediatek,mdp3-rsz.yaml     |   5 +-
 .../bindings/media/mediatek,mt8195-mdp3.yaml  | 174 ++++++++++++++++++
 3 files changed, 197 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-mdp3.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index 46730687c662..abc3284b21d0 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -20,8 +20,9 @@ description: |
 
 properties:
   compatible:
-    items:
-      - const: mediatek,mt8183-mdp3-rdma
+    enum:
+      - mediatek,mt8183-mdp3-rdma
+      - mediatek,mt8195-mdp3-rdma
 
   reg:
     maxItems: 1
@@ -46,20 +47,28 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
   power-domains:
-    maxItems: 1
+    oneOf:
+      - items:
+          - description: for RDMA
+      - items:
+          - description: for vppsys 0
+          - description: for vppsys 1
 
   clocks:
-    items:
-      - description: RDMA clock
-      - description: RSZ clock
+    minItems: 2
+    maxItems: 19
 
   iommus:
-    maxItems: 1
+    oneOf:
+      - items:
+          - description: RDMA port
+      - items:
+          - description: RDMA port
+          - description: RDMA to WROT DL port
 
   mboxes:
-    items:
-      - description: used for 1st data pipe from RDMA
-      - description: used for 2nd data pipe from RDMA
+    minItems: 1
+    maxItems: 5
 
   '#dma-cells':
     const: 1
@@ -72,7 +81,6 @@ required:
   - power-domains
   - clocks
   - iommus
-  - mboxes
   - '#dma-cells'
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
index 78f9de6192ef..4bc5ac112d2a 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
@@ -43,12 +43,15 @@ properties:
 
   clocks:
     minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
 
 required:
   - compatible
   - reg
   - mediatek,gce-client-reg
-  - mediatek,gce-events
   - clocks
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-mdp3.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-mdp3.yaml
new file mode 100644
index 000000000000..d2b01456c495
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-mdp3.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8195-mdp3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Media Data Path 3 display components
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description:
+  A group of display pipeline components for image quality adjustment,
+  color format conversion and data flow control, and the abbreviations
+  are explained below.
+  AAL    - Ambient-light Adaptive Luma.
+  Color  - Enhance or reduce color in Y/S/H channel.
+  FG     - Fime Grain for AV1 spec.
+  HDR    - Perform HDR to SDR.
+  MERGE  - Used to merge two slice-per-line into one side-by-side.
+  OVL    - Perform alpha blending.
+  PAD    - Predefined alpha or color value insertion.
+  SPLIT  - Split a HDMI stream into two ouptut.
+  STITCH - Combine multiple video frame with overlapping fields of view.
+  TCC    - HDR gamma curve conversion support.
+  TDSHP  - Sharpness and contrast improvement.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-mdp3-aal
+      - mediatek,mt8195-mdp3-color
+      - mediatek,mt8195-mdp3-fg
+      - mediatek,mt8195-mdp3-hdr
+      - mediatek,mt8195-mdp3-merge
+      - mediatek,mt8195-mdp3-ovl
+      - mediatek,mt8195-mdp3-pad
+      - mediatek,mt8195-mdp3-split
+      - mediatek,mt8195-mdp3-stitch
+      - mediatek,mt8195-mdp3-tcc
+      - mediatek,mt8195-mdp3-tdshp
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle of GCE
+        - description: GCE subsys id
+        - description: register offset
+        - description: register size
+    description:
+      Each GCE subsys id is mapping to a base address of display function blocks
+      register which is defined in <include/dt-bindings/gce/mt8195-gce.h>.
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 7
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+    #include <dt-bindings/power/mt8195-power.h>
+
+    display@14002000 {
+        compatible = "mediatek,mt8195-mdp3-fg";
+        reg = <0x14002000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x2000 0x1000>;
+        clocks = <&vppsys0 CLK_VPP0_MDP_FG>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+    };
+
+    display@14003000 {
+        compatible = "mediatek,mt8195-mdp3-stitch";
+        reg = <0x14003000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x3000 0x1000>;
+        clocks = <&vppsys0 CLK_VPP0_STITCH>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+    };
+
+    display@14004000 {
+        compatible = "mediatek,mt8195-mdp3-hdr";
+        reg = <0x14004000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x4000 0x1000>;
+        clocks = <&vppsys0 CLK_VPP0_MDP_HDR>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+    };
+
+    display@14005000 {
+        compatible = "mediatek,mt8195-mdp3-aal";
+        reg = <0x14005000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x5000 0x1000>;
+        clocks = <&vppsys0 CLK_VPP0_MDP_AAL>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+    };
+
+    display@14f06000 {
+        compatible = "mediatek,mt8195-mdp3-split";
+        reg = <0x14f06000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x6000 0x1000>;
+        clocks = <&vppsys1 CLK_VPP1_VPP_SPLIT>,
+                 <&vppsys1 CLK_VPP1_HDMI_META>,
+                 <&vppsys1 CLK_VPP1_VPP_SPLIT_HDMI>,
+                 <&vppsys1 CLK_VPP1_DGI_IN>,
+                 <&vppsys1 CLK_VPP1_DGI_OUT>,
+                 <&vppsys1 CLK_VPP1_VPP_SPLIT_DGI>,
+                 <&vppsys1 CLK_VPP1_VPP_SPLIT_26M>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+    };
+
+    display@14007000 {
+        compatible = "mediatek,mt8195-mdp3-tdshp";
+        reg = <0x14007000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x7000 0x1000>;
+        clocks = <&vppsys0 CLK_VPP0_MDP_TDSHP>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+    };
+
+    display@14008000 {
+        compatible = "mediatek,mt8195-mdp3-color";
+        reg = <0x14008000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x8000 0x1000>;
+        clocks = <&vppsys0 CLK_VPP0_MDP_COLOR>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+    };
+
+    display@14009000 {
+        compatible = "mediatek,mt8195-mdp3-ovl";
+        reg = <0x14009000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x9000 0x1000>;
+        clocks = <&vppsys0 CLK_VPP0_MDP_OVL>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+    };
+
+    display@1400a000 {
+        compatible = "mediatek,mt8195-mdp3-pad";
+        reg = <0x1400a000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xa000 0x1000>;
+        clocks = <&vppsys0 CLK_VPP0_PADDING>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+    };
+
+    display@1400b000 {
+        compatible = "mediatek,mt8195-mdp3-tcc";
+        reg = <0x1400b000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xb000 0x1000>;
+        clocks = <&vppsys0 CLK_VPP0_MDP_TCC>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+    };
+
+    display@14f1a000 {
+        compatible = "mediatek,mt8195-mdp3-merge";
+        reg = <0x14f1a000 0x1000>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xa000 0x1000>;
+        clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_MERGE>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+    };
-- 
2.18.0



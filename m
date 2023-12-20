Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F1DC46CD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3E3oH9it2snq+feJmOtJhpPs4tSb7On1BA+4yh3+JIQ=; b=oIf6lgeEoMPy49B5r7V3ou0Qxx
	2X3KCAkCz1RZHY4eSg0eD+G8dwRZGcG9jt5naWabATPGhOU+9iH+R0HqGQQNzOSm6+ErIBdgeSi9b
	YX+ghwOe7+q+ZdRKDGD/Q9E7ge+sLBysb7KEXtn+cKN0Eg5Q63XGW2GhKMP7khuuJYXUpbC1W5lPm
	gnfZj5ewIyUv8Pr4gft0g32N2IKM3+ZVNZvqvhrF8PU7C18dhr2V9ZWmiwNvdr51h5VgeMyFtjpaw
	2m1y4HP2W4VRBAQqdyGGrEIPY3pkMfC2d1AdBA6/xmmP7Bsn2qCz5J9FLlKvEPkMxGT35Y/BQtoev
	te4V3fwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtWe-00Gqpa-0t;
	Wed, 20 Dec 2023 10:10:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtWF-00GqQt-11;
	Wed, 20 Dec 2023 10:09:41 +0000
X-UUID: de6412389f1f11ee958cff29c719f35b-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3E3oH9it2snq+feJmOtJhpPs4tSb7On1BA+4yh3+JIQ=;
	b=A4sbYqYMTrLIIzNEA16NLCfYSrmEtRv0yGJMSzoMNV7c1flqXE5wt8CpE+aiBoT67SYGKOfWz3QbpBBsplBD+FYcfe2Lei2O+13vPNlqSEmODWtjaxcB91mpSqvGwnIYgXUA4hS3Jplw3jVpqRR9GoFkbhNeptKKZZnUnlzQYJc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:ac22d8af-f4dd-4420-86fc-01dc0d944d96,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:83c74b2e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: de6412389f1f11ee958cff29c719f35b-20231220
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1521630024; Wed, 20 Dec 2023 03:09:31 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 18:08:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 18:08:55 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Moudy
 Ho" <moudy.ho@mediatek.com>
Subject: [PATCH v10 02/16] dt-bindings: media: mediatek: mdp3: merge the indentical RDMA under display
Date: Wed, 20 Dec 2023 18:08:39 +0800
Message-ID: <20231220100853.20616-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231220100853.20616-1-moudy.ho@mediatek.com>
References: <20231220100853.20616-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.633600-8.000000
X-TMASE-MatchedRID: /qtm/HvCCyP6W4x/FkbM/rg7LINv5Afgh8Ytn75ClDN03GAz54To+1jt
	prj9/vncN+HT16szfKKIJs0Up7vkWEHeh2kdZPDc7spMO3HwKCAW40XiUkbrG/EJBoK3pfxuECM
	3iFpuDiiHPPuXAmrjKSvG+CY9d4AKupptyy2mu+7iHyvyXeXh5m3eqxoVjgMEqiVpIcIW6utWPf
	j/g9xP8xaxmhrgB4zxR7wbWUwlw6pOFGkXM6YcX8nUT+eskUQPgRykyfrH1xlaW2Ktn+I8/vz8v
	ajouc6XpDfNjU0xuVbMDVOmx+2sBkBduJGafVsPCz1WR8KHe4AT28gbcGU2vaMwbOPeRq+ao8WM
	kQWv6iVfx6Zf83Do5eTCMddcL/gjymsk/wUE4hoV2mQ/HE5Pbkp3yNYGG3owwXF5Ugr5BMd2zec
	STLTuipluOY2svJYY
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.633600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A62A3C849CBA1F6BFEF2121248B0758E7E2273D00DCB3560D322FBABFFB364992000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_020939_417262_B152020F 
X-CRM114-Status: GOOD (  15.94  )
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

To simplify maintenance and avoid branches, the identical component
should be merged and placed in the path belonging to the MDP
(from display/* to media/*).

In addition, currently only MDP utilizes RDMA through CMDQ, and the
necessary properties for "mediatek,gce-events", and "mboxes" have been
set up for this purpose.
Within DISP, it directly receives component interrupt signals.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../display/mediatek/mediatek,mdp-rdma.yaml   | 92 -------------------
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 43 ++++++++-
 2 files changed, 40 insertions(+), 95 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
deleted file mode 100644
index 7570a0684967..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
+++ /dev/null
@@ -1,92 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: MediaTek MDP RDMA
-
-maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
-
-description:
-  The MediaTek MDP RDMA stands for Read Direct Memory Access.
-  It provides real time data to the back-end panel driver, such as DSI,
-  DPI and DP_INTF.
-  It contains one line buffer to store the sufficient pixel data.
-  RDMA device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
-
-properties:
-  compatible:
-    oneOf:
-      - const: mediatek,mt8195-vdo1-rdma
-      - items:
-          - const: mediatek,mt8188-vdo1-rdma
-          - const: mediatek,mt8195-vdo1-rdma
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  clocks:
-    items:
-      - description: RDMA Clock
-
-  iommus:
-    maxItems: 1
-
-  mediatek,gce-client-reg:
-    description:
-      The register of display function block to be set by gce. There are 4 arguments,
-      such as gce node, subsys id, offset and register size. The subsys id that is
-      mapping to the register of display function blocks is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      items:
-        - description: phandle of GCE
-        - description: GCE subsys id
-        - description: register offset
-        - description: register size
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - power-domains
-  - clocks
-  - iommus
-  - mediatek,gce-client-reg
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/clock/mt8195-clk.h>
-    #include <dt-bindings/power/mt8195-power.h>
-    #include <dt-bindings/gce/mt8195-gce.h>
-    #include <dt-bindings/memory/mt8195-memory-port.h>
-
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        rdma@1c104000 {
-            compatible = "mediatek,mt8195-vdo1-rdma";
-            reg = <0 0x1c104000 0 0x1000>;
-            interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
-            clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
-            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
-            iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
-            mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000 0x1000>;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index e1ffe7eb2cdf..e9955639ce19 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -20,8 +20,12 @@ description: |
 
 properties:
   compatible:
-    items:
+    oneOf:
       - const: mediatek,mt8183-mdp3-rdma
+      - const: mediatek,mt8195-vdo1-rdma
+      - items:
+          - const: mediatek,mt8188-vdo1-rdma
+          - const: mediatek,mt8195-vdo1-rdma
 
   reg:
     maxItems: 1
@@ -60,6 +64,7 @@ properties:
     items:
       - description: RDMA clock
       - description: RSZ clock
+    minItems: 1
 
   iommus:
     maxItems: 1
@@ -68,6 +73,10 @@ properties:
     items:
       - description: used for 1st data pipe from RDMA
       - description: used for 2nd data pipe from RDMA
+    minItems: 1
+
+  interrupts:
+    maxItems: 1
 
   '#dma-cells':
     const: 1
@@ -76,13 +85,41 @@ required:
   - compatible
   - reg
   - mediatek,gce-client-reg
-  - mediatek,gce-events
   - power-domains
   - clocks
   - iommus
-  - mboxes
   - '#dma-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183-mdp3-rdma
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        mboxes:
+          minItems: 2
+
+      required:
+        - mboxes
+        - mediatek,gce-events
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-vdo1-rdma
+
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.18.0



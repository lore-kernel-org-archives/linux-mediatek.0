Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06363C7EE43
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 06:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kG4oQaK4Zaxtm+4MwnnkBztaVJAJ0cyCWrff9ZPLH9c=; b=bwVBYjh3LrWYI8Eleun5gu8Mui
	N7b+SDDU9gvKlcZE/CDvqHg+51gQf9hEhHSMDsBQ7k1LUe7+hjJ0YKWfN1hCKy4HAKTRcx+sfU4rD
	tyinVWGWRAUfywiCwbDcGTw8QaXXrKy7hulZHGHDu90/OBNtf3Cr9s04E+D2tBvrBV+MXUV/TD1vF
	3fqDzjKx2qJ1RIhEq6vN9pUiZvS+bCoIgAhOqSdGIBawZf8N7e1G4+RWNl42jTiHK2m/Ls4TM7y+W
	uXRvk0qT3tkUou929E09PFp30q999M3M0b4D9jJwEyae0sTQ6egolsJNmCMk1/0gY/D9usy1K6jhB
	JAbWdm4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6mOr-004WIg-0B;
	Wed, 07 Jun 2023 06:12:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6mOn-004WE4-1M;
	Wed, 07 Jun 2023 06:12:03 +0000
X-UUID: 308922e404fa11ee912e1518a6540028-20230606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kG4oQaK4Zaxtm+4MwnnkBztaVJAJ0cyCWrff9ZPLH9c=;
	b=BsAHJ8JVCU1VgvRCahvl9liVljAlI60w8ZNoub91cfqULAL5Q29eLz0GaCSkk2NgKemXunXozeGrvoCtbPe/Hku1M4tht76x18we5IyTxQQO5kT0vXoaxdE+odWkBv93I47JkFuifgxOZssgm4FtLfchc/3KLM8rVzNqLLXp8Hg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:8edc02fc-8b2c-426f-860c-a2ca0fe0fd7a,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:3fd0476e-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 308922e404fa11ee912e1518a6540028-20230606
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1463306580; Tue, 06 Jun 2023 23:11:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Jun 2023 14:11:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Jun 2023 14:11:30 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Singo Chang <singo.chang@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Hsiao
 Chein Sung <shawn.sung@mediatek.com>, Fei Shao <fshao@google.com>
Subject: [PATCH v1 1/6] dt-bindings: display/mediatek: mt8188: Add documentations for VDOSYS1
Date: Wed, 7 Jun 2023 14:11:16 +0800
Message-ID: <20230607061121.6732-2-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230607061121.6732-1-shawn.sung@mediatek.com>
References: <20230607061121.6732-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_231201_471161_D602B85A 
X-CRM114-Status: GOOD (  17.91  )
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

Add device tree documentations for MT8188 VDOSYS1.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  1 +
 .../display/mediatek/mediatek,ethdr.yaml      |  5 +-
 .../display/mediatek/mediatek,mdp-rdma.yaml   |  5 +-
 .../display/mediatek/mediatek,merge.yaml      |  1 +
 .../display/mediatek/mediatek,padding.yaml    | 80 +++++++++++++++++++
 5 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 536f5a5ebd24..642fa2e4736e 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -32,6 +32,7 @@ properties:
               - mediatek,mt8183-mmsys
               - mediatek,mt8186-mmsys
               - mediatek,mt8188-vdosys0
+              - mediatek,mt8188-vdosys1
               - mediatek,mt8192-mmsys
               - mediatek,mt8195-vdosys1
               - mediatek,mt8195-vppsys0
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
index 801fa66ae615..e3f740ab0564 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
@@ -23,7 +23,10 @@ description:

 properties:
   compatible:
-    const: mediatek,mt8195-disp-ethdr
+    oneOf:
+      - enum:
+        - mediatek,mt8188-disp-ethdr
+        - mediatek,mt8195-disp-ethdr

   reg:
     maxItems: 7
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
index dd12e2ff685c..07c345fa9178 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
@@ -21,7 +21,10 @@ description:

 properties:
   compatible:
-    const: mediatek,mt8195-vdo1-rdma
+    oneOf:
+      - enum:
+        - mediatek,mt8188-vdo1-rdma
+        - mediatek,mt8195-vdo1-rdma

   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 2f8e2f4dc3b8..600f1b4608f8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -23,6 +23,7 @@ properties:
     oneOf:
       - enum:
           - mediatek,mt8173-disp-merge
+          - mediatek,mt8188-disp-merge
           - mediatek,mt8195-disp-merge

   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
new file mode 100644
index 000000000000..8a9e74cbf6dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,padding.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek PADDING
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description:
+  MediaTek PADDING provides ability to VDOSYS1 to fill pixels to
+  width and height of a layer with a specified color.
+  Since MIXER in VDOSYS1 requires the width of a layer to be 2-pixel-align, or
+  4-pixel-align when ETHDR is enabled, we need PADDING to deal with odd width.
+  Please notice that even if the PADDING is in bypass mode,
+  settings in the registers must be cleared to 0, otherwise
+  undeinfed behaviors could happen.
+
+properties:
+  compatible:
+    const: mediatek,mt8188-vdo1-padding
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: RDMA Clock
+
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle of GCE
+        - description: GCE subsys id
+        - description: register offset
+        - description: register size
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - clocks
+  - mediatek,gce-client-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8188-clk.h>
+    #include <dt-bindings/power/mt8188-power.h>
+    #include <dt-bindings/gce/mt8188-gce.h>
+    #include <dt-bindings/memory/mt8188-memory-port.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        vdo1_padding0: vdo1_padding0@1c11d000 {
+            compatible = "mediatek,mt8188-vdo1-padding";
+            reg = <0 0x1c11d000 0 0x1000>;
+            clocks = <&vdosys1 CLK_VDO1_PADDING0>;
+            power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+            mediatek,gce-client-reg =
+                <&gce0 SUBSYS_1c11XXXX 0xd000 0x1000>;
+        };
+    };
--
2.18.0



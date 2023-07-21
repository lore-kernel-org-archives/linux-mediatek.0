Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1D5EB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 03:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHZvfrM0o5UaIt01vL+X0Xi78aCQjddfdApBpcmPqT8=; b=0qloAN7LH45oQ+ZIm2+vLe/9aS
	fyR5sZOYqNBkAfgf1UscAav6hJ6z95EH/ii/w5gEtIkgtdzBPQi+fVmJo3mApdxRrf4IpmPa8Iw2y
	Zbe3Z2Xh34rcYCoFueFC5ipHAJSfQ3EciMxSe8lDKoGNTK9B/3GGpwLMNg+OJhxWXaC2F9W0kcAjz
	HyXzKwu35SqAd2T+DNr3hy+wayDijCLMnHVXMHM3y7C7lpQj3BYtIGGDOFLz8onlidTbGJJHH3q3p
	lncdjb5mYHx9/BheHU9q6gv4bzRWHLcJBkdCAAtlT2arTBshE+ZNABHXFMqu+bU+9ZTPprQbGCm0z
	iVZ+UXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMgP3-00Ch1P-1C;
	Fri, 21 Jul 2023 03:02:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMgP0-00Ch0e-2w;
	Fri, 21 Jul 2023 03:02:00 +0000
X-UUID: f1bcd696277211ee83ed1395ce914268-20230720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mHZvfrM0o5UaIt01vL+X0Xi78aCQjddfdApBpcmPqT8=;
	b=k3a3feZ/kvopBeWhHh7LKe+hkweEtUT1kk/Lt+8EA2UtpqFenJoYhKJBBOcuHgmeNsNrD6jbGbRiVFQHZzBUd9KkOU+k/ksb/7gg39ZFahZjSeRvvmOlNukb1SfiMoBMX+N/0Ps/wmzN3VG2+dzT1bwv+xjwTjEzLQ+rbW/oG38=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:82701b78-8df6-475a-a3eb-57001bf6f766,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:ca4dde87-44fb-401c-8de7-6a5572f1f5d5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f1bcd696277211ee83ed1395ce914268-20230720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 271293876; Thu, 20 Jul 2023 20:01:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 21 Jul 2023 10:41:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 21 Jul 2023 10:41:50 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tinghan
 Shen <tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v15 03/13] dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP
Date: Fri, 21 Jul 2023 10:41:22 +0800
Message-ID: <20230721024132.6548-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230721024132.6548-1-tinghan.shen@mediatek.com>
References: <20230721024132.6548-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_200158_961360_FE56FE23 
X-CRM114-Status: GOOD (  17.19  )
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

Extend the SCP binding to describe the MT8195 dual-core SCP.

Under different applications, the MT8195 SCP can be used as single-core
or dual-core. This change keeps the single-core definitions and
adds new definitions for the dual-core use case.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 145 +++++++++++++++++-
 1 file changed, 141 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 271081df0e46..09102dda4942 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -21,6 +21,7 @@ properties:
       - mediatek,mt8188-scp
       - mediatek,mt8192-scp
       - mediatek,mt8195-scp
+      - mediatek,mt8195-scp-dual
 
   reg:
     description:
@@ -31,10 +32,7 @@ properties:
 
   reg-names:
     minItems: 2
-    items:
-      - const: sram
-      - const: cfg
-      - const: l1tcm
+    maxItems: 3
 
   clocks:
     description:
@@ -70,6 +68,81 @@ properties:
 
     unevaluatedProperties: false
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges:
+    description:
+      Standard ranges definition providing address translations for
+      local SCP SRAM address spaces to bus addresses.
+
+patternProperties:
+  "^scp@[a-f0-9]+$":
+    type: object
+    description:
+      The MediaTek SCP integrated to SoC might be a multi-core version.
+      The other cores are represented as child nodes of the boot core.
+      There are some integration differences for the IP like the usage of
+      address translator for translating SoC bus addresses into address space
+      for the processor.
+
+      Each SCP core has own cache memory. The SRAM and L1TCM are shared by
+      cores. The power of cache, SRAM and L1TCM power should be enabled
+      before booting SCP cores. The size of cache, SRAM, and L1TCM are varied
+      on differnt SoCs.
+
+      The SCP cores do not use an MMU, but has a set of registers to
+      control the translations between 32-bit CPU addresses into system bus
+      addresses. Cache and memory access settings are provided through a
+      Memory Protection Unit (MPU), programmable only from the SCP.
+
+    properties:
+      compatible:
+        enum:
+          - mediatek,scp-core
+
+      reg:
+        description: The base address and size of SRAM.
+        maxItems: 1
+
+      reg-names:
+        const: sram
+
+      interrupts:
+        maxItems: 1
+
+      firmware-name:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          If present, name (or relative path) of the file within the
+          firmware search path containing the firmware image used when
+          initializing sub cores of multi-core SCP.
+
+      memory-region:
+        maxItems: 1
+
+      cros-ec-rpmsg:
+        $ref: /schemas/mfd/google,cros-ec.yaml
+        description:
+          This subnode represents the rpmsg device. The properties
+          of this node are defined by the individual bindings for
+          the rpmsg devices.
+
+        required:
+          - mediatek,rpmsg-name
+
+        unevaluatedProperties: false
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -99,7 +172,37 @@ allOf:
         reg:
           maxItems: 2
         reg-names:
+          items:
+            - const: sram
+            - const: cfg
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8192-scp
+            - mediatek,mt8195-scp
+    then:
+      properties:
+        reg:
+          maxItems: 3
+        reg-names:
+          items:
+            - const: sram
+            - const: cfg
+            - const: l1tcm
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8195-scp-dual
+    then:
+      properties:
+        reg:
           maxItems: 2
+        reg-names:
+          items:
+            - const: cfg
+            - const: l1tcm
 
 additionalProperties: false
 
@@ -121,3 +224,37 @@ examples:
             mediatek,rpmsg-name = "cros-ec-rpmsg";
         };
     };
+
+  - |
+    scp@10500000 {
+        compatible = "mediatek,mt8195-scp-dual";
+        reg = <0x10720000 0xe0000>,
+              <0x10700000 0x8000>;
+        reg-names = "cfg", "l1tcm";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x10500000 0x100000>;
+
+        scp@0 {
+            compatible = "mediatek,scp-core";
+            reg = <0x0 0xa0000>;
+            reg-names = "sram";
+
+            cros-ec-rpmsg {
+                compatible = "google,cros-ec-rpmsg";
+                mediatek,rpmsg-name = "cros-ec-rpmsg";
+            };
+        };
+
+        scp@a0000 {
+            compatible = "mediatek,scp-core";
+            reg = <0xa0000 0x20000>;
+            reg-names = "sram";
+
+            cros-ec-rpmsg {
+                compatible = "google,cros-ec-rpmsg";
+                mediatek,rpmsg-name = "cros-ec-rpmsg";
+            };
+        };
+    };
-- 
2.18.0



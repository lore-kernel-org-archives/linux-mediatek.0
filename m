Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD82C19F2A
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 06:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3rY+2rtn4JSlq0MehlA58IXlznDhOxya07eTl7NoXM=; b=LpHh/CMJf07oDYbik/GI36Q3gq
	B6Dn1key3rWBRZyDCOEThhfVADM5M9a0mBKGe5xUaz5gEqVfSEMGakR0yx8+SyuuhX3acgQpSXsDP
	kQPjkh4e8YT4uxV60lKC+kckkFa015674JmR7NFtrJqHKEnPMSzoM/DUVtr++zagOf1ln5boGNW/i
	A2bJFlpZWOPZd3HBWC5Q5wbiXyFolDhpQDslox73e990MghgQBBa5uifFdXsitp2R34PSoiYPyUNI
	volkIvgEHzGf2bzCIM1a1mHUSMfGrlE2h75rWJ/FA6xwVYs6tMjr5Y8EEaFpcHV50LN9CcXLDBRHI
	gyaou/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHJw9-002FIM-Lp; Fri, 29 Jul 2022 06:57:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHJtj-002DYY-O6; Fri, 29 Jul 2022 06:55:02 +0000
X-UUID: 6fe44b2a76a74c5f976a57d52533c09b-20220728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:cbdfe656-baff-4d37-a891-5fde0111757c,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:1c6cbacf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6fe44b2a76a74c5f976a57d52533c09b-20220728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1943831155; Thu, 28 Jul 2022 23:54:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with ShadowRedundancy id 15.2.792.3;
 Fri, 29 Jul 2022 06:52:29 +0000
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 14:32:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Jul 2022 14:32:13 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, MandyJH
 Liu <mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 03/20] dt-bindings: power: mediatek: Refine multiple level power domain nodes
Date: Fri, 29 Jul 2022 14:31:51 +0800
Message-ID: <20220729063208.16799-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220729063208.16799-1-tinghan.shen@mediatek.com>
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_235459_833777_FDC7303D 
X-CRM114-Status: GOOD (  12.07  )
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

Extract duplicated properties and support more levels of power
domain nodes.

This change fix following error when do dtbs_check,
    arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: power-controller: power-domain@15:power-domain@16:power-domain@18: 'power-domain@19', 'power-domain@20', 'power-domain@21' do not match any of the regexes: 'pinctrl-[0-9]+'
	 From schema: Documentation/devicetree/bindings/power/mediatek,power-controller.yaml

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../power/mediatek,power-controller.yaml      | 131 +++---------------
 1 file changed, 17 insertions(+), 114 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index b448101fac43e..321802c95308f 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -42,6 +42,23 @@ properties:
 
 patternProperties:
   "^power-domain@[0-9a-f]+$":
+    $ref: "#/$defs/power-domain-node"
+    patternProperties:
+      "^power-domain@[0-9a-f]+$":
+        $ref: "#/$defs/power-domain-node"
+        patternProperties:
+          "^power-domain@[0-9a-f]+$":
+            $ref: "#/$defs/power-domain-node"
+            patternProperties:
+              "^power-domain@[0-9a-f]+$":
+                $ref: "#/$defs/power-domain-node"
+                unevaluatedProperties: false
+            unevaluatedProperties: false
+        unevaluatedProperties: false
+    unevaluatedProperties: false
+
+$defs:
+  power-domain-node:
     type: object
     description: |
       Represents the power domains within the power controller node as documented
@@ -100,123 +117,9 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the SMI register range.
 
-    patternProperties:
-      "^power-domain@[0-9a-f]+$":
-        type: object
-        description: |
-          Represents a power domain child within a power domain parent node.
-
-        properties:
-
-          '#power-domain-cells':
-            description:
-              Must be 0 for nodes representing a single PM domain and 1 for nodes
-              providing multiple PM domains.
-
-          '#address-cells':
-            const: 1
-
-          '#size-cells':
-            const: 0
-
-          reg:
-            maxItems: 1
-
-          clocks:
-            description: |
-              A number of phandles to clocks that need to be enabled during domain
-              power-up sequencing.
-
-          clock-names:
-            description: |
-              List of names of clocks, in order to match the power-up sequencing
-              for each power domain we need to group the clocks by name. BASIC
-              clocks need to be enabled before enabling the corresponding power
-              domain, and should not have a '-' in their name (i.e mm, mfg, venc).
-              SUSBYS clocks need to be enabled before releasing the bus protection,
-              and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
-
-              In order to follow properly the power-up sequencing, the clocks must
-              be specified by order, adding first the BASIC clocks followed by the
-              SUSBSYS clocks.
-
-          domain-supply:
-            description: domain regulator supply.
-
-          mediatek,infracfg:
-            $ref: /schemas/types.yaml#/definitions/phandle
-            description: phandle to the device containing the INFRACFG register range.
-
-          mediatek,smi:
-            $ref: /schemas/types.yaml#/definitions/phandle
-            description: phandle to the device containing the SMI register range.
-
-        patternProperties:
-          "^power-domain@[0-9a-f]+$":
-            type: object
-            description: |
-              Represents a power domain child within a power domain parent node.
-
-            properties:
-
-              '#power-domain-cells':
-                description:
-                  Must be 0 for nodes representing a single PM domain and 1 for nodes
-                  providing multiple PM domains.
-
-              '#address-cells':
-                const: 1
-
-              '#size-cells':
-                const: 0
-
-              reg:
-                maxItems: 1
-
-              clocks:
-                description: |
-                  A number of phandles to clocks that need to be enabled during domain
-                  power-up sequencing.
-
-              clock-names:
-                description: |
-                  List of names of clocks, in order to match the power-up sequencing
-                  for each power domain we need to group the clocks by name. BASIC
-                  clocks need to be enabled before enabling the corresponding power
-                  domain, and should not have a '-' in their name (i.e mm, mfg, venc).
-                  SUSBYS clocks need to be enabled before releasing the bus protection,
-                  and should contain a '-' in their name (i.e mm-0, isp-0, cam-0).
-
-                  In order to follow properly the power-up sequencing, the clocks must
-                  be specified by order, adding first the BASIC clocks followed by the
-                  SUSBSYS clocks.
-
-              domain-supply:
-                description: domain regulator supply.
-
-              mediatek,infracfg:
-                $ref: /schemas/types.yaml#/definitions/phandle
-                description: phandle to the device containing the INFRACFG register range.
-
-              mediatek,smi:
-                $ref: /schemas/types.yaml#/definitions/phandle
-                description: phandle to the device containing the SMI register range.
-
-            required:
-              - reg
-
-            additionalProperties: false
-
-        required:
-          - reg
-
-        additionalProperties: false
-
     required:
       - reg
 
-    additionalProperties: false
-
 required:
   - compatible
 
-- 
2.18.0



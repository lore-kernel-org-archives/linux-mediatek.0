Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26071C3F6B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 03:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kGkJO+i32RelUaoL0rep8JkKiuA3qoE/kuH2+wMJFk=; b=IhHw8mqj7jdT3SJSEkm3asamKt
	yT+KFMUYlfAaNnsXdMYxcBbfGwwiETDXqGpWNUuwXFAUAZH27/kPO5gH7RFnV7dmfbwBDsx2ZSKuy
	rhiYJLfA0TiveaLYGGDnqFfJX/0ygzzgeyBiow+3lIsruedah4VnlumE0cVnUvr+rOJS5Vya8WjUU
	4mTnMou9ULwMniKbB/abz0mg9fTJrcsQsna4s7m8Fl8C3Vl1bmCfEni5Muvf6imO7ALgnpYVovUhL
	NQVi8YBbf4CyCJs4aktUJDLBNHycXAOg8tC3DN9TF79SyXrtYsInq3xyiifumFZhbIt5NHn9aAKDp
	nfxx2Pzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLyj8-004mto-2O; Thu, 11 Aug 2022 03:19:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLyio-004mnh-DC; Thu, 11 Aug 2022 03:18:59 +0000
X-UUID: 9a02221725354fe0862e90bd298fd6a2-20220810
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:ce3cf99c-26c4-4551-99f3-6a10764baff5,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:d051569c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9a02221725354fe0862e90bd298fd6a2-20220810
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1371265447; Wed, 10 Aug 2022 20:18:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 11 Aug 2022 10:58:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 11 Aug 2022 10:58:15 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, MandyJH Liu <mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 01/20] dt-bindings: iommu: mediatek: Increase max interrupt number
Date: Thu, 11 Aug 2022 10:57:54 +0800
Message-ID: <20220811025813.21492-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220811025813.21492-1-tinghan.shen@mediatek.com>
References: <20220811025813.21492-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_201858_466209_12D67CBD 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

mt8195 infra iommu uses 5 interrupts.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/iommu/mediatek,iommu.yaml        | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index fee0241b50988..f5634c1642e20 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -91,7 +91,8 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 5
 
   clocks:
     items:
@@ -183,14 +184,28 @@ allOf:
       required:
         - mediatek,infracfg
 
-  - if: # The IOMMUs don't have larbs.
-      not:
-        properties:
-          compatible:
-            contains:
-              const: mediatek,mt8195-iommu-infra
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-iommu-infra
 
     then:
+      properties:
+        interrupts:
+          description: The IOMMU has 5 banks. Each bank has its own interrupt.
+          items:
+            - description: The interrupt for IOMMU bank0
+            - description: The interrupt for IOMMU bank1
+            - description: The interrupt for IOMMU bank2
+            - description: The interrupt for IOMMU bank3
+            - description: The interrupt for IOMMU bank4
+
+    else: # For the MM IOMMU
+      properties:
+        interrupts:
+          maxItems: 1
+
       required:
         - mediatek,larbs
 
-- 
2.18.0



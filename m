Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D622DC43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VokK1uVC+38IDRXPL2dbw+Siqy8rnjBoJf2pglNWWJM=; b=qp/+BRrGaGbP/IcbstwQFx4Khp
	Zcpga99JqXIeOZjVLhXstlU5s7A+j8H2bQINaBLUVdaN5QBHpJXxFLHh+paIvU8J1tVB5zL3LKzvx
	382dPk2Ph8El0Xs9Aq1DuoqfHt+SfCeLMPBclYE21emgChI+xX+tjBCK9xQ2ig1WmEh0Jyj2Xd2cL
	4PMPNTRTzKy2shNpxd2ug66yNijf4CNbkmwBZAaUf/vIMgOAAzA9kqjXUPnMe1CRrQQTdeO/LEVEK
	NT/NQ7k5I0IO5AmBFMUD5yD7JzWdNnwgB35SGdYXPQs4JD73m1wf45c1a/m9YxPetN22Y+Fk5iCQK
	sqSaZ+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCcUO-00EWXo-Jy; Sat, 16 Jul 2022 07:45:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCcUD-00EWTO-5n; Sat, 16 Jul 2022 07:45:14 +0000
X-UUID: 0104d0b073a54c3e959db080476f4d35-20220716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:15f6ccb1-ea2a-47e4-8859-7cf8ee792d57,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:f06a2333-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 0104d0b073a54c3e959db080476f4d35-20220716
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 340524053; Sat, 16 Jul 2022 00:45:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 16 Jul 2022 15:44:04 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 16 Jul 2022 15:44:03 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, <Rex-BC.Chen@mediatek.com>,
	<TingHan.Shen@mediatek.com>, <Liju-clr.Chen@mediatek.com>,
	<Jian.Yang@mediatek.com>
Subject: [PATCH 2/2] dt-bindings: PCI: mediatek-gen3: Add new clock name
Date: Sat, 16 Jul 2022 15:43:49 +0800
Message-ID: <20220716074349.28655-3-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220716074349.28655-1-jianjun.wang@mediatek.com>
References: <20220716074349.28655-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_004513_245281_33A4C462 
X-CRM114-Status: UNSURE (   8.09  )
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

MT8188 and MT8195 use clock "peri_mem" instead of "top_133m", add new
clock name "peri_mem" for MT8188 and MT8195.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 42 ++++++++++++++-----
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 67d2ba25e336..038e25ae0be7 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -43,9 +43,6 @@ description: |+
   each set has its own address for MSI message, and supports 32 MSI vectors
   to generate interrupt.
 
-allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -85,13 +82,7 @@ properties:
     maxItems: 6
 
   clock-names:
-    items:
-      - const: pl_250m
-      - const: tl_26m
-      - const: tl_96m
-      - const: tl_32k
-      - const: peri_26m
-      - const: top_133m
+    maxItems: 6
 
   assigned-clocks:
     maxItems: 1
@@ -133,9 +124,40 @@ required:
   - interrupts
   - ranges
   - clocks
+  - clock-names
   - '#interrupt-cells'
   - interrupt-controller
 
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8188-pcie
+              - mediatek,mt8195-pcie
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: pl_250m
+            - const: tl_26m
+            - const: tl_96m
+            - const: tl_32k
+            - const: peri_26m
+            - const: peri_mem
+    else:
+      properties:
+        clock-names:
+          items:
+            - const: pl_250m
+            - const: tl_26m
+            - const: tl_96m
+            - const: tl_32k
+            - const: peri_26m
+            - const: top_133m
+
 unevaluatedProperties: false
 
 examples:
-- 
2.18.0



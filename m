Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C10C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 03:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Rys4bn9JrvSCqC30tTq9R/ewAvYI+6ue76gWrhf+9Q=; b=CXBlJ52d0RrpgpfcbE3vjdw56D
	S7TZqye2pU8MWoY86KL4smBX2qjcq0CAUGnQHI6kg6X1UQ+0O8mzPGec3JRzLYgZNMzPpUi+NIW9g
	AzP7hT7MmgL2GvgG+GfiTZdgz12g8ZRN2B16+3Z8fJLm4f8tUXoYx7HS00/tZaze0C5p79j2vFhCl
	3HA+GR6ck21f49tSY9i7O/+wMl3Zp817p1ZITI8Qe8dpmwB74w6ufTOgS/zgoWrWCtYP2O7TXcrRP
	nzeQ7Zi6mvRAlBoFQDSu3vqhgqdft7EaJ1TJ0+QyDhmfXD4WZ5ofu6GydBp5CCq1HDj9NSaNmdK9U
	7S4qTvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHGlD-000GWK-Ag; Fri, 29 Jul 2022 03:33:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHGl2-000GSv-Tg; Fri, 29 Jul 2022 03:33:50 +0000
X-UUID: 07cae482349f4979b07f7ecd775ada67-20220728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:c734bc34-0674-473a-a397-f8f498e7c2a3,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:3a42ae24-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 07cae482349f4979b07f7ecd775ada67-20220728
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1196315916; Thu, 28 Jul 2022 20:33:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 11:33:33 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 29 Jul 2022 11:33:33 +0800
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
Subject: [PATCH v2] dt-bindings: PCI: mediatek-gen3: Add support for MT8188 and MT8195
Date: Fri, 29 Jul 2022 11:33:31 +0800
Message-ID: <20220729033331.3075-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_203348_985650_107B084E 
X-CRM114-Status: UNSURE (   9.50  )
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

MT8188 and MT8195 are ARM platform SoCs with the same PCIe IP as MT8192.

Also add new clock name "peri_mem" since the MT8188 and MT8195 use clock
"peri_mem" instead of "top_133m".

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
Changes in v2:
Merge two patches into one.
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 51 +++++++++++++++----
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 0499b94627ae..038e25ae0be7 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -43,12 +43,16 @@ description: |+
   each set has its own address for MSI message, and supports 32 MSI vectors
   to generate interrupt.
 
-allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
-
 properties:
   compatible:
-    const: mediatek,mt8192-pcie
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8188-pcie
+              - mediatek,mt8195-pcie
+          - const: mediatek,mt8192-pcie
+      - items:
+          - const: mediatek,mt8192-pcie
 
   reg:
     maxItems: 1
@@ -78,13 +82,7 @@ properties:
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
@@ -126,9 +124,40 @@ required:
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



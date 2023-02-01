Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27CCC636D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 02:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wodpxQJxS9WBV/Id1cRLy+b4gQiIXHj/BKyDu9o+YQM=; b=bbTqloIq4I/Ud5Z0T3ixehC1hM
	qouE0u1iwfycaBdRUflMet3NLVIYEZBALNcJ/NomfSNC5nVjMWfvnvxgb1dqcA1hnBOkutY6z3acy
	txTls8AjhylWgQvvJS3J5VYv1eBxPmmv2BoapMt+iaC+qH4X4SS4RoHw9fgo8Tl4VOcsrSZelQP4Q
	ZwpHRbeisxmEJjyw7GgsDZX8nKN5Eq3YubP68ExYqQhPTSASuUStFhm1Yf+95q6bEtPc20cQxy/Ng
	bU1ey8tT3ETSjjFULa4bXjWw5PlBQh4NpCxzD18ygdUq6XHKb61TYDerIbxrkpT1ZGX3o1XYpdqP8
	JBJStq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2aG-009u9Q-Os; Wed, 01 Feb 2023 02:10:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2Zn-009tzu-Ho; Wed, 01 Feb 2023 02:10:22 +0000
X-UUID: 8b44d666a1d511edbbe3f76fe852e059-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wodpxQJxS9WBV/Id1cRLy+b4gQiIXHj/BKyDu9o+YQM=;
	b=WarmTsOdHJqJrGsIz6+rGJ+ZgiSOSzGQd0iBOb/bwdNuEotP7OSVZLdOs27WZ1chW66S2wXWdUr22zcfGkulVRjK2KIKmGmATAmotWadoswEFafrAk9DB6CY5gszlGhMcRtZe1fAeNeu8C9KVVjPK5+YLhb7zTgfin8oIYqFMZM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:c95244d1-397c-447d-9289-90f5178f26a6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:1a3eea55-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 8b44d666a1d511edbbe3f76fe852e059-20230131
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1781658412; Tue, 31 Jan 2023 19:10:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Feb 2023 10:09:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 1 Feb 2023 10:09:27 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Chuanhong Guo <gch981213@gmail.com>, Xiangsheng Hou
	<xiangsheng.hou@mediatek.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<benliang.zhao@mediatek.com>, <bin.zhang@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 3/5] dt-bindings: spi: mtk-snfi: Add compatible for MT7986
Date: Wed, 1 Feb 2023 10:09:19 +0800
Message-ID: <20230201020921.26712-4-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201020921.26712-1-xiangsheng.hou@mediatek.com>
References: <20230201020921.26712-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_181019_646341_56AFD591 
X-CRM114-Status: GOOD (  10.41  )
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

Add dt-bindings documentation of SPI NAND controller
for MediaTek MT7986 SoC platform. And add optional
nfi_hclk property which is needed for MT7986.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   | 51 +++++++++++++++----
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
index 6e6e02c91780..bab23f1b11fd 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
@@ -18,14 +18,12 @@ description: |
   using the accompanying ECC engine. There should be only one spi
   slave device following generic spi bindings.
 
-allOf:
-  - $ref: /schemas/spi/spi-controller.yaml#
-
 properties:
   compatible:
     enum:
       - mediatek,mt7622-snand
       - mediatek,mt7629-snand
+      - mediatek,mt7986-snand
 
   reg:
     items:
@@ -36,14 +34,12 @@ properties:
       - description: NFI interrupt
 
   clocks:
-    items:
-      - description: clock used for the controller
-      - description: clock used for the SPI bus
+    minItems: 2
+    maxItems: 3
 
   clock-names:
-    items:
-      - const: nfi_clk
-      - const: pad_clk
+    minItems: 2
+    maxItems: 3
 
   nand-ecc-engine:
     description: device-tree node of the accompanying ECC engine.
@@ -57,6 +53,43 @@ required:
   - clock-names
   - nand-ecc-engine
 
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt7622-snand
+            - mediatek,mt7629-snand
+    then:
+      properties:
+        clocks:
+          items:
+            - description: clock used for the controller
+            - description: clock used for the SPI bus
+        clock-names:
+          items:
+            - const: nfi_clk
+            - const: pad_clk
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt7986-snand
+    then:
+      properties:
+        clocks:
+          items:
+            - description: clock used for the controller
+            - description: clock used for the SPI bus
+            - description: clock used for the AHB bus
+        clock-names:
+          items:
+            - const: nfi_clk
+            - const: pad_clk
+            - const: nfi_hclk
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1



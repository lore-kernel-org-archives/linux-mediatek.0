Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C226DFD88DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 03:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x9w1T9+ZMRqO4JTSRNp+a1GuXtzo/uA5lgWJpKFdqmg=; b=OT/C+JkWteL20X5D1oxV5C7U61
	eegc/fW+g1lDtS2n8Y81HFEW9Jf0Yb6fB3TpSdKSPzFeLsEFTrmKksTxPa30lAsGJOqptr3HrjC+7
	b8Gq5sQ5MMOpvwSXrMDy3/+OAnWaunYJwQMf2lQydjC3WxqjLuOXPltEg49lgCiXRQ7WM8c8i8AdV
	af69uyf4/E4L17oyxD4x4lajQRLa1gadOo7KP4rR/4ryFoXD4yT97Xq1sjXpVinge5ukN3qYIRhXb
	BeY/yLOYp+ozhqDvJqTcnY7J8iU2vEQ0I/yUR5RAepeWAvF7/jtoN6x7rigHMnSH+Uz2aEEcIADkD
	fdUg2ROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0AUF-0000000Ade3-0HNg;
	Wed, 11 Mar 2026 03:43:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0AUC-0000000Add4-1js2;
	Wed, 11 Mar 2026 03:43:53 +0000
X-UUID: 831698621cfc11f19e7563141e833ce8-20260310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=x9w1T9+ZMRqO4JTSRNp+a1GuXtzo/uA5lgWJpKFdqmg=;
	b=BxVukNpBodKjpQwKQBgxjLOrugEuStbtWidfQHc5DNx76956Sn0eG45IlQbu/CQ0BCOAaKh3pJl3fwi8o2PVuxvcR5slSajOHqtH4pwSw+7ApXysjE7poS8BYH710eLvOqBRbjEm1LakZQ7kDJsKll8gBKLfUFH/3Tk2IZWNL5E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:3a07a0a6-167f-4380-9b7b-769e3e83c587,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:b9c87cea-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 831698621cfc11f19e7563141e833ce8-20260310
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ot_meiker.gao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 28180441; Tue, 10 Mar 2026 20:43:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Mar 2026 11:43:45 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Mar 2026 11:43:45 +0800
From: Meiker Gao <ot_meiker.gao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bayi Cheng
	<bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Meiker Gao <ot_meiker.gao@mediatek.com>
Subject: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock bindings for mt8189
Date: Wed, 11 Mar 2026 11:43:40 +0800
Message-ID: <20260311034342.721583-1-ot_meiker.gao@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_204352_476540_9377EEE5 
X-CRM114-Status: GOOD (  11.96  )
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

Update mediatek,spi-mtk-nor.yaml to add conditional clock and
clock-names bindings for the mt8189-nor platform. The mt8189-nor
controller requires five specific clocks and corresponding clock-names
("spi", "sf", "axi_f", "axi_h", "axi_p"). This change enforces these
requirements in the device tree binding schema.

For other platforms, the minimum number of clocks and clock-names
remains unchanged. The patch also adds an example for mt8189-nor,
illustrating the new clock configuration.

This update ensures correct hardware description and validation for
mt8189-nor, improving compatibility and reducing configuration errors.

Signed-off-by: Meiker Gao <ot_meiker.gao@mediatek.com>
(cherry picked from commit c3180d35e52b5213764a89403e71f9a34d7bb842)
---
 .../bindings/spi/mediatek,spi-mtk-nor.yaml    | 46 ++++++++++++++-----
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index a453996c13f2..ff815266479f 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -17,9 +17,6 @@ description: |
   for devices other than SPI NOR flash due to limited transfer
   capability of this controller.
 
-allOf:
-  - $ref: /schemas/spi/spi-controller.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -27,6 +24,7 @@ properties:
           - mediatek,mt8173-nor
           - mediatek,mt8186-nor
           - mediatek,mt8192-nor
+          - mediatek,mt8189-nor
       - items:
           - enum:
               - mediatek,mt2701-nor
@@ -39,6 +37,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8188-nor
+              - mediatek,mt8189-nor
           - const: mediatek,mt8186-nor
 
   reg:
@@ -56,14 +55,8 @@ properties:
                      design, so this is optional.
       - description: clock used for controller axi slave bus.
                      this depends on hardware design, so it is optional.
-
-  clock-names:
-    minItems: 2
-    items:
-      - const: spi
-      - const: sf
-      - const: axi
-      - const: axi_s
+      - description: clock used for controller axi_f, axi_h, and
+                     axi_p to support the new platform.
 
 required:
   - compatible
@@ -71,6 +64,35 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-nor
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          maxItems: 5
+          items:
+            - const: spi
+            - const: sf
+            - const: axi_f
+            - const: axi_h
+            - const: axi_p
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: spi
+            - const: sf
+            - const: axi
+
 unevaluatedProperties: false
 
 examples:
@@ -81,7 +103,7 @@ examples:
       #address-cells = <2>;
       #size-cells = <2>;
 
-      nor_flash: spi@1100d000 {
+      spi@1100d000 {
         compatible = "mediatek,mt8173-nor";
         reg = <0 0x1100d000 0 0xe0>;
         interrupts = <1>;
-- 
2.45.2



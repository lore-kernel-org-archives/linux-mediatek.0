Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A094CC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 03:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qlh/VbDYXlXEU1JaXc715148R0jpddLs+ZhwUrdEA90=; b=mvdo7b9iGIe8IOwvq1bodPuHJr
	WL+QvKtOs9s6bsvRveGvq7xepB3eS2syvdYetaD7BUCY15nuTQd146/D0p+E1sfUChNc6Jj2OK6tw
	dxubBkEGcU7A58+L7nRf+1voNfwqjJVQHQeIxqJvop7pG7CJ2EolFeRW+5xAkhbuZ8yeQ3KakCHqH
	hv95fecOAyYLGjH+jgyma10iHeiPDUhl/mRTcczknn2Fa5MUreJ9ZUbJqxBuvEDulZWx/0Q8kGFb9
	7hYNbNL4rMQbcLO9wllz/SA1OYLLH+8+H8//YmzsmFPsAfqp/Qc1vwXY8P4RThFnYNpbNA7XuAaGU
	EIRLbAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG9ik-001bWO-1D;
	Thu, 21 Dec 2023 03:27:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG9if-001bVi-1Z;
	Thu, 21 Dec 2023 03:27:35 +0000
X-UUID: dcfbcba29fb011ee9b09ad09c76753c8-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qlh/VbDYXlXEU1JaXc715148R0jpddLs+ZhwUrdEA90=;
	b=F5RWXqHPPTCwYDeM+Zckon9CTQAHP5hBqWehQOEoNSgOYogk8NQyQmBOGY8G2n6A9J67oAMM5+fW04FcKAjjXzHsIH/XNv85ENYea1vWUkO6gHze/aXIjYOc0qQbb/VQUpH9JXiNScjFx+4ohb/TRvw6ni6hLkfCos4TE4Rk0zY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:75ccbbb8-6bdc-4c16-a8a2-076d232c485c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:0b1a688d-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dcfbcba29fb011ee9b09ad09c76753c8-20231220
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 802695935; Wed, 20 Dec 2023 20:27:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Dec 2023 11:26:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Dec 2023 11:26:49 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-wireless@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH v4] dt-bindings: net: wireless: mt76: add interrupts description for MT7986
Date: Thu, 21 Dec 2023 11:26:48 +0800
Message-ID: <20231221032648.641-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_192733_531127_DD812AB0 
X-CRM114-Status: GOOD (  12.13  )
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

The mt7986 can support four interrupts to distribute the interrupts
to different CPUs.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
v2: Change to use description instead of using items.
v3: Change to use items and set different minItems for mediatek,mt7986-wmac
v4: Move allOf after required and remove duplicated blank line.
---
 .../bindings/net/wireless/mediatek,mt76.yaml  | 32 ++++++++++++++++---
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 252207adbc54..0c6835db397f 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -19,9 +19,6 @@ description: |
   Alternatively, it can specify the wireless part of the MT7628/MT7688
   or MT7622/MT7986 SoC.
 
-allOf:
-  - $ref: ieee80211.yaml#
-
 properties:
   compatible:
     enum:
@@ -38,7 +35,12 @@ properties:
       MT7986 should contain 3 regions consys, dcm, and sku, in this order.
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: major interrupt for rings
+      - description: additional interrupt for ring 19
+      - description: additional interrupt for ring 4
+      - description: additional interrupt for ring 5
 
   power-domains:
     maxItems: 1
@@ -217,6 +219,23 @@ required:
   - compatible
   - reg
 
+allOf:
+  - $ref: ieee80211.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt7986-wmac
+    then:
+      properties:
+        interrupts:
+          minItems: 4
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
@@ -293,7 +312,10 @@ examples:
         reg = <0x18000000 0x1000000>,
               <0x10003000 0x1000>,
               <0x11d10000 0x1000>;
-        interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&topckgen 50>,
                  <&topckgen 62>;
         clock-names = "mcu", "ap2conn";
-- 
2.18.0



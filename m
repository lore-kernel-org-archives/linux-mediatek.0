Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8595C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 02:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3lY7FhYW8bydCyV35uXnsb7aKIt29uMlfMFuMzxU/KU=; b=qPAcHrB+D9EyWZ4b6MtwsnDgUa
	9QShTUENCYRiOKHOBn+NsU2x601WgVn1HEBROd2PspMCLnCiiF+P/sDYFwxMV+CyKnfd1N2t2f5jB
	TipAWyqrrDq+Q8HV4U21HBn+KirKQByU/fIcrd72o4mB3n35/zVE7O9TgZFXMjn43idHl5yjCQ/dc
	EE+oQOqrV62lLjkXYUPwQuS8Pyd0jk7lNgdzA2LVcBbrTXKM/IGVB32/HyFJcMuHYirVHVj50IZwk
	dbB82cLlVVqB8kwp1THRdohWFYU0MNGDtBhnIMehaakCLdf6nTNiISJieDkQb41UfEg2U4C0NCXbk
	i+ZRZKkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDy6b-001ooh-2t;
	Fri, 15 Dec 2023 02:39:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDy6Z-001onu-29
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Dec 2023 02:39:13 +0000
X-UUID: 1f6ec15a9af311ee9b09ad09c76753c8-20231214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3lY7FhYW8bydCyV35uXnsb7aKIt29uMlfMFuMzxU/KU=;
	b=Z4tU6NHlAbGCVf6ZBrTkok8pS2mLub+sy97qOkgRNJxmpEKNHsiSuSbv71DtwSq7cjt6T6WLu8J1TK8gMbYNqUD+Dy623ZoUz+TdAqqtu/NdkR6XLzyXRAO0YUBcmi8PpBFLoB1h8erSGQrdKqfGAdgmDOm/RMNm2prMsrX1yo8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:8be1454b-3308-47f4-a842-f5ddcc741045,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:0cbb32bd-2ac7-4da2-9f94-677a477649d9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1f6ec15a9af311ee9b09ad09c76753c8-20231214
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1248332382; Thu, 14 Dec 2023 19:39:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Dec 2023 10:38:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Dec 2023 10:38:34 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Rob Herring <robh+dt@kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH v3] dt-bindings: net: wireless: mt76: add interrupts description for MT7986
Date: Fri, 15 Dec 2023 10:38:33 +0800
Message-ID: <20231215023833.8881-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.915200-8.000000
X-TMASE-MatchedRID: w/VW/btTjlN2W20gLTzAqYei/mZCYVwuONP4Z3dggBYY0A95tjAn+/pZ
	jWQiqBlhCqcYnzgqPbuQgj4GwqRgEGYcIRLN0eUlD9eI/GwXvmabKpAlY2y6SXJOfTLfZoT/o8W
	MkQWv6iUoTQl7wNH8PuTCMddcL/gjymsk/wUE4hou6Qpk47HQBHyiiLj01f1g2O88rCZjUyM4D/
	FQUsFVY46jMlFISqvqwL6SxPpr1/I=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.915200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1B0291CB557CA8917F3562BB33DC795A87AF8765363D6618AD047A22F62B8F2A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_183911_706804_29AF709C 
X-CRM114-Status: UNSURE (   9.20  )
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

The mt7986 can support four interrupts to distribute the interrupts
to different CPUs.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
v2: Change to use description instead of using items.
v3: Change to use items and set different minItems for mediatek,mt7986-wmac
---
 .../bindings/net/wireless/mediatek,mt76.yaml  | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 252207adbc54..58bbddabd388 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -38,7 +38,12 @@ properties:
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
@@ -213,6 +218,22 @@ properties:
                     description:
                       Half-dBm power delta for different numbers of antennas
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mediatek,mt7986-wmac
+then:
+  properties:
+    interrupts:
+      minItems: 4
+else:
+  properties:
+    interrupts:
+      maxItems: 1
+
+
 required:
   - compatible
   - reg
@@ -293,7 +314,10 @@ examples:
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



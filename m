Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4EFC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 03:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w0zhHTFWA03x1O2f6LVHcIebtJwTLXkrPBnvPfMfwzE=; b=OOevMvxk9Bj61JbdoOkBaAjEK0
	YcyW3XF6+8KPHS68Rky8UBSWwgHinL1knCrCjfE7/FCgJ/pxX5d5KXQztzc/79MAOeASIYWvwqhMa
	VFdWZ9mRcaeC0atX/eNWF5tv+C10g4JapAd3pmNwvQOERTo89qrBM17nB7xHjN8UlsEIjwu5Hnb/5
	wZ+yQ6Tpq7Q/Hkf04Xav9JL4QWxB/y1LbnAOi1jb6bj30oGBgNj3d+nzI1O+PopLtOj9w/+aQ1Waw
	QPxVXMMCj7rd73r3CC8F1NYpM7iwd4TOk7n0GxgkP3jR9IBaaNlkLkvM6gqGEMtMRRiVZSHcXfJ8e
	YGxV+xmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pEB-0040X1-0n;
	Tue, 28 Nov 2023 03:57:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pE8-0040WL-1b
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Nov 2023 03:57:37 +0000
X-UUID: 3ea985f48da211ee86758d4a7c00f3a0-20231127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=w0zhHTFWA03x1O2f6LVHcIebtJwTLXkrPBnvPfMfwzE=;
	b=qyQxmlqGylU2osV2eA6wtV8gzbzWqj4P+xxrSOMQMoEWazGMR1cdDJsqeHs+3CVvt6TKwQ66/eClsLFJYQJQsPJtMD7RBJmjCK5KGdck9g/ox2ccL6A9Yto5trgLwdDPo0UH0aycgt1+KN6XwBIfWN5Vf1hLoA7N1ZEDDDj27Xk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:e4393c10-ec3c-4c95-b91b-057da7871827,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:6b8b06fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3ea985f48da211ee86758d4a7c00f3a0-20231127
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 161359441; Mon, 27 Nov 2023 20:57:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 28 Nov 2023 11:57:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 28 Nov 2023 11:57:24 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Rob Herring <robh+dt@kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH] dt-bindings: net: wireless: mt76: add interrupts description for MT7986
Date: Tue, 28 Nov 2023 11:57:23 +0800
Message-ID: <20231128035723.5217-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_195736_561186_2C10C08F 
X-CRM114-Status: UNSURE (   9.51  )
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
 .../bindings/net/wireless/mediatek,mt76.yaml  | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 252207adbc54..20f5f2ead265 100644
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
@@ -38,7 +35,8 @@ properties:
       MT7986 should contain 3 regions consys, dcm, and sku, in this order.
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
 
   power-domains:
     maxItems: 1
@@ -219,6 +217,24 @@ required:
 
 unevaluatedProperties: false
 
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
+          minItems: 1
+          items:
+            - description: major interrupt for rings
+            - description: addditional interrupt for ring 19
+            - description: addditional interrupt for ring 4
+            - description: addditional interrupt for ring 5
+
 examples:
   - |
     pcie0 {
-- 
2.18.0



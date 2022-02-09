Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DC0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 06:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yOFuP7OXkjtiSLe/9B68jnwCwokomuJKToyZAKozoQ=; b=xbp0Bwq2++AFZ/
	Fe/1NLSycNHrdAfV9FWKA//YqZ1x1sZ2dwPNs+G2gNLr5t68KAGzPLD6wKmii3eEE9+prsJpHh+d7
	o2NEpTEYxyV4HqejnXkbor34Ay7mhSE5QqWoPk+MVM8rXe3gcl6am4jx8ig8OfcECSUlfaDmZpqgV
	sL7CAKHR9xVAPzPS6x0r1OlofKx7V+cojTezqYnzWUozc6HVRijphW5/mw4i+lDCgtt9ptjYUdAEA
	uF2epgtCsmddvBj77qTJ5HaYsUo2vhZIJeWkiJrzVdNXC6iCQsfhsgnfEf/2rjeJPLrCbDzexe2wm
	ljgeJlSK+2TIkPCp1G7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHgFx-00GKGa-Jy; Wed, 09 Feb 2022 06:15:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHgFs-00GKFG-EB
 for linux-mediatek@lists.infradead.org; Wed, 09 Feb 2022 06:15:08 +0000
X-UUID: 2292cc07629641dfb47b4ea055323fa0-20220208
X-UUID: 2292cc07629641dfb47b4ea055323fa0-20220208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2037781435; Tue, 08 Feb 2022 23:14:56 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Feb 2022 22:12:04 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Feb 2022 14:12:00 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 9 Feb 2022 14:11:59 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Peter Chiu
 <chui-hao.chiu@mediatek.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: net: wireless: mt76: document bindings
 for MT7986
Date: Wed, 9 Feb 2022 14:11:55 +0800
Message-ID: <08ef978845036560bb08b72e948e42f858e087d3.1644386694.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1644386694.git.Bo.Jiao@mediatek.com>
References: <cover.1644386694.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_221504_509163_84448939 
X-CRM114-Status: GOOD (  10.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Add an entry for MT7986 SoC.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: devicetree@vger.kernel.org
---
v3:
 - fix yamllint warnings and errors
 - add 'minItems: 1' to keep 1 reg entry being valid
v4:
 - add description for property reg items
---
 .../bindings/net/wireless/mediatek,mt76.yaml  | 33 +++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 1489d3c..a76e5f7 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -18,7 +18,7 @@ description: |
   wireless device. The node is expected to be specified as a child
   node of the PCI controller to which the wireless chip is connected.
   Alternatively, it can specify the wireless part of the MT7628/MT7688
-  or MT7622 SoC.
+  or MT7622/MT7986 SoC.
 
 allOf:
   - $ref: ieee80211.yaml#
@@ -29,9 +29,13 @@ properties:
       - mediatek,mt76
       - mediatek,mt7628-wmac
       - mediatek,mt7622-wmac
+      - mediatek,mt7986-wmac
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+    description:
+      MT7986 should contain 3 regions consys, dcm, and sku, in this order.
 
   interrupts:
     maxItems: 1
@@ -39,6 +43,17 @@ properties:
   power-domains:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+    description:
+      Specify the consys reset for mt7986.
+
+  reset-name:
+    const: consys
+
   mediatek,infracfg:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -165,7 +180,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -231,3 +246,15 @@ examples:
 
       power-domains = <&scpsys 3>;
     };
+
+  - |
+    wifi@18000000 {
+        compatible = "mediatek,mt7986-wmac";
+        resets = <&watchdog 23>;
+        reset-names = "consys";
+        reg = <0x18000000 0x1000000>,
+              <0x10003000 0x1000>,
+              <0x11d10000 0x1000>;
+        interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;
+        memory-region = <&wmcpu_emi>;
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2940C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXsv7e0mquDye2a4n5qiTDkICSVuoqbPz84sm3Gkhaw=; b=AE8dXlFWukQME9
	iWYSWFamaJ3roQBQLDyRrUUqGfhSCWjWMnsEdM3rTWK6iQet41NySWkmVino2RcgFct39zlOaYLYa
	v/dKyLOsNUzGj9dNaukZ+y7Q4WExWCqtgIFnZAF3T2qjqqz5VxtBh59JVLIxxhX/tOAn4wFmTM6fs
	moWrvW9r9/X77wXX0pYHX6PR5llHLjyIRj0cS6MRcQPAjdEaGi9KY1HGVhl4/sTtDdl9tqTlEh1YN
	+QF0NjpT2b/Zagy+O3AhOf3IQew5S7p0U1SYrLxOhuo72OHkuFLIefn3An/p/4+7055USGFAUzpCm
	BYCaShazX5A+3G6dTDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Fy1-00GCBY-Gx; Tue, 11 Jan 2022 12:09:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Fxy-00GC9G-LF
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 12:09:31 +0000
X-UUID: 3068375626da457aa548ed5c8ebee4fb-20220111
X-UUID: 3068375626da457aa548ed5c8ebee4fb-20220111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1423995947; Tue, 11 Jan 2022 05:09:27 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 03:59:27 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 11 Jan 2022 19:59:25 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 11 Jan 2022 19:59:24 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Peter Chiu
 <chui-hao.chiu@mediatek.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: net: wireless: mt76: document bindings
 for MT7986
Date: Tue, 11 Jan 2022 19:59:17 +0800
Message-ID: <67eb9adaa2ed281cb6b8f3c74afc0cc7081f0f6b.1641901681.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1641901681.git.Bo.Jiao@mediatek.com>
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_040930_736302_888BBD1E 
X-CRM114-Status: GOOD (  10.97  )
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
 .../bindings/net/wireless/mediatek,mt76.yaml  | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 1489d3c..4444524 100644
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
@@ -29,9 +29,10 @@ properties:
       - mediatek,mt76
       - mediatek,mt7628-wmac
       - mediatek,mt7622-wmac
+      - mediatek,mt7986-wmac
 
   reg:
-    maxItems: 1
+    maxItems: 3
 
   interrupts:
     maxItems: 1
@@ -39,6 +40,17 @@ properties:
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
@@ -231,3 +243,16 @@ examples:
 
       power-domains = <&scpsys 3>;
     };
+
+  - |
+    #include <dt-bindings/reset/mt7986-resets.h>
+    wifi@18000000 {
+        compatible = "mediatek,mt7986-wmac";
+        resets = <&watchdog MT7986_TOPRGU_CONSYS_RST>;
+        reset-names = "consys";
+        reg = <0 0x18000000 0 0x1000000>,
+              <0 0x10003000 0 0x1000>,
+              <0 0x011d1000 0 0x1000>;
+        interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;
+        memory-region = <&wmcpu_emi>;
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

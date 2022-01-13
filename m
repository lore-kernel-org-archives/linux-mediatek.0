Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8FEC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6xJC5wsgG4frBiPePbvL0C7dCRFk5JfbNu6GCzCz8k=; b=lzOzGL0Vw/Bh0S
	D4nSEIZGujlVGUgGFnbIqEGlUmjsBfzhpm3PPw4wc0/4vfwkyA2vFM046Dq7oD/3n5DAe9HnAo5th
	lDgjhNDwsS7+AwK9MUKpW+2H99jCoHEMlC+ElqGd/MV/Mb4LS8TBGTNJTFi5NDUpSTrO1b1mV1lMy
	yOxej7cSiA5V/VhDdOrAck6/+l4tEBnAtIi0Syz3zeYg5ToUgHn7XiyfWWfY3xyCcdHtaZ0ayXqi9
	DQltOPgu2fuMtm7gBGeKG/saxfK83qbRbzFD1aqsToUigLTCL1gS6PduscH1C6TmQYR+Oy5InRBDY
	seu2+X+6HK4Uu+fyblsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7y6U-005bV0-Et; Thu, 13 Jan 2022 11:17:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7y6G-005bQf-AB; Thu, 13 Jan 2022 11:17:01 +0000
X-UUID: 35b09155b387470f9011b89cf8b34d9b-20220113
X-UUID: 35b09155b387470f9011b89cf8b34d9b-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 497215695; Thu, 13 Jan 2022 04:16:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 03:11:14 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 13 Jan 2022 19:11:13 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 19:11:12 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Joerg Roedel <joro@8bytes.org>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <lc.kan@mediatek.com>, <yi.kuo@mediatek.com>, <anthony.huang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 1/7] dt-bindings: memory: mtk-smi: Rename clock to clocks
Date: Thu, 13 Jan 2022 19:10:51 +0800
Message-ID: <20220113111057.29918-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220113111057.29918-1-yong.wu@mediatek.com>
References: <20220113111057.29918-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_031700_383590_DDD084E2 
X-CRM114-Status: GOOD (  10.48  )
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

The property "clock" should be rename to "clocks", and delete the "items",
the minItems/maxItems should not be put under "items".

Fixes: 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 .../mediatek,smi-common.yaml                  | 28 ++++++++-----------
 .../memory-controllers/mediatek,smi-larb.yaml | 14 ++++------
 2 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 3a82b0b27fa0..4fca71f34310 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -88,10 +88,9 @@ allOf:
               - mediatek,mt2701-smi-common
     then:
       properties:
-        clock:
-          items:
-            minItems: 3
-            maxItems: 3
+        clocks:
+          minItems: 3
+          maxItems: 3
         clock-names:
           items:
             - const: apb
@@ -108,10 +107,9 @@ allOf:
       required:
         - mediatek,smi
       properties:
-        clock:
-          items:
-            minItems: 3
-            maxItems: 3
+        clocks:
+          minItems: 3
+          maxItems: 3
         clock-names:
           items:
             - const: apb
@@ -133,10 +131,9 @@ allOf:
 
     then:
       properties:
-        clock:
-          items:
-            minItems: 4
-            maxItems: 4
+        clocks:
+          minItems: 4
+          maxItems: 4
         clock-names:
           items:
             - const: apb
@@ -146,10 +143,9 @@ allOf:
 
     else:  # for gen2 HW that don't have gals
       properties:
-        clock:
-          items:
-            minItems: 2
-            maxItems: 2
+        clocks:
+          minItems: 2
+          maxItems: 2
         clock-names:
           items:
             - const: apb
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index eaeff1ada7f8..bd7aa8257949 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -79,10 +79,9 @@ allOf:
 
     then:
       properties:
-        clock:
-          items:
-            minItems: 3
-            maxItems: 3
+        clocks:
+          minItems: 3
+          maxItems: 3
         clock-names:
           items:
             - const: apb
@@ -91,10 +90,9 @@ allOf:
 
     else:
       properties:
-        clock:
-          items:
-            minItems: 2
-            maxItems: 2
+        clocks:
+          minItems: 2
+          maxItems: 2
         clock-names:
           items:
             - const: apb
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

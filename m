Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0EEC6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:28:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF352610CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF352610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyQViuvxu7wDHKJ14tRXrT0fvOnj3d3s4OyjeRQSepg=; b=Byf+Z87x28Evox
	pwIZZe5dG1vglEjThRs7EMRI7exkI3uyRE8ZV9NBDRqLOA7ZDHjnErLEGESyZI0zL8JxIaqUJlNps
	MekTcpplDQpVYtWsN59pOPtGfRIZdMOOWQDJtVs/5hxb7SAKs8Niujxdh7Trp9JIqjR0TWVBzIwKl
	Tyfs1EYGB1gWtPK3aeZ0WZ/MEBhZnywtNUyeA3An+j6ciq8FkAnxyBI0BhviH/rp1wJeIU11rm9td
	TuFvNEWpG7XUVSebxXhFBEr+pnkQzN/WPvh2v+izhVrlZ6QW4lkDRMELmlqQHs6ojp69vFYaRHE/r
	jkdIy5+wOxBq/uXcC85w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6V0M-000tKW-9M; Thu, 22 Jul 2021 09:28:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6UyS-000sh2-FJ; Thu, 22 Jul 2021 09:26:38 +0000
X-UUID: 6a7d2f559126472f90e1aef070c9617d-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9QdMg0/cPtS/3IO5qFbKWT+QUsFZVYAImgyLoE5y9VY=; 
 b=c7i8I4jsexsUQqArJL1yqd5Mx9OuJM2FIhAUS5YKOkmMSggJiPt87v9yaPaxqXubX7pXszEs0IgrvETT4cRhPH55SDYAe4Po/3yoswp0Qz2mZufYxqWyNA8dZ33xGR4Cg/T6e3mTsz1tlu5Lkhgd4PxV/ONs0NyckKtYHZiYJ2k=;
X-UUID: 6a7d2f559126472f90e1aef070c9617d-20210722
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1416062012; Thu, 22 Jul 2021 02:26:32 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 02:26:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:26:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:26:28 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Fabien Parent
 <fparent@baylibre.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>, Jitao
 shi <jitao.shi@mediatek.com>, <fshao@chromium.org>, <nancy.lin@mediatek.com>, 
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 5/5] dt-bindings: mediatek: display: add mt8195 SoC binding
Date: Thu, 22 Jul 2021 17:26:24 +0800
Message-ID: <20210722092624.14401-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
References: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_022636_614349_17C8E456 
X-CRM114-Status: GOOD (  11.61  )
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

Add mt8195 SoC display binding.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../display/mediatek/mediatek,disp.yaml       | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
index f16ee592735d..db0491ddb1d2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
@@ -54,6 +54,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-ovl
+              - mediatek,mt8195-disp-ovl
           - enum:
               - mediatek,mt8183-disp-ovl
 
@@ -73,6 +74,8 @@ properties:
           - const: mediatek,mt8173-disp-rdma
       - items:
           - const: mediatek,mt8183-disp-rdma
+      - items:
+          - const: mediatek,mt8195-disp-rdma
       - items:
           - enum:
               - mediatek,mt7623-disp-rdma
@@ -95,6 +98,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-ccorr
+              - mediatek,mt8195-disp-ccorr
           - enum:
               - mediatek,mt8183-disp-ccorr
 
@@ -115,6 +119,7 @@ properties:
           - enum:
               - mediatek,mt8183-disp-color
               - mediatek,mt8192-disp-color
+              - mediatek,mt8195-disp-color
           - enum:
               - mediatek,mt8173-disp-color
 
@@ -124,6 +129,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-dither
+              - mediatek,mt8195-disp-dither
           - enum:
               - mediatek,mt8183-disp-dither
 
@@ -135,6 +141,7 @@ properties:
               - mediatek,mt2712-disp-aal
               - mediatek,mt8183-disp-aal
               - mediatek,mt8192-disp-aal
+              - mediatek,mt8195-disp-aal
           - enum:
               - mediatek,mt8173-disp-aal
 
@@ -146,10 +153,17 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-gamma
+              - mediatek,mt8195-disp-gamma
           - enum:
               - mediatek,mt8183-disp-gamma
 
+      # DSC: see Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml for details.
+      - items:
+          - const: mediatek,mt8195-disp-dsc
+
       # MERGE: merge streams from two RDMA sources
+      - items:
+          - const: mediatek,mt8195-disp-merge
 
       # POSTMASK: control round corner for display frame
       - items:
@@ -209,6 +223,8 @@ properties:
           - const: mediatek,mt8183-disp-mutex
       - items:
           - const: mediatek,mt8192-disp-mutex
+      - items:
+          - const: mediatek,mt8195-disp-mutex
 
       # OD: overdrive
       - items:
@@ -237,7 +253,7 @@ properties:
   mediatek,larb:
     description: The compatible property should be one of DMA function blocks,
       such as "mediatek,<chip>-disp-ovl", "mediatek,<chip>-disp-rdma" or
-      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167 and mt8173.
+      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167, mt8173 and mt8195.
       Should contain a phandle pointing to the local arbiter device as defined in
       Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
       It must sort according to the local arbiter index, like larb0, larb1, larb2...
@@ -248,7 +264,7 @@ properties:
   iommus:
     description: The compatible property should be one of DMA function blocks,
       such as "mediatek,<chip>-disp-ovl", "mediatek,<chip>-disp-rdma" or
-      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167 and mt8173.
+      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167, mt8173 and mt8195.
       Should point to the respective IOMMU block with master port as argument, see
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
 
@@ -442,3 +458,7 @@ examples:
         power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DISP_OD>;
     };
+
+    dsc0: disp_dsc_wrap@1c009000 {
+        /* See mediatek,dsc.yaml for details */
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

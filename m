Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911E2C5CFC2
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:38:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5064B61357
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5064B61357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYNxqBFAsjT9mXO3NZiwBuITYsS30ir1zk7Q6ccdVIM=; b=f15E+i+ZYrUff7
	GElHDFrbJVm9mObTBzMLFALsoCT5gkydiekNxYgd0IbqxHKyK9KrbdPFyx8/2opS35o6fQ4ZY3Z7J
	nF56zafg33z39zwaAkcCvS+ycIgZCH1cBQj44TGlfSv1lVATSde0CMEO96FXdedKMuBH7jnm/RyZh
	4UwVfTTA6kWXoTMuHbnxj36Rx1bexn7EulPnXKktmOIf7UzdqEMi3J5A8aMkWPywQuQmOYolihQGz
	uLWu3BVzyrr1e0E0+8vMNf6IZym3jqJZXu0LOtGYpcnkyDYMvc7TEN9N7P06dQiiSVJ9Uui/5SoZO
	UZmEp0BgRMjtgRmS+fCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m45JI-001mse-7v; Thu, 15 Jul 2021 17:38:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m45JE-001mqT-I7; Thu, 15 Jul 2021 17:38:06 +0000
X-UUID: 2adda54fa6804573a84162c992223952-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NB/Mmevxqh9VrZIRCNnU9P/KJis/C/ffc328PnieOZA=; 
 b=cyUzBgu2zdctGv68rGWaqtOqeLO+ciFB7S/9ttLVvXNsvZ08w0t7oNS8TKtcxKWBrs5vqOSr7FBcbsF2jHO794Ee8NMpQnucQJIMMoFyGBlPdqyfCc/8SuBshQKJFG4oZ/hqLeIMCaVJ6Xfv0VwevTWFhKIzZYxI5hDQEHddY0Q=;
X-UUID: 2adda54fa6804573a84162c992223952-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 805004477; Thu, 15 Jul 2021 10:38:01 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:38:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 01:37:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Jul 2021 01:37:52 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v3 02/12] dt-bindings: mediatek: display: add definition for
 mt8195
Date: Fri, 16 Jul 2021 01:37:40 +0800
Message-ID: <20210715173750.10852-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
References: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_103804_649397_049FC079 
X-CRM114-Status: UNSURE (   9.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add definition for mt8195 display.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,disp.yaml   | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
index 63a6bc975b29..910bb9ce61d6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
@@ -54,6 +54,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-ovl
+              - mediatek,mt8195-disp-ovl
           - enum:
               - mediatek,mt8183-disp-ovl
 
@@ -82,6 +83,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-rdma
+              - mediatek,mt8195-disp-rdma
           - enum:
               - mediatek,mt8183-disp-rdma
 
@@ -95,6 +97,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-ccorr
+              - mediatek,mt8195-disp-ccorr
           - enum:
               - mediatek,mt8183-disp-ccorr
 
@@ -115,6 +118,7 @@ properties:
           - enum:
               - mediatek,mt8183-disp-color
               - mediatek,mt8192-disp-color
+              - mediatek,mt8195-disp-color
           - enum:
               - mediatek,mt8173-disp-color
 
@@ -124,6 +128,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-dither
+              - mediatek,mt8195-disp-dither
           - enum:
               - mediatek,mt8183-disp-dither
 
@@ -135,6 +140,7 @@ properties:
               - mediatek,mt2712-disp-aal
               - mediatek,mt8183-disp-aal
               - mediatek,mt8192-disp-aal
+              - mediatek,mt8195-disp-aal
           - enum:
               - mediatek,mt8173-disp-aal
 
@@ -146,10 +152,13 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-gamma
+              - mediatek,mt8195-disp-gamma
           - enum:
               - mediatek,mt8183-disp-gamma
 
       # MERGE: merge streams from two RDMA sources
+      - items:
+          - const: mediatek,mt8195-disp-merge
 
       # POSTMASK: control round corner for display frame
       - items:
@@ -209,6 +218,7 @@ properties:
           - const: mediatek,mt8183-disp-mutex
       - items:
           - const: mediatek,mt8192-disp-mutex
+          - const: mediatek,mt8195-disp-mutex
 
       # OD: overdrive
       - items:
@@ -234,7 +244,7 @@ properties:
   mediatek,larb:
     description: The compatible property should be one of DMA function blocks,
       such as "mediatek,<chip>-disp-ovl", "mediatek,<chip>-disp-rdma" or
-      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167 and mt8173.
+      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167, mt8173 and mt8195.
       Should contain a phandle pointing to the local arbiter device as defined in
       Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
       It must sort according to the local arbiter index, like larb0, larb1, larb2...
@@ -245,7 +255,7 @@ properties:
   iommus:
     description: The compatible property should be one of DMA function blocks,
       such as "mediatek,<chip>-disp-ovl", "mediatek,<chip>-disp-rdma" or
-      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167 and mt8173.
+      "mediatek,<chip>-disp-wdma". The supported chips are mt2701, mt8167, mt8173 and mt8195.
       Should point to the respective IOMMU block with master port as argument, see
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

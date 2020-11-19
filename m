Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53644C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 06:27:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA46246DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 06:27:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZE3P1zpj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kFU5OHHR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFA46246DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rH1a1X6f1n6XrPYLLAiiXWLhzH3KTwDQVzygREvSHhc=; b=ZE3P1zpjXpRaRERAIv/dgU443
	/nIFLq4xAfiuQVR70Ur+a8Lgf3Vv9tOkvsa3bcc1LwJ66ll2in3qTKG0o9c0qaHv/X6XzfcOk50Kt
	Oqu/I1UowYk2Epiq7TnRJbVtAjBL2YexmK3XH5H78t16lWwRdZdOlR0Lk5LVQIdg96LhuhWqhHtp7
	tioK40H/upsiDrwwclFzZbPynwrXZiI3/+0D6x/9DgHoZCrtl9EXX0JWCLu1p1IJ2jEvJC3NH+cIg
	AW9HKl1JalJw3JkcCoeyQ4rPAmarEMZubORtxYvabR3vPVfakWdQF3WEXwinMjCzqP3/67z1BtCt1
	E9w31hI1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfdPf-0001al-Og; Thu, 19 Nov 2020 06:27:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfdPV-0001Xx-21; Thu, 19 Nov 2020 06:27:14 +0000
X-UUID: 410f37c902124edcb6079917e3c433b0-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=y1eggx/c1xkXIL2GQdxr5azDxRRRd0wr+cWZNFqAzz4=; 
 b=kFU5OHHR1AseSC4RCMRK95aGkTlyXl4kYXAwVxGQD1QQFEYVE8eCLfDNND0JjLB2DGJ5uSXHk8lcb03rwxTOFsVzDtT7FsYEUbJhTQZGcMUZOaL+J691NybVPqUgnN3FNF1ffxXkRvCcplCG9aSJ8d+lLGwJUsZjFbsWEP+mx9E=;
X-UUID: 410f37c902124edcb6079917e3c433b0-20201118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 205146245; Wed, 18 Nov 2020 22:26:55 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 22:19:22 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 14:19:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Nov 2020 14:19:20 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: [PATCH v2 6/6] iommu/mediatek: Convert tlb_flush_walk to
 gather_add_page
Date: Thu, 19 Nov 2020 14:18:36 +0800
Message-ID: <20201119061836.15238-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201119061836.15238-1-yong.wu@mediatek.com>
References: <20201119061836.15238-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_012713_438133_111B86F8 
X-CRM114-Status: GOOD (  15.76  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, jun.wen@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MediaTek TLB flush don't care about granule. when unmap, it could gather
whole the iova range then do tlb flush once.

In current v7s, If unmap the lvl2 pagetable, the steps are:
step1: set this current pdg to 0.
step2: tlb flush for this lvl2 block iova(1M).
step3: free the lvl2 pagetable.

This patch means we delay the step2 after unmap whole the iova.
the iommu consumer HW should have stopped before it call dma_free_xx,
thus, this delay looks ok.

Since tlb_flush_walk doesn't have the "gather" parameter, so we have to
add this "gather" in ourself private data.

Meanswhile, After this patch, the gather_add_pages will always be called,
then "gather->start == ULONG_MAX" is impossible. remove this checking.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
tlb_flush_walk is designed for tlb flush range, I'm not sure whether it's ok
if adding "gather" as a parameter in tlb_flush_walk. in this version, I put
it into our private data.
---
 drivers/iommu/mtk_iommu.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 94786860bd84..4c8200f4403a 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -128,6 +128,8 @@ struct mtk_iommu_domain {
 	struct io_pgtable_ops		*iop;
 
 	struct iommu_domain		domain;
+
+	struct iommu_iotlb_gather	*gather;
 };
 
 static const struct iommu_ops mtk_iommu_ops;
@@ -227,6 +229,17 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 	}
 }
 
+static void mtk_iommu_tlb_flush_walk(unsigned long iova, size_t size,
+				     size_t granule, void *cookie)
+{
+	struct mtk_iommu_data *data = cookie;
+	struct mtk_iommu_domain *m4u_dom = data->m4u_dom;
+	struct iommu_domain *domain = &m4u_dom->domain;
+
+	/* Gather all the iova and tlb flush once after unmap. */
+	iommu_iotlb_gather_add_page(domain, m4u_dom->gather, iova, size);
+}
+
 static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
 					    unsigned long iova, size_t granule,
 					    void *cookie)
@@ -239,8 +252,8 @@ static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
 
 static const struct iommu_flush_ops mtk_iommu_flush_ops = {
 	.tlb_flush_all = mtk_iommu_tlb_flush_all,
-	.tlb_flush_walk = mtk_iommu_tlb_flush_range_sync,
-	.tlb_flush_leaf = mtk_iommu_tlb_flush_range_sync,
+	.tlb_flush_walk = mtk_iommu_tlb_flush_walk,
+	.tlb_flush_leaf = mtk_iommu_tlb_flush_walk,
 	.tlb_add_page = mtk_iommu_tlb_flush_page_nosync,
 };
 
@@ -432,6 +445,7 @@ static size_t mtk_iommu_unmap(struct iommu_domain *domain,
 {
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
 
+	dom->gather = gather;
 	gather->granule_ignore = true;
 	return dom->iop->unmap(dom->iop, iova, size, gather);
 }
@@ -447,9 +461,6 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
 	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
 	size_t length = gather->end - gather->start;
 
-	if (gather->start == ULONG_MAX)
-		return;
-
 	mtk_iommu_tlb_flush_range_sync(gather->start, length, gather->pgsize,
 				       data);
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

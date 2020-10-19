Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D755FC43457
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 11:38:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6324322257
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 11:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zgxk7PBT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HXZ8cWTS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6324322257
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KzoWNYwI9jM3a4NxGaPWENCm1JlmI76AoOJfzDqT6ZE=; b=Zgxk7PBTHAyfcrobMp1WTfyoL
	1aO9xqV1svsoCyGpzPxirLPvPd/s9v4FIYhFrsTJHyp1dMHbcVV948UCBcgOIuKhw5FIfO22eeNIP
	WgiPszkWmazAk4kIS7sgNuxaJCxh2/OyVl3dVoD5vugNCrTzw99O6fWANm5sBTuNia6LFTLmhRRwE
	mD9uW9MdDJShDZQZnW3bYVCQXscpPeum/W+aJCD2SH3azkE9WV8F7+BhutZQ9Qat3Hihb3MZfuv+5
	xHi1o1nRJeC0JemfhWlFSU0YdvFaM9qoiK/Y7Iolv9odXRIdA0xchpFmuFAMViqCDaG8nubMNtUOf
	nobiX0OLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUTUS-00051D-8k; Mon, 19 Oct 2020 11:38:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUTUC-0004vN-8u; Mon, 19 Oct 2020 11:37:58 +0000
X-UUID: 5b7a0c86988545f9936a5f55da52c42a-20201019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PgytRVtoOdd6B5kIyJtkERoueoWC2+wKUHTBlw26xos=; 
 b=HXZ8cWTSqGFlS/i1RulNlId+JvaBEyIU0zdnd3yEQCYJEZfYZkKg0QLgg1U0e3d40vYzW+j4o2psu/8wIrS9KXAy54s6rB1B/WRXqZT8EhLqDbFUB4hefGNPQ+l3lQ/0VnApK4hKa/0Bc5V/CFpjyW2B50ATfZDSZEjeTnOhQD4=;
X-UUID: 5b7a0c86988545f9936a5f55da52c42a-20201019
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 312067652; Mon, 19 Oct 2020 03:37:47 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 04:37:46 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 19:37:35 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Oct 2020 19:37:34 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 3/4] iommu/mediatek: Remove unnecessary tlb sync
Date: Mon, 19 Oct 2020 19:30:59 +0800
Message-ID: <20201019113100.23661-4-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201019113100.23661-1-chao.hao@mediatek.com>
References: <20201019113100.23661-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_073756_505308_EDDE4410 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: Jun Wen <jun.wen@mediatek.com>, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Mingyuan Ma <mingyuan.ma@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As is "[PATCH 2/4]" described, we will use iotlb_sync_range() to replace
iotlb_sync(), tlb_add_range() and tlb_flush_walk/leaf() to enhance
performance. So we will remove the implementation of iotlb_sync(),
tlb_add_range() and tlb_flush_walk/leaf().

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index d3400c15ff7b..bca1f53c0ab9 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -229,21 +229,15 @@ static void __mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size)
 	mtk_iommu_tlb_flush_range_sync(iova, size, 0, NULL)
 }
 
-static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
-					    unsigned long iova, size_t granule,
-					    void *cookie)
+static void mtk_iommu_tlb_flush_skip(unsigned long iova, size_t size,
+				     size_t granule, void *cookie)
 {
-	struct mtk_iommu_data *data = cookie;
-	struct iommu_domain *domain = &data->m4u_dom->domain;
-
-	iommu_iotlb_gather_add_page(domain, gather, iova, granule);
 }
 
 static const struct iommu_flush_ops mtk_iommu_flush_ops = {
 	.tlb_flush_all = mtk_iommu_tlb_flush_all,
-	.tlb_flush_walk = mtk_iommu_tlb_flush_range_sync,
-	.tlb_flush_leaf = mtk_iommu_tlb_flush_range_sync,
-	.tlb_add_page = mtk_iommu_tlb_flush_page_nosync,
+	.tlb_flush_walk = mtk_iommu_tlb_flush_skip,
+	.tlb_flush_leaf = mtk_iommu_tlb_flush_skip,
 };
 
 static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
@@ -443,19 +437,6 @@ static void mtk_iommu_flush_iotlb_all(struct iommu_domain *domain)
 	mtk_iommu_tlb_flush_all(mtk_iommu_get_m4u_data());
 }
 
-static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
-				 struct iommu_iotlb_gather *gather)
-{
-	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
-	size_t length = gather->end - gather->start;
-
-	if (gather->start == ULONG_MAX)
-		return;
-
-	mtk_iommu_tlb_flush_range_sync(gather->start, length, gather->pgsize,
-				       data);
-}
-
 static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
 					  dma_addr_t iova)
 {
@@ -542,7 +523,6 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.unmap		= mtk_iommu_unmap,
 	.flush_iotlb_all = mtk_iommu_flush_iotlb_all,
 	.iotlb_sync_range = __mtk_iommu_tlb_flush_range_sync,
-	.iotlb_sync	= mtk_iommu_iotlb_sync,
 	.iova_to_phys	= mtk_iommu_iova_to_phys,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

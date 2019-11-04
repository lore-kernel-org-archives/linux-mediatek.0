Return-Path: <SRS0=WUpV=Y4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EC3CA9ECF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2019 07:11:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 882402246D
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2019 07:11:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aRjxCVYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 882402246D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VIvwdguK/kfo0Pvl46t5qFhtCPiPC4oz5zDDr+N3rY=; b=aRjxCVYpE90xbW
	ORjgmoQ+ljy9dxbbU9I8So9HyCz452WNGPgeZ6kr4pbEWdvqTdRqh0gULQ2mVATuHJXKNGTNh7i3e
	5fi2SsslonJeWSNXALMaRZfRSNdCl0omG5hpAaoPgeFJpHoxfXTkP+EsQwDlpzPb1T/c6tNEyOn55
	cRCcUkG+zmUmghbRflQ2owd4T+xG+lx4aIMQa6Mf9Z7K6FTz2Xi0IaPFEHKEXHYtEOzYGGLE3F99T
	syFGQzQdBsYdtN0N/wSqrm6EVBPL3+myczEqq2sS6s1hZVLulFVflxhD01EmbBBItwR/hBAiXL003
	FM7gfnDbCHfmRcwN/7PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRWWp-0001EB-Sr; Mon, 04 Nov 2019 07:11:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRWWf-000120-5K; Mon, 04 Nov 2019 07:11:46 +0000
X-UUID: 0246eeb50aa849c0af53c40a3764d040-20191103
X-UUID: 0246eeb50aa849c0af53c40a3764d040-20191103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 484807222; Sun, 03 Nov 2019 23:11:36 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 3 Nov 2019 23:02:05 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 4 Nov 2019 15:02:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 4 Nov 2019 15:02:03 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will.deacon@arm.com>
Subject: [PATCH v5 5/7] iommu/mediatek: Move the tlb_sync into tlb_flush
Date: Mon, 4 Nov 2019 15:01:06 +0800
Message-ID: <1572850868-22315-6-git-send-email-yong.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1572850868-22315-1-git-send-email-yong.wu@mediatek.com>
References: <1572850868-22315-1-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191103_231145_203941_E2FFEDBF 
X-CRM114-Status: GOOD (  13.77  )
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
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com, edison.hsieh@mediatek.com,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Right now, the tlb_add_flush_nosync and tlb_sync always appear together.
we merge the two functions into one(also move the tlb_lock into the new
function). No functional change.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 45 ++++++++++-----------------------------------
 drivers/iommu/mtk_iommu.h |  1 -
 2 files changed, 10 insertions(+), 36 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 1d7254c..0e5f41f 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -173,12 +173,16 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
 	}
 }
 
-static void mtk_iommu_tlb_add_flush_nosync(unsigned long iova, size_t size,
+static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 					   size_t granule, void *cookie)
 {
 	struct mtk_iommu_data *data = cookie;
+	unsigned long flags;
+	int ret;
+	u32 tmp;
 
 	for_each_m4u(data) {
+		spin_lock_irqsave(&data->tlb_lock, flags);
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
 			       data->base + REG_MMU_INV_SEL);
 
@@ -187,21 +191,8 @@ static void mtk_iommu_tlb_add_flush_nosync(unsigned long iova, size_t size,
 			       data->base + REG_MMU_INVLD_END_A);
 		writel_relaxed(F_MMU_INV_RANGE,
 			       data->base + REG_MMU_INVALIDATE);
-		data->tlb_flush_active = true;
-	}
-}
-
-static void mtk_iommu_tlb_sync(void *cookie)
-{
-	struct mtk_iommu_data *data = cookie;
-	int ret;
-	u32 tmp;
-
-	for_each_m4u(data) {
-		/* Avoid timing out if there's nothing to wait for */
-		if (!data->tlb_flush_active)
-			return;
 
+		/* tlb sync */
 		ret = readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
 						tmp, tmp != 0, 10, 100000);
 		if (ret) {
@@ -211,22 +202,10 @@ static void mtk_iommu_tlb_sync(void *cookie)
 		}
 		/* Clear the CPE status */
 		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
-		data->tlb_flush_active = false;
+		spin_unlock_irqrestore(&data->tlb_lock, flags);
 	}
 }
 
-static void mtk_iommu_tlb_flush_walk(unsigned long iova, size_t size,
-				     size_t granule, void *cookie)
-{
-	struct mtk_iommu_data *data = cookie;
-	unsigned long flags;
-
-	spin_lock_irqsave(&data->tlb_lock, flags);
-	mtk_iommu_tlb_add_flush_nosync(iova, size, granule, cookie);
-	mtk_iommu_tlb_sync(cookie);
-	spin_unlock_irqrestore(&data->tlb_lock, flags);
-}
-
 static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
 					    unsigned long iova, size_t granule,
 					    void *cookie)
@@ -239,8 +218,8 @@ static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
 
 static const struct iommu_flush_ops mtk_iommu_flush_ops = {
 	.tlb_flush_all = mtk_iommu_tlb_flush_all,
-	.tlb_flush_walk = mtk_iommu_tlb_flush_walk,
-	.tlb_flush_leaf = mtk_iommu_tlb_flush_walk,
+	.tlb_flush_walk = mtk_iommu_tlb_flush_range_sync,
+	.tlb_flush_leaf = mtk_iommu_tlb_flush_range_sync,
 	.tlb_add_page = mtk_iommu_tlb_flush_page_nosync,
 };
 
@@ -455,16 +434,12 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
 {
 	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
 	size_t length = gather->end - gather->start;
-	unsigned long flags;
 
 	if (gather->start == ULONG_MAX)
 		return;
 
-	spin_lock_irqsave(&data->tlb_lock, flags);
-	mtk_iommu_tlb_add_flush_nosync(gather->start, length, gather->pgsize,
+	mtk_iommu_tlb_flush_range_sync(gather->start, length, gather->pgsize,
 				       data);
-	mtk_iommu_tlb_sync(data);
-	spin_unlock_irqrestore(&data->tlb_lock, flags);
 }
 
 static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 8cae22d..ea949a3 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -57,7 +57,6 @@ struct mtk_iommu_data {
 	struct mtk_iommu_domain		*m4u_dom;
 	struct iommu_group		*m4u_group;
 	bool                            enable_4GB;
-	bool				tlb_flush_active;
 	spinlock_t			tlb_lock; /* lock for tlb range flush */
 
 	struct iommu_device		iommu;
-- 
1.9.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

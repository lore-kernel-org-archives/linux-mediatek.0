From: Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v3 2/7] iommu/mediatek: Add pgtlock in the iotlb_sync
Date: Mon, 14 Oct 2019 14:38:16 +0800
Message-ID: <1571035101-4213-3-git-send-email-yong.wu@mediatek.com>
References: <1571035101-4213-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1571035101-4213-1-git-send-email-yong.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@google.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, yong.wu@mediatek.com, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com, cui.zhang@mediatek.com, chao.hao@mediatek.com, edison.hsieh@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

The commit 4d689b619445 ("iommu/io-pgtable-arm-v7s: Convert to IOMMU API
TLB sync") help move the tlb_sync of unmap from v7s into the iommu
framework. It helps add a new function "mtk_iommu_iotlb_sync", But it
lacked the dom->pgtlock, then it will cause the variable "tlb_flush_active"
may be changed unexpectedly, we could see this warning log randomly:

mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to
full flush

This patch adds dom->pgtlock in mtk_iommu_iotlb_sync to fix this issue.

Fixes: 4d689b619445 ("iommu/io-pgtable-arm-v7s: Convert to IOMMU API TLB sync")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 76b9388..5f594d6 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -453,7 +453,12 @@ static void mtk_iommu_flush_iotlb_all(struct iommu_domain *domain)
 static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
 				 struct iommu_iotlb_gather *gather)
 {
+	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
+	unsigned long flags;
+
+	spin_lock_irqsave(&dom->pgtlock, flags);
 	mtk_iommu_tlb_sync(mtk_iommu_get_m4u_data());
+	spin_unlock_irqrestore(&dom->pgtlock, flags);
 }
 
 static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
-- 
1.9.1

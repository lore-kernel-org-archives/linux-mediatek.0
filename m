From: Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v3 6/7] iommu/mediatek: Use writel for TLB range invalidation
Date: Mon, 14 Oct 2019 14:38:20 +0800
Message-ID: <1571035101-4213-7-git-send-email-yong.wu@mediatek.com>
References: <1571035101-4213-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1571035101-4213-1-git-send-email-yong.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@google.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, yong.wu@mediatek.com, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com, cui.zhang@mediatek.com, chao.hao@mediatek.com, edison.hsieh@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Use writel for the register F_MMU_INV_RANGE which is for triggering the
HW work. We expect all the setting(iova_start/iova_end...) have already
been finished before F_MMU_INV_RANGE.

Signed-off-by: Anan.Sun <anan.sun@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index dbbacc3..d285457 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -187,8 +187,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 		writel_relaxed(iova, data->base + REG_MMU_INVLD_START_A);
 		writel_relaxed(iova + size - 1,
 			       data->base + REG_MMU_INVLD_END_A);
-		writel_relaxed(F_MMU_INV_RANGE,
-			       data->base + REG_MMU_INVALIDATE);
+		writel(F_MMU_INV_RANGE, data->base + REG_MMU_INVALIDATE);
 
 		/* tlb sync */
 		ret = readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
-- 
1.9.1

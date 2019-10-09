From: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/4] iommu/mediatek: Move the tlb_sync into tlb_flush
Date: Wed, 9 Oct 2019 21:19:01 +0800
Message-ID: <1570627143-29441-2-git-send-email-yong.wu@mediatek.com>
References: <1570627143-29441-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <1570627143-29441-1-git-send-email-yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chao.hao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

The commit 4d689b619445 ("iommu/io-pgtable-arm-v7s: Convert to IOMMU API
TLB sync") help move the tlb_sync of unmap from v7s into the iommu
framework. It helps add a new function "mtk_iommu_iotlb_sync", But it
lacked the dom->pgtlock, then it will cause the variable
"tlb_flush_active" may be changed unexpectedly, we could see this warning
log randomly:

mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to
full flush

To fix this issue, we can add dom->pgtlock in the "mtk_iommu_iotlb_sync".

In addition, when checking this issue, we find that __arm_v7s_unmap call
io_pgtable_tlb_add_flush consecutively when it is supersection/largepage,
this also is potential unsafe for us. There is no tlb flush queue in the
MediaTek M4U HW. The HW always expect the tlb_flush/tlb_sync one by one.
If v7s don't always gurarantee the sequence, Thus, In this patch I move
the tlb_sync into tlb_flush(also rename the function deleting "_nosync").
and we don't care if it is leaf, rearrange the callback functions. Also,
the tlb flush/sync was already finished in v7s, then iotlb_sync is
unnecessary.

Fixes: 4d689b619445 ("iommu/io-pgtable-arm-v7s: Convert to IOMMU API TLB sync")
Signed-off-by: Chao Hao <chao.hao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/iommu/mtk_iommu.c | 63 +++++++++++++----------------------------------
 drivers/iommu/mtk_iommu.h |  1 -
 2 files changed, 17 insertions(+), 47 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 76b9388..24a13a6 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -173,11 +173,12 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
 	}
 }
 
-static void mtk_iommu_tlb_add_flush_nosync(unsigned long iova, size_t size,
-					   size_t granule, bool leaf,
-					   void *cookie)
+static void mtk_iommu_tlb_add_flush(unsigned long iova, size_t size,
+				    size_t granule, void *cookie)
 {
 	struct mtk_iommu_data *data = cookie;
+	int ret;
+	u32 tmp;
 
 	for_each_m4u(data) {
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
@@ -188,21 +189,12 @@ static void mtk_iommu_tlb_add_flush_nosync(unsigned long iova, size_t size,
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
 
+		/*
+		 * There is no tlb flush queue in the HW, the HW always expect
+		 * tlb_flush and tlb_sync in pair strictly. Here tlb_sync always
+		 * follows tlb_flush to avoid break the sequence.
+		 */
 		ret = readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
 						tmp, tmp != 0, 10, 100000);
 		if (ret) {
@@ -212,36 +204,21 @@ static void mtk_iommu_tlb_sync(void *cookie)
 		}
 		/* Clear the CPE status */
 		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
-		data->tlb_flush_active = false;
 	}
 }
 
-static void mtk_iommu_tlb_flush_walk(unsigned long iova, size_t size,
-				     size_t granule, void *cookie)
-{
-	mtk_iommu_tlb_add_flush_nosync(iova, size, granule, false, cookie);
-	mtk_iommu_tlb_sync(cookie);
-}
-
-static void mtk_iommu_tlb_flush_leaf(unsigned long iova, size_t size,
-				     size_t granule, void *cookie)
+static void mtk_iommu_tlb_flush_page(struct iommu_iotlb_gather *gather,
+				     unsigned long iova, size_t granule,
+				     void *cookie)
 {
-	mtk_iommu_tlb_add_flush_nosync(iova, size, granule, true, cookie);
-	mtk_iommu_tlb_sync(cookie);
-}
-
-static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
-					    unsigned long iova, size_t granule,
-					    void *cookie)
-{
-	mtk_iommu_tlb_add_flush_nosync(iova, granule, granule, true, cookie);
+	mtk_iommu_tlb_add_flush(iova, granule, granule, cookie);
 }
 
 static const struct iommu_flush_ops mtk_iommu_flush_ops = {
 	.tlb_flush_all = mtk_iommu_tlb_flush_all,
-	.tlb_flush_walk = mtk_iommu_tlb_flush_walk,
-	.tlb_flush_leaf = mtk_iommu_tlb_flush_leaf,
-	.tlb_add_page = mtk_iommu_tlb_flush_page_nosync,
+	.tlb_flush_walk = mtk_iommu_tlb_add_flush,
+	.tlb_flush_leaf = mtk_iommu_tlb_add_flush,
+	.tlb_add_page = mtk_iommu_tlb_flush_page,
 };
 
 static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
@@ -450,12 +427,6 @@ static void mtk_iommu_flush_iotlb_all(struct iommu_domain *domain)
 	mtk_iommu_tlb_flush_all(mtk_iommu_get_m4u_data());
 }
 
-static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
-				 struct iommu_iotlb_gather *gather)
-{
-	mtk_iommu_tlb_sync(mtk_iommu_get_m4u_data());
-}
-
 static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
 					  dma_addr_t iova)
 {
@@ -558,7 +529,7 @@ static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	.map		= mtk_iommu_map,
 	.unmap		= mtk_iommu_unmap,
 	.flush_iotlb_all = mtk_iommu_flush_iotlb_all,
-	.iotlb_sync	= mtk_iommu_iotlb_sync,
+	/* No iotlb_sync here since the tlb_sync always follows the tlb_flush */
 	.iova_to_phys	= mtk_iommu_iova_to_phys,
 	.add_device	= mtk_iommu_add_device,
 	.remove_device	= mtk_iommu_remove_device,
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index fc0f16e..24712f5 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -57,7 +57,6 @@ struct mtk_iommu_data {
 	struct mtk_iommu_domain		*m4u_dom;
 	struct iommu_group		*m4u_group;
 	bool                            enable_4GB;
-	bool				tlb_flush_active;
 
 	struct iommu_device		iommu;
 	const struct mtk_iommu_plat_data *plat_data;
-- 
1.9.1

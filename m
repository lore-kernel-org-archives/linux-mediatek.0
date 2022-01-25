Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16659C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 09:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sa3jRIy1AIHSX28KhqIFviaiYxdKxpEzvO2u+/QsJoY=; b=k31zYoy9KJNFSl
	QjpUfXkCwOMGK8Kr4dD/MpBvuU1beyi6CHSOJESMYQglyjSVgta8gzHZ1XAZHDU8bPOUiUeMO1UUY
	x8hsIUd1CDTMjRWz2GQxSbRFiBNGBYsbsJDckdE3VkxpRpaTpE+y0bCT0T5w/Ax7z8FHUIMbZeEpw
	Ue8z9zltPeRJTMF4jj5qAxMx5Pvh7IeostzWGx3E8E0G9HfMjbj0Axf/HdcB3GbWy0Cxpx7d0JVsf
	cv+GoE7lZPv1KGEUZjNeD3CdcW0RtWvrwdgqnUEO6fdeMnDFbAcWtYjNLOQcTln3FLQs4uNh3Gz9L
	ZJpc2WPnPqZGiZqfagTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCHt7-0072aV-2J; Tue, 25 Jan 2022 09:13:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCHiI-006xFw-2a; Tue, 25 Jan 2022 09:02:07 +0000
X-UUID: e3594f3d72104c5db76450c336b84f14-20220125
X-UUID: e3594f3d72104c5db76450c336b84f14-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1911658363; Tue, 25 Jan 2022 02:01:56 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 01:00:07 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 25 Jan 2022 17:00:05 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 17:00:04 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, <yen-chang.chen@mediatek.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
 <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, 
 <chengci.xu@mediatek.com>
Subject: [PATCH v4 24/35] iommu/mediatek: Only adjust code about register base
Date: Tue, 25 Jan 2022 16:56:23 +0800
Message-ID: <20220125085634.17972-25-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220125085634.17972-1-yong.wu@mediatek.com>
References: <20220125085634.17972-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_010206_212699_121EF65B 
X-CRM114-Status: GOOD (  17.76  )
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

No functional change. Use "base" instead of the data->base. This is
avoid to touch too many lines in the next patches.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 51 +++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 68de89eff9db..fdc14db5b4c0 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -227,12 +227,12 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
 
 static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
 {
+	void __iomem *base = data->base;
 	unsigned long flags;
 
 	spin_lock_irqsave(&data->tlb_lock, flags);
-	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
-		       data->base + data->plat_data->inv_sel_reg);
-	writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
+	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0, base + data->plat_data->inv_sel_reg);
+	writel_relaxed(F_ALL_INVLD, base + REG_MMU_INVALIDATE);
 	wmb(); /* Make sure the tlb flush all done */
 	spin_unlock_irqrestore(&data->tlb_lock, flags);
 }
@@ -243,6 +243,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 	struct list_head *head = data->hw_list;
 	bool check_pm_status;
 	unsigned long flags;
+	void __iomem *base;
 	int ret;
 	u32 tmp;
 
@@ -269,23 +270,23 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 				continue;
 		}
 
+		base = data->base;
+
 		spin_lock_irqsave(&data->tlb_lock, flags);
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
-			       data->base + data->plat_data->inv_sel_reg);
+			       base + data->plat_data->inv_sel_reg);
 
-		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova),
-			       data->base + REG_MMU_INVLD_START_A);
+		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova), base + REG_MMU_INVLD_START_A);
 		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova + size - 1),
-			       data->base + REG_MMU_INVLD_END_A);
-		writel_relaxed(F_MMU_INV_RANGE,
-			       data->base + REG_MMU_INVALIDATE);
+			       base + REG_MMU_INVLD_END_A);
+		writel_relaxed(F_MMU_INV_RANGE, base + REG_MMU_INVALIDATE);
 
 		/* tlb sync */
-		ret = readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
+		ret = readl_poll_timeout_atomic(base + REG_MMU_CPE_DONE,
 						tmp, tmp != 0, 10, 1000);
 
 		/* Clear the CPE status */
-		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
+		writel_relaxed(0, base + REG_MMU_CPE_DONE);
 		spin_unlock_irqrestore(&data->tlb_lock, flags);
 
 		if (ret) {
@@ -305,23 +306,25 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	struct mtk_iommu_domain *dom = data->m4u_dom;
 	unsigned int fault_larb = MTK_INVALID_LARBID, fault_port = 0, sub_comm = 0;
 	u32 int_state, regval, va34_32, pa34_32;
+	const struct mtk_iommu_plat_data *plat_data = data->plat_data;
+	void __iomem *base = data->base;
 	u64 fault_iova, fault_pa;
 	bool layer, write;
 
 	/* Read error info from registers */
-	int_state = readl_relaxed(data->base + REG_MMU_FAULT_ST1);
+	int_state = readl_relaxed(base + REG_MMU_FAULT_ST1);
 	if (int_state & F_REG_MMU0_FAULT_MASK) {
-		regval = readl_relaxed(data->base + REG_MMU0_INT_ID);
-		fault_iova = readl_relaxed(data->base + REG_MMU0_FAULT_VA);
-		fault_pa = readl_relaxed(data->base + REG_MMU0_INVLD_PA);
+		regval = readl_relaxed(base + REG_MMU0_INT_ID);
+		fault_iova = readl_relaxed(base + REG_MMU0_FAULT_VA);
+		fault_pa = readl_relaxed(base + REG_MMU0_INVLD_PA);
 	} else {
-		regval = readl_relaxed(data->base + REG_MMU1_INT_ID);
-		fault_iova = readl_relaxed(data->base + REG_MMU1_FAULT_VA);
-		fault_pa = readl_relaxed(data->base + REG_MMU1_INVLD_PA);
+		regval = readl_relaxed(base + REG_MMU1_INT_ID);
+		fault_iova = readl_relaxed(base + REG_MMU1_FAULT_VA);
+		fault_pa = readl_relaxed(base + REG_MMU1_INVLD_PA);
 	}
 	layer = fault_iova & F_MMU_FAULT_VA_LAYER_BIT;
 	write = fault_iova & F_MMU_FAULT_VA_WRITE_BIT;
-	if (MTK_IOMMU_HAS_FLAG(data->plat_data, IOVA_34_EN)) {
+	if (MTK_IOMMU_HAS_FLAG(plat_data, IOVA_34_EN)) {
 		va34_32 = FIELD_GET(F_MMU_INVAL_VA_34_32_MASK, fault_iova);
 		fault_iova = fault_iova & F_MMU_INVAL_VA_31_12_MASK;
 		fault_iova |= (u64)va34_32 << 32;
@@ -329,12 +332,12 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	pa34_32 = FIELD_GET(F_MMU_INVAL_PA_34_32_MASK, fault_iova);
 	fault_pa |= (u64)pa34_32 << 32;
 
-	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+	if (MTK_IOMMU_IS_TYPE(plat_data, MTK_IOMMU_TYPE_MM)) {
 		fault_port = F_MMU_INT_ID_PORT_ID(regval);
-		if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_2BITS)) {
+		if (MTK_IOMMU_HAS_FLAG(plat_data, HAS_SUB_COMM_2BITS)) {
 			fault_larb = F_MMU_INT_ID_COMM_ID(regval);
 			sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
-		} else if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_3BITS)) {
+		} else if (MTK_IOMMU_HAS_FLAG(plat_data, HAS_SUB_COMM_3BITS)) {
 			fault_larb = F_MMU_INT_ID_COMM_ID_EXT(regval);
 			sub_comm = F_MMU_INT_ID_SUB_COMM_ID_EXT(regval);
 		} else {
@@ -353,9 +356,9 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	}
 
 	/* Interrupt clear */
-	regval = readl_relaxed(data->base + REG_MMU_INT_CONTROL0);
+	regval = readl_relaxed(base + REG_MMU_INT_CONTROL0);
 	regval |= F_INT_CLR_BIT;
-	writel_relaxed(regval, data->base + REG_MMU_INT_CONTROL0);
+	writel_relaxed(regval, base + REG_MMU_INT_CONTROL0);
 
 	mtk_iommu_tlb_flush_all(data);
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

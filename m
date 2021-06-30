Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1FEC11F67
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:53:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1F8361D38
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1F8361D38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eR5VbJUHVvl5bcMhmsrHzdAYIhXh7wHQo/+Lv/vj8B8=; b=FdclXra4V/6PVp
	QZdBJ2MFLdvtW2lPGljB1QiJ6+oi2AsLbJfke/kGkIV1AObl55R9tvOGxHHkNYcKCAtsivoMtks4O
	NI3IF9MsRDrwTcynNp9JyLMQggGGuGD5YjnHB6BXx62TYx8javchKGYYjj8sMvP8RS02LTVnfMhN9
	SFZ21nsy4G3LVwmAwKk7THkiYnOGy+4lwVI9FOqeFDsKIQRUP4ALp/g39VXboO3/1UKQ/I+yxW/Kv
	rbTuIIXOBioP2do+oYmshgL77HxGEnMQwvV7mAykJ2IG5EVZdN072CFJkN/tRGXKheHG17VkSbdB9
	1Q+P4khT0VH4QdtKqgRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyQLR-00CZhE-TG; Wed, 30 Jun 2021 02:52:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyQEI-00CWWp-Ak; Wed, 30 Jun 2021 02:45:36 +0000
X-UUID: 421527378c1844319116f834e276eb23-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Zco36qK8VmicNUGfhXUYLJZiQKGgw4faoiq2P4jg9Io=; 
 b=b2AGyOXsBwwAZbDT98lg013y7RWKIFTyv8FFufXeNibGrzSd8cCrHhbrh4IPtBJkZc6wP0/rjedCwAifnTL4IgiAhWpg0sfs0eF3lrgLV6896pIv1TBhXXyyDmb7QGNvS94BWr/lAniMmuAUHC6QinAVNBdpfO5GHSNsUKSCw68=;
X-UUID: 421527378c1844319116f834e276eb23-20210629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 934873454; Tue, 29 Jun 2021 19:45:28 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 19:37:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 10:37:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 10:37:24 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Evan Green
 <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>
Subject: [PATCH 16/24] iommu/mediatek: Only adjust code about register base
Date: Wed, 30 Jun 2021 10:34:56 +0800
Message-ID: <20210630023504.18177-17-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630023504.18177-1-yong.wu@mediatek.com>
References: <20210630023504.18177-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_194534_448096_4D4AFA24 
X-CRM114-Status: GOOD (  16.72  )
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

This patch have no functional change. Use "base" instead of the
data->base. This is avoid to touch too many lines in the next patches.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 43 ++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 5e046587eef4..1072a10e36ce 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -240,6 +240,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 {
 	struct list_head *head = data->hw_list;
 	bool has_pm = !!data->dev->pm_domain;
+	void __iomem *base = data->base;
 	unsigned long flags;
 	int ret;
 	u32 tmp;
@@ -252,17 +253,15 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 
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
 		if (ret) {
 			dev_warn(data->dev,
@@ -270,7 +269,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 			mtk_iommu_tlb_flush_all(data);
 		}
 		/* Clear the CPE status */
-		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
+		writel_relaxed(0, base + REG_MMU_CPE_DONE);
 		spin_unlock_irqrestore(&data->tlb_lock, flags);
 
 		if (has_pm)
@@ -284,23 +283,25 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	struct mtk_iommu_domain *dom = data->m4u_dom;
 	unsigned int fault_larb = 0, fault_port = 0, sub_comm = 0;
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
@@ -308,12 +309,12 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
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
@@ -332,9 +333,9 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
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

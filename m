Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877A2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 14:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4RplzIzIsYK0xhPzQ7KKQCDubqXgt9QBgKIcVO0OX0=; b=TPBXopytbNhNtb
	mgX4IOkGbcadKVuQs3XL+O1SjGYtW9AU1J8AEieuCdFgguOW1hnLP5mVQvB9xce6hCpZZSKkypWPm
	90lN2+fJBoP3AoexM6b4m8JCCero8uocYBbQsJvnUOter3YwXByS1d1Ck1wHWrWXZdIPIlpFoFw5D
	CIJinQ2MIHQQO6DZR3n5Y281bKc7fDluHpPkeoqfSFE83UFqbwg8TGZWhEBZ2OyOs577LmrmBZQjs
	Qd4rlU78g/TbfbXoccUmltsrhX2ooULL95AQuV9ouIaZq6TI+ycUeXjvJOcwTHf6d2nGYDMWiEKNc
	ozVAG9K9RKQMcIpON0dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqbdM-008KIq-U5; Mon, 16 May 2022 14:23:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqbci-008JtB-To; Mon, 16 May 2022 14:23:04 +0000
X-UUID: a356c8fca1c44077b6afbf7340e7714f-20220516
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:fdf89b68-0bd8-4c95-ad50-c80b48df5e97, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:b443c4b9-9f46-4d76-a271-164488ed79f1,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: a356c8fca1c44077b6afbf7340e7714f-20220516
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yf.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 229033810; Mon, 16 May 2022 07:22:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 May 2022 07:22:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 16 May 2022 22:22:50 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 16 May 2022 22:22:49 +0800
From: <yf.wang@mediatek.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Georgi Djakov" <quic_c_gdjako@quicinc.com>, "Isaac J. Manjarres"
 <isaacm@codeaurora.org>, Ning Li <ning.li@mediatek.com>, Yunfei Wang
 <yf.wang@mediatek.com>, Sven Peter <sven@svenpeter.dev>, "moderated list:ARM
 SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, "open list:IOMMU
 DRIVERS" <iommu@lists.linux-foundation.org>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Yong Wu
 <Yong.Wu@mediatek.com>
Subject: [PATCH v5 1/2] iommu/io-pgtable-arm-v7s: Add a quirk to allow pgtable
 PA up to 35bit
Date: Mon, 16 May 2022 22:16:06 +0800
Message-ID: <20220516141608.11709-2-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220516141608.11709-1-yf.wang@mediatek.com>
References: <20220516141608.11709-1-yf.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_072301_049232_5D94F924 
X-CRM114-Status: GOOD (  21.55  )
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

From: Yunfei Wang <yf.wang@mediatek.com>

The calling to kmem_cache_alloc for level 2 pgtable allocation may run
in atomic context, and it fails sometimes when DMA32 zone runs out of
memory.

Since Mediatek IOMMU hardware support at most 35bit PA in pgtable,
so add a quirk to allow the PA of pgtables support up to bit35.

Signed-off-by: Ning Li <ning.li@mediatek.com>
Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 56 ++++++++++++++++++++++--------
 include/linux/io-pgtable.h         | 15 +++++---
 2 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index be066c1503d3..668500798fb9 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -149,6 +149,10 @@
 #define ARM_V7S_TTBR_IRGN_ATTR(attr)					\
 	((((attr) & 0x1) << 6) | (((attr) & 0x2) >> 1))
 
+/* Mediatek extend ttbr bits[2:0] for PA bits[34:32] */
+#define ARM_V7S_TTBR_35BIT_PA(ttbr, pa)					\
+	((ttbr & ((u32)(~0U << 3))) | ((pa & GENMASK_ULL(34, 32)) >> 32))
+
 #ifdef CONFIG_ZONE_DMA32
 #define ARM_V7S_TABLE_GFP_DMA GFP_DMA32
 #define ARM_V7S_TABLE_SLAB_FLAGS SLAB_CACHE_DMA32
@@ -182,14 +186,8 @@ static bool arm_v7s_is_mtk_enabled(struct io_pgtable_cfg *cfg)
 		(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT);
 }
 
-static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
-				    struct io_pgtable_cfg *cfg)
+static arm_v7s_iopte to_iopte_mtk(phys_addr_t paddr, arm_v7s_iopte pte)
 {
-	arm_v7s_iopte pte = paddr & ARM_V7S_LVL_MASK(lvl);
-
-	if (!arm_v7s_is_mtk_enabled(cfg))
-		return pte;
-
 	if (paddr & BIT_ULL(32))
 		pte |= ARM_V7S_ATTR_MTK_PA_BIT32;
 	if (paddr & BIT_ULL(33))
@@ -199,6 +197,17 @@ static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
 	return pte;
 }
 
+static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
+				    struct io_pgtable_cfg *cfg)
+{
+	arm_v7s_iopte pte = paddr & ARM_V7S_LVL_MASK(lvl);
+
+	if (!arm_v7s_is_mtk_enabled(cfg))
+		return pte;
+
+	return to_iopte_mtk(paddr, pte);
+}
+
 static phys_addr_t iopte_to_paddr(arm_v7s_iopte pte, int lvl,
 				  struct io_pgtable_cfg *cfg)
 {
@@ -234,6 +243,7 @@ static arm_v7s_iopte *iopte_deref(arm_v7s_iopte pte, int lvl,
 static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
 				   struct arm_v7s_io_pgtable *data)
 {
+	gfp_t gfp_l1 = __GFP_ZERO | ARM_V7S_TABLE_GFP_DMA;
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	struct device *dev = cfg->iommu_dev;
 	phys_addr_t phys;
@@ -241,9 +251,11 @@ static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
 	size_t size = ARM_V7S_TABLE_SIZE(lvl, cfg);
 	void *table = NULL;
 
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
+		gfp_l1 = __GFP_ZERO;
+
 	if (lvl == 1)
-		table = (void *)__get_free_pages(
-			__GFP_ZERO | ARM_V7S_TABLE_GFP_DMA, get_order(size));
+		table = (void *)__get_free_pages(gfp_l1, get_order(size));
 	else if (lvl == 2)
 		table = kmem_cache_zalloc(data->l2_tables, gfp);
 
@@ -251,7 +263,8 @@ static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
 		return NULL;
 
 	phys = virt_to_phys(table);
-	if (phys != (arm_v7s_iopte)phys) {
+	if (phys != (arm_v7s_iopte)phys &&
+	    !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)) {
 		/* Doesn't fit in PTE */
 		dev_err(dev, "Page table does not fit in PTE: %pa", &phys);
 		goto out_free;
@@ -457,9 +470,14 @@ static arm_v7s_iopte arm_v7s_install_table(arm_v7s_iopte *table,
 					   arm_v7s_iopte curr,
 					   struct io_pgtable_cfg *cfg)
 {
+	phys_addr_t phys = virt_to_phys(table);
 	arm_v7s_iopte old, new;
 
-	new = virt_to_phys(table) | ARM_V7S_PTE_TYPE_TABLE;
+	new = phys | ARM_V7S_PTE_TYPE_TABLE;
+
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
+		new = to_iopte_mtk(phys, new);
+
 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS)
 		new |= ARM_V7S_ATTR_NS_TABLE;
 
@@ -778,7 +796,9 @@ static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
 static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 						void *cookie)
 {
+	slab_flags_t slab_flag = ARM_V7S_TABLE_SLAB_FLAGS;
 	struct arm_v7s_io_pgtable *data;
+	phys_addr_t paddr;
 
 	if (cfg->ias > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
 		return NULL;
@@ -788,7 +808,8 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_NO_PERMS |
-			    IO_PGTABLE_QUIRK_ARM_MTK_EXT))
+			    IO_PGTABLE_QUIRK_ARM_MTK_EXT |
+			    IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT))
 		return NULL;
 
 	/* If ARM_MTK_4GB is enabled, the NO_PERMS is also expected. */
@@ -801,10 +822,12 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 		return NULL;
 
 	spin_lock_init(&data->split_lock);
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
+		slab_flag = 0;
 	data->l2_tables = kmem_cache_create("io-pgtable_armv7s_l2",
 					    ARM_V7S_TABLE_SIZE(2, cfg),
 					    ARM_V7S_TABLE_SIZE(2, cfg),
-					    ARM_V7S_TABLE_SLAB_FLAGS, NULL);
+					    slab_flag, NULL);
 	if (!data->l2_tables)
 		goto out_free_data;
 
@@ -850,12 +873,17 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 	wmb();
 
 	/* TTBR */
-	cfg->arm_v7s_cfg.ttbr = virt_to_phys(data->pgd) | ARM_V7S_TTBR_S |
+	paddr = virt_to_phys(data->pgd);
+	cfg->arm_v7s_cfg.ttbr = paddr | ARM_V7S_TTBR_S |
 				(cfg->coherent_walk ? (ARM_V7S_TTBR_NOS |
 				 ARM_V7S_TTBR_IRGN_ATTR(ARM_V7S_RGN_WBWA) |
 				 ARM_V7S_TTBR_ORGN_ATTR(ARM_V7S_RGN_WBWA)) :
 				(ARM_V7S_TTBR_IRGN_ATTR(ARM_V7S_RGN_NC) |
 				 ARM_V7S_TTBR_ORGN_ATTR(ARM_V7S_RGN_NC)));
+
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT)
+		cfg->arm_v7s_cfg.ttbr =
+			ARM_V7S_TTBR_35BIT_PA(cfg->arm_v7s_cfg.ttbr, paddr);
 	return &data->iop;
 
 out_free_data:
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 86af6f0a00a2..7ed15ad4710c 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -74,17 +74,22 @@ struct io_pgtable_cfg {
 	 *	to support up to 35 bits PA where the bit32, bit33 and bit34 are
 	 *	encoded in the bit9, bit4 and bit5 of the PTE respectively.
 	 *
+	 * IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT: (ARM v7s format) MediaTek IOMMUs
+	 *	extend the translation table support up to 35 bits PA, the
+	 *	encoding format is same with IO_PGTABLE_QUIRK_ARM_MTK_EXT.
+	 *
 	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
 	 *	for use in the upper half of a split address space.
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the outer-cacheability
 	 *	attributes set in the TCR for a non-coherent page-table walker.
 	 */
-	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
-	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
-	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT	BIT(3)
-	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
-	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA	BIT(6)
+	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
+	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
+	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT		BIT(3)
+	#define IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT	BIT(4)
+	#define IO_PGTABLE_QUIRK_ARM_TTBR1		BIT(5)
+	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

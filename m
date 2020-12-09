Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70810C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:15:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 146C823B87
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 146C823B87
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rx1svvZhAkTc/iF85394wDKP7mJ4F2bRX7Mxlyyr3VU=; b=aKw/pjvZUjQdVG2JysMbpXvu2
	vz4OPE4XjehiSed33pxZ0PygxND45jKgXAaMq/ScZPjQwT0upWpnYwKNFr0dWQRUKXlry9O1BMM6t
	IdXWmDprLc4flz0eXgRMQSwSyC/1XOYv+HktaHYsZCNbHeyyTFeNFt+GMVFOVph8oGZW9EFjdjjZo
	65UZm74isgZ0w0MvVkTE+p+1Ex768apRkIHq3A5t1GyJGVoq6ABljWdhU2J5hmcS6Rp4fmXmrJOcy
	sW9ebK9E5iElBy9cvgXWd0rRJCu1hNvv7FZMFVVUNArFfV5UB7Bhm+dfT837xftxnG8CIuecQkjV7
	ywzYeRDmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmudM-0000Cv-G9; Wed, 09 Dec 2020 08:15:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmuax-00072X-FM; Wed, 09 Dec 2020 08:13:09 +0000
X-UUID: 309dd5b7b5664ced83243444974c6cca-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bChCapQrepWENf/jEi5C8mPUuTcOB4vu21oMBQ0tNjA=; 
 b=ST6Nzx6LHCu2bfmWBS4w0FxnjxDqi2OMfFhIAPf1PH5MIFFIZiTWuLZo800Ycq+jCyJ0tYPlSdRRZoTcdrMTiReCM7DKRZnyRWlDE5H70JDEzBEyckPF66oM0w5gv6JNRIWiyaACCunKlPIEA+UL7+9jZqSSECxX3lrivWeOjtw=;
X-UUID: 309dd5b7b5664ced83243444974c6cca-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1760491219; Wed, 09 Dec 2020 00:13:01 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 00:03:09 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:03:07 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 16:03:06 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v5 11/27] iommu/io-pgtable-arm-v7s: Add cfg as a param in some
 macros
Date: Wed, 9 Dec 2020 16:00:46 +0800
Message-ID: <20201209080102.26626-12-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201209080102.26626-1-yong.wu@mediatek.com>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_031307_996100_DEB25E64 
X-CRM114-Status: GOOD (  16.76  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add "cfg" as a parameter for some macros. This is a preparing patch for
mediatek extend the lvl1 pgtable. No functional change.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Will Deacon <will@kernel.org>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 36 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 58cc201c10a3..0b3c5b904ddc 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -47,21 +47,21 @@
  * and 12 bits in a page.
  */
 #define ARM_V7S_ADDR_BITS		32
-#define _ARM_V7S_LVL_BITS(lvl)		((lvl) == 1 ? 12 : 8)
+#define _ARM_V7S_LVL_BITS(lvl, cfg)	((lvl) == 1 ? 12 : 8)
 #define ARM_V7S_LVL_SHIFT(lvl)		((lvl) == 1 ? 20 : 12)
 #define ARM_V7S_TABLE_SHIFT		10
 
-#define ARM_V7S_PTES_PER_LVL(lvl)	(1 << _ARM_V7S_LVL_BITS(lvl))
-#define ARM_V7S_TABLE_SIZE(lvl)						\
-	(ARM_V7S_PTES_PER_LVL(lvl) * sizeof(arm_v7s_iopte))
+#define ARM_V7S_PTES_PER_LVL(lvl, cfg)	(1 << _ARM_V7S_LVL_BITS(lvl, cfg))
+#define ARM_V7S_TABLE_SIZE(lvl, cfg)						\
+	(ARM_V7S_PTES_PER_LVL(lvl, cfg) * sizeof(arm_v7s_iopte))
 
 #define ARM_V7S_BLOCK_SIZE(lvl)		(1UL << ARM_V7S_LVL_SHIFT(lvl))
 #define ARM_V7S_LVL_MASK(lvl)		((u32)(~0U << ARM_V7S_LVL_SHIFT(lvl)))
 #define ARM_V7S_TABLE_MASK		((u32)(~0U << ARM_V7S_TABLE_SHIFT))
-#define _ARM_V7S_IDX_MASK(lvl)		(ARM_V7S_PTES_PER_LVL(lvl) - 1)
-#define ARM_V7S_LVL_IDX(addr, lvl)	({				\
+#define _ARM_V7S_IDX_MASK(lvl, cfg)	(ARM_V7S_PTES_PER_LVL(lvl, cfg) - 1)
+#define ARM_V7S_LVL_IDX(addr, lvl, cfg)	({				\
 	int _l = lvl;							\
-	((u32)(addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l); \
+	((u32)(addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l, cfg); \
 })
 
 /*
@@ -237,7 +237,7 @@ static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
 	struct device *dev = cfg->iommu_dev;
 	phys_addr_t phys;
 	dma_addr_t dma;
-	size_t size = ARM_V7S_TABLE_SIZE(lvl);
+	size_t size = ARM_V7S_TABLE_SIZE(lvl, cfg);
 	void *table = NULL;
 
 	if (lvl == 1)
@@ -283,7 +283,7 @@ static void __arm_v7s_free_table(void *table, int lvl,
 {
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	struct device *dev = cfg->iommu_dev;
-	size_t size = ARM_V7S_TABLE_SIZE(lvl);
+	size_t size = ARM_V7S_TABLE_SIZE(lvl, cfg);
 
 	if (!cfg->coherent_walk)
 		dma_unmap_single(dev, __arm_v7s_dma_addr(table), size,
@@ -427,7 +427,7 @@ static int arm_v7s_init_pte(struct arm_v7s_io_pgtable *data,
 			arm_v7s_iopte *tblp;
 			size_t sz = ARM_V7S_BLOCK_SIZE(lvl);
 
-			tblp = ptep - ARM_V7S_LVL_IDX(iova, lvl);
+			tblp = ptep - ARM_V7S_LVL_IDX(iova, lvl, cfg);
 			if (WARN_ON(__arm_v7s_unmap(data, NULL, iova + i * sz,
 						    sz, lvl, tblp) != sz))
 				return -EINVAL;
@@ -480,7 +480,7 @@ static int __arm_v7s_map(struct arm_v7s_io_pgtable *data, unsigned long iova,
 	int num_entries = size >> ARM_V7S_LVL_SHIFT(lvl);
 
 	/* Find our entry at the current level */
-	ptep += ARM_V7S_LVL_IDX(iova, lvl);
+	ptep += ARM_V7S_LVL_IDX(iova, lvl, cfg);
 
 	/* If we can install a leaf entry at this level, then do so */
 	if (num_entries)
@@ -553,7 +553,7 @@ static void arm_v7s_free_pgtable(struct io_pgtable *iop)
 	struct arm_v7s_io_pgtable *data = io_pgtable_to_data(iop);
 	int i;
 
-	for (i = 0; i < ARM_V7S_PTES_PER_LVL(1); i++) {
+	for (i = 0; i < ARM_V7S_PTES_PER_LVL(1, &data->iop.cfg); i++) {
 		arm_v7s_iopte pte = data->pgd[i];
 
 		if (ARM_V7S_PTE_IS_TABLE(pte, 1))
@@ -605,9 +605,9 @@ static size_t arm_v7s_split_blk_unmap(struct arm_v7s_io_pgtable *data,
 	if (!tablep)
 		return 0; /* Bytes unmapped */
 
-	num_ptes = ARM_V7S_PTES_PER_LVL(2);
+	num_ptes = ARM_V7S_PTES_PER_LVL(2, cfg);
 	num_entries = size >> ARM_V7S_LVL_SHIFT(2);
-	unmap_idx = ARM_V7S_LVL_IDX(iova, 2);
+	unmap_idx = ARM_V7S_LVL_IDX(iova, 2, cfg);
 
 	pte = arm_v7s_prot_to_pte(arm_v7s_pte_to_prot(blk_pte, 1), 2, cfg);
 	if (num_entries > 1)
@@ -649,7 +649,7 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
 	if (WARN_ON(lvl > 2))
 		return 0;
 
-	idx = ARM_V7S_LVL_IDX(iova, lvl);
+	idx = ARM_V7S_LVL_IDX(iova, lvl, &iop->cfg);
 	ptep += idx;
 	do {
 		pte[i] = READ_ONCE(ptep[i]);
@@ -735,7 +735,7 @@ static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
 	u32 mask;
 
 	do {
-		ptep += ARM_V7S_LVL_IDX(iova, ++lvl);
+		ptep += ARM_V7S_LVL_IDX(iova, ++lvl, &data->iop.cfg);
 		pte = READ_ONCE(*ptep);
 		ptep = iopte_deref(pte, lvl, data);
 	} while (ARM_V7S_PTE_IS_TABLE(pte, lvl));
@@ -778,8 +778,8 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 
 	spin_lock_init(&data->split_lock);
 	data->l2_tables = kmem_cache_create("io-pgtable_armv7s_l2",
-					    ARM_V7S_TABLE_SIZE(2),
-					    ARM_V7S_TABLE_SIZE(2),
+					    ARM_V7S_TABLE_SIZE(2, cfg),
+					    ARM_V7S_TABLE_SIZE(2, cfg),
 					    ARM_V7S_TABLE_SLAB_FLAGS, NULL);
 	if (!data->l2_tables)
 		goto out_free_data;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

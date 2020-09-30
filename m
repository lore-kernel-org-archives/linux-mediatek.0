Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44216C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:23:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF09A2076E
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vflTKZga";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZuFq2wdr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF09A2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DfO3smeT3lAl3O8ZMdeQ6iPuu45eovNlbm/oF7P1DSg=; b=vflTKZgaI1u/EcpxZpbna6yJD
	OXzt1gz/ab1KMeXb83u9sP9HWK4uDXzP72LdlbB+9jdHkFxsreOAg0XoK/CO5OGLMNL0B9TcQFXqP
	4LjkOr5F8aa+T+caV/9KXO1dX5Q+7tgJ3Cgqdcc8CvU4zYsDoXdc3TnFZFYPvoXTpTK6vIPXoFa0y
	6YAxe4FN2jcZEipRdMDzSnZ2N2n6SkkkvLDUj37wQOJw4riUnRgEZ70DD+R8oQ16Pj8921ZfyExg7
	OxfarN1Pwu8SxJxJRCPGKEnMR0Vq1yWqHm9HOo7BWbaTs/kyAnY8XS1+5or4JBdgTFQvdQ20yrvUJ
	vgOxWuEeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWSQ-0004Cw-1G; Wed, 30 Sep 2020 07:23:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWNt-0002Fn-Me; Wed, 30 Sep 2020 07:18:54 +0000
X-UUID: 07c50f710d134415a07ea1d5e465d176-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gYNELGnpS6IhFJpjNhZ/I71ScZxIoDmwzmZcryuz/KE=; 
 b=ZuFq2wdrWp1fRzfdp8/D0wFvyEurZKDHAeAQTHCWIogRU89Z5MjH/Z26nG+HfQXe5Mz6FF/qZWudSyD9Gxq59cjF47Vo9HRrYNvfPJWdzoMCd/G20NIwnzauM7fNbv0dMeUY2snaAirLQh9HTFRz0yR3ufoNO3XSCfztmjdD4Ss=;
X-UUID: 07c50f710d134415a07ea1d5e465d176-20200929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 641961903; Tue, 29 Sep 2020 23:18:34 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 00:09:05 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:09:03 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:09:04 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 10/24] iommu/io-pgtable-arm-v7s: Add cfg as a param in some
 macros
Date: Wed, 30 Sep 2020 15:06:33 +0800
Message-ID: <20200930070647.10188-11-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930070647.10188-1-yong.wu@mediatek.com>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FFDBEC49ECEFA09E78A45829BB412B2B312E593CE04F1DBF7E08737226EA43C32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_031842_290204_6E763D8F 
X-CRM114-Status: GOOD (  15.94  )
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
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add "cfg" as a parameter for some macros. This is a preparing patch for
mediatek extend the lvl1 pgtable. No functional change.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 34 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index a3b3e9147b8d..8362fdf76657 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -53,17 +53,17 @@
 #define ARM_V7S_LVL_SHIFT(lvl)		(ARM_V7S_ADDR_BITS - (4 + 8 * (lvl)))
 #define ARM_V7S_TABLE_SHIFT		10
 
-#define ARM_V7S_PTES_PER_LVL(lvl)	(1 << _ARM_V7S_LVL_BITS(lvl))
-#define ARM_V7S_TABLE_SIZE(lvl)						\
-	(ARM_V7S_PTES_PER_LVL(lvl) * sizeof(arm_v7s_iopte))
+#define ARM_V7S_PTES_PER_LVL(lvl, cfg)	(1 << _ARM_V7S_LVL_BITS(lvl))
+#define ARM_V7S_TABLE_SIZE(lvl, cfg)					\
+	(ARM_V7S_PTES_PER_LVL(lvl, cfg) * sizeof(arm_v7s_iopte))
 
 #define ARM_V7S_BLOCK_SIZE(lvl)		(1UL << ARM_V7S_LVL_SHIFT(lvl))
 #define ARM_V7S_LVL_MASK(lvl)		((u32)(~0U << ARM_V7S_LVL_SHIFT(lvl)))
 #define ARM_V7S_TABLE_MASK		((u32)(~0U << ARM_V7S_TABLE_SHIFT))
-#define _ARM_V7S_IDX_MASK(lvl)		(ARM_V7S_PTES_PER_LVL(lvl) - 1)
-#define ARM_V7S_LVL_IDX(addr, lvl)	({				\
+#define _ARM_V7S_IDX_MASK(lvl, cfg)	(ARM_V7S_PTES_PER_LVL(lvl, cfg) - 1)
+#define ARM_V7S_LVL_IDX(addr, lvl, cfg)	({			\
 	int _l = lvl;							\
-	((u32)(addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l); \
+	((u32)(addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l, cfg); \
 })
 
 /*
@@ -239,7 +239,7 @@ static void *__arm_v7s_alloc_table(int lvl, gfp_t gfp,
 	struct device *dev = cfg->iommu_dev;
 	phys_addr_t phys;
 	dma_addr_t dma;
-	size_t size = ARM_V7S_TABLE_SIZE(lvl);
+	size_t size = ARM_V7S_TABLE_SIZE(lvl, cfg);
 	void *table = NULL;
 
 	if (lvl == 1)
@@ -285,7 +285,7 @@ static void __arm_v7s_free_table(void *table, int lvl,
 {
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	struct device *dev = cfg->iommu_dev;
-	size_t size = ARM_V7S_TABLE_SIZE(lvl);
+	size_t size = ARM_V7S_TABLE_SIZE(lvl, cfg);
 
 	if (!cfg->coherent_walk)
 		dma_unmap_single(dev, __arm_v7s_dma_addr(table), size,
@@ -429,7 +429,7 @@ static int arm_v7s_init_pte(struct arm_v7s_io_pgtable *data,
 			arm_v7s_iopte *tblp;
 			size_t sz = ARM_V7S_BLOCK_SIZE(lvl);
 
-			tblp = ptep - ARM_V7S_LVL_IDX(iova, lvl);
+			tblp = ptep - ARM_V7S_LVL_IDX(iova, lvl, cfg);
 			if (WARN_ON(__arm_v7s_unmap(data, NULL, iova + i * sz,
 						    sz, lvl, tblp) != sz))
 				return -EINVAL;
@@ -482,7 +482,7 @@ static int __arm_v7s_map(struct arm_v7s_io_pgtable *data, unsigned long iova,
 	int num_entries = size >> ARM_V7S_LVL_SHIFT(lvl);
 
 	/* Find our entry at the current level */
-	ptep += ARM_V7S_LVL_IDX(iova, lvl);
+	ptep += ARM_V7S_LVL_IDX(iova, lvl, cfg);
 
 	/* If we can install a leaf entry at this level, then do so */
 	if (num_entries)
@@ -554,7 +554,7 @@ static void arm_v7s_free_pgtable(struct io_pgtable *iop)
 	struct arm_v7s_io_pgtable *data = io_pgtable_to_data(iop);
 	int i;
 
-	for (i = 0; i < ARM_V7S_PTES_PER_LVL(1); i++) {
+	for (i = 0; i < ARM_V7S_PTES_PER_LVL(1, &data->iop.cfg); i++) {
 		arm_v7s_iopte pte = data->pgd[i];
 
 		if (ARM_V7S_PTE_IS_TABLE(pte, 1))
@@ -606,9 +606,9 @@ static size_t arm_v7s_split_blk_unmap(struct arm_v7s_io_pgtable *data,
 	if (!tablep)
 		return 0; /* Bytes unmapped */
 
-	num_ptes = ARM_V7S_PTES_PER_LVL(2);
+	num_ptes = ARM_V7S_PTES_PER_LVL(2, cfg);
 	num_entries = size >> ARM_V7S_LVL_SHIFT(2);
-	unmap_idx = ARM_V7S_LVL_IDX(iova, 2);
+	unmap_idx = ARM_V7S_LVL_IDX(iova, 2, cfg);
 
 	pte = arm_v7s_prot_to_pte(arm_v7s_pte_to_prot(blk_pte, 1), 2, cfg);
 	if (num_entries > 1)
@@ -650,7 +650,7 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
 	if (WARN_ON(lvl > 2))
 		return 0;
 
-	idx = ARM_V7S_LVL_IDX(iova, lvl);
+	idx = ARM_V7S_LVL_IDX(iova, lvl, &iop->cfg);
 	ptep += idx;
 	do {
 		pte[i] = READ_ONCE(ptep[i]);
@@ -736,7 +736,7 @@ static phys_addr_t arm_v7s_iova_to_phys(struct io_pgtable_ops *ops,
 	u32 mask;
 
 	do {
-		ptep += ARM_V7S_LVL_IDX(iova, ++lvl);
+		ptep += ARM_V7S_LVL_IDX(iova, ++lvl, &data->iop.cfg);
 		pte = READ_ONCE(*ptep);
 		ptep = iopte_deref(pte, lvl, data);
 	} while (ARM_V7S_PTE_IS_TABLE(pte, lvl));
@@ -779,8 +779,8 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 
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

Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8C5C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 03:56:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0819060233
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 03:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0819060233
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hnMwFKbYZ5z8Dn1UI0SrH7tHerR4ZT0uztCWLkVzH4k=; b=d5PRNjy6w7atsNiaTgoRfNOaL
	+UKeUiPF2yKS0W+Tk0TtGg5S78ud34BlSEWg+eJGDvCUYEads8mnqFrKp2qCLGDCrKKvKmbY2DM2X
	veX0CxuUBtHJNf9Zzm+nZ/qMIF72flGbi0yHVRWOq+xpe/baSC2hJUU9m3rabMl4NJxbFPUSKiMhR
	1aSYbVVLqlOKvbzw7x/RD9dB1UO01m9pqwMWWXattt39mRjpV0zgwAFaFg3bU29G2Xhj5oNhyLHG9
	IOWSWrgs/GyFlVYaIdr+ER+kN9WTQ3uO9sbQGELgX3l+l9E25n93n/GaD/sy1OSmzoNUf9O+slHEf
	+Ui0E3JrQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfx1M-00D3jy-Cj; Mon, 10 May 2021 03:55:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfx0Y-00D3cQ-6h; Mon, 10 May 2021 03:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=+5vqmI6VCcfb8RaZlYbZ/nqbEwee1+kghxf3K1PQyjA=; b=Qu14i2v2kzSvDyW0GWVsrOgEd3
 +N8M6KRbKgSXieG8/oxrvulWTsY+gy8gLfBYyrwt/nu8B9+zwFpBmcSEyGRTgqWZWuPI9C0Ndm8LX
 m/ygtPfAuhdb5zu+NqtW+QzmxUpsqjjYi53x2Ca6lor8ORJfjjN6fizE7FcTCBdnt8eAQE3ebu7/2
 qu33Fi+UQaZlr8Xna1XPebcfJCFvl99Kz8IDVm0xWE0/ovNs6QrPTAbL6EwSu53tzbec6XAAaanUz
 qqRlBgrmNZ99iq6Dx+k8wyjz/8Z8FloANVuG4+iJhkPzFi7UfSPGxMW+uL0nDx2pZZ1zinLdkXxm+
 xVL1lifQ==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfx0U-008FzZ-34; Mon, 10 May 2021 03:55:00 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FdnCz41BPzQlSj;
 Mon, 10 May 2021 11:51:27 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 10 May 2021 11:54:42 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>, "Lu
 Baolu" <baolu.lu@linux.intel.com>, Yong Wu <yong.wu@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "Chen-Yu Tsai" <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 iommu <iommu@lists.linux-foundation.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, linux-sunxi
 <linux-sunxi@lists.linux.dev>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 1/1] iommu: Clear a lot of spelling mistakes
Date: Mon, 10 May 2021 11:54:25 +0800
Message-ID: <20210510035425.3212-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210510035425.3212-1-thunder.leizhen@huawei.com>
References: <20210510035425.3212-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210509_205458_496866_F7B00846 
X-CRM114-Status: GOOD (  26.43  )
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

All spelling mistakes are in the comments, no functional change.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/iommu/amd/amd_iommu_types.h   | 2 +-
 drivers/iommu/amd/init.c              | 2 +-
 drivers/iommu/amd/iommu.c             | 2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 2 +-
 drivers/iommu/fsl_pamu.c              | 2 +-
 drivers/iommu/intel/dmar.c            | 6 +++---
 drivers/iommu/intel/iommu.c           | 2 +-
 drivers/iommu/intel/irq_remapping.c   | 2 +-
 drivers/iommu/iommu.c                 | 6 +++---
 drivers/iommu/iova.c                  | 2 +-
 drivers/iommu/mtk_iommu.c             | 2 +-
 drivers/iommu/omap-iommu.c            | 2 +-
 drivers/iommu/sun50i-iommu.c          | 2 +-
 13 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 94c1a7a9876d554..67a6c2fb4de9e2a 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -446,7 +446,7 @@ extern struct irq_remap_table **irq_lookup_table;
 /* Interrupt remapping feature used? */
 extern bool amd_iommu_irq_remap;
 
-/* kmem_cache to get tables with 128 byte alignement */
+/* kmem_cache to get tables with 128 byte alignment */
 extern struct kmem_cache *amd_iommu_irq_cache;
 
 /*
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index d006724f4dc2122..d749837dcecc875 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -2040,7 +2040,7 @@ static int intcapxt_irqdomain_activate(struct irq_domain *domain,
 	xt.destid_24_31 = cfg->dest_apicid >> 24;
 
 	/**
-	 * Current IOMMU implemtation uses the same IRQ for all
+	 * Current IOMMU implementation uses the same IRQ for all
 	 * 3 IOMMU interrupts.
 	 */
 	writeq(xt.capxt, iommu->mmio_base + MMIO_INTCAPXT_EVT_OFFSET);
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 80e8e1916dd17c9..fa2c98857f3a7d0 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1812,7 +1812,7 @@ int __init amd_iommu_init_dma_ops(void)
  * The following functions belong to the exported interface of AMD IOMMU
  *
  * This interface allows access to lower level functions of the IOMMU
- * like protection domain handling and assignement of devices to domains
+ * like protection domain handling and assignment of devices to domains
  * which is not possible with the dma_ops interface.
  *
  *****************************************************************************/
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 6f72c4d208cad84..a56e0d91b5a70a2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1361,7 +1361,7 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 		ret = arm_smmu_register_legacy_master(dev, &smmu);
 
 		/*
-		 * If dev->iommu_fwspec is initally NULL, arm_smmu_register_legacy_master()
+		 * If dev->iommu_fwspec is initially NULL, arm_smmu_register_legacy_master()
 		 * will allocate/initialise a new one. Thus we need to update fwspec for
 		 * later use.
 		 */
diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index fc38b1fba7cff0a..53aff27663673a0 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -246,7 +246,7 @@ void get_ome_index(u32 *omi_index, struct device *dev)
  * @stash_dest_hint: L1, L2 or L3
  * @vcpu: vpcu target for a particular cache type.
  *
- * Returs stash on success or ~(u32)0 on failure.
+ * Returns stash on success or ~(u32)0 on failure.
  *
  */
 u32 get_stash_id(u32 stash_dest_hint, u32 vcpu)
diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index 1757ac1e1623e9a..2a2d176b36ec0f2 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -45,7 +45,7 @@ struct dmar_res_callback {
 
 /*
  * Assumptions:
- * 1) The hotplug framework guarentees that DMAR unit will be hot-added
+ * 1) The hotplug framework guarantees that DMAR unit will be hot-added
  *    before IO devices managed by that unit.
  * 2) The hotplug framework guarantees that DMAR unit will be hot-removed
  *    after IO devices managed by that unit.
@@ -960,10 +960,10 @@ static void unmap_iommu(struct intel_iommu *iommu)
 /**
  * map_iommu: map the iommu's registers
  * @iommu: the iommu to map
- * @phys_addr: the physical address of the base resgister
+ * @phys_addr: the physical address of the base register
  *
  * Memory map the iommu's registers.  Start w/ a single page, and
- * possibly expand if that turns out to be insufficent.
+ * possibly expand if that turns out to be insufficient.
  */
 static int map_iommu(struct intel_iommu *iommu, u64 phys_addr)
 {
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 708f430af1c4403..ba5b0137b4b1fb4 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -288,7 +288,7 @@ static inline void context_clear_entry(struct context_entry *context)
 
 /*
  * This domain is a statically identity mapping domain.
- *	1. This domain creats a static 1:1 mapping to all usable memory.
+ *	1. This domain creates a static 1:1 mapping to all usable memory.
  * 	2. It maps to each iommu if successful.
  *	3. Each iommu mapps to this domain if successful.
  */
diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index f912fe45bea2c00..d66210308eded97 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -74,7 +74,7 @@ static struct hpet_scope ir_hpet[MAX_HPET_TBS];
  *	->iommu->register_lock
  * Note:
  * intel_irq_remap_ops.{supported,prepare,enable,disable,reenable} are called
- * in single-threaded environment with interrupt disabled, so no need to tabke
+ * in single-threaded environment with interrupt disabled, so no need to take
  * the dmar_global_lock.
  */
 DEFINE_RAW_SPINLOCK(irq_2_ir_lock);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 808ab70d5df50f7..971068da67cb91d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1479,7 +1479,7 @@ struct iommu_group *pci_device_group(struct device *dev)
 
 	/*
 	 * Look for existing groups on non-isolated functions on the same
-	 * slot and aliases of those funcions, if any.  No need to clear
+	 * slot and aliases of those functions, if any.  No need to clear
 	 * the search bitmap, the tested devfns are still valid.
 	 */
 	group = get_pci_function_alias_group(pdev, (unsigned long *)devfns);
@@ -2285,7 +2285,7 @@ struct iommu_domain *iommu_get_dma_domain(struct device *dev)
  * iterating over the devices in a group.  Ideally we'd have a single
  * device which represents the requestor ID of the group, but we also
  * allow IOMMU drivers to create policy defined minimum sets, where
- * the physical hardware may be able to distiguish members, but we
+ * the physical hardware may be able to distinguish members, but we
  * wish to group them at a higher level (ex. untrusted multi-function
  * PCI devices).  Thus we attach each device.
  */
@@ -3152,7 +3152,7 @@ static int iommu_change_dev_def_domain(struct iommu_group *group,
 	 */
 	mutex_unlock(&group->mutex);
 
-	/* Make sure dma_ops is appropriatley set */
+	/* Make sure dma_ops is appropriately set */
 	iommu_group_do_probe_finalize(dev, group->default_domain);
 	iommu_domain_free(prev_dom);
 	return 0;
diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index b7ecd5b080398c2..aba745dfb819310 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -591,7 +591,7 @@ static void fq_destroy_all_entries(struct iova_domain *iovad)
 	int cpu;
 
 	/*
-	 * This code runs when the iova_domain is being detroyed, so don't
+	 * This code runs when the iova_domain is being destroyed, so don't
 	 * bother to free iovas, just call the entry_dtor on all remaining
 	 * entries.
 	 */
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e06b8a0e2b56bdd..b9e4be35c8dcad2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -161,7 +161,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data);
  * The Region 'A'(I/O) can NOT be mapped by M4U; For Region 'B'/'C'/'D', the
  * bit32 of the CPU physical address always is needed to set, and for Region
  * 'E', the CPU physical address keep as is.
- * Additionally, The iommu consumers always use the CPU phyiscal address.
+ * Additionally, The iommu consumers always use the CPU physical address.
  */
 #define MTK_IOMMU_4GB_MODE_REMAP_BASE	 0x140000000UL
 
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 26e517eb0dd3a80..68c1cbd509d8ac7 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1751,7 +1751,7 @@ static int __init omap_iommu_init(void)
 {
 	struct kmem_cache *p;
 	const slab_flags_t flags = SLAB_HWCACHE_ALIGN;
-	size_t align = 1 << 10; /* L2 pagetable alignement */
+	size_t align = 1 << 10; /* L2 pagetable alignment */
 	struct device_node *np;
 	int ret;
 
diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 181bb1c3437c0e4..a28a44e2166977f 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -149,7 +149,7 @@ static void iommu_write(struct sun50i_iommu *iommu, u32 offset, u32 value)
  * 4096 4-bytes Directory Table Entries (DTE), each pointing to a Page
  * Table (PT).
  *
- * Each PT consits of 256 4-bytes Page Table Entries (PTE), each
+ * Each PT consists of 256 4-bytes Page Table Entries (PTE), each
  * pointing to a 4kB page of physical memory.
  *
  * The IOMMU supports a single DT, pointed by the IOMMU_TTB_REG
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

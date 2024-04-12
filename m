Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD2EC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 07:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSGEixlsc+CFmKQBv2kI/ywGBBoaVrV0lgR0+MMs2Ug=; b=TwNWSftzSFiCiU04vCixnQicC/
	33dotqFr26dBtva9P+DZpPtl33DXybr/1Pimv/5sAHl2lYfZlaeiFEwZo49FXm8DO0C6P9I1TcQZ3
	m8Xqq6dYZCNSDEzjq6BcgWDBLwseIGpbnTvOQq3JAFWCRNhR32lG/bcbG+dfB8wpco1+Srfeot+b0
	+O21ZZj9Qsf+AkLZHvlxqxqsXhpScgGanlOouxLNj/fYqfwOI24n5vkclZ0z+LHii74/qlzHKa+DI
	VgDASPwhfSyDreISdspcRd3dJ6/UAH3yD5y8zkpQvxVchhsb4guBJlbe3nTboAKuVEH+k6ouZv/Wz
	51LUvbyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvB1Q-0000000FlfZ-3Wmb;
	Fri, 12 Apr 2024 07:08:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvB1N-0000000FldJ-2Y6Y;
	Fri, 12 Apr 2024 07:08:27 +0000
X-UUID: 728ede82f89b11eeac1957ae9f99f617-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BSGEixlsc+CFmKQBv2kI/ywGBBoaVrV0lgR0+MMs2Ug=;
	b=eKT/DtbEytKFB0GGHlU4iFBxw/Xjfk0WefcKtaHnifLewMFG3iyVWUxUL70VZ3kiNTYtDOvvFlOofCD3pum3LY3IyNovKsv1lbHXv3qtQ7Ntt698jdEA1y9NJFlzfEYtVvFcWhUnBxWSKP8t50fjkLLc+Trvb5GE5+q8TrmBglY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:fa6cc9e1-6219-465a-b69f-2bf7117cbcb8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:ab709782-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 728ede82f89b11eeac1957ae9f99f617-20240412
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 246898837; Fri, 12 Apr 2024 00:08:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 14:57:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 14:57:45 +0800
From: Yi-De Wu <yi-de.wu@mediatek.com>
To: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang
	<ze-yu.wang@mediatek.com>, Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, David Bradil
	<dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, My Chuang
	<my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>, PeiLun Suei
	<peilun.suei@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>, "Willix
 Yeh" <chi-shen.yeh@mediatek.com>, Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: [PATCH v10 08/21] virt: geniezone: Optimize performance of protected VM memory
Date: Fri, 12 Apr 2024 14:57:05 +0800
Message-ID: <20240412065718.29105-9-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240412065718.29105-1-yi-de.wu@mediatek.com>
References: <20240412065718.29105-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.428200-8.000000
X-TMASE-MatchedRID: zE/i+aVSjJsZ6xRDKEbMaNiE0w2W/7Q3/Hd4CUWIS/FpG3YgOhBCuQjF
	DcaUmBsUpS2cZKjpLToO4n8yU3xhRxUBkTmMruyZhK8o4aoss8oraL2mh8ZVK1xTR00Ss4P6+Vi
	hXqn9xLE8VyRVdn8owNjMxwbxxAZyMHsCEB6xhyPJ1E39jKDimMSgMQYKGHsJQQ1XgvCe7sE1Hn
	rz3FMjWfKrCzh5Rjn97pe7sdIOgOuTM2fZSUCLQZrIHuCZpMzlfrTt+hmA5bITAT5mu/JB59eWF
	vQm49CBPSgOWjQHAA/K/S9FpaG5cuF/B1jEjV+6h2VzUlo4HVMwLjM7t3iRo2JkJOQVCIpwBpNq
	UzwLvvfC9TF0oEZxDBPXr2NefJkIFn6miqL6+G2jrlYm3WTU74EcpMn6x9cZVL6geaPy6nPqJOA
	9x2fPN+LzNWBegCW2xl8lw85EaVQLbigRnpKlKVHxEBQar9JnAxgv/LPhBUn8Z026UwCPYNqNgN
	cnAv2xloHQQvKuQ4VEaLdbAPh1qprvsUa0wBJ8SC/oNOW0/7ReKW+C4YtYxSjtpmSJLxQVSZrfN
	hP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euIiT2wjObmjrMC+ksT6a9fy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.428200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B88678E2848FF51370FE7FC31979CF6C607EA33FE9675F934F505251B77BC2D82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_000825_678089_205B3ADC 
X-CRM114-Status: GOOD (  29.25  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>

The memory protection mechanism performs better with batch operations on
memory pages. To leverage this, we pre-allocate memory for VMs that are
set to protected mode. As a result, the memory protection mechanism can
proactively protect the pre-allocated memory in advance through batch
operations, leading to improved performance during VM booting.

Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 arch/arm64/geniezone/vm.c             | 154 ++++++++++++++++++++++++++
 drivers/virt/geniezone/Makefile       |   3 +-
 drivers/virt/geniezone/gzvm_mmu.c     | 117 +++++++++++++++++++
 include/linux/soc/mediatek/gzvm_drv.h |   6 +
 4 files changed, 279 insertions(+), 1 deletion(-)
 create mode 100644 drivers/virt/geniezone/gzvm_mmu.c

diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
index 0030e57bf77b..642efa596112 100644
--- a/arch/arm64/geniezone/vm.c
+++ b/arch/arm64/geniezone/vm.c
@@ -11,6 +11,8 @@
 #include <linux/soc/mediatek/gzvm_drv.h>
 #include "gzvm_arch_common.h"
 
+#define PAR_PA47_MASK GENMASK_ULL(47, 12)
+
 /**
  * gzvm_hypcall_wrapper() - the wrapper for hvc calls
  * @a0: arguments passed in registers 0
@@ -170,6 +172,128 @@ static int gzvm_vm_ioctl_get_pvmfw_size(struct gzvm *gzvm,
 	return 0;
 }
 
+/**
+ * fill_constituents() - Populate pa to buffer until full
+ * @consti: Pointer to struct mem_region_addr_range.
+ * @consti_cnt: Constituent count.
+ * @max_nr_consti: Maximum number of constituent count.
+ * @gfn: Guest frame number.
+ * @total_pages: Total page numbers.
+ * @slot: Pointer to struct gzvm_memslot.
+ *
+ * Return: how many pages we've fill in, negative if error
+ */
+static int fill_constituents(struct mem_region_addr_range *consti,
+			     int *consti_cnt, int max_nr_consti, u64 gfn,
+			     u32 total_pages, struct gzvm_memslot *slot)
+{
+	u64 pfn = 0, prev_pfn = 0, gfn_end = 0;
+	int nr_pages = 0;
+	int i = -1;
+
+	if (unlikely(total_pages == 0))
+		return -EINVAL;
+	gfn_end = gfn + total_pages;
+
+	while (i < max_nr_consti && gfn < gfn_end) {
+		if (gzvm_vm_allocate_guest_page(slot, gfn, &pfn) != 0)
+			return -EFAULT;
+		if (pfn == (prev_pfn + 1)) {
+			consti[i].pg_cnt++;
+		} else {
+			i++;
+			if (i >= max_nr_consti)
+				break;
+			consti[i].address = PFN_PHYS(pfn);
+			consti[i].pg_cnt = 1;
+		}
+		prev_pfn = pfn;
+		gfn++;
+		nr_pages++;
+	}
+	if (i != max_nr_consti)
+		i++;
+	*consti_cnt = i;
+
+	return nr_pages;
+}
+
+/**
+ * gzvm_vm_populate_mem_region() - Iterate all mem slot and populate pa to
+ * buffer until it's full
+ * @gzvm: Pointer to struct gzvm.
+ * @slot_id: Memory slot id to be populated.
+ *
+ * Return: 0 if it is successful, negative if error
+ */
+int gzvm_vm_populate_mem_region(struct gzvm *gzvm, int slot_id)
+{
+	struct gzvm_memslot *memslot = &gzvm->memslot[slot_id];
+	struct gzvm_memory_region_ranges *region;
+	int max_nr_consti, remain_pages;
+	u64 gfn, gfn_end;
+	u32 buf_size;
+
+	buf_size = PAGE_SIZE * 2;
+	region = alloc_pages_exact(buf_size, GFP_KERNEL);
+	if (!region)
+		return -ENOMEM;
+
+	max_nr_consti = (buf_size - sizeof(*region)) /
+			sizeof(struct mem_region_addr_range);
+
+	region->slot = memslot->slot_id;
+	remain_pages = memslot->npages;
+	gfn = memslot->base_gfn;
+	gfn_end = gfn + remain_pages;
+
+	while (gfn < gfn_end) {
+		int nr_pages;
+
+		nr_pages = fill_constituents(region->constituents,
+					     &region->constituent_cnt,
+					     max_nr_consti, gfn,
+					     remain_pages, memslot);
+
+		if (nr_pages < 0) {
+			pr_err("Failed to fill constituents\n");
+			free_pages_exact(region, buf_size);
+			return -EFAULT;
+		}
+
+		region->gpa = PFN_PHYS(gfn);
+		region->total_pages = nr_pages;
+		remain_pages -= nr_pages;
+		gfn += nr_pages;
+
+		if (gzvm_arch_set_memregion(gzvm->vm_id, buf_size,
+					    virt_to_phys(region))) {
+			pr_err("Failed to register memregion to hypervisor\n");
+			free_pages_exact(region, buf_size);
+			return -EFAULT;
+		}
+	}
+	free_pages_exact(region, buf_size);
+
+	return 0;
+}
+
+static int populate_all_mem_regions(struct gzvm *gzvm)
+{
+	int ret, i;
+
+	for (i = 0; i < GZVM_MAX_MEM_REGION; i++) {
+		if (gzvm->memslot[i].npages == 0)
+			continue;
+
+		ret = gzvm_vm_populate_mem_region(gzvm, i);
+		if (ret != 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * gzvm_vm_ioctl_cap_pvm() - Proceed GZVM_CAP_PROTECTED_VM's subcommands
  * @gzvm: Pointer to struct gzvm.
@@ -191,6 +315,11 @@ static int gzvm_vm_ioctl_cap_pvm(struct gzvm *gzvm,
 	case GZVM_CAP_PVM_SET_PVMFW_GPA:
 		fallthrough;
 	case GZVM_CAP_PVM_SET_PROTECTED_VM:
+		/*
+		 * To improve performance for protected VM, we have to populate VM's memory
+		 * before VM booting
+		 */
+		populate_all_mem_regions(gzvm);
 		ret = gzvm_vm_arch_enable_cap(gzvm, cap, &res);
 		return ret;
 	case GZVM_CAP_PVM_GET_PVMFW_SIZE:
@@ -219,3 +348,28 @@ int gzvm_vm_ioctl_arch_enable_cap(struct gzvm *gzvm,
 
 	return -EINVAL;
 }
+
+/**
+ * gzvm_hva_to_pa_arch() - converts hva to pa with arch-specific way
+ * @hva: Host virtual address.
+ *
+ * Return: GZVM_PA_ERR_BAD for translation error
+ */
+u64 gzvm_hva_to_pa_arch(u64 hva)
+{
+	unsigned long flags;
+	u64 par;
+
+	local_irq_save(flags);
+	asm volatile("at s1e1r, %0" :: "r" (hva));
+	isb();
+	par = read_sysreg_par();
+	local_irq_restore(flags);
+
+	if (par & SYS_PAR_EL1_F)
+		return GZVM_PA_ERR_BAD;
+	par = par & PAR_PA47_MASK;
+	if (!par)
+		return GZVM_PA_ERR_BAD;
+	return par;
+}
diff --git a/drivers/virt/geniezone/Makefile b/drivers/virt/geniezone/Makefile
index 25614ea3dea2..59fc4510a843 100644
--- a/drivers/virt/geniezone/Makefile
+++ b/drivers/virt/geniezone/Makefile
@@ -6,4 +6,5 @@
 
 GZVM_DIR ?= ../../../drivers/virt/geniezone
 
-gzvm-y := $(GZVM_DIR)/gzvm_main.o $(GZVM_DIR)/gzvm_vm.o
+gzvm-y := $(GZVM_DIR)/gzvm_main.o $(GZVM_DIR)/gzvm_vm.o \
+	  $(GZVM_DIR)/gzvm_mmu.o
diff --git a/drivers/virt/geniezone/gzvm_mmu.c b/drivers/virt/geniezone/gzvm_mmu.c
new file mode 100644
index 000000000000..3f1272f0e22d
--- /dev/null
+++ b/drivers/virt/geniezone/gzvm_mmu.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ */
+
+#include <linux/soc/mediatek/gzvm_drv.h>
+
+/**
+ * hva_to_pa_fast() - converts hva to pa in generic fast way
+ * @hva: Host virtual address.
+ *
+ * Return: GZVM_PA_ERR_BAD for translation error
+ */
+u64 hva_to_pa_fast(u64 hva)
+{
+	struct page *page[1];
+	u64 pfn;
+
+	if (get_user_page_fast_only(hva, 0, page)) {
+		pfn = page_to_phys(page[0]);
+		put_page(page[0]);
+		return pfn;
+	}
+	return GZVM_PA_ERR_BAD;
+}
+
+/**
+ * hva_to_pa_slow() - converts hva to pa in a slow way
+ * @hva: Host virtual address
+ *
+ * This function converts HVA to PA in a slow way because the target hva is not
+ * yet allocated and mapped in the host stage1 page table, we cannot find it
+ * directly from current page table.
+ * Thus, we have to allocate it and this operation is much slower than directly
+ * find via current page table.
+ *
+ * Context: This function may sleep
+ * Return: PA or GZVM_PA_ERR_BAD for translation error
+ */
+u64 hva_to_pa_slow(u64 hva)
+{
+	struct page *page = NULL;
+	u64 pfn = 0;
+	int npages;
+
+	npages = get_user_pages_unlocked(hva, 1, &page, 0);
+	if (npages != 1)
+		return GZVM_PA_ERR_BAD;
+
+	if (page) {
+		pfn = page_to_phys(page);
+		put_page(page);
+		return pfn;
+	}
+
+	return GZVM_PA_ERR_BAD;
+}
+
+static u64 __gzvm_gfn_to_pfn_memslot(struct gzvm_memslot *memslot, u64 gfn)
+{
+	u64 hva, pa;
+
+	if (gzvm_gfn_to_hva_memslot(memslot, gfn, &hva) != 0)
+		return GZVM_PA_ERR_BAD;
+
+	pa = gzvm_hva_to_pa_arch(hva);
+	if (pa != GZVM_PA_ERR_BAD)
+		return PHYS_PFN(pa);
+
+	pa = hva_to_pa_fast(hva);
+	if (pa != GZVM_PA_ERR_BAD)
+		return PHYS_PFN(pa);
+
+	pa = hva_to_pa_slow(hva);
+	if (pa != GZVM_PA_ERR_BAD)
+		return PHYS_PFN(pa);
+
+	return GZVM_PA_ERR_BAD;
+}
+
+/**
+ * gzvm_gfn_to_pfn_memslot() - Translate gfn (guest ipa) to pfn (host pa),
+ *			       result is in @pfn
+ * @memslot: Pointer to struct gzvm_memslot.
+ * @gfn: Guest frame number.
+ * @pfn: Host page frame number.
+ *
+ * Return:
+ * * 0			- Succeed
+ * * -EFAULT		- Failed to convert
+ */
+int gzvm_gfn_to_pfn_memslot(struct gzvm_memslot *memslot, u64 gfn,
+			    u64 *pfn)
+{
+	u64 __pfn;
+
+	if (!memslot)
+		return -EFAULT;
+
+	__pfn = __gzvm_gfn_to_pfn_memslot(memslot, gfn);
+	if (__pfn == GZVM_PA_ERR_BAD) {
+		*pfn = 0;
+		return -EFAULT;
+	}
+
+	*pfn = __pfn;
+
+	return 0;
+}
+
+int gzvm_vm_allocate_guest_page(struct gzvm_memslot *slot, u64 gfn, u64 *pfn)
+{
+	if (gzvm_gfn_to_pfn_memslot(slot, gfn, pfn) != 0)
+		return -EFAULT;
+	return 0;
+}
+
diff --git a/include/linux/soc/mediatek/gzvm_drv.h b/include/linux/soc/mediatek/gzvm_drv.h
index 16283ad75df9..18a3e19347ce 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -110,7 +110,13 @@ int gzvm_vm_ioctl_arch_enable_cap(struct gzvm *gzvm,
 				  struct gzvm_enable_cap *cap,
 				  void __user *argp);
 
+u64 gzvm_hva_to_pa_arch(u64 hva);
+u64 hva_to_pa_fast(u64 hva);
+u64 hva_to_pa_slow(u64 hva);
+int gzvm_gfn_to_pfn_memslot(struct gzvm_memslot *memslot, u64 gfn, u64 *pfn);
 int gzvm_gfn_to_hva_memslot(struct gzvm_memslot *memslot, u64 gfn,
 			    u64 *hva_memslot);
+int gzvm_vm_populate_mem_region(struct gzvm *gzvm, int slot_id);
+int gzvm_vm_allocate_guest_page(struct gzvm_memslot *slot, u64 gfn, u64 *pfn);
 
 #endif /* __GZVM_DRV_H__ */
-- 
2.18.0



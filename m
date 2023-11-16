Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39297C54FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AdCj3oPS4Yuvol06kpIMzdLo24kALWO/jdcfmFxzhY=; b=T5iTecviekNddz4OI8JqYnfuAG
	lzGU9jS5i45mha734d95QdcYxhSS45ZylvRCn48EwRRoockTAesbLeWcMYJEQXw35Qn11gPJ907zO
	OccQORbV62nhGQi2B7t1Me/bD4iHlxjwdoqkmv80lW63E3ipYpj3PSRYQm8JIKYIaR7f1jakPuCcL
	rVr/6d7npAAZjjOhLta26GtANBtaaRO8aom2MkhNcSJHYXC0JgEqXPlj3iCN0tGYGodieMSBED/AU
	E1uul9bJKryNYVlV+/mEteDiLczw4kg6HQzGNkgn4uw7mUEmG7oHF3FiqG5K05fVy/ocHlalLjNF0
	wAkAdhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3eYT-003qRy-2o;
	Thu, 16 Nov 2023 15:45:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3eYI-003qLC-1k;
	Thu, 16 Nov 2023 15:45:12 +0000
X-UUID: f9241c80849411ee9b7791016c24628a-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+AdCj3oPS4Yuvol06kpIMzdLo24kALWO/jdcfmFxzhY=;
	b=UQQ6ylf78n7t4194M0yV0MCHil+sUeZL9kmPdK7NdI+8wOS8T1VjhupwiouzgJ/yLL50V52GiNr1/LfDU1pk1sIcYlYmF95DqaVJmWUjNR+jADAj9bJow5eOhvdmoFTp6Iz/jtZCiE17WdFDwH4odJ6ZSYRd+gCvvLqaVKn/2nc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:3be727eb-316e-4d2f-8c33-09165dcfda27,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:364b77b,CLOUDID:a5bebb72-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f9241c80849411ee9b7791016c24628a-20231116
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1303038848; Thu, 16 Nov 2023 08:29:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 Nov 2023 23:29:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 Nov 2023 23:29:11 +0800
From: Yi-De Wu <yi-de.wu@mediatek.com>
To: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang
	<ze-yu.wang@mediatek.com>, Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Arnd Bergmann <arnd@arndb.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	David Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>,
	Jade Shih <jades.shih@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>,
	"My Chuang" <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>, Liju Chen
	<liju-clr.chen@mediatek.com>, Willix Yeh <chi-shen.yeh@mediatek.com>,
	"Kevenny Hsieh" <kevenny.hsieh@mediatek.com>
Subject: [PATCH v7 15/16] virt: geniezone: Add memory pin/unpin support
Date: Thu, 16 Nov 2023 23:27:55 +0800
Message-ID: <20231116152756.4250-16-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231116152756.4250-1-yi-de.wu@mediatek.com>
References: <20231116152756.4250-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.116400-8.000000
X-TMASE-MatchedRID: FEQi7wiS8RY/TqR73SoO885Scd0yVs+bbd6rGhWOAwQCSZrAnTS0Brps
	GokK+C//AuwgUdYPZkXW0e5KCL9fbo0GdWKgGbBhMIiU395I8H3QeN4A2h64ncA5YKm8dwM6V78
	paYC694DwDJaTY0Uw1tUvsMhDJV3vsEBAuoaUqK/il2r2x2PwtZyDP1rrUdvhXCmcAC8DBrOt0v
	JcrVX4uGgMmeqXbMt1kkL+ENlH3trw/vD6Q64ggQwfhKwa9GwDcx5k3wffojMIbcbWxixcZI2n3
	CVm0yC5585VzGMOFzA9wJeM2pSaRcK21zBg2KlfGM6W3U+Lnnf9UVTtcLrq40/ky5ZO+kjg5ClJ
	FiBfD6zjywKvP1qavQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.116400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 337D8F43338640BF381649683B53DFACF1315DF158B48C331AD8BAC2FFB6C1042000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_074510_590866_EC19DBC9 
X-CRM114-Status: GOOD (  24.80  )
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

From: "Jerry Wang" <ze-yu.wang@mediatek.com>

Protected VM's memory cannot be swapped out because the memory pages are
protected from host access.

Once host accesses to those protected pages, the hardware exception is
triggered and may crash the host. So, we have to make those protected
pages be ineligible for swapping or merging by the host kernel to avoid
host access. To do so, we pin the page when it is assigned (donated) to
VM and unpin when VM relinquish the pages or is destroyed. Besides, the
protected VM’s memory requires hypervisor to clear the content before
returning to host, but VMM may free those memory before clearing, it
will result in those memory pages are reclaimed and reused before
totally clearing. Using pin/unpin can also avoid the above problems.

The implementation is described as follows.
- Use rb_tree to store pinned memory pages.
- Pin the page when handling page fault.
- Unpin the pages when VM relinquish the pages or is destroyed.

Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
---
 drivers/virt/geniezone/gzvm_mmu.c | 60 ++++++++++++++++++++++++++++++-
 drivers/virt/geniezone/gzvm_vm.c  | 18 ++++++++++
 include/linux/gzvm_drv.h          | 10 ++++++
 3 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/geniezone/gzvm_mmu.c b/drivers/virt/geniezone/gzvm_mmu.c
index 77104df4afe5..0acef342e1f0 100644
--- a/drivers/virt/geniezone/gzvm_mmu.c
+++ b/drivers/virt/geniezone/gzvm_mmu.c
@@ -107,8 +107,59 @@ int gzvm_gfn_to_pfn_memslot(struct gzvm_memslot *memslot, u64 gfn,
 	return 0;
 }
 
+static int cmp_ppages(struct rb_node *node, const struct rb_node *parent)
+{
+	struct gzvm_pinned_page *a = container_of(node,
+						  struct gzvm_pinned_page,
+						  node);
+	struct gzvm_pinned_page *b = container_of(parent,
+						  struct gzvm_pinned_page,
+						  node);
+
+	if (a->ipa < b->ipa)
+		return -1;
+	if (a->ipa > b->ipa)
+		return 1;
+	return 0;
+}
+
+static int gzvm_insert_ppage(struct gzvm *vm, struct gzvm_pinned_page *ppage)
+{
+	if (rb_find_add(&ppage->node, &vm->pinned_pages, cmp_ppages))
+		return -EEXIST;
+	return 0;
+}
+
+static int pin_one_page(struct gzvm *vm, unsigned long hva, u64 gpa)
+{
+	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
+	struct gzvm_pinned_page *ppage = NULL;
+	struct mm_struct *mm = current->mm;
+	struct page *page = NULL;
+
+	ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
+	if (!ppage)
+		return -ENOMEM;
+
+	mmap_read_lock(mm);
+	pin_user_pages(hva, 1, flags, &page);
+	mmap_read_unlock(mm);
+
+	if (!page) {
+		kfree(ppage);
+		return -EFAULT;
+	}
+
+	ppage->page = page;
+	ppage->ipa = gpa;
+	gzvm_insert_ppage(vm, ppage);
+
+	return 0;
+}
+
 static int handle_block_demand_page(struct gzvm *vm, int memslot_id, u64 gfn)
 {
+	unsigned long hva;
 	u64 pfn, __gfn;
 	int ret, i;
 
@@ -131,6 +182,11 @@ static int handle_block_demand_page(struct gzvm *vm, int memslot_id, u64 gfn)
 			goto err_unlock;
 		}
 		vm->demand_page_buffer[i] = pfn;
+
+		hva = gzvm_gfn_to_hva_memslot(&vm->memslot[memslot_id], __gfn);
+		ret = pin_one_page(vm, hva, PFN_PHYS(__gfn));
+		if (ret)
+			goto err_unlock;
 	}
 
 	ret = gzvm_arch_map_guest_block(vm->vm_id, memslot_id, start_gfn,
@@ -148,6 +204,7 @@ static int handle_block_demand_page(struct gzvm *vm, int memslot_id, u64 gfn)
 
 static int handle_single_demand_page(struct gzvm *vm, int memslot_id, u64 gfn)
 {
+	unsigned long hva;
 	int ret;
 	u64 pfn;
 
@@ -159,7 +216,8 @@ static int handle_single_demand_page(struct gzvm *vm, int memslot_id, u64 gfn)
 	if (unlikely(ret))
 		return -EFAULT;
 
-	return 0;
+	hva = gzvm_gfn_to_hva_memslot(&vm->memslot[memslot_id], gfn);
+	return pin_one_page(vm, hva, PFN_PHYS(gfn));
 }
 
 /**
diff --git a/drivers/virt/geniezone/gzvm_vm.c b/drivers/virt/geniezone/gzvm_vm.c
index 485d1e2097aa..a7d43bedfad0 100644
--- a/drivers/virt/geniezone/gzvm_vm.c
+++ b/drivers/virt/geniezone/gzvm_vm.c
@@ -292,6 +292,21 @@ static long gzvm_vm_ioctl(struct file *filp, unsigned int ioctl,
 	return ret;
 }
 
+static void gzvm_destroy_ppage(struct gzvm *gzvm)
+{
+	struct gzvm_pinned_page *ppage;
+	struct rb_node *node;
+
+	node = rb_first(&gzvm->pinned_pages);
+	while (node) {
+		ppage = rb_entry(node, struct gzvm_pinned_page, node);
+		unpin_user_pages_dirty_lock(&ppage->page, 1, true);
+		node = rb_next(node);
+		rb_erase(&ppage->node, &gzvm->pinned_pages);
+		kfree(ppage);
+	}
+}
+
 static void gzvm_destroy_vm(struct gzvm *gzvm)
 {
 	size_t allocated_size;
@@ -315,6 +330,8 @@ static void gzvm_destroy_vm(struct gzvm *gzvm)
 
 	mutex_unlock(&gzvm->lock);
 
+	gzvm_destroy_ppage(gzvm);
+
 	kfree(gzvm);
 }
 
@@ -390,6 +407,7 @@ static struct gzvm *gzvm_create_vm(unsigned long vm_type)
 	gzvm->vm_id = ret;
 	gzvm->mm = current->mm;
 	mutex_init(&gzvm->lock);
+	gzvm->pinned_pages = RB_ROOT;
 
 	ret = gzvm_vm_irqfd_init(gzvm);
 	if (ret) {
diff --git a/include/linux/gzvm_drv.h b/include/linux/gzvm_drv.h
index 0a8b21e1ed1a..bb470a9f92e4 100644
--- a/include/linux/gzvm_drv.h
+++ b/include/linux/gzvm_drv.h
@@ -12,6 +12,7 @@
 #include <linux/mutex.h>
 #include <linux/gzvm.h>
 #include <linux/srcu.h>
+#include <linux/rbtree.h>
 
 /*
  * For the normal physical address, the highest 12 bits should be zero, so we
@@ -82,6 +83,12 @@ struct gzvm_vcpu {
 	struct gzvm_vcpu_hwstate *hwstate;
 };
 
+struct gzvm_pinned_page {
+	struct rb_node node;
+	struct page *page;
+	u64 ipa;
+};
+
 struct gzvm {
 	struct gzvm_vcpu *vcpus[GZVM_MAX_VCPUS];
 	/* userspace tied to this vm */
@@ -121,6 +128,9 @@ struct gzvm {
 	 * at the same time
 	 */
 	struct mutex  demand_paging_lock;
+
+	/* Use rb-tree to record pin/unpin page */
+	struct rb_root pinned_pages;
 };
 
 long gzvm_dev_ioctl_check_extension(struct gzvm *gzvm, unsigned long args);
-- 
2.18.0



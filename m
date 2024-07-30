Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EF5C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYgStmbZvjfBmYB1Py0PxIJNyoiDEwO5O7I+7Y+R+gk=; b=Y2s/8ICZ6RcuPOorW3Jac1K3aA
	4mSyuRw+1Hxzkkwn4WDANz7g3NcDCf3DMr4z3+sVo6TiTBFOd+dDT6Z8Q4Xx9o3fcll9bd2vkCxaN
	IYJnq2BoWqwxdysPGGOvjksBZwEDwxBED9rpSPGwijwREHxXB57gH8VdINIuQm2GMVOzQWzWXUj07
	Mg09mjBoD6r/P3eZxEsjwd7o+BflTyzYJblORU0fGTZzWhUAPsRkKEZAWOPAtOJB3mHupwM9cKXel
	tipymYxT6HPsqqFcgyTrDWt0HTL0DANF5oo0h/BB0g+Oxe0YGujFQxfwWkz4QazF+HpLWpc1c+E+S
	/UEoVADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiFW-0000000EGtC-1xyt;
	Tue, 30 Jul 2024 08:30:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiA5-0000000EE7L-2Jih;
	Tue, 30 Jul 2024 08:24:54 +0000
X-UUID: 2ba5a2e64e4d11efa6c87f6b4542ff6b-20240730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gYgStmbZvjfBmYB1Py0PxIJNyoiDEwO5O7I+7Y+R+gk=;
	b=BEBCQBC3zqn3fBe/pz55nnySSAohHXsMYS8JbALevh2rodqyc9QH0rmDIJyl4eRupXJTRBAEdsR1gjvFd81dXPxIfDU6wLr3cqaLbXHlujxYOYprHzyvtABYDWuzTyDz0NeL2EucoMuLbVYp6OO7n6cNiyX3PypsEPrUerJCqFE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:efc37a3c-6ccc-4849-9233-e75b3dd3750b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:6dc6a47,CLOUDID:e21c11d2-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 2ba5a2e64e4d11efa6c87f6b4542ff6b-20240730
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 344468168; Tue, 30 Jul 2024 01:24:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 Jul 2024 16:24:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 Jul 2024 16:24:38 +0800
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"Catalin Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	"Steven Rostedt" <rostedt@goodmis.org>, Masami Hiramatsu
	<mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Richard Cochran <richardcochran@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liju-clr Chen
	<Liju-clr.Chen@mediatek.com>, Yingshiuan Pan <Yingshiuan.Pan@mediatek.com>,
	Ze-yu Wang <Ze-yu.Wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v12 14/24] virt: geniezone: Optimize performance of protected VM memory
Date: Tue, 30 Jul 2024 16:24:26 +0800
Message-ID: <20240730082436.9151-15-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
References: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.074600-8.000000
X-TMASE-MatchedRID: BJPdprqM2v0Z6xRDKEbMaNiE0w2W/7Q3/Hd4CUWIS/FpG3YgOhBCuQjF
	DcaUmBsUpS2cZKjpLToO4n8yU3xhRxUBkTmMruyZhK8o4aoss8pKPIx+MJF9o99RlPzeVuQQ3oz
	JRX7b4NkmfcNIN7VbRo1dWY54wxAFmllju3jrF/fk7k9yXJiqqqX1XMd/Sqvu/NpLPdn/hpoxus
	Ts+1Wml74pbmY0xUgVJaKl+0U6UWPiimiHGwu19nV7tdtvoibaA5bHoxALwINRRWt1xglknYIV2
	4CuYj50lB6IdnaWhV0QPp8asBKmaqNu8YiLlIJQ4bl1FkKDELd9LQinZ4QefJOK2Na/r7MIF70J
	Bot7Y8+OhzOa6g8Krf72guZeNShm6wcvbhSRMMYbIhYrQ5sWAdIO0mwFbwp1RqQRUKA613Q30l9
	P97+NEPf7eWFbcEvsWN8ezso0RAdc1X6J/UO/DcGQYFMiVRG5ehcPPz6UzEWlb5ogMngNpHOTEn
	5IiRSOUASbXCnDmH6UTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.074600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B10339F6233B01F2E931FCF81E6DD1DB48749ACE1068B55AB92AEB7547E394C62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_012450_039034_84BF87F1 
X-CRM114-Status: GOOD (  20.70  )
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

From: Yingshiuan Pan <yingshiuan.pan@mediatek.com>

The memory protection mechanism performs better with batch operations on
memory pages. To leverage this, we pre-allocate memory for VMs that are
set to protected mode. As a result, the memory protection mechanism can
proactively protect the pre-allocated memory in advance through batch
operations, leading to improved performance during VM booting.

Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Co-developed-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
---
 arch/arm64/geniezone/vm.c             | 127 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/gzvm_drv.h |   1 +
 2 files changed, 128 insertions(+)

diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
index 00c74a4bcfd7..db16716f5b8d 100644
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
@@ -201,6 +203,126 @@ static int gzvm_vm_ioctl_get_pvmfw_size(struct gzvm *gzvm,
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
@@ -222,6 +344,11 @@ static int gzvm_vm_ioctl_cap_pvm(struct gzvm *gzvm,
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
diff --git a/include/linux/soc/mediatek/gzvm_drv.h b/include/linux/soc/mediatek/gzvm_drv.h
index 982463eea4f6..54ac91670611 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -159,6 +159,7 @@ int gzvm_vm_ioctl_arch_enable_cap(struct gzvm *gzvm,
 
 int gzvm_gfn_to_hva_memslot(struct gzvm_memslot *memslot, u64 gfn,
 			    u64 *hva_memslot);
+int gzvm_vm_populate_mem_region(struct gzvm *gzvm, int slot_id);
 
 int gzvm_vm_ioctl_create_vcpu(struct gzvm *gzvm, u32 cpuid);
 int gzvm_arch_vcpu_update_one_reg(struct gzvm_vcpu *vcpu, __u64 reg_id,
-- 
2.18.0



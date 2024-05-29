Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0178AC25B7E
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 08:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYL3wrkvrAXPw01FI2QeqvUSGskmSGv64xXp8mgpjcs=; b=aFbPxhC4hP5U9hZ6WaQg2ZOQ2h
	QI05rhaVScGlPjjILfC8wezCJnvPFniusynjuBMDBQHuNa0aux+3dLXqfiYORGFYkDOyOw9t4YuYE
	DisNoO7pAqzsYyVZatza9awNslXeZWO2k3FFmpOtYOGp9rLmLNBY9Gv5ry4fCej87jE97ZGjnIeqZ
	g1jaMYlpRAA25/2BUvIASULVSQHLzkVg48O//UnAWnXYITgNePqWyBk/HNkHQet/gFvJXy+yBzdUN
	xB2EGlcrvyaZe0nScRpmcgGtYsnRkUoA+pXQ3fHzAmkY/pcQMeBRu7PHFMKytzn/l3IQtsIoROviy
	MpTDbW+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEwS-00000003U6D-2POH;
	Wed, 29 May 2024 08:45:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEuQ-00000003SuB-0TqT
	for linux-mediatek@bombadil.infradead.org;
	Wed, 29 May 2024 08:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pYL3wrkvrAXPw01FI2QeqvUSGskmSGv64xXp8mgpjcs=; b=rH+Eo6VyYB3SvhGWlfRl+DhztY
	V5IDqe6qVQVcR18DqlwktgQKmVqLgEs0ECOKU0QqHqz0KjGfwSKalhITcrm6VTuW39wwdMH+zj1n/
	nQrGGjW0pnSHT1TdhHfSX3VrJhb6wvm97u6/pYATAsKpVXBkNMEaASj2e4seL5CVNpYwNH1zIVP/m
	f8njAori1Lgm2ywqdxSKNr0kbQED5YZiuqZBikf2t/YYYwnvTH5CECCjAGIs1N607P1E6ippyC+e1
	kNcvlXUjxh2zAFRY5HQgH0wHyswPFErBXruGP0Kgc+0ug2oAaxH5IS44bhgwNnhutjb3uv8IW8if7
	qrOv/Oeg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEuK-0000000DU3k-3HIs
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 08:43:44 +0000
X-UUID: 7fe8063c1d9711efbf6c7d4f5c147266-20240529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pYL3wrkvrAXPw01FI2QeqvUSGskmSGv64xXp8mgpjcs=;
	b=pHglhfTU9zrpIu129HWdP8cMYEjhRQuUR2iCWEKHj9OTIKTp/dOx/ZEFgeAjp9osc2dSo5s0X4znV2nDbvZLIwlyCLC1GMVqLPRCFcZas9SEWVvEe9l6SdW3uaKMXDdBf9P5dwhR37uyWVUp5/j0BU2YibwoTvL1vWsWuZmk+TY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:76e36e38-23f6-49ec-8f84-034248d9e3ad,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-55
X-CID-META: VersionHash:393d96e,CLOUDID:f0f55b93-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7fe8063c1d9711efbf6c7d4f5c147266-20240529
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1096932383; Wed, 29 May 2024 01:43:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 May 2024 16:42:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 May 2024 16:42:42 +0800
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
	<linux-mediatek@lists.infradead.org>, David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v11 18/21] virt: geniezone: Add memory relinquish support
Date: Wed, 29 May 2024 16:42:36 +0800
Message-ID: <20240529084239.11478-19-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240529084239.11478-1-liju-clr.chen@mediatek.com>
References: <20240529084239.11478-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.534500-8.000000
X-TMASE-MatchedRID: FAqaJEPp0bkCsjHNBKjIykKcYi5Qw/RVQBnqdxuJ5SBGL0g1nVmkYXB4
	4IkzjfYyR3nAM7y+sxF8f1Kw27wTO10U3RPW+iLPdXz3l78F3Ym2McZY43zJ47UV4VfJ6SB08bf
	335SL+13q24xRTqfKLQ+BePuQCx01y6xJm0/fVizKUCo1O3wV1RyDrkIwjihb5AAb4Tu2gb7V9x
	7gL2l/MirVbSJ+KmbRu2drAUtvuhvIs9Qr+U/JpgKDWtq/hHcNf2g6KJZtxl1+YesuCgkiXA+Pz
	ND1U86eKsiucgwl76rEyq0r6O7kZx8TzIzimOwPC24oEZ6SpSk6XEE7Yhw4FtdqFOzu18YlojLT
	dIkOf14gJWE9THfcQahogXHJrheB5YOBLKwQ294=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.534500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3627735926F4BEE461CD89B0BF5DEB2753B0C85C4C4194128F4081C727E6C9202000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_094342_013400_7ADAE2C6 
X-CRM114-Status: GOOD (  18.22  )
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

From: Yi-De Wu <yi-de.wu@mediatek.com>

From: "Jerry Wang" <ze-yu.wang@mediatek.com>

Unpin the pages when VM relinquish the pages or is destroyed.

Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Signed-off-by: Liju-Clr Chen <liju-clr.chen@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 drivers/virt/geniezone/gzvm_exception.c | 23 ++++++++++++
 drivers/virt/geniezone/gzvm_mmu.c       | 49 +++++++++++++++++++++++++
 drivers/virt/geniezone/gzvm_vcpu.c      |  6 ++-
 include/linux/soc/mediatek/gzvm_drv.h   |  2 +
 include/uapi/linux/gzvm.h               |  5 +++
 5 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/virt/geniezone/gzvm_exception.c b/drivers/virt/geniezone/gzvm_exception.c
index 2f5c05045e61..cdfc99d24ded 100644
--- a/drivers/virt/geniezone/gzvm_exception.c
+++ b/drivers/virt/geniezone/gzvm_exception.c
@@ -37,3 +37,26 @@ bool gzvm_handle_guest_exception(struct gzvm_vcpu *vcpu)
 	else
 		return false;
 }
+
+/**
+ * gzvm_handle_guest_hvc() - Handle guest hvc
+ * @vcpu: Pointer to struct gzvm_vcpu struct
+ * Return:
+ * * true - This hvc has been processed, no need to back to VMM.
+ * * false - This hvc has not been processed, require userspace.
+ */
+bool gzvm_handle_guest_hvc(struct gzvm_vcpu *vcpu)
+{
+	unsigned long ipa;
+	int ret;
+
+	switch (vcpu->run->hypercall.args[0]) {
+	case GZVM_HVC_MEM_RELINQUISH:
+		ipa = vcpu->run->hypercall.args[1];
+		ret = gzvm_handle_relinquish(vcpu, ipa);
+		return (ret == 0) ? true : false;
+	default:
+		break;
+	}
+	return false;
+}
diff --git a/drivers/virt/geniezone/gzvm_mmu.c b/drivers/virt/geniezone/gzvm_mmu.c
index f6e4aca63f86..1c6966a0ed8e 100644
--- a/drivers/virt/geniezone/gzvm_mmu.c
+++ b/drivers/virt/geniezone/gzvm_mmu.c
@@ -29,6 +29,36 @@ static int gzvm_insert_ppage(struct gzvm *vm, struct gzvm_pinned_page *ppage)
 	return 0;
 }
 
+static int rb_ppage_cmp(const void *key, const struct rb_node *node)
+{
+	struct gzvm_pinned_page *p = container_of(node,
+						  struct gzvm_pinned_page,
+						  node);
+	phys_addr_t ipa = (phys_addr_t)key;
+
+	return (ipa < p->ipa) ? -1 : (ipa > p->ipa);
+}
+
+/* Invoker of this function is responsible for locking */
+static int gzvm_remove_ppage(struct gzvm *vm, phys_addr_t ipa)
+{
+	struct gzvm_pinned_page *ppage;
+	struct rb_node *node;
+
+	node = rb_find((void *)ipa, &vm->pinned_pages, rb_ppage_cmp);
+
+	if (node)
+		rb_erase(node, &vm->pinned_pages);
+	else
+		return 0;
+
+	ppage = container_of(node, struct gzvm_pinned_page, node);
+	unpin_user_pages_dirty_lock(&ppage->page, 1, true);
+	kfree(ppage);
+
+	return 0;
+}
+
 static int pin_one_page(struct gzvm *vm, unsigned long hva, u64 gpa,
 			struct page **out_page)
 {
@@ -77,6 +107,25 @@ static int pin_one_page(struct gzvm *vm, unsigned long hva, u64 gpa,
 	return ret;
 }
 
+/**
+ * gzvm_handle_relinquish() - Handle memory relinquish request from hypervisor
+ *
+ * @vcpu: Pointer to struct gzvm_vcpu_run in userspace
+ * @ipa: Start address(gpa) of a reclaimed page
+ *
+ * Return: Always return 0 because there are no cases of failure
+ */
+int gzvm_handle_relinquish(struct gzvm_vcpu *vcpu, phys_addr_t ipa)
+{
+	struct gzvm *vm = vcpu->gzvm;
+
+	mutex_lock(&vm->mem_lock);
+	gzvm_remove_ppage(vm, ipa);
+	mutex_unlock(&vm->mem_lock);
+
+	return 0;
+}
+
 int gzvm_vm_allocate_guest_page(struct gzvm *vm, struct gzvm_memslot *slot,
 				u64 gfn, u64 *pfn)
 {
diff --git a/drivers/virt/geniezone/gzvm_vcpu.c b/drivers/virt/geniezone/gzvm_vcpu.c
index 3ff9bc300fa6..8741088de479 100644
--- a/drivers/virt/geniezone/gzvm_vcpu.c
+++ b/drivers/virt/geniezone/gzvm_vcpu.c
@@ -113,12 +113,14 @@ static long gzvm_vcpu_run(struct gzvm_vcpu *vcpu, void __user *argp)
 		 * it's geniezone's responsibility to fill corresponding data
 		 * structure
 		 */
+		case GZVM_EXIT_HYPERCALL:
+			if (!gzvm_handle_guest_hvc(vcpu))
+				need_userspace = true;
+			break;
 		case GZVM_EXIT_EXCEPTION:
 			if (!gzvm_handle_guest_exception(vcpu))
 				need_userspace = true;
 			break;
-		case GZVM_EXIT_HYPERCALL:
-			fallthrough;
 		case GZVM_EXIT_DEBUG:
 			fallthrough;
 		case GZVM_EXIT_FAIL_ENTRY:
diff --git a/include/linux/soc/mediatek/gzvm_drv.h b/include/linux/soc/mediatek/gzvm_drv.h
index 7c6c1cde0d8d..b8cec9717606 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -208,6 +208,8 @@ int gzvm_arch_inform_exit(u16 vm_id);
 int gzvm_find_memslot(struct gzvm *vm, u64 gpa);
 int gzvm_handle_page_fault(struct gzvm_vcpu *vcpu);
 bool gzvm_handle_guest_exception(struct gzvm_vcpu *vcpu);
+int gzvm_handle_relinquish(struct gzvm_vcpu *vcpu, phys_addr_t ipa);
+bool gzvm_handle_guest_hvc(struct gzvm_vcpu *vcpu);
 
 int gzvm_arch_create_device(u16 vm_id, struct gzvm_create_device *gzvm_dev);
 int gzvm_arch_inject_irq(struct gzvm *gzvm, unsigned int vcpu_idx,
diff --git a/include/uapi/linux/gzvm.h b/include/uapi/linux/gzvm.h
index 0d38a0963cb7..5411357ec05e 100644
--- a/include/uapi/linux/gzvm.h
+++ b/include/uapi/linux/gzvm.h
@@ -195,6 +195,11 @@ enum {
 	GZVM_EXCEPTION_PAGE_FAULT = 0x1,
 };
 
+/* hypercall definitions of GZVM_EXIT_HYPERCALL */
+enum {
+	GZVM_HVC_MEM_RELINQUISH = 0xc6000009,
+};
+
 /**
  * struct gzvm_vcpu_run: Same purpose as kvm_run, this struct is
  *			 shared between userspace, kernel and
-- 
2.18.0



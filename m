Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A78CC04FF8
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 07:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LC87dnR4gfcXdaBOAT3shhtvIIRb+lI+dhpP2y8R/aY=; b=WkdUlQiECaiTmloKXXiG99qctR
	XuabObaI3M/ZmPA8XCK5Zqr/giFrzPUewxF7TBS6t5nz6cOlzJxLJRcXBbUfnhWtd8ICUt2ZLnD0f
	WORrmhLJZGI/3wxet0KjAeuWgSo7nejgLhQpFeJeyQYKbGZSMu+sxAiYhUzG049uEjDPRD66xTnFn
	cBXAUlBAmkfXJJh23w2aJl1LaWtbRlqnLG8pHPHs+i+xcfnfwQLtmaCJbM+BKkUjEA3+eyN5o6ZRV
	RJlKV8xfaM4v639sI2kd2QEjxtf7CfUm+wEDFtsJLxj5asvURDonM6OA5Lo7C9ZW17plMSG5Zeu6h
	BVgEzlkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAud-0000000FiAF-3ed9;
	Fri, 12 Apr 2024 07:01:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAsw-0000000Fh3X-3ZTG;
	Fri, 12 Apr 2024 06:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LC87dnR4gfcXdaBOAT3shhtvIIRb+lI+dhpP2y8R/aY=; b=I6xjZBf3IZMj6eO3GM9qqxAght
	kLKUfgmZ6drCtmnVXsdCIlKzu9EQLJsAjCoAE7ZRWuolEXlxweclZYCZn2RGkV6E9uxh1rnT6oxKD
	8qyeHwI80xTJ5BnjlR8Nd2IQMGWVXwUxNddlrVIs4Uh+ExXPRBSdODkTvnErj+hdnHs5j6obhHdU9
	+ixOREJVmSeqU9XwhS2yXZOD7OZ69ibyAjpgb3CwW71ch4iCLJb+19lTQPsSJuWeDKazDDhi6wCL8
	idVQ+4uWa8OI7uzxKdSMmuyMu8mOv5qXFfNuAq1N9TfLX7249TXkZP0IfwuawE2HxdsHLRf97j9yc
	CGaEVMiA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAsr-000000090b1-3TdZ;
	Fri, 12 Apr 2024 06:59:41 +0000
X-UUID: 3154d7d8f89a11ee96d5dfc950b7243d-20240411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LC87dnR4gfcXdaBOAT3shhtvIIRb+lI+dhpP2y8R/aY=;
	b=oZSXMw/e1vryRioYmQwC2G7oW5NBMrWdqGEHL53wN7JMVF+7DvWY7zy7lnQ+60CA7SsrWSUnBrWnUBNBqDuqr1d3cykx2fO7PY5tVcZLFvZl0iEmSDHWkSSG4C1y1dyXQoqmtfHHNucGf3om/Wb00bUj6ef91LU13TRMKNNbJjU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:21a6477d-045b-4e73-ad1e-1553c16304dc,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:170e1886-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3154d7d8f89a11ee96d5dfc950b7243d-20240411
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 145399740; Thu, 11 Apr 2024 23:59:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 14:57:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 14:57:47 +0800
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
Subject: [PATCH v10 18/21] virt: geniezone: Add memory relinquish support
Date: Fri, 12 Apr 2024 14:57:15 +0800
Message-ID: <20240412065718.29105-19-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240412065718.29105-1-yi-de.wu@mediatek.com>
References: <20240412065718.29105-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.551800-8.000000
X-TMASE-MatchedRID: FAqaJEPp0bkCsjHNBKjIykKcYi5Qw/RVQBnqdxuJ5SBGL0g1nVmkYXB4
	4IkzjfYyR3nAM7y+sxF8f1Kw27wTO10U3RPW+iLPdXz3l78F3Ym2McZY43zJ47UV4VfJ6SB08bf
	335SL+13q24xRTqfKLQ+BePuQCx01y6xJm0/fVizKUCo1O3wV1RyDrkIwjihb5AAb4Tu2gb7V9x
	7gL2l/Moe0QaYnbs58QL7ShyAYgenJQQZfFiWFPxafLXbshfogwJjn8yqLU6KY5NBG7YIbV4KOH
	gdS51oIq4A0qn3GQfW761Rb2kt6b5cFdomgH0lnFEUknJ/kEl7dB/CxWTRRu25FeHtsUoHul3P4
	vtU3w0Oe3DrA+or6WawY42hkJlU+pPll5dGQ6ZY+kK598Yf3Mg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.551800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0E5532D77F7151EEADFFA642BBD20F31D4C428C303978035A6B6B7EC86E9DAB52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_075938_504602_06898F4D 
X-CRM114-Status: GOOD (  17.96  )
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
index 475bc15b0689..07871ec74651 100644
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
index 7bc96cba1ecb..4ce3ec49adba 100644
--- a/drivers/virt/geniezone/gzvm_mmu.c
+++ b/drivers/virt/geniezone/gzvm_mmu.c
@@ -132,6 +132,36 @@ static int gzvm_insert_ppage(struct gzvm *vm, struct gzvm_pinned_page *ppage)
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
 static int pin_one_page(struct gzvm *vm, unsigned long hva, u64 gpa)
 {
 	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
@@ -178,6 +208,25 @@ static int pin_one_page(struct gzvm *vm, unsigned long hva, u64 gpa)
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
index e8d6f32f325c..e135d9388090 100644
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
index bf5f1abf8dbe..2e5e9c67cfa5 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -204,6 +204,8 @@ int gzvm_arch_inform_exit(u16 vm_id);
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



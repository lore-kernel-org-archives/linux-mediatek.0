Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C06CD54AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abrsKiV55spnn6ljLUviqqJXuNSbbJyTQEb3oKEPd3E=; b=C5PxVw3cpRwo7AFLn9kW/9vz8k
	X2vKPoezsUJ+Kso6NJuF0LWXnfBPxZVZj2P6yT7j0sNHMjRMi4IWeJG8LpCanTQPKbQhHG+/90PrD
	/JIGzYmiP9RRJ7fV7fw98oFRARRxOXvTVumpN/98+5HGfGeCFVbc8sxF1GjBkPwuQ6xDtX1ikLkal
	vjfGMF2b0sI8o5WSO+96nhUP5nEyI2/GkUCakNLcpMlBey+lsh86+rDf1tgaJLTFKZCpJZLcn6/ad
	WD+vQGc8yjtTUSAkAMXDqj5UNnxdFD0utwKWqgLelqYCZJn9DobCgzvRDCgU5S4Dm0Z5oG3Dsukfl
	Ihp91uRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYg6-000Fkz-2h;
	Tue, 19 Sep 2023 11:14:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYfR-000FCH-0V;
	Tue, 19 Sep 2023 11:13:23 +0000
X-UUID: 88491eb456dd11ee9b7791016c24628a-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=abrsKiV55spnn6ljLUviqqJXuNSbbJyTQEb3oKEPd3E=;
	b=kwWK3pWQm/CCuMy0DssWhk0QrFzUDAvEEltgs9Bbl6Tv1xxr31A90NAPTlRATno9zFwgkkdna9msWYbs2IlcqFuibF9ubN6HZJkTOK2DkwqpKK1DLwIqE/Ovzd7i/S/ECUeU5/jSM+gkZOIXiGvQGS7CiCFzE5uI5YgFdVJYCnc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:ad196cda-46d9-4f2c-bfb1-e1d228a6d2ad,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:2a2704bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 88491eb456dd11ee9b7791016c24628a-20230919
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2022056966; Tue, 19 Sep 2023 04:13:16 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 19:12:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 19:12:41 +0800
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
	"My Chuang" <my.chuang@mediatek.com>, Kevenny Hsieh
	<kevenny.hsieh@mediatek.com>, Willix Yeh <chi-shen.yeh@mediatek.com>,
	Liju-clr Chen <liju-clr.chen@mediatek.com>
Subject: [PATCH v6 11/15] virt: geniezone: Add memory region support
Date: Tue, 19 Sep 2023 19:12:06 +0800
Message-ID: <20230919111210.19615-12-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230919111210.19615-1-yi-de.wu@mediatek.com>
References: <20230919111210.19615-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.824400-8.000000
X-TMASE-MatchedRID: Z2Vi4n4mYCQw2a0RxGqSGyVypP66BP0QNNuh+5zmS68Cgjr7b0ytGZas
	fA8Y/RCF8B1Eq8wDKAEQzM3Grt8RghUBkTmMruyZhK8o4aoss8pKPIx+MJF9o99RlPzeVuQQpc2
	xgJAY6Lr/EdEp4HtkngHGJy9aPQkxszLAY5oHhBDd+fuf9kcapoLFgHaE9Li9myiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1R0bQh4y98h8kZqDRPD5Y8NH+tTsqW+n+woyq4xxEb8Maqtm5/umcYdASM
	74NIV6teXqdGP7hxdzcqVQKytsAjbUCbH0/l7fHQcFNZPwmQm10BNB20+SxH7f8mJY57oZddJaB
	DYald1lvF9+X2GEIHA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.824400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 003A8E40B735E028E828893E79ADC94490F280830873D6C0A4C22AC54B79F9762000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_041321_287891_3CEF3A02 
X-CRM114-Status: GOOD (  15.02  )
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

Hypervisor might need to know the precise purpose of each memory
region, so that it can provide specific memory protection. We add a new
uapi to pass address and size of a memory region and its purpose.

Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Liju-clr Chen <liju-clr.chen@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 arch/arm64/geniezone/gzvm_arch_common.h |  2 ++
 arch/arm64/geniezone/vm.c               | 10 ++++++++++
 drivers/virt/geniezone/gzvm_vm.c        |  7 +++++++
 include/linux/gzvm_drv.h                |  3 +++
 4 files changed, 22 insertions(+)

diff --git a/arch/arm64/geniezone/gzvm_arch_common.h b/arch/arm64/geniezone/gzvm_arch_common.h
index 051d8f49a1df..321f5dbcd616 100644
--- a/arch/arm64/geniezone/gzvm_arch_common.h
+++ b/arch/arm64/geniezone/gzvm_arch_common.h
@@ -22,6 +22,7 @@ enum {
 	GZVM_FUNC_PROBE = 12,
 	GZVM_FUNC_ENABLE_CAP = 13,
 	GZVM_FUNC_INFORM_EXIT = 14,
+	GZVM_FUNC_MEMREGION_PURPOSE = 15,
 	NR_GZVM_FUNC,
 };
 
@@ -44,6 +45,7 @@ enum {
 #define MT_HVC_GZVM_PROBE		GZVM_HCALL_ID(GZVM_FUNC_PROBE)
 #define MT_HVC_GZVM_ENABLE_CAP		GZVM_HCALL_ID(GZVM_FUNC_ENABLE_CAP)
 #define MT_HVC_GZVM_INFORM_EXIT		GZVM_HCALL_ID(GZVM_FUNC_INFORM_EXIT)
+#define MT_HVC_GZVM_MEMREGION_PURPOSE	GZVM_HCALL_ID(GZVM_FUNC_MEMREGION_PURPOSE)
 
 #define GIC_V3_NR_LRS			16
 
diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
index 6db5e7f0cf2f..1198f32f4785 100644
--- a/arch/arm64/geniezone/vm.c
+++ b/arch/arm64/geniezone/vm.c
@@ -104,6 +104,16 @@ int gzvm_arch_destroy_vm(u16 vm_id)
 				    0, 0, &res);
 }
 
+int gzvm_arch_memregion_purpose(struct gzvm *gzvm,
+				struct gzvm_userspace_memory_region *mem)
+{
+	struct arm_smccc_res res;
+
+	return gzvm_hypcall_wrapper(MT_HVC_GZVM_MEMREGION_PURPOSE, gzvm->vm_id,
+				    mem->guest_phys_addr, mem->memory_size,
+				    mem->flags, 0, 0, 0, &res);
+}
+
 static int gzvm_vm_arch_enable_cap(struct gzvm *gzvm,
 				   struct gzvm_enable_cap *cap,
 				   struct arm_smccc_res *res)
diff --git a/drivers/virt/geniezone/gzvm_vm.c b/drivers/virt/geniezone/gzvm_vm.c
index 7a935b1cf509..dfa03e850e8a 100644
--- a/drivers/virt/geniezone/gzvm_vm.c
+++ b/drivers/virt/geniezone/gzvm_vm.c
@@ -144,6 +144,7 @@ static int
 gzvm_vm_ioctl_set_memory_region(struct gzvm *gzvm,
 				struct gzvm_userspace_memory_region *mem)
 {
+	int ret;
 	struct vm_area_struct *vma;
 	struct gzvm_memslot *memslot;
 	unsigned long size;
@@ -168,6 +169,12 @@ gzvm_vm_ioctl_set_memory_region(struct gzvm *gzvm,
 	memslot->vma = vma;
 	memslot->flags = mem->flags;
 	memslot->slot_id = mem->slot;
+
+	ret = gzvm_arch_memregion_purpose(gzvm, mem);
+	if (ret) {
+		pr_err("Failed to config memory region for the specified purpose\n");
+		return -EFAULT;
+	}
 	return register_memslot_addr_range(gzvm, memslot);
 }
 
diff --git a/include/linux/gzvm_drv.h b/include/linux/gzvm_drv.h
index 406bc9f821b2..d35ca179b688 100644
--- a/include/linux/gzvm_drv.h
+++ b/include/linux/gzvm_drv.h
@@ -152,6 +152,9 @@ void gzvm_drv_irqfd_exit(void);
 int gzvm_vm_irqfd_init(struct gzvm *gzvm);
 void gzvm_vm_irqfd_release(struct gzvm *gzvm);
 
+int gzvm_arch_memregion_purpose(struct gzvm *gzvm,
+				struct gzvm_userspace_memory_region *mem);
+
 int gzvm_init_ioeventfd(struct gzvm *gzvm);
 int gzvm_ioeventfd(struct gzvm *gzvm, struct gzvm_ioeventfd *args);
 bool gzvm_ioevent_write(struct gzvm_vcpu *vcpu, __u64 addr, int len,
-- 
2.18.0



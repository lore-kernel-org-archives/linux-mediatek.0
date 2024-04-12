Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F569C04FF9
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 06:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cANxux1/htpGt52y+Aeho8J1w0VjkDggLi2Ws4XYndE=; b=gfMVoOefJyr783ikhtiaD4kYXb
	8u9vIsRUrG3Nyf5gPdrHo2rRP5SiVoOAzKHzcNTOjljxRswXuhNMs8b1PpNdJAF91a0nMRZxdesMK
	4Y08v3UOaNmZNrIelJlioPwHL0WSwlM81BOrIpkzylpsrWOFxL9SMv7DIXSMbPcfy3k8Wv037ivZX
	Bd0g689n2Kr8L7XTgY32hi1g5Qmsdl1CDhF1NeN814asgS81m223AcVLjqGN713K5e8PVqySnyy5h
	aSlA8LcMKemxp2kEaH52EudJjqAJ5qDRV8J74vNkrwwwxlMo7iRZL2Fgq3FuZe1RlMImdJmdf1Qww
	ZaQ6lRXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAt2-0000000Fh9I-2dBR;
	Fri, 12 Apr 2024 06:59:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAri-0000000FgBk-2tYG;
	Fri, 12 Apr 2024 06:58:32 +0000
X-UUID: 0cd02bb0f89a11eeac1957ae9f99f617-20240411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cANxux1/htpGt52y+Aeho8J1w0VjkDggLi2Ws4XYndE=;
	b=N53HGuQvVMK+LRhWwTTclNt75yZT2DWWbxmhYZ9/GfMJIMG7XK979gXNiWmS6TaCt6uXjSnjYcGqylaQIKvKMx9TfNJOMsP2lCt1tYa3KekGU97DxyCjNFT8qLGRC22m/D/t5RC/hZ7KIlJY/fKnvOxpV/p1v7JgAUo/eCWblM0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:05cec263-282b-4e36-8cbd-7c7fbcaa572c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:5b9c7e91-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0cd02bb0f89a11eeac1957ae9f99f617-20240411
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yi-de.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1277466312; Thu, 11 Apr 2024 23:58:21 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 14:57:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 14:57:48 +0800
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
	<peilun.suei@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>, Willix
 Yeh <chi-shen.yeh@mediatek.com>, Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: [PATCH v10 21/21] virt: geniezone: Enable PTP for synchronizing time between host and guest VMs
Date: Fri, 12 Apr 2024 14:57:18 +0800
Message-ID: <20240412065718.29105-22-yi-de.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240412065718.29105-1-yi-de.wu@mediatek.com>
References: <20240412065718.29105-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_235827_668449_F42711F6 
X-CRM114-Status: GOOD (  20.44  )
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

From: "Kevenny Hsieh" <kevenny.hsieh@mediatek.com>

Enabled Precision Time Protocol (PTP) for improved host-guest VM time
synchronization, optimizing operations needing precise clock sync in
virtual environment.

Signed-off-by: Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
---
 arch/arm64/geniezone/Makefile           |  2 +-
 arch/arm64/geniezone/gzvm_arch_common.h |  3 +
 arch/arm64/geniezone/hvc.c              | 73 +++++++++++++++++++++++++
 drivers/virt/geniezone/gzvm_exception.c |  3 +-
 include/linux/soc/mediatek/gzvm_drv.h   |  1 +
 include/uapi/linux/gzvm.h               |  1 +
 6 files changed, 80 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/geniezone/hvc.c

diff --git a/arch/arm64/geniezone/Makefile b/arch/arm64/geniezone/Makefile
index 0e4f1087f9de..553a64a926dc 100644
--- a/arch/arm64/geniezone/Makefile
+++ b/arch/arm64/geniezone/Makefile
@@ -4,6 +4,6 @@
 #
 include $(srctree)/drivers/virt/geniezone/Makefile
 
-gzvm-y += vm.o vcpu.o vgic.o
+gzvm-y += vm.o vcpu.o vgic.o hvc.o
 
 obj-$(CONFIG_MTK_GZVM) += gzvm.o
diff --git a/arch/arm64/geniezone/gzvm_arch_common.h b/arch/arm64/geniezone/gzvm_arch_common.h
index 192d023722e5..8f5d8528ab96 100644
--- a/arch/arm64/geniezone/gzvm_arch_common.h
+++ b/arch/arm64/geniezone/gzvm_arch_common.h
@@ -83,6 +83,8 @@ int gzvm_hypcall_wrapper(unsigned long a0, unsigned long a1,
  * @__pad: add an explicit '__u32 __pad;' in the middle to make it clear
  *         what the actual layout is.
  * @lr: The array of LRs(list registers).
+ * @vtimer_offset: The offset maintained by hypervisor that is host cycle count
+ *                 when guest VM startup.
  *
  * - Keep the same layout of hypervisor data struct.
  * - Sync list registers back for acking virtual device interrupt status.
@@ -91,6 +93,7 @@ struct gzvm_vcpu_hwstate {
 	__le32 nr_lrs;
 	__le32 __pad;
 	__le64 lr[GIC_V3_NR_LRS];
+	__le64 vtimer_offset;
 };
 
 static inline unsigned int
diff --git a/arch/arm64/geniezone/hvc.c b/arch/arm64/geniezone/hvc.c
new file mode 100644
index 000000000000..3d7f71f20dce
--- /dev/null
+++ b/arch/arm64/geniezone/hvc.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ */
+#include <linux/clocksource.h>
+#include <linux/kernel.h>
+#include <linux/timekeeping.h>
+#include <linux/soc/mediatek/gzvm_drv.h>
+#include "gzvm_arch_common.h"
+
+#define GZVM_PTP_VIRT_COUNTER 0
+#define GZVM_PTP_PHYS_COUNTER 1
+/**
+ * gzvm_handle_ptp_time() - Sync time between host and guest VM
+ * @vcpu: Pointer to struct gzvm_vcpu_run in userspace
+ * @counter: Counter type from guest VM
+ * Return: Always return 0 because there are no cases of failure
+ *
+ * The following register values will be passed to the guest VM
+ * for time synchronization:
+ * regs->x0 (upper 32 bits) wall clock time
+ * regs->x1 (lower 32 bits) wall clock time
+ * regs->x2 (upper 32 bits) cycles
+ * regs->x3 (lower 32 bits) cycles
+ */
+static int gzvm_handle_ptp_time(struct gzvm_vcpu *vcpu, int counter)
+{
+	struct system_time_snapshot snapshot;
+	u64 cycles = 0;
+
+	ktime_get_snapshot(&snapshot);
+
+	switch (counter) {
+	case GZVM_PTP_VIRT_COUNTER:
+		cycles = snapshot.cycles -
+			 le64_to_cpu(vcpu->hwstate->vtimer_offset);
+		break;
+	case GZVM_PTP_PHYS_COUNTER:
+		cycles = snapshot.cycles;
+		break;
+	default:
+		break;
+	}
+
+	vcpu->run->hypercall.args[0] = upper_32_bits(snapshot.real);
+	vcpu->run->hypercall.args[1] = lower_32_bits(snapshot.real);
+	vcpu->run->hypercall.args[2] = upper_32_bits(cycles);
+	vcpu->run->hypercall.args[3] = lower_32_bits(cycles);
+
+	return 0;
+}
+
+/**
+ * gzvm_arch_handle_guest_hvc() - Handle architecture-related guest hvc
+ * @vcpu: Pointer to struct gzvm_vcpu_run in userspace
+ * Return:
+ * * true - This hvc has been processed, no need to back to VMM.
+ * * false - This hvc has not been processed, require userspace.
+ */
+bool gzvm_arch_handle_guest_hvc(struct gzvm_vcpu *vcpu)
+{
+	int ret, counter;
+
+	switch (vcpu->run->hypercall.args[0]) {
+	case GZVM_HVC_PTP:
+		counter = vcpu->run->hypercall.args[1];
+		ret = gzvm_handle_ptp_time(vcpu, counter);
+		return (ret == 0) ? true : false;
+	default:
+		break;
+	}
+	return false;
+}
diff --git a/drivers/virt/geniezone/gzvm_exception.c b/drivers/virt/geniezone/gzvm_exception.c
index 07871ec74651..d824211f49a6 100644
--- a/drivers/virt/geniezone/gzvm_exception.c
+++ b/drivers/virt/geniezone/gzvm_exception.c
@@ -56,7 +56,6 @@ bool gzvm_handle_guest_hvc(struct gzvm_vcpu *vcpu)
 		ret = gzvm_handle_relinquish(vcpu, ipa);
 		return (ret == 0) ? true : false;
 	default:
-		break;
+		return gzvm_arch_handle_guest_hvc(vcpu);
 	}
-	return false;
 }
diff --git a/include/linux/soc/mediatek/gzvm_drv.h b/include/linux/soc/mediatek/gzvm_drv.h
index e123787cd70d..f6b7acca37b8 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -223,6 +223,7 @@ int gzvm_handle_page_fault(struct gzvm_vcpu *vcpu);
 bool gzvm_handle_guest_exception(struct gzvm_vcpu *vcpu);
 int gzvm_handle_relinquish(struct gzvm_vcpu *vcpu, phys_addr_t ipa);
 bool gzvm_handle_guest_hvc(struct gzvm_vcpu *vcpu);
+bool gzvm_arch_handle_guest_hvc(struct gzvm_vcpu *vcpu);
 
 int gzvm_arch_create_device(u16 vm_id, struct gzvm_create_device *gzvm_dev);
 int gzvm_arch_inject_irq(struct gzvm *gzvm, unsigned int vcpu_idx,
diff --git a/include/uapi/linux/gzvm.h b/include/uapi/linux/gzvm.h
index 5411357ec05e..1cf89213a383 100644
--- a/include/uapi/linux/gzvm.h
+++ b/include/uapi/linux/gzvm.h
@@ -197,6 +197,7 @@ enum {
 
 /* hypercall definitions of GZVM_EXIT_HYPERCALL */
 enum {
+	GZVM_HVC_PTP = 0x86000001,
 	GZVM_HVC_MEM_RELINQUISH = 0xc6000009,
 };
 
-- 
2.18.0



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE239C3DA61
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 08:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSQBBJ7AQKZdBkfp2FAnY7kwVlZnu569XeWUqxMUiLk=; b=k2BMIEK2UokWE71Cc/TNWHOUua
	NXZFEnMvmh1ybqxeXDplTcm1I6xZ1DUMqS4TmGb176iFJB2wnXbNuqOZd1ljzolOmnpvlmIZDaTpQ
	nlWoPc2VhdW5Oy1s15hCjuTMe0e2XQly1KEjOrNwEJdbbwz0PP4b5jzyJO+qHB5HkX/gmKdzguqFG
	8VlYnTpeiGcL4AcdhVum+DZdDh1XbmBIz95b6PMBHa9uxepuWazvP1tCLYs8Fl8fb7pIJiRrMVsoA
	Io7DfSGW7zWpEQ/RfHXJcq3fmJrH49JFKJys5FfcQEflrgz4xyJnWpVYvN5xfx6Y5oY7lAEminIKL
	9+jyzmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiJy-0000000EIrs-47Vl;
	Tue, 30 Jul 2024 08:35:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiAb-0000000EEMI-465b;
	Tue, 30 Jul 2024 08:25:25 +0000
X-UUID: 3f601c304e4d11ef955bff358274dad2-20240730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lSQBBJ7AQKZdBkfp2FAnY7kwVlZnu569XeWUqxMUiLk=;
	b=h746DiPUut30qfR91vZ6K+7Xo37iEXHacwlnhH5IEHXtS4iVxc+I+HuTrQMonepcyysD1Da8kILZSMEVJf1ZueZFcE5lgoG2dWFtnEy+SqE+R2dslAkeWU1OCBdpAEYovx8cVZJmwNDppevar0RwHy2bPRApGRkgIiX6IcRkMN4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:3ba8d85a-96da-4fcb-bf17-25059d0843f5,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:ddd1edd5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3f601c304e4d11ef955bff358274dad2-20240730
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2063065523; Tue, 30 Jul 2024 01:25:15 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 Jul 2024 16:24:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 Jul 2024 16:24:40 +0800
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Richard Cochran
	<richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liju-clr Chen <Liju-clr.Chen@mediatek.com>, Yingshiuan Pan
	<Yingshiuan.Pan@mediatek.com>, Ze-yu Wang <Ze-yu.Wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v12 21/24] virt: geniezone: Enable PTP for synchronizing time between host and guest VMs
Date: Tue, 30 Jul 2024 16:24:33 +0800
Message-ID: <20240730082436.9151-22-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
References: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_012522_076995_1E6E9B97 
X-CRM114-Status: GOOD (  21.12  )
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

From: Kevenny Hsieh <kevenny.hsieh@mediatek.com>

Enabled Precision Time Protocol (PTP) for improved host-guest VM time
synchronization, optimizing operations needing precise clock sync in
virtual environment.

Signed-off-by: Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
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
index cdfc99d24ded..5ffee863e378 100644
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
index 7c0ccbcd114f..4518f3b0a69b 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -227,6 +227,7 @@ int gzvm_handle_page_fault(struct gzvm_vcpu *vcpu);
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



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F674C3DA61
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 08:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7De8UykoU1iLwqrN2Y2tNVc9BcKptSGeGp2fZE8S0g=; b=3+fWyemikeu5eATV8mGXKDW6Kw
	Y87OTuZD4PcOqn+1mJCWk9ueDreWa/gSwpe0ngwSqjEmCKw+VVkxmDxXLoLBQPFn3+Os5LfoRkf1K
	Ati7qvx+sXiUIP2SGhtmYI1Wt1/vH1ZBXuxoCvPY/G2JEa4CJdmzFv2EFuHOxeaDeO+z/a6mIXJbk
	sPt1hg9iGMl+4gDe7qekbxyiKUzcCfamxYAZGh4MDMuv8A/hCMbv8vnvL6DOfBQJkkMT0rzj8imk3
	Y6r0aIF8ycC2fU62Ekc1F9Uwa8Mm4IWzKNTMR2wHImLT1s+sY6nvECMN62+UDXSEON9EsJ6E5oJGj
	IOcEvgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiEa-0000000EGOI-33yD;
	Tue, 30 Jul 2024 08:29:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiA3-0000000EE5p-2O5g;
	Tue, 30 Jul 2024 08:24:53 +0000
X-UUID: 2c029fbe4e4d11efa6c87f6b4542ff6b-20240730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=I7De8UykoU1iLwqrN2Y2tNVc9BcKptSGeGp2fZE8S0g=;
	b=Ib/BPSE5PZcuGbTSfezU2PCwddIUsllJtKbaw5WmUmbRFk9o7zExNn2kUFtP1nY3rluLn25bfwfg0Gn9NKPovXVDZyq72pUz+DU3QNTmNHD5A6tLDLAqb6WCaG/hnGqvLI+pmqYHXpmpvEqA0FQpmQT5cJBeC6oi6nYeQVZ2UM4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:9b277ea5-eb65-40d7-b0df-3432547dca85,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:6dc6a47,CLOUDID:83970a0e-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2c029fbe4e4d11efa6c87f6b4542ff6b-20240730
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1675648215; Tue, 30 Jul 2024 01:24:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
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
Subject: [PATCH v12 22/24] virt: geniezone: Add support for virtual timer migration
Date: Tue, 30 Jul 2024 16:24:34 +0800
Message-ID: <20240730082436.9151-23-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
References: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_012448_142799_36C41797 
X-CRM114-Status: GOOD (  22.82  )
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

From: Willix Yeh <chi-shen.yeh@mediatek.com>

Introduce a mechanism to migrate the ARM64 virtual timer from the
guest VM to the host Linux system when the execution context switches
from the guest VM to the host. Ensure that the guest VM's virtual
timer continues to operate seamlessly after the context switch, given
that ARM64 has only one virtual timer.

Translate the remaining time before the VM timer expires into the host
Linux system by setting the remaining time on an hrtimer. This allows
the guest VM to maintain its timer operations without interruption.

Enable seamless timer operation during idle states. When a VM enters
an idle state and the execution context returns to the host Linux,
ensure that the timer continues to operate seamlessly, preventing
disruption to the guest VM's timing operations.

Signed-off-by: Willix Yeh <chi-shen.yeh@mediatek.com>
Co-developed-by: Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Signed-off-by: Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
---
 arch/arm64/geniezone/gzvm_arch_common.h | 15 +++++++++++++++
 arch/arm64/geniezone/vcpu.c             | 16 ++++++++++++++++
 arch/arm64/geniezone/vm.c               | 24 ++++++++++++++++++++++++
 drivers/virt/geniezone/gzvm_main.c      |  4 ++++
 drivers/virt/geniezone/gzvm_vcpu.c      | 24 ++++++++++++++++++++++++
 include/linux/soc/mediatek/gzvm_drv.h   |  7 +++++++
 6 files changed, 90 insertions(+)

diff --git a/arch/arm64/geniezone/gzvm_arch_common.h b/arch/arm64/geniezone/gzvm_arch_common.h
index 8f5d8528ab96..df16e33f6b74 100644
--- a/arch/arm64/geniezone/gzvm_arch_common.h
+++ b/arch/arm64/geniezone/gzvm_arch_common.h
@@ -7,6 +7,7 @@
 #define __GZVM_ARCH_COMMON_H__
 
 #include <linux/arm-smccc.h>
+#include <linux/clocksource.h>
 
 enum {
 	GZVM_FUNC_CREATE_VM = 0,
@@ -85,6 +86,10 @@ int gzvm_hypcall_wrapper(unsigned long a0, unsigned long a1,
  * @lr: The array of LRs(list registers).
  * @vtimer_offset: The offset maintained by hypervisor that is host cycle count
  *                 when guest VM startup.
+ * @vtimer_delay: The remaining time before the next timer tick is triggered
+ *                while the VM is running.
+ * @vtimer_migrate: Indicates whether the guest virtual timer needs to be
+ *                  migrated to the host software timer.
  *
  * - Keep the same layout of hypervisor data struct.
  * - Sync list registers back for acking virtual device interrupt status.
@@ -94,8 +99,18 @@ struct gzvm_vcpu_hwstate {
 	__le32 __pad;
 	__le64 lr[GIC_V3_NR_LRS];
 	__le64 vtimer_offset;
+	__le64 vtimer_delay;
+	__le32 vtimer_migrate;
 };
 
+struct timecycle {
+	u32 mult;
+	u32 shift;
+};
+
+u32 gzvm_vtimer_get_clock_mult(void);
+u32 gzvm_vtimer_get_clock_shift(void);
+
 static inline unsigned int
 assemble_vm_vcpu_tuple(u16 vmid, u16 vcpuid)
 {
diff --git a/arch/arm64/geniezone/vcpu.c b/arch/arm64/geniezone/vcpu.c
index e12ea9cb4941..595f16904b99 100644
--- a/arch/arm64/geniezone/vcpu.c
+++ b/arch/arm64/geniezone/vcpu.c
@@ -11,6 +11,22 @@
 #include <linux/soc/mediatek/gzvm_drv.h>
 #include "gzvm_arch_common.h"
 
+u64 gzvm_vcpu_arch_get_timer_delay_ns(struct gzvm_vcpu *vcpu)
+{
+	u64 ns;
+
+	if (vcpu->hwstate->vtimer_migrate) {
+		ns = clocksource_cyc2ns(le64_to_cpu(vcpu->hwstate->vtimer_delay),
+					gzvm_vtimer_get_clock_mult(),
+					gzvm_vtimer_get_clock_shift());
+	} else {
+		ns = 0;
+	}
+
+	/* 0: no migrate, otherwise: migrate  */
+	return ns;
+}
+
 int gzvm_arch_vcpu_update_one_reg(struct gzvm_vcpu *vcpu, __u64 reg_id,
 				  bool is_write, __u64 *data)
 {
diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
index 618de2ff9471..549d8611c8d2 100644
--- a/arch/arm64/geniezone/vm.c
+++ b/arch/arm64/geniezone/vm.c
@@ -15,6 +15,18 @@
 
 #define PAR_PA47_MASK GENMASK_ULL(47, 12)
 
+static struct timecycle clock_scale_factor;
+
+u32 gzvm_vtimer_get_clock_mult(void)
+{
+	return clock_scale_factor.mult;
+}
+
+u32 gzvm_vtimer_get_clock_shift(void)
+{
+	return clock_scale_factor.shift;
+}
+
 /**
  * gzvm_hypcall_wrapper() - the wrapper for hvc calls
  * @a0: arguments passed in registers 0
@@ -81,6 +93,18 @@ int gzvm_arch_probe(void)
 	return 0;
 }
 
+int gzvm_arch_drv_init(void)
+{
+	/* timecycle init mult shift */
+	clocks_calc_mult_shift(&clock_scale_factor.mult,
+			       &clock_scale_factor.shift,
+			       arch_timer_get_cntfrq(),
+			       NSEC_PER_SEC,
+			       30);
+
+	return 0;
+}
+
 int gzvm_arch_set_memregion(u16 vm_id, size_t buf_size,
 			    phys_addr_t region)
 {
diff --git a/drivers/virt/geniezone/gzvm_main.c b/drivers/virt/geniezone/gzvm_main.c
index 9d4e08f3abbc..3529593f8870 100644
--- a/drivers/virt/geniezone/gzvm_main.c
+++ b/drivers/virt/geniezone/gzvm_main.c
@@ -102,6 +102,10 @@ static int gzvm_drv_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	ret = gzvm_arch_drv_init();
+	if (ret)
+		return ret;
+
 	ret = misc_register(&gzvm_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/virt/geniezone/gzvm_vcpu.c b/drivers/virt/geniezone/gzvm_vcpu.c
index 3b146148abf3..ba85a6ae04a0 100644
--- a/drivers/virt/geniezone/gzvm_vcpu.c
+++ b/drivers/virt/geniezone/gzvm_vcpu.c
@@ -16,6 +16,28 @@
 /* maximum size needed for holding an integer */
 #define ITOA_MAX_LEN 12
 
+static enum hrtimer_restart gzvm_vtimer_expire(struct hrtimer *hrt)
+{
+	return HRTIMER_NORESTART;
+}
+
+static void gzvm_vtimer_init(struct gzvm_vcpu *vcpu)
+{
+	/* gzvm_vtimer init based on hrtimer */
+	hrtimer_init(&vcpu->gzvm_vtimer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
+	vcpu->gzvm_vtimer.function = gzvm_vtimer_expire;
+}
+
+void gzvm_vtimer_set(struct gzvm_vcpu *vcpu, u64 ns)
+{
+	hrtimer_start(&vcpu->gzvm_vtimer, ktime_add_ns(ktime_get(), ns), HRTIMER_MODE_ABS_HARD);
+}
+
+void gzvm_vtimer_release(struct gzvm_vcpu *vcpu)
+{
+	hrtimer_cancel(&vcpu->gzvm_vtimer);
+}
+
 static long gzvm_vcpu_update_one_reg(struct gzvm_vcpu *vcpu,
 				     void __user *argp,
 				     bool is_write)
@@ -193,6 +215,7 @@ static void gzvm_destroy_vcpu(struct gzvm_vcpu *vcpu)
 	if (!vcpu)
 		return;
 
+	hrtimer_cancel(&vcpu->gzvm_vtimer);
 	gzvm_arch_destroy_vcpu(vcpu->gzvm->vm_id, vcpu->vcpuid);
 	/* clean guest's data */
 	memset(vcpu->run, 0, GZVM_VCPU_RUN_MAP_SIZE);
@@ -271,6 +294,7 @@ int gzvm_vm_ioctl_create_vcpu(struct gzvm *gzvm, u32 cpuid)
 		goto free_vcpu_run;
 	gzvm->vcpus[cpuid] = vcpu;
 
+	gzvm_vtimer_init(vcpu);
 	return ret;
 
 free_vcpu_run:
diff --git a/include/linux/soc/mediatek/gzvm_drv.h b/include/linux/soc/mediatek/gzvm_drv.h
index 4518f3b0a69b..3c460281cdd4 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -107,6 +107,7 @@ struct gzvm_vcpu {
 	struct mutex lock;
 	struct gzvm_vcpu_run *run;
 	struct gzvm_vcpu_hwstate *hwstate;
+	struct hrtimer gzvm_vtimer;
 };
 
 struct gzvm_pinned_page {
@@ -214,11 +215,17 @@ int gzvm_vm_allocate_guest_page(struct gzvm *gzvm, struct gzvm_memslot *slot,
 int gzvm_vm_ioctl_create_vcpu(struct gzvm *gzvm, u32 cpuid);
 int gzvm_arch_vcpu_update_one_reg(struct gzvm_vcpu *vcpu, __u64 reg_id,
 				  bool is_write, __u64 *data);
+int gzvm_arch_drv_init(void);
 int gzvm_arch_create_vcpu(u16 vm_id, int vcpuid, void *run);
 int gzvm_arch_vcpu_run(struct gzvm_vcpu *vcpu, __u64 *exit_reason);
 int gzvm_arch_destroy_vcpu(u16 vm_id, int vcpuid);
 int gzvm_arch_inform_exit(u16 vm_id);
 
+u64 gzvm_vcpu_arch_get_timer_delay_ns(struct gzvm_vcpu *vcpu);
+
+void gzvm_vtimer_set(struct gzvm_vcpu *vcpu, u64 ns);
+void gzvm_vtimer_release(struct gzvm_vcpu *vcpu);
+
 int gzvm_drv_debug_init(void);
 void gzvm_drv_debug_exit(void);
 
-- 
2.18.0



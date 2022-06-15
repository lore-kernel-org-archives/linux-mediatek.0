Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF887C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 02:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OR7ruSFDqaNlWBtuomaztWbDcMOhim0SqqZ8UBf27rA=; b=aPe9LhCQXy00IL
	1EUtoFM1aZKhfP8tpii6jXTnret7Vhzy4ay9fCPquNzryauPnR0AbAz5SxcoLFTpHuIGZNi1UOrSg
	cvg18oD+Krio392WTmLPs9X9pbOQdxNfvom6Cl0FryblEWWJJBHyZrQdHVLaF4DBdTI3sSDc7pMYd
	W2IxVnGOm5x5e2nwPzJyVpJokXLPg0T7Tto1lISEPoqI2iWAxQoU7ZfJS7OfrZSyx1f5EoGCT9Wd0
	Xa1w4RKW6dBT8SowZnfHeDPCOg3u6s5WWYU21s/R7pNviq0ut/5dvtRxkUUmPBUEE315YnnjuicYD
	ODhI6crnrRjVFTbn6mgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1IOy-00CAHp-1K; Wed, 15 Jun 2022 02:05:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1IOm-00CADi-RT; Wed, 15 Jun 2022 02:04:50 +0000
X-UUID: 06ad5e0b985243b1846ef9fd238aa489-20220614
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:507f223c-77df-432e-9ad1-ace764171c1e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:52288048-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 06ad5e0b985243b1846ef9fd238aa489-20220614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1930077269; Tue, 14 Jun 2022 19:02:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jun 2022 18:59:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 15 Jun 2022 09:59:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 15 Jun 2022 09:59:50 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <yj.chiang@mediatek.com>, Jean-Philippe Brucker
	<jean-philippe@linaro.org>, <stable@vger.kernel.org>, Mark-PK Tsai
	<mark-pk.tsai@mediatek.com>, Masami Hiramatsu <mhiramat@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 5.4] arm64: kprobes: Use BRK instead of single-step when executing instructions out-of-line
Date: Wed, 15 Jun 2022 09:59:23 +0800
Message-ID: <20220615015928.19181-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_190448_940609_26C85396 
X-CRM114-Status: GOOD (  23.62  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

commit 7ee31a3aa8f490c6507bc4294df6b70bed1c593e upstream.

Commit 36dadef23fcc ("kprobes: Init kprobes in early_initcall") enabled
using kprobes from early_initcall. Unfortunately at this point the
hardware debug infrastructure is not operational. The OS lock may still
be locked, and the hardware watchpoints may have unknown values when
kprobe enables debug monitors to single-step instructions.

Rather than using hardware single-step, append a BRK instruction after
the instruction to be executed out-of-line.

Fixes: 36dadef23fcc ("kprobes: Init kprobes in early_initcall")
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Link: https://lore.kernel.org/r/20201103134900.337243-1-jean-philippe@linaro.org
Signed-off-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/lkml/20220610063619.7921-1-mark-pk.tsai@mediatek.com/
Cc: stable@vger.kernel.org
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 arch/arm64/include/asm/brk-imm.h        |  2 +
 arch/arm64/include/asm/debug-monitors.h |  1 +
 arch/arm64/include/asm/kprobes.h        |  2 +-
 arch/arm64/kernel/probes/kprobes.c      | 69 +++++++++----------------
 4 files changed, 27 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/include/asm/brk-imm.h b/arch/arm64/include/asm/brk-imm.h
index e3d47b52161d..ec7720dbe2c8 100644
--- a/arch/arm64/include/asm/brk-imm.h
+++ b/arch/arm64/include/asm/brk-imm.h
@@ -10,6 +10,7 @@
  * #imm16 values used for BRK instruction generation
  * 0x004: for installing kprobes
  * 0x005: for installing uprobes
+ * 0x006: for kprobe software single-step
  * Allowed values for kgdb are 0x400 - 0x7ff
  * 0x100: for triggering a fault on purpose (reserved)
  * 0x400: for dynamic BRK instruction
@@ -19,6 +20,7 @@
  */
 #define KPROBES_BRK_IMM			0x004
 #define UPROBES_BRK_IMM			0x005
+#define KPROBES_BRK_SS_IMM		0x006
 #define FAULT_BRK_IMM			0x100
 #define KGDB_DYN_DBG_BRK_IMM		0x400
 #define KGDB_COMPILED_DBG_BRK_IMM	0x401
diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
index d825e3585e28..0253691c4b3a 100644
--- a/arch/arm64/include/asm/debug-monitors.h
+++ b/arch/arm64/include/asm/debug-monitors.h
@@ -53,6 +53,7 @@
 
 /* kprobes BRK opcodes with ESR encoding  */
 #define BRK64_OPCODE_KPROBES	(AARCH64_BREAK_MON | (KPROBES_BRK_IMM << 5))
+#define BRK64_OPCODE_KPROBES_SS	(AARCH64_BREAK_MON | (KPROBES_BRK_SS_IMM << 5))
 /* uprobes BRK opcodes with ESR encoding  */
 #define BRK64_OPCODE_UPROBES	(AARCH64_BREAK_MON | (UPROBES_BRK_IMM << 5))
 
diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kprobes.h
index 97e511d645a2..8699ce30f587 100644
--- a/arch/arm64/include/asm/kprobes.h
+++ b/arch/arm64/include/asm/kprobes.h
@@ -16,7 +16,7 @@
 #include <linux/percpu.h>
 
 #define __ARCH_WANT_KPROBES_INSN_SLOT
-#define MAX_INSN_SIZE			1
+#define MAX_INSN_SIZE			2
 
 #define flush_insn_slot(p)		do { } while (0)
 #define kretprobe_blacklist_size	0
diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index c4452827419b..b41ed2f907b0 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -36,25 +36,16 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
 static void __kprobes
 post_kprobe_handler(struct kprobe_ctlblk *, struct pt_regs *);
 
-static int __kprobes patch_text(kprobe_opcode_t *addr, u32 opcode)
-{
-	void *addrs[1];
-	u32 insns[1];
-
-	addrs[0] = addr;
-	insns[0] = opcode;
-
-	return aarch64_insn_patch_text(addrs, insns, 1);
-}
-
 static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 {
+	kprobe_opcode_t *addr = p->ainsn.api.insn;
+	void *addrs[] = {addr, addr + 1};
+	u32 insns[] = {p->opcode, BRK64_OPCODE_KPROBES_SS};
+
 	/* prepare insn slot */
-	patch_text(p->ainsn.api.insn, p->opcode);
+	aarch64_insn_patch_text(addrs, insns, 2);
 
-	flush_icache_range((uintptr_t) (p->ainsn.api.insn),
-			   (uintptr_t) (p->ainsn.api.insn) +
-			   MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
+	flush_icache_range((uintptr_t)addr, (uintptr_t)(addr + MAX_INSN_SIZE));
 
 	/*
 	 * Needs restoring of return address after stepping xol.
@@ -134,13 +125,18 @@ void *alloc_insn_page(void)
 /* arm kprobe: install breakpoint in text */
 void __kprobes arch_arm_kprobe(struct kprobe *p)
 {
-	patch_text(p->addr, BRK64_OPCODE_KPROBES);
+	void *addr = p->addr;
+	u32 insn = BRK64_OPCODE_KPROBES;
+
+	aarch64_insn_patch_text(&addr, &insn, 1);
 }
 
 /* disarm kprobe: remove breakpoint from text */
 void __kprobes arch_disarm_kprobe(struct kprobe *p)
 {
-	patch_text(p->addr, p->opcode);
+	void *addr = p->addr;
+
+	aarch64_insn_patch_text(&addr, &p->opcode, 1);
 }
 
 void __kprobes arch_remove_kprobe(struct kprobe *p)
@@ -169,20 +165,15 @@ static void __kprobes set_current_kprobe(struct kprobe *p)
 }
 
 /*
- * Interrupts need to be disabled before single-step mode is set, and not
- * reenabled until after single-step mode ends.
- * Without disabling interrupt on local CPU, there is a chance of
- * interrupt occurrence in the period of exception return and  start of
- * out-of-line single-step, that result in wrongly single stepping
- * into the interrupt handler.
+ * Mask all of DAIF while executing the instruction out-of-line, to keep things
+ * simple and avoid nesting exceptions. Interrupts do have to be disabled since
+ * the kprobe state is per-CPU and doesn't get migrated.
  */
 static void __kprobes kprobes_save_local_irqflag(struct kprobe_ctlblk *kcb,
 						struct pt_regs *regs)
 {
 	kcb->saved_irqflag = regs->pstate & DAIF_MASK;
-	regs->pstate |= PSR_I_BIT;
-	/* Unmask PSTATE.D for enabling software step exceptions. */
-	regs->pstate &= ~PSR_D_BIT;
+	regs->pstate |= DAIF_MASK;
 }
 
 static void __kprobes kprobes_restore_local_irqflag(struct kprobe_ctlblk *kcb,
@@ -225,10 +216,7 @@ static void __kprobes setup_singlestep(struct kprobe *p,
 		slot = (unsigned long)p->ainsn.api.insn;
 
 		set_ss_context(kcb, slot);	/* mark pending ss */
-
-		/* IRQs and single stepping do not mix well. */
 		kprobes_save_local_irqflag(kcb, regs);
-		kernel_enable_single_step(regs);
 		instruction_pointer_set(regs, slot);
 	} else {
 		/* insn simulation */
@@ -279,12 +267,8 @@ post_kprobe_handler(struct kprobe_ctlblk *kcb, struct pt_regs *regs)
 	}
 	/* call post handler */
 	kcb->kprobe_status = KPROBE_HIT_SSDONE;
-	if (cur->post_handler)	{
-		/* post_handler can hit breakpoint and single step
-		 * again, so we enable D-flag for recursive exception.
-		 */
+	if (cur->post_handler)
 		cur->post_handler(cur, regs, 0);
-	}
 
 	reset_current_kprobe();
 }
@@ -308,8 +292,6 @@ int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)
 		if (!instruction_pointer(regs))
 			BUG();
 
-		kernel_disable_single_step();
-
 		if (kcb->kprobe_status == KPROBE_REENTER)
 			restore_previous_kprobe(kcb);
 		else
@@ -371,10 +353,6 @@ static void __kprobes kprobe_handler(struct pt_regs *regs)
 			 * pre-handler and it returned non-zero, it will
 			 * modify the execution path and no need to single
 			 * stepping. Let's just reset current kprobe and exit.
-			 *
-			 * pre_handler can hit a breakpoint and can step thru
-			 * before return, keep PSTATE D-flag enabled until
-			 * pre_handler return back.
 			 */
 			if (!p->pre_handler || !p->pre_handler(p, regs)) {
 				setup_singlestep(p, regs, kcb, 0);
@@ -405,7 +383,7 @@ kprobe_ss_hit(struct kprobe_ctlblk *kcb, unsigned long addr)
 }
 
 static int __kprobes
-kprobe_single_step_handler(struct pt_regs *regs, unsigned int esr)
+kprobe_breakpoint_ss_handler(struct pt_regs *regs, unsigned int esr)
 {
 	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
 	int retval;
@@ -415,16 +393,15 @@ kprobe_single_step_handler(struct pt_regs *regs, unsigned int esr)
 
 	if (retval == DBG_HOOK_HANDLED) {
 		kprobes_restore_local_irqflag(kcb, regs);
-		kernel_disable_single_step();
-
 		post_kprobe_handler(kcb, regs);
 	}
 
 	return retval;
 }
 
-static struct step_hook kprobes_step_hook = {
-	.fn = kprobe_single_step_handler,
+static struct break_hook kprobes_break_ss_hook = {
+	.imm = KPROBES_BRK_SS_IMM,
+	.fn = kprobe_breakpoint_ss_handler,
 };
 
 static int __kprobes
@@ -568,7 +545,7 @@ int __kprobes arch_trampoline_kprobe(struct kprobe *p)
 int __init arch_init_kprobes(void)
 {
 	register_kernel_break_hook(&kprobes_break_hook);
-	register_kernel_step_hook(&kprobes_step_hook);
+	register_kernel_break_hook(&kprobes_break_ss_hook);
 
 	return 0;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

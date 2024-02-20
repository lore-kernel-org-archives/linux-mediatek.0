Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E14C48BC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Feb 2024 11:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+QxxzZLK77uop3c9oawidI46vMLzFAmM3R/Jc/f/t6g=; b=liWaojQ0sik6y4DpnAzhyxFaOI
	b5wGhPUFLaZezhwgAggWA159RsW4C+OxES3t7SkrBSPtot4wAfmnZNGS/Yav2InpEdioS3m2MsTH4
	XIMHgYJ7oRrZO9DrmevVUvKpxIOAmys6M9Yzx09McPa6i7siuFmfO8iwWar6dZXLgWpOgnlquRkbk
	FDIweF/3mtLClK2FMAleWZ86IEWr1yvAHP0HuUGWuUXAsi5SHOk8hT7657AyZo8MpNE35LECSHQsu
	SDbOalqiRWm8J7FF5SM6QYuZe4LN5IDZQpqSonQsNgF4GKfD6tzllJS9rTnnDF5AhjdpLw5BhbKG/
	gVx8X8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOO5-0000000ETWT-02cM;
	Tue, 20 Feb 2024 11:34:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOO2-0000000ETW0-0Xi7;
	Tue, 20 Feb 2024 11:34:11 +0000
X-UUID: f2958044cfe311eea0bf134e88e6c2dc-20240220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+QxxzZLK77uop3c9oawidI46vMLzFAmM3R/Jc/f/t6g=;
	b=Dnza6CPqJjywHPFra5TqQTJQ1LeG6/ImxaeVwOUAh7wP87eFzF4Tz3anfYMVuNjphik1hM59YfOkGPsPflxDu7r9J4yZNydDuIhJe4uaCkteKxra66Ih4M7/gRVwvbUcsNt+92DN3FK9yCA/GpR5LZ3Qrt8Spgwaj+oafP8Tk/w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:cc392ea6-e7f7-4de9-abbb-dda273fff1ff,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:fe4afffe-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f2958044cfe311eea0bf134e88e6c2dc-20240220
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1898438236; Tue, 20 Feb 2024 04:34:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 20 Feb 2024 19:33:59 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 20 Feb 2024 19:33:59 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Russell King <linux@armlinux.org.uk>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <keescook@chromium.org>, 'Russell King '
	<rmk+kernel@armlinux.org.uk>, Haibo Li <haibo.li@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<xiaoming.yu@mediatek.com>
Subject: [PATCH] arm:dump the stack usage after stack overflows
Date: Tue, 20 Feb 2024 19:33:41 +0800
Message-ID: <20240220113341.24523-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.259300-8.000000
X-TMASE-MatchedRID: 8+gsAlLbNEF+7Gr2hULRCqKa0xB73sAA+XUEs7n10vKJPgzJn7/hAGb6
	PphVtfZgGeqWAcGRXwp6n3hIvN5dLfJMF6pylZNWvbFZsqMF9Y+7nrAU9KQxUWHZ+cd7VyKXDZ/
	b5zl6q6ZvvvRcuB/rD3QeHo/CecVW4En2Lqvhr2JIcJTn2HkqsRQc4z1hNYyAIGcJoOzI5aejxY
	yRBa/qJcFwgTvxipFa9xS3mVzWUuCgZHIBpyeFpsZXc7x4uVfJF6jjf600DUaQhh+9h/pw1sXZP
	5r1GmcmftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.259300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0DD9B401C1862381109C0AAE87F93DB93AFC9C71464106ED3F9A0360F3580B692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_033410_202760_3A3B6098 
X-CRM114-Status: GOOD (  12.14  )
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

With the help of vmap stack,it is able to detect stack overflow.

To make it easy to debug stack overflow,dump the stack usage of
each frame by walking the stack.

After this patch,the log after stack overflows like below:

Insufficient stack space to handle exception!
Task stack:     [0xf4a70000..0xf4a72000]
IRQ stack:      [0xf0800000..0xf0802000]
Overflow stack: [0x818c1000..0x818c2000]
Depth   usage   size   Location
  0      8232     96   _prb_read_valid
  1      8136     24   prb_read_valid
  2      8112    200   printk_get_next_message
  3      7912    104   console_flush_all
  4      7808     64   console_unlock
  5      7744     40   vprintk_emit
  6      7704     16   vprintk_default
  7      7688     32   _printk
  8      7656   1048   do_circle_loop
  9      6608   1048   do_circle_loop
 10      5560   1048   do_circle_loop
 11      4512   1048   do_circle_loop
 12      3464   1048   do_circle_loop
 13      2416   1048   do_circle_loop
 14      1368   1048   do_circle_loop
 15       320      8   stack_ovf_selftest
 16       312     24   param_attr_store
 17       288     40   kernfs_fop_write_iter
 18       248    112   vfs_write
 19       136     48   ksys_write
-----    -----  -----   ------
Internal error: kernel stack overflow: 0 [#1] SMP ARM
...

Signed-off-by: Haibo Li <haibo.li@mediatek.com>
---
 arch/arm/kernel/traps.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 3bad79db5d6e..641ca68b44ba 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -921,6 +921,33 @@ static int __init allocate_overflow_stacks(void)
 }
 early_initcall(allocate_overflow_stacks);
 
+static void dump_stack_usage(struct pt_regs *regs)
+{
+	struct stackframe frame;
+	unsigned int depth = 0;
+	unsigned long prev_pc;
+	unsigned long prev_sp;
+	unsigned long stack_high = (unsigned long)current->stack + THREAD_SIZE;
+
+	arm_get_current_stackframe(regs, &frame);
+	pr_emerg("Depth   usage   size   Location\n");
+	while (1) {
+		prev_pc = frame.pc;
+		prev_sp = frame.sp;
+#if defined(CONFIG_FRAME_POINTER) && !defined(CONFIG_ARM_UNWIND)
+		//meet the requirement of frame_pointer_check
+		if (frame.sp < (unsigned long)current->stack)
+			frame.sp = (unsigned long)current->stack + 4;
+#endif
+		if (unwind_frame(&frame) < 0)
+			break;
+		pr_emerg("%3d     %5ld  %5ld   %ps\n",
+			 depth++, stack_high - prev_sp,
+			 frame.sp - prev_sp, (void *)prev_pc);
+	}
+	pr_emerg("-----    -----  -----   ------\n");
+}
+
 asmlinkage void handle_bad_stack(struct pt_regs *regs)
 {
 	unsigned long tsk_stk = (unsigned long)current->stack;
@@ -940,6 +967,7 @@ asmlinkage void handle_bad_stack(struct pt_regs *regs)
 #endif
 	pr_emerg("Overflow stack: [0x%08lx..0x%08lx]\n",
 		 ovf_stk - OVERFLOW_STACK_SIZE, ovf_stk);
+	dump_stack_usage(regs);
 
 	die("kernel stack overflow", regs, 0);
 }
-- 
2.18.0



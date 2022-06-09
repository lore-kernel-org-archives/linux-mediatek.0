Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B8ECCA47A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 03:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VQUNB6ohYYvqbuphUfDQFrVkhH6HcqJzB0qVTGhj6P8=; b=X2glOXi0vkLWrf
	guC7JAM3i7Xlu2yklgEGi4NStgdTk5/eHHmWqRoQ5Hy2ReAaIUA9aBdpR8U8/Gv1wpu+aTyxzo/ht
	uBnU5Xs9hk7fl1FmsfJpteyCV6OSJb8yvgNM8VcZ3iTFUHIJLR+QR+m9ADOWX1FWRnIQwy0wPR1bS
	iRNmab1RAGt3wLfDLpqgddvZdyex6OtQZvMI+O5+W4kwpQyh6c6uXlUABb4Uq2N8ReXH8kYunWOJk
	9UioHJ0mkoxW7+JxMAnVSYSvm0iQHFdlKnJeHy01S0PT6OT311MrUxYgv1gwG+zDHLDbqdE7TRvyI
	ElpF9XoeCvyke9wnlpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz8vZ-00FvAl-5v; Thu, 09 Jun 2022 03:33:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz8vN-00Fv7L-HH; Thu, 09 Jun 2022 03:33:35 +0000
X-UUID: 30df33ec96de4dc0834b129a7037b273-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:dde60c5e-30e7-4c39-b657-f7d1b0419c25,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:650130e5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 30df33ec96de4dc0834b129a7037b273-20220608
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 477941445; Wed, 08 Jun 2022 20:33:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 20:33:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 9 Jun 2022 11:33:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Jun 2022 11:33:24 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <yj.chiang@mediatek.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, "Marc
 Zyngier" <maz@kernel.org>, Alexandru Elisei <alexandru.elisei@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] arm64: Clear OS lock in enable_debug_monitors
Date: Thu, 9 Jun 2022 11:33:18 +0800
Message-ID: <20220609033322.12436-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_203333_616601_CE81BF34 
X-CRM114-Status: GOOD (  13.48  )
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

Always clear OS lock before enable debug event.

The OS lock is clear in cpuhp ops in recent kernel,
but when the debug exception happened before it
kernel might crash because debug event enable didn't
take effect when OS lock is hold.

Below is the use case that having this problem:

Register kprobe in console_unlock and kernel will
panic at secondary_start_kernel on secondary core.

CPU: 1 PID: 0 Comm: swapper/1 Tainted: P
...
pstate: 004001c5 (nzcv dAIF +PAN -UAO)
pc : do_undefinstr+0x5c/0x60
lr : do_undefinstr+0x2c/0x60
sp : ffffffc01338bc50
pmr_save: 000000f0
x29: ffffffc01338bc50 x28: ffffff8115e95a00 T
x27: ffffffc01258e000 x26: ffffff8115e95a00
x25: 00000000ffffffff x24: 0000000000000000
x23: 00000000604001c5 x22: ffffffc014015008
x21: 000000002232f000 x20: 00000000000000f0 j
x19: ffffffc01338bc70 x18: ffffffc0132ed040
x17: ffffffc01258eb48 x16: 0000000000000403 L&
x15: 0000000000016480 x14: ffffffc01258e000 i/
x13: 0000000000000006 x12: 0000000000006985
x11: 00000000d5300000 x10: 0000000000000000
x9 : 9f6c79217a8a0400 x8 : 00000000000000c5
x7 : 0000000000000000 x6 : ffffffc01338bc08 2T
x5 : ffffffc01338bc08 x4 : 0000000000000002
x3 : 0000000000000000 x2 : 0000000000000004
x1 : 0000000000000000 x0 : 0000000000000001 *q
Call trace:
 do_undefinstr+0x5c/0x60
 el1_undef+0x10/0xb4
 0xffffffc014015008
 vprintk_func+0x210/0x290
 printk+0x64/0x90
 cpuinfo_detect_icache_policy+0x80/0xe0
 __cpuinfo_store_cpu+0x150/0x160
 secondary_start_kernel+0x154/0x440

The root cause is that OS_LSR_EL1.OSLK is reset
to 1 on a cold reset[1] and the firmware didn't
unlock it by default.
So the core didn't go to el1_dbg as expected after
kernel_enable_single_step and eret.

[1] https://developer.arm.com/documentation/ddi0595/2021-06/AArch64-Registers/OSLSR-EL1--OS-Lock-Status-Register?lang=en
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 arch/arm64/kernel/debug-monitors.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index bf9fe71589bc..186f2846d652 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -70,6 +70,17 @@ static int __init early_debug_disable(char *buf)
 
 early_param("nodebugmon", early_debug_disable);
 
+/*
+ * OS lock clearing.
+ */
+static int clear_os_lock(unsigned int cpu)
+{
+	write_sysreg(0, osdlr_el1);
+	write_sysreg(0, oslar_el1);
+	isb();
+	return 0;
+}
+
 /*
  * Keep track of debug users on each core.
  * The ref counts are per-cpu so we use a local_t type.
@@ -91,6 +102,7 @@ void enable_debug_monitors(enum dbg_active_el el)
 		enable |= DBG_MDSCR_KDE;
 
 	if (enable && debug_enabled) {
+		clear_os_lock(0);
 		mdscr = mdscr_read();
 		mdscr |= enable;
 		mdscr_write(mdscr);
@@ -119,17 +131,6 @@ void disable_debug_monitors(enum dbg_active_el el)
 }
 NOKPROBE_SYMBOL(disable_debug_monitors);
 
-/*
- * OS lock clearing.
- */
-static int clear_os_lock(unsigned int cpu)
-{
-	write_sysreg(0, osdlr_el1);
-	write_sysreg(0, oslar_el1);
-	isb();
-	return 0;
-}
-
 static int __init debug_monitors_init(void)
 {
 	return cpuhp_setup_state(CPUHP_AP_ARM64_DEBUG_MONITORS_STARTING,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

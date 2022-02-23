Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3F4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 02:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=60byq0+KwcC5xM+iChpaE23Gi+7MlgshR620622ynPE=; b=OPCKwXzaSK5xaU
	DRBxtSw4OD+z0NDhGJMQp/ZfyVyIXF9RqpKEFVZOhFck2t6B9rYnwvEISfIQZGp3wrBYxv9zmIbRQ
	L4fWAfu8s0JSCNvL+MTl09I8s1n7uULllvpTRi5qHuLHsLW2S7tHjJackHs/xo1/uPmh0Tqc4Za6V
	D6DM1gB7xZXdyLKKJ1Vj4UaUKGZ2qnQCJ+3U8mGUOA2oTokRHTNdwqbBdMuOxb6qVlapIH3GemALn
	fab4mBm0qWmvazJaLIv5tWohAt/S83Os+WuMovcZCKcG6LCBcaugqTz3xy2SLMLCtvCqivIL9KDB8
	38bJsE+um536HvNgADMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMhKl-00CHs2-Bp; Wed, 23 Feb 2022 02:24:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMhKZ-00CHqO-5K; Wed, 23 Feb 2022 02:24:40 +0000
X-UUID: 3d29d6102b7446b08d4ae3442eaab57f-20220222
X-UUID: 3d29d6102b7446b08d4ae3442eaab57f-20220222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <haibo.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1198613027; Tue, 22 Feb 2022 19:24:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 18:24:31 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 23 Feb 2022 10:24:30 +0800
Received: from mszsdtcf10.gcn.mediatek.inc (10.16.4.60) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 23 Feb 2022 10:24:29 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: Russell King <linux@armlinux.org.uk>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: "GitAuthor : Haibo Li" <haibo.li@mediatek.com>,
 <xiaoming.yu@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] ARM:Fix incomplete stacktrace when unwind ftrace_regs_caller
Date: Wed, 23 Feb 2022 10:24:28 +0800
Message-ID: <20220223022428.58385-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_182439_230567_F34BD1B2 
X-CRM114-Status: GOOD (  12.70  )
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

We can use register_ftrace_function(&ops) to
register a function callback.
if we set FTRACE_OPS_FL_SAVE_REGS in ftrace flags(flags in ops),
then do stack unwind
like dump_stack or WARN in the callback,we get incomplete stacktrace.
The stack unwind ends in ftrace_regs_caller.

Below is the output from test code.
The test code do register_ftrace_function
with FTRACE_OPS_FL_SAVE_REGS set,
and set sysrq_handle_loglevel as filter,then do dump_stack
in callback.It can not continue to
unwind the stack from ftrace_regs_call

echo 7 >/proc/sysrq-trigger
sysrq: Changing Loglevel
CPU: 1 PID: 145 Comm: sh Not tainted
5.17.0-rc4-00002-gb0dc07624ccd-dirty #2
[    9.023226][  T145] Hardware name: Generic DT based system
[    9.023670][  T145]  unwind_backtrace from show_stack+0x28/0x2c
[    9.024070][  T145]  show_stack from dump_stack_lvl+0x48/0x54
[    9.024298][  T145]  dump_stack_lvl from ftrace_regs_call+0x4/0x18
[    9.024650][  T145] sysrq: Loglevel set to 7

Fix it by adding unwind directives in ftrace_regs_caller.

Signed-off-by: Haibo Li <haibo.li@mediatek.com>
---
 arch/arm/kernel/entry-ftrace.S | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/entry-ftrace.S b/arch/arm/kernel/entry-ftrace.S
index a74289ebc803..eafa0c9b8992 100644
--- a/arch/arm/kernel/entry-ftrace.S
+++ b/arch/arm/kernel/entry-ftrace.S
@@ -75,15 +75,18 @@
 
 	add 	ip, sp, #12	@ move in IP the value of SP as it was
 				@ before the push {lr} of the mcount mechanism
-
+ UNWIND(.movsp ip)
 	str     lr, [sp, #0]    @ store LR instead of PC
+ UNWIND(.save{pc})  @it is the caller of ftrace_regs_caller
 
 	ldr     lr, [sp, #8]    @ get previous LR
 
 	str	r0, [sp, #8]	@ write r0 as OLD_R0 over previous LR
 
 	stmdb   sp!, {ip, lr}
+ UNWIND(.save{ip,lr})
 	stmdb   sp!, {r0-r11, lr}
+ UNWIND(.save{r0-r11,lr})
 
 	@ stack content at this point:
 	@ 0  4          48   52       56            60   64    68       72
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

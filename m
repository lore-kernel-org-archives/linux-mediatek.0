Return-Path: <SRS0=woo5=5L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BFBC2D0E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 04:49:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33D58206E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 04:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hw5tZntV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=flygoat.com header.i=jiaxun.yang@flygoat.com header.b="alE//OJS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33D58206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=flygoat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Message-ID:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFJCGdyETWkvu0E5jIhXvlTwNXRSaM0v7INGd/CIQjg=; b=Hw5tZntVjOmMDv
	YFYDvwmMOo3+C7o2G+30PmPmdsPwS19qTksr+BhYw9IATr/MQ8a0XbuDS4GS5JcJixVPVHhYthL/a
	6ZSmbU+xRn1kBsQfE9QMqBz1n5ozXyDf4as4zFlRJWYl1+P1k+mSUGKsO7Dn3CnvuW81nTkCN12xj
	0hgBSChQrZHLiDzz8sr9XUyyg0Yr6b9nclJp5um3c7jqntrb0yzab5x7KXMNIV2qFa522ZagaH/ll
	eoJF9nZSVdJiYNcEHmTS2El3ikjcU0XAEYXBPG5F4h3kNMovk2/QkQNhEAPd07UGVzw9R1aUkhPsV
	+ZpNVBbONCWFGqgKaBzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHKSZ-0002ZI-Bg; Thu, 26 Mar 2020 04:49:39 +0000
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHKSV-0002Xc-TL
 for linux-mediatek@lists.infradead.org; Thu, 26 Mar 2020 04:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585198134; 
 s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=gGd3RxAxyUkb4OJvY+SCCfsP9WVGN6zphOE5v3hmzUk=;
 b=alE//OJSXXUtATKaqI6LomMZqD/zU2BNtYGqbXiKsdKjidEQkPnmeCIHbfRvwWRi
 xCusLt0k5+bcjkGfbSaMqEXcSpTGaN+uzmQFVN8APQ4D0trGQOztEOp/g22N4hqVSi5
 79pHR5SPsZoqsUdSPBbyugDaZQUgZng89FEm4GXY=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by
 mx.zoho.com.cn with SMTPS id 1585198132317262.7241477206006;
 Thu, 26 Mar 2020 12:48:52 +0800 (CST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Message-ID: <20200326044804.382981-2-jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] MIPS: Kill RM7K & RM9K IRQ Code
Date: Thu, 26 Mar 2020 12:48:04 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200326044804.382981-1-jiaxun.yang@flygoat.com>
References: <20200326044804.382981-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_214936_413862_BFC67B10 
X-CRM114-Status: UNSURE (   6.83  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, tsbogend@alpha.franken.de,
 gch981213@gmail.com, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RM7000 IRQ driver never got really used by any of the platform,
and rm9k_cpu_irq_init only exist in a header.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                        |  3 --
 arch/mips/include/asm/irq_cpu.h          |  2 --
 arch/mips/include/asm/mach-generic/irq.h |  6 ----
 arch/mips/kernel/Makefile                |  1 -
 arch/mips/kernel/irq-rm7000.c            | 45 ------------------------
 5 files changed, 57 deletions(-)
 delete mode 100644 arch/mips/kernel/irq-rm7000.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a1f973cc0265..7cda047766bd 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1309,9 +1309,6 @@ config SYS_SUPPORTS_HUGETLBFS
 config MIPS_HUGE_TLB_SUPPORT
 	def_bool HUGETLB_PAGE || TRANSPARENT_HUGEPAGE
 
-config IRQ_CPU_RM7K
-	bool
-
 config IRQ_MSP_SLP
 	bool
 
diff --git a/arch/mips/include/asm/irq_cpu.h b/arch/mips/include/asm/irq_cpu.h
index 8d321180b5c2..83d7331ab215 100644
--- a/arch/mips/include/asm/irq_cpu.h
+++ b/arch/mips/include/asm/irq_cpu.h
@@ -10,8 +10,6 @@
 #define _ASM_IRQ_CPU_H
 
 extern void mips_cpu_irq_init(void);
-extern void rm7k_cpu_irq_init(void);
-extern void rm9k_cpu_irq_init(void);
 
 #ifdef CONFIG_IRQ_DOMAIN
 struct device_node;
diff --git a/arch/mips/include/asm/mach-generic/irq.h b/arch/mips/include/asm/mach-generic/irq.h
index 72ac2c202c55..ac711b0d6225 100644
--- a/arch/mips/include/asm/mach-generic/irq.h
+++ b/arch/mips/include/asm/mach-generic/irq.h
@@ -28,12 +28,6 @@
 #endif /* CONFIG_I8259 */
 #endif
 
-#ifdef CONFIG_IRQ_CPU_RM7K
-#ifndef RM7K_CPU_IRQ_BASE
-#define RM7K_CPU_IRQ_BASE (MIPS_CPU_IRQ_BASE+8)
-#endif
-#endif
-
 #endif /* CONFIG_IRQ_MIPS_CPU */
 
 #endif /* __ASM_MACH_GENERIC_IRQ_H */
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index d6e97df51cfb..c0a7e3f266e1 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -64,7 +64,6 @@ obj-$(CONFIG_MIPS_VPE_APSP_API) += rtlx.o
 obj-$(CONFIG_MIPS_VPE_APSP_API_CMP) += rtlx-cmp.o
 obj-$(CONFIG_MIPS_VPE_APSP_API_MT) += rtlx-mt.o
 
-obj-$(CONFIG_IRQ_CPU_RM7K)	+= irq-rm7000.o
 obj-$(CONFIG_MIPS_MSC)		+= irq-msc01.o
 obj-$(CONFIG_IRQ_TXX9)		+= irq_txx9.o
 obj-$(CONFIG_IRQ_GT641XX)	+= irq-gt641xx.o
diff --git a/arch/mips/kernel/irq-rm7000.c b/arch/mips/kernel/irq-rm7000.c
deleted file mode 100644
index e1a497f639d7..000000000000
--- a/arch/mips/kernel/irq-rm7000.c
+++ /dev/null
@@ -1,45 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2003 Ralf Baechle
- *
- * Handler for RM7000 extended interrupts.  These are a non-standard
- * feature so we handle them separately from standard interrupts.
- */
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/kernel.h>
-
-#include <asm/irq_cpu.h>
-#include <asm/mipsregs.h>
-
-static inline void unmask_rm7k_irq(struct irq_data *d)
-{
-	set_c0_intcontrol(0x100 << (d->irq - RM7K_CPU_IRQ_BASE));
-}
-
-static inline void mask_rm7k_irq(struct irq_data *d)
-{
-	clear_c0_intcontrol(0x100 << (d->irq - RM7K_CPU_IRQ_BASE));
-}
-
-static struct irq_chip rm7k_irq_controller = {
-	.name = "RM7000",
-	.irq_ack = mask_rm7k_irq,
-	.irq_mask = mask_rm7k_irq,
-	.irq_mask_ack = mask_rm7k_irq,
-	.irq_unmask = unmask_rm7k_irq,
-	.irq_eoi = unmask_rm7k_irq
-};
-
-void __init rm7k_cpu_irq_init(void)
-{
-	int base = RM7K_CPU_IRQ_BASE;
-	int i;
-
-	clear_c0_intcontrol(0x00000f00);		/* Mask all */
-
-	for (i = base; i < base + 4; i++)
-		irq_set_chip_and_handler(i, &rm7k_irq_controller,
-					 handle_percpu_irq);
-}
-- 
2.26.0.rc2



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

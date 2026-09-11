Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E16BC88E40
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 03:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHltKlWHwYJPqeo4oBbRoLIdif+urCXRiNwOSKd5An4=; b=VV0b7Cbd4RJ9Nm12hWihjvpx/z
	41hWCUIbJ416+LbPtZlkRrVLk5Ee7XjL2mjaD98SbZ1Gv8qgeeGinj1Em6+Y4cYC6NanBEeXKyZyk
	eLsgi+y2/fNm2fwqJLdGz40dTem/8puWYJaiSWqCS/EtwPz3rWnH2OleAce7vTbqFfBemhzGPafnx
	IO5833O+nwbILS5+ks65Aru/+L9adIt0zDZXz9bJ4TTiROyJhzr5tS3p4y8PLtK3fPXelf/grQpPu
	QivqwaW9QgliEYuMnCMNWp6iIf40Ex+40wbpeO+jSyaLLmJob8L/dp0GFWdA3nQRVsRDHraLwPcPU
	bqbpruCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rvq-0000000Fl0h-2OLd;
	Fri, 11 Sep 2026 03:28:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rvn-0000000FkyR-1tiK;
	Fri, 11 Sep 2026 03:28:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA13040ADA;
	Fri, 11 Sep 2026 03:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A851F00893;
	Fri, 11 Sep 2026 03:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097282;
	bh=kHltKlWHwYJPqeo4oBbRoLIdif+urCXRiNwOSKd5An4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=diTt3vefE5Y8zWY47uFIQxTU2hQBr2sF/iqHtAGKrBVVFEUtLHETXpi1WwOXVSCR+
	 E9VaMDuQTW7ieFUX2+gKCTEq1JAzw4Ina8g8bPpsKn9KDHKZfD6pg6Jk6s73x8gizZ
	 SRs1ZYWvjakJNzcEXjsgqyNTAcnedgLRx+HLnrEATbXAYxYNaFUWUrs0FhNfBGs0Xe
	 13sAf/H7jpkz5plvYeaTQkW6mq2jK/9EXO76YpYY/PmTIjo6VGQivXeEr3lY8bCQh/
	 pUWOsD/J0/F+ZakHS+aJbgJyMdJfZ5N/CcIDU/q6cx6aKOHnjpejAR2TivekRF2Woo
	 u3jW1KO2xNQpg==
From: Guo Ren <guoren@kernel.org>
Date: Fri, 11 Sep 2026 03:27:09 +0000
Subject: [PATCH v2 1/6] riscv: smp: Move enum ipi_message_type to asm/smp.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ipi_max-v2-1-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0
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

From: "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     1ae91dc397eb1dbc0f4fc6b96f2481cbc02fe0f9
Gitweb:        https://git.kernel.org/tip/1ae91dc397eb1dbc0f4fc6b96f2481cbc02fe0f9
Author:        GUO Ren (XuanTie) <guoren@kernel.org>
AuthorDate:    Sun, 16 Aug 2026 07:00:45
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:34 +02:00

riscv: smp: Move enum ipi_message_type to asm/smp.h

The IPI message type enumeration (and therefore IPI_MAX) is currently
private to arch/riscv/kernel/smp.c.  Several IPI providers need to know
the exact number of IPIs that the architecture requires, so move the
enum into the public header.

This is a pure code movement with no functional change.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Reviewed-by: Anup Patel <anup@brainfault.org>
Link: https://patch.msgid.link/20260816070049.2097442-2-guoren@kernel.org
---
 arch/riscv/include/asm/smp.h | 12 ++++++++++++
 arch/riscv/kernel/smp.c      | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 0ecc67641b09..bed39fff1f8a 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -15,6 +15,18 @@
 struct seq_file;
 extern unsigned long boot_cpu_hartid;
 
+enum ipi_message_type {
+	IPI_RESCHEDULE,
+	IPI_CALL_FUNC,
+	IPI_CPU_STOP,
+	IPI_CPU_CRASH_STOP,
+	IPI_IRQ_WORK,
+	IPI_TIMER,
+	IPI_CPU_BACKTRACE,
+	IPI_KGDB_ROUNDUP,
+	IPI_MAX
+};
+
 #ifdef CONFIG_SMP
 
 #include <linux/jump_label.h>
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index fa66f9c97d74..8930b62b15e7 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -28,18 +28,6 @@
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
 
-enum ipi_message_type {
-	IPI_RESCHEDULE,
-	IPI_CALL_FUNC,
-	IPI_CPU_STOP,
-	IPI_CPU_CRASH_STOP,
-	IPI_IRQ_WORK,
-	IPI_TIMER,
-	IPI_CPU_BACKTRACE,
-	IPI_KGDB_ROUNDUP,
-	IPI_MAX
-};
-
 static const char * const ipi_names[] = {
 	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
 	[IPI_CALL_FUNC]		= "Function call interrupts",

-- 
2.43.0



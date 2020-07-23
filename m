Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BA8C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 06:54:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9567020709
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 06:54:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YGKXDKvE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tYGd2Hr3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9567020709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2gDrxo3W/t950waMBShGcF01usz4CG7o0Hk0MPi6B5M=; b=YGKXDKvElNVcfNVBVEjTLnHW0N
	2wUW4A1FMfN2IyOI6gNrv20a/6OYTSfY3alUE/N6BZeE2tnRdhJ6Ya0ePh5Sg3+FQ1dr/4JuhX6/4
	urkcCgwBeJTWAwJ+0fZrU4xu0QEfb/ixuD12Lw2Z+vU6cHBDV1J877+kFo4QvFKJJDOILaokd40yR
	KEUwRjeLWq4bb5RMX1ysBf8Cxdn4TZqu8+h8dHuPqxMRGJ8X6zufZnRt1HiQuxw6X2wZzZCgLC9jo
	bwh8WBdqJu+VfLNCm/u5Y73XK7ZLwoKk18r5OfcxHBBtCgYvG3r2cgxCNc41B9Rsd56PjldlS4vri
	GQeBwmOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyV7t-0000BT-BQ; Thu, 23 Jul 2020 06:54:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyV7q-0000AJ-IX
 for linux-mediatek@lists.infradead.org; Thu, 23 Jul 2020 06:54:43 +0000
X-UUID: 2a7341e446a9452f85837f43770c0443-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=xVT0dC+db7oDc3+O2OxeEb/LIW1xRQ+H26yHJ4ZM93A=; 
 b=tYGd2Hr38cjpV+JYOOHM8IzZ14/8rsnGxNFtKd9R7ahnM/IHfJeFiQqclfwO+HlksLswGLNC0/MnNtCgV/og6gH+7g0s8qvblNFJze6czdQQKQ+HFPS+eZdYGtb+2ehw9pdNry8RVIakEengMrOPfThonHhZIE0+e2wPYVipafA=;
X-UUID: 2a7341e446a9452f85837f43770c0443-20200722
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunlei.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1236302092; Wed, 22 Jul 2020 22:54:35 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 23:54:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 14:54:32 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 14:54:31 +0800
Message-ID: <1595487143.29785.9.camel@mbjsdccf07>
Subject: [PATCH] siganl: ignore other signals when doing coredump
From: chunlei.wang <Chunlei.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>
Date: Thu, 23 Jul 2020 14:52:23 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_025442_816306_0ACCC509 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, weiwei.zhang@mediatek.com,
 linux-mediatek@lists.infradead.org, Will Deacon <will@kernel.org>,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

do_coredump flow is interrupted by SIGKILL,
causing the coredump to be truncated.

Signed-off-by: Chunlei Wang <chunlei.wang@mediatek.com>
---
 arch/Kconfig    | 12 ++++++++++++
 kernel/signal.c |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index 8cc35dc556c7..559eac47093e 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -834,6 +834,18 @@ config OLD_SIGACTION
 config COMPAT_OLD_SIGACTION
 	bool
 
+config IGNORE_ANY_SIGNALS
+	tristate "ignore any signals when coredump is doing"
+	default n
+	help
+	  The sigkill is very special. If a process receives a sigkill, it
will
+	  immediately respond to the sigkill. When a process is abnormal and
+	  collecting coredump, the do_coredump flow will be interrupted by
+	  SIGKILL, causing the coredump to be truncated. This truncated
coredump
+	  is incomplete, and also gdb can't load.
+	  Maybe we can ignore any signlas when process is collecting coredump.
+	  This config can decide whether to ignore any signals.
+
 config COMPAT_32BIT_TIME
 	bool "Provide system calls for 32-bit time_t"
 	default !64BIT || COMPAT
diff --git a/kernel/signal.c b/kernel/signal.c
index 5ca48cc5da76..ccae3c84eb6d 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -903,6 +903,14 @@ static bool prepare_signal(int sig, struct
task_struct *p, bool force)
 	sigset_t flush;
 
 	if (signal->flags & (SIGNAL_GROUP_EXIT | SIGNAL_GROUP_COREDUMP)) {
+
+#if defined CONFIG_IGNORE_ANY_SIGNALS
+		if (signal->flags & SIGNAL_GROUP_COREDUMP) {
+			pr_debug("[%d:%s] skip sig %d due to coredump is doing\n",
+					p->pid, p->comm, sig);
+			return false;
+		}
+#endif
 		if (!(signal->flags & SIGNAL_GROUP_EXIT))
 			return sig == SIGKILL;
 		/*
-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7C4C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 07:26:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C9361289
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 07:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C9361289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G1ow1tUtdt+0YT6ZooMIvbYi4j7P6aWACBVNtAZIxPw=; b=NrqWIR2jWgisP4MjBJ9S3IbqN9
	x4/ro+fmk19yry7GrUjX+EFILCF11KblyF0/hK/n9VdyB8dc5Ln9JCcF46YbBNxxRvUcTl/QIoKAO
	X4qTSyU3r5VNKSwT6kvLKfaZrZzI8Yd7yk1eEBIBw18z7hEysN9I2AjeROrTqN+1Vim+BmB3U5i86
	+GddGOeVfa5JUeySojWEt+Cut07zaWLA/VtmibrLodhB3PbeXFVvp575pMF6e8ZBJafNAJLOsV3sH
	yZJUa71mAsunmRayDq/S+Cj3YnBl/s9bxHuXA0KXEl7taP8zIDufdZzNC5QAwGJDGX0RuH2lbOdS5
	s/r/T8hg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc13l-005CkG-A5; Thu, 29 Apr 2021 07:26:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc11h-005CDI-4K; Thu, 29 Apr 2021 07:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=RmFlwXAIoCTZTXrIutKkpYoN6EfXED3fci0Fhaiqvgc=; b=zMcB6KbesHzSdIiF+Kx/49p1jJ
 Q2YS+bmDT2fzzhE31i9ZKmnlJe+QzZTCIRzghVG/2uJFaIfem0S81tQ6zB2QW5+f11vlRjCI32zWc
 rQ80vSPcvwEKU2o0T6DiBYXbWulc3qTXXz9zw705jaMOWESHw6sE8ilX5fWZvaSDBCNu50kROoEZ+
 SZHzecbXy3L99CSXPODmv0OrwW+Ov70lmpsD9ODfkwzqThf70kR6GYVOpL5jWD4726OIo6awMvt2f
 zfQQwh/bbHYqBR6dnG7mqDvHCWUkcT3Pz0LspT5DjD5gfIDuKZB4wsdx2tBQLTfyqRSpuJhWBcgVx
 KJJ4MpsQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc11d-000Rb8-Uy; Thu, 29 Apr 2021 07:23:55 +0000
X-UUID: a91ffd64c1064aa495c1ee96e2f3f7a8-20210429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RmFlwXAIoCTZTXrIutKkpYoN6EfXED3fci0Fhaiqvgc=; 
 b=cK1XrW3U95jJDtQ0Od3TXTw796sOBku7PQFCNmKHReaqgcnGnQPuHZf9YJn/h81AdpSDN7hNWicDse4JP+naS4rCroW0lNDQV6tBha3b4b87GiJhdNN9TR5TEy42gIEMrycRbZJtbho8oLSTxXeX82Lt1/RE1pFqgjP91oU0MS4=;
X-UUID: a91ffd64c1064aa495c1ee96e2f3f7a8-20210429
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1394397435; Thu, 29 Apr 2021 00:23:48 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Apr 2021 00:14:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 29 Apr 2021 15:14:38 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Apr 2021 15:14:36 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, <peterz@infradead.org>
CC: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Peter Enderborg
 <peter.enderborg@sony.com>, Thomas Gleixner <tglx@linutronix.de>, "Anshuman
 Khandual" <anshuman.khandual@arm.com>, Vitor Massaru Iha <vitor@massaru.org>, 
 Sedat Dilek <sedat.dilek@gmail.com>, Wei Yang <richard.weiyang@gmail.com>,
 Cong Wang <cong.wang@bytedance.com>, Di Zhu <zhudi21@huawei.com>, "Stephen
 Hemminger" <stephen@networkplumber.org>, Francis Laniel
 <laniel_francis@privacyrequired.com>, Roopa Prabhu
 <roopa@cumulusnetworks.com>, Andrii Nakryiko <andrii@kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upsream@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: [PATCH] rtnetlink: add rtnl_lock debug log
Date: Thu, 29 Apr 2021 15:02:36 +0800
Message-ID: <20210429070237.3012-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_002354_030327_9CBD9A05 
X-CRM114-Status: GOOD (  19.81  )
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

We often encounter system hangs caused by certain processes
holding rtnl_lock for a long time. Even if there is a lock
detection mechanism in Linux, it is a bit troublesome and
affects the system performance. We hope to add a lightweight
debugging mechanism for detecting rtnl_lock.

Up to now, we have discovered and solved some potential bugs
through such debug information of this lightweight rtnl_lock,
which is helpful for us.

When you say Y for RTNL_LOCK_DEBUG, then the kernel will detect
if any function hold rtnl_lock too long and some key information
will be printed to help identify the issue point.

i.e: from the following logs, we can clear know that the pid=5546
RfxSender_4 process hold rtnl_lock for a long time, causing the
system hang. And we can also speculate that the delay operation
may be performed in devinet_ioctl(), resulting in rtnl_lock was
not released in time.

<6>[  141.151364] ----------- rtnl_print_btrace start -----------
<6>[  141.152079] RfxSender_4[5546][R] hold rtnl_lock more than 2 sec,
start time: 139129481562
<4>[  141.153114]  rtnl_lock+0x88/0xfc
<4>[  141.153523]  devinet_ioctl+0x190/0x1268
<4>[  141.154007]  inet_ioctl+0x108/0x1f4
<4>[  141.154449]  sock_do_ioctl+0x88/0x200
<4>[  141.154911]  sock_ioctl+0x4b0/0x884
<4>[  141.155367]  do_vfs_ioctl+0x6b0/0xcc4
<4>[  141.155830]  __arm64_sys_ioctl+0xc0/0xec
<4>[  141.156326]  el0_svc_common+0x130/0x2c0
<4>[  141.156810]  el0_svc_handler+0xd0/0xe0
<4>[  141.157283]  el0_svc+0x8/0xc
<4>[  141.157646] Call trace:
<4>[  141.157956]  dump_backtrace+0x0/0x240
<4>[  141.158418]  show_stack+0x18/0x24
<4>[  141.158836]  rtnl_print_btrace+0x138/0x1cc
<4>[  141.159362]  call_timer_fn+0x120/0x47c
<4>[  141.159834]  expire_timers+0x28c/0x420
<4>[  141.160306]  __run_timers+0x3d0/0x494
<4>[  141.160768]  run_timer_softirq+0x24/0x48
<4>[  141.161262]  __do_softirq+0x26c/0x968
<4>[  141.161725]  irq_exit+0x1f8/0x2b4
<4>[  141.162145]  __handle_domain_irq+0xdc/0x15c
<4>[  141.162672]  gic_handle_irq+0xe4/0x188
<4>[  141.163144]  el1_irq+0x104/0x200
<4>[  141.163559]  __const_udelay+0x118/0x1b0
<4>[  141.164044]  devinet_ioctl+0x1a0/0x1268
<4>[  141.164527]  inet_ioctl+0x108/0x1f4
<4>[  141.164968]  sock_do_ioctl+0x88/0x200
<4>[  141.165428]  sock_ioctl+0x4b0/0x884
<4>[  141.165868]  do_vfs_ioctl+0x6b0/0xcc4
<4>[  141.166330]  __arm64_sys_ioctl+0xc0/0xec
<4>[  141.166825]  el0_svc_common+0x130/0x2c0
<4>[  141.167308]  el0_svc_handler+0xd0/0xe0
<4>[  141.167786]  el0_svc+0x8/0xc
<6>[  141.168153] ------------ rtnl_print_btrace end -----------

<6>[  147.321389] rtnl_lock is held by [5546] from
[139129481562] to [147321378812]

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 lib/Kconfig.debug    |  9 +++++
 net/core/rtnetlink.c | 86 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2c7f46b366f1..d0d7457fa394 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2019,6 +2019,15 @@ config KCOV_IRQ_AREA_SIZE
 	  soft interrupts. This specifies the size of those areas in the
 	  number of unsigned long words.
 
+config RTNL_LOCK_DEBUG
+	bool "rtnl_lock debugging, deadlock detection"
+	select STACKTRACE
+	help
+	  If you say Y here then the kernel will detect whether any process
+	  hold rtnl_lock too long and some key information will be printed
+	  to help identify the issue point.
+	  If unsure, say N.
+
 menuconfig RUNTIME_TESTING_MENU
 	bool "Runtime Testing"
 	def_bool y
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 3485b16a7ff3..ddf374aec6af 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -57,6 +57,86 @@
 #define RTNL_MAX_TYPE		50
 #define RTNL_SLAVE_MAX_TYPE	40
 
+#ifdef CONFIG_RTNL_LOCK_DEBUG
+#include <linux/sched/debug.h>
+#include <linux/stacktrace.h>
+
+/* Debug log and btrace will be printed when the rtnl_lock
+ * is held for more than RTNL_LOCK_MAX_HOLD_TIME seconds
+ */
+#define RTNL_LOCK_MAX_HOLD_TIME 2
+
+#define RTNL_LOCK_MAX_TRACE     10    /* stack trace length */
+
+struct rtnl_debug_btrace_t {
+	struct task_struct *task;
+	int pid;
+	unsigned long long start_time;
+	unsigned long long end_time;
+	unsigned long   addrs[RTNL_LOCK_MAX_TRACE];
+	unsigned int    nr_entries;
+};
+
+static struct rtnl_debug_btrace_t rtnl_instance = {
+	.task		= NULL,
+	.pid		= 0,
+	.start_time	= 0,
+	.end_time	= 0,
+	.nr_entries	= 0,
+};
+
+static void rtnl_print_btrace(struct timer_list *unused);
+static DEFINE_TIMER(rtnl_chk_timer, rtnl_print_btrace);
+
+/* Save stack trace to the given array of RTNL_LOCK_MAX_TRACE size.
+ */
+static int __save_stack_trace(unsigned long *trace)
+{
+	return stack_trace_save(trace, RTNL_LOCK_MAX_TRACE, 0);
+}
+
+static void rtnl_get_btrace(struct task_struct *who)
+{
+	unsigned long expires;
+
+	rtnl_instance.task = who;
+	rtnl_instance.pid = who->pid;
+	rtnl_instance.start_time = sched_clock();
+	rtnl_instance.end_time = 0;
+	rtnl_instance.nr_entries = __save_stack_trace(rtnl_instance.addrs);
+
+	expires = jiffies + RTNL_LOCK_MAX_HOLD_TIME * HZ;
+	mod_timer(&rtnl_chk_timer, expires);
+}
+
+static void rtnl_print_btrace(struct timer_list *unused)
+{
+	pr_info("----------- %s start -----------\n", __func__);
+	pr_info("%s[%d][%c] hold rtnl_lock more than 2 sec, start time: %llu\n",
+		rtnl_instance.task->comm,
+		rtnl_instance.pid,
+		task_state_to_char(rtnl_instance.task),
+		rtnl_instance.start_time);
+	stack_trace_print(rtnl_instance.addrs, rtnl_instance.nr_entries, 0);
+	show_stack(rtnl_instance.task, NULL, KERN_DEBUG);
+	pr_info("------------ %s end -----------\n", __func__);
+}
+
+static void rtnl_relase_btrace(void)
+{
+	rtnl_instance.end_time = sched_clock();
+
+	if (rtnl_instance.end_time - rtnl_instance.start_time > 2000000000ULL) {
+		pr_info("rtnl_lock is held by [%d] from [%llu] to [%llu]\n",
+			rtnl_instance.pid,
+			rtnl_instance.start_time,
+			rtnl_instance.end_time);
+	}
+
+	del_timer(&rtnl_chk_timer);
+}
+#endif
+
 struct rtnl_link {
 	rtnl_doit_func		doit;
 	rtnl_dumpit_func	dumpit;
@@ -70,6 +150,9 @@ static DEFINE_MUTEX(rtnl_mutex);
 void rtnl_lock(void)
 {
 	mutex_lock(&rtnl_mutex);
+#ifdef CONFIG_RTNL_LOCK_DEBUG
+	rtnl_get_btrace(current);
+#endif
 }
 EXPORT_SYMBOL(rtnl_lock);
 
@@ -104,6 +187,9 @@ void __rtnl_unlock(void)
 		cond_resched();
 		head = next;
 	}
+#ifdef CONFIG_RTNL_LOCK_DEBUG
+	rtnl_relase_btrace();
+#endif
 }
 
 void rtnl_unlock(void)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

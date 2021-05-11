Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3331C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:14:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A9C61928
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34A9C61928
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IH2qde+NhDaBIMLh0BVWN4ExwA5iD4hJT6XHKqEqRLU=; b=Xm/K1a5tT053z9rFg1YaRFUU4K
	OhWF7GPVo+AxZDVkkHRfzjEInZJ0Kv4Vnla/83yiincMM1zN4sLmdbAXW31mmKdC+6FgpTs4R8QtT
	Dja1oFFw+BNiU88BZLysfazUK8s2KnUebnRAKT2YklvzZMm7B0PtmTX3Mk9DPPxlTVNHT7ixl8RFA
	Hw4hlRw/pNld7q1RLVtdgdONkvbvbK3NDrF+MJ7cA5fY3GPut7t9uqsWyvhs6YAa/YpU2Et088X2v
	sqk+X4qs2toF0ZBQjcYw95v5gWNScTcRoJghsigusBWqxVA+3o6Xb1CYZxQDf6nb47hc5uKEvKCfG
	SHHPPr6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgSDQ-0001JL-V7; Tue, 11 May 2021 13:14:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgQyE-00HElr-8D; Tue, 11 May 2021 11:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Epl+RIPPA3OF2tWwylP1fmJ4bTHsDmLkXf6lh8bfzeY=; b=NT/eaoUpD6te0odl1Ml6O8cLO6
 QNX8WN6x1HRpoQwxiCgJGe1ft7uifT/ix/jjIUWhCG1418ssWkRiZcl5KVlfLCquvYvFqb034XZV5
 99Di62VnuNF4bfD7QTdkkXj79xaEEK776bX7kW43HiW7JhtENDdsv8ECEDgkr+A7dibnebr1sjYxx
 RbkrqokV3dUni0xt3Cfjrgl88ppcyThwZ+FT1WzpmUPR+ZN172fHwUMn44wSpejSwobQtAIMB8RXE
 JmyrLyokizCo5/oJdJd7dme2ht+o+KNH18KAzzmgTX7coxlrYyAlrXaDAkWw+5vhpF3JkecQL42y3
 FxEPwbYA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgQyB-009XVn-0R; Tue, 11 May 2021 11:54:36 +0000
X-UUID: e1c80f39355d4e85b8428d9dd9435047-20210511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Epl+RIPPA3OF2tWwylP1fmJ4bTHsDmLkXf6lh8bfzeY=; 
 b=qSy60LUINsbz6mnFacD9/h2b/SaEm2RoV6z1rHnZy71DzYOtAZ4Zr9wEoP5aoEr5Jl0DSTz+DWkPbk8EZgKdKztiB8MJ9Hb1fWcA/omHXpNwItp/eQFhTdTP7cOy3HFZYWduMYf8dtUg33muH2FkCA8kN+ltg07VGIhp2CEHQBs=;
X-UUID: e1c80f39355d4e85b8428d9dd9435047-20210511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 816384392; Tue, 11 May 2021 04:54:25 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 May 2021 04:46:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 May 2021 19:46:04 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 May 2021 19:46:03 +0800
From: Rocco yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Peter Zijlstra
 <peterz@infradead.org>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: [PATCH][v3] rtnetlink: add rtnl_lock debug log
Date: Tue, 11 May 2021 19:32:57 +0800
Message-ID: <20210511113257.2094-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_045435_086257_B8FE58A9 
X-CRM114-Status: GOOD (  19.58  )
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

From: Rocco Yue <rocco.yue@mediatek.com>

We often encounter system hangs caused by certain process
holding rtnl_lock for a long time. Even if there is a lock
detection mechanism in Linux, it is a bit troublesome and
affects the system performance. We hope to add a lightweight
debugging mechanism for detecting rtnl_lock.

Up to now, we have discovered and solved some potential bugs
through this lightweight rtnl_lock debugging mechanism, which
is helpful for us.

When you say Y for RTNL_LOCK_DEBUG, then the kernel will
detect if any function hold rtnl_lock too long and some key
information will be printed out to help locate the problem.

i.e: from the following logs, we can clearly know that the
pid=2206 RfxSender_4 process holds rtnl_lock for a long time,
causing the system to hang. And we can also speculate that the
delay operation may be performed in devinet_ioctl(), resulting
in rtnl_lock was not released in time.

[   40.191481] rtnetlink: -- rtnl_print_btrace start --
[   40.191494] rtnetlink: RfxSender_4[2206][R] hold rtnl_lock
more than 2 sec, start time: 38181400013
[   40.191571] Call trace:
[   40.191586]  rtnl_print_btrace+0xf0/0x124
[   40.191656]  __delay+0xc0/0x180
[   40.191663]  devinet_ioctl+0x21c/0x75c
[   40.191668]  inet_ioctl+0xb8/0x1f8
[   40.191675]  sock_do_ioctl+0x70/0x2ac
[   40.191682]  sock_ioctl+0x5dc/0xa74
[   40.191715] rtnetlink: -- rtnl_print_btrace end --

[   42.181879] rtnetlink: rtnl_lock is held by [2206] from
[38181400013] to [42181875177]

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 lib/Kconfig.debug    | 10 ++++++
 net/core/rtnetlink.c | 85 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 678c13967580..f1a722e16bee 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2027,6 +2027,16 @@ config KCOV_IRQ_AREA_SIZE
 	  soft interrupts. This specifies the size of those areas in the
 	  number of unsigned long words.
 
+config RTNL_LOCK_DEBUG
+	bool "rtnl_lock debugging, deadlock detection"
+	depends on STACKTRACE_SUPPORT
+	select STACKTRACE
+	help
+	  If you say Y here then the kernel will detect whether any function
+	  hold rtnl_lock too long and some key information will be printed
+	  out to help locate the problem.
+	  If unsure, say N.
+
 menuconfig RUNTIME_TESTING_MENU
 	bool "Runtime Testing"
 	def_bool y
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 714d5fa38546..4f81086e5a42 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -12,6 +12,8 @@
  *	Vitaly E. Lavrov		RTA_OK arithmetics was wrong.
  */
 
+#define pr_fmt(fmt) "rtnetlink: " fmt
+
 #include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -57,6 +59,81 @@
 #define RTNL_MAX_TYPE		50
 #define RTNL_SLAVE_MAX_TYPE	40
 
+#ifdef CONFIG_RTNL_LOCK_DEBUG
+
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
+	unsigned long addrs[RTNL_LOCK_MAX_TRACE];
+	unsigned int  nr_entries;
+};
+
+static struct rtnl_debug_btrace_t rtnl_instance;
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
+	pr_info("-- %s start --\n", __func__);
+	pr_info("%s[%d][%c] hold rtnl_lock more than %d sec, start time: %llu\n",
+		rtnl_instance.task->comm,
+		rtnl_instance.pid,
+		task_state_to_char(rtnl_instance.task),
+		RTNL_LOCK_MAX_HOLD_TIME,
+		rtnl_instance.start_time);
+	stack_trace_print(rtnl_instance.addrs, rtnl_instance.nr_entries, 0);
+	show_stack(rtnl_instance.task, NULL, KERN_INFO);
+	pr_info("-- %s end --\n", __func__);
+}
+
+static void rtnl_relase_btrace(void)
+{
+	rtnl_instance.end_time = sched_clock();
+	del_timer_sync(&rtnl_chk_timer);
+
+	if (rtnl_instance.end_time - rtnl_instance.start_time > 2 * NSEC_PER_SEC) {
+		pr_info("rtnl_lock is held by [%d] from [%llu] to [%llu]\n",
+			rtnl_instance.pid,
+			rtnl_instance.start_time,
+			rtnl_instance.end_time);
+	}
+}
+#endif
+
 struct rtnl_link {
 	rtnl_doit_func		doit;
 	rtnl_dumpit_func	dumpit;
@@ -70,6 +147,10 @@ static DEFINE_MUTEX(rtnl_mutex);
 void rtnl_lock(void)
 {
 	mutex_lock(&rtnl_mutex);
+
+#ifdef CONFIG_RTNL_LOCK_DEBUG
+	rtnl_get_btrace(current);
+#endif
 }
 EXPORT_SYMBOL(rtnl_lock);
 
@@ -95,6 +176,10 @@ void __rtnl_unlock(void)
 
 	defer_kfree_skb_list = NULL;
 
+#ifdef CONFIG_RTNL_LOCK_DEBUG
+	rtnl_relase_btrace();
+#endif
+
 	mutex_unlock(&rtnl_mutex);
 
 	while (head) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=aHEw=KD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78D9C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 May 2021 09:16:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 551DC61377
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 May 2021 09:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 551DC61377
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PKdH4iJK3wp4ymOx8oAxHqw9jo1m+/j5DfBbC60ijUc=; b=fnpZ9Cc/zqZ9b7z4WyVH8kwOoC
	2fsXZ2aExg1FnLraoQ0AreM+9eE/HK2CuWbeDESH5aZuKzs4jjgvkb+49kNVQeakSFWp+uIQiEPFj
	h3VR4m6biNFrVtJa0duL2v46SA2KCcBsX2Gk+G6URpJYDNmbaTmKAkvzEAJLL7Xq41swi4DD6TUA6
	IPhluFHkSpMposg0itd7aLzey+rwOfuetkgM2FaVBjfA9D5JU6PBFt1zqXa4JPkSpRA7sGvn5Qq1O
	SoiC0/227fDGrhwtklUbz9uPdU4lwXWlM6fZSbrd0+LCRvFFquiYjHg4gpswJx7pEbFqVJqNHbzP9
	/23tM5EQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfJ4d-009DAw-Od; Sat, 08 May 2021 09:16:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfJ4Y-009DAS-OU; Sat, 08 May 2021 09:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=o+bWo2qj+MkUrnjKBB5eM10DiYYvQBOw0QOrGTjseP0=; b=PQEmltHuJSyQeAXCBbgGq8DMs0
 flRJbZQC+1jJqNvKAWRsezqjTqiy01zlZGH5TLPLGHl7Dg7QN3Rby6H31O6TXJr2ZatDe/jwYirwE
 SUHZ/c5JvZG8121a354aayap1fs+opxuc9WpUBQDqKlNvOJgLUDIXtvUbxetbuPbLMz/lSaxgMjKo
 GkA4Zyee/xilmeF7ZlVR4EzxKNQyQM/1EoTE0AHRtW7r0cmNEXVlzMqMTR1y7W3AGT5wgn1atHx7q
 HwpMv5PJ2DR5yvkWuvDQMMILwJm4Sqbqt4SAg3zrNzuktAZ7nM0f7e8yvmjup2zxgRJjPbw8VMIYc
 71IxleAA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfJ4V-007SNt-Ed; Sat, 08 May 2021 09:16:29 +0000
X-UUID: f6accbd753004dbe90331d7181206838-20210508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=o+bWo2qj+MkUrnjKBB5eM10DiYYvQBOw0QOrGTjseP0=; 
 b=lE6VVGCwJOA82IwD8CK9FtsAtMPHxcDHKjuN2wDgqdabfpizyp1U5FSAM5c/sUQMoFcQ8qPF1CnepDMmIDg6DNU8K7Zs/h3YVHHwosz0iYAAGbNNmUUeXdDlwpYAOMhmhEKsoqbap+lKbv+ih/W/nzhSw3ebU4BHf6MhPtvBY0c=;
X-UUID: f6accbd753004dbe90331d7181206838-20210508
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1959573564; Sat, 08 May 2021 02:16:23 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 May 2021 02:10:14 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 May 2021 17:10:12 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 8 May 2021 17:10:10 +0800
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
Subject: [PATCH][v2] rtnetlink: add rtnl_lock debug log
Date: Sat, 8 May 2021 16:57:38 +0800
Message-ID: <20210508085738.6296-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210508_021627_538639_33206312 
X-CRM114-Status: GOOD (  18.83  )
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

We often encounter system hangs caused by certain process
holding rtnl_lock for a long time. Even if there is a lock
detection mechanism in Linux, it is a bit troublesome and
affects the system performance. We hope to add a lightweight
debugging mechanism for detecting rtnl_lock.

Up to now, we have discovered and solved some potential bugs
through this lightweight rtnl_lock debugging mechanism, which
is helpful for us.

When you say Y for RTNL_LOCK_DEBUG, then the kernel will detect
if any function hold rtnl_lock too long and some key information
will be printed out to help locate the problem.

i.e: from the following logs, we can clearly know that the pid=2206
RfxSender_4 process holds rtnl_lock for a long time, causing the
system to hang. And we can also speculate that the delay operation
may be performed in devinet_ioctl(), resulting in rtnl_lock was
not released in time.

<6>[   40.191481][    C6] rtnetlink: -- rtnl_print_btrace start --
<6>[   40.191494][    C6] rtnetlink: RfxSender_4[2206][R] hold rtnl_lock
more than 2 sec, start time: 38181400013
<4>[   40.191510][    C6]  devinet_ioctl+0x1fc/0x75c
<4>[   40.191517][    C6]  inet_ioctl+0xb8/0x1f8
<4>[   40.191527][    C6]  sock_do_ioctl+0x70/0x2ac
<4>[   40.191533][    C6]  sock_ioctl+0x5dc/0xa74
<4>[   40.191541][    C6]  __arm64_sys_ioctl+0x178/0x1fc
<4>[   40.191548][    C6]  el0_svc_common+0xc0/0x24c
<4>[   40.191555][    C6]  el0_svc+0x28/0x88
<4>[   40.191560][    C6]  el0_sync_handler+0x8c/0xf0
<4>[   40.191566][    C6]  el0_sync+0x198/0x1c0
<6>[   40.191571][    C6] Call trace:
<6>[   40.191586][    C6]  rtnl_print_btrace+0xf0/0x124
<6>[   40.191595][    C6]  call_timer_fn+0x5c/0x3b4
<6>[   40.191602][    C6]  expire_timers+0xe0/0x49c
<6>[   40.191609][    C6]  __run_timers+0x34c/0x48c
<6>[   40.191616][    C6]  run_timer_softirq+0x28/0x58
<6>[   40.191621][    C6]  efi_header_end+0x168/0x690
<6>[   40.191628][    C6]  __irq_exit_rcu+0x108/0x124
<6>[   40.191635][    C6]  __handle_domain_irq+0x130/0x1b4
<6>[   40.191643][    C6]  gic_handle_irq.29882+0x6c/0x2d8
<6>[   40.191648][    C6]  el1_irq+0xdc/0x1c0
<6>[   40.191656][    C6]  __delay+0xc0/0x180
<6>[   40.191663][    C6]  devinet_ioctl+0x21c/0x75c
<6>[   40.191668][    C6]  inet_ioctl+0xb8/0x1f8
<6>[   40.191675][    C6]  sock_do_ioctl+0x70/0x2ac
<6>[   40.191682][    C6]  sock_ioctl+0x5dc/0xa74
<6>[   40.191688][    C6]  __arm64_sys_ioctl+0x178/0x1fc
<6>[   40.191694][    C6]  el0_svc_common+0xc0/0x24c
<6>[   40.191699][    C6]  el0_svc+0x28/0x88
<6>[   40.191705][    C6]  el0_sync_handler+0x8c/0xf0
<6>[   40.191710][    C6]  el0_sync+0x198/0x1c0
<6>[   40.191715][    C6] rtnetlink: -- rtnl_print_btrace end --

<6>[   42.181879][ T2206] rtnetlink: rtnl_lock is held by [2206] from
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

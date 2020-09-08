Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5F7C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 14:12:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28C81227C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 14:12:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1ObsVDvW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rMo6ewTv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28C81227C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HQLl+vZ5Np/wyE2vhY8BgwCgYirGUuhy82nrF0abpew=; b=1ObsVDvW+fCgZg3EjGZkuCgQV
	lotSNwoHfFw8FZVvkktlFmhPRv7RxJndBzK7TnB6NOc+sfHe3FKlNgWNtUgKpRR3kYeu41zFjfu+x
	JQO2ZAb2wddLxlnZT1UDQAjVxVARJG0bXtOm/IDG6Z8xn73VhsIZ8RtPoAYedTKWVwg19ed/UI8gQ
	crujuQu1lGKSuibY/1g0QE281/gXLxD/X4+o/VS3WXx8xTE2aQPbX+hOIICJwmDZQcBdHssWGcV96
	Afoyg/CiK1qCvbdgeVNKFaQr99tpW1PRSlHetU10Eri8R+jE8MWwNwU97ryfne554Tbf7jH+kg+f9
	zHICWhADQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFeMD-0007n0-Hd; Tue, 08 Sep 2020 14:12:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFeM9-0007kf-6u
 for linux-mediatek@lists.infradead.org; Tue, 08 Sep 2020 14:12:22 +0000
X-UUID: 928fad0c83cd49cd8c0bd96d3331cb1d-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FqTTxWSYan26ZAkei6AdVrWyvoF2xG3nHsa0Msyv8qI=; 
 b=rMo6ewTvI6SaOTD7Hfft5Q/hS98y4HBUrekGIRnrNByv2rDmHzanpdcb+/dnwuhfbmIzieyC6BGAFZfP/CDW/SmEex/AvWqQNdnaNbQIo+Lkf20I+6FIyvYrO/8RHh8Qv0aT/s057sxwmDpUd5Ni6pKIuriMqsZhYDo2ycFFlkU=;
X-UUID: 928fad0c83cd49cd8c0bd96d3331cb1d-20200908
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 337666154; Tue, 08 Sep 2020 06:12:15 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 07:06:58 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 22:06:48 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Sep 2020 22:06:49 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v9 3/3] binder: add transaction latency tracer
Date: Tue, 8 Sep 2020 22:06:48 +0800
Message-ID: <1599574008-5805-4-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1599574008-5805-1-git-send-email-Frankie.Chang@mediatek.com>
References: <1599543504.16905.65.camel@mtkswgap22>
 <1599574008-5805-1-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_101221_447668_9C6D21F2 
X-CRM114-Status: GOOD (  25.16  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>,
 "Frankie.Chang" <Frankie.Chang@mediatek.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>,
 Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Frankie.Chang" <Frankie.Chang@mediatek.com>

Record start/end timestamp for binder transaction.
When transaction is completed or transaction is free,
it would be checked if transaction latency over threshold
(default 2 sec), if yes, printing related information for tracing.

/* Implement details */
- Add latency tracer module to monitor transaction
  by attaching to new tracepoints introduced
  when transactions are allocated and freed.
  The trace_binder_txn_latency_free would not be enabled
  by default. Monitoring which transaction is too slow to
  cause some of exceptions is important. So we hook the
  tracepoint to call the monitor function.

- Since some of modules would trigger timeout NE
  if their binder transaction don't finish in time,
  such as audio timeout (5 sec), even BT command
  timeout (2 sec), etc.
  Therefore, setting the timeout threshold as default
  2 seconds could be helpful to debug.
  But this timeout threshold is configurable, to let
  all users determine the more suitable threshold.

- The reason why printing the related information to
  kernel information log but not trace buffer is that
  some abnormal transactions may be pending for a long
  time ago, they could not be recorded due to buffer
  limited.

Signed-off-by: Frankie.Chang <Frankie.Chang@mediatek.com>
Acked-by: Todd Kjos <tkjos@google.com>
---
 drivers/android/Kconfig                 |    8 +++
 drivers/android/Makefile                |    1 +
 drivers/android/binder.c                |    6 ++
 drivers/android/binder_internal.h       |   13 ++++
 drivers/android/binder_latency_tracer.c |  108 +++++++++++++++++++++++++++++++
 drivers/android/binder_trace.h          |   26 +++++++-
 6 files changed, 159 insertions(+), 3 deletions(-)
 create mode 100644 drivers/android/binder_latency_tracer.c

diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
index 53b22e2..8aadaf4 100644
--- a/drivers/android/Kconfig
+++ b/drivers/android/Kconfig
@@ -54,6 +54,14 @@ config ANDROID_BINDER_IPC_SELFTEST
 	  exhaustively with combinations of various buffer sizes and
 	  alignments.
 
+config BINDER_TRANSACTION_LATENCY_TRACKING
+	tristate "Android Binder transaction tracking"
+	help
+	  Used for track abnormal binder transaction which is over threshold,
+	  when the transaction is done or be free, this transaction would be
+	  checked whether it executed overtime.
+	  If yes, printing out the detailed info.
+
 endif # if ANDROID
 
 endmenu
diff --git a/drivers/android/Makefile b/drivers/android/Makefile
index c9d3d0c9..c2ffdb6 100644
--- a/drivers/android/Makefile
+++ b/drivers/android/Makefile
@@ -4,3 +4,4 @@ ccflags-y += -I$(src)			# needed for trace events
 obj-$(CONFIG_ANDROID_BINDERFS)		+= binderfs.o
 obj-$(CONFIG_ANDROID_BINDER_IPC)	+= binder.o binder_alloc.o
 obj-$(CONFIG_ANDROID_BINDER_IPC_SELFTEST) += binder_alloc_selftest.o
+obj-$(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)	+= binder_latency_tracer.o
diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 0cab900..65ad38c 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -2674,6 +2674,7 @@ static void binder_transaction(struct binder_proc *proc,
 		return_error_line = __LINE__;
 		goto err_alloc_t_failed;
 	}
+	trace_binder_txn_latency_alloc(t);
 	INIT_LIST_HEAD(&t->fd_fixups);
 	binder_stats_created(BINDER_STAT_TRANSACTION);
 	spin_lock_init(&t->lock);
@@ -5177,6 +5178,7 @@ static void print_binder_transaction_ilocked(struct seq_file *m,
 		   to_proc ? to_proc->pid : 0,
 		   t->to_thread ? t->to_thread->pid : 0,
 		   t->code, t->flags, t->priority, t->need_reply);
+	trace_binder_txn_latency_info(m, t);
 	spin_unlock(&t->lock);
 
 	if (proc != to_proc) {
@@ -5818,4 +5820,8 @@ static int __init binder_init(void)
 #define CREATE_TRACE_POINTS
 #include "binder_trace.h"
 
+EXPORT_TRACEPOINT_SYMBOL(binder_txn_latency_alloc);
+EXPORT_TRACEPOINT_SYMBOL(binder_txn_latency_info);
+EXPORT_TRACEPOINT_SYMBOL(binder_txn_latency_free);
+
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h
index 872232f..14076ab 100644
--- a/drivers/android/binder_internal.h
+++ b/drivers/android/binder_internal.h
@@ -15,6 +15,11 @@
 #include <uapi/linux/android/binderfs.h>
 #include "binder_alloc.h"
 
+#if IS_ENABLED(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)
+#include <linux/rtc.h>
+#include <linux/time.h>
+#endif
+
 struct binder_context {
 	struct binder_node *binder_context_mgr_node;
 	struct mutex context_mgr_node_lock;
@@ -524,6 +529,14 @@ struct binder_transaction {
 	 * during thread teardown
 	 */
 	spinlock_t lock;
+	/**
+	 * @ts and @real_ts are used to record the time
+	 * that the binder transaction startup
+	 */
+#if IS_ENABLED(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)
+	struct timespec64 ts;
+	struct timespec64 real_ts;
+#endif
 };
 
 /**
diff --git a/drivers/android/binder_latency_tracer.c b/drivers/android/binder_latency_tracer.c
new file mode 100644
index 0000000..1b889af
--- /dev/null
+++ b/drivers/android/binder_latency_tracer.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 MediaTek Inc.
+ */
+
+#include <linux/module.h>
+#include <uapi/linux/android/binder.h>
+#include "binder_internal.h"
+#include "binder_trace.h"
+
+/**
+ * The reason setting the binder_txn_latency_threshold to 2 sec
+ * is that most of timeout abort is greater or equal to 2 sec.
+ * Making it configurable to let all users determine which
+ * threshold is more suitable.
+ */
+static uint32_t binder_txn_latency_threshold = 2;
+module_param_named(threshold, binder_txn_latency_threshold,
+			uint, 0644);
+
+/*
+ * probe_binder_txn_latency_free - Output info of a delay transaction
+ * @t:          pointer to the over-time transaction
+ */
+void probe_binder_txn_latency_free(void *ignore, struct binder_transaction *t,
+					int from_proc, int from_thread,
+					int to_proc, int to_thread)
+{
+	struct rtc_time tm;
+	struct timespec64 *startime;
+	struct timespec64 cur, sub_t;
+
+	ktime_get_ts64(&cur);
+	startime = &t->ts;
+	sub_t = timespec64_sub(cur, *startime);
+
+	/* if transaction time is over than binder_txn_latency_threshold (sec),
+	 * show timeout warning log.
+	 */
+	if (sub_t.tv_sec < binder_txn_latency_threshold)
+		return;
+
+	rtc_time64_to_tm(t->real_ts.tv_sec, &tm);
+
+	pr_info_ratelimited("%d: from %d:%d to %d:%d",
+			t->debug_id, from_proc, from_thread,
+			to_proc, to_thread);
+
+	pr_info_ratelimited(" total %u.%03ld s code %u start %lu.%03ld android %d-%02d-%02d %02d:%02d:%02d.%03lu\n",
+			(unsigned int)sub_t.tv_sec,
+			(sub_t.tv_nsec / NSEC_PER_MSEC),
+			t->code,
+			(unsigned long)startime->tv_sec,
+			(startime->tv_nsec / NSEC_PER_MSEC),
+			(tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
+			tm.tm_hour, tm.tm_min, tm.tm_sec,
+			(unsigned long)(t->real_ts.tv_nsec / NSEC_PER_MSEC));
+}
+
+static void probe_binder_txn_latency_alloc(void *ignore,
+					struct binder_transaction *t)
+{
+	ktime_get_ts64(&t->ts);
+	ktime_get_real_ts64(&t->real_ts);
+	t->real_ts.tv_sec -= (sys_tz.tz_minuteswest * 60);
+}
+
+static void probe_binder_txn_latency_info(void *ignore, struct seq_file *m,
+					struct binder_transaction *t)
+{
+	struct rtc_time tm;
+
+	rtc_time64_to_tm(t->real_ts.tv_sec, &tm);
+	seq_printf(m,
+		   " start %lu.%06lu android %d-%02d-%02d %02d:%02d:%02d.%03lu",
+		   (unsigned long)t->ts.tv_sec,
+		   (t->ts.tv_nsec / NSEC_PER_USEC),
+		   (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
+		   tm.tm_hour, tm.tm_min, tm.tm_sec,
+		   (unsigned long)(t->real_ts.tv_nsec / NSEC_PER_MSEC));
+}
+
+static int __init init_binder_latency_tracer(void)
+{
+	register_trace_binder_txn_latency_free(
+			probe_binder_txn_latency_free, NULL);
+	register_trace_binder_txn_latency_alloc(
+			probe_binder_txn_latency_alloc, NULL);
+	register_trace_binder_txn_latency_info(
+			probe_binder_txn_latency_info, NULL);
+
+	return 0;
+}
+
+static void exit_binder_latency_tracer(void)
+{
+	unregister_trace_binder_txn_latency_free(
+			probe_binder_txn_latency_free, NULL);
+	unregister_trace_binder_txn_latency_alloc(
+			probe_binder_txn_latency_alloc, NULL);
+	unregister_trace_binder_txn_latency_info(
+			probe_binder_txn_latency_info, NULL);
+}
+
+module_init(init_binder_latency_tracer);
+module_exit(exit_binder_latency_tracer);
+
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
index 8eeccdc..0933e63 100644
--- a/drivers/android/binder_trace.h
+++ b/drivers/android/binder_trace.h
@@ -95,6 +95,17 @@
 		  __entry->thread_todo)
 );
 
+DECLARE_TRACE(binder_txn_latency_alloc,
+	TP_PROTO(struct binder_transaction *t),
+	TP_ARGS(t)
+);
+
+DECLARE_TRACE(binder_txn_latency_info,
+	TP_PROTO(struct seq_file *m,
+		 struct binder_transaction *t),
+	TP_ARGS(m, t)
+);
+
 TRACE_EVENT(binder_txn_latency_free,
 	TP_PROTO(struct binder_transaction *t,
 		 int from_proc, int from_thread,
@@ -108,6 +119,8 @@
 		__field(int, to_thread)
 		__field(unsigned int, code)
 		__field(unsigned int, flags)
+		__field(unsigned long, start_sec)
+		__field(unsigned long, start_nsec)
 	),
 	TP_fast_assign(
 		__entry->debug_id = t->debug_id;
@@ -117,11 +130,18 @@
 		__entry->to_thread = to_thread;
 		__entry->code = t->code;
 		__entry->flags = t->flags;
-	),
-	TP_printk("transaction=%d from %d:%d to %d:%d flags=0x%x code=0x%x",
+#if IS_ENABLED(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)
+		__entry->start_sec = t->ts.tv_sec;
+		__entry->start_nsec = t->ts.tv_nsec / NSEC_PER_MSEC;
+#else
+		__entry->start_sec = 0;
+		__entry->start_nsec = 0;
+#endif
+	),
+	TP_printk("transaction=%d from %d:%d to %d:%d flags=0x%x code=0x%x start %lu.%03ld",
 		  __entry->debug_id, __entry->from_proc, __entry->from_thread,
 		  __entry->to_proc, __entry->to_thread, __entry->code,
-		  __entry->flags)
+		  __entry->flags, __entry->start_sec, __entry->start_nsec)
 );
 
 TRACE_EVENT(binder_transaction,
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

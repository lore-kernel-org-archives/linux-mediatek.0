Return-Path: <SRS0=voLZ=3Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDC8C35249
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 08:25:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F65520730
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 08:25:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IkCaLZwk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qLP/9yEa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F65520730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6oaQSf5IyrXEZGPAXW6aGhuW/MNyI/Bvd7yoqgWkATs=; b=IkCaLZwkPOhdCV
	nbNGKq5ShPPwGz/1Tr+KmNSKWeD5KryNwETFm3R3LD9NVspUCl6ffiBgPC/PZh+4O1gmfOTtA+Thg
	40SHxfcfsiVVjeDM2mPcQ+iH0B+tzDQiuPThdDFV93kaD9T76u3ideg9ktT02JWJm+x81nnvoOP3G
	7OHI7uDfqnsPifGYRxbSSjtaqFH3KHfAg/gYNq4C0lZQt7bHMKPgcUSUua0LNssrMGLdBmirkoW/U
	gA6F5O0JLRoA0mZEoD+vllUqCBmS2liliJ8xzlEkAcklAzkIwM5y9bkqHL+7FDNEYhBqPDnIMChTb
	Vhgi1og0PrDESs6DQUvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izFzy-0002gJ-1N; Wed, 05 Feb 2020 08:25:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izFzv-0002fm-HY
 for linux-mediatek@lists.infradead.org; Wed, 05 Feb 2020 08:25:25 +0000
X-UUID: 1d7128ebb5034c8795d46345899b3554-20200205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+Eehl38VYEUnGQv2W5X+HsgZ4ZWAQEHn3zauirYc0JY=; 
 b=qLP/9yEaVNLyjmffhkleI1sCLuvIQo61R2habIuvMwzyVgvIE9nitOg0w6S0uKq5UMQZ1DRx0uDN/vHaJSAtIgNZeve0POCcRI/ud2WVzxe5IFCNF3rs105TjlTm5ed/RlOQcb9ecviKtHx09FNfKyHIk6/S+2PK+Nd6OgHS7xc=;
X-UUID: 1d7128ebb5034c8795d46345899b3554-20200205
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1872029705; Wed, 05 Feb 2020 00:25:18 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Feb 2020 00:15:14 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Feb 2020 16:14:28 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 5 Feb 2020 16:14:48 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Todd Kjos
 <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Joel Fernandes
 <joel@joelfernandes.org>, Christian Brauner <christian@brauner.io>
Subject: [PATCH v1 1/1] binder: transaction latency tracking for user build
Date: Wed, 5 Feb 2020 14:52:52 +0800
Message-ID: <1580885572-14272-1-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_002523_597053_2B66D424 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: Frankie Chang <Frankie.Chang@mediatek.com>, Jian-Min.Liu@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Record start/end timestamp to binder transaction.
When transaction is completed or transaction is free,
it would be checked if transaction latency over threshold (2 sec),
if yes, printing related information for tracing.

Signed-off-by: Frankie Chang <Frankie.Chang@mediatek.com>
---
 drivers/android/Kconfig           |    8 +++
 drivers/android/binder.c          |  107 +++++++++++++++++++++++++++++++++++++
 drivers/android/binder_internal.h |    4 ++
 3 files changed, 119 insertions(+)

diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
index 6fdf2ab..7ba80eb 100644
--- a/drivers/android/Kconfig
+++ b/drivers/android/Kconfig
@@ -54,6 +54,14 @@ config ANDROID_BINDER_IPC_SELFTEST
 	  exhaustively with combinations of various buffer sizes and
 	  alignments.
 
+config BINDER_USER_TRACKING
+	bool "Android Binder transaction tracking"
+	help
+	  Used for track abnormal binder transaction which is over 2 seconds,
+	  when the transaction is done or be free, this transaction would be
+	  checked whether it executed overtime.
+	  If yes, printing out the detail info about it.
+
 endif # if ANDROID
 
 endmenu
diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index e9bc9fc..5a352ee 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -76,6 +76,11 @@
 #include "binder_internal.h"
 #include "binder_trace.h"
 
+#ifdef CONFIG_BINDER_USER_TRACKING
+#include <linux/rtc.h>
+#include <linux/time.h>
+#endif
+
 static HLIST_HEAD(binder_deferred_list);
 static DEFINE_MUTEX(binder_deferred_lock);
 
@@ -591,8 +596,104 @@ struct binder_transaction {
 	 * during thread teardown
 	 */
 	spinlock_t lock;
+#ifdef CONFIG_BINDER_USER_TRACKING
+	struct timespec timestamp;
+	struct timeval tv;
+#endif
 };
 
+#ifdef CONFIG_BINDER_USER_TRACKING
+
+/*
+ * binder_print_delay - Output info of a delay transaction
+ * @t:          pointer to the over-time transaction
+ */
+static void binder_print_delay(struct binder_transaction *t)
+{
+	struct rtc_time tm;
+	struct timespec *startime;
+	struct timespec cur, sub_t;
+
+	ktime_get_ts(&cur);
+	startime = &t->timestamp;
+	sub_t = timespec_sub(cur, *startime);
+
+	/* if transaction time is over than 2 sec,
+	 * show timeout warning log.
+	 */
+	if (sub_t.tv_sec < 2)
+		return;
+
+	rtc_time_to_tm(t->tv.tv_sec, &tm);
+
+	spin_lock(&t->lock);
+	pr_info_ratelimited("%d: from %d:%d to %d:%d",
+			    t->debug_id,
+			    t->from ? t->from->proc->pid : 0,
+			    t->from ? t->from->pid : 0,
+			    t->to_proc ? t->to_proc->pid : 0,
+			    t->to_thread ? t->to_thread->pid : 0);
+	spin_unlock(&t->lock);
+
+	pr_info_ratelimited(" total %u.%03ld s code %u start %lu.%03ld android %d-%02d-%02d %02d:%02d:%02d.%03lu\n",
+			    (unsigned int)sub_t.tv_sec,
+			    (sub_t.tv_nsec / NSEC_PER_MSEC),
+			    t->code,
+			    (unsigned long)startime->tv_sec,
+			    (startime->tv_nsec / NSEC_PER_MSEC),
+			    (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
+			    tm.tm_hour, tm.tm_min, tm.tm_sec,
+			    (unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
+}
+
+static void binder_log_entry_setup(struct binder_transaction_log_entry *e)
+{
+	ktime_get_ts(&e->timestamp);
+	do_gettimeofday(&e->tv);
+	e->tv.tv_sec -= (sys_tz.tz_minuteswest * 60);
+}
+
+static void timestamp_copy(struct binder_transaction *t,
+			   struct binder_transaction_log_entry *e)
+{
+	memcpy(&t->timestamp, &e->timestamp, sizeof(struct timespec));
+	memcpy(&t->tv, &e->tv, sizeof(struct timeval));
+}
+
+static void print_binder_transaction_ext(struct seq_file *m,
+					 struct binder_transaction *t)
+{
+	struct rtc_time tm;
+
+	rtc_time_to_tm(t->tv.tv_sec, &tm);
+	seq_printf(m,
+		   " start %lu.%06lu android %d-%02d-%02d %02d:%02d:%02d.%03lu",
+		   (unsigned long)t->timestamp.tv_sec,
+		   (t->timestamp.tv_nsec / NSEC_PER_USEC),
+		   (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
+		   tm.tm_hour, tm.tm_min, tm.tm_sec,
+		   (unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
+}
+#else
+static void binder_print_delay(struct binder_transaction *t)
+{
+}
+
+static void binder_log_entry_setup(struct binder_transaction_log_entry *e)
+{
+}
+
+static void timestamp_copy(struct binder_transaction *t,
+			   struct binder_transaction_log_entry *e)
+{
+}
+
+static void print_binder_transaction_ext(struct seq_file *m,
+					 struct binder_transaction *t)
+{
+}
+#endif
+
 /**
  * struct binder_object - union of flat binder object types
  * @hdr:   generic object header
@@ -1927,6 +2028,7 @@ static void binder_free_transaction(struct binder_transaction *t)
 	 * If the transaction has no target_proc, then
 	 * t->buffer->transaction has already been cleared.
 	 */
+	binder_print_delay(t);
 	binder_free_txn_fixups(t);
 	kfree(t);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION);
@@ -2872,6 +2974,8 @@ static void binder_transaction(struct binder_proc *proc,
 	e->offsets_size = tr->offsets_size;
 	strscpy(e->context_name, proc->context->name, BINDERFS_MAX_NAME);
 
+	binder_log_entry_setup(e);
+
 	if (reply) {
 		binder_inner_proc_lock(proc);
 		in_reply_to = thread->transaction_stack;
@@ -3058,6 +3162,7 @@ static void binder_transaction(struct binder_proc *proc,
 		return_error_line = __LINE__;
 		goto err_alloc_t_failed;
 	}
+	timestamp_copy(t, e);
 	INIT_LIST_HEAD(&t->fd_fixups);
 	binder_stats_created(BINDER_STAT_TRANSACTION);
 	spin_lock_init(&t->lock);
@@ -3496,6 +3601,7 @@ static void binder_transaction(struct binder_proc *proc,
 	kfree(tcomplete);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
 err_alloc_tcomplete_failed:
+	binder_print_delay(t);
 	kfree(t);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION);
 err_alloc_t_failed:
@@ -5544,6 +5650,7 @@ static void print_binder_transaction_ilocked(struct seq_file *m,
 		   t->to_thread ? t->to_thread->pid : 0,
 		   t->code, t->flags, t->priority, t->need_reply);
 	spin_unlock(&t->lock);
+	print_binder_transaction_ext(m, t);
 
 	if (proc != to_proc) {
 		/*
diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h
index ae99109..ea52c5d 100644
--- a/drivers/android/binder_internal.h
+++ b/drivers/android/binder_internal.h
@@ -131,6 +131,10 @@ struct binder_transaction_log_entry {
 	uint32_t return_error;
 	uint32_t return_error_param;
 	char context_name[BINDERFS_MAX_NAME + 1];
+#ifdef CONFIG_BINDER_USER_TRACKING
+	struct timespec timestamp;
+	struct timeval tv;
+#endif
 };
 
 struct binder_transaction_log {
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8917C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 14:09:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9051D2075F
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 14:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1M4IgVb0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tZeuGogk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9051D2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nXS+92i8waFdDaE5mEQx2qxYOKpBmdWk5oeFabe2+Ig=; b=1M4IgVb0YBYufadphAT2mG49P
	0ep7boiLHMjVAaxkq/ThpxZFNJwHtXj7ntXRkyEoLgEF6sGfo1vWVRtAE1UJZqVc1MRbYuSOG4QQR
	+EhMcRuv+mQq1GTkf0+NnOXspnm/ZkXrmQt6NZ9woCV5BZ8FEMyUpgCZyZFGLJtC6tfsgQ8ubMIEI
	WuIP+sUEm1wSAr7LZ0ZWQx7dEHNx6sMEAyjjIIB+CRt4zBgk7oxtQ8v4AtICTJfI5MLhUFLs+BR0z
	Ze0EekCF4DHfCqqPJaI1V/B4ybKqeDakuCey/xEz0MVVpPsZdMlH65xmhnXh9ClR24CB9At9wt9MI
	US5NIbwcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2xdQ-0002XO-Np; Tue, 04 Aug 2020 14:09:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2xdN-0002Vd-Fq
 for linux-mediatek@lists.infradead.org; Tue, 04 Aug 2020 14:09:42 +0000
X-UUID: 7b75b90caed74c7faa56a8cca81b827d-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YvqHDXjwhh3CKwDJmfh6+1BizKx62Mp4F6DG3h3i0eI=; 
 b=tZeuGogkUME5QB1HoKuo6lpbBa1OAwB0jPHqDH05xYOfsHLf6nO93T/x16im+Mv5riGsRX9wiciJhdZ3a8ePPjR+C9PSayaKVleZijdsJAWxlwK7rvGjRjF3X1kz6ndX2MpGf75u/rv4j9gyFYM51kHr5kb1Tb/K92iKBWW/VGY=;
X-UUID: 7b75b90caed74c7faa56a8cca81b827d-20200804
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 776540981; Tue, 04 Aug 2020 06:09:32 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 06:59:25 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 21:59:13 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 4 Aug 2020 21:59:13 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Todd Kjos <tkjos@google.com>
Subject: [PATCH v7 2/3] binder: add trace at free transaction.
Date: Tue, 4 Aug 2020 21:59:11 +0800
Message-ID: <1596549552-5466-3-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1596549552-5466-1-git-send-email-Frankie.Chang@mediatek.com>
References: <1596509145.5207.21.camel@mtkswgap22>
 <1596549552-5466-1-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_100941_699983_E12409B3 
X-CRM114-Status: GOOD (  12.69  )
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
Cc: wsd_upstream@mediatek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Jian-Min
 Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>,
 Frankie Chang <Frankie.Chang@mediatek.com>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Frankie.Chang" <Frankie.Chang@mediatek.com>

Since the original trace_binder_transaction_received cannot
precisely present the real finished time of transaction, adding a
trace_binder_txn_latency_free at the point of free transaction
may be more close to it.

Signed-off-by: Frankie.Chang <Frankie.Chang@mediatek.com>
---
 drivers/android/binder.c       |   18 ++++++++++++++++++
 drivers/android/binder_trace.h |   29 +++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 2df146f..1bfadc2 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -1508,6 +1508,20 @@ static void binder_free_txn_fixups(struct binder_transaction *t)
 	}
 }
 
+static void binder_txn_latency_free(struct binder_transaction *t)
+{
+	int from_proc, from_thread, to_proc, to_thread;
+
+	spin_lock(&t->lock);
+	from_proc = t->from ? t->from->proc->pid : 0;
+	from_thread = t->from ? t->from->pid : 0;
+	to_proc = t->to_proc ? t->to_proc->pid : 0;
+	to_thread = t->to_thread ? t->to_thread->pid : 0;
+	spin_unlock(&t->lock);
+
+	trace_binder_txn_latency_free(t, from_proc, from_thread, to_proc, to_thread);
+}
+
 static void binder_free_transaction(struct binder_transaction *t)
 {
 	struct binder_proc *target_proc = t->to_proc;
@@ -1518,6 +1532,8 @@ static void binder_free_transaction(struct binder_transaction *t)
 			t->buffer->transaction = NULL;
 		binder_inner_proc_unlock(target_proc);
 	}
+	if (trace_binder_txn_latency_free_enabled())
+		binder_txn_latency_free(t);
 	/*
 	 * If the transaction has no target_proc, then
 	 * t->buffer->transaction has already been cleared.
@@ -3093,6 +3109,8 @@ static void binder_transaction(struct binder_proc *proc,
 	kfree(tcomplete);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
 err_alloc_tcomplete_failed:
+	if (trace_binder_txn_latency_free_enabled())
+		binder_txn_latency_free(t);
 	kfree(t);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION);
 err_alloc_t_failed:
diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
index 6731c3c..eb2c53c 100644
--- a/drivers/android/binder_trace.h
+++ b/drivers/android/binder_trace.h
@@ -95,6 +95,35 @@
 		  __entry->thread_todo)
 );
 
+TRACE_EVENT(binder_txn_latency_free,
+	TP_PROTO(struct binder_transaction *t
+		 int from_proc, int from_thread
+		 int to_proc, int to_thread),
+	TP_ARGS(t, from_proc, from_thread, to_proc, to_thread),
+	TP_STRUCT__entry(
+		__field(int, debug_id)
+		__field(int, from_proc)
+		__field(int, from_thread)
+		__field(int, to_proc)
+		__field(int, to_thread)
+		__field(unsigned int, code)
+		__field(unsigned int, flags)
+	),
+	TP_fast_assign(
+		__entry->debug_id = t->debug_id;
+		__entry->from_proc = from_proc;
+		__entry->from_thread = from_thread;
+		__entry->to_proc = to_proc;
+		__entry->to_thread = to_thread;
+		__entry->code = t->code;
+		__entry->flags = t->flags;
+	),
+	TP_printk("transaction=%d from %d:%d to %d:%d flags=0x%x code=0x%x",
+		  __entry->debug_id, __entry->from_proc, __entry->from_thread,
+		  __entry->to_proc, __entry->to_thread, __entry->code,
+		  __entry->flags)
+);
+
 TRACE_EVENT(binder_transaction,
 	TP_PROTO(bool reply, struct binder_transaction *t,
 		 struct binder_node *target_node),
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

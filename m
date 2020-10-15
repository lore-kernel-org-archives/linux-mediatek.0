Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D29EC43457
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 17:03:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B9D22254
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 17:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0ISYhHay";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hiMGER9q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1B9D22254
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a9ayad6KTFT+qHdkwOEeTqSRIx8dZndDIJf7hmZUpKQ=; b=0ISYhHay00MiN0U6AOMeaTTTI
	CmiIgrEWwTsLZxo99thSM98f5l3eWi1WkcG3XtGGZoADbzd45w4edqwdSMnUId4V8D4rGq3DcE1eM
	zMiaYGp4eFBSENj4byjl7R4NQpGfzTZThTRNUdQ+pK/V1SrQjHSS/oZBN0nzACqJ0jHAZ0MFQED5Z
	noIyCOHGUaxhuviVbhz7QvXSFFnqUriCslcN1sN66tzLAsoZiM8hDdoKSjDnovp7bGUbDIW/HwXb7
	3j6e4VcYeDkPmQWTT+AO6FbLieHK51/AUG++Z4fmwjGGmP1KQs7szLzNFP1qdhOVuTNd9m535W2I7
	emCVUKhJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT6eq-00043c-7p; Thu, 15 Oct 2020 17:03:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT6en-000422-Q7
 for linux-mediatek@lists.infradead.org; Thu, 15 Oct 2020 17:03:14 +0000
X-UUID: 9b8f4e9d8c90447e8804da8e02673fef-20201015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GBklZnmwpHaf81v4IdUMWotImJKGAR36WSKfuBH6YzA=; 
 b=hiMGER9qASsQUGtHTQaRH8VsLfjl7gyt13ryNztVK/TAgHYIzF1PKD0i1cewyhbQnMRHFE2qkfUv5Di8sHDLmgjCHqVVpoNnYQzj1KWGpMS35DkzvqzSrfhsFQLs+PoMHi7XDmejzQUShTFlGuSZUjv/MeUwnxAm7w660n1fBoA=;
X-UUID: 9b8f4e9d8c90447e8804da8e02673fef-20201015
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1337853303; Thu, 15 Oct 2020 09:03:02 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 10:03:00 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Oct 2020 01:02:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Oct 2020 01:02:58 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v10 2/3] binder: add trace at free transaction.
Date: Fri, 16 Oct 2020 01:02:56 +0800
Message-ID: <1602781377-4278-3-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1602781377-4278-1-git-send-email-Frankie.Chang@mediatek.com>
References: <20200916173845.GA3072065@kroah.com>
 <1602781377-4278-1-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_130313_985546_4180D5F0 
X-CRM114-Status: GOOD (  11.97  )
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

Since the original trace_binder_transaction_received cannot
precisely present the real finished time of transaction, adding a
trace_binder_txn_latency_free at the point of free transaction
may be more close to it.

Signed-off-by: Frankie.Chang <Frankie.Chang@mediatek.com>
Acked-by: Todd Kjos <tkjos@google.com>
---
 drivers/android/binder.c       |   18 ++++++++++++++++++
 drivers/android/binder_trace.h |   29 +++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 943c49c..0cab900 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -1507,6 +1507,20 @@ static void binder_free_txn_fixups(struct binder_transaction *t)
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
@@ -1517,6 +1531,8 @@ static void binder_free_transaction(struct binder_transaction *t)
 			t->buffer->transaction = NULL;
 		binder_inner_proc_unlock(target_proc);
 	}
+	if (trace_binder_txn_latency_free_enabled())
+		binder_txn_latency_free(t);
 	/*
 	 * If the transaction has no target_proc, then
 	 * t->buffer->transaction has already been cleared.
@@ -3096,6 +3112,8 @@ static void binder_transaction(struct binder_proc *proc,
 	kfree(tcomplete);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
 err_alloc_tcomplete_failed:
+	if (trace_binder_txn_latency_free_enabled())
+		binder_txn_latency_free(t);
 	kfree(t);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION);
 err_alloc_t_failed:
diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
index 6731c3c..8eeccdc 100644
--- a/drivers/android/binder_trace.h
+++ b/drivers/android/binder_trace.h
@@ -95,6 +95,35 @@
 		  __entry->thread_todo)
 );
 
+TRACE_EVENT(binder_txn_latency_free,
+	TP_PROTO(struct binder_transaction *t,
+		 int from_proc, int from_thread,
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

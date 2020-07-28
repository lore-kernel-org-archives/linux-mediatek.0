Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4D4C433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 03:28:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EDB12072E
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 03:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aDk3GaM2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="I0SP9bMb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EDB12072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1nKO9a8eraQhwJUU2hal7kxvsYY9oAZAWbFFlIh8YrM=; b=aDk3GaM2UnaJnDH80M241amAp
	KjU2hYjHyZO1iVc9wq12pGUBcfAtpLU66B4c3Qqhkqm0znHBrRtPy04/tf2jj42SRI6kOmw1nZYfW
	fmqVE+zocZ8bPbt7IaHuJgESa2t1T3Xu8aRoDmLFvS9DCExb2nqpBoAExtQFmTl4TrQKBL754uiP6
	cYh+29Uiw74C3QWZdSxkChAIgjT1Gt9qww6nVe4lsszObyfWytSfrFofJozk/G6X0HQB+PpOJJujh
	5Zy57QCCl747qr48JbLm6LKHRA9wV2nxBz1ZjlD3Y5EffbRDXI0F3gYtAXye9HLgnany2pnK8zOMQ
	KA4HRB05g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0GHo-00030L-9A; Tue, 28 Jul 2020 03:28:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0GHm-0002z8-3S
 for linux-mediatek@lists.infradead.org; Tue, 28 Jul 2020 03:28:15 +0000
X-UUID: 7a10cf3bc0214095a055966b33ced91f-20200727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oFbqZRvunwxR2x3NX4VJTIH2wGfuuJT6jKUmQmAqW0g=; 
 b=I0SP9bMbsALP5Iumc87b64j7ptWCSGvj11dvwGpYK4RPmjRcHA22j/VV7vpNaQtH+YH/NsLjDYGiszwMOWdS8ibVMVW79Rn3l+Jg9Hy1JsDM+Dbnhmp5WhS1i2gUfYW1oc/bR8kaHgRCCLYFhjLfbqiZOmleQjTIzbybW0fkiDE=;
X-UUID: 7a10cf3bc0214095a055966b33ced91f-20200727
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 687554323; Mon, 27 Jul 2020 19:28:12 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 20:20:05 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 11:20:03 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Jul 2020 11:20:00 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Todd Kjos <tkjos@google.com>
Subject: [PATCH v6 2/3] binder: add trace at free transaction.
Date: Tue, 28 Jul 2020 11:20:00 +0800
Message-ID: <1595906401-11985-3-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595906401-11985-1-git-send-email-Frankie.Chang@mediatek.com>
References: <1595252430.5899.6.camel@mtkswgap22>
 <1595906401-11985-1-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5EF4B174386E5C2BBBD9CFA1E27E242358E22D020083524886B3E5F4576546E12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_232814_365242_795282A6 
X-CRM114-Status: GOOD (  11.56  )
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
 drivers/android/binder.c       |    6 ++++++
 drivers/android/binder_trace.h |   27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 2df146f..1e6fc40 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -1522,6 +1522,9 @@ static void binder_free_transaction(struct binder_transaction *t)
 	 * If the transaction has no target_proc, then
 	 * t->buffer->transaction has already been cleared.
 	 */
+	spin_lock(&t->lock);
+	trace_binder_txn_latency_free(t);
+	spin_unlock(&t->lock);
 	binder_free_txn_fixups(t);
 	kfree(t);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION);
@@ -3093,6 +3096,9 @@ static void binder_transaction(struct binder_proc *proc,
 	kfree(tcomplete);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
 err_alloc_tcomplete_failed:
+	spin_lock(&t->lock);
+	trace_binder_txn_latency_free(t);
+	spin_unlock(&t->lock);
 	kfree(t);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION);
 err_alloc_t_failed:
diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
index 6731c3c..8ac87d1 100644
--- a/drivers/android/binder_trace.h
+++ b/drivers/android/binder_trace.h
@@ -95,6 +95,33 @@
 		  __entry->thread_todo)
 );
 
+TRACE_EVENT(binder_txn_latency_free,
+	TP_PROTO(struct binder_transaction *t),
+	TP_ARGS(t),
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
+		__entry->from_proc = t->from ? t->from->proc->pid : 0;
+		__entry->from_thread = t->from ? t->from->pid : 0;
+		__entry->to_proc = t->to_proc ? t->to_proc->pid : 0;
+		__entry->to_thread = t->to_thread ? t->to_thread->pid : 0;
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

Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808AEC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 12:24:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A0720734
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 12:24:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="meCdzrsQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ymo9lRm8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50A0720734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QS5MmYn0sIkUPH6y1/csdDp+Prhf/4NW980NeDM8xN0=; b=meCdzrsQF2Bq0n
	Jwk9m5UUW2q+/NzHSyxMRsm52lngtW60eoEu1/d1wSNqmVXwYhgZhxMmdHoTkNOWWtLRYk/myCCBR
	fT8b+6UAA+qjHR2+SeXY/BKQDFmsKoYRwcT26XBYh5k8opvLeN9WSxQyB7G8uB/VZ5uNNJ4csxNpM
	ze0dzwIgeCPGQzIpcLtIDTb2IE/dXBWfVqk+mR//Z690f0y41OLJfTIhVGX7Ohb2mp+cRZD7Xb8e6
	rvUGpvO1wBW2vnIrcFpBnacTdsNoBPPnAysZbtNYasWCyG6CUhLGwkm6zYSmXTfpgCJ9Q0x3hEY5P
	51gv74js/SdbNv7RZhDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jizm4-0005fq-4g; Wed, 10 Jun 2020 12:24:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jizm0-0005dr-AJ
 for linux-mediatek@lists.infradead.org; Wed, 10 Jun 2020 12:24:05 +0000
X-UUID: 78a2d57e5cd94415abf6ab89ab1a896b-20200610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NtK50XTs52GSZTh5Kq7VSX4Pdks19E1mwvG/YSt+9as=; 
 b=Ymo9lRm8ukiyICGGlFKppnzjQVIr/91aL8xK53xb351TkviPKClPPkNkFuKIWiJMpeBn7cIRC86jeXhy79NugX9pfXrkl2fVm7sWfbtN3TUeOK0zabp+nEgrePmTmtRb7tRzfmKJs7PdxAdyl+5jI57rclz6t4RmtWRrE4KkEEM=;
X-UUID: 78a2d57e5cd94415abf6ab89ab1a896b-20200610
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1684392178; Wed, 10 Jun 2020 04:23:54 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 05:23:58 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 20:23:47 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Jun 2020 20:23:48 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Todd Kjos <tkjos@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH v5 2/3] binder: add trace at free transaction.
Date: Wed, 10 Jun 2020 20:23:46 +0800
Message-ID: <1591791827-23871-3-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1591791827-23871-1-git-send-email-Frankie.Chang@mediatek.com>
References: <20200507085544.GB1097552@kroah.com>
 <1591791827-23871-1-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A66ED3D6B4734834A76F7A0270C468CEF49467A38F4202C443B05218EB075DDF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_052404_365538_FC09E5D2 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>,
 "Frankie.Chang" <Frankie.Chang@mediatek.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
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
 drivers/android/binder.c       |    2 ++
 drivers/android/binder_trace.h |   27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 1592396..5ec9af8 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -1523,6 +1523,7 @@ static void binder_free_transaction(struct binder_transaction *t)
 	 * If the transaction has no target_proc, then
 	 * t->buffer->transaction has already been cleared.
 	 */
+	trace_binder_txn_latency_free(t);
 	binder_free_txn_fixups(t);
 	kfree(t);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION);
@@ -3094,6 +3095,7 @@ static void binder_transaction(struct binder_proc *proc,
 	kfree(tcomplete);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
 err_alloc_tcomplete_failed:
+	trace_binder_txn_latency_free(t);
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

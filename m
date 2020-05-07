Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7581C38A2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 08:11:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8B1620753
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 08:11:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RipGf8L5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="O+cpNy4+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8B1620753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1CoHcr5wiV1kz39ln3ALjVdS9wUtiBWFtR0hwDP7b8=; b=RipGf8L5f98I3N
	vh44rJbub3FvMcHh4OeUUEcFQ1pR0vsb0UupDC6HOq4PN2oZZ4Jwts/3ClRtEF5I6vbzTWehJfCPF
	dbZRXV7FiWzpbpCay9jkevmbQo+3urv5e+k0PR8muv0ym3Qbv3sow+0XWRpY6MSOaTSpwGDH+keMA
	h8r3tJmIEbOkyOQCNByWpuu/vXonOHmjK9Sc6KlgBJqmEJb2ujedHb7wJY/O/Q6Ytp/FY2nTNBtAX
	oxApzGSNAiJPl6Xc5J9uBZNEYMyPFbpd1FYTHx8vaenB8OsxuA4maeHpX9CShzZ0D3HFmGE+qwyll
	9lE2Ky0P2B36qCqcJg4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWbca-00049N-DI; Thu, 07 May 2020 08:11:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWbcX-00047o-RY
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 08:11:07 +0000
X-UUID: eafa7b8ad11c417788dfcb53cbf22fcc-20200507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=F+nyFJ3flYJ7tk3owpeDfROhBV44xIrKWeFY224lKrs=; 
 b=O+cpNy4+PbDbq7nNoDsVCC9sU9R17GLXqN0IT7I0xyFBChNzY7kR+QsaoBghGpRB4pxVjr2rgoEUdFJiR8UIdbvAHHskJVdJErUgkgfarxjdhwwTIdoOvTP5WOV+x69rUyUTpspTAviRjLSdju5ZFRpcxzs4s5C/oQrwferxZ1c=;
X-UUID: eafa7b8ad11c417788dfcb53cbf22fcc-20200507
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1185141578; Thu, 07 May 2020 00:11:03 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 May 2020 01:11:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 May 2020 16:10:56 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 7 May 2020 16:10:57 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Todd Kjos
 <tkjos@google.com>, Joel Fernandes <joel@joelfernandes.org>
Subject: [PATCH v4 2/3] binder: add trace at free transaction.
Date: Thu, 7 May 2020 16:10:54 +0800
Message-ID: <1588839055-26677-3-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1588839055-26677-1-git-send-email-Frankie.Chang@mediatek.com>
References: <20200430085105.GF2496467@kroah.com>
 <1588839055-26677-1-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 41FB7FFA086CC0D1E627CE337336D45CE8BDB3C5C1E4C9A5D54E7B976ADF921E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_011105_889855_4DD05810 
X-CRM114-Status: UNSURE (   7.31  )
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
 "Frankie.Chang" <Frankie.Chang@mediatek.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Frankie.Chang" <Frankie.Chang@mediatek.com>

Since the original trace_binder_transaction_received cannot
precisely present the real finished time of transaction, adding a
trace_binder_free_transaction at the point of free transaction
may be more close to it.

Signed-off-by: Frankie.Chang <Frankie.Chang@mediatek.com>
---
 drivers/android/binder.c       |    2 ++
 drivers/android/binder_trace.h |   27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

 Change since v4:
   split up into a patchset series.

 Change since v2:
   add trace/tracepoint at free transaction.

 Change since v1:
   first patchset.

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 1592396..4c3dd98 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -1523,6 +1523,7 @@ static void binder_free_transaction(struct binder_transaction *t)
 	 * If the transaction has no target_proc, then
 	 * t->buffer->transaction has already been cleared.
 	 */
+	trace_binder_free_transaction(t);
 	binder_free_txn_fixups(t);
 	kfree(t);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION);
@@ -3094,6 +3095,7 @@ static void binder_transaction(struct binder_proc *proc,
 	kfree(tcomplete);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
 err_alloc_tcomplete_failed:
+	trace_binder_free_transaction(t);
 	kfree(t);
 	binder_stats_deleted(BINDER_STAT_TRANSACTION);
 err_alloc_t_failed:
diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
index 6731c3c..7acc18d 100644
--- a/drivers/android/binder_trace.h
+++ b/drivers/android/binder_trace.h
@@ -95,6 +95,33 @@
 		  __entry->thread_todo)
 );
 
+TRACE_EVENT(binder_free_transaction,
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

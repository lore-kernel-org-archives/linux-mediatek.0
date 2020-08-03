Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61ABFC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 03:11:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 307B220738
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 03:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XeYDJysx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fVupjEeN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 307B220738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gyYolAfa5nui4UrqHQ8IbVb4+zg4fCUBk6JWmaPoTqU=; b=XeYDJysxUvTOlbAZZMh02Rt2Z
	PC9hJdDAF34i5a5cJcPd3sLTsdL7wxPiqHKFrj3vbdMpWMa5njO85YbBm7cPR5LGiBcTuzN28P+db
	k9uCoxYLRe+HPF4Qj7jLOJBL3UlhYOKzQV+gZWY3VG7bryJcwAVixVOkvS4jB+k2+xFKz95U1u/5R
	4ZT8hIAkLxdJuWfi8NGHpu7Fy8B3GoceLD+/xMfmHgDP7sXo70p23cPXtE9NBS9KMP2MnIfG75vLe
	gJ2OtHGcwDY3FppOYdOmT8nTnIhq/SYH4VD2nt7WcwYwwaIeCsiPSB8gRqqp/densys0/vWUFI1FA
	A66Q1jC6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Qsx-0002sY-Oq; Mon, 03 Aug 2020 03:11:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Qsw-0002r1-8L
 for linux-mediatek@lists.infradead.org; Mon, 03 Aug 2020 03:11:35 +0000
X-UUID: 022130ba9c354e6e932638bafc899f24-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ALLw9ZkoA1S/JkwkqnRLE4IdmraD+sOk9I6zVmWez/M=; 
 b=fVupjEeN3UxOG2tf1l65DYvFaQuKb+ayNxwRuhGCOn7ZrjEc4SfexFEbjML0e7XXNaNSypddLZdxnmvGyuz1Pb1YjeaU2skoUWex115JbiGuzu4VRt+VW4LXKf+lhtERrQ4f00c87xBlO0kS4uS69jdjx/xzq02dHM6Z+ANDHG0=;
X-UUID: 022130ba9c354e6e932638bafc899f24-20200802
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 339783055; Sun, 02 Aug 2020 19:11:28 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Aug 2020 20:11:17 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 11:11:15 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 11:11:15 +0800
Message-ID: <1596424276.5207.13.camel@mtkswgap22>
Subject: Re: [PATCH v6 2/3] binder: add trace at free transaction.
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Todd Kjos <tkjos@google.com>
Date: Mon, 3 Aug 2020 11:11:16 +0800
In-Reply-To: <CAHRSSEwqbbTZgaE-KLC0-AMHzRVU3O2AwUzW9i5u54tVmkFAQA@mail.gmail.com>
References: <1595252430.5899.6.camel@mtkswgap22>
 <1595906401-11985-1-git-send-email-Frankie.Chang@mediatek.com>
 <1595906401-11985-3-git-send-email-Frankie.Chang@mediatek.com>
 <CAHRSSEwqbbTZgaE-KLC0-AMHzRVU3O2AwUzW9i5u54tVmkFAQA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 538817EDDCF731873A891B6A7D5A4FC560716D01388453026712EC4D613164242000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_231134_453987_E78C4C86 
X-CRM114-Status: GOOD (  22.78  )
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-07-31 at 11:50 -0700, Todd Kjos wrote:
> On Mon, Jul 27, 2020 at 8:28 PM Frankie Chang
> <Frankie.Chang@mediatek.com> wrote:
> >
> > From: "Frankie.Chang" <Frankie.Chang@mediatek.com>
> >
> > Since the original trace_binder_transaction_received cannot
> > precisely present the real finished time of transaction, adding a
> > trace_binder_txn_latency_free at the point of free transaction
> > may be more close to it.
> >
> > Signed-off-by: Frankie.Chang <Frankie.Chang@mediatek.com>
> > ---
> >  drivers/android/binder.c       |    6 ++++++
> >  drivers/android/binder_trace.h |   27 +++++++++++++++++++++++++++
> >  2 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > index 2df146f..1e6fc40 100644
> > --- a/drivers/android/binder.c
> > +++ b/drivers/android/binder.c
> > @@ -1522,6 +1522,9 @@ static void binder_free_transaction(struct binder_transaction *t)
> >          * If the transaction has no target_proc, then
> >          * t->buffer->transaction has already been cleared.
> >          */
> > +       spin_lock(&t->lock);
> > +       trace_binder_txn_latency_free(t);
> > +       spin_unlock(&t->lock);
> 
> Hmm. I don't prefer taking the lock just to call a trace. It doesn't
> make clear why the lock has to be taken. I'd prefer something like:
> 
> if (trace_binder_txn_latency_free_enabled()) {
c
> }
> 
> And then the trace would use the passed-in values instead of accessing
> via t->to_proc/to_thread.
> 
Then we still add lock protection in the hook function, when trace is
disable ?

Or we also pass these to hook function, no matter the trace is enable or
not.I think this way is more clear that the lock protects @from,
@to_proc and @to_thread.Then, there is no need to add the lock in hook
function.

int from_proc, from_thread, to_proc, to_thread;
 
spin_lock(&t->lock);
from_proc = t->from ? t->from->proc->pid : 0;
from_thread = t->from ? t->from->pid :0;
to_proc = t->to_proc ? t->to_proc->pid : 0;
to_thread = t->to_thread ? t->to_thread->pid : 0;
spin_unlock(&t->lock);
trace_binder_txn_latency_free(t, from_proc, from_thread, to_proc,
to_pid);

> >         binder_free_txn_fixups(t);
> >         kfree(t);
> >         binder_stats_deleted(BINDER_STAT_TRANSACTION);
> > @@ -3093,6 +3096,9 @@ static void binder_transaction(struct binder_proc *proc,
> >         kfree(tcomplete);
> >         binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
> >  err_alloc_tcomplete_failed:
> > +       spin_lock(&t->lock);
> > +       trace_binder_txn_latency_free(t);
> > +       spin_unlock(&t->lock);
> >         kfree(t);
> >         binder_stats_deleted(BINDER_STAT_TRANSACTION);
> >  err_alloc_t_failed:
> > diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
> > index 6731c3c..8ac87d1 100644
> > --- a/drivers/android/binder_trace.h
> > +++ b/drivers/android/binder_trace.h
> > @@ -95,6 +95,33 @@
> >                   __entry->thread_todo)
> >  );
> >
> > +TRACE_EVENT(binder_txn_latency_free,
> > +       TP_PROTO(struct binder_transaction *t),
> > +       TP_ARGS(t),
> > +       TP_STRUCT__entry(
> > +               __field(int, debug_id)
> > +               __field(int, from_proc)
> > +               __field(int, from_thread)
> > +               __field(int, to_proc)
> > +               __field(int, to_thread)
> > +               __field(unsigned int, code)
> > +               __field(unsigned int, flags)
> > +       ),
> > +       TP_fast_assign(
> > +               __entry->debug_id = t->debug_id;
> > +               __entry->from_proc = t->from ? t->from->proc->pid : 0;
> > +               __entry->from_thread = t->from ? t->from->pid : 0;
> > +               __entry->to_proc = t->to_proc ? t->to_proc->pid : 0;
> > +               __entry->to_thread = t->to_thread ? t->to_thread->pid : 0;
> > +               __entry->code = t->code;
> > +               __entry->flags = t->flags;
> > +       ),
> > +       TP_printk("transaction=%d from %d:%d to %d:%d flags=0x%x code=0x%x",
> > +                 __entry->debug_id, __entry->from_proc, __entry->from_thread,
> > +                 __entry->to_proc, __entry->to_thread, __entry->code,
> > +                 __entry->flags)
> > +);
> > +
> >  TRACE_EVENT(binder_transaction,
> >         TP_PROTO(bool reply, struct binder_transaction *t,
> >                  struct binder_node *target_node),
> > --
> > 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

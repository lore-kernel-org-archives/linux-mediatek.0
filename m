Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C726EC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:48:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95804207E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dHPMaaRO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jw9YaF1g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95804207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SRVTDO04lqvBtK452fn2anljIllbPnFijm58PkwUjtg=; b=dHPMaaROJo41fJYRwFhGEyH3p
	/TpEK4BXjDWBm69Q6K8fH8uetkbqAoNkX75v9T3374sRhbhBKva9bDxEVqBdfvdgwGoTIDTrSr5qW
	ORTgtP/dy6YRXjUF6+KkAKGEhAIGg5mXIHLxG4KsMzm2wbb5u2ysUxBg2bN4ayWSsDaEIvDHbB36S
	MrSXEVz5e6D7nWxklp6cKT+QfERYeNiCFvk561cJ/FWqSqPSF7s+fDeNLOK4NV94GVLM3I7pSJyNP
	aiKznNVGMH7TnH4krUrLQ1d2DxW/ZITzUTPyNSC21IlgbFRei66sXmmwjCcOrMj4kily724k4AnA8
	ITaVJsJyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRHL-0008O7-Lw; Thu, 23 Jul 2020 02:48:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRHJ-0008NQ-4w
 for linux-mediatek@lists.infradead.org; Thu, 23 Jul 2020 02:48:14 +0000
X-UUID: 521a01f610b34ac8a9960986a9e3e2ce-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=o5Pnaz5PzLl00kO7UGNUdo3DX9rzOLiF6hNu8QVIo/Y=; 
 b=jw9YaF1gpolTRR6kmJctp0538ekNI6ytMdVJATBkIzebqHAGpKAumpdRWQO9hqzP8WACwf/RoGa9jeCWf7wKvi/SCwRiPUYlWg41SgIXaNgZ1W2pIuQPEzhzlHk7n9sABajwUAkjdcAhwC8u6WkFN4LE6PK236p8ArMBRZTC3yg=;
X-UUID: 521a01f610b34ac8a9960986a9e3e2ce-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1533614400; Wed, 22 Jul 2020 18:48:08 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 19:48:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 10:47:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 10:47:56 +0800
Message-ID: <1595472479.5899.8.camel@mtkswgap22>
Subject: Re: [PATCH v5 2/3] binder: add trace at free transaction.
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Todd Kjos <tkjos@google.com>
Date: Thu, 23 Jul 2020 10:47:59 +0800
In-Reply-To: <CAHRSSEydixN=4JQW3PGsTVaYZG+1aVZA6JOE9c9GufiWrkDycQ@mail.gmail.com>
References: <20200507085544.GB1097552@kroah.com>
 <1591791827-23871-1-git-send-email-Frankie.Chang@mediatek.com>
 <1591791827-23871-3-git-send-email-Frankie.Chang@mediatek.com>
 <CAHRSSEydixN=4JQW3PGsTVaYZG+1aVZA6JOE9c9GufiWrkDycQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_224813_593869_0C63615C 
X-CRM114-Status: GOOD (  19.64  )
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

On Mon, 2020-07-20 at 11:23 -0700, Todd Kjos wrote:
> On Wed, Jun 10, 2020 at 5:24 AM Frankie Chang
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
> >  drivers/android/binder.c       |    2 ++
> >  drivers/android/binder_trace.h |   27 +++++++++++++++++++++++++++
> >  2 files changed, 29 insertions(+)
> >
> > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > index 1592396..5ec9af8 100644
> > --- a/drivers/android/binder.c
> > +++ b/drivers/android/binder.c
> > @@ -1523,6 +1523,7 @@ static void binder_free_transaction(struct binder_transaction *t)
> >          * If the transaction has no target_proc, then
> >          * t->buffer->transaction has already been cleared.
> >          */
> > +       trace_binder_txn_latency_free(t);
> >         binder_free_txn_fixups(t);
> >         kfree(t);
> >         binder_stats_deleted(BINDER_STAT_TRANSACTION);
> > @@ -3094,6 +3095,7 @@ static void binder_transaction(struct binder_proc *proc,
> >         kfree(tcomplete);
> >         binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
> >  err_alloc_tcomplete_failed:
> > +       trace_binder_txn_latency_free(t);
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
> 
> t->to_proc and t->to_thread are not safe to dereference without
> holding t->lock. If the target process dies, these fields can be set
> to NULL
> 
Thanks for remind. I will add lock protection for these t->to_proc &
t->to_thread in v7.

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

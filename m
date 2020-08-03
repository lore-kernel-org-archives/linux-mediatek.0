Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240C4C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 15:12:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E767820775
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 15:12:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L9oggPRg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="C6qa2e/+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E767820775
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YcR1tVllvVqyNTVOyORNyoyIyyEkGB9E1YlvRSZ6MZk=; b=L9oggPRgOwfJdQHQEG0VD/x2L
	QUhBBLpSx4LkbrKbScE3QFLuQMgHqggaIlhGTP6a8s8W4uOToTQE9wKDcpC9s408iveT+VQT5uxCY
	AsyLLjMfgnLgynZSz12VPyI7limjn7gZ3y3Ng+aTZejiRJsnGdI28aSZ8E1H4HalC8UdZCwLtRJ6b
	vKuHG+YyG2eIER8z85nEuSa8T/na/pPQPJSg8dM1mK8RPOimsZO89cBfWuZ4Yj3rQfcAtoyHK6yJf
	bVEIHAQXFLdzqKZrCmzOq3HMDKeNExbHHT1LMhrqshlNGDyRhPUMISiXEpHMB/ZG4y/TPZ5yxiKJV
	gzrxh9vMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2c8u-0007b2-1j; Mon, 03 Aug 2020 15:12:48 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2c8s-0007aL-8c
 for linux-mediatek@lists.infradead.org; Mon, 03 Aug 2020 15:12:46 +0000
Received: by mail-ed1-x542.google.com with SMTP id v22so16704905edy.0
 for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2020 08:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nSQjY/yDDy2IgeloS1YMeNYtwnPmouyoqnWkR/XWcuY=;
 b=C6qa2e/+DC+X1CV0iz/uz93YXTJQi4pGFe0MOHD5CuLW7MnRHvUc1DQdnZxGpnXaH/
 7tAl7JLLJibUQk8XT2ud5cYfW7e3f1iPioq5zQR97icXzdV4OXLrW3XmOnIL8gNx4y6A
 GCIJUn5ORGn2O47C7XOWcvpbfv6IF+zxBdzNnzbtLyhcURInr0rOC0G0Hu1lpKT5P/6H
 +F1FebkqqvvfOdo2URKMCcGlsIbVz8l8SbbA+EEH1BP1gHok8lSyAYzdAk61ekdIBCeb
 ea1Qt8qYGDetm0vMofn+D6hfuiSV5FPnpfZdE/xE+OymVSad8oiHa+2Fl7CUknCaGona
 pHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nSQjY/yDDy2IgeloS1YMeNYtwnPmouyoqnWkR/XWcuY=;
 b=rUJJ+tDnLI5y1v1aSzstaX5ANU0EeDe8ao5m182ygNkxSg4e7QqZivD9NOJ6HoZNGZ
 V2GIkXJakM5l9NcmUCYGNaA+f+8GkitKbnRCmXTBjuyKj3TVrw3g+oAAfYbnWT4Qqsyt
 gmorhEFvGCXt/uPS1UsrmmFXJqLAfJezeE3whJeQo4BGAV4ciIq1RjtdamglgdBOsusm
 GyspmZHw5D69nzB8/VZfWlJeklFk7bUt9CQI9CSbefXc/W0gXfDblhF06/13omQ1Lg1p
 +uikG+QncpmWvh8aeLDEU91II8mymWpOZ+74RB1l4oGiJEgk3E7p3uz4icYLFLys7FZQ
 /niQ==
X-Gm-Message-State: AOAM531yoBZ5APh/BVGkUP+/TfhHOuC0i9yY4wfzj8nGlikRgFpRVTUV
 97VGSx44ZWttRvb9An2TXdQTSNS3h82a6x1AedGgpA==
X-Google-Smtp-Source: ABdhPJxxK6AKCEaBJAoVFuPjby0EStHHsQSneYgTa9PE9YmB06nAeo8BgJkSOV1Q2qjNe+Nir4xcLJ3pHm/6XbLd0mA=
X-Received: by 2002:aa7:c45a:: with SMTP id n26mr16449720edr.45.1596467561751; 
 Mon, 03 Aug 2020 08:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <1595252430.5899.6.camel@mtkswgap22>
 <1595906401-11985-1-git-send-email-Frankie.Chang@mediatek.com>
 <1595906401-11985-3-git-send-email-Frankie.Chang@mediatek.com>
 <CAHRSSEwqbbTZgaE-KLC0-AMHzRVU3O2AwUzW9i5u54tVmkFAQA@mail.gmail.com>
 <1596424276.5207.13.camel@mtkswgap22>
In-Reply-To: <1596424276.5207.13.camel@mtkswgap22>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 3 Aug 2020 08:12:29 -0700
Message-ID: <CAHRSSEwKa=wkp3+_cgZc3cZ+k_OEw82HTaKewLNFPovFVxsnbg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] binder: add trace at free transaction.
To: Frankie Chang <Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_111246_339264_D7B8A506 
X-CRM114-Status: GOOD (  29.79  )
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
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Aug 2, 2020 at 8:11 PM Frankie Chang <Frankie.Chang@mediatek.com> wrote:
>
> On Fri, 2020-07-31 at 11:50 -0700, Todd Kjos wrote:
> > On Mon, Jul 27, 2020 at 8:28 PM Frankie Chang
> > <Frankie.Chang@mediatek.com> wrote:
> > >
> > > From: "Frankie.Chang" <Frankie.Chang@mediatek.com>
> > >
> > > Since the original trace_binder_transaction_received cannot
> > > precisely present the real finished time of transaction, adding a
> > > trace_binder_txn_latency_free at the point of free transaction
> > > may be more close to it.
> > >
> > > Signed-off-by: Frankie.Chang <Frankie.Chang@mediatek.com>
> > > ---
> > >  drivers/android/binder.c       |    6 ++++++
> > >  drivers/android/binder_trace.h |   27 +++++++++++++++++++++++++++
> > >  2 files changed, 33 insertions(+)
> > >
> > > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > > index 2df146f..1e6fc40 100644
> > > --- a/drivers/android/binder.c
> > > +++ b/drivers/android/binder.c
> > > @@ -1522,6 +1522,9 @@ static void binder_free_transaction(struct binder_transaction *t)
> > >          * If the transaction has no target_proc, then
> > >          * t->buffer->transaction has already been cleared.
> > >          */
> > > +       spin_lock(&t->lock);
> > > +       trace_binder_txn_latency_free(t);
> > > +       spin_unlock(&t->lock);
> >
> > Hmm. I don't prefer taking the lock just to call a trace. It doesn't
> > make clear why the lock has to be taken. I'd prefer something like:
> >
> > if (trace_binder_txn_latency_free_enabled()) {
> c
> > }
> >
> > And then the trace would use the passed-in values instead of accessing
> > via t->to_proc/to_thread.
> >
> Then we still add lock protection in the hook function, when trace is
> disable ?

I don't understand... in the example I gave, the trace doesn't get
called if disabled. What do you mean to "add lock protection when the
trace is disabled()"?

>
> Or we also pass these to hook function, no matter the trace is enable or

What do you mean by "hook" function? If something has attached to the
trace, then xxx_enabled() will return true.

> not.I think this way is more clear that the lock protects @from,
> @to_proc and @to_thread.Then, there is no need to add the lock in hook
> function.

Why is it clearer (other than the fact that I missed including t->from
under the lock)?

>
> int from_proc, from_thread, to_proc, to_thread;
>
> spin_lock(&t->lock);
> from_proc = t->from ? t->from->proc->pid : 0;
> from_thread = t->from ? t->from->pid :0;
> to_proc = t->to_proc ? t->to_proc->pid : 0;
> to_thread = t->to_thread ? t->to_thread->pid : 0;
> spin_unlock(&t->lock);
> trace_binder_txn_latency_free(t, from_proc, from_thread, to_proc,
> to_pid);

The main feedback is I'd like to see the fields dereferenced in the
same context as the lock acquisition instead of acquiring the lock and
calling the trace function, so this code would be fine. There will be
very little contention for t->lock so using xxx_enabled() is optional.

Since trace_binder_txn_latency_free() is called twice,  it would make
sense to have a helper function to do the above.

>
> > >         binder_free_txn_fixups(t);
> > >         kfree(t);
> > >         binder_stats_deleted(BINDER_STAT_TRANSACTION);
> > > @@ -3093,6 +3096,9 @@ static void binder_transaction(struct binder_proc *proc,
> > >         kfree(tcomplete);
> > >         binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
> > >  err_alloc_tcomplete_failed:
> > > +       spin_lock(&t->lock);
> > > +       trace_binder_txn_latency_free(t);
> > > +       spin_unlock(&t->lock);
> > >         kfree(t);
> > >         binder_stats_deleted(BINDER_STAT_TRANSACTION);
> > >  err_alloc_t_failed:
> > > diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
> > > index 6731c3c..8ac87d1 100644
> > > --- a/drivers/android/binder_trace.h
> > > +++ b/drivers/android/binder_trace.h
> > > @@ -95,6 +95,33 @@
> > >                   __entry->thread_todo)
> > >  );
> > >
> > > +TRACE_EVENT(binder_txn_latency_free,
> > > +       TP_PROTO(struct binder_transaction *t),
> > > +       TP_ARGS(t),
> > > +       TP_STRUCT__entry(
> > > +               __field(int, debug_id)
> > > +               __field(int, from_proc)
> > > +               __field(int, from_thread)
> > > +               __field(int, to_proc)
> > > +               __field(int, to_thread)
> > > +               __field(unsigned int, code)
> > > +               __field(unsigned int, flags)
> > > +       ),
> > > +       TP_fast_assign(
> > > +               __entry->debug_id = t->debug_id;
> > > +               __entry->from_proc = t->from ? t->from->proc->pid : 0;
> > > +               __entry->from_thread = t->from ? t->from->pid : 0;
> > > +               __entry->to_proc = t->to_proc ? t->to_proc->pid : 0;
> > > +               __entry->to_thread = t->to_thread ? t->to_thread->pid : 0;
> > > +               __entry->code = t->code;
> > > +               __entry->flags = t->flags;
> > > +       ),
> > > +       TP_printk("transaction=%d from %d:%d to %d:%d flags=0x%x code=0x%x",
> > > +                 __entry->debug_id, __entry->from_proc, __entry->from_thread,
> > > +                 __entry->to_proc, __entry->to_thread, __entry->code,
> > > +                 __entry->flags)
> > > +);
> > > +
> > >  TRACE_EVENT(binder_transaction,
> > >         TP_PROTO(bool reply, struct binder_transaction *t,
> > >                  struct binder_node *target_node),
> > > --
> > > 1.7.9.5
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

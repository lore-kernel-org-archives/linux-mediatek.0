Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EBEC433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:02:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F665206F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:02:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T/ecGiD4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hH7VPHkV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F665206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U2dIt2DFwWojWdq7TVbo0nI+G0bP0ibzurFfk3v2qnQ=; b=T/ecGiD4oNK+hgHdohBF16VeN
	QBF3egRiM8Jr/4sKGzUrChRKcAU01ghIZ/Uw1nKGa8NRcQMdFT5yKc/c8k8eJ7S1auKBZGsWzgKf3
	UV+qSU/86XBgE9Fy/WTIUpfS4r6s1aKlft54RgvJjJdqQsiH0/KiywmaYxhPxg1vfdSy8nU829S1h
	JH5nHpk92mYw7HqwWy1AvA021rT165DZDY5G1Q3TtHQgP99cLR4Naq/5xPC/OwgboTs6TwUf/s1dt
	o2yMwroRoKlACPGCu6GcmKksWrQb9DkraBgyPy+BEtgXwgr9JH+jRp9kGBBB1mJZTVTsFFuioPhF3
	BD4OWUQRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRUg-0000zK-JI; Thu, 23 Jul 2020 03:02:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRUd-0000yh-DW
 for linux-mediatek@lists.infradead.org; Thu, 23 Jul 2020 03:02:00 +0000
X-UUID: 61df38c5255e4ac288a3493d80fbac43-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9O8XoaZeH3e66A3ObWUvTLbY1MXbzjY3CXwiQeejPF4=; 
 b=hH7VPHkVzH4QgHn0iyREOH/OoNlXWaYVOoBgnCqvaRHu1BxMr/qZ4j/c4//9HEnggviLFHwIbaz13CdzUqpBDMSGKU1GQVbH3vKxao70OgbqepLYVumczLN1xUS9EQRrx47j9LFij6g+vutmGcGzioTwKJJ4SsNOiWRYbKSxPto=;
X-UUID: 61df38c5255e4ac288a3493d80fbac43-20200722
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1277895607; Wed, 22 Jul 2020 19:01:55 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:01:54 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:01:52 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:01:52 +0800
Message-ID: <1595473313.5899.19.camel@mtkswgap22>
Subject: Re: [PATCH v5 3/3] binder: add transaction latency tracer
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Todd Kjos <tkjos@google.com>
Date: Thu, 23 Jul 2020 11:01:53 +0800
In-Reply-To: <CAHRSSExO8uiwNELR+DjKYGEXO-Lr-0i8BBQDH5PwkxBVXiCtNw@mail.gmail.com>
References: <20200507085544.GB1097552@kroah.com>
 <1591791827-23871-1-git-send-email-Frankie.Chang@mediatek.com>
 <1591791827-23871-4-git-send-email-Frankie.Chang@mediatek.com>
 <CAHRSSExO8uiwNELR+DjKYGEXO-Lr-0i8BBQDH5PwkxBVXiCtNw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_230159_665701_49D9F498 
X-CRM114-Status: GOOD (  39.93  )
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

On Mon, 2020-07-20 at 11:56 -0700, Todd Kjos wrote:
> On Wed, Jun 10, 2020 at 5:34 AM Frankie Chang
> <Frankie.Chang@mediatek.com> wrote:
> >
> > From: "Frankie.Chang" <Frankie.Chang@mediatek.com>
> >
> > Record start/end timestamp for binder transaction.
> > When transaction is completed or transaction is free,
> > it would be checked if transaction latency over threshold (2 sec),
> > if yes, printing related information for tracing.
> >
> > /* Implement details */
> > - Add latency tracer module to monitor transaction
> >   by attaching to new tracepoints introduced
> >   when transactions are allocated and freed.
> >   The trace_binder_txn_latency_free would not be enabled
> >   by default. Monitoring which transaction is too slow to
> >   cause some of exceptions is important. So we hook the
> >   tracepoint to call the monitor function.
> >
> > - Since some of modules would trigger timeout NE
> >   if their binder transaction don't finish in time,
> >   such as audio timeout (5 sec), even BT command
> >   timeout (2 sec), etc.
> >   Therefore, setting the timeout threshold as 2 seconds
> >   could be helpful to debug.
> 
> Could there be cases that 500ms is too long so 1s should be the
> threshold? Hard coded 2 seconds makes this less useful. How about
> making it configurable with a default of 2 sec?
> 
Okay, it makes sense that making threshold configurable. We will do it.

> >
> > - The reason why printing the related information to
> >   kernel information log but not trace buffer is that
> >   some abnormal transactions may be pending for a long
> >   time ago, they could not be recorded due to buffer
> >   limited.
> >
> > Signed-off-by: Frankie.Chang <Frankie.Chang@mediatek.com>
> > ---
> >  drivers/android/Kconfig                 |    8 +++
> >  drivers/android/Makefile                |    1 +
> >  drivers/android/binder.c                |    2 +
> >  drivers/android/binder_internal.h       |   13 ++++
> >  drivers/android/binder_latency_tracer.c |  107 +++++++++++++++++++++++++++++++
> >  drivers/android/binder_trace.h          |   28 +++++++-
> >  6 files changed, 156 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/android/binder_latency_tracer.c
> >
> > diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> > index 6fdf2ab..39d47be 100644
> > --- a/drivers/android/Kconfig
> > +++ b/drivers/android/Kconfig
> > @@ -54,6 +54,14 @@ config ANDROID_BINDER_IPC_SELFTEST
> >           exhaustively with combinations of various buffer sizes and
> >           alignments.
> >
> > +config BINDER_TRANSACTION_LATENCY_TRACKING
> > +       bool "Android Binder transaction tracking"
> 
> Any reason this can't be tristate?
> 
It can be tristate, and we would change #ifdef to #if IS_ENABLED()

> > +       help
> > +         Used for track abnormal binder transaction which is over 2 seconds,
> > +         when the transaction is done or be free, this transaction would be
> > +         checked whether it executed overtime.
> > +         If yes, printing out the detailed info.
> > +
> >  endif # if ANDROID
> >
> >  endmenu
> > diff --git a/drivers/android/Makefile b/drivers/android/Makefile
> > index c9d3d0c9..c2ffdb6 100644
> > --- a/drivers/android/Makefile
> > +++ b/drivers/android/Makefile
> > @@ -4,3 +4,4 @@ ccflags-y += -I$(src)                   # needed for trace events
> >  obj-$(CONFIG_ANDROID_BINDERFS)         += binderfs.o
> >  obj-$(CONFIG_ANDROID_BINDER_IPC)       += binder.o binder_alloc.o
> >  obj-$(CONFIG_ANDROID_BINDER_IPC_SELFTEST) += binder_alloc_selftest.o
> > +obj-$(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)      += binder_latency_tracer.o
> > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > index 5ec9af8..846d69b 100644
> > --- a/drivers/android/binder.c
> > +++ b/drivers/android/binder.c
> > @@ -2657,6 +2657,7 @@ static void binder_transaction(struct binder_proc *proc,
> >                 return_error_line = __LINE__;
> >                 goto err_alloc_t_failed;
> >         }
> > +       trace_binder_txn_latency_alloc(t, e);
> >         INIT_LIST_HEAD(&t->fd_fixups);
> >         binder_stats_created(BINDER_STAT_TRANSACTION);
> >         spin_lock_init(&t->lock);
> > @@ -5144,6 +5145,7 @@ static void print_binder_transaction_ilocked(struct seq_file *m,
> >                    to_proc ? to_proc->pid : 0,
> >                    t->to_thread ? t->to_thread->pid : 0,
> >                    t->code, t->flags, t->priority, t->need_reply);
> > +       trace_binder_txn_latency_info(m, t);
> >         spin_unlock(&t->lock);
> >
> >         if (proc != to_proc) {
> > diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h
> > index ed61b3e..bebc185 100644
> > --- a/drivers/android/binder_internal.h
> > +++ b/drivers/android/binder_internal.h
> > @@ -12,6 +12,11 @@
> >  #include <linux/types.h>
> >  #include <linux/uidgid.h>
> >
> > +#ifdef CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING
> > +#include <linux/rtc.h>
> > +#include <linux/time.h>
> > +#endif
> > +
> >  struct binder_context {
> >         struct binder_node *binder_context_mgr_node;
> >         struct mutex context_mgr_node_lock;
> > @@ -131,6 +136,10 @@ struct binder_transaction_log_entry {
> >         uint32_t return_error;
> >         uint32_t return_error_param;
> >         char context_name[BINDERFS_MAX_NAME + 1];
> > +#ifdef CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING
> 
> If you make binder_latency_tracer a module, then we could include
> these fields unconditionally. Please add comments or give them better
> names so it is obvious what they are for.
> 
We would add comments to explain what these used for.

> > +       struct timespec timestamp;
> > +       struct timeval tv;
> > +#endif
> >  };
> >
> >  struct binder_transaction_log {
> > @@ -520,6 +529,10 @@ struct binder_transaction {
> >          * during thread teardown
> >          */
> >         spinlock_t lock;
> > +#ifdef CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING
> 
> If you make binder_latency_tracer a module, then we could include
> these fields unconditionally. Please add comments or give them better
> names so it is obvious what they are for.
> 
We would add comments to explain what these used for.

> > +       struct timespec timestamp;
> > +       struct timeval tv;
> > +#endif
> >  };
> >
> >  /**
> > diff --git a/drivers/android/binder_latency_tracer.c b/drivers/android/binder_latency_tracer.c
> > new file mode 100644
> > index 0000000..1b89634
> > --- /dev/null
> > +++ b/drivers/android/binder_latency_tracer.c
> > @@ -0,0 +1,107 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2019 MediaTek Inc.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <uapi/linux/android/binder.h>
> > +#include "binder_alloc.h"
> > +#include "binder_internal.h"
> > +#include "binder_trace.h"
> > +
> > +/*
> > + * probe_binder_txn_latency_free - Output info of a delay transaction
> > + * @t:          pointer to the over-time transaction
> > + */
> > +void probe_binder_txn_latency_free(void *ignore, struct binder_transaction *t)
> > +{
> > +       struct rtc_time tm;
> > +       struct timespec *startime;
> > +       struct timespec cur, sub_t;
> > +
> > +       ktime_get_ts(&cur);
> > +       startime = &t->timestamp;
> > +       sub_t = timespec_sub(cur, *startime);
> > +
> > +       /* if transaction time is over than 2 sec,
> > +        * show timeout warning log.
> > +        */
> > +       if (sub_t.tv_sec < 2)
> > +               return;
> 
> I still don't get why 2sec is magical. Should this threshold be configurable?
> 
Okay, it makes sense that making threshold configurable. We will do it.

> > +
> > +       rtc_time_to_tm(t->tv.tv_sec, &tm);
> > +
> > +       spin_lock(&t->lock);
> > +       pr_info_ratelimited("%d: from %d:%d to %d:%d",
> > +                       t->debug_id,
> > +                       t->from ? t->from->proc->pid : 0,
> > +                       t->from ? t->from->pid : 0,
> > +                       t->to_proc ? t->to_proc->pid : 0,
> > +                       t->to_thread ? t->to_thread->pid : 0);
> > +
> > +       pr_info_ratelimited(" total %u.%03ld s code %u start %lu.%03ld android %d-%02d-%02d %02d:%02d:%02d.%03lu\n",
> > +                       (unsigned int)sub_t.tv_sec,
> > +                       (sub_t.tv_nsec / NSEC_PER_MSEC),
> > +                       t->code,
> > +                       (unsigned long)startime->tv_sec,
> > +                       (startime->tv_nsec / NSEC_PER_MSEC),
> > +                       (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
> > +                       tm.tm_hour, tm.tm_min, tm.tm_sec,
> > +                       (unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
> > +       spin_unlock(&t->lock);
> > +}
> > +
> > +static void probe_binder_txn_latency_alloc(void *ignore,
> > +                                       struct binder_transaction *t,
> > +                                       struct binder_transaction_log_entry *e)
> > +{
> > +       ktime_get_ts(&e->timestamp);
> > +       do_gettimeofday(&e->tv);
> > +       e->tv.tv_sec -= (sys_tz.tz_minuteswest * 60);
> > +       spin_lock(&t->lock);
> > +       memcpy(&t->timestamp, &e->timestamp, sizeof(struct timespec));
> > +       memcpy(&t->tv, &e->tv, sizeof(struct timeval));
> > +       spin_unlock(&t->lock);
> 
> Why is the lock needed here?
> 
We used it to protect @t->timestamp and @t->timeval, but it seems that
@t->timestamp and @t->timeval would not be changed in other place. So
we would remove it.

> > +}
> > +
> > +static void probe_binder_txn_latency_info(void *ignore, struct seq_file *m,
> > +                                       struct binder_transaction *t)
> > +{
> > +       struct rtc_time tm;
> > +
> > +       rtc_time_to_tm(t->tv.tv_sec, &tm);
> > +       seq_printf(m,
> > +                  " start %lu.%06lu android %d-%02d-%02d %02d:%02d:%02d.%03lu",
> > +                  (unsigned long)t->timestamp.tv_sec,
> > +                  (t->timestamp.tv_nsec / NSEC_PER_USEC),
> > +                  (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
> > +                  tm.tm_hour, tm.tm_min, tm.tm_sec,
> > +                  (unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
> > +}
> > +
> > +static int __init init_binder_latency_tracer(void)
> > +{
> > +       register_trace_binder_txn_latency_free(
> > +                       probe_binder_txn_latency_free, NULL);
> > +       register_trace_binder_txn_latency_alloc(
> > +                       probe_binder_txn_latency_alloc, NULL);
> > +       register_trace_binder_txn_latency_info(
> > +                       probe_binder_txn_latency_info, NULL);
> > +
> > +       return 0;
> > +}
> > +
> > +static void exit_binder_latency_tracer(void)
> > +{
> > +       unregister_trace_binder_txn_latency_free(
> > +                       probe_binder_txn_latency_free, NULL);
> > +       unregister_trace_binder_txn_latency_alloc(
> > +                       probe_binder_txn_latency_alloc, NULL);
> > +       unregister_trace_binder_txn_latency_info(
> > +                       probe_binder_txn_latency_info, NULL);
> > +}
> > +
> > +module_init(init_binder_latency_tracer);
> > +module_exit(exit_binder_latency_tracer);
> > +
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
> > index 8ac87d1..ca41c7d 100644
> > --- a/drivers/android/binder_trace.h
> > +++ b/drivers/android/binder_trace.h
> > @@ -18,6 +18,7 @@
> >  struct binder_ref_data;
> >  struct binder_thread;
> >  struct binder_transaction;
> > +struct binder_transaction_log_entry;
> >
> >  TRACE_EVENT(binder_ioctl,
> >         TP_PROTO(unsigned int cmd, unsigned long arg),
> > @@ -95,6 +96,18 @@
> >                   __entry->thread_todo)
> >  );
> >
> > +DECLARE_TRACE(binder_txn_latency_alloc,
> > +       TP_PROTO(struct binder_transaction *t,
> > +                struct binder_transaction_log_entry *e),
> > +       TP_ARGS(t, e)
> > +);
> > +
> > +DECLARE_TRACE(binder_txn_latency_info,
> > +       TP_PROTO(struct seq_file *m,
> > +                struct binder_transaction *t),
> > +       TP_ARGS(m, t)
> > +);
> > +
> >  TRACE_EVENT(binder_txn_latency_free,
> >         TP_PROTO(struct binder_transaction *t),
> >         TP_ARGS(t),
> > @@ -106,6 +119,8 @@
> >                 __field(int, to_thread)
> >                 __field(unsigned int, code)
> >                 __field(unsigned int, flags)
> > +               __field(unsigned long, start_sec)
> > +               __field(unsigned long, start_nsec)
> >         ),
> >         TP_fast_assign(
> >                 __entry->debug_id = t->debug_id;
> > @@ -115,11 +130,18 @@
> >                 __entry->to_thread = t->to_thread ? t->to_thread->pid : 0;
> >                 __entry->code = t->code;
> >                 __entry->flags = t->flags;
> > -       ),
> > -       TP_printk("transaction=%d from %d:%d to %d:%d flags=0x%x code=0x%x",
> > +#ifdef CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING
> > +               __entry->start_sec = t->timestamp.tv_sec;
> > +               __entry->start_nsec = t->timestamp.tv_nsec / NSEC_PER_MSEC;
> > +#else
> > +               __entry->start_sec = 0;
> > +               __entry->start_nsec = 0;
> > +#endif
> > +       ),
> > +       TP_printk("transaction=%d from %d:%d to %d:%d flags=0x%x code=0x%x start %lu.%03ld",
> >                   __entry->debug_id, __entry->from_proc, __entry->from_thread,
> >                   __entry->to_proc, __entry->to_thread, __entry->code,
> > -                 __entry->flags)
> > +                 __entry->flags, __entry->start_sec, __entry->start_nsec)
> >  );
> >
> >  TRACE_EVENT(binder_transaction,
> > --
> > 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

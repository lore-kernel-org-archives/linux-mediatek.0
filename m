Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7383C38A24
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 18:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DA2121473
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 18:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QB9wvpph";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="SXUamm/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DA2121473
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XvBexbH6mUSy4xyFFDWmjiM3Xuiv5TLmjTIFqUI+/w=; b=QB9wvpphbh8lDL
	R7MKSXsCj3cEuA4qmhFGMYLlfFaIuyBB2MBfBsuAFL57C+ZzVOXL09Zxkwzj7DfkMC4ZnwZSbz8wX
	nj6pQGOyVTw9DyGancO+v1MKnrAehSSSrYGzs8IAmgT6XUM1sev4npSowSYF9Z0Apnu9FrLdZFzKX
	NLZOC0WmuZkJ706ljwITrD+WBggXDX/VRt1qZkUa9nhGyDU6q2Tnq8oyzf2Anh2YcEi1EOvJuu5T5
	y14xnGsjENFUQX2s0AZOKtGOQH+UsE8L5rBSxRtYnilxqiNLeqRwB1tLBNKP+yWmGrxCPDhjAv5Jj
	RgcALJ8Jf/TFGH7Y0XmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWl9i-0002bG-Ka; Thu, 07 May 2020 18:21:58 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWl9e-0002Z7-Tg
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 18:21:56 +0000
Received: by mail-vs1-xe42.google.com with SMTP id 1so3978896vsl.9
 for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2020 11:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=INyWuTp+yam+hgXXcVZ9YVLTNFA/J6HgpHigw0HwofU=;
 b=SXUamm/iCKG83pUoAW4ChYrI2qJYlRtrEHOL9tXYLhIvgJZLu5YBJ1491Mqc7ovGi0
 wfvIVT7TAtVIcN1IlMN1YkjSfumGQ68bQtAp9g/B6ZIdeGR8MAKqtIVoL8GUCA8GfYTh
 7txEqi2KC0ulnIIHTKctnsrPP/zYsa/Lrj+ukyTHc84gr2m3a8mIYAUfm1/ToR9jKBGG
 o9512cmUvi8LeAsj95mGpOEeKZsi6FVm5LvaNZItYIrm18bvqMs8ywBlSPFCoRLdla/v
 w+uDG0FvfuNpRXra4nPiin0JGU5KiL3NUtAv1e83f92kcV+ONlTK+JMl/kGueI2SsABg
 PgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=INyWuTp+yam+hgXXcVZ9YVLTNFA/J6HgpHigw0HwofU=;
 b=hFkx7xC8Pv9hwSZu3X05LfWcBvCr6NK6r74M9Nts9cMOZKwYmMEo28S8uRu/JcHT+Y
 VtYiQspqvFq+jhfKlb7+WRMv9B5Vfk6pvYrKg3Fvkwb4NUZiJbxsigi8U/pDfvhFt3T9
 +HUIASokq9+C878NmrpkxfRGO/CBpv2JRq9iwXkb5KV0d3yOp9WQk1l/dsqDq6sbL8yO
 IAe3VZy5t+Uo21WXZMsQnYfYxnC5KvtrNyDza6WEx9sePd1VaLmhAjFRpmqHjVl5Iyeb
 G0e9Fe+yINxCHF6YIiN2sn4IQrKn0nijJhEW7A0hMbm/wxyu1TVluCUngstySLnCjP2e
 whbw==
X-Gm-Message-State: AGi0PubzSgjerhrAMMdLBKkjhqXkgp78AZY/XWqTzVuye9CRglaJCecv
 fqDIjMcHb1R+r1RLIP5komex/jIypFh2Tld0nXGyIg==
X-Google-Smtp-Source: APiQypIMV2ybpQCgdQp1JcrjDfC58sbE2q3S8foEE0i0Gcsiu92XwDprwnk6BD2LIwQtkzDKo6fwfqcdqqcBgUUbaY8=
X-Received: by 2002:a67:80d1:: with SMTP id b200mr13434294vsd.76.1588875710564; 
 Thu, 07 May 2020 11:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200430085105.GF2496467@kroah.com>
 <1588839055-26677-1-git-send-email-Frankie.Chang@mediatek.com>
 <1588839055-26677-4-git-send-email-Frankie.Chang@mediatek.com>
In-Reply-To: <1588839055-26677-4-git-send-email-Frankie.Chang@mediatek.com>
From: Todd Kjos <tkjos@google.com>
Date: Thu, 7 May 2020 11:21:38 -0700
Message-ID: <CAHRSSEwqxiJqbaMHVPMWPPpLiy_raa-Zncr3VBPpcwpRbTzThg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] binder: add transaction latency tracer
To: Frankie Chang <Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_112154_992996_E3E55B4A 
X-CRM114-Status: GOOD (  28.40  )
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

On Thu, May 7, 2020 at 1:11 AM Frankie Chang <Frankie.Chang@mediatek.com> wrote:
>
> From: "Frankie.Chang" <Frankie.Chang@mediatek.com>
>
> Record start/end timestamp for binder transaction.
> When transaction is completed or transaction is free,
> it would be checked if transaction latency over threshold (2 sec),

If this is a hard-coded threshold, provide rationale for why 2 sec is
the right value and it doesn't need to be tunable

> if yes, printing related information for tracing.
>
> /* Implement details */
> - Add latency tracer module to monitor slow transaction.
>   The trace_binder_free_transaction would not be enabled
>   by default. Monitoring which transaction is too slow to
>   cause some of exceptions is important. So we hook the
>   tracepoint to call the monitor function.

Please add a more complete description. This patch adds a module to
monitor transaction latency by attaching to new tracepoints introduced
when transactions are allocated and freed. Describe this in the commit
message.

>
> Signed-off-by: Frankie.Chang <Frankie.Chang@mediatek.com>
> ---
>  drivers/android/Kconfig                 |    8 +++
>  drivers/android/Makefile                |    1 +
>  drivers/android/binder.c                |    2 +
>  drivers/android/binder_internal.h       |   13 ++++
>  drivers/android/binder_latency_tracer.c |  105 +++++++++++++++++++++++++++++++
>  drivers/android/binder_trace.h          |   26 +++++++-
>  6 files changed, 152 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/android/binder_latency_tracer.c
>
>  Change from v4:
>    split up into patch series.
>
>  Change from v3:
>    use tracepoints for binder_update_info and print_binder_transaction_ext,
>    instead of custom registration functions.
>
>  Change from v2:
>    create transaction latency module to monitor slow transaction.
>
>  Change from v1:
>    first patchset.
>
> diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> index 6fdf2ab..7ba80eb 100644
> --- a/drivers/android/Kconfig
> +++ b/drivers/android/Kconfig
> @@ -54,6 +54,14 @@ config ANDROID_BINDER_IPC_SELFTEST
>           exhaustively with combinations of various buffer sizes and
>           alignments.
>
> +config BINDER_USER_TRACKING

Why not "BINDER_TRANSACTION_LATENCY_TRACKING"?

> +       bool "Android Binder transaction tracking"
> +       help
> +         Used for track abnormal binder transaction which is over 2 seconds,
> +         when the transaction is done or be free, this transaction would be
> +         checked whether it executed overtime.
> +         If yes, printing out the detail info about it.

"If yes, print out the detailed info"

> +
>  endif # if ANDROID
>
>  endmenu
> diff --git a/drivers/android/Makefile b/drivers/android/Makefile
> index c9d3d0c9..552e8ac 100644
> --- a/drivers/android/Makefile
> +++ b/drivers/android/Makefile
> @@ -4,3 +4,4 @@ ccflags-y += -I$(src)                   # needed for trace events
>  obj-$(CONFIG_ANDROID_BINDERFS)         += binderfs.o
>  obj-$(CONFIG_ANDROID_BINDER_IPC)       += binder.o binder_alloc.o
>  obj-$(CONFIG_ANDROID_BINDER_IPC_SELFTEST) += binder_alloc_selftest.o
> +obj-$(CONFIG_BINDER_USER_TRACKING)     += binder_latency_tracer.o
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 4c3dd98..b89d75a 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -2657,6 +2657,7 @@ static void binder_transaction(struct binder_proc *proc,
>                 return_error_line = __LINE__;
>                 goto err_alloc_t_failed;
>         }
> +       trace_binder_update_info(t, e);

Can this be a more descriptive name? Perhaps "trace_binder_txn_create()"

>         INIT_LIST_HEAD(&t->fd_fixups);
>         binder_stats_created(BINDER_STAT_TRANSACTION);
>         spin_lock_init(&t->lock);
> @@ -5145,6 +5146,7 @@ static void print_binder_transaction_ilocked(struct seq_file *m,
>                    t->to_thread ? t->to_thread->pid : 0,
>                    t->code, t->flags, t->priority, t->need_reply);
>         spin_unlock(&t->lock);
> +       trace_print_binder_transaction_ext(m, t);

Why do you need to trace when dumping out the transaction info?

>
>         if (proc != to_proc) {
>                 /*
> diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h
> index ed61b3e..24d7beb 100644
> --- a/drivers/android/binder_internal.h
> +++ b/drivers/android/binder_internal.h
> @@ -12,6 +12,11 @@
>  #include <linux/types.h>
>  #include <linux/uidgid.h>
>
> +#ifdef CONFIG_BINDER_USER_TRACKING
> +#include <linux/rtc.h>
> +#include <linux/time.h>
> +#endif
> +
>  struct binder_context {
>         struct binder_node *binder_context_mgr_node;
>         struct mutex context_mgr_node_lock;
> @@ -131,6 +136,10 @@ struct binder_transaction_log_entry {
>         uint32_t return_error;
>         uint32_t return_error_param;
>         char context_name[BINDERFS_MAX_NAME + 1];
> +#ifdef CONFIG_BINDER_USER_TRACKING
> +       struct timespec timestamp;
> +       struct timeval tv;
> +#endif
>  };
>
>  struct binder_transaction_log {
> @@ -520,6 +529,10 @@ struct binder_transaction {
>          * during thread teardown
>          */
>         spinlock_t lock;
> +#ifdef CONFIG_BINDER_USER_TRACKING
> +       struct timespec timestamp;
> +       struct timeval tv;
> +#endif
>  };
>
>  /**
> diff --git a/drivers/android/binder_latency_tracer.c b/drivers/android/binder_latency_tracer.c
> new file mode 100644
> index 0000000..45c14fb
> --- /dev/null
> +++ b/drivers/android/binder_latency_tracer.c
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 MediaTek Inc.
> + */
> +
> +#include <linux/module.h>
> +#include <uapi/linux/android/binder.h>
> +#include "binder_alloc.h"
> +#include "binder_internal.h"
> +#include "binder_trace.h"
> +
> +/*
> + * probe_binder_free_transaction - Output info of a delay transaction
> + * @t:          pointer to the over-time transaction
> + */
> +void probe_binder_free_transaction(void *ignore, struct binder_transaction *t)
> +{
> +       struct rtc_time tm;
> +       struct timespec *startime;
> +       struct timespec cur, sub_t;
> +
> +       ktime_get_ts(&cur);
> +       startime = &t->timestamp;
> +       sub_t = timespec_sub(cur, *startime);
> +
> +       /* if transaction time is over than 2 sec,
> +        * show timeout warning log.
> +        */
> +       if (sub_t.tv_sec < 2)
> +               return;
> +
> +       rtc_time_to_tm(t->tv.tv_sec, &tm);
> +
> +       spin_lock(&t->lock);
> +       pr_info_ratelimited("%d: from %d:%d to %d:%d",
> +                       t->debug_id,
> +                       t->from ? t->from->proc->pid : 0,
> +                       t->from ? t->from->pid : 0,
> +                       t->to_proc ? t->to_proc->pid : 0,
> +                       t->to_thread ? t->to_thread->pid : 0);
> +       spin_unlock(&t->lock);
> +
> +       pr_info_ratelimited(" total %u.%03ld s code %u start %lu.%03ld android %d-%02d-%02d %02d:%02d:%02d.%03lu\n",
> +                       (unsigned int)sub_t.tv_sec,
> +                       (sub_t.tv_nsec / NSEC_PER_MSEC),
> +                       t->code,
> +                       (unsigned long)startime->tv_sec,
> +                       (startime->tv_nsec / NSEC_PER_MSEC),
> +                       (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
> +                       tm.tm_hour, tm.tm_min, tm.tm_sec,
> +                       (unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
> +}
> +
> +static void probe_binder_update_info(void *ignore, struct binder_transaction *t,
> +                          struct binder_transaction_log_entry *e)
> +{
> +       ktime_get_ts(&e->timestamp);
> +       do_gettimeofday(&e->tv);
> +       e->tv.tv_sec -= (sys_tz.tz_minuteswest * 60);
> +       memcpy(&t->timestamp, &e->timestamp, sizeof(struct timespec));
> +       memcpy(&t->tv, &e->tv, sizeof(struct timeval));
> +}
> +
> +static void probe_print_binder_transaction_ext(void *ignore, struct seq_file *m,
> +                                        struct binder_transaction *t)
> +{
> +       struct rtc_time tm;
> +
> +       rtc_time_to_tm(t->tv.tv_sec, &tm);
> +       seq_printf(m,
> +                  " start %lu.%06lu android %d-%02d-%02d %02d:%02d:%02d.%03lu",
> +                  (unsigned long)t->timestamp.tv_sec,
> +                  (t->timestamp.tv_nsec / NSEC_PER_USEC),
> +                  (tm.tm_year + 1900), (tm.tm_mon + 1), tm.tm_mday,
> +                  tm.tm_hour, tm.tm_min, tm.tm_sec,
> +                  (unsigned long)(t->tv.tv_usec / USEC_PER_MSEC));
> +
> +}
> +
> +static int __init init_binder_latency_tracer(void)
> +{
> +       register_trace_binder_free_transaction(
> +                       probe_binder_free_transaction, NULL);
> +       register_trace_binder_update_info(
> +                       probe_binder_update_info, NULL);
> +       register_trace_print_binder_transaction_ext(
> +                       probe_print_binder_transaction_ext, NULL);

Ah, now the trace in the print path makes sense. Please add a more
detailed description to the commit message. Also add a comment at the
trace point that it is for modules to attach to so additional
information can be printed. Also, make the names of the tracepoints
more descriptive of what they really are ...something like
trace_binder_txn_latency_(alloc|info|free)

> +
> +       return 0;
> +}
> +
> +static void exit_binder_latency_tracer(void)
> +{
> +       unregister_trace_binder_free_transaction(
> +                       probe_binder_free_transaction, NULL);
> +       unregister_trace_binder_update_info(
> +                       probe_binder_update_info, NULL);
> +       unregister_trace_print_binder_transaction_ext(
> +                       probe_print_binder_transaction_ext, NULL);
> +}
> +
> +module_init(init_binder_latency_tracer);
> +module_exit(exit_binder_latency_tracer);
> +
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
> index 7acc18d..466993e 100644
> --- a/drivers/android/binder_trace.h
> +++ b/drivers/android/binder_trace.h
> @@ -18,6 +18,7 @@
>  struct binder_ref_data;
>  struct binder_thread;
>  struct binder_transaction;
> +struct binder_transaction_log_entry;
>
>  TRACE_EVENT(binder_ioctl,
>         TP_PROTO(unsigned int cmd, unsigned long arg),
> @@ -95,6 +96,18 @@
>                   __entry->thread_todo)
>  );
>
> +DECLARE_TRACE(binder_update_info,
> +       TP_PROTO(struct binder_transaction *t,
> +                struct binder_transaction_log_entry *e),
> +       TP_ARGS(t, e)
> +);
> +
> +DECLARE_TRACE(print_binder_transaction_ext,
> +       TP_PROTO(struct seq_file *m,
> +                struct binder_transaction *t),
> +       TP_ARGS(m, t)
> +);
> +
>  TRACE_EVENT(binder_free_transaction,
>         TP_PROTO(struct binder_transaction *t),
>         TP_ARGS(t),
> @@ -115,11 +128,18 @@
>                 __entry->to_thread = t->to_thread ? t->to_thread->pid : 0;
>                 __entry->code = t->code;
>                 __entry->flags = t->flags;
> -       ),
> -       TP_printk("transaction=%d from %d:%d to %d:%d flags=0x%x code=0x%x",
> +#ifdef CONFIG_BINDER_USER_TRACKING
> +               __entry->start_sec = t->timestamp.tv_sec;
> +               __entry->start_nsec = t->timestamp.tv_nsec / NSEC_PER_MSEC;
> +#else
> +               __entry->start_sec = 0;
> +               __entry->start_nsec = 0;
> +#endif
> +       ),
> +       TP_printk("transaction=%d from %d:%d to %d:%d flags=0x%x code=0x%x start %lu.%03ld",
>                   __entry->debug_id, __entry->from_proc, __entry->from_thread,
>                   __entry->to_proc, __entry->to_thread, __entry->code,
> -                 __entry->flags)
> +                 __entry->flags, __entry->start_sec, __entry->start_nsec)
>  );
>
>  TRACE_EVENT(binder_transaction,
> --
> 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

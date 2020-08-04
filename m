Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8707DC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:29:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50CA12086A
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:29:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vRviwLOD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="vJwPUyB6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50CA12086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iVFvlRdOtB9IKo24owxz/2zHQw05PicV2Wf7EWOaozI=; b=vRviwLODikesQywjxdnjAFH0W
	ZpwGPJ2rBIqZbU6htyLhSfxYCMIv3NQhOrKPQCE072XLw4Tm2m8Df/KVpC/SMlOhSU/67kKvQVqxx
	tNLRVelM4Uv+9fZ+IP7sUrf6KI5oYnQBvJ2QcFCbAq9Vt6dvx9RG+QnDldXfa0HilTGaKhlXJzOay
	sMK9XaUpxZO/Cb32L3YRIjJuoDuoMSnlaQfv2g43MTyCceUMHMvGWrIpMwQctiRgQ7nnLntKj+d9C
	jkysAML5k36jqb9scbN+S3ZImF7Nlvj86WSuc/uF5UXHK5XGTBypbTNg1aAGaa6btpJw68XpZzYMY
	avnvdBdbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ysA-0006xE-Jz; Tue, 04 Aug 2020 15:29:02 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ys7-0006w0-NX
 for linux-mediatek@lists.infradead.org; Tue, 04 Aug 2020 15:29:00 +0000
Received: by mail-ed1-x541.google.com with SMTP id m20so20710615eds.2
 for <linux-mediatek@lists.infradead.org>; Tue, 04 Aug 2020 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qz0uyd2oTFho9/GrSW3hgOzK1cOa8xkZyPezxVTDkA8=;
 b=vJwPUyB6NTKWhSPbZO0F9/xBYgpcoi1DspWPgIXL1ODwuja/QeoOb793IgX+2ADWd4
 RPG/y4+BtO8jT7/s+/eoXrZjqWqso10kcs3Fkpi8FPLq2gR6/wDLpesqmdRzVxfOUET/
 jHRDhxBqVb/PQEfzQhpQ97+tE0t66OcCOP+Yg33N/SbBgeiB8S5M6tLDLWlCu9WR5omu
 s2VjE8YWoZ1M7hIvG6oteih5jpu/eRLBeEI72GPE0pjjuEfRmDusA5iHDjsyT+6Mhqap
 tCD3aZjbQ/KhUbW7IC0BdSa8GxyKBvkDeZtJ8PQlCKUXbuPh68fj2I4QqmGPnTrOZxfP
 gasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qz0uyd2oTFho9/GrSW3hgOzK1cOa8xkZyPezxVTDkA8=;
 b=KToqXhvvXhEKkPPeDh5TZtazWwjjQZY5cUgxq2jzPks5EnBvmPljm8blVM5NQXASjk
 MVL8x1Mdoab4hoYMAvGOzRo7+NZFUssfLY5iBknz3OS/kOLuwLpzZhHcxnP4NMgvw+KO
 gi6tcHz3NX3DAaEh57TafEmQ0lveCsFuTSob0tuemVYoWsINMDRXU3ba/DaOk3AWAi5g
 EjWhpr5RkDyZWRoOfrePUE2wNkdKeK8HHqThVvkUZc3SHNxN5WERYSCSpKmUqQe2Cz5u
 dHJzELXf/Y8e8s7BMPqDeIVAZ1PW2VVA8akVv1MxuhZNeXl4O4bCSo3Xh7CV82DHZRQ6
 ZnKg==
X-Gm-Message-State: AOAM533vtLIv9l52tGNmuA0vldWglcl5zzaw3HxwyJ70c1KQ1lNmR3i6
 4dA4JIOM8Wxt3TGFu4L7Oe3bOCS2DzfTIO9Dgh+lQw==
X-Google-Smtp-Source: ABdhPJxmG6yqhpXzX30yLHrzwgrDpySmv1MdIB61dxD/UV2pHTTowOScOBXnQzZeWMxe23x5oxrcEKpASCMy+YAEc3c=
X-Received: by 2002:a50:fc02:: with SMTP id i2mr21408148edr.121.1596554937967; 
 Tue, 04 Aug 2020 08:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <1596509145.5207.21.camel@mtkswgap22>
 <1596549552-5466-1-git-send-email-Frankie.Chang@mediatek.com>
 <1596549552-5466-4-git-send-email-Frankie.Chang@mediatek.com>
In-Reply-To: <1596549552-5466-4-git-send-email-Frankie.Chang@mediatek.com>
From: Todd Kjos <tkjos@google.com>
Date: Tue, 4 Aug 2020 08:28:45 -0700
Message-ID: <CAHRSSEw4mVg7hXp+bdK+E0z19EaszZ_-XVDHETj8wEd9RhOnxw@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] binder: add transaction latency tracer
To: Frankie Chang <Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_112859_821063_E5746C3F 
X-CRM114-Status: GOOD (  36.72  )
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

On Tue, Aug 4, 2020 at 6:59 AM Frankie Chang <Frankie.Chang@mediatek.com> wrote:
>
> From: "Frankie.Chang" <Frankie.Chang@mediatek.com>
>
> Record start/end timestamp for binder transaction.
> When transaction is completed or transaction is free,
> it would be checked if transaction latency over threshold
> (default 2 sec), if yes, printing related information for tracing.
>
> /* Implement details */
> - Add latency tracer module to monitor transaction
>   by attaching to new tracepoints introduced
>   when transactions are allocated and freed.
>   The trace_binder_txn_latency_free would not be enabled
>   by default. Monitoring which transaction is too slow to
>   cause some of exceptions is important. So we hook the
>   tracepoint to call the monitor function.
>
> - Since some of modules would trigger timeout NE
>   if their binder transaction don't finish in time,
>   such as audio timeout (5 sec), even BT command
>   timeout (2 sec), etc.
>   Therefore, setting the timeout threshold as default
>   2 seconds could be helpful to debug.
>   But this timeout threshold is configurable, to let
>   all users determine the more suitable threshold.
>
> - The reason why printing the related information to
>   kernel information log but not trace buffer is that
>   some abnormal transactions may be pending for a long
>   time ago, they could not be recorded due to buffer
>   limited.
>
> Signed-off-by: Frankie.Chang <Frankie.Chang@mediatek.com>

Acked-by: Todd Kjos <tkjos@google.com>

> ---
>  drivers/android/Kconfig                 |    8 +++
>  drivers/android/Makefile                |    1 +
>  drivers/android/binder.c                |    2 +
>  drivers/android/binder_internal.h       |   13 ++++
>  drivers/android/binder_latency_tracer.c |  112 +++++++++++++++++++++++++++++++
>  drivers/android/binder_trace.h          |   26 ++++++-
>  6 files changed, 159 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/android/binder_latency_tracer.c
>
> diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> index 6fdf2ab..91fff1e 100644
> --- a/drivers/android/Kconfig
> +++ b/drivers/android/Kconfig
> @@ -54,6 +54,14 @@ config ANDROID_BINDER_IPC_SELFTEST
>           exhaustively with combinations of various buffer sizes and
>           alignments.
>
> +config BINDER_TRANSACTION_LATENCY_TRACKING
> +       tristate "Android Binder transaction tracking"
> +       help
> +         Used for track abnormal binder transaction which is over threshold,
> +         when the transaction is done or be free, this transaction would be
> +         checked whether it executed overtime.
> +         If yes, printing out the detailed info.
> +
>  endif # if ANDROID
>
>  endmenu
> diff --git a/drivers/android/Makefile b/drivers/android/Makefile
> index c9d3d0c9..c2ffdb6 100644
> --- a/drivers/android/Makefile
> +++ b/drivers/android/Makefile
> @@ -4,3 +4,4 @@ ccflags-y += -I$(src)                   # needed for trace events
>  obj-$(CONFIG_ANDROID_BINDERFS)         += binderfs.o
>  obj-$(CONFIG_ANDROID_BINDER_IPC)       += binder.o binder_alloc.o
>  obj-$(CONFIG_ANDROID_BINDER_IPC_SELFTEST) += binder_alloc_selftest.o
> +obj-$(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)      += binder_latency_tracer.o
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 1bfadc2..22f7cc6 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -2671,6 +2671,7 @@ static void binder_transaction(struct binder_proc *proc,
>                 return_error_line = __LINE__;
>                 goto err_alloc_t_failed;
>         }
> +       trace_binder_txn_latency_alloc(t);
>         INIT_LIST_HEAD(&t->fd_fixups);
>         binder_stats_created(BINDER_STAT_TRANSACTION);
>         spin_lock_init(&t->lock);
> @@ -5159,6 +5160,7 @@ static void print_binder_transaction_ilocked(struct seq_file *m,
>                    to_proc ? to_proc->pid : 0,
>                    t->to_thread ? t->to_thread->pid : 0,
>                    t->code, t->flags, t->priority, t->need_reply);
> +       trace_binder_txn_latency_info(m, t);
>         spin_unlock(&t->lock);
>
>         if (proc != to_proc) {
> diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h
> index 5b65413..596db00 100644
> --- a/drivers/android/binder_internal.h
> +++ b/drivers/android/binder_internal.h
> @@ -13,6 +13,11 @@
>  #include <linux/uidgid.h>
>  #include "binder_alloc.h"
>
> +#if IS_ENABLED(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)
> +#include <linux/rtc.h>
> +#include <linux/time.h>
> +#endif
> +
>  struct binder_context {
>         struct binder_node *binder_context_mgr_node;
>         struct mutex context_mgr_node_lock;
> @@ -521,6 +526,14 @@ struct binder_transaction {
>          * during thread teardown
>          */
>         spinlock_t lock;
> +       /**
> +        * @timestamp and @tv are used to record the time
> +        * that the binder transaction startup
> +        */
> +#if IS_ENABLED(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)
> +       struct timespec64 timestamp;
> +       struct timeval tv;
> +#endif
>  };
>
>  /**
> diff --git a/drivers/android/binder_latency_tracer.c b/drivers/android/binder_latency_tracer.c
> new file mode 100644
> index 0000000..61ae75f
> --- /dev/null
> +++ b/drivers/android/binder_latency_tracer.c
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 MediaTek Inc.
> + */
> +
> +#include <linux/module.h>
> +#include <uapi/linux/android/binder.h>
> +#include "binder_internal.h"
> +#include "binder_trace.h"
> +
> +/**
> + * The reason setting the binder_txn_latency_threshold to 2 sec
> + * is that most of timeout abort is greater or equal to 2 sec.
> + * Making it configurable to let all users determine which
> + * threshold is more suitable.
> + */
> +static uint32_t binder_txn_latency_threshold = 2;
> +module_param_named(threshold, binder_txn_latency_threshold,
> +                       uint, 0644);
> +
> +/*
> + * probe_binder_txn_latency_free - Output info of a delay transaction
> + * @t:          pointer to the over-time transaction
> + */
> +void probe_binder_txn_latency_free(void *ignore, struct binder_transaction *t,
> +                                       int from_proc, int from_thread,
> +                                       int to_proc, int to_thread)
> +{
> +       struct rtc_time tm;
> +       struct timespec64 *startime;
> +       struct timespec64 cur, sub_t;
> +
> +       ktime_get_ts64(&cur);
> +       startime = &t->timestamp;
> +       sub_t = timespec64_sub(cur, *startime);
> +
> +       /* if transaction time is over than binder_txn_latency_threshold (sec),
> +        * show timeout warning log.
> +        */
> +       if (sub_t.tv_sec < binder_txn_latency_threshold)
> +               return;
> +
> +       rtc_time_to_tm(t->tv.tv_sec, &tm);
> +
> +       pr_info_ratelimited("%d: from %d:%d to %d:%d",
> +                       t->debug_id, from_proc, from_thread,
> +                       to_proc, to_thread);
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
> +static void probe_binder_txn_latency_alloc(void *ignore,
> +                                       struct binder_transaction *t)
> +{
> +       struct timespec64 now;
> +
> +       ktime_get_ts64(&t->timestamp);
> +       ktime_get_real_ts64(&now);
> +       t->tv.tv_sec = now.tv_sec;
> +       t->tv.tv_sec -= (sys_tz.tz_minuteswest * 60);
> +       t->tv.tv_usec = now.tv_nsec/1000;
> +}
> +
> +static void probe_binder_txn_latency_info(void *ignore, struct seq_file *m,
> +                                       struct binder_transaction *t)
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
> +}
> +
> +static int __init init_binder_latency_tracer(void)
> +{
> +       register_trace_binder_txn_latency_free(
> +                       probe_binder_txn_latency_free, NULL);
> +       register_trace_binder_txn_latency_alloc(
> +                       probe_binder_txn_latency_alloc, NULL);
> +       register_trace_binder_txn_latency_info(
> +                       probe_binder_txn_latency_info, NULL);
> +
> +       return 0;
> +}
> +
> +static void exit_binder_latency_tracer(void)
> +{
> +       unregister_trace_binder_txn_latency_free(
> +                       probe_binder_txn_latency_free, NULL);
> +       unregister_trace_binder_txn_latency_alloc(
> +                       probe_binder_txn_latency_alloc, NULL);
> +       unregister_trace_binder_txn_latency_info(
> +                       probe_binder_txn_latency_info, NULL);
> +}
> +
> +module_init(init_binder_latency_tracer);
> +module_exit(exit_binder_latency_tracer);
> +
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
> index eb2c53c..be4fe4c 100644
> --- a/drivers/android/binder_trace.h
> +++ b/drivers/android/binder_trace.h
> @@ -95,6 +95,17 @@
>                   __entry->thread_todo)
>  );
>
> +DECLARE_TRACE(binder_txn_latency_alloc,
> +       TP_PROTO(struct binder_transaction *t),
> +       TP_ARGS(t, e)
> +);
> +
> +DECLARE_TRACE(binder_txn_latency_info,
> +       TP_PROTO(struct seq_file *m,
> +                struct binder_transaction *t),
> +       TP_ARGS(m, t)
> +);
> +
>  TRACE_EVENT(binder_txn_latency_free,
>         TP_PROTO(struct binder_transaction *t
>                  int from_proc, int from_thread
> @@ -108,6 +119,8 @@
>                 __field(int, to_thread)
>                 __field(unsigned int, code)
>                 __field(unsigned int, flags)
> +               __field(unsigned long, start_sec)
> +               __field(unsigned long, start_nsec)
>         ),
>         TP_fast_assign(
>                 __entry->debug_id = t->debug_id;
> @@ -117,11 +130,18 @@
>                 __entry->to_thread = to_thread;
>                 __entry->code = t->code;
>                 __entry->flags = t->flags;
> -       ),
> -       TP_printk("transaction=%d from %d:%d to %d:%d flags=0x%x code=0x%x",
> +#if IS_ENABLED(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)
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

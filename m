Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1068CC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:27:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBE1F2086A
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1clB/f08";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Pv2RJRtd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBE1F2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W/w8COfh4X9ZE30PhYGwdnfRaMLUPRYpD9EpIrGkF8M=; b=1clB/f08+sxz8f1NDFWQ6d3Gl
	FdJNC7o2ZnWWuQJGg/xv6vcL18UCZzU72IENzaq1hNpCOYyTOlbuwPSqvuB3qbUR7qSsUbcvTubd9
	qbUNoQLVhOVL8KsQltLI0m076Xl24UrImav8PtcFNgEerkRXy4Msc4RDIp8+h+Cm0kl+tDlZ1X1kA
	KiiYirQUC5UVyzCmW6vrH3SGsjGxnP5tGN5NeWEkGeppRrRb9W3ML1VXs5na3XMToiHkdCD4LM/du
	RIndaYIWzFOywtpYH37vhsVjDzYlYf5lZGTOmUe0AUtEPpEQtRKevcS8/RBRfzaJ5qzemWwSCbcqw
	xKeIWWVDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2yq2-0006IL-4b; Tue, 04 Aug 2020 15:26:50 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2yq0-0006Hi-CV
 for linux-mediatek@lists.infradead.org; Tue, 04 Aug 2020 15:26:49 +0000
Received: by mail-ej1-x643.google.com with SMTP id d6so29050514ejr.5
 for <linux-mediatek@lists.infradead.org>; Tue, 04 Aug 2020 08:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X3o6MDqUXmxvVSlcdLb2IgJysM+Vk/j+xrJF23Zh02s=;
 b=Pv2RJRtdXsa5JPcelCLgxa/MabWdHgHvtHX75GYe7Y7xpruRC9hh7PLtf/ZOrHAiw8
 VP5SVZy9b8umW6eW4ARyy48QMQ04NXamcrYz/GNkRfZMJGsXWPv/4vzFwLb3jFRpYEil
 pH6XwupwhFlGXDIdQ31xqorNxSrOTLPt93pOsFh4wouUfVLrvSyQy3o1r6I+AsoT/Vz0
 RSdzPrqKE53H3zFd38glLLTTI8nU73sl1fjcJGsbwGX5h7qUZ0KqWC8tWUOmv7csf1uL
 QT7YGckMXfwEbCMNjfsr1ATWDXeF16wNxdgOU8FRKqoElZ1lvj4d+mZyRV4KwZRBLvS2
 6wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X3o6MDqUXmxvVSlcdLb2IgJysM+Vk/j+xrJF23Zh02s=;
 b=W06LyI2O1yWegIoXwyJSynCSSiRolsen1Xjhu5yzDiEuGpqZmsYIXW6qLrrz/EDQeJ
 b5U8NpxCLZaBL9AAvyEKbXsH5/91y8BndjYQ9s9cFnNX61Lx5JBrGtm2qdMG7Zb0DwO+
 8Jc5qpNhDZ3k9gddeqpLO2Fj/FAEyoMLAw3s5z89tszJxhNI/PING0lLLWTBhum8/AJY
 4kG0OTuNCpj32nHVoDHzPqHpI1+7k+uDr9MZEQGbC3AI+HksMpVnpdL7LigeZZmrdT/N
 Cm8VXPwE2e/jh0bsDeS5uAxBch38qReo44jW/PLaN7kE9kTatoq1phzqki3wACBdkyuB
 8qtA==
X-Gm-Message-State: AOAM532zZmRWobZl5XZmP2uNzpGqtPYzcprN0EbD4wVddkR6bT/FlJ5K
 PwyHd26loIDAw/TF3j21dVvyMr10w1nKG+KsUNun9w==
X-Google-Smtp-Source: ABdhPJzaWinHalOkG+8o4dRZjbIYHrsFx1Egu0ptiIqT6GQ27fDqCFx7Adt4ulh0/BdlBtahwcDejEV1GBPU83hOoBw=
X-Received: by 2002:a17:906:c406:: with SMTP id
 u6mr23070434ejz.47.1596554807097; 
 Tue, 04 Aug 2020 08:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <1596509145.5207.21.camel@mtkswgap22>
 <1596549552-5466-1-git-send-email-Frankie.Chang@mediatek.com>
 <1596549552-5466-3-git-send-email-Frankie.Chang@mediatek.com>
In-Reply-To: <1596549552-5466-3-git-send-email-Frankie.Chang@mediatek.com>
From: Todd Kjos <tkjos@google.com>
Date: Tue, 4 Aug 2020 08:26:34 -0700
Message-ID: <CAHRSSExeOn_MO3F3aFc=N0KXBmP0TsWz3RQ8Z-0G2QwK_3y=sw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] binder: add trace at free transaction.
To: Frankie Chang <Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_112648_506450_4A447FAD 
X-CRM114-Status: GOOD (  18.98  )
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

On Tue, Aug 4, 2020 at 7:09 AM Frankie Chang <Frankie.Chang@mediatek.com> wrote:
>
> From: "Frankie.Chang" <Frankie.Chang@mediatek.com>
>
> Since the original trace_binder_transaction_received cannot
> precisely present the real finished time of transaction, adding a
> trace_binder_txn_latency_free at the point of free transaction
> may be more close to it.
>
> Signed-off-by: Frankie.Chang <Frankie.Chang@mediatek.com>

Acked-by: Todd Kjos <tkjos@google.com>

> ---
>  drivers/android/binder.c       |   18 ++++++++++++++++++
>  drivers/android/binder_trace.h |   29 +++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 2df146f..1bfadc2 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -1508,6 +1508,20 @@ static void binder_free_txn_fixups(struct binder_transaction *t)
>         }
>  }
>
> +static void binder_txn_latency_free(struct binder_transaction *t)
> +{
> +       int from_proc, from_thread, to_proc, to_thread;
> +
> +       spin_lock(&t->lock);
> +       from_proc = t->from ? t->from->proc->pid : 0;
> +       from_thread = t->from ? t->from->pid : 0;
> +       to_proc = t->to_proc ? t->to_proc->pid : 0;
> +       to_thread = t->to_thread ? t->to_thread->pid : 0;
> +       spin_unlock(&t->lock);
> +
> +       trace_binder_txn_latency_free(t, from_proc, from_thread, to_proc, to_thread);
> +}
> +
>  static void binder_free_transaction(struct binder_transaction *t)
>  {
>         struct binder_proc *target_proc = t->to_proc;
> @@ -1518,6 +1532,8 @@ static void binder_free_transaction(struct binder_transaction *t)
>                         t->buffer->transaction = NULL;
>                 binder_inner_proc_unlock(target_proc);
>         }
> +       if (trace_binder_txn_latency_free_enabled())
> +               binder_txn_latency_free(t);
>         /*
>          * If the transaction has no target_proc, then
>          * t->buffer->transaction has already been cleared.
> @@ -3093,6 +3109,8 @@ static void binder_transaction(struct binder_proc *proc,
>         kfree(tcomplete);
>         binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
>  err_alloc_tcomplete_failed:
> +       if (trace_binder_txn_latency_free_enabled())
> +               binder_txn_latency_free(t);
>         kfree(t);
>         binder_stats_deleted(BINDER_STAT_TRANSACTION);
>  err_alloc_t_failed:
> diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
> index 6731c3c..eb2c53c 100644
> --- a/drivers/android/binder_trace.h
> +++ b/drivers/android/binder_trace.h
> @@ -95,6 +95,35 @@
>                   __entry->thread_todo)
>  );
>
> +TRACE_EVENT(binder_txn_latency_free,
> +       TP_PROTO(struct binder_transaction *t
> +                int from_proc, int from_thread
> +                int to_proc, int to_thread),
> +       TP_ARGS(t, from_proc, from_thread, to_proc, to_thread),
> +       TP_STRUCT__entry(
> +               __field(int, debug_id)
> +               __field(int, from_proc)
> +               __field(int, from_thread)
> +               __field(int, to_proc)
> +               __field(int, to_thread)
> +               __field(unsigned int, code)
> +               __field(unsigned int, flags)
> +       ),
> +       TP_fast_assign(
> +               __entry->debug_id = t->debug_id;
> +               __entry->from_proc = from_proc;
> +               __entry->from_thread = from_thread;
> +               __entry->to_proc = to_proc;
> +               __entry->to_thread = to_thread;
> +               __entry->code = t->code;
> +               __entry->flags = t->flags;
> +       ),
> +       TP_printk("transaction=%d from %d:%d to %d:%d flags=0x%x code=0x%x",
> +                 __entry->debug_id, __entry->from_proc, __entry->from_thread,
> +                 __entry->to_proc, __entry->to_thread, __entry->code,
> +                 __entry->flags)
> +);
> +
>  TRACE_EVENT(binder_transaction,
>         TP_PROTO(bool reply, struct binder_transaction *t,
>                  struct binder_node *target_node),
> --
> 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

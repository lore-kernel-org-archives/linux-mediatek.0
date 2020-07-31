Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062C5C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 18:51:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06BD2076B
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 18:51:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kAlAOmvb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="UT4URF6J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06BD2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y1pzLeKt2w98KvIYTtFIxIe7flqy2jGiN/t3apyj+fs=; b=kAlAOmvbZrt6DwwKAMrkHHTta
	TrFhBe4RzNA1UqEoHyM76GPBuKcY6ielSDZuvui4x4XTN7nr4Wy+NDim1z2/9fEKPNXcDMCXV42Dy
	5qOYFSnLJQ3Kf4OkbKv/dcnrLERmPHnEWivhZT/pdkTAQSVeGiT3KvwWRqOUN8KoRBeOi55ud3aNX
	d9MNemPpLHAYv/4vUA1LgGxVcsIqNxT45QP7ZC10oQq1mR8VCCivy+xLuae9OHsB67IlGdpV1zAGA
	QFlWxzQi6R/xqLQ32i5AfcjPjVUbrpulBqp/5oRGmablSLONrpTk1W3qv6JkRNQqVioBou0RQsSRe
	L3Z4KrbXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1a7Z-0005zS-Vk; Fri, 31 Jul 2020 18:51:10 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1a7X-0005z4-PW
 for linux-mediatek@lists.infradead.org; Fri, 31 Jul 2020 18:51:08 +0000
Received: by mail-ed1-x543.google.com with SMTP id a14so6058459edx.7
 for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2020 11:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H1yxWveFbgcxmN3Okh0JmdDmTWWm3AmW1DCmR+UkLwo=;
 b=UT4URF6JuAnuqhvuR1gZqQzyWvjRB35xaMTPR5ptKWuVhPr2VM17Z5Z9y1p9gbgvRL
 tzD9iAvHKBTmrkB7ywOk2RT6OdGIRdy0zlfySBYlgl/FaHYOtM2w24QZ5X4choHHVPoF
 UYSjc9w5LWrqi/APIzwueY9q3/+XZBoPQqn/9EIyvfg6kett4gni4HrgUYYrp2P0zfsO
 KbVs8XykCCLwIEpMS4PHMcEmgdjCH8Bvpih4FG3owg+NKMPvbgytKK37qGg2i0f9cyzc
 heWKZZ2gbYy3b+ihcmy9JzMyGARQ2g5LGrcPdgntIq5ITSxp1MgzJ3TQyljcMPWBMQQ3
 LxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H1yxWveFbgcxmN3Okh0JmdDmTWWm3AmW1DCmR+UkLwo=;
 b=kFGqYbwtwwrFfTAePgPEVGVs4uP4gI8Vh3613qNHNgbXbZHSiFWS+/IHahz+06UaiM
 AUvEjRIEH7+VeOAdmL6sq1VyKSqK1p+gDqGa11tWBX8U84Gdiwm1iEsHwVXjNbifysPI
 Pva46EeUdioUDC8ydR9IpJDwudp73ixY8Bi5XUmeEP8P9tP+ZrkjOaDtAvXwuS4rLL/E
 UmqFWGFWLraN/ncoXX8R7xr256szGIV7Kcq0JYFLqQv12m/CeJYJSkb51obUeF+5XdIf
 yX2ytNK7gXOP6gUML0Jk6RrXXOCeTvc/7CAEcpzmy/AtdmaEg/Ac+FZlazIfH1GItKw/
 lOJQ==
X-Gm-Message-State: AOAM530QTJ/K5hGbxWZwffZr09D2ene4M3g3b7SDBvGi945BZEvLhMuf
 VwSdCNX3x4CiLoO39p8yL3X6NIDPO6wWWnG0SaJCtg==
X-Google-Smtp-Source: ABdhPJzExpqA+zLrjByDy59iupLrzFa0bZZT8Zx8QXaMYMClOk6aeoTQgXKBDYnuU6xtw/kcvxzaui3xHDZLmNZFixA=
X-Received: by 2002:aa7:d455:: with SMTP id q21mr5075852edr.164.1596221464460; 
 Fri, 31 Jul 2020 11:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <1595252430.5899.6.camel@mtkswgap22>
 <1595906401-11985-1-git-send-email-Frankie.Chang@mediatek.com>
 <1595906401-11985-3-git-send-email-Frankie.Chang@mediatek.com>
In-Reply-To: <1595906401-11985-3-git-send-email-Frankie.Chang@mediatek.com>
From: Todd Kjos <tkjos@google.com>
Date: Fri, 31 Jul 2020 11:50:52 -0700
Message-ID: <CAHRSSEwqbbTZgaE-KLC0-AMHzRVU3O2AwUzW9i5u54tVmkFAQA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] binder: add trace at free transaction.
To: Frankie Chang <Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_145107_938204_4A6BF50F 
X-CRM114-Status: GOOD (  18.42  )
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

On Mon, Jul 27, 2020 at 8:28 PM Frankie Chang
<Frankie.Chang@mediatek.com> wrote:
>
> From: "Frankie.Chang" <Frankie.Chang@mediatek.com>
>
> Since the original trace_binder_transaction_received cannot
> precisely present the real finished time of transaction, adding a
> trace_binder_txn_latency_free at the point of free transaction
> may be more close to it.
>
> Signed-off-by: Frankie.Chang <Frankie.Chang@mediatek.com>
> ---
>  drivers/android/binder.c       |    6 ++++++
>  drivers/android/binder_trace.h |   27 +++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 2df146f..1e6fc40 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -1522,6 +1522,9 @@ static void binder_free_transaction(struct binder_transaction *t)
>          * If the transaction has no target_proc, then
>          * t->buffer->transaction has already been cleared.
>          */
> +       spin_lock(&t->lock);
> +       trace_binder_txn_latency_free(t);
> +       spin_unlock(&t->lock);

Hmm. I don't prefer taking the lock just to call a trace. It doesn't
make clear why the lock has to be taken. I'd prefer something like:

if (trace_binder_txn_latency_free_enabled()) {
  int to_proc, to_thread;

  spin_lock(&t->lock);
  to_proc = t->to_proc ? t->to_proc->pid : 0;
  to_thread = t->to_thread ? t->to_thread->pid : 0;
  spin_unlock(&t->lock);
  trace_binder_txn_latency_free(t, to_proc, to_pid);
}

And then the trace would use the passed-in values instead of accessing
via t->to_proc/to_thread.

>         binder_free_txn_fixups(t);
>         kfree(t);
>         binder_stats_deleted(BINDER_STAT_TRANSACTION);
> @@ -3093,6 +3096,9 @@ static void binder_transaction(struct binder_proc *proc,
>         kfree(tcomplete);
>         binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
>  err_alloc_tcomplete_failed:
> +       spin_lock(&t->lock);
> +       trace_binder_txn_latency_free(t);
> +       spin_unlock(&t->lock);
>         kfree(t);
>         binder_stats_deleted(BINDER_STAT_TRANSACTION);
>  err_alloc_t_failed:
> diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
> index 6731c3c..8ac87d1 100644
> --- a/drivers/android/binder_trace.h
> +++ b/drivers/android/binder_trace.h
> @@ -95,6 +95,33 @@
>                   __entry->thread_todo)
>  );
>
> +TRACE_EVENT(binder_txn_latency_free,
> +       TP_PROTO(struct binder_transaction *t),
> +       TP_ARGS(t),
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
> +               __entry->from_proc = t->from ? t->from->proc->pid : 0;
> +               __entry->from_thread = t->from ? t->from->pid : 0;
> +               __entry->to_proc = t->to_proc ? t->to_proc->pid : 0;
> +               __entry->to_thread = t->to_thread ? t->to_thread->pid : 0;
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

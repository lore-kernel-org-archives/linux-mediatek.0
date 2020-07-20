Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608C0C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 18:24:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F753208E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 18:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NqzaQzdH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ui/WFmlo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F753208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d2kyDQojK/9Dw1OVvHHrIIe0mQl5/Gu8ibjvuPYtrvM=; b=NqzaQzdHpP+zdnJ+VslAUCEYY
	q+bN9Gowdy+qcxWDgH4IlJKSKGgDSb4WjgGbCJq/cyRJWR/+c6SHngiSreS+0q/IrTg9nJcOf8KGY
	nLcIRXFwQbPQnCwTReblOeHpXuqcdehJHzNkcfnPC1bqwoGlHg1oabmRXHRws3wzBlDyS2StRwCAF
	Q4Vf5SzDUdGHakodXZ9c0H7s8IkQLzQLCaiTBbXO7yWUQ7N7k6X7m9tLv6CZ7N6wO+yv1+DendcNT
	5hridgd78eOlqcCwacWNyfDPdSQ1yP2RozFTnnZZquMIiWQ32DRqh3kGQiuFchn7K32j1P39DSflU
	25KZk2oig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxaSI-0000Lx-2I; Mon, 20 Jul 2020 18:24:02 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxaSF-0000L1-UT
 for linux-mediatek@lists.infradead.org; Mon, 20 Jul 2020 18:24:00 +0000
Received: by mail-ej1-x643.google.com with SMTP id rk21so19103264ejb.2
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2020 11:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mYtPOu3+6Et/kxltzHexe0n0N7DSpTjVRyHcPXRKmCw=;
 b=ui/WFmlokRzdDA5JN1GR5fdBq/UdFuxXFmj7ASkGwvwdeQH5Cd+w3vTSFoF5gUlaiV
 CD10FNPrnEwqMrxIDzhDOwx/IwCPewbSoTDhySKiU6dVEW2iERwIbgt90LUUMOV5ygij
 Stq7qqJdjVdfpcdGrmY9qJGlH/NiV4hXKLOUEZhdc9Xo7tdC9mvggPOoyBx4+QPpNNCW
 hs7Dq+C+Ex5KscAQsqdKfPyjrq/1i1twgoKM+hNMYCu+1bsZ2HOcSCxVkkgt+giJ1g70
 K5BcJkaB/SamNI6vcJEMYUq1b56zYYMsEbMi89iq6qcBnrdqMS4TUrVFwdR154adJR6q
 OShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mYtPOu3+6Et/kxltzHexe0n0N7DSpTjVRyHcPXRKmCw=;
 b=IzlpTzzQzH8h7KylRzqWNPG0ikHTIsbUZx2xijrF9Gjb1j3oBpKumIPl2JOKqYBWEf
 WRNr7MG3XWEBXH1v2OlDIhHxG0mWUy985xAGbocndVLuIei3lcrIfW2HXiIYfNepvlqu
 /OdKDznKA7oOyjQ1/Ii0dV1gSDFt9tf31bpo5mkSvO8XrM3SlB68PTYJfUSYOSKgeKTr
 XmJhDfaW2xy+hl0FrCDA+uyKNT+rqQ6YsV2LiK/0T//av04S0a55mueuWXWzL+8OuP1o
 5AHCx6I6FBG8Pw/n0RFAZ7im8xx68pQAMMrghrW2vGxXQI5Xssd1IxNb/L1/f/F4qLJ+
 J4JA==
X-Gm-Message-State: AOAM532wMAWF5GhJJMh4yiPBHST0dbjHu0WRqnNfqftsQAFQrgf+XvEw
 gahbMV67LHYHeE2yq4+NP5NE0b4aWBr3IPmBn76/Ow==
X-Google-Smtp-Source: ABdhPJw6kbpkvhqkdMCphSGiRLzzPUV18DZOTQU5dB0cdi0CwxIGyDs6TiAqw4ENGTmfmH4/sgAjvJ6lBMmDeYEKedQ=
X-Received: by 2002:a17:906:c007:: with SMTP id
 e7mr21842223ejz.481.1595269434577; 
 Mon, 20 Jul 2020 11:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200507085544.GB1097552@kroah.com>
 <1591791827-23871-1-git-send-email-Frankie.Chang@mediatek.com>
 <1591791827-23871-3-git-send-email-Frankie.Chang@mediatek.com>
In-Reply-To: <1591791827-23871-3-git-send-email-Frankie.Chang@mediatek.com>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 20 Jul 2020 11:23:43 -0700
Message-ID: <CAHRSSEydixN=4JQW3PGsTVaYZG+1aVZA6JOE9c9GufiWrkDycQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] binder: add trace at free transaction.
To: Frankie Chang <Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_142400_033188_81931238 
X-CRM114-Status: GOOD (  16.35  )
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

On Wed, Jun 10, 2020 at 5:24 AM Frankie Chang
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
>  drivers/android/binder.c       |    2 ++
>  drivers/android/binder_trace.h |   27 +++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 1592396..5ec9af8 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -1523,6 +1523,7 @@ static void binder_free_transaction(struct binder_transaction *t)
>          * If the transaction has no target_proc, then
>          * t->buffer->transaction has already been cleared.
>          */
> +       trace_binder_txn_latency_free(t);
>         binder_free_txn_fixups(t);
>         kfree(t);
>         binder_stats_deleted(BINDER_STAT_TRANSACTION);
> @@ -3094,6 +3095,7 @@ static void binder_transaction(struct binder_proc *proc,
>         kfree(tcomplete);
>         binder_stats_deleted(BINDER_STAT_TRANSACTION_COMPLETE);
>  err_alloc_tcomplete_failed:
> +       trace_binder_txn_latency_free(t);
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

t->to_proc and t->to_thread are not safe to dereference without
holding t->lock. If the target process dies, these fields can be set
to NULL

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

Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56931C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 10:04:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE7F964E98
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 10:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE7F964E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MeDrmdSphaqD5Vm5ii4wVrfEy3CajPdQpmlRSRlX1FA=; b=RupiocozFNhvAwjUdP7pBbLkw
	NCNzMmBDlPn55Dr0DP9gUPyx9J2lPYPvmNhi1JNJ0D2sOwNfj9l8NVdSgmJFcLIiUpW+4A66jBf25
	fRaHKc/q8JTVQx7aw2nMiA0hCIOoom3ESUetPFka+w94esktyI74+PJog7GhbW6SI1QcneI9J9tqH
	tVplGs7hKpR5GACepdussds0kYeWdKOB1m/DqTYU0CPwtG3XkgkyNE73iN9YX5DTrUpttlgbcYpbN
	9eQ9daE/oEVx5mJxXwdESKE4QDa/nab6f1B6dl3v/NHQ6s/Y1+/MCeSiYThDklSe1596rc4c3wGlu
	cbHEtxQAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLk4j-00FTl4-1J; Mon, 15 Mar 2021 10:03:49 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLk4c-00FTjE-Tu
 for linux-mediatek@lists.infradead.org; Mon, 15 Mar 2021 10:03:45 +0000
Received: by mail-qk1-x736.google.com with SMTP id t4so31042897qkp.1
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Mar 2021 03:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mMMrIgwms1m+PweB3p+oJVkXrLd9T+PU+71ztQbJ0Ac=;
 b=aZC06iXV6XMrwbpZSotpoDsmfhDR/0tSMJsRNMD+rAn7gq9HZCCG7AmDSGiTdf1I06
 srVTFqSwXc3krmqezFQRz9Ox8TRKFukQLJeL0OAKJoT7HmtARcSNq1hIcS0SoqjvwM4x
 EeO8DVCIiESDGwwc3kVAQ31Sig7EKZGy9M0DjKoBT0oDYRWq+J0ZnU74FXqDZlV6XJGH
 HIelKK/Fii1H+N7+GG6PMiQZGYbN68Zi99IHngEgKCWuXlAu2cFTd+XNpSZandeYCbAs
 UAN1OfLGllXjI+rK14NWNmeXLMoHiVcCekXjaPTlpeQdPinpSJQXYFcgNX45CoD2Boo8
 xpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mMMrIgwms1m+PweB3p+oJVkXrLd9T+PU+71ztQbJ0Ac=;
 b=m9LhMuBOpowe5jiDEfqQ+vCTbc5QkiiN0NKJA7MOj08jNFXujGgjcaPwqpWjAuZPt+
 WLxs4ZIuZoE2MxIadJKzkq/oQrRCc2qOfqRaG1IMSbuWU5RrNpZilW47DFlPTndnLyls
 j7zQK3HCWBA5AIkGTUfJzmy514KxrLPKJ9LJLkEMUt1Y8q2h+PN2Ul5ekJWnLI99RycQ
 RHqWili0zcuOe1lFDCaXjfczE0n0Xy2JoHMqkYmjB1OanhpqTHfEiTK9eeAmkQdbZtzh
 pm/a/NDuTQK3+FRDyryVNA3i0LUX3ed10k5BS7x6ZQPVC3KGZtWtHWclA74aTO6TwSQo
 yGog==
X-Gm-Message-State: AOAM531vxWb9yhrRaKUIKCqPaYO50K9F4JK/dR9hKNRat0Md7bHgfDP6
 kfCKK/DWN6LTnGEgMIm0osx/Sd5NaqHHHmGoTiYsGQ==
X-Google-Smtp-Source: ABdhPJzY/L1jlGeYpP4Qy4eRAiBR0q+Dk04B5WMHyL4Ix2K+M5KfPSB3dABKvPXaix89rpkulv6KdXUAErdMrigRvQU=
X-Received: by 2002:a37:a7cb:: with SMTP id q194mr523293qke.350.1615802621496; 
 Mon, 15 Mar 2021 03:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210315015940.11788-1-walter-zh.wu@mediatek.com>
 <CACT4Y+YrFeRQkw+M8rpOF5169LFn9+puL3Dh1Kk1AOoKV-nyrQ@mail.gmail.com>
 <1615801102.24887.4.camel@mtksdccf07>
In-Reply-To: <1615801102.24887.4.camel@mtksdccf07>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 15 Mar 2021 11:03:30 +0100
Message-ID: <CACT4Y+YtenynUES2Kb6jSjfw_wT4NMeyX+uG5KdCe3SHhq1qsw@mail.gmail.com>
Subject: Re: [PATCH] task_work: kasan: record task_work_add() call stack
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Konovalov <andreyknvl@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, 
 Oleg Nesterov <oleg@redhat.com>, kasan-dev <kasan-dev@googlegroups.com>, 
 Linux-MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 wsd_upstream <wsd_upstream@mediatek.com>, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_100343_318415_881A9710 
X-CRM114-Status: GOOD (  41.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 15, 2021 at 10:38 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> On Mon, 2021-03-15 at 07:58 +0100, 'Dmitry Vyukov' via kasan-dev wrote:
> > On Mon, Mar 15, 2021 at 3:00 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > >
> > > Why record task_work_add() call stack?
> > > Syzbot reports many use-after-free issues for task_work, see [1].
> > > After see the free stack and the current auxiliary stack, we think
> > > they are useless, we don't know where register the work, this work
> > > may be the free call stack, so that we miss the root cause and
> > > don't solve the use-after-free.
> > >
> > > Add task_work_add() call stack into KASAN auxiliary stack in
> > > order to improve KASAN report. It is useful for programmers
> > > to solve use-after-free issues.
> > >
> > > [1]: https://groups.google.com/g/syzkaller-bugs/search?q=kasan%20use-after-free%20task_work_run
> > >
> > > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > > Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> > > Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> > > Cc: Dmitry Vyukov <dvyukov@google.com>
> > > Cc: Andrey Konovalov <andreyknvl@google.com>
> > > Cc: Alexander Potapenko <glider@google.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > Cc: Jens Axboe <axboe@kernel.dk>
> > > Cc: Oleg Nesterov <oleg@redhat.com>
> > > ---
> > >  kernel/task_work.c | 3 +++
> > >  mm/kasan/kasan.h   | 2 +-
> > >  2 files changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/kernel/task_work.c b/kernel/task_work.c
> > > index 9cde961875c0..f255294377da 100644
> > > --- a/kernel/task_work.c
> > > +++ b/kernel/task_work.c
> > > @@ -55,6 +55,9 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
> > >                 break;
> > >         }
> > >
> > > +       /* record the work call stack in order to print it in KASAN reports */
> > > +       kasan_record_aux_stack(work);
> >
> > I think this call should be done _before_ we actually queue the work,
> > because this function may operate on non-current task.
> > Consider, we queue the work, the other task already executes it and
> > triggers use-after-free, now only now we record the stack.
>
> agree, what do you think below change?
>
> --- a/kernel/task_work.c
> +++ b/kernel/task_work.c
> @@ -34,6 +34,9 @@ int task_work_add(struct task_struct *task, struct
> callback_head *work,
>  {
>     struct callback_head *head;
>
> +   /* record the work call stack in order to print it in KASAN reports
> */
> +   kasan_record_aux_stack(work);
> +

This looks good to me.


>     do {
>         head = READ_ONCE(task->task_works);
>         if (unlikely(head == &work_exited))
> @@ -55,9 +58,6 @@ int task_work_add(struct task_struct *task, struct
> callback_head *work,
>         break;
>     }
>
> -   /* record the work call stack in order to print it in KASAN reports
> */
> -   kasan_record_aux_stack(work);
> -
>     return 0;
>  }
>
> > Moreover, I think we can trigger use-after-free here ourselves while
> > recording the aux stack. We queued the work, and the work can cause
> > own free, so it's not necessary live by now.
>
> Sorry, I don't fully know your meaning, do you mean we should add an
> abort when detect use-after-free?

I meant that where we had the kasan_record_aux_stack(work) call in the
first version of the patch, work can be already freed. We must not
access work after queueing it.

> > >         return 0;
> > >  }
> > >
> > > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > > index 3436c6bf7c0c..d300fe9415bd 100644
> > > --- a/mm/kasan/kasan.h
> > > +++ b/mm/kasan/kasan.h
> > > @@ -146,7 +146,7 @@ struct kasan_alloc_meta {
> > >         struct kasan_track alloc_track;
> > >  #ifdef CONFIG_KASAN_GENERIC
> > >         /*
> > > -        * call_rcu() call stack is stored into struct kasan_alloc_meta.
> > > +        * Auxiliary stack is stored into struct kasan_alloc_meta.
> > >          * The free stack is stored into struct kasan_free_meta.
> > >          */
> > >         depot_stack_handle_t aux_stack[2];
> > > --
> > > 2.18.0
> >
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/1615801102.24887.4.camel%40mtksdccf07.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

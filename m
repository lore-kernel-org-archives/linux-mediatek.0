Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8623BC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 00:31:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F37B464E74
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 00:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F37B464E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nMwV58ceRolewbGO77VsYVHZu0nYFK1yqiS8v5yUiSI=; b=TBGjUiCxWkh4G+1Sk5k4Ek+E7
	bT+aZnja+lkAQgn6gb1ODI6tOVGIyuN+d9qYjDCAflRCtgkGsIPnZ7hM3bq+LQge2qFy1HqO3gwcT
	J27DnoFTluR5ZZJOs1q9+InjIWZ4LzSGd/UgtT/enhgo9gKVJ7RNfLvmAk3fs+7RJIzIGl9eHghDZ
	vx/PRkP1zLwL4ks6erj14Qz/TviKYkbQQsDER4tiZrhS5C/l88oG1LZHoxYENpVVGBlYovywgmzCH
	0WRD+hh17lcwA9+xNFHjn8fWwy+C7AY3SyqGVaAafEK/6TnRwd4vXa7GBriILQKXVJPNcmSUk3zYb
	MK/Qow3Qw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMgZO-004AJ0-AF; Thu, 18 Mar 2021 00:31:22 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMgZ3-004AFi-Sp
 for linux-mediatek@lists.infradead.org; Thu, 18 Mar 2021 00:31:13 +0000
Received: by mail-pj1-x102e.google.com with SMTP id ha17so2007287pjb.2
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Mar 2021 17:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GkuRWpW9bExkYFxOTvvebzKRarhbJmzTDiFRajMJb68=;
 b=Tw1JOhx9WMaxj2zgL2+u0rROy7M24TONLFY0jAeGeUZ8wvui68EopwXxn0qUW0MLd0
 7wDivc0uuetGtGIEBWlrqWFTBrilHFV2627ljgT263GE3RoDzgfyK5e5EBpYudqtz3dd
 /GlEBbuxEmry+CKUqSgiqaef06Dd3YyED+Uy8aI1BWqYM3LFXERUI3TDN2+wCbHzSCrC
 kocqgtsBmdIspMmdXpz5DCNo6LQRcOt+khcnBdBCVCCRtYuHidggrt5eRg0wTtuaDlgX
 W3kktFufFg0ZZSamAU5eWzJAmxbxOAlnl292ZmodwTRQBmd9GRSUIOVk5WemXVV5R2pn
 lMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GkuRWpW9bExkYFxOTvvebzKRarhbJmzTDiFRajMJb68=;
 b=VPCcTq2O8c73zyrVQZ2F4UMtG7G1o2GC21qrQl0AH9biIOV68SsgyDzRiL2w3pCxVl
 N7/rKTgIV4H9RFBiD4mHpqCX6bGxNEi1j6pJDeNfdddkBPROlPRD8MA/QkNwo06Mq6RF
 T+AfwG511I2mlW2/BdYlQcrHsraoXRJbLWs9P1xUU5FVE+yKmea/AlLY1cdy5AyZKlQW
 XLYkia6nQYvWV7BAgm6Cs4DmUkrLkU209KY8XJVlgb3ae3Qn+RFfigDznVfG1tVdtI1h
 qW79fSPL/6LWDWp0D6WvenMq1hNVAF8P4nzo0IfCukAodn3xX8/Frlx+/Jp+MLa6FpiK
 /nNA==
X-Gm-Message-State: AOAM532t9tn1PE0iYf+gBY3bDV+ndV3MsmjxS0w2vHT9o0wHSrjZyaF3
 pI8TRNR68L+zk8/XKrA0dlVgwHez9kLLs6BKqcymrg==
X-Google-Smtp-Source: ABdhPJzesTshIrJdKNHCDmlj2OR3e0xSraSKUZZ3Bj14Xck17fx++XRNX8MVNVTQU2DyspV0entCrOLh4c3wfRmf7Lw=
X-Received: by 2002:a17:90a:a10c:: with SMTP id
 s12mr1413387pjp.166.1616027458725; 
 Wed, 17 Mar 2021 17:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210316024410.19967-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20210316024410.19967-1-walter-zh.wu@mediatek.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Thu, 18 Mar 2021 01:30:47 +0100
Message-ID: <CAAeHK+xiNywqQOzB=FUYOBJdSSNXbO4p2SdOvk4WKfhp_jiKGQ@mail.gmail.com>
Subject: Re: [PATCH v2] task_work: kasan: record task_work_add() call stack
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, 
 Oleg Nesterov <oleg@redhat.com>, kasan-dev <kasan-dev@googlegroups.com>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 wsd_upstream <wsd_upstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_003111_251141_58A9015F 
X-CRM114-Status: GOOD (  23.70  )
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

On Tue, Mar 16, 2021 at 3:44 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> Why record task_work_add() call stack?
> Syzbot reports many use-after-free issues for task_work, see [1].
> After see the free stack and the current auxiliary stack, we think
> they are useless, we don't know where register the work, this work
> may be the free call stack, so that we miss the root cause and
> don't solve the use-after-free.
>
> Add task_work_add() call stack into KASAN auxiliary stack in
> order to improve KASAN report. It is useful for programmers
> to solve use-after-free issues.
>
> [1]: https://groups.google.com/g/syzkaller-bugs/search?q=kasan%20use-after-free%20task_work_run
>
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrey Konovalov <andreyknvl@google.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Oleg Nesterov <oleg@redhat.com>
> ---
>
> v2: Fix kasan_record_aux_stack() calling sequence issue.
>     Thanks for Dmitry's suggestion
>
> ---
>  kernel/task_work.c | 3 +++
>  mm/kasan/kasan.h   | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/task_work.c b/kernel/task_work.c
> index 9cde961875c0..3d4852891fa8 100644
> --- a/kernel/task_work.c
> +++ b/kernel/task_work.c
> @@ -34,6 +34,9 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
>  {
>         struct callback_head *head;
>
> +       /* record the work call stack in order to print it in KASAN reports */
> +       kasan_record_aux_stack(work);
> +
>         do {
>                 head = READ_ONCE(task->task_works);
>                 if (unlikely(head == &work_exited))
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 3436c6bf7c0c..e4629a971a3c 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -146,7 +146,7 @@ struct kasan_alloc_meta {
>         struct kasan_track alloc_track;
>  #ifdef CONFIG_KASAN_GENERIC
>         /*
> -        * call_rcu() call stack is stored into struct kasan_alloc_meta.
> +        * The auxiliary stack is stored into struct kasan_alloc_meta.
>          * The free stack is stored into struct kasan_free_meta.
>          */
>         depot_stack_handle_t aux_stack[2];
> --

Acked-by: Andrey Konovalov <andreyknvl@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

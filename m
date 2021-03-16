Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F688C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 06:35:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9390E650E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 06:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9390E650E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7FHSBxN8GxUtt8R1/11fHRzWpIpNN6Y09X4tX39okec=; b=NpqCQBVNAq1JQbZxdrYjzYWwk
	QgNJEi0dWlkGG9oEVZ+B+9jd+0EO1TVWIlxmn6b6TUgIZfx+Wf1Sy0qo/Vydn4ZMl1PY9p2YZIA6+
	7NF+PBKWWmYl5E3lFk++BE7j4uFiZfF2OXYPPRQALraM4lRl3x9C9XzC0w8kLaPNsPJevTCkaKSHf
	gTv7B+DWxT+4bo2ES2EwGungS12WjTQfnAI4UaaeRyapPxCpCyG3L0qryiy5P3qVZti5ckEfRU7Pl
	8BYKdgBGSvsbfeK+2mnKJelFsDUb7wWejfzhMuSKZCPY5kO/+2bp7ScTg/OzYh4GeQdIP/99u+vtb
	BWYieUoCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM3IH-00HXUE-Mq; Tue, 16 Mar 2021 06:35:05 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM3I4-00HXSC-K9
 for linux-mediatek@lists.infradead.org; Tue, 16 Mar 2021 06:34:55 +0000
Received: by mail-qv1-xf35.google.com with SMTP id x27so9008876qvd.2
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Mar 2021 23:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SByyMFSlLntBAm8fHgqN+CmCCGC2J92yQYTbduz/8F4=;
 b=s+uLqyFrjkMmW5YeJaqvGeFwM5DpyLE4ZA0G18plRKW6nkBDny7Y1Hg1jB6l1VviZs
 iVQoYuy06c2imtqXONxNojwDzI11L8Qa06mrjwRw6EcTYvUlMhR+8Lp+oxxpVoz2r6MV
 HCP6FzftAUKiF/AxuYU1jXZbpbdmmwlN9PG7xFbZmfgZdYL+bi74iBxGEJEqwnRK4pu9
 Fe9EJOMXK2UxSnubdPd0khIQUofJ3iqj6+JDqsiJeis2fVUrcTajpg9ImNlmjB0Trox9
 sLfwQf7pNCciXu7qXbTOgcWM9gefBhaZEvrcyCTLdK787ft3FfHDgyoYYOzozCIKWYfd
 QtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SByyMFSlLntBAm8fHgqN+CmCCGC2J92yQYTbduz/8F4=;
 b=L360IQqovptAQomr0D0dYBchFhmT8YDbQ3XZWsf54wUsnB0+lWHTbd0pfuidCpjEh9
 fuC8zRAn9OG/JGVoV9klNTQEdboJfQj18LQQvekKOI7sxyozhjBoY2HmtybazJWcdBMl
 yb5aVy8i4MvvflPaSHv1clWwr/g3kWW0Hgxt9GuTreJ60pvI+HKH+/5qFcu8mt8OfxQi
 +m7qcxmYmZU09CcLgr1yljr6Ia1Raeqd1ORSNsQMwGr9Q4tu1Y0TSGVgv4dECrB4xvCn
 1u5044YRSkW205m8EBBfqcoFS2nE5y4ES1rhjaAdmws7Rxj7L2snuelSq9QuZRzscIT7
 hTAQ==
X-Gm-Message-State: AOAM533JRV/PFCRfh5DyldvBN5HnNOjYKEbdeXLDKRk2ax9TdK/vvC97
 nQS6aVw8IdL10IzxmsHktJCWT++I1WpsssT5XPvy3g==
X-Google-Smtp-Source: ABdhPJwCeQcT66aWyysAq/F0mnL+lIXNOvkkdqOLUYYKOZSFIJs9a705sEfwv8vZeNPeivpqwej8TWOU/YNOMe3w00c=
X-Received: by 2002:a0c:8304:: with SMTP id j4mr14226424qva.18.1615876491060; 
 Mon, 15 Mar 2021 23:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210316024410.19967-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20210316024410.19967-1-walter-zh.wu@mediatek.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 16 Mar 2021 07:34:39 +0100
Message-ID: <CACT4Y+aMKH24F6DO=iKX0jDmxm4MCuJkA-OTkmgbfDm73LLKhQ@mail.gmail.com>
Subject: Re: [PATCH v2] task_work: kasan: record task_work_add() call stack
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
X-CRM114-CacheID: sfid-20210316_063453_468086_FFDC86EB 
X-CRM114-Status: GOOD (  27.71  )
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

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

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
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210316024410.19967-1-walter-zh.wu%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

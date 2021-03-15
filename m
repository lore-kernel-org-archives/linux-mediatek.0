Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB27C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 06:59:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B4E64E21
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 06:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40B4E64E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BYPx2DtnM4FsHKuKUYuhcZ2iFUSd01R2wvYw2DA57SE=; b=fIbQtHiweGFh+FlkY7SoSpjrr
	4JHj1Qa4TlfjrhRYzmes0SEwcq9JP6MFkIgDHwcUzCDmFPSRE+F0qxllar3W94v6IcGF0v6gF7iqE
	wZDKLFonRtEjZONvJLX2X720sFMs+/I1Tr5cX/pY6WfFXFzQKgviPRAV7vZ0C+jF4em2ezqC+omQY
	FkMD741uW8NH3xbnt8jcuV6mJuhmAvKdRSYQlXfkeT9tLfe2IwTslMHEm1nI3UEBLGf9vBWdsAUfW
	HiB3T5duSsMiKeGSs3i0KQbusCHK1yQ+u7R5Q4USrglueo+Fbk/njFR60irT05YEgJ88S31EHvw5L
	T3qPkLAOw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLhBx-00F64V-2Y; Mon, 15 Mar 2021 06:59:05 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLhBo-00F62w-UK
 for linux-mediatek@lists.infradead.org; Mon, 15 Mar 2021 06:58:59 +0000
Received: by mail-qt1-x82b.google.com with SMTP id g24so8410438qts.6
 for <linux-mediatek@lists.infradead.org>; Sun, 14 Mar 2021 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IU5V4mabE/n2VCRh3kSmfdhuEAACW74e/YNmNcSi3W8=;
 b=QdhmEyhcxyXwVDR8NjUH/7ppDoyROqwTDE670AXXQmtFChEdYuZki5fhCpd6P68hxZ
 Y21sjoK48mK/a62E28b9/N+oxL/IEol2w/iP1zkhiAdn4neTjw73fwdorPEw5nYIcTM9
 zGD0rVhMCXMIVVfIgUGJmliNYgomQ4uJVgZlLpvGiHumU2YbVPgMeONAzOcg0IXcfM+K
 e8XrSRfdRxTRdGgP5J+jYYWn5FhDqA5RBQbqLLymakk+zSwGoixcNubo3YIP1GwbdVzO
 ieLO4B1Dl7xRtri8oGKJz0PqFAhMkm6FB6sex6h/t1EESM4HYClp59EF09NSorHVK12H
 jNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IU5V4mabE/n2VCRh3kSmfdhuEAACW74e/YNmNcSi3W8=;
 b=BPZoTsd6yleD+bkYh8FIJ2rcOF0UBwqZdgdk/jHcQEEKMHQ64ul6VqoYARIYnYY8ym
 FF7snr4l/V9u1F5HZStk+Bbt/i5eoQjEmDx/8PncVU92cB8A9Z5qfmT0gW6uS4YduAvD
 Arj+5syEfmUqjwyM4SYriR/UxI/aJS5mOSeInPwwNuy5ERQ3W6uST5ExOt+bCM6bN2Yw
 /7lNzP4wLgTZNsT6u/gws/ZGPaHfYsTqKwC7OWVY8Kc7gfl6Ifreyn2Y2MRTa8RHq5gp
 kKFmHHz0sCDPvL1vk/XqlE3un7y1Vbtg2eiSQwADlV/l5VsHt9Hy/onTI6w3jfr5N5fA
 2MUA==
X-Gm-Message-State: AOAM531l38zvTceSq7p/2yxEX2IB1GNa9hYTzeMNHisICJARv84vtGKe
 J7iW7vUHT99xaOii/1pY6VJ6BKCHPeiE5xKneFcfhg==
X-Google-Smtp-Source: ABdhPJw1nDPMaGuD+I/Gyg5vA/5WTioXa+s8ugiYlPtLXZ1fT5Oc3wV3ImBGwIyFbtBVjuIobFZYNfiGA87XfCiM7TY=
X-Received: by 2002:ac8:7318:: with SMTP id x24mr21525417qto.67.1615791535245; 
 Sun, 14 Mar 2021 23:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210315015940.11788-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20210315015940.11788-1-walter-zh.wu@mediatek.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 15 Mar 2021 07:58:44 +0100
Message-ID: <CACT4Y+YrFeRQkw+M8rpOF5169LFn9+puL3Dh1Kk1AOoKV-nyrQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210315_065857_422369_FF893776 
X-CRM114-Status: GOOD (  25.15  )
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

On Mon, Mar 15, 2021 at 3:00 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
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
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrey Konovalov <andreyknvl@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Oleg Nesterov <oleg@redhat.com>
> ---
>  kernel/task_work.c | 3 +++
>  mm/kasan/kasan.h   | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/task_work.c b/kernel/task_work.c
> index 9cde961875c0..f255294377da 100644
> --- a/kernel/task_work.c
> +++ b/kernel/task_work.c
> @@ -55,6 +55,9 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
>                 break;
>         }
>
> +       /* record the work call stack in order to print it in KASAN reports */
> +       kasan_record_aux_stack(work);

I think this call should be done _before_ we actually queue the work,
because this function may operate on non-current task.
Consider, we queue the work, the other task already executes it and
triggers use-after-free, now only now we record the stack.
Moreover, I think we can trigger use-after-free here ourselves while
recording the aux stack. We queued the work, and the work can cause
own free, so it's not necessary live by now.

>         return 0;
>  }
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 3436c6bf7c0c..d300fe9415bd 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -146,7 +146,7 @@ struct kasan_alloc_meta {
>         struct kasan_track alloc_track;
>  #ifdef CONFIG_KASAN_GENERIC
>         /*
> -        * call_rcu() call stack is stored into struct kasan_alloc_meta.
> +        * Auxiliary stack is stored into struct kasan_alloc_meta.
>          * The free stack is stored into struct kasan_free_meta.
>          */
>         depot_stack_handle_t aux_stack[2];
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

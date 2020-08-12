Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB215C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 14:13:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79617204FD
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 14:13:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AlRDQAiy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ZyrDNv/E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79617204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aJpqYPHEm2vymI+uvxNJprWYFUUz+OpIScFFxf7L1XY=; b=AlRDQAiypCDSYQzQQlk0AipKW
	AoiA34l36N0PM5mupxigqSLnhi1lfe5TXblsBlk2GVoCXljkyFGEJYLCzf9yw2UmjnIag+gOLPqkf
	l4WB9sywe2SxizrZ5WdaHMMAa66PKfjVLoS8hnq+GECLLPEQOWDGSqwrba9d11ouUaYxDGvSJGx34
	HFmbJ2QusubdV1zW0cHFXLViAD44Kg2vBkssa0yuTUuJ3UKE326E5HI0AVKvuJoPqEjzCI2v8mIcZ
	3VHMmVbJ1PjcUp46nCyt5ZKZu8K5uJocqVCmaxGg/o2JZGPiWm+TKPywXwAhShFRL5JTqMLs9N0Vz
	IcfuhL7zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5rVQ-00021v-BO; Wed, 12 Aug 2020 14:13:28 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5rVM-0001zJ-KM
 for linux-mediatek@lists.infradead.org; Wed, 12 Aug 2020 14:13:26 +0000
Received: by mail-oi1-x244.google.com with SMTP id v13so1894540oiv.13
 for <linux-mediatek@lists.infradead.org>; Wed, 12 Aug 2020 07:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eny7GtW3fheHTjAaLnI+U+IUiSf5L2wZMby5TEt/uUU=;
 b=ZyrDNv/EFXrsfT2cLSeHIYizOdkcvsp1j7OBQ1aowLsdKMYwu3Erh3AfIT0w3ioDCQ
 KfZPUlQPzSoP+nUFYYYO75TVc/gwd5Pb29VR2AvJEi/zoQ05+n/MwJ7Ce5uYS3rN6mC5
 cXGuavRO/u9qGk+OlTcMvNTTf0BH+S3ny3O8O6wGekHkSvY7XaEXxoreGvasTdQuVLLN
 9k5KaqttiFGfMl0dKXpl/MS6KmuVwDc0i/TlFUM9bFFdvPTgN2wKkSauEFJWPUhuv+Sh
 JgKs2SJ/+byaCu7G78QKTwAlQ2T+UHsNjxsoHrSWI9ihc6q1Ecwt9WthXZ8Q5RUtMJ98
 Ybrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eny7GtW3fheHTjAaLnI+U+IUiSf5L2wZMby5TEt/uUU=;
 b=JwFHEEQU+XcYIrP4IWFJP9FpLDccxz0u6EgTYHks8qXYdx91e29oT2xkb7qfltVZ5a
 oCgDOXZ/jCiaV61VxSdkkIUIuTJQ1g/70xuaLTr6wTieIquqaCdUbq+Pgq600yK68/H3
 8Fba7ojq0i9jgWIAG60yO/4vIxGlxyNGc4H62Rnq0x9pSAJ/9GaBEdtyA7vrzddDyDYf
 p6th+QBB/zSy1/qKW4Jb8GrDefVgGi6c3MGNiG1qGIN1UFvHu6fpR3sZ2xiOckhIBj1L
 tZ1gvwECRXHamwV25fotEoz4ID/9Ei4vOe2mPHuQnf5l3SB4NcAC0APD4+L3V9jnyIuE
 jVuA==
X-Gm-Message-State: AOAM533uSZSTTKOR4W22VyvxtIEFxJHpLhPeBghBHpkqH1I/KECAtsQs
 KkNQZPd89F2J4FeMs3MmxfC5whNUaMd6pxuIDaEBvw==
X-Google-Smtp-Source: ABdhPJw85SLSUV6JhAygRCX/l0A0lj6KIvRKkfbUSL+xaRgnaDhfrkRyLSy4hvJ32Tjv/Nn70me/rXN2+2i6JwfXQLM=
X-Received: by 2002:aca:d4d5:: with SMTP id l204mr7728838oig.70.1597241602391; 
 Wed, 12 Aug 2020 07:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200810072313.529-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200810072313.529-1-walter-zh.wu@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Wed, 12 Aug 2020 16:13:09 +0200
Message-ID: <CANpmjNO9=JBcSV-nif9a=4Zt7gTCp6e5c2jVXMCSFgP3v2P9-w@mail.gmail.com>
Subject: Re: [PATCH 1/5] timer: kasan: record and print timer stack
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_101324_794252_CFFD4C07 
X-CRM114-Status: GOOD (  29.47  )
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
Cc: John Stultz <john.stultz@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 10 Aug 2020 at 09:23, Walter Wu <walter-zh.wu@mediatek.com> wrote:
> This patch records the last two timer queueing stacks and prints
> up to 2 timer stacks in KASAN report. It is useful for programmers
> to solve use-after-free or double-free memory timer issues.
>
> When timer_setup() or timer_setup_on_stack() is called, then it
> prepares to use this timer and sets timer callback, we store
> this call stack in order to print it in KASAN report.
>
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  include/linux/kasan.h |  2 ++
>  kernel/time/timer.c   |  2 ++
>  mm/kasan/generic.c    | 21 +++++++++++++++++++++
>  mm/kasan/kasan.h      |  4 +++-
>  mm/kasan/report.c     | 11 +++++++++++
>  5 files changed, 39 insertions(+), 1 deletion(-)

I'm commenting on the code here, but it also applies to patch 2/5, as
it's almost a copy-paste.

In general, I'd say the solution to get this feature is poorly
designed, resulting in excessive LOC added. The logic added already
exists for the aux stacks.

> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 23b7ee00572d..763664b36dc6 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -175,12 +175,14 @@ static inline size_t kasan_metadata_size(struct kmem_cache *cache) { return 0; }
>  void kasan_cache_shrink(struct kmem_cache *cache);
>  void kasan_cache_shutdown(struct kmem_cache *cache);
>  void kasan_record_aux_stack(void *ptr);
> +void kasan_record_tmr_stack(void *ptr);
>
>  #else /* CONFIG_KASAN_GENERIC */
>
>  static inline void kasan_cache_shrink(struct kmem_cache *cache) {}
>  static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
>  static inline void kasan_record_aux_stack(void *ptr) {}
> +static inline void kasan_record_tmr_stack(void *ptr) {}

It appears that the 'aux' stack is currently only used for call_rcu
stacks, but this interface does not inherently tie it to call_rcu. The
only thing tying it to call_rcu is the fact that the report calls out
call_rcu.

>  /**
> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> index 4b3cbad7431b..f35dcec990ab 100644
> --- a/mm/kasan/generic.c
> +++ b/mm/kasan/generic.c
> @@ -347,6 +347,27 @@ void kasan_record_aux_stack(void *addr)
>         alloc_info->aux_stack[0] = kasan_save_stack(GFP_NOWAIT);
>  }
>
> +void kasan_record_tmr_stack(void *addr)
> +{
> +       struct page *page = kasan_addr_to_page(addr);
> +       struct kmem_cache *cache;
> +       struct kasan_alloc_meta *alloc_info;
> +       void *object;
> +
> +       if (!(page && PageSlab(page)))
> +               return;
> +
> +       cache = page->slab_cache;
> +       object = nearest_obj(cache, page, addr);
> +       alloc_info = get_alloc_info(cache, object);
> +
> +       /*
> +        * record the last two timer stacks.
> +        */
> +       alloc_info->tmr_stack[1] = alloc_info->tmr_stack[0];
> +       alloc_info->tmr_stack[0] = kasan_save_stack(GFP_NOWAIT);
> +}

The solution here is, unfortunately, poorly designed. This is a
copy-paste of the kasan_record_aux_stack() function.

>  void kasan_set_free_info(struct kmem_cache *cache,
>                                 void *object, u8 tag)
>  {
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index ef655a1c6e15..c50827f388a3 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -108,10 +108,12 @@ struct kasan_alloc_meta {
>         struct kasan_track alloc_track;
>  #ifdef CONFIG_KASAN_GENERIC
>         /*
> -        * call_rcu() call stack is stored into struct kasan_alloc_meta.
> +        * call_rcu() call stack and timer queueing stack are stored
> +        * into struct kasan_alloc_meta.
>          * The free stack is stored into struct kasan_free_meta.
>          */
>         depot_stack_handle_t aux_stack[2];
> +       depot_stack_handle_t tmr_stack[2];
>  #else
>         struct kasan_track free_track[KASAN_NR_FREE_STACKS];
>  #endif
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index fed3c8fdfd25..6fa3bfee381f 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -191,6 +191,17 @@ static void describe_object(struct kmem_cache *cache, void *object,
>                         print_stack(alloc_info->aux_stack[1]);
>                         pr_err("\n");
>                 }
> +
> +               if (alloc_info->tmr_stack[0]) {
> +                       pr_err("Last timer stack:\n");
> +                       print_stack(alloc_info->tmr_stack[0]);
> +                       pr_err("\n");
> +               }
> +               if (alloc_info->tmr_stack[1]) {
> +                       pr_err("Second to last timer stack:\n");
> +                       print_stack(alloc_info->tmr_stack[1]);
> +                       pr_err("\n");
> +               }

Why can't we just use the aux stack for everything, and simply change
the message printed in the report. After all, the stack trace will
include all the information to tell if it's call_rcu, timer, or
workqueue.

The reporting code would simply have to be changed to say something
like "Last potentially related work creation:" -- because what the
"aux" thing is trying to abstract are stack traces to work creations
that took an address that is closely related. Whether or not you want
to call it "work" is up to you, but that's the most generic term I
could think of right now (any better terms?).

Another argument for this consolidation is that it's highly unlikely
that aux_stack[a] && tmr_stack[b] && wq_stack[c], and you need to
print all the stacks. If you are worried we need more aux stacks, just
make the array size 3+ (but I think it's not necessary).

Thanks,
-- Marco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=WPHR=7H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF71FC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 09:57:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 842A6207FB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 09:57:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UpXGUjbZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="pw328Wov"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 842A6207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qB4RHmOjrxxI9RgMwz6m4bE34Ge5fXDha2TdujdnAAY=; b=UpXGUjbZLO37An
	JlAQBHa5uZ/x9dChs5UOZdMNkTlV0BHWsTNALcMHd76UxpfltyWmPz2uo+XxNxLKncE9O/BhGsCUE
	9Avn5l+yJP9kX/QdmbXsn35ty4Y178Mkgx4jLKuQMNtf8q+pUDPKSPJmpT3mcXQq6Q9K6c/CA9DjA
	ADaWTrFVpEaMKyeDMSqapjTK0xw0ZcLI/zG/MZ+KHbGfWru0sdg52q/T+aqVrI83xp6yaaHuuKezq
	gugRQ8BCsmCPvwXimIcJXqwlWDg06dZWD9gS5hgO4MSU4Z/mj3PEOIw/tS8yA6wlZkpKewgPgXdvG
	4iDil50dgNZyaClCu3Qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd9qs-0004MR-Nf; Mon, 25 May 2020 09:56:59 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd9qe-00047n-K7
 for linux-mediatek@lists.infradead.org; Mon, 25 May 2020 09:56:47 +0000
Received: by mail-qt1-x841.google.com with SMTP id e16so7529878qtg.0
 for <linux-mediatek@lists.infradead.org>; Mon, 25 May 2020 02:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xgy4pPwZvtj+TPA9hBH3u2ab7Rd+oEJ+C7zugCqkjSE=;
 b=pw328WoviOHNUOb1wemFaEh4oU0CaeEryBB1HVU7jb147EtirSWXnc0Of7pyUsNu/4
 Y31/bMG5OvVNXmKEjQ2/bHn0cZ9y6J4idnng1OsJm1L+Y2NW3XZftCQU2LJ4hsFAneOg
 M1rzrheRn/j4ngjNQd4a1v0NtSNPTSbzLmPi1peQ/MyJptaia97iIkMW4m5oxafw0190
 coEeM3qQTHgMTa9BNYQOGJthlqc+LP7TRouNoPLnRCEgpcqeyqRpEJYoYDFxbP13FoZW
 Uhv4sTdhXxYXwzUldUOTPDokZrmVvlh+P8XtQeSk/w6PGLYmLOF+3yJRzVnT5+GDnCEX
 l2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xgy4pPwZvtj+TPA9hBH3u2ab7Rd+oEJ+C7zugCqkjSE=;
 b=U57Gz+sWV3WArzRazLXvVs7sZl1Ah/7UVgBuw1Z7/CbnFVg1JAIhF1erOgb4P6azKf
 wsz4/5+3/+zWIElj9lsfXxYiuKpzP6LPulX5qZkHyoM/3xXJEdTZtnHhXlIoyKaYkUY8
 DFtm9IsAkpOtxBx/dLPJTDYQZkpt5JfKvbI7ofw1N9EGpGNQOIkriEI8HGwuVZf25WFX
 efi8xuf7kQ8u+G3ixkqqjjzlbFoz6W8Kn3iAUwVWkBnoZyTVohDk2nsFFFBWz/lXRkw1
 GTuGrFFgfS5HB3ScVbggn6UzFxwC17JPCzIpkZnD/xCwleO6G6UDFykgx5DbEl1+peSR
 cinQ==
X-Gm-Message-State: AOAM531Jab6wJ2cFfAIeTq6li+Ce9oED0WTN7Pb2lZ6vkZJzbn35fp5w
 6It13Li0H/eZlP/sLm44KE11E0KcaWjGgI3k+dPt2Q==
X-Google-Smtp-Source: ABdhPJy53jIyAXr/dV5k2cbIvijNG4i6QjG5uYS4h1FkoY3idjBusgFR602TYASb0QHlcI3nl2a+YNyE94DXEir5TpU=
X-Received: by 2002:ac8:260b:: with SMTP id u11mr27310502qtu.380.1590400603220; 
 Mon, 25 May 2020 02:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200522020127.23335-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200522020127.23335-1-walter-zh.wu@mediatek.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 25 May 2020 11:56:32 +0200
Message-ID: <CACT4Y+aFiKZs4EW9ovnQYCu0ytgy0Po3k0rCWAXObmV3Yvd68A@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] kasan: record and print the free track
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_025644_849860_72F9164A 
X-CRM114-Status: GOOD (  25.21  )
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
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 22, 2020 at 4:01 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> Move free track from kasan_alloc_meta to kasan_free_meta in order
> to make struct kasan_alloc_meta and kasan_free_meta size are both
> 16 bytes. It is a good size because it is the minimal redzone size
> and a good number of alignment.
>
> For free track, we make some modifications as shown below:
> 1) Remove the free_track from struct kasan_alloc_meta.
> 2) Add the free_track into struct kasan_free_meta.
> 3) Add a macro KASAN_KMALLOC_FREETRACK in order to check whether
>    it can print free stack in KASAN report.
>
> [1]https://bugzilla.kernel.org/show_bug.cgi?id=198437

Reviewed-and-tested-by: Dmitry Vyukov <dvyukov@google.com>

> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> Co-developed-by: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> ---
>  mm/kasan/common.c         | 22 ++--------------------
>  mm/kasan/generic.c        | 22 ++++++++++++++++++++++
>  mm/kasan/generic_report.c |  1 +
>  mm/kasan/kasan.h          | 13 +++++++++++--
>  mm/kasan/quarantine.c     |  1 +
>  mm/kasan/report.c         | 26 ++++----------------------
>  mm/kasan/tags.c           | 37 +++++++++++++++++++++++++++++++++++++
>  7 files changed, 78 insertions(+), 44 deletions(-)
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 8bc618289bb1..47b53912f322 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -51,7 +51,7 @@ depot_stack_handle_t kasan_save_stack(gfp_t flags)
>         return stack_depot_save(entries, nr_entries, flags);
>  }
>
> -static inline void set_track(struct kasan_track *track, gfp_t flags)
> +void kasan_set_track(struct kasan_track *track, gfp_t flags)
>  {
>         track->pid = current->pid;
>         track->stack = kasan_save_stack(flags);
> @@ -299,24 +299,6 @@ struct kasan_free_meta *get_free_info(struct kmem_cache *cache,
>         return (void *)object + cache->kasan_info.free_meta_offset;
>  }
>
> -
> -static void kasan_set_free_info(struct kmem_cache *cache,
> -               void *object, u8 tag)
> -{
> -       struct kasan_alloc_meta *alloc_meta;
> -       u8 idx = 0;
> -
> -       alloc_meta = get_alloc_info(cache, object);
> -
> -#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
> -       idx = alloc_meta->free_track_idx;
> -       alloc_meta->free_pointer_tag[idx] = tag;
> -       alloc_meta->free_track_idx = (idx + 1) % KASAN_NR_FREE_STACKS;
> -#endif
> -
> -       set_track(&alloc_meta->free_track[idx], GFP_NOWAIT);
> -}
> -
>  void kasan_poison_slab(struct page *page)
>  {
>         unsigned long i;
> @@ -492,7 +474,7 @@ static void *__kasan_kmalloc(struct kmem_cache *cache, const void *object,
>                 KASAN_KMALLOC_REDZONE);
>
>         if (cache->flags & SLAB_KASAN)
> -               set_track(&get_alloc_info(cache, object)->alloc_track, flags);
> +               kasan_set_track(&get_alloc_info(cache, object)->alloc_track, flags);
>
>         return set_tag(object, tag);
>  }
> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> index 8acf48882ba2..4b3cbad7431b 100644
> --- a/mm/kasan/generic.c
> +++ b/mm/kasan/generic.c
> @@ -346,3 +346,25 @@ void kasan_record_aux_stack(void *addr)
>         alloc_info->aux_stack[1] = alloc_info->aux_stack[0];
>         alloc_info->aux_stack[0] = kasan_save_stack(GFP_NOWAIT);
>  }
> +
> +void kasan_set_free_info(struct kmem_cache *cache,
> +                               void *object, u8 tag)
> +{
> +       struct kasan_free_meta *free_meta;
> +
> +       free_meta = get_free_info(cache, object);
> +       kasan_set_track(&free_meta->free_track, GFP_NOWAIT);
> +
> +       /*
> +        *  the object was freed and has free track set
> +        */
> +       *(u8 *)kasan_mem_to_shadow(object) = KASAN_KMALLOC_FREETRACK;
> +}
> +
> +struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
> +                               void *object, u8 tag)
> +{
> +       if (*(u8 *)kasan_mem_to_shadow(object) != KASAN_KMALLOC_FREETRACK)
> +               return NULL;
> +       return &get_free_info(cache, object)->free_track;
> +}
> diff --git a/mm/kasan/generic_report.c b/mm/kasan/generic_report.c
> index e200acb2d292..a38c7a9e192a 100644
> --- a/mm/kasan/generic_report.c
> +++ b/mm/kasan/generic_report.c
> @@ -80,6 +80,7 @@ static const char *get_shadow_bug_type(struct kasan_access_info *info)
>                 break;
>         case KASAN_FREE_PAGE:
>         case KASAN_KMALLOC_FREE:
> +       case KASAN_KMALLOC_FREETRACK:
>                 bug_type = "use-after-free";
>                 break;
>         case KASAN_ALLOCA_LEFT:
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index a7391bc83070..ef655a1c6e15 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -17,15 +17,17 @@
>  #define KASAN_PAGE_REDZONE      0xFE  /* redzone for kmalloc_large allocations */
>  #define KASAN_KMALLOC_REDZONE   0xFC  /* redzone inside slub object */
>  #define KASAN_KMALLOC_FREE      0xFB  /* object was freed (kmem_cache_free/kfree) */
> +#define KASAN_KMALLOC_FREETRACK 0xFA  /* object was freed and has free track set */
>  #else
>  #define KASAN_FREE_PAGE         KASAN_TAG_INVALID
>  #define KASAN_PAGE_REDZONE      KASAN_TAG_INVALID
>  #define KASAN_KMALLOC_REDZONE   KASAN_TAG_INVALID
>  #define KASAN_KMALLOC_FREE      KASAN_TAG_INVALID
> +#define KASAN_KMALLOC_FREETRACK KASAN_TAG_INVALID
>  #endif
>
> -#define KASAN_GLOBAL_REDZONE    0xFA  /* redzone for global variable */
> -#define KASAN_VMALLOC_INVALID   0xF9  /* unallocated space in vmapped page */
> +#define KASAN_GLOBAL_REDZONE    0xF9  /* redzone for global variable */
> +#define KASAN_VMALLOC_INVALID   0xF8  /* unallocated space in vmapped page */
>
>  /*
>   * Stack redzone shadow values
> @@ -127,6 +129,9 @@ struct kasan_free_meta {
>          * Otherwise it might be used for the allocator freelist.
>          */
>         struct qlist_node quarantine_link;
> +#ifdef CONFIG_KASAN_GENERIC
> +       struct kasan_track free_track;
> +#endif
>  };
>
>  struct kasan_alloc_meta *get_alloc_info(struct kmem_cache *cache,
> @@ -168,6 +173,10 @@ void kasan_report_invalid_free(void *object, unsigned long ip);
>  struct page *kasan_addr_to_page(const void *addr);
>
>  depot_stack_handle_t kasan_save_stack(gfp_t flags);
> +void kasan_set_track(struct kasan_track *track, gfp_t flags);
> +void kasan_set_free_info(struct kmem_cache *cache, void *object, u8 tag);
> +struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
> +                               void *object, u8 tag);
>
>  #if defined(CONFIG_KASAN_GENERIC) && \
>         (defined(CONFIG_SLAB) || defined(CONFIG_SLUB))
> diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
> index 978bc4a3eb51..4c5375810449 100644
> --- a/mm/kasan/quarantine.c
> +++ b/mm/kasan/quarantine.c
> @@ -145,6 +145,7 @@ static void qlink_free(struct qlist_node *qlink, struct kmem_cache *cache)
>         if (IS_ENABLED(CONFIG_SLAB))
>                 local_irq_save(flags);
>
> +       *(u8 *)kasan_mem_to_shadow(object) = KASAN_KMALLOC_FREE;
>         ___cache_free(cache, object, _THIS_IP_);
>
>         if (IS_ENABLED(CONFIG_SLAB))
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 2421a4bd9227..fed3c8fdfd25 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -164,26 +164,6 @@ static void describe_object_addr(struct kmem_cache *cache, void *object,
>                 (void *)(object_addr + cache->object_size));
>  }
>
> -static struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
> -               void *object, u8 tag)
> -{
> -       struct kasan_alloc_meta *alloc_meta;
> -       int i = 0;
> -
> -       alloc_meta = get_alloc_info(cache, object);
> -
> -#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
> -       for (i = 0; i < KASAN_NR_FREE_STACKS; i++) {
> -               if (alloc_meta->free_pointer_tag[i] == tag)
> -                       break;
> -       }
> -       if (i == KASAN_NR_FREE_STACKS)
> -               i = alloc_meta->free_track_idx;
> -#endif
> -
> -       return &alloc_meta->free_track[i];
> -}
> -
>  static void describe_object(struct kmem_cache *cache, void *object,
>                                 const void *addr, u8 tag)
>  {
> @@ -195,8 +175,10 @@ static void describe_object(struct kmem_cache *cache, void *object,
>                 print_track(&alloc_info->alloc_track, "Allocated");
>                 pr_err("\n");
>                 free_track = kasan_get_free_track(cache, object, tag);
> -               print_track(free_track, "Freed");
> -               pr_err("\n");
> +               if (free_track) {
> +                       print_track(free_track, "Freed");
> +                       pr_err("\n");
> +               }
>
>  #ifdef CONFIG_KASAN_GENERIC
>                 if (alloc_info->aux_stack[0]) {
> diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
> index 25b7734e7013..201dee5d6ae0 100644
> --- a/mm/kasan/tags.c
> +++ b/mm/kasan/tags.c
> @@ -162,3 +162,40 @@ void __hwasan_tag_memory(unsigned long addr, u8 tag, unsigned long size)
>         kasan_poison_shadow((void *)addr, size, tag);
>  }
>  EXPORT_SYMBOL(__hwasan_tag_memory);
> +
> +void kasan_set_free_info(struct kmem_cache *cache,
> +                               void *object, u8 tag)
> +{
> +       struct kasan_alloc_meta *alloc_meta;
> +       u8 idx = 0;
> +
> +       alloc_meta = get_alloc_info(cache, object);
> +
> +#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
> +       idx = alloc_meta->free_track_idx;
> +       alloc_meta->free_pointer_tag[idx] = tag;
> +       alloc_meta->free_track_idx = (idx + 1) % KASAN_NR_FREE_STACKS;
> +#endif
> +
> +       kasan_set_track(&alloc_meta->free_track[idx], GFP_NOWAIT);
> +}
> +
> +struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
> +                               void *object, u8 tag)
> +{
> +       struct kasan_alloc_meta *alloc_meta;
> +       int i = 0;
> +
> +       alloc_meta = get_alloc_info(cache, object);
> +
> +#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
> +       for (i = 0; i < KASAN_NR_FREE_STACKS; i++) {
> +               if (alloc_meta->free_pointer_tag[i] == tag)
> +                       break;
> +       }
> +       if (i == KASAN_NR_FREE_STACKS)
> +               i = alloc_meta->free_track_idx;
> +#endif
> +
> +       return &alloc_meta->free_track[i];
> +}
> --
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200522020127.23335-1-walter-zh.wu%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

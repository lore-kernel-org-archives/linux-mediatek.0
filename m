Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D9FC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 09:50:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58F072070B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 09:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WunTmbcZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="WpjHBPWX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58F072070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjPEO3bHAePZfP+XFsGOqSaMq++VIps41EpMljahoBg=; b=WunTmbcZMuXae9
	T30Y30DmYaOUVHur3dLb957DMdfKon5hAmpyEC25rSkm1m7KnMqVbeOqdq0teVKIRE/s0ELiujXm9
	R6U8XHRPpkGPIsymzQOeZil7F+JpToh97qp1y9k5G9bBJV8K0aHHaXDTpAsWIymI+utm4M7+wPa83
	j6J90D02M08tDpohHImdnPb8tp6X/srDhXkn6s3K5/uwhBmNWEyKWSBEaCFUUXC6I1Lv1YlE2OopD
	lOSdZjWqLTWoiLMoGUbCpEYnGeAEfFhpVzGTG8H+W6EpFCvqbfBMiDqVu0Rp8OzXfT73ojGUvvgI4
	dy/Putcmk1YyXNAgN8dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWGhS-0006lC-Em; Wed, 06 May 2020 09:50:46 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWGhK-0006dD-Ie
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 09:50:40 +0000
Received: by mail-qv1-xf41.google.com with SMTP id ck5so366527qvb.11
 for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2020 02:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j5iMU2d4N/4y18awBTt8gjljQLvXQSdia/Cv9QIxeQc=;
 b=WpjHBPWXGTysRpxifjir4tXVCuKqA1X+l/deTz186nKbtDUTwu3h5569FI40ufr7Y0
 jelE3jp7G8bz9axcn6AXPJXy6yfrpiDVcXv0zhsWqOhRjsO3WgmfH7ZCZnmkigqa4CSc
 q5bLcMsoWaA+5a+SMWP7taOFMyIwdHJvpRFbVP4FxIiipCJgab6ceIi695Dt4wA+u3yL
 GbRaFkMKtyllv59YmxI8lsW8o+eq1DZmYfTlIEYNwMT1+thAJ7nAoGws0qpEBQnuZFMb
 iJi5Q5bF59al+NHZaNPO/j/U3J1D8HIFH/czkNrVkDGUd8O1qc/wX+u/6bj+EjX1BhxR
 oB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j5iMU2d4N/4y18awBTt8gjljQLvXQSdia/Cv9QIxeQc=;
 b=JkaTTvvPsIRKURnLIdW2spKwPrGIIJbAnmaJB46sExiAD20d42AyfTkq2WQIkWwMRM
 sfAFR0erIHPsejusNNGWpFPYtNADHYxY9Q0AhrPanp5eRJygBAJwX2Uw2O9gvVUGFawh
 yLYVg7MR8AHvjBPVT4SeAI5zTsAk20sZC+ONFhq1dNYdUfq96bApdiu+KzB4Prc69FDa
 Co/cqnLHmzwe1vvNgFXRYE+5NnaQzpQcgt0YWa5IR+CKjGmpCRkAMFySdhvxIzr/pjwI
 1+QWNlaRE5shzQNH3ilCB17RVN//cBnpCI3mKCmHodbwwXEUsD1bgXQwS0ctTGCD4Nem
 Pb1w==
X-Gm-Message-State: AGi0PuZ2dO6TqJ5Eo9aSv+grjCN9ZdopaXoXiQhbbe3T289e7MQrkJOk
 W2+rU7i40pj9KNDQSgHS27uUnXix2cv0y3JLqg3AoA==
X-Google-Smtp-Source: APiQypJznpPYxdfEFeeA/QM+9LIu8pWPgSCbjVVq0Lf5+We9+p6YyIWg00C4LnkrqUZfh4/TEvzyLyHWExLaxty7q4s=
X-Received: by 2002:ad4:5a48:: with SMTP id ej8mr7241682qvb.122.1588758636814; 
 Wed, 06 May 2020 02:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200506052155.14515-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200506052155.14515-1-walter-zh.wu@mediatek.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 6 May 2020 11:50:25 +0200
Message-ID: <CACT4Y+ajKJpwNXd1V17bOT_ZShXm8h2eepxx_g4hAqk78SxCDA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kasan: record and print the free track
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_025038_642141_B0A8B4A1 
X-CRM114-Status: GOOD (  24.84  )
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 6, 2020 at 7:22 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> We add new KASAN_RCU_STACK_RECORD configuration option. It will move
> free track from slub meta-data (struct kasan_alloc_meta) into freed object.
> Because we hope this options doesn't enlarge slub meta-data size.
>
> This option doesn't enlarge struct kasan_alloc_meta size.
> - add two call_rcu() call stack into kasan_alloc_meta, size is 8 bytes.
> - remove free track from kasan_alloc_meta, size is 8 bytes.
>
> This option is only suitable for generic KASAN, because we move free track
> into the freed object, so free track is valid information only when it
> exists in quarantine. If the object is in-use state, then the KASAN report
> doesn't print call_rcu() free track information.
>
> [1]https://bugzilla.kernel.org/show_bug.cgi?id=198437
>
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> ---
>  mm/kasan/common.c | 10 +++++++++-
>  mm/kasan/report.c | 24 +++++++++++++++++++++---
>  2 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 32d422bdf127..13ec03e225a7 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -321,8 +321,15 @@ void kasan_record_callrcu(void *addr)
>                 /* record last call_rcu() call stack */
>                 alloc_info->rcu_free_stack[1] = save_stack(GFP_NOWAIT);
>  }
> -#endif
>
> +static void kasan_set_free_info(struct kmem_cache *cache,
> +               void *object, u8 tag)
> +{
> +       /* store free track into freed object */
> +       set_track((struct kasan_track *)(object + BYTES_PER_WORD), GFP_NOWAIT);
> +}
> +
> +#else
>  static void kasan_set_free_info(struct kmem_cache *cache,
>                 void *object, u8 tag)
>  {
> @@ -339,6 +346,7 @@ static void kasan_set_free_info(struct kmem_cache *cache,
>
>         set_track(&alloc_meta->free_track[idx], GFP_NOWAIT);
>  }
> +#endif
>
>  void kasan_poison_slab(struct page *page)
>  {
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 7aaccc70b65b..f2b0c6b9dffa 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -175,8 +175,23 @@ static void kasan_print_rcu_free_stack(struct kasan_alloc_meta *alloc_info)
>         print_track(&free_track, "Last call_rcu() call stack", true);
>         pr_err("\n");
>  }
> -#endif
>
> +static struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
> +               void *object, u8 tag, const void *addr)
> +{
> +       u8 *shadow_addr = (u8 *)kasan_mem_to_shadow(addr);
> +
> +       /*
> +        * Only the freed object can get free track,
> +        * because free track information is stored to freed object.
> +        */
> +       if (*shadow_addr == KASAN_KMALLOC_FREE)
> +               return (struct kasan_track *)(object + BYTES_PER_WORD);

Humm... the other patch defines BYTES_PER_WORD as 4... I would assume
seeing 8 (or sizeof(long)) here. Why 4?
Have you tested all 4 modes (RCU/no-RCU x SLAB/SLUB)? As far as I
remember one of the allocators stored something in the object.

Also, does this work with objects with ctors and slabs destroyed by
rcu? kasan_track may smash other things in these cases.
Have you looked at the KASAN implementation when free_track was
removed? That may have useful details :)


> +       else
> +               return NULL;
> +}
> +
> +#else
>  static struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
>                 void *object, u8 tag, const void *addr)
>  {
> @@ -196,6 +211,7 @@ static struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
>
>         return &alloc_meta->free_track[i];
>  }
> +#endif
>
>  static void describe_object(struct kmem_cache *cache, void *object,
>                                 const void *addr, u8 tag)
> @@ -208,8 +224,10 @@ static void describe_object(struct kmem_cache *cache, void *object,
>                 print_track(&alloc_info->alloc_track, "Allocated", false);
>                 pr_err("\n");
>                 free_track = kasan_get_free_track(cache, object, tag, addr);
> -               print_track(free_track, "Freed", false);
> -               pr_err("\n");
> +               if (free_track) {
> +                       print_track(free_track, "Freed", false);
> +                       pr_err("\n");
> +               }
>  #ifdef CONFIG_KASAN_RCU_STACK_RECORD
>                 kasan_print_rcu_free_stack(alloc_info);
>  #endif
> --
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200506052155.14515-1-walter-zh.wu%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5486DC4708E
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 02:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHeFWn8psj8u8cGp1SABE4QnAQdoZWb4E9tsvr9oCvk=; b=GgI7m3cuchlDWoXtqQMBuWl1Wq
	y31/cr9Ut1OKXuBcAeay6TLAySBeursi2ukUp5CmxMtRvwc6TVYrDznn9EzbRJwmmf+g3dY+2aSvt
	BYAj52yVnZ7gGN38lzzAGzKliKsAhr59T9RQJeRzleW2fcSA3yh3UQ1yPtn6EwMGm0s72WwjXddZ1
	bpRPCTFBUlPVh4h0o75tpqFGDQIcIIPl5JL+AhqNMS5YZEvzwcApW5u3xQjdDvMXHiN6ZXI8G93lV
	2aiPS7N0BDYhO/Ve2xC/pMpkvVdjHw54XxbbGrg1Te9x71YbgLTIEw+/QmkG6fP0Y0H0NmZ7sE2ds
	r73SefQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCt6z-006IHX-RL; Wed, 04 Jan 2023 02:02:38 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCt5X-006Hzv-8w; Wed, 04 Jan 2023 02:01:09 +0000
Received: by mail-pj1-x102d.google.com with SMTP id a11-20020a17090a740b00b00223f7eba2c4so5192426pjg.5;
        Tue, 03 Jan 2023 18:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hHeFWn8psj8u8cGp1SABE4QnAQdoZWb4E9tsvr9oCvk=;
        b=dIntYs8Vf4z/54w86VjYfR8QSrf959Il8mXbiEes8eVzuXfpOrY99hD9Ws5Diw5VwO
         V0SzFWJI9wBDkn2eynnJ2czga+dwdBwdgkhdNlE73DqxIBjzn/Mtl2JnRp4hxcV5eQdE
         MdbOPFV+pg2nfORgvucmgCQ3xFIS8SRdbzHhc3O687/EHdUrEyIA4z2W/mfNK/KcUhUt
         bmDhqo0DefNVGKtkJVd09K3bhjLN2dV31/SibDgzkFZohPuRBEl0WQ06frEwB+XuQPqw
         r9THHuktVvRdSaB3+gyJLh8hIHoUbpbJn4aHdar/Aov1ZwcW6vNg+XIihS3ps4F+umpZ
         1zUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHeFWn8psj8u8cGp1SABE4QnAQdoZWb4E9tsvr9oCvk=;
        b=U7NKthPkfaPT1eneuZ/sKnm6SZXZIb/O4X5VvI1loHl4uQFOHUEpdSKJiD4NRvdC1o
         i/BjJwUlJEKR/ejDOMDKIeSUA+sbndzErT57VMpSK7RS+7+tZAUR63ScW4/7kZAvI0IT
         BK5wo3EDSpf2RR9298948RaPgFtD+UrMOJgWODBR9u0II/68+S52dtYXtx2z94hA+aBt
         v5J2LPqJ/FbAgMpEcRjbHH8ZIi2aSpq5tan4HnQ6ZisuOgSAboCKoPp0WUpxzwqd6HxS
         9JYo/ItFnTawHOkUZHA74hXKXdl7KQgMwpjsGGBqeMbkn2QYxe/eeWcMUZ6vCks4/CDK
         0zkw==
X-Gm-Message-State: AFqh2kpJAitCPS7TRpHodedvM+ujGnkKLsqDhIi0ZW5hT7/z6X01mKPB
	nYgyt55Ej8QeXA0kb8ifE7FAhEGdN7w32WSxMHI=
X-Google-Smtp-Source: AMrXdXvPnPHlt5A1dFrqgtpDhVrKF7vmu2xsFbu9mcs9JiohmPnLDZXYOyZJdIqGkvnD1Xw31jEejLRYjG3pjpTLPjw=
X-Received: by 2002:a17:903:3287:b0:189:8d8b:9db7 with SMTP id
 jh7-20020a170903328700b001898d8b9db7mr3112912plb.150.1672797660693; Tue, 03
 Jan 2023 18:01:00 -0800 (PST)
MIME-Version: 1.0
References: <20230103075603.12294-1-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20230103075603.12294-1-Kuan-Ying.Lee@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 4 Jan 2023 03:00:49 +0100
Message-ID: <CA+fCnZdk0HoWx6XCbTsiNhyR2Z_7zv5JUdgNs8Q_tV4GRkkmCg@mail.gmail.com>
Subject: Re: [PATCH] kasan: infer the requested size by scanning shadow memory
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	chinwen.chang@mediatek.com, qun-wei.lin@mediatek.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_180107_475451_F4BAE385 
X-CRM114-Status: GOOD (  21.70  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 3, 2023 at 8:56 AM Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
>
> We scan the shadow memory to infer the requested size instead of
> printing cache->object_size directly.
>
> This patch will fix the confusing generic kasan report like below. [1]
> Report shows "cache kmalloc-192 of size 192", but user
> actually kmalloc(184).
>
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in _find_next_bit+0x143/0x160 lib/find_bit.c:109
> Read of size 8 at addr ffff8880175766b8 by task kworker/1:1/26
> ...
> The buggy address belongs to the object at ffff888017576600
>  which belongs to the cache kmalloc-192 of size 192
> The buggy address is located 184 bytes inside of
>  192-byte region [ffff888017576600, ffff8880175766c0)
> ...
> Memory state around the buggy address:
>  ffff888017576580: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>  ffff888017576600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >ffff888017576680: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
>                                         ^
>  ffff888017576700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff888017576780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ==================================================================
>
> After this patch, report will show "cache kmalloc-192 of size 184".

I think this introduces more confusion. kmalloc-192 cache doesn't have
the size of 184.

Let's leave the first two lines as is, and instead change the second
two lines to:

The buggy address is located 0 bytes to the right of
 requested 184-byte region [ffff888017576600, ffff8880175766c0)

This specifically points out an out-of-bounds access.

Note the added "requested". Alternatively, we could say "allocated".

> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -340,8 +340,13 @@ static inline void kasan_print_address_stack_frame(const void *addr) { }
>
>  #ifdef CONFIG_KASAN_GENERIC
>  void kasan_print_aux_stacks(struct kmem_cache *cache, const void *object);
> +int kasan_get_alloc_size(void *object_addr, struct kmem_cache *cache);
>  #else
>  static inline void kasan_print_aux_stacks(struct kmem_cache *cache, const void *object) { }
> +static inline int kasan_get_alloc_size(void *object_addr, struct kmem_cache *cache)
> +{
> +       return cache->object_size;

Please implement similar shadow/tag walking for the tag-based modes.
Even though we can only deduce the requested size with the granularity
of 16 bytes, it still makes sense.

It makes sense to also use the word "allocated" instead of "requested"
for these modes, as the size is not deduced precisely.

> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -236,12 +236,13 @@ static void describe_object_addr(const void *addr, struct kmem_cache *cache,
>  {
>         unsigned long access_addr = (unsigned long)addr;
>         unsigned long object_addr = (unsigned long)object;
> +       int real_size = kasan_get_alloc_size((void *)object_addr, cache);

Please add another field to the mode-specific section of the
kasan_report_info structure, fill it in complete_report_info, and use
it here. See kasan_find_first_bad_addr as a reference.

Thanks for working on this!


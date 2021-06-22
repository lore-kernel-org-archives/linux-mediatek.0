Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028C7C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 13:55:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4E6461289
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 13:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4E6461289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Urz+JiIOg3dnIykPoJH0o9punp0sg5G8lYc48/hGAy8=; b=iHCTM+Kh6MvV1G
	RnxyP88nC8FMIt+iM0dl0f6lN4KuvqayZDKRvfNYixaeVF5/Va3f1+NqPYba6xO1mWTCKM38WY6ch
	NjFmECNwaMXO7nOcjODoWTdoEh7GdpGjDPZN3XefkblEmn2xMZxoa9UVDzdtFmCtLDfAUrJfp0MUT
	Achh2QpdkZwRRfHJBhY6V3qGanCR27Y1v606fyCEoPj4r2KSTEFTuA21ME/oy+cgNrE9C/ZnItdEp
	V7p116BuhZTRlou+1YNfMvSuYmKN/fvF5wc+O8IrlZkj0AacawU0NGNQZe+ToZhw2S9Yn4wfLlL6U
	smGpuTOUxI1ywRilqAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvgru-007NGb-In; Tue, 22 Jun 2021 13:55:10 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvgrg-007NBf-89; Tue, 22 Jun 2021 13:54:57 +0000
Received: by mail-ed1-x52d.google.com with SMTP id t3so23782364edc.7;
 Tue, 22 Jun 2021 06:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P7b5G3A0+58gTpXa0/n5lleUJqlnrASAuqzNx+IB8OE=;
 b=Do7Q+4WVU0WjOoWN7dbhO+1BES2mXGeaLQiaGBDhR9Gm3cUN3Fjg6WG7we7cfzgJuR
 fORpsoTEVuyHROhZnXXzltRfHNofIorWoBTq/5nqwHnfJ/rqMgiVfvIvpDRWIxawoPRT
 x+YF0vcRsSvdf4dWRJbLozaa/4mBIr7qyl2RH1RMtFcMCi0qnhwrlbg1uRynBNt7Ee4m
 uFP1fCjD4whgY4sS+yS1Hf1jeVRvB3lO1A0qeJuVvuxNELRTFU6Ijv00UBtCyeisD87O
 5ZlE5BuSMN14eZOQ1A99vPtzBR54G3ro7W59NMoei/GHo+Qv8+V2Cq83g2ei20nPUHKn
 bRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P7b5G3A0+58gTpXa0/n5lleUJqlnrASAuqzNx+IB8OE=;
 b=JHWo+wkPEJH9X8H95Rff1e63jd9dayuNlwjY3NAzSNBqRQtbeo8jGz/QwXLRuYCPYe
 3+1eNDUJULdcTkrDtgC8e2JxeCVbfOxs4YunlDqMFjKM3pwK5ioX3Fp+/9JdLjEHCxOb
 AFpAyaPe7t8LE1Xn15CD2byTaRl2nHYEhhEAnAbHqiaBY/9PPU2DkHao85+lnKKVkcQ+
 bahHgTYQ6JT386HKBdawKxMY0fUuUouGtz0nJGzpOSqP+H7NUVNKpRdv3F+fY7PPCkiK
 TciQk1o6jvsFs8NuZrs2Lo7KoXg6AQYHRdg0awU7SeiErbolVIQoETTPiurquPEGWvHn
 bB2A==
X-Gm-Message-State: AOAM5306ijrqJoDu+Rm52Lh8EtuSQAmLB1L7mk+tp0XAgG9j8elrId3N
 uBgxakTUKmrHj+A2wCUXUCOYYIOdyPxqyYOzGJzGqmgVS28=
X-Google-Smtp-Source: ABdhPJwW6EaB1bmA1xujcy7BGJIRwEuHmi2zdTinLMNFFthY6zB2HCEAPGIQHaohEk1ZUfALmzQ7FTNoQaVgHf/h6k4=
X-Received: by 2002:a05:6402:1014:: with SMTP id
 c20mr5097086edu.70.1624370094862; 
 Tue, 22 Jun 2021 06:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
 <20210620114756.31304-3-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210620114756.31304-3-Kuan-Ying.Lee@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 22 Jun 2021 16:54:34 +0300
Message-ID: <CA+fCnZdGQ-_USQ_dCkmp+=MGS01yRtn1eLpGRLvbq=j-SQDrog@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kasan: integrate the common part of two KASAN
 tag-based modes
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, 
 chinwen.chang@mediatek.com, nicholas.tang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_065456_338508_8F14DCB4 
X-CRM114-Status: GOOD (  19.82  )
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

On Sun, Jun 20, 2021 at 2:48 PM Kuan-Ying Lee
<Kuan-Ying.Lee@mediatek.com> wrote:
>
> 1. Move kasan_get_free_track() and kasan_set_free_info()
>    into tags.c

Please mention that the patch doesn't only move but also combines
these functions for SW_TAGS and HW_TAGS modes.

> --- /dev/null
> +++ b/mm/kasan/report_tags.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
> + * Copyright (c) 2020 Google, Inc.
> + */
> +#ifndef __MM_KASAN_REPORT_TAGS_H
> +#define __MM_KASAN_REPORT_TAGS_H
> +
> +#include "kasan.h"
> +#include "../slab.h"
> +
> +const char *kasan_get_bug_type(struct kasan_access_info *info)

As mentioned by Alex, don't put this implementation into a header. Put
it into report_tags.c. The declaration is already in kasan.h.


> +{
> +#ifdef CONFIG_KASAN_TAGS_IDENTIFY
> +       struct kasan_alloc_meta *alloc_meta;
> +       struct kmem_cache *cache;
> +       struct page *page;
> +       const void *addr;
> +       void *object;
> +       u8 tag;
> +       int i;
> +
> +       tag = get_tag(info->access_addr);
> +       addr = kasan_reset_tag(info->access_addr);
> +       page = kasan_addr_to_page(addr);
> +       if (page && PageSlab(page)) {
> +               cache = page->slab_cache;
> +               object = nearest_obj(cache, page, (void *)addr);
> +               alloc_meta = kasan_get_alloc_meta(cache, object);
> +
> +               if (alloc_meta) {
> +                       for (i = 0; i < KASAN_NR_FREE_STACKS; i++) {
> +                               if (alloc_meta->free_pointer_tag[i] == tag)
> +                                       return "use-after-free";
> +                       }
> +               }
> +               return "out-of-bounds";
> +       }
> +#endif
> +
> +       /*
> +        * If access_size is a negative number, then it has reason to be
> +        * defined as out-of-bounds bug type.
> +        *
> +        * Casting negative numbers to size_t would indeed turn up as
> +        * a large size_t and its value will be larger than ULONG_MAX/2,
> +        * so that this can qualify as out-of-bounds.
> +        */
> +       if (info->access_addr + info->access_size < info->access_addr)
> +               return "out-of-bounds";
> +
> +       return "invalid-access";
> +}

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

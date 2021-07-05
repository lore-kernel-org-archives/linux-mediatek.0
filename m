Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80E7C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 11:13:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B62E9613AB
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 11:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B62E9613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5VN0GKUOsN4bLdL0Af2yyRGhzTU8sBuZVw/6uhzgrk=; b=Swcnu8Y1rTpBCG
	rsrySsv1CVEbuOUIdBc5lSZWtZByxWApZXvvHONOH+dPlvbhgolbmnZrFEwU40FCvZuLgNAohOeJK
	UWgIppcQeiA6q7JKgVJPgEvXZi+iIgThzdnQnhY2r2P1cbUNfHvIuuwVNhMcK+iDTOBJ3IA5l/vwj
	mZBqEjSNWrvGYZxeSKDHXteamdLi8fJ8+zvLYCDNJtGHcuoj7BljubMxu2BdkJhudbrS5lNfjQe0v
	0P0hM7QmVKeKVMbGvcFweuNPYVBxpaSCDrN0tFAaMmjYFzpPPDW+NNZGja2mOxPkzStCmpezQgshG
	r26cl3E5HBO33CD7GQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0MX7-008i6I-6d; Mon, 05 Jul 2021 11:13:01 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0MWp-008i0j-4z; Mon, 05 Jul 2021 11:12:44 +0000
Received: by mail-ed1-x52b.google.com with SMTP id t3so23199835edt.12;
 Mon, 05 Jul 2021 04:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CaX0flpcWSf1BxIX9YKTaXTNjn37cg6419yg5j4auho=;
 b=jEnaley92nsYz6JbSlRThV2E1YRPY06sNCdtkau2fgB2TykXtcwbJCOtCezAV/vc8w
 4hDhe7kUwItFuUTLiiagNALF9ddj3LvI9kkEuJ9R92C/whZQ3vkZkwX1vCXIm8Ku1qzp
 z78re286Qlfn/qoPoSuG6qaVge0tBY4ZHgiys64KOnqifOQt6boJwkcYJgyBEhRGQYp4
 7o+/a95mXCP6Lwx41+T6LEZqahRtOluMr+qhtfwZLUiiBnUsCxsvQ/qj4BW0MsdnTych
 3Nm/eSxg8yMU1KdU9GSuJma36mm9SRV7maxOFBYk2RMuFpGkaJzQSv4aIRUBJXK2jp6M
 8c/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CaX0flpcWSf1BxIX9YKTaXTNjn37cg6419yg5j4auho=;
 b=KTWLeUicNx0CpslCJOaSP7UcQxgu1ZmGGzXCK9hxD08+heap3Or2zCjX1k7GK+/fWx
 qGOpjZfpns+N4tjKFhfyCE6/yhoRpMuYbvwdJo7QXC+aXFfcYp7cwIDeWtAfaPOalnx8
 vjpAVt8H+jvLkOnNR2yy6JbYYPIq8IL0PCvqXRDgBfHsZ3XI4eryK2w/cd6QwzpQc7Qm
 JuPyLH9eBTYoRQKlEd9g6qMVBGQIkrdfqAm3wuwqQXBamqiae2oJLtm6XZwcaRil3/D+
 MBEPGz3vlQrKV93C9WOFoUMCnrb9W/Lho1MAfgYiE2Clfsjp9l32orTXrz/Nx/N/KOPd
 n9ug==
X-Gm-Message-State: AOAM532Umqn3TNAtBZd4uJicQNa9Xprn6hRBymMNjfQ5nYj+KGSkTtok
 fxGr1VD4WFyQ4D+vQAHJpB2gKJtZI8YHmrNBkxg=
X-Google-Smtp-Source: ABdhPJy1aBflyEaVGfXBsnIY/o25eWlDAwK3mLAMTUP6Iud2PfckMEFvKMrhc6r3H3jzgXvU/DLBkOCb9vEH/JghMVM=
X-Received: by 2002:a05:6402:5c9:: with SMTP id
 n9mr3075816edx.30.1625483561668; 
 Mon, 05 Jul 2021 04:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210705103229.8505-1-yee.lee@mediatek.com>
 <20210705103229.8505-3-yee.lee@mediatek.com>
In-Reply-To: <20210705103229.8505-3-yee.lee@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 5 Jul 2021 13:12:30 +0200
Message-ID: <CA+fCnZdhrjo4RMBcj94MO7Huf_BVzaF5S_E97xS1vXGHoQdu5A@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] kasan: Add memzero int for unaligned size at DEBUG
To: yee.lee@mediatek.com
Cc: LKML <linux-kernel@vger.kernel.org>, nicholas.Tang@mediatek.com, 
 Kuan-Ying Lee <Kuan-Ying.lee@mediatek.com>, chinwen.chang@mediatek.com, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:KASAN" <kasan-dev@googlegroups.com>, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_041243_237116_CADEF5F3 
X-CRM114-Status: GOOD (  21.87  )
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

On Mon, Jul 5, 2021 at 12:33 PM <yee.lee@mediatek.com> wrote:
>
> From: Yee Lee <yee.lee@mediatek.com>
>
> Issue: when SLUB debug is on, hwtag kasan_unpoison() would overwrite
> the redzone of object with unaligned size.
>
> An additional memzero_explicit() path is added to replacing init by
> hwtag instruction for those unaligned size at SLUB debug mode.
>
> The penalty is acceptable since they are only enabled in debug mode,
> not production builds. A block of comment is added for explanation.
>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Marco Elver <elver@google.com>
> Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> ---
>  mm/kasan/kasan.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 98e3059bfea4..d739cdd1621a 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -9,6 +9,7 @@
>  #ifdef CONFIG_KASAN_HW_TAGS
>
>  #include <linux/static_key.h>
> +#include "../slab.h"
>
>  DECLARE_STATIC_KEY_FALSE(kasan_flag_stacktrace);
>  extern bool kasan_flag_async __ro_after_init;
> @@ -387,6 +388,17 @@ static inline void kasan_unpoison(const void *addr, size_t size, bool init)
>
>         if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
>                 return;
> +       /*
> +        * Explicitly initialize the memory with the precise object size to
> +        * avoid overwriting the SLAB redzone. This disables initialization in
> +        * the arch code and may thus lead to performance penalty. The penalty
> +        * is accepted since SLAB redzones aren't enabled in production builds.
> +        */
> +       if (__slub_debug_enabled() &&

What happened to slub_debug_enabled_unlikely()? Was it renamed? Why? I
didn't receive patch #1 of v6 (nor of v5).

> +           init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
> +               init = false;
> +               memzero_explicit((void *)addr, size);
> +       }
>         size = round_up(size, KASAN_GRANULE_SIZE);
>
>         hw_set_mem_tag_range((void *)addr, size, tag, init);
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

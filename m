Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF14C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 10:46:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42BF16145D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 10:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42BF16145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKLlkN/pafXh/QSG3qPZiqziE/RVKQXOCXLYlE5ZFeA=; b=aA5LOfXLOkiK7s
	Zah99gPmbyQbIpR7dv5LZ1MiNtXKhW9JPHd+MnGJ1cUCxjwkGnZZEb/rXFiux19A/M3LosJ4XqGjF
	oDjIcrdPsg/Ztq0AvyB1YdviMd44JlPytwUOn3eA2b3dfx1JrRcikjAlbdNDm7YKgDXyA2jbmPzcT
	9UnLjrpCIAEEKDVxYl4zaYCOgUt56mYSJj8Jk5mVHlJsT19kUiDkL/7/TxzRf3KWjZZcX/7oZgROH
	IxKskG4ZMVxttSHFoqCNaEqxDtHLR11Ju1b7h0dmb4n8pfBlZgZ4v5DoFfUcZ21mkD7g/PhKXybM8
	AKN/1sSZxk7IE1MvEpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0M6z-008cv2-AB; Mon, 05 Jul 2021 10:46:01 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0M6O-008cm8-7p
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 10:45:25 +0000
Received: by mail-ot1-x32b.google.com with SMTP id
 o13-20020a9d404d0000b0290466630039caso17908654oti.6
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Jul 2021 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/dlGtZu9Ej/xN5Tsuqsmc/vVOMpJLibVcfVItFdDo7U=;
 b=rzSYkZK4ThrPA7smzcFNs/5Jpclbny/wcmfSQ8ORkq914C2DoGl0LnnmVaVBf+GSTU
 cLg454r3cKsTz8r0/LI3A8jiqvat498AEPySwnwQDrkBQB2Z8MPavannymAkadlwCbfx
 Csku08DMBzkEafDnNel69M7EN0kR7nB9LMem4pcRtUUH+kql+y8bf8n0b2GFWDknwps6
 //spGXvECrbO40sSisf4xvjw2KfLYVu2/TIhODA91ZPkGbr3BWPAY+C8hUppoPo728RU
 VKby50aiKF843yEXxbKAGEFYcuw8/4FVbXCC7lfE5ubVb87wKWwmyU5A+9xmy94ciW/Z
 fe0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/dlGtZu9Ej/xN5Tsuqsmc/vVOMpJLibVcfVItFdDo7U=;
 b=OO1/H3OxDa38NkIEeimvnbOp8G2ugh18Lk2EBe93FeP2HVVaVsRoN++oE2qRcFw/fB
 oECqMg921A9yOsJEs8zFv7YRFuJRzkCyukyuSvABcNjKbAuZlcnpOXOfz/1lLdry1BQW
 1YGYA08s9bUC3eTGwXw8PhmZh0xLPzy0/CtOiwSYnMl5zZPLeCeGtZbBFy7KBAoCdeuk
 1w3rQjj4lk0y4/7VWE8z8RhvLSBPt4D0i2GoTqKo+7ibl/tWc+v/Rh5zXsR6c1raepOB
 C5Px96jfwxQW/fPzcgfNfRxsN9ecDg0TjdPOWhSqI3PiD10A1aOLmFKga6Dw1U4r1c+q
 LKaQ==
X-Gm-Message-State: AOAM531JM820/mjaKZbwFOe5RZqyY66TBeGCsZsPXiyESf8E1mFeEdzy
 mRYmtYx2vXHk9ypcXQ+OjWrbAdPym1Rq4zHaemLabg==
X-Google-Smtp-Source: ABdhPJz7Ojrr+OaKK7eh0H330aLKUBIAQgR26pV3/KDO8TkXS7oJOSMJQ2lq5muUp+LwEhxnKBOuBoP/AfYymTXkTok=
X-Received: by 2002:a9d:d04:: with SMTP id 4mr10779395oti.251.1625481922714;
 Mon, 05 Jul 2021 03:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210705103229.8505-1-yee.lee@mediatek.com>
 <20210705103229.8505-3-yee.lee@mediatek.com>
In-Reply-To: <20210705103229.8505-3-yee.lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Mon, 5 Jul 2021 12:45:11 +0200
Message-ID: <CANpmjNMg7DwVJL10AesxTsiz_9UEuwZkAxdGrQdsmxOR4qiHXQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] kasan: Add memzero int for unaligned size at DEBUG
To: yee.lee@mediatek.com
Cc: linux-kernel@vger.kernel.org, nicholas.tang@mediatek.com, 
 Kuan-Ying.Lee@mediatek.com, chinwen.chang@mediatek.com, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Andrey Konovalov <andreyknvl@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:KASAN" <kasan-dev@googlegroups.com>, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_034524_348989_95DCAFF5 
X-CRM114-Status: GOOD (  21.30  )
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

On Mon, 5 Jul 2021 at 12:33, <yee.lee@mediatek.com> wrote:
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

Reviewed-by: Marco Elver <elver@google.com>

Thank you!

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
> +           init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
> +               init = false;
> +               memzero_explicit((void *)addr, size);
> +       }
>         size = round_up(size, KASAN_GRANULE_SIZE);
>
>         hw_set_mem_tag_range((void *)addr, size, tag, init);
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

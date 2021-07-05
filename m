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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC72DC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 11:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88F68613D8
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 11:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88F68613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2WxF7w/nfgZMmZmB/9LGqhO3pt1eMKmJdhf3kmNpUA=; b=yy/xsDQvz0LWI3
	iC0IinDv+Gz39oJIJMoK+Rldv3w4AP3VGUgZbZwBjvmrwUdvhudgGiqBB0QsCeD6tVLLlVwsplrvY
	wJvjhbwDDgOM91KcQo7qQEKq5KC3PvJcg7+IqagQMSRo+eS1YsjTmCPVEn5o8Z5Xk8WeV5maoDxf3
	aEL21gqHIQkqWoXwTPwwqvJ8mJi9ef7fohxosFWQ28bk9p7bxo+gi8WGmJqpQqiYoDkYnVvypFi4R
	5ADPDSfDKLTqFc9/vcVIhqSbWrHhJzt/9bCNbcaOFn9auNbbkDNX31W71bp+Igonx/m9X8WVzVZ+I
	K+ximGg/G9bRPcGoNt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Mho-008kMw-Qg; Mon, 05 Jul 2021 11:24:04 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0MhV-008kH9-Qb; Mon, 05 Jul 2021 11:23:47 +0000
Received: by mail-ed1-x52f.google.com with SMTP id x12so23255989eds.5;
 Mon, 05 Jul 2021 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/twNUpcgioeZ8e0ihy4OvgQsOjAP9TO2paDyac3Qkg=;
 b=YM1PR4H9+B8L8UwdtxpjutwB0rqH38R2O5DOrey1dK4UErgqysTvI+jj6ATz2yvQWG
 hPXFPXCn4AxF4al8wuVWBHAWFU7Zamp+OpUBbIdBbO9vryr5tC6J3hYvjIK4M5xkTxyw
 A6kPbU9iiglpyYbCk5dZ4DYIAov+znHDcB5iFbZO/U7EftfericcwXSaBDEw8t31BjCB
 FncrlAL3zbRDQr3iMPIlPGF1PLZFfHZO+mEOgJputwH/D57Np0JF5OI1UQ/+JiypcY6R
 rbNYFR9vSubxKeS0TvansMdId29zqxKXA6SrrOpfk7BzauMC51wndZlwa25vNNa8vSvn
 jAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/twNUpcgioeZ8e0ihy4OvgQsOjAP9TO2paDyac3Qkg=;
 b=A6dYpbglpZT8mhluF0ZG0EAajZd0RRjVPNKExZKmi1DwgMow+81v6mRU7zNixC9gLL
 ll3aVL2TDaoCWN2tJLhfFgxQEvePEikMy/5Iq3ArAieV6ib+ltjJRKQII/8/reHxHpUj
 wnXHuWvEim0DtcPEILyXR93XFhDCpj3PEvEcKlWaQCzosN1UP4WQ1KMxM5UNvZWVuHgc
 +nb8v/tIcxeIhaqHb4qUDZ6XM0P6KcJCG9e4P9k2GJw2mAekloxk43xrKckmaTJLDOMn
 tkpqu4KJ5ivJ5TK7ErmFmsDiPOyPPXm/4QW0sjHQXsYf2TYuosgGHAyTBTTHQLfgx4iL
 X3xA==
X-Gm-Message-State: AOAM530D2xRNgti5TBwGwftny6D8zR0esrOOdm4cgOBab/6G77fUlIHZ
 0bkmfG6QeqoM90UsBwtcHhbjyafyU6mN/C7n6os=
X-Google-Smtp-Source: ABdhPJxpa2IOlQc2LEHppS6wdYTu08dyDoHQP1v4Cdpbx6OBtbIxpdca+P2eecENgraXfPvnlr+f9YlLyHcZWvqk2Eo=
X-Received: by 2002:a50:fb96:: with SMTP id e22mr8621005edq.95.1625484224390; 
 Mon, 05 Jul 2021 04:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210705103229.8505-1-yee.lee@mediatek.com>
 <20210705103229.8505-3-yee.lee@mediatek.com>
In-Reply-To: <20210705103229.8505-3-yee.lee@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 5 Jul 2021 13:23:33 +0200
Message-ID: <CA+fCnZfr3vU3ZwGQk06JFRURDgP7qHF6RaUpJtu5V+w6ToAb8w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210705_042345_912544_585100C8 
X-CRM114-Status: GOOD (  21.82  )
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

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

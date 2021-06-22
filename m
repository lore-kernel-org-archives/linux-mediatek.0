Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943F9C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 14:04:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5359860FF4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 14:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5359860FF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13OYccHKTLn1Vde21xKVHdWlpcpCtC5bSrbJhruNnw4=; b=MnyGSUAZurUK7I
	b/1bUQNR7dMbqIroonnuOrVy1cMgW782Qq6/f6mxrWIRCRUIcDnpXFTPDYsOVIIWMER4z0IsnwGZU
	ANAlfVmNZ3QcQ0EuZ87FdSnA4jIwjKvyl6m1kFSm/9uAyM6Vq8OFGz5xtZMcV1ahbErl8pMDlxAQE
	mutVloMZsRI3r+PT/W4knb/GzfMwY7So8dSs6NZLsg/DKIGfhmGYuZdgXd87pddLPDzvwM6YioQEB
	44Q0icwqNI5CZdXO0A+t3KQRzldfPbXsvl0xrjl0mTYl9ptGuejaraLUft7ZLOFogG8rVnL2wjjBV
	eNk3epu57pleKRGpvUVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvh0m-007PzG-7y; Tue, 22 Jun 2021 14:04:20 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvh0X-007Pvr-3x; Tue, 22 Jun 2021 14:04:06 +0000
Received: by mail-ed1-x529.google.com with SMTP id i5so6398956eds.1;
 Tue, 22 Jun 2021 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iPbarU+l9m1KwGWUNyzhJZ595uUBAZXAe0wQ6HeHGxQ=;
 b=fZ5quJ/GoR3vzQSaVgMyRterjrZrpqo9hDF73so2ArtYbScuKnpfg7SJpZLlOeJRP3
 gHIrQh6r2s7lxRe0jZfBM3LGiife/yusjkB2dfeDAKLJDltmFw71IvK22ZM2yulR8Gqt
 lUbJlqPikmDnu9MU6YfZERpi/kGM8dteQcDU4iAYgqoxjNX4cNxG8I0Z9GkAt4LvZnRT
 1bdwtlbpmVBitmLQKdNwsM9mNUJ9uQf5FTai6gabf9yOPNikyYwD+FpS62jc9QvPwLbA
 smcPdUZucZZvzUBhYSMb27+LXgIv+ehd09ATJAp5W2ztoZDoWKXMu8WjiHQ1s3W7OOQu
 /WAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iPbarU+l9m1KwGWUNyzhJZ595uUBAZXAe0wQ6HeHGxQ=;
 b=QQAF5CNVfdwR57HP/Wk4u8N/uER4ZwlsGUvnVD1HExFPfs4nxZH6B4j0ycTMpYWqE0
 i9WbYRxVrta6UkBsMwfvu+Wszozz/we8YVSK0WdGBNZ3AisdK6QA+vOh6ghB9Z5pEo5v
 C4ROiczPbWTX2t5KJxbYMAqlPVruAcMuoH5OY5UG9sneKnq6WZgyG6iLaUxMOcAAvQC4
 2xYLeVeAKHbAr5eIdS7OFoBmrSiv8J2tOkP3L9UwmiflHqTmvus7+/bUO6amEl3i+JIh
 QjvI2ju9pTgH657mEspqNuY1etqFh8Tim3QQAY8AiWq+rAmnN1ZAynRnJ+T4BR+cj8XW
 UryQ==
X-Gm-Message-State: AOAM531iCDaH0jTHa+brm4BA+lRGNeyQzOe1br13LB+ZSymVcgeTEUCa
 Z5ahhMleSWHz6azrgWm8iAksEGllApWoOtZn2OI=
X-Google-Smtp-Source: ABdhPJyy8TmTF93FpLorqiyKQWA81gkRh7uJHO1hw4kf4OWfe0s6Kp5ze7cRnhKGAvUyoA9bAQOE4/Bt8SXdzX+GsFI=
X-Received: by 2002:a50:fd83:: with SMTP id o3mr5199829edt.95.1624370642532;
 Tue, 22 Jun 2021 07:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210621154442.18463-1-yee.lee@mediatek.com>
In-Reply-To: <20210621154442.18463-1-yee.lee@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 22 Jun 2021 17:03:42 +0300
Message-ID: <CA+fCnZdPwKZ9GfhTYPpWGVEO7bS6sSrh8cioZmRJet2maUjSVQ@mail.gmail.com>
Subject: Re: [PATCH] kasan: unpoison use memset to init unaligned object size
To: yee.lee@mediatek.com
Cc: wsd_upstream@mediatek.com, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:KASAN" <kasan-dev@googlegroups.com>, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Marco Elver <elver@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_070405_217622_857FC42C 
X-CRM114-Status: GOOD (  20.40  )
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

On Mon, Jun 21, 2021 at 6:45 PM <yee.lee@mediatek.com> wrote:
>
> From: Yee Lee <yee.lee@mediatek.com>
>
> This patch adds a memset to initialize object of unaligned size.
> Duing to the MTE granulrity, the integrated initialization using
> hwtag instruction will force clearing out bytes in granular size,
> which may cause undesired effect, such as overwriting to the redzone
> of SLUB debug. In this patch, for the unaligned object size, function
> uses memset to initailize context instead of the hwtag instruction.
>
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> ---
>  mm/kasan/kasan.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 8f450bc28045..d8faa64614b7 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -387,8 +387,11 @@ static inline void kasan_unpoison(const void *addr, size_t size, bool init)
>
>         if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
>                 return;
> +       if (init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
> +               init = false;
> +               memset((void *)addr, 0, size);
> +       }

With this implementation, we loose the benefit of setting tags and
initializing memory with the same instructions.

Perhaps a better implementation would be to call
hw_set_mem_tag_range() with the size rounded down, and then separately
deal with the leftover memory.

>         size = round_up(size, KASAN_GRANULE_SIZE);
> -
>         hw_set_mem_tag_range((void *)addr, size, tag, init);
>  }
>
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

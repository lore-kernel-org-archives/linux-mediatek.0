Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED84AC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 14:04:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEC9061477
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 14:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEC9061477
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmPIPnOmMxCG2mtSP+QW2bzEn/LuQ+A3TrXujcs3S2Y=; b=MAXDUWqF6uxUOT
	mL7EWDUxNOKoj6Gt/qKgs7OiRLkxxu9laCgONBCtN0aoiUPWnosINkfB26x8zCJWq8vPStc5Nc/w7
	DXdJQK5VwwDSsiQ/+2ruzJMf4odPzXboHZECiKUowFlb5ysGT+QX/tvAkNDRC/3sFEagJu2zQJ1IE
	ufGCxOV8E5G2GjZ17MuMyQQztxX+ZVFj5hx9WNqkSphi8xsWRxZv2Yc1CaM5din2SondtHAAmsrin
	EGaCwvwLXvoZg36oUOCVSx3HP3PTaD579nyR2KegtoGOS9wWOQ0cEmPcHhHm0j+MAMtYYu+03RYqp
	2/konNnqpVmnVH5EBcNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwmRB-001ou7-67; Fri, 25 Jun 2021 14:04:05 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwmQx-001opo-Kz; Fri, 25 Jun 2021 14:03:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id o11so2146329ejd.4;
 Fri, 25 Jun 2021 07:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KCBPWXjUtJqDX481tplGmByedXmi+6SSSYQlopDVlm8=;
 b=g2xI4G+YbXPOBweU0Dfhxgv8sAgTFjbLRxRY9HnhBIJ7t5750aZ2AnfPNLCZChITxz
 e9Yo/swOJ5U1cF9kBUv8dI/7589kD4AZiZBgJwj+exGZnoVksbjpyl7e0/BN5vAQfWv6
 /VXekcwiU8mYzSd1XvznpHZOiHKkHaZiSiQ+oCpAVQCWkYKQs79Xt0o7EPj4sXlIUNO3
 1WhKzAfHJucTboztqcpWrkg3AIrya5Bjw25wWjYqzOZSch6BNQkAuqg7m1wQhDCzFOTI
 V2Ulu0v2PpcsdfkXJBJ29grL9PL7XZ9xga6QgiyEoU5CU3O4wWbre7BvkL66xvJL9OiJ
 UNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KCBPWXjUtJqDX481tplGmByedXmi+6SSSYQlopDVlm8=;
 b=YVBosVqnP1e0VB0MWx73hjyIns3UA5AWxUxERssGX7UJJ3F3XgrAyLjZuAwRMBqzDz
 8S4yQu5NUcMdAqhib9KEw1QAqnFswZXgjfsk+v7ZhozcbzZ0nR9XvWKOLZJ/NuqKzcuA
 +zXF5ajP6XzKr9D6rPAsS5Ycx5TQIkwVczhr+blOXA1FQG8bjtMPsA6iD4xr1MR9EISU
 FsSrPcVq81j6uLLK12j3u33Ai66VJ0m/ZFbvEF9RbSTIxOjGN87JlTX4Zy8BJbE0F+wh
 Qts3ghgioKpkznp55z4Zd49E7UWPCgUtoKzcaVAGwiwPuAXOxabWnQ/tKCAXdzlwx5Es
 /NZA==
X-Gm-Message-State: AOAM531ROV2UMa/ZLrNh2iW9hThSUz01nNWOSc80UoYhLoHAANtDAHST
 KOaaYh22f/fNrYWxe57+BDbdcd01097HeaXds9c=
X-Google-Smtp-Source: ABdhPJwRxAwp1s4YjTUqcX/AAdgKGNstFB5jd3lyos+3LPa3ijtjUuFxbmNzJUzvo6qSGiT+GSa9ZkA6wg579vc/N0Q=
X-Received: by 2002:a17:906:6d16:: with SMTP id
 m22mr11315367ejr.333.1624629824272; 
 Fri, 25 Jun 2021 07:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210624112624.31215-1-yee.lee@mediatek.com>
 <20210624112624.31215-2-yee.lee@mediatek.com>
In-Reply-To: <20210624112624.31215-2-yee.lee@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 25 Jun 2021 17:03:21 +0300
Message-ID: <CA+fCnZe0fng4-53U1=5MiYszCMi97twKut3eQNaNHgPV2HOVug@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] kasan: Add memzero init for unaligned size under
 SLUB debug
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_070351_732557_203F06AD 
X-CRM114-Status: GOOD (  19.38  )
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

On Thu, Jun 24, 2021 at 2:26 PM <yee.lee@mediatek.com> wrote:
>
> From: Yee Lee <yee.lee@mediatek.com>
>
> Issue: when SLUB debug is on, hwtag kasan_unpoison() would overwrite
> the redzone of object with unaligned size.
>
> An additional memzero_explicit() path is added to replacing init by
> hwtag instruction for those unaligned size at SLUB debug mode.
>
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> ---
>  mm/kasan/kasan.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 8f450bc28045..d1054f35838f 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -387,6 +387,12 @@ static inline void kasan_unpoison(const void *addr, size_t size, bool init)
>
>         if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
>                 return;
> +#if IS_ENABLED(CONFIG_SLUB_DEBUG)

Is this an issue only with SLUB? SLAB also uses redzones.

> +       if (init && ((unsigned long)size & KASAN_GRANULE_MASK)) {

This needs a comment along the lines of:

/* Explicitly initialize the memory with the precise object size to
avoid overwriting the SLAB redzone. This disables initialization in
the arch code and may thus lead to performance penalty. The penalty is
accepted since SLAB redzones aren't enabled in production builds. */

> +               init = false;
> +               memzero_explicit((void *)addr, size);
> +       }
> +#endif
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

Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C45BC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 11:00:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0C4D61351
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 11:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0C4D61351
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6oCtHN+6WcVqXA1ughPX0j9vXYeVD2Obq1Iy/KgwO6g=; b=Jcrqf+4zpRm6qG
	0dPVaFgIx3QiC/AADZk/XuGAK/r8ZO/3kO0J0t3ZP+8IjX8rIrBdZM4UNz7DZiSb1pt1mpQ9l0jT3
	Wr+0LA2NkjmEuHU5mr3a/eojw5X1N15NTJjx5fgAgmCVBTyHNv3F3pOmHQD1YIPeI9mBtRXnhxHte
	oe5jTG7juaXQ81l6Me++PJ7xNO1SU6EVR+AMnE2cVNMcnbzJ7RtumwBAhvUrA/zDOV/fP1Oye3Z7m
	5OVbih1gN6TI49XOd7d6mK2PYKTKrSszgp2jQ1XcR5tfPkSu+O26uhzWIKWDjw9xDU7QFDEmMXSWU
	/h4gE3PScsxVoPufYYkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lve8H-006oNH-Gg; Tue, 22 Jun 2021 10:59:53 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lve80-006oGw-Ms
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 10:59:38 +0000
Received: by mail-ot1-x32b.google.com with SMTP id
 v11-20020a9d340b0000b0290455f7b8b1dcso7859384otb.7
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Jun 2021 03:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ST43GppbGqjxXxYbgPLZB6WISUmWZ5bTKVdHwZJ0LK0=;
 b=Nj20QEq+KxkLWAiRbPMmd9mJB90uKVMEJjEvf0yYVodg05DYpqSc/pXCThJAUiFWWl
 iNKgJcJ7DNn2WKIsPkHdudD+TvaWQFYuF2utzM/0BiSNl/bRqb4V/j6c+SppGNmH7N/m
 SJK8N2DsxlWNrBwtx4EhulxxN/48KFv1mHi3Q4jI1oF0WpsMWn9vLog4SIbJAH8a0T+0
 k7XMG81iMUlbL9TnQ1ybXmXmFvN3qgKx+4Qsh0jggwve3xTJ1Ok1CCJOtWLJIOyYJ5iK
 9WTN/RGCZZi5C7hQpYFPSEy41Jz0UqtXRSt9nAsvVe4HMhV/4wUnZgEPrWItlRzJHJeI
 jaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ST43GppbGqjxXxYbgPLZB6WISUmWZ5bTKVdHwZJ0LK0=;
 b=LVekD74v3U+RxgAExuxdzF6wUjTabQLH1gAW2tC+3GBFJxBnf6q30xWRAIpyJPytq4
 pE04BMw6FGbLr49WvEsUSne2wzz5ThM1e8DPEeAoxaDUQx/MUKjOzq0IIThCV/KgLk1W
 AhPGJDj0sueF3tP38oxWzUrc2IkfzFhtJVFXl/ULI68CtcgIjO2c6jfsRg6lIccggsYw
 8q1PRgJ5VdEp76rtM7Y7Q39BbZB3K7w38O6/cl47UIP3mpSMS7CuuBvqik4L1kvShnxL
 k5WpWkGIVo8wF8FSB2LYplAU2kpXFwumoYGQod7ibxx0byNc4xps21NK7sjJjnvAxUSA
 AHEw==
X-Gm-Message-State: AOAM530ZS/Xxjszw5H2xIoTYDLmGuS5SJh2QsmhBhFVKn32VGBcHhwQl
 rsghXZI9xaCGIWec6KiyIY41iI9HM29SwEP6Fa7CBA==
X-Google-Smtp-Source: ABdhPJyFj9ZXB0FBR0cxOcfQPd3wwOJR8y/fh4HikV7DTsq/slH7YOgsNfWAae+cwaRu5GpXy8mGpPmB6Ualf8IS/kQ=
X-Received: by 2002:a05:6830:93:: with SMTP id
 a19mr2616280oto.17.1624359575598; 
 Tue, 22 Jun 2021 03:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210622084723.27637-1-yee.lee@mediatek.com>
 <CANpmjNPyP2-oULXuO9ZdC=yj_XSiC2TWKNBp0RL_h3k-XvpFsA@mail.gmail.com>
 <46b1468146206e6cef0c33ecbfd86e02ea819db4.camel@mediatek.com>
In-Reply-To: <46b1468146206e6cef0c33ecbfd86e02ea819db4.camel@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Tue, 22 Jun 2021 12:59:24 +0200
Message-ID: <CANpmjNNOkPAHvZv2nJgv_1AfxpQ7c2oFXJAUrWGJAsMKaUEy-w@mail.gmail.com>
Subject: Re: [PATCH] kasan: [v2]unpoison use memzero to init unaligned object
To: Yee Lee <yee.lee@mediatek.com>
Cc: andreyknvl@gmail.com, wsd_upstream@mediatek.com, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:KASAN" <kasan-dev@googlegroups.com>, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_035936_822806_75C2690B 
X-CRM114-Status: GOOD (  46.15  )
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

On Tue, 22 Jun 2021 at 12:48, Yee Lee <yee.lee@mediatek.com> wrote:
>
> On Tue, 2021-06-22 at 11:01 +0200, Marco Elver wrote:
> > On Tue, 22 Jun 2021 at 10:48, <yee.lee@mediatek.com> wrote:
> > >
> > > From: Yee Lee <yee.lee@mediatek.com>
> > >
> > > Follows the discussion:
> > > https://patchwork.kernel.org/project/linux-mediatek/list/?series=504439
> >
> > The info about the percentage of how frequent this is could have been
> > provided as a simple reply to the discussion.
> >
> > > This patch Add memzero_explict to initialize unaligned object.
> >
> > This patch does not apply to anything (I see it depends on the
> > previous patch).
> >
> > What you need to do is modify the original patch, and then send a
> > [PATCH v2] (git helps with that by passing --reroll-count or -v) that
> > applies cleanly to your base kernel tree.
> >
> > The commit message will usually end with '---' and then briefly
> > denote
> > what changed since the last version.
> >
> Got it.
>
> >
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format
> >
> > > Based on the integrateion of initialization in kasan_unpoison().
> > > The hwtag instructions, constrained with its granularity, has to
> > > overwrite the data btyes in unaligned objects. This would cause
> > > issue when it works with SLUB debug redzoning.
> > >
> > > In this patch, an additional initalizaing path is added for the
> > > unaligned objects. It contains memzero_explict() to clear out the
> > > data and disables its init flag for the following hwtag actions.
> > >
> > > In lab test, this path is executed about 1.1%(941/80854) within the
> > > overall kasan_unpoison during a non-debug booting process.
> >
> > Nice, thanks for the data. If it is somehow doable, however, I'd
> > still
> > recommend to additionally guard the new code path by a check if
> > debug-support was requested. Ideally with an IS_ENABLED() config
> > check
> > so that if it's a production kernel the branch is simply optimized
> > out
> > by the compiler.
>
> Does it mean the memzero code path would be applied only at
> CONFIG_DEBUG_SLUB enabled? It expects no other potential overwriting
> in non-debug kernel.

Yes, if the problem only occurs with slub debugging enabled.

> By the way, based on de-coupling principle, adding a specific
> conditional statement(is_enable slub_debug) in a primitive
> funciton(kasan_unpoison) is not neat. It may be more proper that the
> conditional statement be added in other procedures of slub alloc.

What do you have in mind?

Well, there is kmem_cache_debug_flags(). Perhaps there's a better
place to add the check?

> Thanks,
>
> BR,
> Yee
>
> >
> > > Lab test: QEMU5.2 (+mte) / linux kernel 5.13-rc7
> > >
> > > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> > > ---
> > >  mm/kasan/kasan.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > > index d8faa64614b7..edc11bcc3ff3 100644
> > > --- a/mm/kasan/kasan.h
> > > +++ b/mm/kasan/kasan.h
> > > @@ -389,7 +389,7 @@ static inline void kasan_unpoison(const void
> > > *addr, size_t size, bool init)
> > >                 return;
> > >         if (init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
> > >                 init = false;
> > > -               memset((void *)addr, 0, size);
> > > +               memzero_explicit((void *)addr, size);
> > >         }
> > >         size = round_up(size, KASAN_GRANULE_SIZE);
> > >         hw_set_mem_tag_range((void *)addr, size, tag, init);
> > > 2.18.0
> > >
> > > --
> > > You received this message because you are subscribed to the Google
> > > Groups "kasan-dev" group.
> > > To unsubscribe from this group and stop receiving emails from it,
> > > send an email to kasan-dev+unsubscribe@googlegroups.com.
> > > To view this discussion on the web visit
> > > https://groups.google.com/d/msgid/kasan-dev/20210622084723.27637-1-yee.lee%40mediatek.com
> > > .
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/46b1468146206e6cef0c33ecbfd86e02ea819db4.camel%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

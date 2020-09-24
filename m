Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437F5C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 12:21:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA0AC21D7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 12:21:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aVSNSIy2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Wh7FyLoZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA0AC21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mFL5I+UglhZvBKKmJzTQvFytY1duA4wfwi4wh8vOaRU=; b=aVSNSIy2Ran2Q5OZOdmVy7eyJ
	JWeIOzUkAVD8ATXVm22d1/ZJF5CxX9+irNu3+zJNDFPvHVKJsyLAC7a453om4EnrVfhHH/c2PgK+k
	hI9fWa3uB2rpU/qkdt3YcgUPQ14jKstWIdWrTceX2EbYcnXDiAjZYORG1SU63t3Jm2wgkXeoZQEXe
	/Du6OR4Fzr6mJEH/xTQUtMTGsryny9t5PMrUxpoa19d3eta43Il+PLVjg0S6i+p8A8NdI/1HOlXKh
	8+Riz+no5bxdQqkF4e9JhEpj8EUebh9VLzXwvu8nU5ra+ywXtilsdAQOtZi5AonKGnb8UcL1MoXbo
	ANIw8mGQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLQFk-0006tg-Cr; Thu, 24 Sep 2020 12:21:36 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLQFi-0006sS-5S
 for linux-mediatek@lists.infradead.org; Thu, 24 Sep 2020 12:21:35 +0000
Received: by mail-oi1-x244.google.com with SMTP id m7so3469525oie.0
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2020 05:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SMi05EnEOfVdGhWpH6feACxpwD+9PbH32BgxYxZVzjg=;
 b=Wh7FyLoZl05ePrScyIDLbNcW93hNy+bh0MlhKgZYBOD4Asb3pfcIWi1Qpm7l3BqHeX
 aq07/YxMJCgggcHSlXRtbFTT+8k7eueARAT3utPtwb4GZW4AENnLmytJkt8R0GevA56h
 lS8l36/AWFDMX7UM7y0Fu9rrUir7atUDweXTHLhJujpZM6B+ApPh26tQfFHOhtgOin6G
 +sfgjdXPNGwWX59Da2Kxi4uheKAY3xHsOVuAvvKGwoOiYj6ct+q2HQoYIA+oxQMnVvxJ
 pzJuS3UvRV+oA4msapQoTTiiQiUb8URNxOrJQ/zHTUdOK5EFIZzhhIVAWDye1y587M2d
 weXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SMi05EnEOfVdGhWpH6feACxpwD+9PbH32BgxYxZVzjg=;
 b=oAIW85+w/6ef9/xJE/feyZyR5rXWMslgznfaSrZyDZpMoekNdg4GAtTlvHbxayOW/f
 HwrDJ6Y/AoUBgDmsqNhl9wZOdYwfoabZeYorx3Tf6GiG4Ut+t5piIkiYPstn6OoHqZPc
 OrSgIrijzdl9ch+ruq5zevX2Aa6Y4wt8fd4dPQ5hwuQrUC9fkZjgRcLnDE6WMJnP9jon
 ZvAnL90EaMv3k0VMr0Nz3wqc6SX0cN13QXmVh0CAQHM6TA1KcgVfm3kGMA9v1yRhDfFx
 lJzFbmUzw44bFCtLrUr19UyOd4ifNfEbDsbVzYGSXzmV/aZWPzEPJAPWiiDVaVNq+4BI
 hSFA==
X-Gm-Message-State: AOAM532rIx8EroDeEgTWJg+AX2t5qHQMPTe/0IZ6vHZvkqcyaFlkXMz1
 CWl5w3/7DEZ76JVGVUfEFFB/MJZ0yM7SoqGogCGCYQ==
X-Google-Smtp-Source: ABdhPJyUQSlF1yD+fBHh7KRRnvI1RKY1nulFZ3b80Oct6GlWUeHTquzqD3/u7BnXcXHItepe9G+Pxs7iu3ZAEntp++0=
X-Received: by 2002:aca:5158:: with SMTP id f85mr2388516oib.121.1600950091824; 
 Thu, 24 Sep 2020 05:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200924040513.31051-1-walter-zh.wu@mediatek.com>
 <CAG_fn=W2dcGKFKHpDXzNvbPUp3USYyWi2DEpEewboqYBodnSsQ@mail.gmail.com>
 <CANpmjNNmeqfMLZ0aFC49fHTYS5k7BqTZHP4FmDc=sfZe+j6bOg@mail.gmail.com>
 <CAG_fn=UFnju7qBw2FC8nGxTKQ5VB2QeG-DKik_t=eWzu6p+H6A@mail.gmail.com>
In-Reply-To: <CAG_fn=UFnju7qBw2FC8nGxTKQ5VB2QeG-DKik_t=eWzu6p+H6A@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Thu, 24 Sep 2020 14:21:20 +0200
Message-ID: <CANpmjNP6gKToqT-EZM88ZoedWfyHr86EB2s9sKEtzTxBVQe_Lg@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] kasan: print timer and workqueue stack
To: Alexander Potapenko <glider@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_082134_320954_51423397 
X-CRM114-Status: GOOD (  30.15  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Andrey Konovalov <andreyknvl@google.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Sep 2020 at 14:11, Alexander Potapenko <glider@google.com> wrote:
>
> On Thu, Sep 24, 2020 at 1:55 PM Marco Elver <elver@google.com> wrote:
> >
> > On Thu, 24 Sep 2020 at 13:47, Alexander Potapenko <glider@google.com> wrote:
> > >
> > > On Thu, Sep 24, 2020 at 6:05 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > > >
> > > > The aux_stack[2] is reused to record the call_rcu() call stack,
> > > > timer init call stack, and enqueuing work call stacks. So that
> > > > we need to change the auxiliary stack title for common title,
> > > > print them in KASAN report.
> > > >
> > > > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > > > Suggested-by: Marco Elver <elver@google.com>
> > > > Acked-by: Marco Elver <elver@google.com>
> > > > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > > > Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
> > > > Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > > > Cc: Alexander Potapenko <glider@google.com>
> > > > ---
> > > >
> > > > v2:
> > > > - Thanks for Marco suggestion.
> > > > - We modify aux stack title name in KASAN report
> > > >   in order to print call_rcu()/timer/workqueue stack.
> > > >
> > > > ---
> > > >  mm/kasan/report.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> > > > index 4f49fa6cd1aa..886809d0a8dd 100644
> > > > --- a/mm/kasan/report.c
> > > > +++ b/mm/kasan/report.c
> > > > @@ -183,12 +183,12 @@ static void describe_object(struct kmem_cache *cache, void *object,
> > > >
> > > >  #ifdef CONFIG_KASAN_GENERIC
> > > >                 if (alloc_info->aux_stack[0]) {
> > > > -                       pr_err("Last call_rcu():\n");
> > > > +                       pr_err("Last potentially related work creation:\n");
> > >
> > > This doesn't have to be a work creation (expect more callers of
> > > kasan_record_aux_stack() in the future), so maybe change the wording
> > > here to "Last potentially related auxiliary stack"?
> >
> > I suggested "work creation" as it's the most precise for what it is
> > used for now.
>
> I see, then maybe my suggestion is premature.
>
> > What other users do you have in mind in future that are not work creation?
>
> I think saving stacks may help in any case where an object is reused
> for a different purpose without reallocation.
> SKBs, maybe?

I currently don't know, it's hard to say without having a report that
we can't debug without it.

The litmus test for if it's useful would probably be "do we need this
stacktrace to debug a use-after-free/double-free?". If the answer is
maybe (and not yes!), I'd err on the side of not going overboard with
these, because we only have limited storage anyway. "Work creation" is
a clear case of "we loose information to the original caller" and need
it to debug. But of course, if there are similar issues elsewhere, we
need to identify them and then decide if we need it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

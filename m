Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034D8C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 17:31:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ACE664F2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 17:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ACE664F2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ug82RgFgYJikHajAwX2hNBivyZmOATwhZ6Yn9xiIDN0=; b=GYjqaFhPPS/MsyaXPOA1Ia7Dj
	IGeJhP0E2afP31hgS2l6NOejO0bWFNvJXvWuQCah/53OPtLHS0dGk2hud1luuijkXC4oPJkyfZWOS
	8iZHBsctG8TEg9NgByfIa/gAqX1Y6ek/TYdG3lmInsrVWnTtzVdn9Wbb5RibiH6o/ydVsByF23Re/
	tQfmBksa6+ZaWcFVk/Ecd1Ob5T7lYYPGRzmH9As7J62VAjmbtQlHym/7L94/HZmC8LYSW3W/jZmdo
	obu3vuWnhemJjwaaArhMBDYgFobKvZxl58XHLft0d19TJ1uCSUmLq04BIkAwqqbzC92GDCjw/FLoL
	YORzw/1TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l84wf-0004TX-Um; Fri, 05 Feb 2021 17:31:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l84wc-0004SF-7r
 for linux-mediatek@lists.infradead.org; Fri, 05 Feb 2021 17:30:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id x9so3921910plb.5
 for <linux-mediatek@lists.infradead.org>; Fri, 05 Feb 2021 09:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dqdujun8wGwVR12tCa3y7+xoN9EW0D48IZceWkJl7oI=;
 b=bSEk/I22cujvi4qnuuPGwPinL75MBuQNwqPNQZP9tya6m4rltCMGJhtz11m0nLqw4E
 9wQJ5MpoVrm+2u9PQQ2iPAN5H0vNEWnwhzm7cvOeyan9lKAqY/hurkA7fu4jQB0JKp5J
 chZoes3QaP9Lb8FsBAWPefFuIB+lsUqEfGAmZWMByfA9woeGw7BjaNsLawJZZsq1Ibdb
 cLwIlVr3G1Nwe+NzEKfLjULuoNTM5bDRitYc+wfP/pPZm0hHM0Txea4rLtPp4TnE0fts
 TJAjJsmtsURoteU0XgC7hqC9jCvXu5xRvvNI8hZCK7jq5w5taZngEr2G2gBUiPet8EVM
 19og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dqdujun8wGwVR12tCa3y7+xoN9EW0D48IZceWkJl7oI=;
 b=os0P3fldIO2XewWosvHY4J0HusquIf4em6+AnLEXmACenvaZYwTMrA0hCxr85gaPsb
 lMpfQD2z0+oxjigrPudp/uQXoXGCrlAnUINhhS0qnwLgG5ugZ9Q8Sr3kVJuqFcGSDGJU
 MKS8nqhWHhPa5TKR8bek7MrUneVwFpaqFlWQBLlmFJjBBfHl5K67oJp4lSOXOS6ECXSj
 kAuhZDs2rh+a4f1fVt29kEF1/vCqNTCoeXa5vnAHLPQnK3tvXWnmcPA/WymCH42dVH0b
 V1e8vGBzOROdznLOzfXii+AYvGlgyMVwhcwXjnetqoJb+Y8wLX9buCb468QC4F/ZGNr5
 Yi6g==
X-Gm-Message-State: AOAM531CoW8kiwIXT9eVzrnzS+RrRpVOl0Huia6X/R5977b02bWI3Gfk
 W6UJyOdTkLyPJ7xL3Heloe9JBNQJsrzp2dmjMaQzgQ==
X-Google-Smtp-Source: ABdhPJydJVbZuowKkuiIq7j3adPgOPz+adwLhFZiCNyj2VyHDStxbQpGwPNsujGvsVZ0emhENzvP0iBjmmwBHqfvSSw=
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr5060341pjb.166.1612546255453; 
 Fri, 05 Feb 2021 09:30:55 -0800 (PST)
MIME-Version: 1.0
References: <20210204150100.GE20815@willie-the-truck>
 <20210204163721.91295-1-lecopzer@gmail.com>
 <20210205171859.GE22665@willie-the-truck>
In-Reply-To: <20210205171859.GE22665@willie-the-truck>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 5 Feb 2021 18:30:44 +0100
Message-ID: <CAAeHK+zppv6P+PqAuZqAfd7++QxhA1rPX6vdY5MyYK_v6YdXSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_123058_384309_D4FA8F06 
X-CRM114-Status: GOOD (  38.16  )
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, tyhicks@linux.microsoft.com,
 Alexander Potapenko <glider@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, yj.chiang@mediatek.com,
 kasan-dev <kasan-dev@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Guenter Roeck <linux@roeck-us.net>,
 Lecopzer Chen <lecopzer@gmail.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, gustavoars@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 5, 2021 at 6:19 PM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Feb 05, 2021 at 12:37:21AM +0800, Lecopzer Chen wrote:
> >
> > > On Thu, Feb 04, 2021 at 10:46:12PM +0800, Lecopzer Chen wrote:
> > > > > On Sat, Jan 09, 2021 at 06:32:49PM +0800, Lecopzer Chen wrote:
> > > > > > Linux support KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > > > > > ("kasan: support backing vmalloc space with real shadow memory")
> > > > > >
> > > > > > Like how the MODULES_VADDR does now, just not to early populate
> > > > > > the VMALLOC_START between VMALLOC_END.
> > > > > > similarly, the kernel code mapping is now in the VMALLOC area and
> > > > > > should keep these area populated.
> > > > > >
> > > > > > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > > > > > ---
> > > > > >  arch/arm64/mm/kasan_init.c | 23 ++++++++++++++++++-----
> > > > > >  1 file changed, 18 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> > > > > > index d8e66c78440e..39b218a64279 100644
> > > > > > --- a/arch/arm64/mm/kasan_init.c
> > > > > > +++ b/arch/arm64/mm/kasan_init.c
> > > > > > @@ -214,6 +214,7 @@ static void __init kasan_init_shadow(void)
> > > > > >  {
> > > > > >   u64 kimg_shadow_start, kimg_shadow_end;
> > > > > >   u64 mod_shadow_start, mod_shadow_end;
> > > > > > + u64 vmalloc_shadow_start, vmalloc_shadow_end;
> > > > > >   phys_addr_t pa_start, pa_end;
> > > > > >   u64 i;
> > > > > >
> > > > > > @@ -223,6 +224,9 @@ static void __init kasan_init_shadow(void)
> > > > > >   mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
> > > > > >   mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
> > > > > >
> > > > > > + vmalloc_shadow_start = (u64)kasan_mem_to_shadow((void *)VMALLOC_START);
> > > > > > + vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
> > > > > > +
> > > > > >   /*
> > > > > >    * We are going to perform proper setup of shadow memory.
> > > > > >    * At first we should unmap early shadow (clear_pgds() call below).
> > > > > > @@ -241,12 +245,21 @@ static void __init kasan_init_shadow(void)
> > > > > >
> > > > > >   kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
> > > > > >                              (void *)mod_shadow_start);
> > > > > > - kasan_populate_early_shadow((void *)kimg_shadow_end,
> > > > > > -                            (void *)KASAN_SHADOW_END);
> > > > > > + if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
> > > > >
> > > > > Do we really need yet another CONFIG option for KASAN? What's the use-case
> > > > > for *not* enabling this if you're already enabling one of the KASAN
> > > > > backends?
> > > >
> > > > As I know, KASAN_VMALLOC now only supports KASAN_GENERIC and also
> > > > KASAN_VMALLOC uses more memory to map real shadow memory (1/8 of vmalloc va).
> > >
> > > The shadow is allocated dynamically though, isn't it?
> >
> > Yes, but It's still a cost.
> >
> > > > There should be someone can enable KASAN_GENERIC but can't use VMALLOC
> > > > due to memory issue.
> > >
> > > That doesn't sound particularly realistic to me. The reason I'm pushing here
> > > is because I would _really_ like to move to VMAP stack unconditionally, and
> > > that would effectively force KASAN_VMALLOC to be set if KASAN is in use.
> > >
> > > So unless there's a really good reason not to do that, please can we make
> > > this unconditional for arm64? Pretty please?
> >
> > I think it's fine since we have a good reason.
> > Also if someone have memory issue in KASAN_VMALLOC,
> > they can use SW_TAG, right?
> >
> > However the SW_TAG/HW_TAG is not supported VMALLOC yet.
> > So the code would be like
> >
> >       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
>
> Just make this CONFIG_KASAN_VMALLOC, since that depends on KASAN_GENERIC.
>
> >               /* explain the relationship between
> >                * KASAN_GENERIC and KASAN_VMALLOC in arm64
> >                * XXX: because we want VMAP stack....
> >                */
>
> I don't understand the relation with SW_TAGS. The VMAP_STACK dependency is:
>
>         depends on !KASAN || KASAN_HW_TAGS || KASAN_VMALLOC

This means that VMAP_STACK can be only enabled if KASAN_HW_TAGS=y or
if KASAN_VMALLOC=y for other modes.

>
> which doesn't mention SW_TAGS at all. So that seems to imply that SW_TAGS
> and VMAP_STACK are mutually exclusive :(

SW_TAGS doesn't yet have vmalloc support, so it's not compatible with
VMAP_STACK. Once vmalloc support is added to SW_TAGS, KASAN_VMALLOC
should be allowed to be enabled with SW_TAGS. This series is a step
towards having that support, but doesn't implement it. That will be a
separate effort.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

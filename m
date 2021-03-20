Return-Path: <SRS0=BNI/=IS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10819C433C1
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Mar 2021 13:01:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEF3A6196F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Mar 2021 13:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEF3A6196F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=agJ9vvmD9zMXY2sCycmMsSuAHLAIEa6k8Ge42IQYy9s=; b=Tn21DDF0KzGdMfVqLcJTky11I
	vRPEqG9qY0AqJ+LBF1neefObXSc6iXPS0BrydqPuSQ0YXBaKfFEigUbsk01ep9k/bqqRIEhboVat5
	l/Mj5dbE290ASCxxeHn83i9rfx1KODNlePM9M1MTW2MihCh45duVqUTCtoYMsAq98aaVo/fB2Qhg6
	2AlReqxn1Xo2wsydDnIgnM5LeQ0azXpeesj4zbpbdL8UaoWI+FAL/ydKz8Vu4k/hudPf5FzKWWNEY
	0pQW1afuLlN47Wr2m2cCDWA+aMjodtz978I5xCjvTGuTM02RLOs9DBgRN+O4xYRvEYD3d9EXq2uj+
	rvM17ANLQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNbES-008quf-6u; Sat, 20 Mar 2021 13:01:32 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNbEF-008qtI-VH; Sat, 20 Mar 2021 13:01:21 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so5785142pjb.4; 
 Sat, 20 Mar 2021 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ON3r+aiJR5Q+UUgakEzAMuWKjcsi9+uuz4/fBWDEro=;
 b=QZgnK16rXyq85ehDyAiQXZvR70iLXG5F0ewNKUe8pvMEOjHRjNFx/ZCmcXpTkz6m2E
 o51J3PDpJFFIlxyJ/tPi7hx0MNf338zs7jhG42/ym/TcxPnnowQMIUsCr9U+6LLxXjDn
 7fcZJT1iFquSBRa24aLwPa1iXN+8Y+Ea668zFzLm6wWUJYF8JjGplr6MnerBT/b65cGu
 SNs/wRNJ7VGLoqwRHc0GPSNgQWmilhW+siP8nyr+A94M7oepd6rJ5lVgtitNPRpmwsdc
 rBQnZ0J+Vm7jtSK4gaNDhI2oKKOhszLw8dqHrxJUzDV4VmFHmTx8DO06GeaMhuqgiP8Q
 Pz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ON3r+aiJR5Q+UUgakEzAMuWKjcsi9+uuz4/fBWDEro=;
 b=HZAoBuDkFgSU9a94KI/1HVkeNo0zAte6KNvX7CSUteVIidoBkoDSA7n/T1QuwPOfZF
 XnX97cSHxGWj4siNXiOpDCAPl/VS/G/2eE8UqDyqRJMaIVNM9a3AtOhZkuYNonMufMbU
 03m0uHvokS6lpMAi3j/AM610ZCKp10HwXlxbfJpfkiqbmpoSczxAtb+zZ6hAd4BBaKU1
 SKzq2gB9N0ip3xIf+khn6dBVW4KriDcY1n3ZNx2QH1Hp0oAFMTI26QVyOL6UOCY5HQ4B
 9r5jKi6rJWQopiZGApzhM7wbl8gYW6LaDDG8U1sEu2iX2CsEw/t6bfk/+t3hsIGgriJe
 GttQ==
X-Gm-Message-State: AOAM5330dR+CGSPS6AwZCjbmUNk/fzgSA65midPiooUDetyQpiDStK+n
 yHu1Y/77ll7/gc1GUzpWE6B0PZBuD4NUv2xnpUPIL9q4Uso=
X-Google-Smtp-Source: ABdhPJwu0PgawlU0aWRzBKCj1+2gsUvraBIaBwJWOXpTMjPRxKpSzNQ3z/8nQ5/HfHn5A1slZVncNDIhR+lGjrUS+Cg=
X-Received: by 2002:a17:90a:4104:: with SMTP id
 u4mr3445045pjf.81.1616245278293; 
 Sat, 20 Mar 2021 06:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210206083552.24394-1-lecopzer.chen@mediatek.com>
 <20210206083552.24394-2-lecopzer.chen@mediatek.com>
 <20210319173758.GC6832@arm.com>
In-Reply-To: <20210319173758.GC6832@arm.com>
From: Lecopzer Chen <lecopzer@gmail.com>
Date: Sat, 20 Mar 2021 21:01:07 +0800
Message-ID: <CANr2M18q-EfmUvX=LbP2wLOX-=qJqPK9cH=EUKp3T9Nh6SLsGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, 
 kasan-dev@googlegroups.com, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Will Deacon <will@kernel.org>, 
 dan.j.williams@intel.com, aryabinin@virtuozzo.com, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mediatek@lists.infradead.org, 
 yj.chiang@mediatek.com, ardb@kernel.org, 
 Andrey Konovalov <andreyknvl@google.com>, broonie@kernel.org,
 linux@roeck-us.net, 
 rppt@kernel.org, tyhicks@linux.microsoft.com, robin.murphy@arm.com, 
 vincenzo.frascino@arm.com, gustavoars@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_130120_188018_62D00AF7 
X-CRM114-Status: GOOD (  28.12  )
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

On Sat, Mar 20, 2021 at 1:38 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Sat, Feb 06, 2021 at 04:35:48PM +0800, Lecopzer Chen wrote:
> > Linux support KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > ("kasan: support backing vmalloc space with real shadow memory")
> >
> > Like how the MODULES_VADDR does now, just not to early populate
> > the VMALLOC_START between VMALLOC_END.
> >
> > Before:
> >
> > MODULE_VADDR: no mapping, no zoreo shadow at init
> > VMALLOC_VADDR: backed with zero shadow at init
> >
> > After:
> >
> > MODULE_VADDR: no mapping, no zoreo shadow at init
> > VMALLOC_VADDR: no mapping, no zoreo shadow at init
>
> s/zoreo/zero/
>

thanks!

> > Thus the mapping will get allocated on demand by the core function
> > of KASAN_VMALLOC.
> >
> >   -----------  vmalloc_shadow_start
> >  |           |
> >  |           |
> >  |           | <= non-mapping
> >  |           |
> >  |           |
> >  |-----------|
> >  |///////////|<- kimage shadow with page table mapping.
> >  |-----------|
> >  |           |
> >  |           | <= non-mapping
> >  |           |
> >  ------------- vmalloc_shadow_end
> >  |00000000000|
> >  |00000000000| <= Zero shadow
> >  |00000000000|
> >  ------------- KASAN_SHADOW_END
> >
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > ---
> >  arch/arm64/mm/kasan_init.c | 18 +++++++++++++-----
> >  1 file changed, 13 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> > index d8e66c78440e..20d06008785f 100644
> > --- a/arch/arm64/mm/kasan_init.c
> > +++ b/arch/arm64/mm/kasan_init.c
> > @@ -214,6 +214,7 @@ static void __init kasan_init_shadow(void)
> >  {
> >       u64 kimg_shadow_start, kimg_shadow_end;
> >       u64 mod_shadow_start, mod_shadow_end;
> > +     u64 vmalloc_shadow_end;
> >       phys_addr_t pa_start, pa_end;
> >       u64 i;
> >
> > @@ -223,6 +224,8 @@ static void __init kasan_init_shadow(void)
> >       mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
> >       mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
> >
> > +     vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
> > +
> >       /*
> >        * We are going to perform proper setup of shadow memory.
> >        * At first we should unmap early shadow (clear_pgds() call below).
> > @@ -241,12 +244,17 @@ static void __init kasan_init_shadow(void)
> >
> >       kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
> >                                  (void *)mod_shadow_start);
> > -     kasan_populate_early_shadow((void *)kimg_shadow_end,
> > -                                (void *)KASAN_SHADOW_END);
> >
> > -     if (kimg_shadow_start > mod_shadow_end)
> > -             kasan_populate_early_shadow((void *)mod_shadow_end,
> > -                                         (void *)kimg_shadow_start);
>
> Not something introduced by this patch but what happens if this
> condition is false? It means that kimg_shadow_end < mod_shadow_start and
> the above kasan_populate_early_shadow(PAGE_END, mod_shadow_start)
> overlaps with the earlier kasan_map_populate(kimg_shadow_start,
> kimg_shadow_end).

In this case, the area between mod_shadow_start and kimg_shadow_end
was mapping when kasan init.

Thus the corner case is that module_alloc() allocates that range
(the area between mod_shadow_start and kimg_shadow_end) again.


With VMALLOC_KASAN,
module_alloc() ->
    ... ->
        kasan_populate_vmalloc ->
            apply_to_page_range()
will check the mapping exists or not and bypass allocating new mapping
if it exists.
So it should be fine in the second allocation.

Without VMALLOC_KASAN,
module_alloc() ->
    kasan_module_alloc()
will allocate the range twice, first time is kasan_map_populate() and
second time is vmalloc(),
and this should have some problems(?).

Now the only possibility that the module area can overlap with kimage
should be KASLR on.
I'm not sure if this is the case that really happens in KASLR, it depends on
how __relocate_kernel() calculates kimage and how kaslr_earlt_init()
decides module_alloc_base.


> > +     if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
> > +             kasan_populate_early_shadow((void *)vmalloc_shadow_end,
> > +                                         (void *)KASAN_SHADOW_END);
> > +     else {
> > +             kasan_populate_early_shadow((void *)kimg_shadow_end,
> > +                                         (void *)KASAN_SHADOW_END);
> > +             if (kimg_shadow_start > mod_shadow_end)
> > +                     kasan_populate_early_shadow((void *)mod_shadow_end,
> > +                                                 (void *)kimg_shadow_start);
> > +     }
> >
> >       for_each_mem_range(i, &pa_start, &pa_end) {
> >               void *start = (void *)__phys_to_virt(pa_start);
> > --
> > 2.25.1
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

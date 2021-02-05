Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4312EC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 20:51:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D48F64E42
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 20:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D48F64E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KYht2n+kYXejv7AjW6XB3p5ok/tiI7ESlEpjga9K5YE=; b=S907zZqT3acSgLdb7qkIAPqTy
	m2O2Zkr61YupXLzc2WJqAjCNOqBqQrEoEuHR2i1D7L0wx1jMzQ0UINWDwsA7dvws0drsWy1kTNKH0
	WwQdO6wDOHmI9I3TQjohCRGd3jZChGV6PHvJX3uWSTZDDxaYUNKJKPuCHVlvig2rwfuU/MYjVnJxL
	dRhXMly2QLmZNVFdDSqdIGLMuQUnVbCGQHF995jK6gHCnVW/vdBwSqMfgKC5UtsU9NTxrkyQZY+We
	IryvlFtfZLYps59tzS+S86KMF/yNDUHi458EaNx4YL5GyT40rs9/4qw+BjNDFiF7QNXFZjEV1+CRa
	oBPFG32ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l884Q-0007em-OX; Fri, 05 Feb 2021 20:51:14 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l884L-0007dD-6a
 for linux-mediatek@lists.infradead.org; Fri, 05 Feb 2021 20:51:10 +0000
Received: by mail-pj1-x1036.google.com with SMTP id g15so4498566pjd.2
 for <linux-mediatek@lists.infradead.org>; Fri, 05 Feb 2021 12:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WZLU4c8CFtN82E3juz+QcV9FF1JDMzfdyAO1GFaD3hY=;
 b=J97dVjLjNvVby8Zj4bXfcz649DPZ5fll8CrBpuA3qsFXESA71JYiLLqk+X5dDf8a0j
 ikNvcC0IAmPZP9XrKnHt9U/nl8zMeP6sp8swP1r7kG6gSV9cg3XGj6Ko1sTUpE2/sCAh
 eE5GKW8Q1KkIwGB4vAgreo8VVLF94i+b6AaR8nGGUcM0Qiyhwr/yR+/nPeNRCVugL96m
 epq0XpBdpwKhuGLuMCPlSb14MqbXvZ7SHT5a9B+S9itLinpXDAKG82KEXd0IK8yR48Qk
 LzdU3dMG8eMMwLoIGGQ+g9EqSwy3OuwJjyGscGtU9rzazozWwYDT2eo/U9O0DLq374qW
 H9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WZLU4c8CFtN82E3juz+QcV9FF1JDMzfdyAO1GFaD3hY=;
 b=GXM12BhGSb8FZFqWHNG7/lxQx4Nk+tc72xhpYpkFjVukORCUE/lXcm/u1p5h1E59cj
 KWvAYlawpxRFnwfZQsZNHgd1Y5P7LiAllkIN5FokhFC/3R7Ef+skD5FZhSQ8VyLgl/X2
 BzY7tQb6kggOtgPFmII2Twxvpbb4q1E3yt1hHD/apAaHbTCsHAZsyqgg5C+svVfRu5Lz
 kxgAg4sgAF0osh1DQLgCdstvaKD1PMCzszuDCC7mRzHy1HCn5+6mjSABeag/pf1Z3nK/
 BbFU+OfSLLqwu1I0pF1M935cDUPegFq23IqPsyRsu5VCSH6SGD9rTzirjfu9HLdrtVvf
 3grA==
X-Gm-Message-State: AOAM532EgF0hzYm7Qav9xcA+qZIUojWJOJEwpRXCvdsxJpp4MgEoiYIz
 UxAG61I6xrIkMCk1u44sYS2CvTmMOPGt7WTu/sOW5A==
X-Google-Smtp-Source: ABdhPJyapOvhRRqZ+bQIBXS8rWxLcpUPYbQDSO/D7VDIaq2PS0n8HmEJl5SVaOYTt6EAsXuZBRAOpQBkCOHcYirmJBs=
X-Received: by 2002:a17:90b:3756:: with SMTP id
 ne22mr5531867pjb.41.1612558266710; 
 Fri, 05 Feb 2021 12:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20210204150100.GE20815@willie-the-truck>
 <20210204163721.91295-1-lecopzer@gmail.com>
 <20210205171859.GE22665@willie-the-truck>
 <CAAeHK+zppv6P+PqAuZqAfd7++QxhA1rPX6vdY5MyYK_v6YdXSA@mail.gmail.com>
 <20210205174301.GF22665@willie-the-truck>
In-Reply-To: <20210205174301.GF22665@willie-the-truck>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 5 Feb 2021 21:50:55 +0100
Message-ID: <CAAeHK+ysNmkxEZqQ_rEsa7bh_ZZEtOHaMstXumtzWJLu1LdDyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_155109_363815_FEF381E1 
X-CRM114-Status: GOOD (  42.31  )
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

On Fri, Feb 5, 2021 at 6:43 PM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Feb 05, 2021 at 06:30:44PM +0100, Andrey Konovalov wrote:
> > On Fri, Feb 5, 2021 at 6:19 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Fri, Feb 05, 2021 at 12:37:21AM +0800, Lecopzer Chen wrote:
> > > >
> > > > > On Thu, Feb 04, 2021 at 10:46:12PM +0800, Lecopzer Chen wrote:
> > > > > > > On Sat, Jan 09, 2021 at 06:32:49PM +0800, Lecopzer Chen wrote:
> > > > > > > > Linux support KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > > > > > > > ("kasan: support backing vmalloc space with real shadow memory")
> > > > > > > >
> > > > > > > > Like how the MODULES_VADDR does now, just not to early populate
> > > > > > > > the VMALLOC_START between VMALLOC_END.
> > > > > > > > similarly, the kernel code mapping is now in the VMALLOC area and
> > > > > > > > should keep these area populated.
> > > > > > > >
> > > > > > > > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > > > > > > > ---
> > > > > > > >  arch/arm64/mm/kasan_init.c | 23 ++++++++++++++++++-----
> > > > > > > >  1 file changed, 18 insertions(+), 5 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> > > > > > > > index d8e66c78440e..39b218a64279 100644
> > > > > > > > --- a/arch/arm64/mm/kasan_init.c
> > > > > > > > +++ b/arch/arm64/mm/kasan_init.c
> > > > > > > > @@ -214,6 +214,7 @@ static void __init kasan_init_shadow(void)
> > > > > > > >  {
> > > > > > > >   u64 kimg_shadow_start, kimg_shadow_end;
> > > > > > > >   u64 mod_shadow_start, mod_shadow_end;
> > > > > > > > + u64 vmalloc_shadow_start, vmalloc_shadow_end;
> > > > > > > >   phys_addr_t pa_start, pa_end;
> > > > > > > >   u64 i;
> > > > > > > >
> > > > > > > > @@ -223,6 +224,9 @@ static void __init kasan_init_shadow(void)
> > > > > > > >   mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
> > > > > > > >   mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
> > > > > > > >
> > > > > > > > + vmalloc_shadow_start = (u64)kasan_mem_to_shadow((void *)VMALLOC_START);
> > > > > > > > + vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
> > > > > > > > +
> > > > > > > >   /*
> > > > > > > >    * We are going to perform proper setup of shadow memory.
> > > > > > > >    * At first we should unmap early shadow (clear_pgds() call below).
> > > > > > > > @@ -241,12 +245,21 @@ static void __init kasan_init_shadow(void)
> > > > > > > >
> > > > > > > >   kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
> > > > > > > >                              (void *)mod_shadow_start);
> > > > > > > > - kasan_populate_early_shadow((void *)kimg_shadow_end,
> > > > > > > > -                            (void *)KASAN_SHADOW_END);
> > > > > > > > + if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
> > > > > > >
> > > > > > > Do we really need yet another CONFIG option for KASAN? What's the use-case
> > > > > > > for *not* enabling this if you're already enabling one of the KASAN
> > > > > > > backends?
> > > > > >
> > > > > > As I know, KASAN_VMALLOC now only supports KASAN_GENERIC and also
> > > > > > KASAN_VMALLOC uses more memory to map real shadow memory (1/8 of vmalloc va).
> > > > >
> > > > > The shadow is allocated dynamically though, isn't it?
> > > >
> > > > Yes, but It's still a cost.
> > > >
> > > > > > There should be someone can enable KASAN_GENERIC but can't use VMALLOC
> > > > > > due to memory issue.
> > > > >
> > > > > That doesn't sound particularly realistic to me. The reason I'm pushing here
> > > > > is because I would _really_ like to move to VMAP stack unconditionally, and
> > > > > that would effectively force KASAN_VMALLOC to be set if KASAN is in use.
> > > > >
> > > > > So unless there's a really good reason not to do that, please can we make
> > > > > this unconditional for arm64? Pretty please?
> > > >
> > > > I think it's fine since we have a good reason.
> > > > Also if someone have memory issue in KASAN_VMALLOC,
> > > > they can use SW_TAG, right?
> > > >
> > > > However the SW_TAG/HW_TAG is not supported VMALLOC yet.
> > > > So the code would be like
> > > >
> > > >       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> > >
> > > Just make this CONFIG_KASAN_VMALLOC, since that depends on KASAN_GENERIC.
> > >
> > > >               /* explain the relationship between
> > > >                * KASAN_GENERIC and KASAN_VMALLOC in arm64
> > > >                * XXX: because we want VMAP stack....
> > > >                */
> > >
> > > I don't understand the relation with SW_TAGS. The VMAP_STACK dependency is:
> > >
> > >         depends on !KASAN || KASAN_HW_TAGS || KASAN_VMALLOC
> >
> > This means that VMAP_STACK can be only enabled if KASAN_HW_TAGS=y or
> > if KASAN_VMALLOC=y for other modes.
> >
> > >
> > > which doesn't mention SW_TAGS at all. So that seems to imply that SW_TAGS
> > > and VMAP_STACK are mutually exclusive :(
> >
> > SW_TAGS doesn't yet have vmalloc support, so it's not compatible with
> > VMAP_STACK. Once vmalloc support is added to SW_TAGS, KASAN_VMALLOC
> > should be allowed to be enabled with SW_TAGS. This series is a step
> > towards having that support, but doesn't implement it. That will be a
> > separate effort.
>
> Ok, thanks. Then I think we should try to invert the dependency here, if
> possible, so that the KASAN backends depend on !VMAP_STACK if they don't
> support it, rather than silently disabling VMAP_STACK when they are
> selected.

SGTM. Not sure if I will get to this in the nearest future, so I filed
a bug: https://bugzilla.kernel.org/show_bug.cgi?id=211581

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

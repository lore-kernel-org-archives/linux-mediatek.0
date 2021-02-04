Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DD7C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 15:01:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07F1E64DE7
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 15:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07F1E64DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OYJo364QxiQUPjMyK/9Obso89xxXdpZz1TGF6qYF3t4=; b=m+G7H/lJw3RMzSdrUneEu80X7
	OSpJ+XrSWlpId7JmFvtxwcj9VrvY4DoxFOPAhggef0akN8D2r84zKOMToqgFnDFIH7t2V7CysIdmW
	dy+CPby3vVF6pIvBlOwn5EvO+li6LKUlI2m3vmk/GQ54O4csZNVarjyUPCqjO1JbxzGozC/39TRo6
	nSSawLDKjmEQENXxsTWW0g5i+6N4QVFXEvjIgX/tQl4MWxqHxTZEt/GY0jjAX1+iN1c0ZT2SkvRcU
	YaoReb8lG+wwJqVuNPOMIC3VuM4kTQRgl85sA7br9L7G+ivAw8Ob0kfLEFol6ST37ET4P6CmLHv9n
	vR5WdNQ3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7g89-0006a9-2K; Thu, 04 Feb 2021 15:01:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7g84-0006Yn-Ru; Thu, 04 Feb 2021 15:01:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F1F364DBA;
 Thu,  4 Feb 2021 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612450867;
 bh=X3nDmJLqqvOAm1bXasPKKjZSRX+UA/YVvHhs0nTd4PE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mg4bHqG1JiGD+kFpfyB7KEAJYbxncHFMReA4zfD++ymeCwsVKBWNIfoI4buqLZUoJ
 ohLIbTf2EidP0Mxo2YG6rqVGliuVwtlOAoRbQK4nJPtXk7zg7q0166rsx3lGydAqoC
 U2UoZ6WXgGwJ+HYL/oAmzNDtkyryGVFypiM5sGtafFhTCpok9WYOn4IA1VKGyI46W9
 WO8/IItQpXGt02EujFUGVoU3orj4aRW/ERrrwvCuDWssqzDE/5/DK/Ba99eunJbxnC
 DINnx62rYn9eMMFfhELFw+UDZgfcz5J4l3i1Lm8sTdjnLkMGnaYoWpFMOSfcoFjunr
 Xx4S47isXTL2w==
Date: Thu, 4 Feb 2021 15:01:01 +0000
From: Will Deacon <will@kernel.org>
To: Lecopzer Chen <lecopzer@gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
Message-ID: <20210204150100.GE20815@willie-the-truck>
References: <20210204124543.GA20468@willie-the-truck>
 <20210204144612.75582-1-lecopzer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204144612.75582-1-lecopzer@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_100109_035568_9D66A00B 
X-CRM114-Status: GOOD (  22.23  )
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
Cc: lecopzer.chen@mediatek.com, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tyhicks@linux.microsoft.com,
 glider@google.com, vincenzo.frascino@arm.com, ardb@kernel.org,
 yj.chiang@mediatek.com, kasan-dev@googlegroups.com, dvyukov@google.com,
 aryabinin@virtuozzo.com, linux@roeck-us.net, andreyknvl@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org,
 gustavoars@kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 04, 2021 at 10:46:12PM +0800, Lecopzer Chen wrote:
> > On Sat, Jan 09, 2021 at 06:32:49PM +0800, Lecopzer Chen wrote:
> > > Linux support KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > > ("kasan: support backing vmalloc space with real shadow memory")
> > > 
> > > Like how the MODULES_VADDR does now, just not to early populate
> > > the VMALLOC_START between VMALLOC_END.
> > > similarly, the kernel code mapping is now in the VMALLOC area and
> > > should keep these area populated.
> > > 
> > > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > > ---
> > >  arch/arm64/mm/kasan_init.c | 23 ++++++++++++++++++-----
> > >  1 file changed, 18 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> > > index d8e66c78440e..39b218a64279 100644
> > > --- a/arch/arm64/mm/kasan_init.c
> > > +++ b/arch/arm64/mm/kasan_init.c
> > > @@ -214,6 +214,7 @@ static void __init kasan_init_shadow(void)
> > >  {
> > >  	u64 kimg_shadow_start, kimg_shadow_end;
> > >  	u64 mod_shadow_start, mod_shadow_end;
> > > +	u64 vmalloc_shadow_start, vmalloc_shadow_end;
> > >  	phys_addr_t pa_start, pa_end;
> > >  	u64 i;
> > >  
> > > @@ -223,6 +224,9 @@ static void __init kasan_init_shadow(void)
> > >  	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
> > >  	mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
> > >  
> > > +	vmalloc_shadow_start = (u64)kasan_mem_to_shadow((void *)VMALLOC_START);
> > > +	vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
> > > +
> > >  	/*
> > >  	 * We are going to perform proper setup of shadow memory.
> > >  	 * At first we should unmap early shadow (clear_pgds() call below).
> > > @@ -241,12 +245,21 @@ static void __init kasan_init_shadow(void)
> > >  
> > >  	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
> > >  				   (void *)mod_shadow_start);
> > > -	kasan_populate_early_shadow((void *)kimg_shadow_end,
> > > -				   (void *)KASAN_SHADOW_END);
> > > +	if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
> > 
> > Do we really need yet another CONFIG option for KASAN? What's the use-case
> > for *not* enabling this if you're already enabling one of the KASAN
> > backends?
> 
> As I know, KASAN_VMALLOC now only supports KASAN_GENERIC and also
> KASAN_VMALLOC uses more memory to map real shadow memory (1/8 of vmalloc va).

The shadow is allocated dynamically though, isn't it?

> There should be someone can enable KASAN_GENERIC but can't use VMALLOC
> due to memory issue.

That doesn't sound particularly realistic to me. The reason I'm pushing here
is because I would _really_ like to move to VMAP stack unconditionally, and
that would effectively force KASAN_VMALLOC to be set if KASAN is in use.

So unless there's a really good reason not to do that, please can we make
this unconditional for arm64? Pretty please?

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB8FC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 18:37:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F22964F50
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 18:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F22964F50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xPQuDz+1ox7ssr6V0/9XFRTiFo2JYkhWfN6FH9zEQ9g=; b=eOj2Ex6OUWROIVYCA+/FrEi43
	kCAYugfN+SR+hQqqfEatakyo9ZDTvLXxDfg+E5zYqL/pXV3uQgO6ufZeOYPSzsBlHEgFYfLHV+L8w
	JTqcDWausGEeo1jPHvE4fyt9a3h2wdBy27N9Auqa1hvxaJ1gA+Rl+ey21vobU29Exdpd5pbZwbLjB
	NhzZJDt8tp6POuudNLoDtwv2BGJAbxDADTRrVMk7DHxgykI2cLHZrs+Upi49Qrn48BQ7LrOoYqW02
	0dACC3ByBsLDSMzfpYALG3u2OPG6sz0c6XFXJc68SXqICx2U6uB3ax7S6jSzgyRhDrkfLs2Fk8XAr
	vyXYu1D5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7N1z-0005uI-EI; Wed, 03 Feb 2021 18:37:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7N1v-0005tW-N0; Wed, 03 Feb 2021 18:37:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B185864E34;
 Wed,  3 Feb 2021 18:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612377450;
 bh=3giaFRH1j9PVmzyZwv3HjY0DTQs3tZkZzQ8m1nc4mNg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UKpOsqrXPhh2J4MabEYv9pDGdajv4XjOL7hpTw2yiP+4kYP4oJo8FVd0iHO6eLA+d
 uUxt+1U0/Y7RFnuzOGAQigFDWYuTKbC5dVhZk71coTGV5MT/IX8PoN+8XQMsXlEuy/
 DSEFwVrLUmKKZtoy3KCaPhjNzA2hdantHnAHWC91GpHYfiYKawj/Hw/xGFrWs3qwSb
 buJ0AhEwkX3UXUOmaxEF+DNxV2KP7lfRUNJbTCxWYNp8/PqOoJJ3DZ0Gucefn8UIQl
 2vNbkpA8mw7Z+kmelm61kFgflvIjghJU/9bNHmQ3YZZabrpJNCdv4T6b1Tuf/XUaJO
 fuCqWe4BgPnWg==
Received: by mail-oi1-f172.google.com with SMTP id h6so925022oie.5;
 Wed, 03 Feb 2021 10:37:30 -0800 (PST)
X-Gm-Message-State: AOAM531OxJnAocc7p89OyOoQoiXhhDR8CeTx1UQ5ZCNlx7CpxRD1oFjZ
 5s/oWoH9Pxg10BVWr/1JPFNvYuUh4MOkTVDZT60=
X-Google-Smtp-Source: ABdhPJwTcKGhhrhcSXeU83MadiHuFOevZ5EXyyScTqYjD6/o+QLIP4TAi8X/UM98hvguCOQr900onLCBTaId+ZK8RP4=
X-Received: by 2002:aca:ea0b:: with SMTP id i11mr2899751oih.33.1612377449888; 
 Wed, 03 Feb 2021 10:37:29 -0800 (PST)
MIME-Version: 1.0
References: <20210109103252.812517-1-lecopzer@gmail.com>
 <20210109103252.812517-2-lecopzer@gmail.com>
In-Reply-To: <20210109103252.812517-2-lecopzer@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 3 Feb 2021 19:37:18 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEMOeCZTvNqPPk-uL5iA7hx7SFPwkq3Oz3yYefn=tVnPQ@mail.gmail.com>
Message-ID: <CAMj1kXEMOeCZTvNqPPk-uL5iA7hx7SFPwkq3Oz3yYefn=tVnPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
To: Lecopzer Chen <lecopzer@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_133731_912858_5B66701D 
X-CRM114-Status: GOOD (  20.93  )
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
 Catalin Marinas <catalin.marinas@arm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Tyler Hicks <tyhicks@linux.microsoft.com>,
 Alexander Potapenko <glider@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 yj.chiang@mediatek.com, kasan-dev <kasan-dev@googlegroups.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Guenter Roeck <linux@roeck-us.net>,
 Andrey Konovalov <andreyknvl@google.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 9 Jan 2021 at 11:33, Lecopzer Chen <lecopzer@gmail.com> wrote:
>
> Linux support KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> ("kasan: support backing vmalloc space with real shadow memory")
>
> Like how the MODULES_VADDR does now, just not to early populate
> the VMALLOC_START between VMALLOC_END.
> similarly, the kernel code mapping is now in the VMALLOC area and
> should keep these area populated.
>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>


This commit log text is a bit hard to follow. You are saying that the
vmalloc region is *not* backed with zero shadow or any default mapping
at all, right, and everything gets allocated on demand, just like is
the case for modules?

> ---
>  arch/arm64/mm/kasan_init.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index d8e66c78440e..39b218a64279 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -214,6 +214,7 @@ static void __init kasan_init_shadow(void)
>  {
>         u64 kimg_shadow_start, kimg_shadow_end;
>         u64 mod_shadow_start, mod_shadow_end;
> +       u64 vmalloc_shadow_start, vmalloc_shadow_end;
>         phys_addr_t pa_start, pa_end;
>         u64 i;
>
> @@ -223,6 +224,9 @@ static void __init kasan_init_shadow(void)
>         mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
>         mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
>
> +       vmalloc_shadow_start = (u64)kasan_mem_to_shadow((void *)VMALLOC_START);
> +       vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
> +


This and the below seems overly complicated, given that VMALLOC_START
== MODULES_END. Can we simplify this?

>         /*
>          * We are going to perform proper setup of shadow memory.
>          * At first we should unmap early shadow (clear_pgds() call below).
> @@ -241,12 +245,21 @@ static void __init kasan_init_shadow(void)
>
>         kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
>                                    (void *)mod_shadow_start);
> -       kasan_populate_early_shadow((void *)kimg_shadow_end,
> -                                  (void *)KASAN_SHADOW_END);
> +       if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
> +               kasan_populate_early_shadow((void *)vmalloc_shadow_end,
> +                                           (void *)KASAN_SHADOW_END);
> +               if (vmalloc_shadow_start > mod_shadow_end)
> +                       kasan_populate_early_shadow((void *)mod_shadow_end,
> +                                                   (void *)vmalloc_shadow_start);
> +
> +       } else {
> +               kasan_populate_early_shadow((void *)kimg_shadow_end,
> +                                           (void *)KASAN_SHADOW_END);
> +               if (kimg_shadow_start > mod_shadow_end)
> +                       kasan_populate_early_shadow((void *)mod_shadow_end,
> +                                                   (void *)kimg_shadow_start);
> +       }
>
> -       if (kimg_shadow_start > mod_shadow_end)
> -               kasan_populate_early_shadow((void *)mod_shadow_end,
> -                                           (void *)kimg_shadow_start);
>
>         for_each_mem_range(i, &pa_start, &pa_end) {
>                 void *start = (void *)__phys_to_virt(pa_start);
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

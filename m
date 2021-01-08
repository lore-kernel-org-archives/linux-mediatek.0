Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A675C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:26:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9E4823A79
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9E4823A79
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zrsmmPuTVVFnXEARdNwmkq8etqDPuV6wVccKRB7G4U4=; b=GnwyNUpwoyAITanK5Qh737AFs
	RzAgir5uyrXoWu29/zJxj7sT78MidudxQvgp4ZmHlzOpU/TbrELe3RdFLdg5PN5IU1ddbpgRDoD28
	DrepPdE+dHvnm29zPDIq6kb+WRIxxlJnYvhz9X8UtpT1ESaMOa1UR/4mmT2olZLZwhkmiHZLmiQko
	eT9z8UQrK3fRRj9zzlULlgAk4JtwJ0gFqm08rhzRSG9QC3TmBBeHEUNY15jxLvBTwgUW1voVmd/D7
	KaQosg3s249sEh+5xZGmE6wiwPIkD4p/UOls/aOBxzFS8EJ6nMtgh7HBD6kHaZAm7D7bbwWxvNSQO
	GZOCWPNpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxwSU-0005L7-Lq; Fri, 08 Jan 2021 18:25:58 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxwSS-0005JS-9k
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 18:25:57 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2so6766392pfq.5
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 10:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0EAbk42/5hnLn57GbgtjDwqdHR3jfIYT2uMLmHPvJts=;
 b=GmQA0TK1/fTvWRYlbX8p4NPq4WB22Wg7Ywbvgze/EhfVQshxKbzRchG+vtkcGQuoef
 R1n3DPD6AwLpB0NZ6vsDh6tsbfOQdqPWqWbwLhZ2z9NFT2R93LSkpRXtt9ixq6WY6ZRM
 1WyDPU8zCGq4TLif15/bk4JUs6ujHJ25HFJydxDHv63V+iRTHSRGHeXVCB7uQH8q0+l1
 sopBNNW0T04cFEroSGKOLkgAjG/QP80skKIH3DiMsBocEd6MmwUik3QEgj51blSfLrw+
 kxI2d3CDwr0ony4tio4VgC0RbmYV7iTNwGvdKwsTV9hTMcXKx6gvb5g6x3Ne4JR787kN
 Iunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0EAbk42/5hnLn57GbgtjDwqdHR3jfIYT2uMLmHPvJts=;
 b=Lsq9DORT+ms0TzEfQk96elUcEX7KQEoUdvleFe7Oj6IFuVRV/eV5xvgrkZSDqocrzS
 gFz4lgkFPh6Cr3E6dwRHFrGPtXRogB9YA1SPhLMj//1HreKUawTmxOGffeDNgbEAe++x
 n/T004HJ/SHPB/hg8uHE0ky623ldY5gSnAhXO5rY4Cv49nVxaCw0c1PZVQuK8slqt4ZV
 S+wAfo7V62s4OcadWp0AXf1VDfczLiN9G7kuC0ij0GaJXhyqmTlZrqLtUcm+LOdu7Ozf
 RvjIljPYOO9g0iDadzHn6BWF/eVjPVI1khPNOO/mc8XjAe7GZshteMc0AJ4Ph3rdWEqb
 jXTg==
X-Gm-Message-State: AOAM531YxfD8BQu+bF8vkW7HQGoSGWPU44QATP/WZ3q3jJRwsaXZsNti
 tzoMAO6PEn9nZW5ceTTuTZGhybhWIFcz7MD0kBvJDg==
X-Google-Smtp-Source: ABdhPJyIbSeQV6YmcwWirU9XjduVAgHbx7V4PDlg5rOhCznobe6ijBKgyvJ9t3YwNnsM4pixotFS5VtXnV7o52yaQTg=
X-Received: by 2002:a62:2585:0:b029:1ab:7fb7:b965 with SMTP id
 l127-20020a6225850000b02901ab7fb7b965mr4980449pfl.2.1610130353786; Fri, 08
 Jan 2021 10:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20210103135621.83129-1-lecopzer@gmail.com>
In-Reply-To: <20210103135621.83129-1-lecopzer@gmail.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 8 Jan 2021 19:25:42 +0100
Message-ID: <CAAeHK+z0+hWBFha8Upu7JN-_ruBopzUkNKgBoihUPt1w6k8auA@mail.gmail.com>
Subject: Re: [PATCH] kasan: fix unaligned address is unhandled in
 kasan_remove_zero_shadow
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_132556_419796_8D74BB75 
X-CRM114-Status: GOOD (  19.64  )
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
 Lecopzer Chen <lecopzer@gmail.com>, yj.chiang@mediatek.com,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>, linux-mediatek@lists.infradead.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 3, 2021 at 2:56 PM Lecopzer Chen <lecopzer@gmail.com> wrote:
>
> During testing kasan_populate_early_shadow and kasan_remove_zero_shadow,
> if the shadow start and end address in kasan_remove_zero_shadow() is
> not aligned to PMD_SIZE, the remain unaligned PTE won't be removed.
>
> In the test case for kasan_remove_zero_shadow():
>     shadow_start: 0xffffffb802000000, shadow end: 0xffffffbfbe000000
>     3-level page table:
>       PUD_SIZE: 0x40000000 PMD_SIZE: 0x200000 PAGE_SIZE: 4K
> 0xffffffbf80000000 ~ 0xffffffbfbdf80000 will not be removed because
> in kasan_remove_pud_table(), kasan_pmd_table(*pud) is true but the
> next address is 0xffffffbfbdf80000 which is not aligned to PUD_SIZE.
>
> In the correct condition, this should fallback to the next level
> kasan_remove_pmd_table() but the condition flow always continue to skip
> the unaligned part.
>
> Fix by correcting the condition when next and addr are neither aligned.
>
> Fixes: 0207df4fa1a86 ("kernel/memremap, kasan: make ZONE_DEVICE with work with KASAN")
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  mm/kasan/init.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/mm/kasan/init.c b/mm/kasan/init.c
> index 67051cfae41c..ae9158f7501f 100644
> --- a/mm/kasan/init.c
> +++ b/mm/kasan/init.c
> @@ -372,9 +372,10 @@ static void kasan_remove_pmd_table(pmd_t *pmd, unsigned long addr,
>
>                 if (kasan_pte_table(*pmd)) {
>                         if (IS_ALIGNED(addr, PMD_SIZE) &&
> -                           IS_ALIGNED(next, PMD_SIZE))
> +                           IS_ALIGNED(next, PMD_SIZE)) {
>                                 pmd_clear(pmd);
> -                       continue;
> +                               continue;
> +                       }
>                 }
>                 pte = pte_offset_kernel(pmd, addr);
>                 kasan_remove_pte_table(pte, addr, next);
> @@ -397,9 +398,10 @@ static void kasan_remove_pud_table(pud_t *pud, unsigned long addr,
>
>                 if (kasan_pmd_table(*pud)) {
>                         if (IS_ALIGNED(addr, PUD_SIZE) &&
> -                           IS_ALIGNED(next, PUD_SIZE))
> +                           IS_ALIGNED(next, PUD_SIZE)) {
>                                 pud_clear(pud);
> -                       continue;
> +                               continue;
> +                       }
>                 }
>                 pmd = pmd_offset(pud, addr);
>                 pmd_base = pmd_offset(pud, 0);
> @@ -423,9 +425,10 @@ static void kasan_remove_p4d_table(p4d_t *p4d, unsigned long addr,
>
>                 if (kasan_pud_table(*p4d)) {
>                         if (IS_ALIGNED(addr, P4D_SIZE) &&
> -                           IS_ALIGNED(next, P4D_SIZE))
> +                           IS_ALIGNED(next, P4D_SIZE)) {
>                                 p4d_clear(p4d);
> -                       continue;
> +                               continue;
> +                       }
>                 }
>                 pud = pud_offset(p4d, addr);
>                 kasan_remove_pud_table(pud, addr, next);
> @@ -456,9 +459,10 @@ void kasan_remove_zero_shadow(void *start, unsigned long size)
>
>                 if (kasan_p4d_table(*pgd)) {
>                         if (IS_ALIGNED(addr, PGDIR_SIZE) &&
> -                           IS_ALIGNED(next, PGDIR_SIZE))
> +                           IS_ALIGNED(next, PGDIR_SIZE)) {
>                                 pgd_clear(pgd);
> -                       continue;
> +                               continue;
> +                       }
>                 }
>
>                 p4d = p4d_offset(pgd, addr);
> --
> 2.25.1

Andrey, could you please take a look at this change?

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

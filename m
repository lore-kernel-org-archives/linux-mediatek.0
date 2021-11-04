Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EBAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 12:48:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76B17611C3
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 12:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76B17611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Il8Yg5oFPrdccR/fSiCHrZ38YEXPVBBH57GACQi3Pik=; b=ATQtovobsHKwlm
	PoPwRd5KhfO2bF352hhlnWcoSPCS2kmbTCEaHwR3IJdAthHm81j277ki7mzLiutQOeZ2zKtKAozGI
	kclmhFtwWbsElcZz9UImqdx98QCudMDGOqmT2pXah6VcRAbIzrD0z5JugL26xiKt8/FY/LSZzaXRz
	1Vr9hKyiOE4LQR9lDbawnnQEmM7J8LI5/mUQdUm9oToJ4x/n/4ULo/Y9MDPDHjRqoSAuC4MRtg8fF
	Uxe+tOv7UztLRbPssjd+ngKo41g7gdEZmvWrN3/yemvxTT6Xn2SSpuxPMdJKRSTLohIOtK4YWFm0W
	U5PoHLZLhAIpuLcO5idA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mic9l-008vm2-Uk; Thu, 04 Nov 2021 12:47:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mic9Z-008viU-FG; Thu, 04 Nov 2021 12:47:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F297961212;
 Thu,  4 Nov 2021 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636030057;
 bh=O89SG59ERFkapOwq86PzKcmSXMmROh38ILRsxSPw7zc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NkVY/z4nKKOIiV+FAlAYP4CIOPVfOdOIXOVrJ28PzkuGjbmTTp9QMS6iv95Pqanb5
 SxsyDjL6k5M5pKl0geFwZUtsYdyn61mbu6j8lVjeGa1rJ3OCOjQknbrpbtD3OHKqFO
 8JXN4VgtvAR6DfEWJYF0MVQDbb9IGM0u8Ogj+furg7fUXYf9M2Ouo3NwxxXw1xD9dd
 OWHkGbkDj+Ol3vS7ZSVWe1FE96jH3benjEO8jjoh0pbr509+J0dSEy65dyPd74zpse
 EO/c0Ov2JvPuVikEuXwF7ptU2M776WjRL41ZGMztkdyNL66tUcmn8VIT/Feaf63GMD
 gyWqavMuKETOQ==
Received: by mail-ot1-f49.google.com with SMTP id
 q33-20020a056830442100b0055abeab1e9aso8068923otv.7; 
 Thu, 04 Nov 2021 05:47:36 -0700 (PDT)
X-Gm-Message-State: AOAM531pfwCKGinSo4JsYdAcOpWJJMPam4hhyTnMXpNuy7uSu6NI3bfR
 vNeUHXflwm8najAxZBeqjh/fO9QGGjT10oIwOY8=
X-Google-Smtp-Source: ABdhPJxhWjJHaSYxFkhh2iWefDx6Z+2GQYHsj7ZwDXxYFvelaU3rJtXffw/e5rsmEHaDNyuzdbd+XCXcawBw+m5Y8K0=
X-Received: by 2002:a9d:5911:: with SMTP id t17mr39447582oth.30.1636030056196; 
 Thu, 04 Nov 2021 05:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211104023221.16391-1-walter-zh.wu@mediatek.com>
 <20211104085336.GA24260@lst.de>
 <CAMj1kXHjjmhCVzKFhAseMGOdnidmFT=+o+vwKLTCGFkpwHmcfQ@mail.gmail.com>
 <cc893162f0e2c81a1d64bf85794cc77ae76cadce.camel@mediatek.com>
In-Reply-To: <cc893162f0e2c81a1d64bf85794cc77ae76cadce.camel@mediatek.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 4 Nov 2021 13:47:24 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG0DmLXQgfv2N1nhNdXgnXOiK2Rv7D+boSdW9_C=wsowA@mail.gmail.com>
Message-ID: <CAMj1kXG0DmLXQgfv2N1nhNdXgnXOiK2Rv7D+boSdW9_C=wsowA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-direct: improve DMA_ATTR_NO_KERNEL_MAPPING
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 wsd_upstream <wsd_upstream@mediatek.com>, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_054737_596697_0FBA1FC4 
X-CRM114-Status: GOOD (  31.86  )
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

On Thu, 4 Nov 2021 at 13:31, Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> On Thu, 2021-11-04 at 09:57 +0100, Ard Biesheuvel wrote:
> > On Thu, 4 Nov 2021 at 09:53, Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > On Thu, Nov 04, 2021 at 10:32:21AM +0800, Walter Wu wrote:
> > > > diff --git a/include/linux/set_memory.h
> > > > b/include/linux/set_memory.h
> > > > index f36be5166c19..6c7d1683339c 100644
> > > > --- a/include/linux/set_memory.h
> > > > +++ b/include/linux/set_memory.h
> > > > @@ -7,11 +7,16 @@
> > > >
> > > >  #ifdef CONFIG_ARCH_HAS_SET_MEMORY
> > > >  #include <asm/set_memory.h>
> > > > +
> > > > +#ifndef CONFIG_RODATA_FULL_DEFAULT_ENABLED
> > >
> > > This is an arm64-specific symbol, and one that only controls a
> > > default.  I don't think it is suitable to key off stubs in common
> > > code.
> > >
> > > > +static inline int set_memory_valid(unsigned long addr, int
> > > > numpages, int enable) { return 0; }
> > >
> > > Pleae avoid overly long lines.
> > >
> > > > +             if (IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED))
> > > > {
> > > > +                     kaddr = (unsigned
> > > > long)phys_to_virt(dma_to_phys(dev, *dma_handle));
> > >
> > > This can just use page_address.
> > >
> > > > +                     /* page remove kernel mapping for arm64 */
> > > > +                     set_memory_valid(kaddr, size >> PAGE_SHIFT,
> > > > 0);
> > > > +             }
> > >
> > > But more importantly:  set_memory_valid only exists on arm64, this
> > > will break compile everywhere else.  And this API is complete crap.
> > > Passing kernel virtual addresses as unsigned long just sucks, and
> > > passing an integer argument for valid/non-valid also is a horrible
> > > API.
> > >
> >
> > ... and as I pointed out before, you can still pass rodata=off on
> > arm64, and get the old behavior, in which case bad things will happen
> > if you try to use an API that expects to operate on page mappings
> > with
> > a 1 GB block mapping.
> >
>
> Thanks for your suggestion.
>
>
> > And you still haven't explained what the actual problem is: is this
> > about CPU speculation corrupting non-cache coherent inbound DMA?
>
> No corrupiton, only cpu read it, we hope to fix the behavior.
>

Fix which behavior? Please explain

1) the current behavior
2) why the current behavior is problematic for you
3) how this patch changes the current behavior
4) why the new behavior fixes your problem.

There is no penalty for using too many words.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

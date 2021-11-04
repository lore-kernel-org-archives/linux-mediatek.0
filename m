Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B4CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 08:57:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DE416112D
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 08:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DE416112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7URcGN1tqDB3YyzjkqzkF1E1uOwbAuc+qKLEmrDdQNA=; b=SS8OR5gE5jM9yA
	boTBoWWzcPSHPfF2sSxhJ72FC/P5ZERpYkoFvgZvlSm0o/OmbVIIEoVlKcJlxKkJING9fSLjSeElC
	Ih7wORyDmEeSlfKkxwC94QzO/oXQCMCJg82SbTQzhJ5DCN7HSGTZkfgDm1S8f3dr7J8yj6B5fdUuE
	ZXxJlbZWNSaYJJFEE5j3X1f4tP37KM3KPNArthROUSLSqJfbQilABNgAUlOVq6Im6QfCO+sdg3Eag
	4BYWKjQnzVyziCUjXxUD/pKv3dcervdHEmX5fS4x+Yskkusr+VsBS7bk6MY0jhhDXl2BUw/1RTBYP
	bmHGTcUyP0u2VcIM+9Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miYYt-008O6E-Ga; Thu, 04 Nov 2021 08:57:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miYYd-008NzO-Vo; Thu, 04 Nov 2021 08:57:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91C6F611C1;
 Thu,  4 Nov 2021 08:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636016235;
 bh=9GnYflMSk1zGFDWqohvW6i+zYCvs8Ks+GwVIYMqi16Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TBjb9Yu61yn/io080EO5vexYHENH6T7Lc7zLulpV4rVCAMEzD+5IYIl9FCopcoxGX
 hLn1N6Kl9HU56L3Kt5pg8tWCJyZLVItmlLVmFQVeKtAsPg4qTTpJzGki/i7C/CB/JX
 l4F5cpuY8O4obR0uYFU7oKhS4gB2gTOzbUBRI/KYHRdABd9wWNZKqHl0l+k6zHnv9J
 EqYXt6LB0IVoLQuFoepOMNsuCafp6++z218lKGjaczRzHb8M23EA6+XeGwbtF4L70b
 K4BULyibwTZfQh8ApaDsqsULqUzVX9FwzPNN1jsUPHDlLIj89R9Vw7CbywbjAmW4PJ
 xGG7TO/NgsioQ==
Received: by mail-oo1-f43.google.com with SMTP id
 y186-20020a4a45c3000000b002bcf06b1c38so1709951ooa.6; 
 Thu, 04 Nov 2021 01:57:15 -0700 (PDT)
X-Gm-Message-State: AOAM533Ikc6g+uBDELW9DfRwFvaEHwVSdLnwlfeC00/v/W3CE71DmGCz
 rWQoSrKxH3Om+D0cOqJCfTELS3o9Kwk5NQ1lw9g=
X-Google-Smtp-Source: ABdhPJydgSUDDybkK0rHy627UMULvyYtlQWf9i2EfDmp2/C1uqN/3mY4roW+glGzK3Rt8ZzaI1IEXHbY8JpIAFCo8f4=
X-Received: by 2002:a4a:e1a3:: with SMTP id 3mr2689882ooy.32.1636016234879;
 Thu, 04 Nov 2021 01:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211104023221.16391-1-walter-zh.wu@mediatek.com>
 <20211104085336.GA24260@lst.de>
In-Reply-To: <20211104085336.GA24260@lst.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 4 Nov 2021 09:57:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHjjmhCVzKFhAseMGOdnidmFT=+o+vwKLTCGFkpwHmcfQ@mail.gmail.com>
Message-ID: <CAMj1kXHjjmhCVzKFhAseMGOdnidmFT=+o+vwKLTCGFkpwHmcfQ@mail.gmail.com>
Subject: Re: [PATCH v2] dma-direct: improve DMA_ATTR_NO_KERNEL_MAPPING
To: Christoph Hellwig <hch@lst.de>
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 wsd_upstream <wsd_upstream@mediatek.com>, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_015716_070899_FD813CCE 
X-CRM114-Status: GOOD (  21.97  )
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

On Thu, 4 Nov 2021 at 09:53, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Nov 04, 2021 at 10:32:21AM +0800, Walter Wu wrote:
> > diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> > index f36be5166c19..6c7d1683339c 100644
> > --- a/include/linux/set_memory.h
> > +++ b/include/linux/set_memory.h
> > @@ -7,11 +7,16 @@
> >
> >  #ifdef CONFIG_ARCH_HAS_SET_MEMORY
> >  #include <asm/set_memory.h>
> > +
> > +#ifndef CONFIG_RODATA_FULL_DEFAULT_ENABLED
>
> This is an arm64-specific symbol, and one that only controls a
> default.  I don't think it is suitable to key off stubs in common
> code.
>
> > +static inline int set_memory_valid(unsigned long addr, int numpages, int enable) { return 0; }
>
> Pleae avoid overly long lines.
>
> > +             if (IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED)) {
> > +                     kaddr = (unsigned long)phys_to_virt(dma_to_phys(dev, *dma_handle));
>
> This can just use page_address.
>
> > +                     /* page remove kernel mapping for arm64 */
> > +                     set_memory_valid(kaddr, size >> PAGE_SHIFT, 0);
> > +             }
>
> But more importantly:  set_memory_valid only exists on arm64, this
> will break compile everywhere else.  And this API is complete crap.
> Passing kernel virtual addresses as unsigned long just sucks, and
> passing an integer argument for valid/non-valid also is a horrible
> API.
>

... and as I pointed out before, you can still pass rodata=off on
arm64, and get the old behavior, in which case bad things will happen
if you try to use an API that expects to operate on page mappings with
a 1 GB block mapping.

And you still haven't explained what the actual problem is: is this
about CPU speculation corrupting non-cache coherent inbound DMA?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

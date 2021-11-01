Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDDFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 08:35:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5189C60E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 08:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5189C60E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3VBcZNN8nRHQSmSnRtL6xLPl076R9csD694OaDT8LfU=; b=0Qqvrz5k423JcD
	KGKuO69GzhGP4d0rBaWZDyQeSTiMh+k59E8/pJ5FPeNUt3nA0JERWSw9IVotXSuiNOc8BCkXMG4nd
	vOmXIcziA/D9E7KfGYzUUi7qWPkQGbd6QIBDusefmcx/SL+/CAkPu4IU5l4719iksVXJNTL/gjy2t
	qajIQMlvuRHWyDic6MrLS+m2bBgmBT8VYX9O96YPUX93hcWX1+lpfpQSa2ED5meC7gGdqY4eWKbbT
	zh78C/XnlVqiXS+WrFqkVFhOfMYU6aFVzXPJdgj0/brng9zlZL//iF1ZvCO0YHULjkMJSG7aDdC8V
	AEtatRqSwZSaFkDu8/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhSmc-00FgOu-KC; Mon, 01 Nov 2021 08:35:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhSmN-00FgLu-WD; Mon, 01 Nov 2021 08:34:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90C6660E98;
 Mon,  1 Nov 2021 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635755695;
 bh=obeo4arX2BcSuRDdS9k9PamPIZJFgpOtT0SeoVp8Vtg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UFIwWTzawtcc6PC1NEffH3E+HJQucMTcYfc9JzH6RVIkYZb+rJQkasPbW6qu9m8MJ
 mPLG2n/rxnrgZ+rQdM9GzYRdYMQEOSI22G1i04I6R0KEJDlB9Pzy9kGSv5H8j0y5xi
 zY+/083SME90EYoQQDb5teZHpmWIOQctHoLm3SPochR1kMZIml2NtWepojNHL8gAKl
 9xPNfy4tYedrmP4uwxSnOlzfvHHd6SlMnStCQ1OmnaunVp0juYfsOwzrFaSOXqNgfT
 SUHTYRDclf7O/64NTfRP2Rkb/LI17TTMCzFtqe0uMJ3mOsuMoIpTW/kKoGuWAr4cYD
 b0MVQph+yoprw==
Received: by mail-oi1-f170.google.com with SMTP id t4so23898888oie.5;
 Mon, 01 Nov 2021 01:34:55 -0700 (PDT)
X-Gm-Message-State: AOAM533KjsW5YAOIlYpYLK+qhNu03WUuR5P3ru5zGNi+NLXC1sDHLUSZ
 KKa1bD7GszUKzAbM2nZEAYg5jj0+PAmeQ7VhpfQ=
X-Google-Smtp-Source: ABdhPJw9u4sF3GagDkzYyWDjJxayAqxSo5SlRgNq8NAwK5VHTPb+bEN/WnF/aGaG9yS3U1m8w4dyOlys5a7lQf9P8zk=
X-Received: by 2002:aca:3cc1:: with SMTP id
 j184mr12787185oia.174.1635755694924; 
 Mon, 01 Nov 2021 01:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211101031558.7184-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20211101031558.7184-1-walter-zh.wu@mediatek.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 1 Nov 2021 09:34:43 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGqOzHM+J30TXR3-uZPkjHBCXB4CMkzZjHbbmptyU5W9w@mail.gmail.com>
Message-ID: <CAMj1kXGqOzHM+J30TXR3-uZPkjHBCXB4CMkzZjHbbmptyU5W9w@mail.gmail.com>
Subject: Re: [PATCH] dma-direct: fix DMA_ATTR_NO_KERNEL_MAPPING
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 wsd_upstream <wsd_upstream@mediatek.com>, linux-mediatek@lists.infradead.org, 
 Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_013456_101332_9054E646 
X-CRM114-Status: GOOD (  29.23  )
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

On Mon, 1 Nov 2021 at 04:17, Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> DMA_ATTR_NO_KERNEL_MAPPING is to avoid creating a kernel mapping
> for the allocated buffer, but current implementation is that
> PTE of allocated buffer in kernel page table is valid. So we
> should set invalid for PTE of allocate buffer so that there are
> no kernel mapping for the allocated buffer.
>
> In some cases, we don't hope the allocated buffer to be read
> by cpu or speculative execution, so we use DMA_ATTR_NO_KERNEL_MAPPING
> to get no kernel mapping in order to achieve this goal.
>
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  kernel/dma/direct.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 4c6c5e0635e3..aa10b4c5d762 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -13,6 +13,7 @@
>  #include <linux/vmalloc.h>
>  #include <linux/set_memory.h>
>  #include <linux/slab.h>
> +#include <asm/cacheflush.h>
>  #include "direct.h"
>
>  /*
> @@ -169,6 +170,9 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>                 if (!PageHighMem(page))
>                         arch_dma_prep_coherent(page, size);
>                 *dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> +               /* remove kernel mapping for pages */
> +               set_memory_valid((unsigned long)phys_to_virt(dma_to_phys(dev, *dma_handle)),
> +                               size >> PAGE_SHIFT, 0);

This only works if the memory is mapped at page granularity in the
linear region, and you cannot rely on that. Many architectures prefer
block mappings for the linear region, and arm64 will only use page
mappings if rodata=full is set (which is set by default but can be
overridden on the kernel command line)


>                 /* return the page pointer as the opaque cookie */
>                 return page;
>         }
> @@ -278,6 +282,10 @@ void dma_direct_free(struct device *dev, size_t size,
>
>         if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
>             !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev)) {
> +               size = PAGE_ALIGN(size);
> +               /* create kernel mapping for pages */
> +               set_memory_valid((unsigned long)phys_to_virt(dma_to_phys(dev, dma_addr)),
> +                               size >> PAGE_SHIFT, 1);
>                 /* cpu_addr is a struct page cookie, not a kernel address */
>                 dma_free_contiguous(dev, cpu_addr, size);
>                 return;
> --
> 2.18.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

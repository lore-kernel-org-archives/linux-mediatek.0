Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1112C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 12:21:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B7860249
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 12:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65B7860249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SC9SHt9FLLOXcIkwgGeg3LaRbc3U7MBpQ4ue40z4eBU=; b=JvcUMnYL95FvoE
	BPu1yBE7Gu0LOZZojqGQKECm7uhY3WvWOCljtN6UAfMalBgClH+/Dl+Ihuh7SnrD0NBkF6PuAxh1Q
	9D7StAxr34SaC4ZXIWyZptIo/xJgixnr7Zp++3aP0P27pCPxbdFMLOn5KgGxKChWgvaj/9upX9Xbz
	EW8tn+OOWRArdqj3VRBKvCBVu/a65/pWyV6eVOmu2HLH2LblwUaNwYlUmxnEehbjcqNxvSflEWdF0
	iAzF/BghfbSY/kRcMAcEAoq44NwCkIomKrnPU4Hh91sEQTt+0tK+ljNa36VdLoIFvQ6i2tkbJIyK6
	iPkl4TupdsgKjQO0awcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhWJR-00GNbJ-S5; Mon, 01 Nov 2021 12:21:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhWJE-00GNY7-HL; Mon, 01 Nov 2021 12:21:06 +0000
X-UUID: 84765daf3ddd45209ee07e2fac29430f-20211101
X-UUID: 84765daf3ddd45209ee07e2fac29430f-20211101
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2015231233; Mon, 01 Nov 2021 05:21:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Nov 2021 05:20:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 1 Nov 2021 20:20:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 1 Nov 2021 20:20:58 +0800
Message-ID: <76840b40fcf26a65467931a73f236982ad39989c.camel@mediatek.com>
Subject: Re: [PATCH] dma-direct: fix DMA_ATTR_NO_KERNEL_MAPPING
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: Christoph Hellwig <hch@lst.de>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Linux IOMMU
 <iommu@lists.linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>, "Andrew
 Morton" <akpm@linux-foundation.org>
Date: Mon, 1 Nov 2021 20:20:58 +0800
In-Reply-To: <CAMj1kXGqOzHM+J30TXR3-uZPkjHBCXB4CMkzZjHbbmptyU5W9w@mail.gmail.com>
References: <20211101031558.7184-1-walter-zh.wu@mediatek.com>
 <CAMj1kXGqOzHM+J30TXR3-uZPkjHBCXB4CMkzZjHbbmptyU5W9w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_052104_620338_8CA1AB2F 
X-CRM114-Status: GOOD (  38.37  )
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

Hi Ard,

On Mon, 2021-11-01 at 09:34 +0100, Ard Biesheuvel wrote:
> On Mon, 1 Nov 2021 at 04:17, Walter Wu <walter-zh.wu@mediatek.com>
> wrote:
> > 
> > DMA_ATTR_NO_KERNEL_MAPPING is to avoid creating a kernel mapping
> > for the allocated buffer, but current implementation is that
> > PTE of allocated buffer in kernel page table is valid. So we
> > should set invalid for PTE of allocate buffer so that there are
> > no kernel mapping for the allocated buffer.
> > 
> > In some cases, we don't hope the allocated buffer to be read
> > by cpu or speculative execution, so we use
> > DMA_ATTR_NO_KERNEL_MAPPING
> > to get no kernel mapping in order to achieve this goal.
> > 
> > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > ---
> >  kernel/dma/direct.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > index 4c6c5e0635e3..aa10b4c5d762 100644
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/vmalloc.h>
> >  #include <linux/set_memory.h>
> >  #include <linux/slab.h>
> > +#include <asm/cacheflush.h>
> >  #include "direct.h"
> > 
> >  /*
> > @@ -169,6 +170,9 @@ void *dma_direct_alloc(struct device *dev,
> > size_t size,
> >                 if (!PageHighMem(page))
> >                         arch_dma_prep_coherent(page, size);
> >                 *dma_handle = phys_to_dma_direct(dev,
> > page_to_phys(page));
> > +               /* remove kernel mapping for pages */
> > +               set_memory_valid((unsigned
> > long)phys_to_virt(dma_to_phys(dev, *dma_handle)),
> > +                               size >> PAGE_SHIFT, 0);
> 
> This only works if the memory is mapped at page granularity in the
> linear region, and you cannot rely on that. Many architectures prefer
> block mappings for the linear region, and arm64 will only use page
> mappings if rodata=full is set (which is set by default but can be
> overridden on the kernel command line)
> 

We mainly want to solve arm64 arch. RODATA_FULL_DEFAULT_ENABLED should
be the arm64 config. If we use CONFIG_RODATA_FULL_DEFAULT_ENABLED to
check whether it call set_memory_valid(). It should avoid other
architectures. Do you think this method is work?

Thanks for your explaination and suggestion.

Walter

> 
> >                 /* return the page pointer as the opaque cookie */
> >                 return page;
> >         }
> > @@ -278,6 +282,10 @@ void dma_direct_free(struct device *dev,
> > size_t size,
> > 
> >         if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> >             !force_dma_unencrypted(dev) &&
> > !is_swiotlb_for_alloc(dev)) {
> > +               size = PAGE_ALIGN(size);
> > +               /* create kernel mapping for pages */
> > +               set_memory_valid((unsigned
> > long)phys_to_virt(dma_to_phys(dev, dma_addr)),
> > +                               size >> PAGE_SHIFT, 1);
> >                 /* cpu_addr is a struct page cookie, not a kernel
> > address */
> >                 dma_free_contiguous(dev, cpu_addr, size);
> >                 return;
> > --
> > 2.18.0
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-arm-kernel__;!!CTRNKA9wMg0ARbw!16dLCjnvtRkaRLeCO9AQ7Fund5XL0FicZmeVaU3-WkFymr-0lbITfzwrvoJpiHlqnqIu-g$
> >  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

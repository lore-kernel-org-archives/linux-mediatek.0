Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BBDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 03:21:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6116F60527
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 03:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6116F60527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xfb8VEGRrk9+mc1dIaQKZIwevP0wH1NOJRcePclwVhQ=; b=5C6+2bRIDMgxGw
	RyKKoQlhb+lSoqGkbCx+WuToMOs8kiSWM+BYrvVQNpwllA2Us4agkNIXWdaWdBOqWCZY8qft13EAk
	fyvYCARthItdL3vs4PMysprovcCoijwFm6foD+t7sQ1b4DUE5qyWJ0KGisO+N8Nq7cM3gBtsdmRuO
	uGrZvc9J5cdAHDp7M6bPzJcjcW/Rz7Cm9fP9okoWS3jadQBeWzhQIdhvzg3RLzQh9bte7IqbrMkVa
	qFB2nPCLjuDi7ZsEj62Gmg1DhG8C1Qc3QKQl4F7OVanLtrHf4iK2alPP5i7rt3g4iNwadD2OQaqZl
	azyyWkt73ShBuKwr8RSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhkMk-000RQt-He; Tue, 02 Nov 2021 03:21:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhkMX-000ROV-DJ; Tue, 02 Nov 2021 03:21:27 +0000
X-UUID: 63329fc929ed411b8d94596061651dbe-20211101
X-UUID: 63329fc929ed411b8d94596061651dbe-20211101
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 749826018; Mon, 01 Nov 2021 20:21:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Nov 2021 20:21:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 2 Nov 2021 11:21:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 2 Nov 2021 11:21:16 +0800
Message-ID: <c9f74d817aa1ae1cceaee9ec226d39bbdf2c5c48.camel@mediatek.com>
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
Date: Tue, 2 Nov 2021 11:21:16 +0800
In-Reply-To: <CAMj1kXFrUrThJFDJ0Q9qjDemcEovQVMtO20KbdnLccp7VfyVwA@mail.gmail.com>
References: <20211101031558.7184-1-walter-zh.wu@mediatek.com>
 <CAMj1kXGqOzHM+J30TXR3-uZPkjHBCXB4CMkzZjHbbmptyU5W9w@mail.gmail.com>
 <76840b40fcf26a65467931a73f236982ad39989c.camel@mediatek.com>
 <CAMj1kXFrUrThJFDJ0Q9qjDemcEovQVMtO20KbdnLccp7VfyVwA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_202125_492564_25C8A7BE 
X-CRM114-Status: GOOD (  48.55  )
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

On Mon, 2021-11-01 at 15:17 +0100, Ard Biesheuvel wrote:
> On Mon, 1 Nov 2021 at 13:21, Walter Wu <walter-zh.wu@mediatek.com>
> wrote:
> > 
> > Hi Ard,
> > 
> > On Mon, 2021-11-01 at 09:34 +0100, Ard Biesheuvel wrote:
> > > On Mon, 1 Nov 2021 at 04:17, Walter Wu <walter-zh.wu@mediatek.com
> > > >
> > > wrote:
> > > > 
> > > > DMA_ATTR_NO_KERNEL_MAPPING is to avoid creating a kernel
> > > > mapping
> > > > for the allocated buffer, but current implementation is that
> > > > PTE of allocated buffer in kernel page table is valid. So we
> > > > should set invalid for PTE of allocate buffer so that there are
> > > > no kernel mapping for the allocated buffer.
> > > > 
> > > > In some cases, we don't hope the allocated buffer to be read
> > > > by cpu or speculative execution, so we use
> > > > DMA_ATTR_NO_KERNEL_MAPPING
> > > > to get no kernel mapping in order to achieve this goal.
> > > > 
> > > > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > > > Cc: Christoph Hellwig <hch@lst.de>
> > > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > ---
> > > >  kernel/dma/direct.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > > 
> > > > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > > > index 4c6c5e0635e3..aa10b4c5d762 100644
> > > > --- a/kernel/dma/direct.c
> > > > +++ b/kernel/dma/direct.c
> > > > @@ -13,6 +13,7 @@
> > > >  #include <linux/vmalloc.h>
> > > >  #include <linux/set_memory.h>
> > > >  #include <linux/slab.h>
> > > > +#include <asm/cacheflush.h>
> > > >  #include "direct.h"
> > > > 
> > > >  /*
> > > > @@ -169,6 +170,9 @@ void *dma_direct_alloc(struct device *dev,
> > > > size_t size,
> > > >                 if (!PageHighMem(page))
> > > >                         arch_dma_prep_coherent(page, size);
> > > >                 *dma_handle = phys_to_dma_direct(dev,
> > > > page_to_phys(page));
> > > > +               /* remove kernel mapping for pages */
> > > > +               set_memory_valid((unsigned
> > > > long)phys_to_virt(dma_to_phys(dev, *dma_handle)),
> > > > +                               size >> PAGE_SHIFT, 0);
> > > 
> > > This only works if the memory is mapped at page granularity in
> > > the
> > > linear region, and you cannot rely on that. Many architectures
> > > prefer
> > > block mappings for the linear region, and arm64 will only use
> > > page
> > > mappings if rodata=full is set (which is set by default but can
> > > be
> > > overridden on the kernel command line)
> > > 
> > 
> > We mainly want to solve arm64 arch.
> 
> Solve what?

Our platform is arch64. We need a dynamic allocated buffer from CMA is
not to read by CPU peculative execution, so we need to remove its
kernel mapping.

> > RODATA_FULL_DEFAULT_ENABLED should
> > be the arm64 config. If we use CONFIG_RODATA_FULL_DEFAULT_ENABLED
> > to
> > check whether it call set_memory_valid(). It should avoid other
> > architectures. Do you think this method is work?
> > 
> 
> No. Try it with rodata=off (or rodata=on for that matter) and see
> what happens.
> 

I try with rodata=[off/on] on qemu, it looks like boot pass. see below.

[    0.000000] Kernel command line: root=/dev/ram0 rw rootfstype=ext4
rodata=off console=ttyAMA0 rdinit=qemu/ramdisk.img earlyprintk=serial


I also try with rodata=off on our platform and do stress test, it looks
like pass.


Thanks.
Walter

> > Thanks for your explaination and suggestion.
> > 
> 
> YW
> 
> > 
> > > 
> > > >                 /* return the page pointer as the opaque cookie
> > > > */
> > > >                 return page;
> > > >         }
> > > > @@ -278,6 +282,10 @@ void dma_direct_free(struct device *dev,
> > > > size_t size,
> > > > 
> > > >         if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> > > >             !force_dma_unencrypted(dev) &&
> > > > !is_swiotlb_for_alloc(dev)) {
> > > > +               size = PAGE_ALIGN(size);
> > > > +               /* create kernel mapping for pages */
> > > > +               set_memory_valid((unsigned
> > > > long)phys_to_virt(dma_to_phys(dev, dma_addr)),
> > > > +                               size >> PAGE_SHIFT, 1);
> > > >                 /* cpu_addr is a struct page cookie, not a
> > > > kernel
> > > > address */
> > > >                 dma_free_contiguous(dev, cpu_addr, size);
> > > >                 return;
> > > > --
> > > > 2.18.0
> > > > 
> > > > 
> > > > _______________________________________________
> > > > linux-arm-kernel mailing list
> > > > linux-arm-kernel@lists.infradead.org
> > > > 
> > 
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-arm-kernel__;!!CTRNKA9wMg0ARbw!16dLCjnvtRkaRLeCO9AQ7Fund5XL0FicZmeVaU3-WkFymr-0lbITfzwrvoJpiHlqnqIu-g$
> > > > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

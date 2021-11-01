Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8716C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 12:08:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E07760F4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 12:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E07760F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnFRcg6TlEFFRqilwBMPcuEhMl8LryVfPxiD3ZHTSWw=; b=vV2iakNjnr6DS3
	+9/ojkeIHFeIXW+P7oN5UqESZqUxMPIREWjYx9QhNVRCa3k9XxGnLDZwA6LHjGLxBKTDtvnRE2h3o
	axbbGd4zfRAoYNg+9B1RJqNlN/QE9iRgBlDKrYoJ5JZfCtVjZSpuM0u9unU7nzaNbK8yDt5fBXNue
	LG50x8ygRe1QYxwmH+FMN1Z3CSsJHi0pxfJi+PsHp8iXZmkJOlVfUUImS/rwZe4Rhi84uEb3c5RRy
	/DoXoSuIAJ7tpM3wGo3cL03wL6tjid3uelA6vsE/QcPD07jLvRMw0aevg1Nq0jBnM7YHpqWIxsa2R
	OQ/vXFSFOoivUYFCmEUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhW6p-00GJ25-Nf; Mon, 01 Nov 2021 12:08:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhW6b-00GIvh-Rc; Mon, 01 Nov 2021 12:08:03 +0000
X-UUID: f331abd8095c4d2eacdb8916b687cb9f-20211101
X-UUID: f331abd8095c4d2eacdb8916b687cb9f-20211101
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1497665156; Mon, 01 Nov 2021 05:07:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Nov 2021 05:07:56 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 1 Nov 2021 20:07:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Nov 2021 20:07:54 +0800
Message-ID: <73d900564ce9b0d773c801efe8b8689946bef150.camel@mediatek.com>
Subject: Re: [PATCH] dma-direct: fix DMA_ATTR_NO_KERNEL_MAPPING
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>, "Andrew
 Morton" <akpm@linux-foundation.org>
Date: Mon, 1 Nov 2021 20:07:54 +0800
In-Reply-To: <0316e4f0-b0ad-c702-676f-36347b4ebcb1@arm.com>
References: <20211101031558.7184-1-walter-zh.wu@mediatek.com>
 <0316e4f0-b0ad-c702-676f-36347b4ebcb1@arm.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_050801_926738_5C946BF2 
X-CRM114-Status: GOOD (  35.83  )
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

Hi Robin,

On Mon, 2021-11-01 at 10:29 +0000, Robin Murphy wrote:
> On 2021-11-01 03:15, Walter Wu wrote:
> > DMA_ATTR_NO_KERNEL_MAPPING is to avoid creating a kernel mapping
> > for the allocated buffer, but current implementation is that
> > PTE of allocated buffer in kernel page table is valid. So we
> > should set invalid for PTE of allocate buffer so that there are
> > no kernel mapping for the allocated buffer.
> 
> No, the semantic of NO_KERNEL_MAPPING is an indication that the
> *caller* 
> does not need a mapping, such that the DMA API implementation may
> choose 
> to optimise for that internally. It has never given any guarantee of
> any 
> particular behaviour - like most attributes it is only a hint.
> 
> > In some cases, we don't hope the allocated buffer to be read
> > by cpu or speculative execution, so we use
> > DMA_ATTR_NO_KERNEL_MAPPING
> > to get no kernel mapping in order to achieve this goal.
> 
> If it's important that no CPU accesses to this memory can happen,
> then I 
> think the only way to absolutely guarantee that is to exclude it
> from 
> the kernel's memory map in the first place, e.g. as a DT reserved-
> memory 
> region with the "no-map" property.
> 

Yes, this is our previous implementation, but we hope to use kernel
memory to fix it.

Thanks for your suggestion.

Walter

> Robin.
> 
> > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > ---
> >   kernel/dma/direct.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > index 4c6c5e0635e3..aa10b4c5d762 100644
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -13,6 +13,7 @@
> >   #include <linux/vmalloc.h>
> >   #include <linux/set_memory.h>
> >   #include <linux/slab.h>
> > +#include <asm/cacheflush.h>
> >   #include "direct.h"
> >   
> >   /*
> > @@ -169,6 +170,9 @@ void *dma_direct_alloc(struct device *dev,
> > size_t size,
> >   		if (!PageHighMem(page))
> >   			arch_dma_prep_coherent(page, size);
> >   		*dma_handle = phys_to_dma_direct(dev,
> > page_to_phys(page));
> > +		/* remove kernel mapping for pages */
> > +		set_memory_valid((unsigned
> > long)phys_to_virt(dma_to_phys(dev, *dma_handle)),
> > +				size >> PAGE_SHIFT, 0);
> >   		/* return the page pointer as the opaque cookie */
> >   		return page;
> >   	}
> > @@ -278,6 +282,10 @@ void dma_direct_free(struct device *dev,
> > size_t size,
> >   
> >   	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> >   	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev))
> > {
> > +		size = PAGE_ALIGN(size);
> > +		/* create kernel mapping for pages */
> > +		set_memory_valid((unsigned
> > long)phys_to_virt(dma_to_phys(dev, dma_addr)),
> > +				size >> PAGE_SHIFT, 1);
> >   		/* cpu_addr is a struct page cookie, not a kernel
> > address */
> >   		dma_free_contiguous(dev, cpu_addr, size);
> >   		return;
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

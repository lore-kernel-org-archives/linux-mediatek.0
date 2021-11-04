Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3ADC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 13:40:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC877611C4
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 13:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC877611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGUkL2iLUYmhPr200QY/6GKBdXd3VKrDa3RbcKL4PpE=; b=R/luUEEdYpCnOJ
	64SHR6Ia25YCpROua6mnSfBS8PmPR+0ZxtiWykZfy+z+n64zTAIBCZyFRO54cthw6zRDSa+Of2Bty
	xIKLuWFQKa9a4P88LBtXi7yn13CJ3GRn+YAGiNQUL+AGkkkr5fHu22O1PVDQRv3J0zbnAK0hPicy8
	YBiW3SKwsQaoVV6AmO3rSSjAbAJv8TS1DoCrTWCLUnX8wwU0MH8Z/Ew0u1wYxbmo/vhoBnH+/kQXT
	AeWixU7NadCfmGNhXC+KVPH4yeASBfN0C/Vp/ZRGehT9GvRmlniTFjf/4pU/z9mp/ZJBbkDyehi1y
	MTxqA5wwah/BxnniGRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1micyd-0091rC-R9; Thu, 04 Nov 2021 13:40:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1micyQ-0091p9-55; Thu, 04 Nov 2021 13:40:11 +0000
X-UUID: 55b46ca5cdfd4bc99a69c3009d99ec5e-20211104
X-UUID: 55b46ca5cdfd4bc99a69c3009d99ec5e-20211104
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 324400148; Thu, 04 Nov 2021 06:40:06 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Nov 2021 06:40:04 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 4 Nov 2021 21:40:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Nov 2021 21:40:03 +0800
Message-ID: <9da413e95727a3b48ea35ec576aa1b1b57ffc9b9.camel@mediatek.com>
Subject: Re: [PATCH v2] dma-direct: improve DMA_ATTR_NO_KERNEL_MAPPING
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: Christoph Hellwig <hch@lst.de>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Linux IOMMU <iommu@lists.linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Date: Thu, 4 Nov 2021 21:40:03 +0800
In-Reply-To: <CAMj1kXG0DmLXQgfv2N1nhNdXgnXOiK2Rv7D+boSdW9_C=wsowA@mail.gmail.com>
References: <20211104023221.16391-1-walter-zh.wu@mediatek.com>
 <20211104085336.GA24260@lst.de>
 <CAMj1kXHjjmhCVzKFhAseMGOdnidmFT=+o+vwKLTCGFkpwHmcfQ@mail.gmail.com>
 <cc893162f0e2c81a1d64bf85794cc77ae76cadce.camel@mediatek.com>
 <CAMj1kXG0DmLXQgfv2N1nhNdXgnXOiK2Rv7D+boSdW9_C=wsowA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_064010_235029_76801A64 
X-CRM114-Status: GOOD (  41.02  )
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

On Thu, 2021-11-04 at 13:47 +0100, Ard Biesheuvel wrote:
> On Thu, 4 Nov 2021 at 13:31, Walter Wu <walter-zh.wu@mediatek.com>
> wrote:
> > 
> > On Thu, 2021-11-04 at 09:57 +0100, Ard Biesheuvel wrote:
> > > On Thu, 4 Nov 2021 at 09:53, Christoph Hellwig <hch@lst.de>
> > > wrote:
> > > > 
> > > > On Thu, Nov 04, 2021 at 10:32:21AM +0800, Walter Wu wrote:
> > > > > diff --git a/include/linux/set_memory.h
> > > > > b/include/linux/set_memory.h
> > > > > index f36be5166c19..6c7d1683339c 100644
> > > > > --- a/include/linux/set_memory.h
> > > > > +++ b/include/linux/set_memory.h
> > > > > @@ -7,11 +7,16 @@
> > > > > 
> > > > >  #ifdef CONFIG_ARCH_HAS_SET_MEMORY
> > > > >  #include <asm/set_memory.h>
> > > > > +
> > > > > +#ifndef CONFIG_RODATA_FULL_DEFAULT_ENABLED
> > > > 
> > > > This is an arm64-specific symbol, and one that only controls a
> > > > default.  I don't think it is suitable to key off stubs in
> > > > common
> > > > code.
> > > > 
> > > > > +static inline int set_memory_valid(unsigned long addr, int
> > > > > numpages, int enable) { return 0; }
> > > > 
> > > > Pleae avoid overly long lines.
> > > > 
> > > > > +             if
> > > > > (IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED))
> > > > > {
> > > > > +                     kaddr = (unsigned
> > > > > long)phys_to_virt(dma_to_phys(dev, *dma_handle));
> > > > 
> > > > This can just use page_address.
> > > > 
> > > > > +                     /* page remove kernel mapping for arm64
> > > > > */
> > > > > +                     set_memory_valid(kaddr, size >>
> > > > > PAGE_SHIFT,
> > > > > 0);
> > > > > +             }
> > > > 
> > > > But more importantly:  set_memory_valid only exists on arm64,
> > > > this
> > > > will break compile everywhere else.  And this API is complete
> > > > crap.
> > > > Passing kernel virtual addresses as unsigned long just sucks,
> > > > and
> > > > passing an integer argument for valid/non-valid also is a
> > > > horrible
> > > > API.
> > > > 
> > > 
> > > ... and as I pointed out before, you can still pass rodata=off on
> > > arm64, and get the old behavior, in which case bad things will
> > > happen
> > > if you try to use an API that expects to operate on page mappings
> > > with
> > > a 1 GB block mapping.
> > > 
> > 
> > Thanks for your suggestion.
> > 
> > 
> > > And you still haven't explained what the actual problem is: is
> > > this
> > > about CPU speculation corrupting non-cache coherent inbound DMA?
> > 
> > No corrupiton, only cpu read it, we hope to fix the behavior.
> > 
> 
> Fix which behavior? Please explain
> 
> 1) the current behavior
We call dma_direct_alloc() with DMA_ATTR_NO_KERNEL_MAPPING to get the
allocated buffer and the kernel mapping is exist. Our goal is this
buffer doesn't allow to be accessed by cpu. Unfortunately, we see cpu
speculation to read it. So we need to fix it and don't use no-map the
way.

> 2) why the current behavior is problematic for you
dma_direct_alloc() with DMA_ATTR_NO_KERNEL_MAPPING have kernel mapping,
so it still has cpu speculation read the buffer. Although we have
hardware to protect the buffer, we still hope use software to fix it.

> 3) how this patch changes the current behavior
When call dma_direct_alloc() with DMA_ATTR_NO_KERNEL_MAPPING, then
remove the kernel mapping which belong to the buffer.

> 4) why the new behavior fixes your problem.
If I understand correctly, want to block cpu speculation, then need
unmap the buffer at stage 1 and stage 2 page table and tlb invalidate.
This patch is to do stage 1 unmap at EL1.

> 
> There is no penalty for using too many words.

Thanks.
Walter


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

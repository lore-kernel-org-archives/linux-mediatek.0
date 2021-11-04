Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7548C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 12:19:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66AB260FE3
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 12:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66AB260FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3tz9uPe5gvPGO18rrKFi1ELOO4etsoqA9AL3fx/WE8=; b=DpbRTp9EmKt3tp
	unfH3J5/a9YszZtz3rkFhmdUmKqyuPwoEnnHY6JcRaeY/yfFjS02oAAK7w+IBnrZkWIRtDGqixqtp
	hmugx+lVVs7L4taYdmBOug05Ltp4R8+o8ZaKZNdHkYjh8ppQQCZqbKxb1p5p/FRuPab66OfXmUVXs
	nYn+ZtedYP7ZXm4HJ44keaN+R4CGf5TTNAfOaTOE9boRyBP4R7Ea6LDjZ++zX+OK+ljTGw4TX3z0z
	G+7ZX07Qiz8cAJIf9VT4kjAlJ0q2dbhH51aPH0PrOQmeEphTi/1vHY0i+6vdNsHp5MmOmZYq5RZxB
	/sTQvk5s5EIJKLr5H8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mibhl-008ql9-MP; Thu, 04 Nov 2021 12:18:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mibhX-008qhR-1E; Thu, 04 Nov 2021 12:18:41 +0000
X-UUID: ebe5c98612af4b6ab1d4715d72cd3486-20211104
X-UUID: ebe5c98612af4b6ab1d4715d72cd3486-20211104
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1342261863; Thu, 04 Nov 2021 05:18:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Nov 2021 05:18:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 4 Nov 2021 20:18:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 4 Nov 2021 20:18:33 +0800
Message-ID: <f890498e474b48f017ec763cf866f7ddd1cc40c4.camel@mediatek.com>
Subject: Re: [PATCH v2] dma-direct: improve DMA_ATTR_NO_KERNEL_MAPPING
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Christoph Hellwig <hch@lst.de>
CC: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
 <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Ard
 Biesheuvel" <ardb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Date: Thu, 4 Nov 2021 20:18:33 +0800
In-Reply-To: <20211104085336.GA24260@lst.de>
References: <20211104023221.16391-1-walter-zh.wu@mediatek.com>
 <20211104085336.GA24260@lst.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_051839_120565_C1491207 
X-CRM114-Status: GOOD (  23.77  )
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

On Thu, 2021-11-04 at 09:53 +0100, Christoph Hellwig wrote:
> On Thu, Nov 04, 2021 at 10:32:21AM +0800, Walter Wu wrote:
> > diff --git a/include/linux/set_memory.h
> > b/include/linux/set_memory.h
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

ok

> > +static inline int set_memory_valid(unsigned long addr, int
> > numpages, int enable) { return 0; }
> 
> Pleae avoid overly long lines.
> 
> > +		if (IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED)) {
> > +			kaddr = (unsigned
> > long)phys_to_virt(dma_to_phys(dev, *dma_handle));
> 
> This can just use page_address.
> 
> > +			/* page remove kernel mapping for arm64 */
> > +			set_memory_valid(kaddr, size >> PAGE_SHIFT, 0);
> > +		}
> 
> But more importantly:  set_memory_valid only exists on arm64, this
> will break compile everywhere else.  And this API is complete crap.
> Passing kernel virtual addresses as unsigned long just sucks, and
> passing an integer argument for valid/non-valid also is a horrible
> API.
> 

Would you think __kernel_map_page() is ok?
Many arch support it, and only pass page and page number. but need to
depend CONFIG_DEBUG_PAGEALLOC.

Thanks.
Walter


> Not to mention the overly long line.  Same on the free side.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

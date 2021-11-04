Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B4FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 08:54:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87BED610FC
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 08:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87BED610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwAh17oaL6WXGcP58piURDVBLKnHiUXM+MaAK3OgO00=; b=oIwKfn1CbJ8UZ1
	ZwDBFCXjNN3eNii29t5ksEiSRmO9Hju61dAIxWfTzwWwJBJ1Ioy3qxXThDtIq4KDb81qNsJdfvA7Q
	HyEDbF9f8FWDij/lO4xEonbIwdfKrkHKazaA5V3LTh7dTU3yo0DY9SwRh8UcuGH4T9s2yGZMz+fR+
	ITJeZJra4/PsAWh9EfZ7zwuPBPxJokkP1vnsHyPinZW76nLbb1j9BtO9B6/ut6gVrOiNFcLPX2Imj
	l55RxkNLDAPK4JCA7O3PQWNvAVW4RCv4xunTtwKvyhca6EW70xXgbiNjjwXNoqBa4tig1KoaGY5oW
	+ot3iqyvlegDdydjWNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miYVU-008NFM-Df; Thu, 04 Nov 2021 08:54:00 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miYVI-008NBx-Ey; Thu, 04 Nov 2021 08:53:49 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 89EB968AA6; Thu,  4 Nov 2021 09:53:36 +0100 (CET)
Date: Thu, 4 Nov 2021 09:53:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 wsd_upstream <wsd_upstream@mediatek.com>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] dma-direct: improve DMA_ATTR_NO_KERNEL_MAPPING
Message-ID: <20211104085336.GA24260@lst.de>
References: <20211104023221.16391-1-walter-zh.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211104023221.16391-1-walter-zh.wu@mediatek.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_015348_694930_E4A49BC0 
X-CRM114-Status: GOOD (  18.70  )
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

On Thu, Nov 04, 2021 at 10:32:21AM +0800, Walter Wu wrote:
> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> index f36be5166c19..6c7d1683339c 100644
> --- a/include/linux/set_memory.h
> +++ b/include/linux/set_memory.h
> @@ -7,11 +7,16 @@
>  
>  #ifdef CONFIG_ARCH_HAS_SET_MEMORY
>  #include <asm/set_memory.h>
> +
> +#ifndef CONFIG_RODATA_FULL_DEFAULT_ENABLED

This is an arm64-specific symbol, and one that only controls a
default.  I don't think it is suitable to key off stubs in common
code.

> +static inline int set_memory_valid(unsigned long addr, int numpages, int enable) { return 0; }

Pleae avoid overly long lines.

> +		if (IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED)) {
> +			kaddr = (unsigned long)phys_to_virt(dma_to_phys(dev, *dma_handle));

This can just use page_address.

> +			/* page remove kernel mapping for arm64 */
> +			set_memory_valid(kaddr, size >> PAGE_SHIFT, 0);
> +		}

But more importantly:  set_memory_valid only exists on arm64, this
will break compile everywhere else.  And this API is complete crap.
Passing kernel virtual addresses as unsigned long just sucks, and
passing an integer argument for valid/non-valid also is a horrible
API.

Not to mention the overly long line.  Same on the free side.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

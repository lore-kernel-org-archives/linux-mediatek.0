Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A597AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 06:44:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7131160E8C
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 06:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7131160E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fu6dbHDOHxbXDE7bIzeNtg5zX2uuSik7hupcRWloNM4=; b=o0ymmR7703OPRj
	A1Kr4pursjSZEEr+Mcqs/SzXnPZQazxnAJ19VBzfRdAOgxJcdWkOfBj8PHx8Lty8n0s2oqANgRhau
	ED8bhh+iLImEk0NSlinD/dL7Mtf1+c+VgKNdAyvjciEPtApdtWXFBC2Hmed5geFlBCifO7lvOA0gt
	R6R3E37M8yo9jmk5VHTom1dIRQS2wNTbbQAvfXWrYOIEbbk+M9J0RkGPGNR9ILi3POVrCbD0+kM+0
	Zu76JK3peeJuxPx+w9ZyZXIQVAcTlhSlGy9A+O7XPDQ4NUJ4/NNUfGMPmbG0wzV562OrqA8LJ4WbY
	KqzvZY0B16ybGDFnS+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhnWl-000g0d-7c; Tue, 02 Nov 2021 06:44:11 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnWZ-000fxL-Al; Tue, 02 Nov 2021 06:44:00 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 85F8768AFE; Tue,  2 Nov 2021 07:43:56 +0100 (CET)
Date: Tue, 2 Nov 2021 07:43:56 +0100
From: Christoph Hellwig <hch@lst.de>
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] dma-direct: fix DMA_ATTR_NO_KERNEL_MAPPING
Message-ID: <20211102064356.GB27749@lst.de>
References: <20211101031558.7184-1-walter-zh.wu@mediatek.com>
 <CAMj1kXGqOzHM+J30TXR3-uZPkjHBCXB4CMkzZjHbbmptyU5W9w@mail.gmail.com>
 <76840b40fcf26a65467931a73f236982ad39989c.camel@mediatek.com>
 <CAMj1kXFrUrThJFDJ0Q9qjDemcEovQVMtO20KbdnLccp7VfyVwA@mail.gmail.com>
 <c9f74d817aa1ae1cceaee9ec226d39bbdf2c5c48.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9f74d817aa1ae1cceaee9ec226d39bbdf2c5c48.camel@mediatek.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_234359_543644_D58E8BD4 
X-CRM114-Status: GOOD (  14.63  )
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

On Tue, Nov 02, 2021 at 11:21:16AM +0800, Walter Wu wrote:
> Our platform is arch64. We need a dynamic allocated buffer from CMA is
> not to read by CPU peculative execution, so we need to remove its
> kernel mapping.

If your CPU speculates into unused kernel direct mappings your have
a worse problem than this, because all the dma coherent allocations for
non-coherent devices still have a cachable direct mapping.  Will
mentioned he wanted to look into getting rid of that mapping now that
the core dma code has the infrastucture for that, so adding him here.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

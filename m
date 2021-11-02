Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92D7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 07:29:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E36560EB8
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 07:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E36560EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYn1X6CO424QjqZe261P6Zl6hYcv+7V0wGpPCMXYuxw=; b=a+3dDiiQWMDYF1
	iMLx2apQRajBpeGPfkri7uJUQSHlqFdlv5OyY0WZV/aqfD2ch0sggd4H/Wmm8L3Gvoaah9L+hqFMx
	u7p+L9gFwx/ezKuvoDsyxypOvghf3TzazezCCqMTEhmMIEW+a6TMcsuzstgCzL/4f9lFQgzu5jzqW
	IX2S8cM6g+bcP3+OXl3ouotLVq9BKCWD6JpIn4M1ParSIlFzlKtl744rScL/R4CAexLk/FzDnI+CE
	O0vDyPhKhrWWNDzmKJFtN4grIszpURxPr0C6nuzyArTo9PUY5t4Qbn8Rl6H5p42a8usuvRn+9zJm1
	1A5pSJV6j3L4w9SoG4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhoE8-000mYC-NU; Tue, 02 Nov 2021 07:29:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhoDw-000mW7-6b; Tue, 02 Nov 2021 07:28:49 +0000
X-UUID: 1c3e1996e4d748928f7bd1414c694214-20211102
X-UUID: 1c3e1996e4d748928f7bd1414c694214-20211102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1795893295; Tue, 02 Nov 2021 00:28:46 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Nov 2021 00:26:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 2 Nov 2021 15:26:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 2 Nov 2021 15:26:12 +0800
Message-ID: <c5036587af69e70a60f6187048be1991bb2d7e7b.camel@mediatek.com>
Subject: Re: [PATCH] dma-direct: fix DMA_ATTR_NO_KERNEL_MAPPING
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Christoph Hellwig <hch@lst.de>
CC: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
 <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>, "Andrew
 Morton" <akpm@linux-foundation.org>
Date: Tue, 2 Nov 2021 15:26:12 +0800
In-Reply-To: <20211102064155.GA27749@lst.de>
References: <20211101031558.7184-1-walter-zh.wu@mediatek.com>
 <20211102064155.GA27749@lst.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_002848_275624_C665F3DD 
X-CRM114-Status: GOOD (  17.31  )
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

Hi Christoph,

I am sorry, fix my typo.


Walter

On Tue, 2021-11-02 at 07:41 +0100, Christoph Hellwig wrote:
> As others pointed out, DMA_ATTR_NO_KERNEL_MAPPING just means the
> caller can't rely on a kernel mapping.  So the "fix" here is
> wrong.  That being said for cases where we can easily remove a page
> from the kernel mapping it would be nice to do to:
> 
>  a) improve security
>  b) as a debug check to see that no one actually tries to access it
> 
> > +		/* remove kernel mapping for pages */
> > +		set_memory_valid((unsigned
> > long)phys_to_virt(dma_to_phys(dev, *dma_handle)),
> 
> Please avoid overly long lines.  Also this function only exists for
> arm64
> also and others pointed out won't work for all cases.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

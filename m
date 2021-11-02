Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C4DC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 07:08:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C416960F56
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 07:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C416960F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjUJUltDP1Fp/yTc6V4q8/h5Mqn+POVZAOdIhoZfCIU=; b=ltK9M2SZF4cVID
	ZCsF1lg6lUsDCB1WTQNgVcbMcvqDA3G09SvURMHrTlmkOgsui4lR32i6I3Tvhzk19z/oNC5VHvj3s
	b1Psqen28kkOL0XpqpJbGKKCEncDz0PBDJSPszKabkH6SON1WcdZq77z/5Qf96NhodeDIwyvPSpam
	gokVoYq5Ec2mUwuLUEQ+vh/3bhTPoCgU7dCWAVJp3TJ12GsQGkd1GH6Sir89qR0j4yeHcItv51+5Q
	5dWrvgIwjhS4tN+CDxoS3qmttIk+hKw4/45WE0AvbvZ4q2HucPFKtEfuz1KxP/Wc1sPoKcZvuS6MK
	UmTXojoFvEtedJViVApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhnuM-000iSV-RE; Tue, 02 Nov 2021 07:08:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnu8-000iNK-SI; Tue, 02 Nov 2021 07:08:23 +0000
X-UUID: e9efbb68da4d47668fdf6ca315e5e448-20211102
X-UUID: e9efbb68da4d47668fdf6ca315e5e448-20211102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 827739910; Tue, 02 Nov 2021 00:08:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Nov 2021 00:08:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 2 Nov 2021 15:08:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Nov 2021 15:08:11 +0800
Message-ID: <8903df2ad1ae1e0dfaafb3766beef7d0ec156f28.camel@mediatek.com>
Subject: Re: [PATCH] dma-direct: fix DMA_ATTR_NO_KERNEL_MAPPING
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Christoph Hellwig <hch@lst.de>
CC: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
 <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>, "Andrew
 Morton" <akpm@linux-foundation.org>
Date: Tue, 2 Nov 2021 15:08:11 +0800
In-Reply-To: <20211102064155.GA27749@lst.de>
References: <20211101031558.7184-1-walter-zh.wu@mediatek.com>
 <20211102064155.GA27749@lst.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_000820_944413_F8677D2D 
X-CRM114-Status: GOOD (  16.75  )
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

Hi Cristoph,

On Tue, 2021-11-02 at 07:41 +0100, Christoph Hellwig wrote:
> As others pointed out, DMA_ATTR_NO_KERNEL_MAPPING just means the
> caller can't rely on a kernel mapping.  So the "fix" here is
> wrong.  That being said for cases where we can easily remove a page
> from the kernel mapping it would be nice to do to:
> 
>  a) improve security
>  b) as a debug check to see that no one actually tries to access it
> 

I will modify my commit message. Thanks for your comment.

> > +		/* remove kernel mapping for pages */
> > +		set_memory_valid((unsigned
> > long)phys_to_virt(dma_to_phys(dev, *dma_handle)),
> 
> Please avoid overly long lines.  Also this function only exists for
> arm64
> also and others pointed out won't work for all cases.

Got it. I will send v2 patch.

Thanks for your review and suggestion.


Walter


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

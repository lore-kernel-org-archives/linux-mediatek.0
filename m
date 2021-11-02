Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B06C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 06:42:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30FF960E74
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 06:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30FF960E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pl4ygMrr/K6PUViF4gS7YqXY4pTWViu48l74eWTp8XY=; b=z382pEKdzufaAK
	9y69JgkUQNiuJW6Bm94objV9t5qrjN26GfC5JX9Ix9M2Zw+JxXZg1jFt922Efj0E6c4PLv98JlaCJ
	Iaw+NstsW3iSVqkqgPz0Nq1p+kKHePj/U/JhyUT4taCFXfUud2RD0rTRprXw8c/YyHy2C7tGuYThn
	iLcQqtIP1u/OxYnVV/9c6jWd4wLk0OpOCEd0IpdnsiJzkV1UaQ2pAodJHC6Zf5Fru83tSzZfmnojV
	vl6AryMq6HlYPHChU5Gp/RSkSVHXZ/T31nNoqmxURQO7tRCO9VYJQk3biym4nthxW7FQSCUKtpuM9
	9DdYrdFK1+uyTgu3B2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhnUo-000fWi-SR; Tue, 02 Nov 2021 06:42:10 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnUc-000fTt-Ii; Tue, 02 Nov 2021 06:41:59 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7487768AA6; Tue,  2 Nov 2021 07:41:55 +0100 (CET)
Date: Tue, 2 Nov 2021 07:41:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 wsd_upstream <wsd_upstream@mediatek.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] dma-direct: fix DMA_ATTR_NO_KERNEL_MAPPING
Message-ID: <20211102064155.GA27749@lst.de>
References: <20211101031558.7184-1-walter-zh.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211101031558.7184-1-walter-zh.wu@mediatek.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_234158_788290_B841E33F 
X-CRM114-Status: GOOD (  13.62  )
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

As others pointed out, DMA_ATTR_NO_KERNEL_MAPPING just means the
caller can't rely on a kernel mapping.  So the "fix" here is
wrong.  That being said for cases where we can easily remove a page
from the kernel mapping it would be nice to do to:

 a) improve security
 b) as a debug check to see that no one actually tries to access it

> +		/* remove kernel mapping for pages */
> +		set_memory_valid((unsigned long)phys_to_virt(dma_to_phys(dev, *dma_handle)),

Please avoid overly long lines.  Also this function only exists for arm64
also and others pointed out won't work for all cases.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

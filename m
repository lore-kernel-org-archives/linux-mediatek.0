Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A552AC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 19:32:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F06223AFC
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 19:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F06223AFC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zXaVfgnM6gK7MDThMKz6AiAX6ZpXVX4FiUzMyuKOQys=; b=SLWTKwIwWpq4tN4+L7X/LY8wP
	kSThx1hMOtZnbVIbdp2AVJ9GdKui9LoI/+SdwfJ8L2c2fOatJnwo0JscPTy76H757MOdh6xac8bmG
	pt7rFW2NJBixVbMj7/z3VNRNHNtSwBUCK3PfHpQsU1kCvSAK2E3BEuYM4svkoLmGeqRlqzTXDGRak
	j3S1yOjG+s1RvNnxGWckXdmTNO0uVjr2d/h/ek2xVrLr0c3cXCh6SaTEXn6KgfP65Ho8l4oL6E7uT
	K4EcnL3memb5ROUxmoXg9pia4JwEmbl0oi/hd7dlY4qdwrCH4PMl7aJUaEOWyXIGMyDpFaFUN7f2V
	XE7eyvO2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l32Ag-00026w-W5; Fri, 22 Jan 2021 19:32:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l32Ac-00025n-Gg; Fri, 22 Jan 2021 19:32:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CDE123AF8;
 Fri, 22 Jan 2021 19:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611343953;
 bh=L5V19qa5myZ1I+fNRK/LFzj6kqSe+dZ19wKMEi3vT50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UdnS8TC+zFw9YNJ/pW6LGDRdoKpq/S5d109Ra8cb49KY+H+p4ydeL5L9f+QojlXFc
 cPSkQt8+FOnDV9Ndd/k9CaGhPYfu52FTI2qDdLG0Q00teV9uaaMixVXbKwYfqC9uLr
 /vu9h23Ip6AxG4R9Jy6tNrbKVQ/K6WoFN4fl26wRygT/Ey9lMxCKkgZxdsszT3qfub
 dDhigEyn7Ty9KC/S+CK9jVHjaS8jBSf6+ZIUTXj73iYsGVgcAiO9kVw/o2hCjYoTFI
 i9Pn+5f+YaEH3lp4n0lGkejkGVQav50VpTQMinh4WOSo91cVy5gki3V8xa1Wzxoye8
 dgIPntPvWYquQ==
Date: Fri, 22 Jan 2021 19:32:27 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 0/7] MediaTek IOMMU improve tlb flush performance in
 map/unmap
Message-ID: <20210122193226.GD25471@willie-the-truck>
References: <20210107122909.16317-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107122909.16317-1-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_143234_684690_704D2686 
X-CRM114-Status: GOOD (  20.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, David Laight <David.Laight@ACULAB.COM>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 07, 2021 at 08:29:02PM +0800, Yong Wu wrote:
> This patchset is to improve tlb flushing performance in iommu_map/unmap
> for MediaTek IOMMU.
> 
> For iommu_map, currently MediaTek IOMMU use IO_PGTABLE_QUIRK_TLBI_ON_MAP
> to do tlb_flush for each a memory chunk. this is so unnecessary. we could
> improve it by tlb flushing one time at the end of iommu_map.
> 
> For iommu_unmap, currently we have already improve this performance by
> gather. But the current gather should take care its granule size. if the
> granule size is different, it will do tlb flush and gather again. Our HW
> don't care about granule size. thus I gather the range in our file.
> 
> After this patchset, we could achieve only tlb flushing once in iommu_map
> and iommu_unmap.
> 
> Regardless of sg, for each a segment, I did a simple test:
>   
>   size = 20 * SZ_1M;
>   /* the worst case, all are 4k mapping. */
>   ret = iommu_map(domain, 0x5bb02000, 0x123f1000, size, IOMMU_READ);
>   iommu_unmap(domain, 0x5bb02000, size);
> 
> This is the comparing time(unit is us):
>               original-time  after-improve
>    map-20M    59943           2347
>    unmap-20M  264             36
> 
> This patchset also flush tlb once in the iommu_map_sg case.
> 
> patch [1/7][2/7][3/7] are for map while the others are for unmap.
> 
> change note:
> v4: a. base on v5.11-rc1.
>     b. Add a little helper _iommu_map.
>     c. Fix a build fail for tegra-gart.c. I didn't notice there is another place
>     call gart_iommu_sync_map.
>     d. Switch gather->end to the read end address("start + end - 1").
>     
> v3: https://lore.kernel.org/linux-iommu/20201216103607.23050-1-yong.wu@mediatek.com/#r
>     Refactor the unmap flow suggested by Robin.
>      
> v2: https://lore.kernel.org/linux-iommu/20201119061836.15238-1-yong.wu@mediatek.com/
>     Refactor all the code.
>     base on v5.10-rc1.
> 
> Yong Wu (7):
>   iommu: Move iotlb_sync_map out from __iommu_map
>   iommu: Add iova and size as parameters in iotlb_sync_map
>   iommu/mediatek: Add iotlb_sync_map to sync whole the iova range
>   iommu: Switch gather->end to the inclusive end
>   iommu/io-pgtable: Allow io_pgtable_tlb ops optional
>   iommu/mediatek: Gather iova in iommu_unmap to achieve tlb sync once
>   iommu/mediatek: Remove the tlb-ops for v7s

For the series:

Acked-by: Will Deacon <will@kernel.org>

Joerg -- how would you like to handle merging this? I suppose either you
could host a separate branch that I could merge if needed, or I could
include this in my pull to you, or something else.

Please let me know what you prefer,

Cheers,

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

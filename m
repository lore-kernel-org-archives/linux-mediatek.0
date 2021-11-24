Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4622AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 12:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhG0WQfB0Nte/Shiq/CMkRf5+4hpE2Wc9bvti4gzMPc=; b=hJGUrrpFi6CqMZ
	fI9+0Ii9N6i3wxH3xZxRxpwU4iFMTL48Y2mmtGS/f9BXkM3iW/ihT7VLQuwa6+oLsmhuYSfwbQUgc
	45oVM8nb//jO7B0dKtcWq9C9hdvXgPAO2EOikesNsyBLZdmzZFxN9a9DPuodkmh5nJ559n4x3z5ZI
	VxH5H5Num9DzupEt8vIo1nCP3ahg8/MkWhxfxphLsrQLUkFf1rwOEI7Lqoisoeq6VgcNEevAW9Jfw
	D6P+FU79QO3J5l4FtZ1g2s/3I7v4/CYbQ7ZYp1Z4YYWBJL1/bQvyZt++97R5Ij1fvJaACd0CTS8n0
	/fMsK/q11tBaLKfKUH+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mprUK-004idr-8O; Wed, 24 Nov 2021 12:35:00 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mprU6-004iZO-Tg; Wed, 24 Nov 2021 12:34:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1C5F1042;
 Wed, 24 Nov 2021 04:34:42 -0800 (PST)
Received: from [10.57.56.56] (unknown [10.57.56.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EDD13F73B;
 Wed, 24 Nov 2021 04:34:41 -0800 (PST)
Message-ID: <927eb333-695d-89d6-f02e-b178b53ae4d9@arm.com>
Date: Wed, 24 Nov 2021 12:34:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 0/3] Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
Content-Language: en-GB
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, - <devicetree-spec@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 senozhatsky@chromium.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
References: <20211123112104.3530135-1-hsinyi@chromium.org>
 <75ea1026-63e5-165a-9e07-27b5ac4c7579@arm.com>
 <CAJMQK-gHpmfedbRfR-1ZNLw0LpRDJHYoKLd-k3kvkqFf8vnD4A@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAJMQK-gHpmfedbRfR-1ZNLw0LpRDJHYoKLd-k3kvkqFf8vnD4A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_043447_090849_B8526549 
X-CRM114-Status: GOOD (  28.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-11-24 03:55, Hsin-Yi Wang wrote:
> On Tue, Nov 23, 2021 at 7:58 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2021-11-23 11:21, Hsin-Yi Wang wrote:
>>> Default IO_TLB_SEGSIZE (128) slabs may be not enough for some use cases.
>>> This series adds support to customize io_tlb_segsize for each
>>> restricted-dma-pool.
>>>
>>> Example use case:
>>>
>>> mtk-isp drivers[1] are controlled by mtk-scp[2] and allocate memory through
>>> mtk-scp. In order to use the noncontiguous DMA API[3], we need to use
>>> the swiotlb pool. mtk-scp needs to allocate memory with 2560 slabs.
>>> mtk-isp drivers also needs to allocate memory with 200+ slabs. Both are
>>> larger than the default IO_TLB_SEGSIZE (128) slabs.
>>
>> Are drivers really doing streaming DMA mappings that large? If so, that
>> seems like it might be worth trying to address in its own right for the
>> sake of efficiency - allocating ~5MB of memory twice and copying it back
>> and forth doesn't sound like the ideal thing to do.
>>
>> If it's really about coherent DMA buffer allocation, I thought the plan
>> was that devices which expect to use a significant amount and/or size of
>> coherent buffers would continue to use a shared-dma-pool for that? It's
>> still what the binding implies. My understanding was that
>> swiotlb_alloc() is mostly just a fallback for the sake of drivers which
>> mostly do streaming DMA but may allocate a handful of pages worth of
>> coherent buffers here and there. Certainly looking at the mtk_scp
>> driver, that seems like it shouldn't be going anywhere near SWIOTLB at all.
>>
> mtk_scp on its own can use the shared-dma-pool, which it currently uses.
> The reason we switched to restricted-dma-pool is that we want to use
> the noncontiguous DMA API for mtk-isp. The noncontiguous DMA API is
> designed for devices with iommu, and if a device doesn't have an
> iommu, it will fallback using swiotlb. But currently noncontiguous DMA
> API doesn't work with the shared-dma-pool.
> 
> vb2_dc_alloc() -> dma_alloc_noncontiguous() -> alloc_single_sgt() ->
> __dma_alloc_pages() -> dma_direct_alloc_pages() ->
> __dma_direct_alloc_pages() -> swiotlb_alloc().

OK, thanks for clarifying. My gut feeling is that drivers should 
probably only be calling the noncontiguous API when they *know* that 
they have a scatter-gather-capable device or IOMMU that can cope with 
it, but either way I'm still not convinced that it makes sense to hack 
up SWIOTLB with DT ABI baggage for an obscure fallback case. It would 
seem a lot more sensible to fix alloc_single_sgt() to not ignore 
per-device pools once it has effectively fallen back to the normal 
dma_alloc_attrs() flow, but I guess that's not technically guaranteed to 
uphold the assumption that we can allocate struct-page-backed memory.

Still, if we've got to the point of needing to use a SWIOTLB pool as 
nothing more than a bad reinvention of CMA, rather than an actual bounce 
buffer, that reeks of a fundamental design issue and adding more hacks 
on top to bodge around it is not the right way to go - we need to take a 
step back and properly reconsider how dma_alloc_noncontiguous() is 
supposed to interact with DMA protection schemes.

Thanks,
Robin.

>>> [1] (not in upstream) https://patchwork.kernel.org/project/linux-media/cover/20190611035344.29814-1-jungo.lin@mediatek.com/
>>> [2] https://elixir.bootlin.com/linux/latest/source/drivers/remoteproc/mtk_scp.c
>>> [3] https://patchwork.kernel.org/project/linux-media/cover/20210909112430.61243-1-senozhatsky@chromium.org/
>>>
>>> Hsin-Yi Wang (3):
>>>     dma: swiotlb: Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
>>>     dt-bindings: Add io-tlb-segsize property for restricted-dma-pool
>>>     arm64: dts: mt8183: use restricted swiotlb for scp mem
>>>
>>>    .../reserved-memory/shared-dma-pool.yaml      |  8 +++++
>>>    .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  4 +--
>>>    include/linux/swiotlb.h                       |  1 +
>>>    kernel/dma/swiotlb.c                          | 34 ++++++++++++++-----
>>>    4 files changed, 37 insertions(+), 10 deletions(-)
>>>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

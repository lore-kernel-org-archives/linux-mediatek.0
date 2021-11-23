Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EE8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 11:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYr1e1ihE7ge7W/K3K8O3Q65CMMoGeOXP27L2LE6Nn8=; b=ynVMI5Unu1njHt
	VhNxEFulGCa1NULhoiTvJOnwEfppoFh3ApDDyojTd8IFF+ga/xf/jo8KXHoJLi7HRKPdDhlHk3ip1
	pzaQj7k3pXD7wEtyMl9aVTcYcm3CXHd/fQoqdBuAvcpA81Vyex5OKNX1OzjxUPLC5QrT0JGn7udCj
	Gt0kvx9ufOIhohQy/Hnsfro1Y8T/VJCdJRnx8AWtDeov7FsLPvC7eiEZEjOs+GXR1cweAyCIRGOP7
	vHRbaKkETECXPkx9XninmQhE0BQSLIPyHrVPGcUxvkG+lwUzDkcNk36jOduVozYb5mMzzw1sgUYBh
	BJRkQZAusrXmdpK7O69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpUS6-001z6K-VV; Tue, 23 Nov 2021 11:59:10 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpURr-001z0f-Nz; Tue, 23 Nov 2021 11:58:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDC521063;
 Tue, 23 Nov 2021 03:58:54 -0800 (PST)
Received: from [10.57.56.56] (unknown [10.57.56.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8214F3F5A1;
 Tue, 23 Nov 2021 03:58:52 -0800 (PST)
Message-ID: <75ea1026-63e5-165a-9e07-27b5ac4c7579@arm.com>
Date: Tue, 23 Nov 2021 11:58:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 0/3] Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
Content-Language: en-GB
To: Hsin-Yi Wang <hsinyi@chromium.org>, Christoph Hellwig <hch@infradead.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 - <devicetree-spec@vger.kernel.org>, devicetree@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 senozhatsky@chromium.org, tfiga@chromium.org
References: <20211123112104.3530135-1-hsinyi@chromium.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211123112104.3530135-1-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_035855_874962_5AA7D7E6 
X-CRM114-Status: GOOD (  15.47  )
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

On 2021-11-23 11:21, Hsin-Yi Wang wrote:
> Default IO_TLB_SEGSIZE (128) slabs may be not enough for some use cases.
> This series adds support to customize io_tlb_segsize for each
> restricted-dma-pool.
> 
> Example use case:
> 
> mtk-isp drivers[1] are controlled by mtk-scp[2] and allocate memory through
> mtk-scp. In order to use the noncontiguous DMA API[3], we need to use
> the swiotlb pool. mtk-scp needs to allocate memory with 2560 slabs.
> mtk-isp drivers also needs to allocate memory with 200+ slabs. Both are
> larger than the default IO_TLB_SEGSIZE (128) slabs.

Are drivers really doing streaming DMA mappings that large? If so, that 
seems like it might be worth trying to address in its own right for the 
sake of efficiency - allocating ~5MB of memory twice and copying it back 
and forth doesn't sound like the ideal thing to do.

If it's really about coherent DMA buffer allocation, I thought the plan 
was that devices which expect to use a significant amount and/or size of 
coherent buffers would continue to use a shared-dma-pool for that? It's 
still what the binding implies. My understanding was that 
swiotlb_alloc() is mostly just a fallback for the sake of drivers which 
mostly do streaming DMA but may allocate a handful of pages worth of 
coherent buffers here and there. Certainly looking at the mtk_scp 
driver, that seems like it shouldn't be going anywhere near SWIOTLB at all.

Robin.

> [1] (not in upstream) https://patchwork.kernel.org/project/linux-media/cover/20190611035344.29814-1-jungo.lin@mediatek.com/
> [2] https://elixir.bootlin.com/linux/latest/source/drivers/remoteproc/mtk_scp.c
> [3] https://patchwork.kernel.org/project/linux-media/cover/20210909112430.61243-1-senozhatsky@chromium.org/
> 
> Hsin-Yi Wang (3):
>    dma: swiotlb: Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
>    dt-bindings: Add io-tlb-segsize property for restricted-dma-pool
>    arm64: dts: mt8183: use restricted swiotlb for scp mem
> 
>   .../reserved-memory/shared-dma-pool.yaml      |  8 +++++
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  4 +--
>   include/linux/swiotlb.h                       |  1 +
>   kernel/dma/swiotlb.c                          | 34 ++++++++++++++-----
>   4 files changed, 37 insertions(+), 10 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

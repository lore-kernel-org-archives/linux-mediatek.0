From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] kernel/dma: export dma_alloc_from_contiguous to modules
Date: Thu, 11 Jul 2019 12:03:32 +0200
Message-ID: <20190711100332.GA5853@lst.de>
References: <20190711053343.28873-1-miles.chen@mediatek.com> <7d14b94f-454f-d512-bc8f-589f71bc07ea@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7d14b94f-454f-d512-bc8f-589f71bc07ea@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: miles.chen@mediatek.com, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jul 11, 2019 at 09:50:58AM +0100, Robin Murphy wrote:
> On 11/07/2019 06:33, miles.chen@mediatek.com wrote:
>> From: Miles Chen <miles.chen@mediatek.com>
>>
>> This change exports dma_alloc_from_contiguous and
>> dma_release_from_contiguous to modules.
>>
>> Currently, we can add a reserve a memory node in dts files, make
>> it a CMA memory by setting compatible = "shared-dma-pool",
>> and setup the dev->cma_area by using of_reserved_mem_device_init_by_idx().
>>
>> Export dma_alloc_from_contiguous and dma_release_from_contiguous, so we
>> can allocate/free from/to dev->cma_area in kernel modules.
>
> As far as I understand, this was never intended for drivers to call 
> directly. If a device has its own private CMA area, then regular 
> dma_alloc_attrs() should allocate from that automatically; if that's not 
> happening already, then there's a bug somewhere.

Agreed.

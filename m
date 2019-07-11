From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] kernel/dma: export dma_alloc_from_contiguous to modules
Date: Thu, 11 Jul 2019 09:50:58 +0100
Message-ID: <7d14b94f-454f-d512-bc8f-589f71bc07ea@arm.com>
References: <20190711053343.28873-1-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190711053343.28873-1-miles.chen@mediatek.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: miles.chen@mediatek.com, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 11/07/2019 06:33, miles.chen@mediatek.com wrote:
> From: Miles Chen <miles.chen@mediatek.com>
> 
> This change exports dma_alloc_from_contiguous and
> dma_release_from_contiguous to modules.
> 
> Currently, we can add a reserve a memory node in dts files, make
> it a CMA memory by setting compatible = "shared-dma-pool",
> and setup the dev->cma_area by using of_reserved_mem_device_init_by_idx().
> 
> Export dma_alloc_from_contiguous and dma_release_from_contiguous, so we
> can allocate/free from/to dev->cma_area in kernel modules.

As far as I understand, this was never intended for drivers to call 
directly. If a device has its own private CMA area, then regular 
dma_alloc_attrs() should allocate from that automatically; if that's not 
happening already, then there's a bug somewhere.

Robin.

> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>   kernel/dma/contiguous.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index b2a87905846d..d5920bdedc77 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -197,6 +197,7 @@ struct page *dma_alloc_from_contiguous(struct device *dev, size_t count,
>   
>   	return cma_alloc(dev_get_cma_area(dev), count, align, no_warn);
>   }
> +EXPORT_SYMBOL_GPL(dma_alloc_from_contiguous);
>   
>   /**
>    * dma_release_from_contiguous() - release allocated pages
> @@ -213,6 +214,7 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
>   {
>   	return cma_release(dev_get_cma_area(dev), pages, count);
>   }
> +EXPORT_SYMBOL_GPL(dma_release_from_contiguous);
>   
>   /*
>    * Support for reserved memory regions defined in device tree
> 

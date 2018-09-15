From: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH v2] ARM: dma-mapping: always clear allocated buffers
Date: Sat, 15 Sep 2018 19:29:20 +0800
Message-ID: <dd77bd05-074b-c331-7ce5-30f78c75d3c3@huawei.com>
References: <20180725070706.19576-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180725070706.19576-1-yuehaibing@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux@armlinux.org.uk, matthias.bgg@gmail.com, vladimir.murzin@arm.com
Cc: zhongjiang@huawei.com, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, linux-mediatek@lists.infradead.org, iamjoonsoo.kim@lge.com, treding@nvidia.com, robin.murphy@arm.com, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


Ping.

On 2018/7/25 15:07, YueHaibing wrote:
> Sean Wang reported dma_zalloc_coherent doesn't work as expect on his
> armv7,the allocated mem is not zeroed.The reason is __alloc_from_pool
> doesn't honor __GFP_ZERO.
> 
> As commit 6829e274a623 ("arm64: dma-mapping: always clear allocated buffers")
> has pointed out,buffers allocated by dma_alloc_coherent() are always zeroed
> on most architectures. some drivers rely on this 'feature'. Allocated buffer
> might be also exposed to userspace with dma_mmap() call,so clearing it is
> desired from security point of view to avoid exposing random memory to userspace.
> 
> This patch unifies dma_alloc_coherent() behavior on ARM architecture with other
> implementations by unconditionally zeroing allocated buffer.Also to fix
> dma_zalloc_coherent behavior.
> 
> Reported-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Reviewed-by: zhong jiang <zhongjiang@huawei.com>
> ---
> v2: reference more argument from arm64 commit as Christoph suggested
> ---
>  arch/arm/mm/dma-mapping.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index 6656647..cf5882f 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -564,6 +564,7 @@ static void *__alloc_from_pool(size_t size, struct page **ret_page)
>  
>  		*ret_page = phys_to_page(phys);
>  		ptr = (void *)val;
> +		memset(ptr, 0, size);
>  	}
>  
>  	return ptr;
> 

From: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH v2] ARM: dma-mapping: always clear allocated buffers
Date: Wed, 22 Aug 2018 09:47:56 +0800
Message-ID: <7df4add3-2ca2-259c-c31c-b405d6270243@huawei.com>
References: <20180725070706.19576-1-yuehaibing@huawei.com>
 <a7723548-b6d9-318a-49d8-71081c594db2@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a7723548-b6d9-318a-49d8-71081c594db2@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, matthias.bgg@gmail.com, vladimir.murzin@arm.com
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org, iamjoonsoo.kim@lge.com, robin.murphy@arm.com, treding@nvidia.com, zhongjiang@huawei.com, sean.wang@mediatek.com, Christoph Hellwig <hch@infradead.org>
List-Id: linux-mediatek@lists.infradead.org


Russell, will you pick this patch?

On 2018/7/25 15:13, YueHaibing wrote:
> +CC  Christoph Hellwig <hch@infradead.org>
> 
> On 2018/7/25 15:07, YueHaibing wrote:
>> Sean Wang reported dma_zalloc_coherent doesn't work as expect on his
>> armv7,the allocated mem is not zeroed.The reason is __alloc_from_pool
>> doesn't honor __GFP_ZERO.
>>
>> As commit 6829e274a623 ("arm64: dma-mapping: always clear allocated buffers")
>> has pointed out,buffers allocated by dma_alloc_coherent() are always zeroed
>> on most architectures. some drivers rely on this 'feature'. Allocated buffer
>> might be also exposed to userspace with dma_mmap() call,so clearing it is
>> desired from security point of view to avoid exposing random memory to userspace.
>>
>> This patch unifies dma_alloc_coherent() behavior on ARM architecture with other
>> implementations by unconditionally zeroing allocated buffer.Also to fix
>> dma_zalloc_coherent behavior.
>>
>> Reported-by: Sean Wang <sean.wang@mediatek.com>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> Reviewed-by: zhong jiang <zhongjiang@huawei.com>
>> ---
>> v2: reference more argument from arm64 commit as Christoph suggested
>> ---
>>  arch/arm/mm/dma-mapping.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
>> index 6656647..cf5882f 100644
>> --- a/arch/arm/mm/dma-mapping.c
>> +++ b/arch/arm/mm/dma-mapping.c
>> @@ -564,6 +564,7 @@ static void *__alloc_from_pool(size_t size, struct page **ret_page)
>>  
>>  		*ret_page = phys_to_page(phys);
>>  		ptr = (void *)val;
>> +		memset(ptr, 0, size);
>>  	}
>>  
>>  	return ptr;
>>

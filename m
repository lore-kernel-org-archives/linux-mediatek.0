From: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH] ARM: dma-mapping: always clear allocated buffers
Date: Wed, 25 Jul 2018 10:24:07 +0800
Message-ID: <0414bb3e-33a2-8f30-f765-ee10ecb44fad@huawei.com>
References: <20180724140435.17112-1-yuehaibing@huawei.com>
 <20180724180906.GA8240@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724180906.GA8240@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: linux@armlinux.org.uk, matthias.bgg@gmail.com, vladimir.murzin@arm.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org, iamjoonsoo.kim@lge.com, robin.murphy@arm.com, treding@nvidia.com, zhongjiang@huawei.com
List-Id: linux-mediatek@lists.infradead.org

On 2018/7/25 2:09, Christoph Hellwig wrote:
> On Tue, Jul 24, 2018 at 10:04:35PM +0800, YueHaibing wrote:
>> Sean Wang report dma_zalloc_coherent doesn't work as expect on his
>> armv7,the allocated mem is not zeroed.The reason is __alloc_from_pool
>> doesn't honor __GFP_ZERO.
> 
> Please explain the "why" a little more.  All the explanations are in
> the referenced arm64 commit and should be mentioned here as well.

ok, will send v2.

> 
> .
> 

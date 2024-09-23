Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537F1CF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 07:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvHXEKnklcWRc5WpOcCs0OhOTmMRy5vRLxuwBAoMX+w=; b=FzaEw6qO0PSsRefaG23Q/vYBC6
	Fe26mrmObcU44Zswgxjq5ZJIWc7yLHe7JBJZ8SF5AHHNFSKw/f+GbdG4gY7RI2Q0vkmgBuscAhNM7
	N7h/qA7JDli1NRIk32RHhx0Uc2gSJz7AGblIwfUgSCLYcT/44R6omA1YaxS66MiSbNIvWXsnkZ3Lm
	z812mMV//kVslUp94sxct9dzdPm0+DrG9PZGCmmUcumEqJAYAMq6fqdB+XDyi32ENKV5a1J3Q6mbB
	whUyqenEdfLz4HBhQxZ7DJ3eR3306TYHqE6BMcLS2sCRK4buDEqQgMtwZToh3mqN3Kh9uesaeTEto
	VvsURPsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssd66-0000000GULC-1Hpt;
	Mon, 23 Sep 2024 07:03:02 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssd4V-0000000GU15-11CO;
	Mon, 23 Sep 2024 07:01:25 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XBv6L5xx7z1ymGS;
	Mon, 23 Sep 2024 15:01:14 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id 9CD3A1400F4;
	Mon, 23 Sep 2024 15:01:13 +0800 (CST)
Received: from [10.67.120.129] (10.67.120.129) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Sep 2024 15:01:13 +0800
Message-ID: <2fb8d278-62e0-4a81-a537-8f601f61e81d@huawei.com>
Date: Mon, 23 Sep 2024 15:01:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
From: Yunsheng Lin <linyunsheng@huawei.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
CC: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<liuyonglong@huawei.com>, <fanghaiqing@huawei.com>, <zhangkun09@huawei.com>,
	Robin Murphy <robin.murphy@arm.com>, Alexander Duyck
	<alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>, Wei Fang
	<wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, Eric Dumazet <edumazet@google.com>, Tony Nguyen
	<anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Saeed
 Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Tariq Toukan
	<tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Kalle Valo
	<kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew
 Morton <akpm@linux-foundation.org>, <imx@lists.linux.dev>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<intel-wired-lan@lists.osuosl.org>, <bpf@vger.kernel.org>,
	<linux-rdma@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mm@kvack.org>
References: <20240918111826.863596-1-linyunsheng@huawei.com>
 <20240918111826.863596-3-linyunsheng@huawei.com>
 <CAC_iWjK=G7Oo5=pN2QunhasgDC6NyC1L+96jigX7u9ad+PbYng@mail.gmail.com>
 <50a463d5-a5a1-422f-a4f7-d3587b12c265@huawei.com>
Content-Language: en-US
In-Reply-To: <50a463d5-a5a1-422f-a4f7-d3587b12c265@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.129]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_000123_884624_6FD684E8 
X-CRM114-Status: GOOD (  35.90  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2024/9/19 18:54, Yunsheng Lin wrote:
> On 2024/9/19 1:06, Ilias Apalodimas wrote:
>> Hi Yunsheng,
>>
>> Thanks for looking into this!
>>
>> On Wed, 18 Sept 2024 at 14:24, Yunsheng Lin <linyunsheng@huawei.com> wrote:
>>>
>>> Networking driver with page_pool support may hand over page
>>> still with dma mapping to network stack and try to reuse that
>>> page after network stack is done with it and passes it back
>>> to page_pool to avoid the penalty of dma mapping/unmapping.
>>
>> I think you can shorten this to "If recycling and DMA mapping are
>> enabled during the pool creation"
> 
> I am not sure if I understand the 'recycling' part here. Is the
> 'recycling' part referring to whether skb_mark_for_recycle() is
> called to enable recycling for the skb? Is there still any driver
> with page_pool support but doesn't call skb_mark_for_recycle()
> when handing over page to network stack?
> 
> For the 'DMA mapping' part, as there is no space in 'struct
> page' to track the inflight pages, so 'pp' in 'struct page'
> is renamed to 'pp_item' to enable the tracking of inflight
> page. I tried shortening this for 'pool->dma_map being false'
> when coding, but it seems differentiating the same field in
> 'struct page' doesn't make much sense according to 'pool->dma_map'
> as it means we might need to add an union in 'struct page' for
> that to work and add additional checking to decide if it is 'pp'
> or 'pp_item'.
> 
>>
>>> With all the caching in the network stack, some pages may be
>>> held in the network stack without returning to the page_pool
>>> soon enough, and with VF disable causing the driver unbound,
>>> the page_pool does not stop the driver from doing it's
>>> unbounding work, instead page_pool uses workqueue to check
>>> if there is some pages coming back from the network stack
>>> periodically, if there is any, it will do the dma unmmapping
>>> related cleanup work.
>>>
>>> As mentioned in [1], attempting DMA unmaps after the driver
>>> has already unbound may leak resources or at worst corrupt
>>> memory. Fundamentally, the page pool code cannot allow DMA
>>> mappings to outlive the driver they belong to.
>>>
>>> Currently it seems there are at least two cases that the page
>>> is not released fast enough causing dma unmmapping done after
>>> driver has already unbound:
>>> 1. ipv4 packet defragmentation timeout: this seems to cause
>>>    delay up to 30 secs:
>>>
>>> 2. skb_defer_free_flush(): this may cause infinite delay if
>>>    there is no triggering for net_rx_action().
>>>
>>> In order not to do the dma unmmapping after driver has already
>>> unbound and stall the unloading of the networking driver, add
>>> the pool->items array to record all the pages including the ones
>>> which are handed over to network stack, so the page_pool can
>>> do the dma unmmapping for those pages when page_pool_destroy()
>>> is called.
>>
>> So, I was thinking of a very similar idea. But what do you mean by
>> "all"? The pages that are still in caches (slow or fast) of the pool
>> will be unmapped during page_pool_destroy().
> 
> Yes, it includes the one in pool->alloc and pool->ring.

It worths mentioning that there is a semantics changing here:
Before this patch, there can be almost unlimited inflight pages used by
driver and network stack, as page_pool doesn't really track those pages.
After this patch, as we use a fixed-size pool->items array to track the
inflight pages, the inflight pages is limited by the pool->items, currently
the size of pool->items array is calculated as below in this patch:

+#define PAGE_POOL_MIN_ITEM_CNT	512
+	unsigned int item_cnt = (params->pool_size ? : 1024) +
+				PP_ALLOC_CACHE_SIZE + PAGE_POOL_MIN_ITEM_CNT;

Personally I would consider it is an advantage to limit how many pages which
are used by the driver and network stack, the problem seems to how to decide
the limited number of page used by network stack so that performance is not
impacted.

> 
>> Don't we 'just' need a list of the inflight packets and their pages or
>> fragments? What we could do is go through that list and unmap these
>> pages during page_pool_destroy().
> 
> The main reason for that is to avoid the overhead of page_pool_item_del()
> and page_pool_item_add() when allocing/freeing page from/to pool->alloc
> and pool->ring.
> 
> Yes, including the pages in pool->ring seems to make the pool->ring
> somewhat duplicated, maybe we can remove pool->ring if we can make
> and prove 'pool->items' is performing better than pool->ring in the
> future?
> 
>>
>> I'll have a closer look at the patch tomorrow
> 
> Thanks for the reviewing.
> 
>>
>> Thanks!
>> /Ilias
>>
> 


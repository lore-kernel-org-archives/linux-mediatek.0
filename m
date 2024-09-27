Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9CFCEBF76
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 03:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjUnBPn5EF1kvH/KA0jt5WOp4dBCwCnfOkcGltIjG1k=; b=TouAo9CCAm/6mw4uYxv6U+i9lT
	NFiaxEOnbrR7Ds5HZIghxDvhzeTbWrg4NnTYk6lDjoJWMio8EPnrL1ZoXO2sqmHNPxnwDsSnXaYW6
	JFVwXzN8k7zluhx3UA6RdTJBrlb9J+Wi0tl8XjpfJdtaIQAUqZUFdwcRUvnZJH0EpYDlI8GD6f7c+
	b2+PkVxD4WocIvv2M/HZ3H/ypwSoY75p51u+642vhcpYWvlnGmeUth1geTxRotIC9pe6exjkzAn0X
	j5E5h/3VsY3Us/zQV42wowydwxaR1gGr8P0geBGCbR7DGm40+apsVUkmgY40EVv3vObwr7HFhSDyQ
	SEZ5S45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su28h-00000009wOG-2uqE;
	Fri, 27 Sep 2024 03:59:31 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su27U-00000009w5g-0hc4;
	Fri, 27 Sep 2024 03:58:18 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XFGpN5NVMzGq8S;
	Fri, 27 Sep 2024 11:55:40 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id B3F901400CF;
	Fri, 27 Sep 2024 11:57:58 +0800 (CST)
Received: from [10.67.120.129] (10.67.120.129) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Sep 2024 11:57:58 +0800
Message-ID: <842c8cc6-f716-437a-bc98-70bc26d6fd38@huawei.com>
Date: Fri, 27 Sep 2024 11:57:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Mina Almasry <almasrymina@google.com>
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
 Morton <akpm@linux-foundation.org>, Ilias Apalodimas
	<ilias.apalodimas@linaro.org>, <imx@lists.linux.dev>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<intel-wired-lan@lists.osuosl.org>, <bpf@vger.kernel.org>,
	<linux-rdma@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mm@kvack.org>
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com>
 <CAHS8izOxugzWJDTc-4CWqaKABTj=J4OHs=Lcb=SE9r8gX0J+yg@mail.gmail.com>
Content-Language: en-US
From: Yunsheng Lin <linyunsheng@huawei.com>
In-Reply-To: <CAHS8izOxugzWJDTc-4CWqaKABTj=J4OHs=Lcb=SE9r8gX0J+yg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.129]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_205816_750678_0BD50191 
X-CRM114-Status: GOOD (  32.00  )
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

On 2024/9/27 2:15, Mina Almasry wrote:
> 
>> In order not to do the dma unmmapping after driver has already
>> unbound and stall the unloading of the networking driver, add
>> the pool->items array to record all the pages including the ones
>> which are handed over to network stack, so the page_pool can
>> do the dma unmmapping for those pages when page_pool_destroy()
>> is called.
> 
> One thing I could not understand from looking at the code: if the
> items array is in the struct page_pool, why do you need to modify the
> page_pool entry in the struct page and in the struct net_iov? I think
> the code could be made much simpler if you can remove these changes,
> and you wouldn't need to modify the public api of the page_pool.

As mentioned in [1]:
"There is no space in 'struct page' to track the inflight pages, so
'pp' in 'struct page' is renamed to 'pp_item' to enable the tracking
of inflight page"

As we still need pp for "struct page_pool" for page_pool_put_page()
related API, the container_of() trick is used to get the pp from the
pp_item.

As you had changed 'struct net_iov' to be mirroring the 'struct page',
so change 'struct net_iov' part accordingly.

1. https://lore.kernel.org/all/50a463d5-a5a1-422f-a4f7-d3587b12c265@huawei.com/

> 
>> As the pool->items need to be large enough to avoid
>> performance degradation, add a 'item_full' stat to indicate the
>> allocation failure due to unavailability of pool->items.
>>
> 
> I'm not sure there is any way to size the pool->items array correctly.

Currently the size of pool->items is calculated in page_pool_create_percpu()
as below, to make sure the size of pool->items is somewhat twice of the
size of pool->ring so that the number of page sitting in the driver's rx
ring waiting for the new packet is the similar to the number of page that is
still being handled in the network stack as most drivers seems to set the
pool->pool_size according to their rx ring size:

+#define PAGE_POOL_MIN_INFLIGHT_ITEMS		512
+	unsigned int item_cnt = (params->pool_size ? : 1024) +
+				PP_ALLOC_CACHE_SIZE + PAGE_POOL_MIN_INFLIGHT_ITEMS;
+	item_cnt = roundup_pow_of_two(item_cnt);

> Can you use a data structure here that can grow? Linked list or
> xarray?
> 
> AFAIU what we want is when the page pool allocates a netmem it will
> add the netmem to the items array, and when the pp releases a netmem
> it will remove it from the array. Both of these operations are slow
> paths, right? So the performance of a data structure more complicated
> than an array may be ok. bench_page_pool_simple will tell for sure.

The question would be why do we need the pool->items to grow with the
additional overhead and complication by dynamic allocation of item, using
complicated data structure and concurrent handling?

As mentioned in [2], it was the existing semantics, but it does not means
we need to keep it. The changing of semantics seems like an advantage
to me, as we are able to limit how many pages is allowed to be used by
a page_pool instance.

2. https://lore.kernel.org/all/2fb8d278-62e0-4a81-a537-8f601f61e81d@huawei.com/

> 
>> Note, the devmem patchset seems to make the bug harder to fix,
>> and may make backporting harder too. As there is no actual user
>> for the devmem and the fixing for devmem is unclear for now,
>> this patch does not consider fixing the case for devmem yet.
>>
> 
> net_iovs don't hit this bug, dma_unmap_page_attrs() is never called on
> them, so no special handling is needed really. However for code

I am really doubtful about your above claim. As at least the below
implementaion of dma_buf_unmap_attachment_unlocked() called in
__net_devmem_dmabuf_binding_free() seems be using the DMA API directly:

https://elixir.bootlin.com/linux/v6.7-rc8/source/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c#L215

Or am I missing something obvious here?

> quality reasons lets try to minimize the number of devmem or memory
> provider checks in the code, if possible.
> 


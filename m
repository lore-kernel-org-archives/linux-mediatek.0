Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0884CF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbsc/S+S7HQhPPj508Ku1haGxcV7bbpJJEqEmIjfO0A=; b=Eu8xKT1PySMBcB/z+qA2mKqvhk
	zwUI0E4718PSF10t11S5rfAtyyIIsD+IOmCqF8zp5Ot/t1scMQGypgnkv93zuypFZBZx/5kMHzueQ
	Xr9fWI1pFI5vt8zUiqOSHS+qAJIfI7S6T0+bYgNigtcd7Iq6FVo+r/sU0Y5mz56oM6949VMb5dbgH
	zUN1VC5rjkmJ5mO2ase4rY2lobhbTvgS4NXApLEBnGDY9sHrTy+VcC0EVeUkjnd/unI3qGff1PEJF
	E/sJiTw1Frfm+As4SZRTQVymlllOL2gAgqlIHBsqj8cSQAixbiW+xgkd901zIPhJ4dPhdscLwOzH3
	+6R8JQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sszLa-00000001JRa-3GSd;
	Tue, 24 Sep 2024 06:48:30 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sszKR-00000001JHM-1Xwx;
	Tue, 24 Sep 2024 06:47:20 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XCVl40H3fz6J6DN;
	Tue, 24 Sep 2024 14:46:40 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
	by mail.maildlp.com (Postfix) with ESMTPS id EE8BB140B63;
	Tue, 24 Sep 2024 14:47:07 +0800 (CST)
Received: from china (10.200.201.82) by frapeml500005.china.huawei.com
 (7.182.85.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 24 Sep
 2024 08:46:45 +0200
From: Gur Stavi <gur.stavi@huawei.com>
To: <linyunsheng@huawei.com>
CC: <akpm@linux-foundation.org>, <aleksander.lobakin@intel.com>,
	<alexander.duyck@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<anthony.l.nguyen@intel.com>, <ast@kernel.org>, <bpf@vger.kernel.org>,
	<daniel@iogearbox.net>, <davem@davemloft.net>, <edumazet@google.com>,
	<fanghaiqing@huawei.com>, <hawk@kernel.org>, <ilias.apalodimas@linaro.org>,
	<imx@lists.linux.dev>, <intel-wired-lan@lists.osuosl.org>,
	<iommu@lists.linux.dev>, <john.fastabend@gmail.com>, <kuba@kernel.org>,
	<kvalo@kernel.org>, <leon@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-mm@kvack.org>,
	<linux-rdma@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<liuyonglong@huawei.com>, <lorenzo@kernel.org>, <matthias.bgg@gmail.com>,
	<nbd@nbd.name>, <netdev@vger.kernel.org>, <pabeni@redhat.com>,
	<przemyslaw.kitszel@intel.com>, <robin.murphy@arm.com>,
	<ryder.lee@mediatek.com>, <saeedm@nvidia.com>, <sean.wang@mediatek.com>,
	<shayne.chen@mediatek.com>, <shenwei.wang@nxp.com>, <tariqt@nvidia.com>,
	<wei.fang@nxp.com>, <xiaoning.wang@nxp.com>, <zhangkun09@huawei.com>
Subject: Re: [PATCH net 2/2] page_pool: fix IOMMU crash when driver has already unbound
Date: Tue, 24 Sep 2024 09:45:59 +0300
Message-ID: <20240924064559.1681488-1-gur.stavi@huawei.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <2fb8d278-62e0-4a81-a537-8f601f61e81d@huawei.com>
References: <2fb8d278-62e0-4a81-a537-8f601f61e81d@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.201.82]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 frapeml500005.china.huawei.com (7.182.85.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_234719_712440_C4EA8F3E 
X-CRM114-Status: GOOD (  19.34  )
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

>>>> With all the caching in the network stack, some pages may be
>>>> held in the network stack without returning to the page_pool
>>>> soon enough, and with VF disable causing the driver unbound,
>>>> the page_pool does not stop the driver from doing it's
>>>> unbounding work, instead page_pool uses workqueue to check
>>>> if there is some pages coming back from the network stack
>>>> periodically, if there is any, it will do the dma unmmapping
>>>> related cleanup work.
>>>>
>>>> As mentioned in [1], attempting DMA unmaps after the driver
>>>> has already unbound may leak resources or at worst corrupt
>>>> memory. Fundamentally, the page pool code cannot allow DMA
>>>> mappings to outlive the driver they belong to.
>>>>
>>>> Currently it seems there are at least two cases that the page
>>>> is not released fast enough causing dma unmmapping done after
>>>> driver has already unbound:
>>>> 1. ipv4 packet defragmentation timeout: this seems to cause
>>>>    delay up to 30 secs:
>>>>
>>>> 2. skb_defer_free_flush(): this may cause infinite delay if
>>>>    there is no triggering for net_rx_action().
>>>>
>>>> In order not to do the dma unmmapping after driver has already
>>>> unbound and stall the unloading of the networking driver, add
>>>> the pool->items array to record all the pages including the ones
>>>> which are handed over to network stack, so the page_pool can
>>>> do the dma unmmapping for those pages when page_pool_destroy()
>>>> is called.
>>>
>>> So, I was thinking of a very similar idea. But what do you mean by
>>> "all"? The pages that are still in caches (slow or fast) of the pool
>>> will be unmapped during page_pool_destroy().
>>
>> Yes, it includes the one in pool->alloc and pool->ring.
>
> It worths mentioning that there is a semantics changing here:
> Before this patch, there can be almost unlimited inflight pages used by
> driver and network stack, as page_pool doesn't really track those pages.
> After this patch, as we use a fixed-size pool->items array to track the
> inflight pages, the inflight pages is limited by the pool->items, currently
> the size of pool->items array is calculated as below in this patch:
>
> +#define PAGE_POOL_MIN_ITEM_CNT	512
> +	unsigned int item_cnt = (params->pool_size ? : 1024) +
> +				PP_ALLOC_CACHE_SIZE + PAGE_POOL_MIN_ITEM_CNT;
>
> Personally I would consider it is an advantage to limit how many pages which
> are used by the driver and network stack, the problem seems to how to decide
> the limited number of page used by network stack so that performance is not
> impacted.

In theory, with respect to the specific problem at hand, you only have
a limit on the number of mapped pages inflight. Once you reach this
limit you can unmap these old pages, forget about them and remember
new ones.


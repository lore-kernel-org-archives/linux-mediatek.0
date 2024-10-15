Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C38CFC288
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dN7oaOwNEIx92nEf3A5VB6FzVv6Zzr3Fp2qH1sLAWLE=; b=FHQPPPYoxjIAKcRAAfECYY4ZvP
	gI8OlLTtioED9XUI9CozkAZkYztgfga93t3Q+K8mVvbd4LJSOzAbPJt5SWhZD5Y8Mn8EtIJFUgjIo
	1seeI8tQouLidIHzWYNBpCnnEIXxvagF4+MB7L+ni0iXehCWJLuttW2LPChWJvcqa+NuvxRugvkV0
	YBvU7UfALTNQBvhBpgRCYtVA4L6kw0pedP/e+b0qat3H0HpxADNZ6dz0jx7XZEhUltni4/UCaWJUw
	ZrhnaualbMjD0KvYlYG6UiE18SNZFWf0ds0OF/6eX1pWO9QQPKxZVu3XPMMaI7QsO8YP609mCvvRI
	eqEQLPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fI1-00000007wPW-1I8T;
	Tue, 15 Oct 2024 11:00:33 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fAU-00000007uc0-1j87;
	Tue, 15 Oct 2024 10:52:50 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XSW8J5gS7zfdGR;
	Tue, 15 Oct 2024 18:50:08 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id 5FC56140257;
	Tue, 15 Oct 2024 18:52:35 +0800 (CST)
Received: from [10.67.120.129] (10.67.120.129) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 15 Oct 2024 18:52:35 +0800
Message-ID: <5d9ea7bd-67bb-4a9d-a120-c8f290c31a47@huawei.com>
Date: Tue, 15 Oct 2024 18:52:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] fix two bugs related to page_pool
To: Jakub Kicinski <kuba@kernel.org>
CC: <davem@davemloft.net>, <pabeni@redhat.com>, <liuyonglong@huawei.com>,
	<fanghaiqing@huawei.com>, <zhangkun09@huawei.com>, Alexander Lobakin
	<aleksander.lobakin@intel.com>, Robin Murphy <robin.murphy@arm.com>,
	Alexander Duyck <alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>,
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<netdev@vger.kernel.org>, <intel-wired-lan@lists.osuosl.org>,
	<bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <b1fd5ece-b967-4e56-ad4f-64ec437e2634@huawei.com>
 <20241014171406.43e730c9@kernel.org>
Content-Language: en-US
From: Yunsheng Lin <linyunsheng@huawei.com>
In-Reply-To: <20241014171406.43e730c9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.129]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_035247_627239_348AAF3B 
X-CRM114-Status: GOOD (  19.31  )
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

On 2024/10/15 8:14, Jakub Kicinski wrote:
> On Sat, 12 Oct 2024 20:05:31 +0800 Yunsheng Lin wrote:
>> 1. Semantics changing of supporting unlimited inflight pages
>>    to limited inflight pages that are as large as the pool_size
>>    of page_pool.
> 
> How can this possibly work?

As a similar comment in [1], do we really need unlimited inflight pages
for the page_pool to work? If we do, it seems there is something really
need fixing here. I am agreed changing of semantics here might introduce
regressions here because there may be some subsystem depending on the
previous semantics or incorrect calculating of how many inflight pages it
is needed, so I am agreed that it might be better to target the net-next
tree to give some cycles of testing before backporting it.

1. https://lore.kernel.org/all/842c8cc6-f716-437a-bc98-70bc26d6fd38@huawei.com/

> 
> The main thing stopping me from reposting my fix that it'd be nice to
> figure out if a real IOMMU device is bound or not. If we don't have

device_iommu_mapped() might be used to check if a real IOMMU device is
bound or not.
I am afraid it is not just about IOMMU here as there might be other
resource behind the dma mapping, like the bounce buffer memory as below:

https://elixir.bootlin.com/linux/v6.7-rc8/source/drivers/iommu/dma-iommu.c#L1204
https://elixir.bootlin.com/linux/v6.7-rc8/source/kernel/dma/direct.h#L125

And we may argue is_swiotlb_active() can be used check if there is any
bounce buffer memory behind the dma mapping as the device_iommu_mapped()
does, but I am not sure if there is any other resource besides iommu and
bounce buffer.

> real per-device mappings we presumably don't have to wait. If we can 

For not having to wait part:
I am not sure if the page_pool_destroy()/__page_pool_release_page_dma()
need to synchronize with arch_teardown_dma_ops() or how to synchronize
with it, as it seems to be called when driver unloading even if we have
ensured that there is no IOMMU or bounce buffer memory behind the device
by the above checking:
__device_release_driver -> device_unbind_cleanup -> arch_teardown_dma_ops

> check this condition we are guaranteed not to introduce regressions,
> since we would be replacing a crash by a wait, which is strictly better.

For the waiting part:
The problem is how much time we need to wait when device_iommu_mapped()
or is_swiotlb_active() return true here, as mentioned in [2], [3]. And
currently the waiting might be infinite as the testing in [4].

> 
> If we'd need to fiddle with too many internals to find out if we have
> to wait - let's just always wait and see if anyone complains.

Does the testing report in [4] classify as someone complaining? As
the driver unloading seems to be stalling forever, and the cause of the
infinite stalling is skb_attempt_defer_free() by debugging as mentioned
in [2].

2. https://lore.kernel.org/all/2c5ccfff-6ab4-4aea-bff6-3679ff72cc9a@huawei.com/
3. https://lore.kernel.org/netdev/d50ac1a9-f1e2-49ee-b89b-05dac9bc6ee1@huawei.com/
4. https://lore.kernel.org/netdev/758b4d47-c980-4f66-b4a4-949c3fc4b040@huawei.com/

> 


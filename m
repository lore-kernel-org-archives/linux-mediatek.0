Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA84CF2566
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 12:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4q+5yM/yTzJBMrMhD9gLrCWAQ7obBGvJ5w2ryoNvuqE=; b=XD27KSxieIKldQBYa+pnBELK+O
	LMjI40+dUN9Fjx1NpHZRZyiAFeFltYlqM3lxe8rJXLEXHfBnxDWLY3YXQb2gnXxSq2HbE/6PkOhGc
	fODs76UJxcHLYx5z/z7vw58nTOJj6IjN/ZguQlmX1cSLiEi1ruixOO8ahj2jajCH027+SqapOfYVE
	kV0vZcH6oDBe8GmnH9ijTl76IfQNFZb6L+6f8FjipLNEokqpt58qklW6OVb9B/Q4cvIIIYLuK7whr
	0i7qw/X3fcjLXGDhgdbZ4DRclEt3OQa9IjdPhcPuT/Pdz1zeT+rnRTz+2tD9dlIQHYIhxGztmR3aw
	Wroh58Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szav8-00000001Ai0-43rr;
	Sat, 12 Oct 2024 12:08:30 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szatE-00000001AXK-3EBQ;
	Sat, 12 Oct 2024 12:06:34 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XQhvv1XPnzkWcD;
	Sat, 12 Oct 2024 20:03:07 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id 66A98140393;
	Sat, 12 Oct 2024 20:05:32 +0800 (CST)
Received: from [10.67.120.129] (10.67.120.129) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 12 Oct 2024 20:05:32 +0800
Message-ID: <b1fd5ece-b967-4e56-ad4f-64ec437e2634@huawei.com>
Date: Sat, 12 Oct 2024 20:05:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] fix two bugs related to page_pool
To: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>
CC: <liuyonglong@huawei.com>, <fanghaiqing@huawei.com>,
	<zhangkun09@huawei.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
	Robin Murphy <robin.murphy@arm.com>, Alexander Duyck
	<alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper
 Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <netdev@vger.kernel.org>,
	<intel-wired-lan@lists.osuosl.org>, <bpf@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
Content-Language: en-US
From: Yunsheng Lin <linyunsheng@huawei.com>
In-Reply-To: <20240925075707.3970187-1-linyunsheng@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.129]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_050633_142734_F4C6757E 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On 2024/9/25 15:57, Yunsheng Lin wrote:
> Patch 1 fix a possible time window problem for page_pool.
> Patch 2 fix the kernel crash problem at iommu_get_dma_domain
> reported in [1].

Hi, all

Through the discussions, it seems there are some main concerns
as below:
1. Semantics changing of supporting unlimited inflight pages
   to limited inflight pages that are as large as the pool_size
   of page_pool.
2. The overhead of finding available pool->items in
   page_pool_item_add().

Any other concerns I missed here?
As it is unclear about the impact of the above concerns, which seemed
to lead Paolo to suggest this patchset targetting net-next tree
instead of net tree, so I am planning to target the net-next tree
keeping the 'Fixes' tag for the next version, if there is any other
opinion here, please let me know.

Also, I still have the page_frag refactoring patchset pending in the
nex-next, please let me know if I should wait for that patchset to
be applied before sending this one to the net-next tree.

> 


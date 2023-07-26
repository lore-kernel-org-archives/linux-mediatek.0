Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06F6C001DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 11:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sK0kgM1qCMYqQnrsj5vIUTt6Q9joWkAbe4gNe7raM9g=; b=WfgJU4Ukg554InWRvoE9LaBIij
	rzYg1hnERcluJEPL9AnnV5MxlJEGYq1B7nIw0RtDsLRrpqLzhfngLFzD5uCj8qNzPfKwr8BMwto4t
	XMdSuq207WbPEdKz1MDx/Q2ShG31Bu4wt9JXT9xxEDq0tLnmrk8LI//qsWcxPL4ocxMHCT6xaCcrp
	sZKoYH4pOaxxcHHhgjjMLQ/ABgqVeAytJPS7h30UFhsdJj91ifuEj7HdmZ1SSIOhShuU3nuCUUloy
	KO4Tn6EBdDS2ijp1SpFtXPEI/jGz0tptNLx1SPnyXkLHQcQkl8RblnIo13W6vXKmkGnBRNUw6K7mJ
	vSORycFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOccB-00A8Gx-2o;
	Wed, 26 Jul 2023 11:23:35 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOcc7-00A8E5-1k;
	Wed, 26 Jul 2023 11:23:33 +0000
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R9s181gh0zTlsy;
	Wed, 26 Jul 2023 19:21:48 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 26 Jul
 2023 19:23:22 +0800
Subject: Re: [PATCH net-next v2] page_pool: split types and declarations from
 page_pool.h
To: Alexander Lobakin <aleksander.lobakin@intel.com>, Alexander H Duyck
	<alexander.duyck@gmail.com>
CC: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eric Dumazet
	<edumazet@google.com>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
	<shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team
	<linux-imx@nxp.com>, Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya
	<gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad
	<hkelam@marvell.com>, Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky
	<leon@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne
 Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Kalle
 Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>, <linux-rdma@vger.kernel.org>,
	<bpf@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20230725131258.31306-1-linyunsheng@huawei.com>
 <94272ffed7636c4c92fcc73ccfc15236dd8e47dc.camel@gmail.com>
 <16b4ab57-dfb0-2c1d-9be1-57da30dff3c3@intel.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <22af47fe-1347-3e32-70bf-745d833e88b9@huawei.com>
Date: Wed, 26 Jul 2023 19:23:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <16b4ab57-dfb0-2c1d-9be1-57da30dff3c3@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_042331_926138_46BC6F79 
X-CRM114-Status: GOOD (  20.19  )
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

On 2023/7/26 18:43, Alexander Lobakin wrote:
> From: Alexander H Duyck <alexander.duyck@gmail.com>
> Date: Tue, 25 Jul 2023 08:47:46 -0700
> 
>> On Tue, 2023-07-25 at 21:12 +0800, Yunsheng Lin wrote:
>>> Split types and pure function declarations from page_pool.h
>>> and add them in page_pool/types.h, so that C sources can
>>> include page_pool.h and headers should generally only include
>>> page_pool/types.h as suggested by jakub.
>>>
>>> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
>>> Suggested-by: Jakub Kicinski <kuba@kernel.org>
>>> CC: Alexander Lobakin <aleksander.lobakin@intel.com>
> 
> [...]
> 
>>> +/* Caller must provide appropriate safe context, e.g. NAPI. */
>>> +void page_pool_update_nid(struct page_pool *pool, int new_nid);
>>> +
>>> +#endif /* _NET_PAGE_POOL_H */
>>
>>
>> This seems kind of overkill for what is needed. It seems like the
>> general thought process with splitting this was so that you had just
>> the minimum of what is needed to support skbuff.h and the functions
>> declared there. The rest of this would then be added via the .h to the
>> .c files that will actually be calling the functions.
>>
>> By that logic I think the only thing we really need is the function
>> declaration for page_pool_return_skb_page moved into skbuff.h. We could
>> then just remove page_pool.h from skbuff.h couldn't we?
> 
> This patch is not to drop page_pool.h include from skbuff.h.
> This is more future-proof (since I'm dropping this include anyway in my
> series) to have includes organized and prevent cases like that one with
> skbuff.h from happening. And to save some CPU cycles on preprocessing if
> that makes sense.

The suggestion is from below:

https://lore.kernel.org/all/20230710113841.482cbeac@kernel.org/

> 
>>
>> Another thing we could consider doing is looking at splitting things up
>> so that we had a include file in net/core/page_pool.h to handle some of
>> the cases where we are just linking the page_pool bits to other core
>> file bits such as xdp.c and skbuff.c.

I suppose the above suggestion is about splitting or naming by
the user as the discussed in the below thread?
https://lore.kernel.org/all/20230721182942.0ca57663@kernel.org/

> 
> Thanks,
> Olek
> .
> 


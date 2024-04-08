Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE71CD128A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 13:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORLkhynfBFHHDPhjF0u1q3AJHwDrnAw4ZNbKzeYJlhQ=; b=AWcW3pX/yjWNBO0+DLH8M7ZzCH
	aHmGTdg55cTM9z3xiYTOjnilvANUgghGk5ddhpuHLBjUY/gJYhqdvsPj6oDXjK8MLHoGfJBtjrVf/
	k19XtyUWErka9u4LlthsTz3cCYXJflzZq3Sjd5kW1rwlzRKtbZV1Bu1Gr1pLIpPYSwnLveV6vZJSf
	HiPJ61Re3tsnbVJfEXIHdAi7ruqQQfRArRoSnrhmI6PmHYte5ayRaEHJDa7fgs0nOQwCbhOQJyUiA
	pd+tccrGm3YVXAIEGCPTq/FdN726kgahlDjkq+6jGagpJtt63KgKbtKcg7+PswYmeK+PxCBcl2AOB
	eYfE9aBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtpCg-0000000FkRM-27rR;
	Mon, 08 Apr 2024 13:38:30 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtpCW-0000000FkLm-4AEh;
	Mon, 08 Apr 2024 13:38:25 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VCqq459Xjz1ymVC;
	Mon,  8 Apr 2024 21:35:44 +0800 (CST)
Received: from dggpemm500005.china.huawei.com (unknown [7.185.36.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D06118002D;
	Mon,  8 Apr 2024 21:37:58 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 8 Apr
 2024 21:37:58 +0800
Subject: Re: [PATCH net-next v1 00/12] First try to replace page_frag with
 page_frag_cache
To: Alexander Duyck <alexander.duyck@gmail.com>
CC: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<bpf@vger.kernel.org>
References: <20240407130850.19625-1-linyunsheng@huawei.com>
 <CAKgT0Uex+e_g9nyqk6DiB03U4zs_A1z2LoztHnpYbJ9LPm=NFA@mail.gmail.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <05c21500-033b-dfee-6aa7-1ee967616213@huawei.com>
Date: Mon, 8 Apr 2024 21:37:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAKgT0Uex+e_g9nyqk6DiB03U4zs_A1z2LoztHnpYbJ9LPm=NFA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_063821_531712_820F133F 
X-CRM114-Status: GOOD (  30.99  )
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

On 2024/4/8 1:02, Alexander Duyck wrote:
> On Sun, Apr 7, 2024 at 6:10 AM Yunsheng Lin <linyunsheng@huawei.com> wrote:
>>
>> After [1], Only there are two implementations for page frag:
>>
>> 1. mm/page_alloc.c: net stack seems to be using it in the
>>    rx part with 'struct page_frag_cache' and the main API
>>    being page_frag_alloc_align().
>> 2. net/core/sock.c: net stack seems to be using it in the
>>    tx part with 'struct page_frag' and the main API being
>>    skb_page_frag_refill().
>>
>> This patchset tries to unfiy the page frag implementation
>> by replacing page_frag with page_frag_cache for sk_page_frag()
>> first. net_high_order_alloc_disable_key for the implementation
>> in net/core/sock.c doesn't seems matter that much now have
>> have pcp support for high-order pages in commit 44042b449872
>> ("mm/page_alloc: allow high-order pages to be stored on the
>> per-cpu lists").
>>
>> As the related change is mostly related to networking, so
>> targeting the net-next. And will try to replace the rest
>> of page_frag in the follow patchset.
>>
>> After this patchset, we are not only able to unify the page
>> frag implementation a little, but seems able to have about
>> 0.5+% performance boost testing by using the vhost_net_test
>> introduced in [1] and page_frag_test.ko introduced in this
>> patch.
> 
> One question that jumps out at me for this is "why?". No offense but
> this is a pretty massive set of changes with over 1400 additions and
> 500+ deletions and I can't help but ask why, and this cover page
> doesn't give me any good reason to think about accepting this set.

There are 375 + 256 additions for testing module and the documentation
update in the last two patches, and there is 198 additions and 176
deletions for moving the page fragment allocator from page_alloc into
its own file in patch 1.
Without above number, there are above 600+ additions and 300+ deletions,
deos that seems reasonable considering 140+ additions are needed to for
the new API, 300+ additions and deletions for updating the users to use
the new API as there are many users using the old API?

> What is meant to be the benefit to the community for adding this? All
> I am seeing is a ton of extra code to have to review as this
> unification is adding an additional 1000+ lines without a good
> explanation as to why they are needed.

Some benefits I see for now:
1. Improve the maintainability of page frag's implementation:
   (1) future bugfix and performance can be done in one place.
       For example, we may able to save some space for the
       'page_frag_cache' API user, and avoid 'get_page()' for
       the old 'page_frag' API user.

   (2) Provide a proper API so that caller does not need to access
       internal data field. Exposing the internal data field may
       enable the caller to do some unexpcted implementation of
       its own like below, after this patchset the API user is not
       supposed to do access the data field of 'page_frag_cache'
       directly[Currently it is still acessable from API caller if
       the caller is not following the rule, I am not sure how to
       limit the access without any performance impact yet].
https://elixir.bootlin.com/linux/v6.9-rc3/source/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_io.c#L1141

2. page_frag API may provide a central point for netwroking to allocate
   memory instead of calling page allocator directly in the future, so
   that we can decouple 'struct page' from networking.

> 
> Also I wouldn't bother mentioning the 0.5+% performance gain as a
> "bonus". Changes of that amount usually mean it is within the margin
> of error. At best it likely means you haven't introduced a noticeable
> regression.

For micro-benchmark ko added in this patchset, performance gain seems quit
stable from testing in system without any other load.

> .
> 


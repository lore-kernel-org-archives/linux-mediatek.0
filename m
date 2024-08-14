Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C6BC52D7B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Aug 2024 11:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDFi8G/gvWG/uLs8nFSLe/kVh6W8heQhwstyIMvduTw=; b=oECxwk689h8ZIarE8PjSDfR73b
	xaJ/6JLkXrzNGsoae1ucU9dgqOHwCwaIUIQn5EXoHJYiSL3v8PvG0T1jVakTD79SPE06fZJEm72yF
	TW7zijjBGXmdPOyZdDuOAqQNYB2ZqqaF7P5c0DzvRTO7xHx6w4BBnO/QU+ccB5wLE5wso1jWLSjuY
	LLSI6n6G4v0xBur1aUarLLzdoEr1fprQNE/vzzYbwxPMi6Mtr6VolD9yUJTwbU8Lc57Zk2JCKSk+0
	uVXpEJty7fTOFsHvg574c8J0EzamOP9glMsE0bavpVITlYU3iwAT39ooS8MHQaf0jY375o98stjZE
	WA0H98pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seCbe-00000006qji-0tGq;
	Wed, 14 Aug 2024 11:55:58 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seCay-00000006qYr-3r9I;
	Wed, 14 Aug 2024 11:55:19 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WkRQH04FVz2CmlL;
	Wed, 14 Aug 2024 19:50:15 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id 13E4F180019;
	Wed, 14 Aug 2024 19:55:07 +0800 (CST)
Received: from [10.67.120.129] (10.67.120.129) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 14 Aug 2024 19:55:06 +0800
Message-ID: <302315e8-9c0d-433a-a6fd-24b46645179e@huawei.com>
Date: Wed, 14 Aug 2024 19:55:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v13 00/14] Replace page_frag with page_frag_cache
 for sk_page_frag()
To: Alexander Duyck <alexander.duyck@gmail.com>
CC: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20240808123714.462740-1-linyunsheng@huawei.com>
 <4aba9fae-563d-4a4e-8336-44e24551d9f9@huawei.com>
 <CAKgT0UezjgRX9QUWkee_p8KVQQa1va12k2CaGJeOYrr5LGg4YQ@mail.gmail.com>
Content-Language: en-US
From: Yunsheng Lin <linyunsheng@huawei.com>
In-Reply-To: <CAKgT0UezjgRX9QUWkee_p8KVQQa1va12k2CaGJeOYrr5LGg4YQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.129]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_045517_610007_F67BA16A 
X-CRM114-Status: GOOD (  21.76  )
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

On 2024/8/13 23:11, Alexander Duyck wrote:
> On Tue, Aug 13, 2024 at 4:30 AM Yunsheng Lin <linyunsheng@huawei.com> wrote:
>>
>> On 2024/8/8 20:37, Yunsheng Lin wrote:
>>
>> ...
>>
>>>
>>> CC: Alexander Duyck <alexander.duyck@gmail.com>
>>>
>>> 1. https://lore.kernel.org/all/20240228093013.8263-1-linyunsheng@huawei.com/
>>>
>>> Change log:
>>> V13:
>>>    1. Move page_frag_test from mm/ to tools/testing/selftest/mm
>>>    2. Use ptr_ring to replace ptr_pool for page_frag_test.c
>>>    3. Retest based on the new testing ko, which shows a big different
>>>       result than using ptr_pool.
>>
>> Hi, Davem & Jakub & Paolo
>>     It seems the state of this patchset is changed to 'Deferred' in the
>> patchwork, as the info regarding the state in 'Documentation/process/
>> maintainer-netdev.rst':
>>
>> Deferred           patch needs to be reposted later, usually due to dependency
>>                    or because it was posted for a closed tree
>>
>> Obviously it was not the a closed tree reason here, I guess it was the dependency
>> reason casuing the 'Deferred' here? I am not sure if I understand what sort of
>> dependency this patchset is running into? It would be good to mention what need
>> to be done avoid the kind of dependency too.
>>
>>
>> Hi, Alexander
>>     The v13 mainly address your comments about the page_fage_test module.
>> It seems the your main comment about this patchset is about the new API
>> naming now, and it seems there was no feedback in previous version for
>> about a week:
>>
>> https://lore.kernel.org/all/ca6be29e-ab53-4673-9624-90d41616a154@huawei.com/
>>
>> If there is still disagreement about the new API naming or other things, it
>> would be good to continue the discussion, so that we can have better
>> understanding of each other's main concern and better idea might come up too,
>> like the discussion about new layout for 'struct page_frag_cache' and the
>> new refactoring in patch 8.
> 
> Sorry for not getting to this sooner. I have been travelling for the
> last week and a half. I just got home on Sunday and I am suffering
> from a pretty bad bout of jet lag as I am overcoming a 12.5 hour time
> change. The earliest I can probably get to this for review would be
> tomorrow morning (8/14 in the AM PDT) as my calendar has me fully
> booked with meetings most of today.

Thanks for the clarifying.
Appreciating for the time and effort of reviewing.


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045DBEB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 21:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SapvGtbAG+0bVit+0Tm+MsVJ60sIt9Oa1ltS1DpfUI=; b=e4CL2ZOcCGXRMa6N/w/zOJJZYC
	jbMA1Teh1/NrZxgrTq5a64LeW9U6iFkQTa1D3QJn0AGmJ8CwuwbROuy0ZY1nHzBK6asWKGYmINsAQ
	S6jI67R5rooaeHI2Vjw84XoO5SuzyQ4BfunAqA/FNYn6CrY58P6ZOzgzdt9IOfoNMY/Fr8JDiX6Qc
	e91o9ooBF+JX60YeoRRMSIyGM+5A5faM8nkfkk6VEAD7YB5u6662R40GfDq2xmHMK6dJqe2o+JVSL
	kVhqsYrMaOo164mdy1LiG6QoeEhPLxCP9q7KWiqmOw0S4pTc9RCqeXWdjTb8CEbN+caMG1/aF3FTO
	7JZi9WUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJL5M-00Fvee-1F;
	Tue, 11 Jul 2023 21:39:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJL5J-00Fve3-0w;
	Tue, 11 Jul 2023 21:39:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE04A61625;
	Tue, 11 Jul 2023 21:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF44BC433CD;
	Tue, 11 Jul 2023 21:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689111588;
	bh=JeYMKVTHpX+mkS2wyDV046rxCvoZrycBAR6v9F7dqzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BIxi+xqxXbSAAHSDt3HW5sc8s+Bze60OcJfIesLMLzc3ubmdKI+LkzhTB6R385BCP
	 ZhuOVwrSSGqlRFzuRdfUliB9xXFKZGpWJHG15yymsWXnC28OMSwPdlipwDoPyC8WaV
	 qahwRAi9RNg8YBfqDKMYKzV9b0pgM/uxXj6JTR5iBr+Ev1d7+XD/0PRdNrLF2uuoCB
	 AH9nKR1XnLkK2FVLC6O8IE9/rZA7whb6wtYFFvPEGTwU68azvz2XzarsLz99lntKFG
	 LFYDygWxhUZbte80d+3b6lTReiohgRpfR+oaqjY/lBz9Jho4pWgrC65B6XcKEjtKng
	 vXGneiM3kO1GQ==
Message-ID: <2263ae79-690e-8a4d-fca2-31aacc5c9bc6@kernel.org>
Date: Tue, 11 Jul 2023 15:39:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@lst.de>,
 John Hubbard <jhubbard@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Jesper Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com,
 Alexander Duyck <alexander.duyck@gmail.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net,
 pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, Yisen Zhuang
 <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Eric Dumazet <edumazet@google.com>, Sunil Goutham <sgoutham@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep
 <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-rdma@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jonathan Lemon <jonathan.lemon@gmail.com>
References: <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org>
 <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
 <ZKNA9Pkg2vMJjHds@ziepe.ca>
 <CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com>
 <ZKxDZfVAbVHgNgIM@ziepe.ca>
 <CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
 <ZKyZBbKEpmkFkpWV@ziepe.ca> <20230711042708.GA18658@lst.de>
 <20230710215906.49514550@kernel.org> <20230711050445.GA19323@lst.de>
 <ZK1FbjG+VP/zxfO1@ziepe.ca> <20230711090047.37d7fe06@kernel.org>
 <04187826-8dad-d17b-2469-2837bafd3cd5@kernel.org>
 <20230711093224.1bf30ed5@kernel.org>
 <CAHS8izNHkLF0OowU=p=mSNZss700HKAzv1Oxqu2bvvfX_HxttA@mail.gmail.com>
 <20230711133915.03482fdc@kernel.org>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20230711133915.03482fdc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_143949_409468_C781AC10 
X-CRM114-Status: GOOD (  25.29  )
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

On 7/11/23 2:39 PM, Jakub Kicinski wrote:
> On Tue, 11 Jul 2023 10:06:28 -0700 Mina Almasry wrote:
>>>> Any reason not to allow an alternative representation for skb frags than
>>>> struct page?  
>>>
>>> I don't think there's a hard technical reason. We can make it work.  
>>
>> I also think we can switch the representation for skb frags to
>> something else. However - please do correct me if I'm wrong - I don't
>> think that is sufficient for device memory TCP. My understanding is
>> that we also need to modify any NIC drivers that want to use device
>> memory TCP to understand a new memory type, and the page pool as well
>> if that's involved. I think in particular modifying the memory type in
>> all the NIC drivers that want to do device memory TCP is difficult. Do
>> you think this is feasible?
> 
> That's why I was thinking about adding an abstraction between 
> the page pool and the driver. Instead of feeding driver pages
> a new abstraction could feed the driver just an identifier and a PA.

skb frag is currently a bio_vec. Overloading the 'struct page' address
in that struct with another address is easy to do. Requiring a certain
alignment on the address gives you a few low bits to use a flags / magic
/ etc.

Overloading len and offset is not really possible - way too much code is
affected (e.g., iov walking and MSS / TSO segmenting).

ie., you could overload page address with a pointer to an object in your
new abstraction layer and the struct has the other meta data.

typedef struct skb_frag {
	union {
		struct bio_vec bvec;
		struct new_abstraction abs;
	};
} skb_frag_t;

where

struct new_abstraction {
	void *addr,
	unsigned int len;
	unsigned int offset;
};

I have been playing with a similar and it co-exists with the existing
code quite well with the constraint on location of len and offset.

> 
> Whether we want to support fragmentation in that model or not would 
> have to be decided.
> 
> We can take pages from the page pool and feed them to drivers via
> such an API, but drivers need to stop expecting pages.

yes, drivers would have to be updated to understand the new format. A
downside, but again relatively easy to manage.

> 
> That's for data buffers only, obviously. We can keep using pages 
> and raw page pool for headers.

yes.


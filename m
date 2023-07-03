Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF5FEB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 04:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjlxhH4ijC7QyuDo/8wiow2sLo1Fbnw9VpWisZFwlCk=; b=JJbASurlhmWg20e3va1PZCSthY
	+r1gQuw8hWlH+MHiHb7bUWaNxKyPsBa6S3OV8OKFaLO5VGLVQQooeCaXhtbhz/hNVCaKGJAuy82Vl
	cBF+/QwFRun38vQFwSjOlPl/E6m9ECpf6Eu88xMW+TfYyJIbx8j7Tlboyej+kuFDivp26VwMOm0F9
	jAFTQ/GY2ptMwRyhqZNdRyPaZrhr3POw4grR6cfLSeLsKsw13TWTtC27QCKKdBlLzadjtlR1l4l0Z
	eHpAcRUTAvtJNptixVG+Pp5Cpjx3puFiIcHQQyMy5xF7tJAuhd4nZ3i+IM09YLMf1mULdN0ecV6g4
	H+tOMTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGB2y-009Fct-0d;
	Mon, 03 Jul 2023 04:20:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGB2u-009Fbv-1Y;
	Mon, 03 Jul 2023 04:20:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA0D060D3E;
	Mon,  3 Jul 2023 04:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB95C433C7;
	Mon,  3 Jul 2023 04:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688358014;
	bh=g+NyWV/CexXUiyOqlItDfjJ3EGxzVV4vutoEhQgmgRE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jYuTGtjLUZ3d3Cf6NhWruY9XwTZ4pLdPGyhaLNXC/Q65MiZ/r7PoKia+Oy5Bifp+r
	 QuWk/4SrAgnwJiHH4ifievgLO6Dbes92ZkrwGRDzFTJWs8Ux75DQl7CTzr8yK+vRfC
	 RA07Fgcyh9jEZFaZoNY/INCTW+RBFI+N21YWxFWiAuiw54iYo9lj1WKBBwD3zQytAA
	 Gkm4PgFdF7PgFavX/z/xwvyeZYkTdxMGwntylKTzsbi/sfn1vm4ilgtg+eWS11tUI8
	 65TAVngsisaUIYdVyxkrjHI4c7W5wMYRAVzA42Ztx7RdnS0MffzNlWpGqfW7+98iP7
	 y2ZquSmjdFv1A==
Message-ID: <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org>
Date: Sun, 2 Jul 2023 22:20:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Jesper Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com,
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
References: <20230612130256.4572-1-linyunsheng@huawei.com>
 <20230612130256.4572-5-linyunsheng@huawei.com>
 <20230614101954.30112d6e@kernel.org>
 <8c544cd9-00a3-2f17-bd04-13ca99136750@huawei.com>
 <20230615095100.35c5eb10@kernel.org>
 <CAKgT0Uc6Xoyh3Edgt+83b+HTM5j4JDr3fuxcyL9qDk+Wwt9APg@mail.gmail.com>
 <908b8b17-f942-f909-61e6-276df52a5ad5@huawei.com>
 <CAKgT0UeZfbxDYaeUntrQpxHmwCh6zy0dEpjxghiCNxPxv=kdoQ@mail.gmail.com>
 <72ccf224-7b45-76c5-5ca9-83e25112c9c6@redhat.com>
 <20230616122140.6e889357@kernel.org>
 <eadebd58-d79a-30b6-87aa-1c77acb2ec17@redhat.com>
 <20230619110705.106ec599@kernel.org>
 <CAHS8izOySGEcXmMg3Gbb5DS-D9-B165gNpwf5a+ObJ7WigLmHg@mail.gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <CAHS8izOySGEcXmMg3Gbb5DS-D9-B165gNpwf5a+ObJ7WigLmHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_212016_640742_7286F215 
X-CRM114-Status: GOOD (  13.96  )
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

On 6/29/23 8:27 PM, Mina Almasry wrote:
> 
> Hello Jakub, I'm looking into device memory (peer-to-peer) networking
> actually, and I plan to pursue using the page pool as a front end.
> 
> Quick description of what I have so far:
> current implementation uses device memory with struct pages; I am
> putting all those pages in a gen_pool, and we have written an
> allocator that allocates pages from the gen_pool. In the driver, we
> use this allocator instead of alloc_page() (the driver in question is
> gve which currently doesn't use the page pool). When the driver is
> done with the p2p page, it simply decrements the refcount on it and
> the page is freed back to the gen_pool.

I take it these are typical Linux networking applications using standard
socket APIs (not dpdk or xdp sockets or such)? If so, what does tcpdump
show for those skbs with pages for the device memory?




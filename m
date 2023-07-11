Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14899C001DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 16:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjRG8iZAMnkmKqxR7tI1W1wO5RP8d/nEtipantbd6lg=; b=DosLXGTKP3Zf4LGIh6Z2IisADb
	MOfnPTYRXmT/U9U+tSPCcMbolHCwHayJ6+is3yXOHraSmRmy/R4uJCB4xMO6W0O9UgalhRQmJZEi1
	plwuu6jnGZU2HawbAIh1Wmjd0huYaJan+9ciPKneQ/OkIpTXUIa3QJt7Ryvvxf2upAwZ4UM2XDytZ
	iQEDiqoTEb12s7jdkkJR5q7GuuGUpTA9AZtl4xGotT3+psbCIdGjhTh0PybhyOXDORyDICcWtIYaN
	Hn/mUNKLHXneQdo8n9oEsW3YGJ8vysNP1eQEUxUBKwaA6bRsG/Cmf0pKcaH1RaPemustEZzo5PCnF
	nNP+3dIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGHu-00FOlO-2Q;
	Tue, 11 Jul 2023 16:32:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGHr-00FOjF-0z;
	Tue, 11 Jul 2023 16:32:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0EA461562;
	Tue, 11 Jul 2023 16:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058E9C433C9;
	Tue, 11 Jul 2023 16:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689093146;
	bh=/yz1VNIx8w5vnZQUrnW46zn2dCf4xJSJ/w4OLb6WBAk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yg4EUjxEPD06/Bn6reOhE6TdmtCBNfXmQqLeCVeuc3B4GVfMn6aCEif09HCeYn0Uz
	 Uh06QjoXyuXz76Qh5WxlMsRGgkCEP7GU/xz19BFKHWMX9QP3c0f6H0pfTBv/CMzFNR
	 Gce9NhJ0EAOEBKlWz+3t/42M+JkZEBcqbImWn7g+k7QPFZpUzXnG2Z1YmAU3XT7xgc
	 etgVuONKYWYaRKo7d3AavNFlRtsW7kOs9f5RUjTcfpugo5ljkNFTIaY6eHMNaVhk9c
	 uHeshfY+jsKSE6st5tdcIBLc4raTCwWlwmHFJSEDn5De4UwjLIv6N+Hw3CwjBc6UeH
	 ZQDhJ2SfdHm6Q==
Date: Tue, 11 Jul 2023 09:32:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Ahern <dsahern@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@lst.de>, Mina
 Almasry <almasrymina@google.com>, John Hubbard <jhubbard@nvidia.com>, Dan
 Williams <dan.j.williams@intel.com>, Jesper Dangaard Brouer
 <jbrouer@redhat.com>, brouer@redhat.com, Alexander Duyck
 <alexander.duyck@gmail.com>, Yunsheng Lin <linyunsheng@huawei.com>,
 davem@davemloft.net, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, Yisen
 Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Eric Dumazet <edumazet@google.com>, Sunil Goutham <sgoutham@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep
 <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Felix Fietkau
 <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Kalle Valo
 <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, linux-rdma@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jonathan Lemon
 <jonathan.lemon@gmail.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
Message-ID: <20230711093224.1bf30ed5@kernel.org>
In-Reply-To: <04187826-8dad-d17b-2469-2837bafd3cd5@kernel.org>
References: <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org>
	<CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
	<ZKNA9Pkg2vMJjHds@ziepe.ca>
	<CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com>
	<ZKxDZfVAbVHgNgIM@ziepe.ca>
	<CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
	<ZKyZBbKEpmkFkpWV@ziepe.ca>
	<20230711042708.GA18658@lst.de>
	<20230710215906.49514550@kernel.org>
	<20230711050445.GA19323@lst.de>
	<ZK1FbjG+VP/zxfO1@ziepe.ca>
	<20230711090047.37d7fe06@kernel.org>
	<04187826-8dad-d17b-2469-2837bafd3cd5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_093227_428911_350FCD70 
X-CRM114-Status: GOOD (  11.62  )
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

On Tue, 11 Jul 2023 10:20:58 -0600 David Ahern wrote:
> On 7/11/23 10:00 AM, Jakub Kicinski wrote:
> >> RDMA works with the AMD and Intel intree drivers using DMABUF without
> >> requiring struct pages using the DRM hacky scatterlist approach.  
> > I see, thanks. We need pages primarily for refcounting. Avoiding all
> > the infamous problems with memory pins. Oh well.  
> 
> io_uring for example already manages the page pinning. An skb flag was
> added for ZC Tx API to avoid refcounting in the core networking layer.

Right, we can refcount in similar fashion. Still tracking explicitly
when buffers are handed over to the NIC.

> Any reason not to allow an alternative representation for skb frags than
> struct page?

I don't think there's a hard technical reason. We can make it work.


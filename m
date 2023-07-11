Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7679EB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzEhfDol3gJs1oH1ujganOCMfOnwazuDjBZaNV24APA=; b=QOCwKIDB4MaavA0DOoi+Upp2+K
	OosMvM7tJqVJ+iXc3g/cJWXoADh4P1tpjlFXZdc+kGCzpsNfEGHA0K+FGqvIUyfb0dkZn3sucml7e
	lPjGV27NjUstUXYmG9vSprluoCQQXOvydpijsRqwdT/T1GdEnSfKYWdiGVb9YW84pFdKOOZfXQjmI
	8PT3prirl2aqW1jmL3AMm0OUj28bZp5jOv2kXT2wsjyqabKNBkDMQpl/DQqNMX7sig76lMIQ8QFia
	yXN5yLf9H+02JgPatwaE/xPng5De+1WSPBtsdHH5r6QD7TgQbtDhJNJsXJSl28h6VVSQyKZwZ14te
	BIDNVs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFnL-00FKRn-1n;
	Tue, 11 Jul 2023 16:00:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFnI-00FKQj-0Z;
	Tue, 11 Jul 2023 16:00:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 401436155E;
	Tue, 11 Jul 2023 16:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73A1C433C8;
	Tue, 11 Jul 2023 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689091250;
	bh=qJNl12vo3sFEgIC9eU4i4GFHtknelm6lEufyoqloygg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H5Pjqt9ztd1rsXJxiMRPURZwTa2ExxdjvmdAB+R2m6SIGj9BZXzsFh8fGEuiSTvcm
	 judzO3qp7mqlviGZdHfT9sbnjnh7490DvZQa7s5T+0mqaBlhZbmTkQYKjneddOr+zU
	 I70OFnP7HqecLR1sMTBg5IyfCTdYnn+/rbEAn2glXwwMxHVhQ+QwarY7jc03Bi7ww2
	 byWkJRLIUtz0tkaUzKuPvGqtrAhdOE7ZFL4wWDtTcgcgau59/IWCMnMGAP6m8DA2sQ
	 fnlNevf7wZVPt1tPCiqMTLRIvyGYwZut8EY+Mzks1hOkDrkQuZgqAklkfJWwGQfh+U
	 q8F+qHZDvJx3w==
Date: Tue, 11 Jul 2023 09:00:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@lst.de>
Cc: Mina Almasry <almasrymina@google.com>, John Hubbard
 <jhubbard@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, David Ahern
 <dsahern@kernel.org>, Jesper Dangaard Brouer <jbrouer@redhat.com>,
 brouer@redhat.com, Alexander Duyck <alexander.duyck@gmail.com>, Yunsheng
 Lin <linyunsheng@huawei.com>, davem@davemloft.net, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi
 <lorenzo@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta
 <salil.mehta@huawei.com>, Eric Dumazet <edumazet@google.com>, Sunil Goutham
 <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Subbaraya
 Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, Saeed
 Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Felix
 Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
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
Message-ID: <20230711090047.37d7fe06@kernel.org>
In-Reply-To: <ZK1FbjG+VP/zxfO1@ziepe.ca>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_090052_298709_7BA69A65 
X-CRM114-Status: GOOD (  16.97  )
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

On Tue, 11 Jul 2023 09:05:02 -0300 Jason Gunthorpe wrote:
> On Tue, Jul 11, 2023 at 07:04:45AM +0200, Christoph Hellwig wrote:
> > On Mon, Jul 10, 2023 at 09:59:06PM -0700, Jakub Kicinski wrote:  
> > > Noob question - how does RDMA integrate with the out of tree junk?
> > > AFAIU it's possible to run the "in-tree" RDMA stack and get "GPU
> > > direct".  
> > 
> > I don't care and it has absolutel no business being discussed here.

My question was genuine. If you think the code is dog shit I will 
make no argument for merging it. I just get hives from looking at
proprietary code so I was hoping someone could explain how the
proprietary stacks get it done.

> > FYI at leat iWarp is a totally open standard.  

And I'm sure someone cares about that. I care about open source.

I think people in the networking world have a deeper understanding 
of standardization processes, and their practical implication for
open source and hack-ability. If all usable implementations are
proprietary the standard could as well not exist.

That may be a little hard to understand for folks coming from storage
and fabric worlds where the interesting bits of the implementation was
pretty much always closed.

> So is Infiniband, Jakub has a unique definition of "proprietary".

For IB AFAIU there's only one practically usable vendor, such an
impressive ecosystem!!

> RDMA works with the AMD and Intel intree drivers using DMABUF without
> requiring struct pages using the DRM hacky scatterlist approach.

I see, thanks. We need pages primarily for refcounting. Avoiding all
the infamous problems with memory pins. Oh well.


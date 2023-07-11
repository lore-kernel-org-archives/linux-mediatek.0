Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B2EEB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 04:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WN6Ldl796HA9Oi0aR37R0SSkllIozXBxvjsi4tx8gc=; b=0VEoWu6ITquxmvUxdtxsig/Eoe
	yVSrih2/17kHT6rTeW1/tZeEeUjgC9hXUNRXbuqXjjsNcsjixRwStZbSpj5OiYsp2gWZK6LRU769Z
	gHmxXYBcPuUeOuF43l2DqLnXJEAPBhGlvNBtGi0Nh5CIRSRr7tYCa7+BpimTTm2pado1sYMyf/jty
	+Btbu5EFkZkKU4VABPTy01l1M0kP8b560xKHJmv5gAbsU7WaS9yKv6C5FkQUYK3EfKB8HXgQZzFpp
	ftco876MFGCmh5v8lilh02gFx7D1+EqvGd+vlad4jKDFPCNHjcxpyTZg1cuC/lsyKm5KzRYD2xWSp
	uXgf2Yxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ4y6-00DcVi-2h;
	Tue, 11 Jul 2023 04:27:18 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ4y3-00DcUt-21;
	Tue, 11 Jul 2023 04:27:17 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 381696732D; Tue, 11 Jul 2023 06:27:08 +0200 (CEST)
Date: Tue, 11 Jul 2023 06:27:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mina Almasry <almasrymina@google.com>, Christoph Hellwig <hch@lst.de>,
	John Hubbard <jhubbard@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com,
	Alexander Duyck <alexander.duyck@gmail.com>,
	Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Eric Dumazet <edumazet@google.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>, Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jonathan Lemon <jonathan.lemon@gmail.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
Message-ID: <20230711042708.GA18658@lst.de>
References: <eadebd58-d79a-30b6-87aa-1c77acb2ec17@redhat.com> <20230619110705.106ec599@kernel.org> <CAHS8izOySGEcXmMg3Gbb5DS-D9-B165gNpwf5a+ObJ7WigLmHg@mail.gmail.com> <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org> <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com> <ZKNA9Pkg2vMJjHds@ziepe.ca> <CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com> <ZKxDZfVAbVHgNgIM@ziepe.ca> <CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com> <ZKyZBbKEpmkFkpWV@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKyZBbKEpmkFkpWV@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_212715_807494_442F2824 
X-CRM114-Status: GOOD (  11.41  )
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

On Mon, Jul 10, 2023 at 08:49:25PM -0300, Jason Gunthorpe wrote:
> The entire point of DEVICE_PRIVATE is that the page content, and
> access to the page's physical location, is *explicitly* unavailable to
> anyone but the pgmap owner.

DEVICE_PRIVATE is in fact availably to no one at all.  It is a place
holder for memory not addressable at all.

Not going to comment on the rest of this as it seems bat shit crazy
hacks for out of tree junk.  Why is anyone even wasting time on this?


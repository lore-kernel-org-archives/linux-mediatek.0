Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CDBEB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 04:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bt9H4SKM7cn3/pUX6o5vk6s91M4wwuITffMrRJxH2I=; b=DtQ8ONlcb0D2hWonf9lxPCIIBB
	aWlKyAcSZsaG7HRFmDWAUtN6iCpql9Jkf+T0dPzMcBDVMGBWcxP1HCPlReHvBjrmCiOGPecpj6Ryw
	ZIDo1AUh4G23vWN7remljJg//4s7dULYcNi0hEn0WCVKT8H5ulDUcvh54QDkfvoqocEosgxjRnpQC
	rHeSrAmk90Ftupncfnm0DlgTOWqUnhIoP2pCsx26GHNcfa0IguYX9mwTIEm0xCvphDhOeFsqQYHqu
	eUDKnxOWJWvYsR2CD6LD6j8nRvAslFH0eKociCrkVAcFkdX3QvlestINfNk7IxIBORkyT0yXIizeG
	Fv9B6rKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ5T2-00DhHW-1U;
	Tue, 11 Jul 2023 04:59:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ5Sy-00DhFP-2M;
	Tue, 11 Jul 2023 04:59:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 396F661217;
	Tue, 11 Jul 2023 04:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F237CC433C7;
	Tue, 11 Jul 2023 04:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689051549;
	bh=AlR0iPOgoKsKvFSvb1vV3TApDy+DT+0ogO2Yh+Wcku8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=njdD/4DeJKfeTDojWA0Tg1eTORxGZbCgaxTa2/UtYp4xgiyGyFEGk14pSiHp6opa8
	 VVcsh/wK3lSkMhbfQJnZ2+ZKtunW9YFlbXrt6vfpZB/ihXCpE73cjkPTAAJRmMoXoH
	 NP1qwYCAceYIfMGoIvREeoiPNT2uTZ/fx9Hq9ZDljyRr5nBdbY1++JtsUBTKF+SK3z
	 TY01Zg3KRgh4LTmsN3HJ0tagmi7SdC3ap8JIH8cXOYqNFDnABfqko8GUdqwlGz6q1G
	 G1qIcD9bPPstlPGhQY/mcYFjB2Feo0mHnEX0/FMvhOg7qH/M0284Ia8X5ds5ElKnri
	 bnwfGwXdbRE2g==
Date: Mon, 10 Jul 2023 21:59:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Mina Almasry <almasrymina@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Dan Williams
 <dan.j.williams@intel.com>, David Ahern <dsahern@kernel.org>, Jesper
 Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com, Alexander Duyck
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
Message-ID: <20230710215906.49514550@kernel.org>
In-Reply-To: <20230711042708.GA18658@lst.de>
References: <eadebd58-d79a-30b6-87aa-1c77acb2ec17@redhat.com>
	<20230619110705.106ec599@kernel.org>
	<CAHS8izOySGEcXmMg3Gbb5DS-D9-B165gNpwf5a+ObJ7WigLmHg@mail.gmail.com>
	<5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org>
	<CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
	<ZKNA9Pkg2vMJjHds@ziepe.ca>
	<CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com>
	<ZKxDZfVAbVHgNgIM@ziepe.ca>
	<CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
	<ZKyZBbKEpmkFkpWV@ziepe.ca>
	<20230711042708.GA18658@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_215912_832797_644A7BB2 
X-CRM114-Status: GOOD (  10.13  )
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

On Tue, 11 Jul 2023 06:27:08 +0200 Christoph Hellwig wrote:
> Not going to comment on the rest of this as it seems bat shit crazy
> hacks for out of tree junk.  Why is anyone even wasting time on this?

Noob question - how does RDMA integrate with the out of tree junk?
AFAIU it's possible to run the "in-tree" RDMA stack and get "GPU
direct".

Both Jonathan in the past (Meta) and now Mina (Google) are trying 
to move the needle and at least feed the GPUs over TCP, instead of
patented, proprietary and closed RDMA transports.


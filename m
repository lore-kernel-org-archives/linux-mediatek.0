Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8733EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 17:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ezi2//AdJHNecaBFtqa7xQ4acOquAawt53XOhPlpaSE=; b=DsaBmVwoSioBVyyxJqEkA8tv2m
	61S57YJ9IRapXVHOxWSY2FXf2GrCEWViZxaj1r7+K+VfwhbnuZD5AjaXUzKS0zVaNCAir4/U9YCAk
	qiqHnJZEV2EgIS8IdBAu13sCqAt2YPF4f2PDWoEObkhGyccm+QnRWjXsPlSAI/rUI/GPX6m2ZnNsq
	8x11CKPxH5AdYrw+QlAU8jUYhdBB74f6C8ngxkipmfTA42s09UcqXI5T9NDXzZIc/ZTH1Hbwj0QFc
	O36MA7j5JCrou/zLGWcPFUmeRiS+lhRlN03ftZxsifi2ZftB8/ySwbL1rZvaQvhMATnusgHA8Owlr
	9BYHDofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGp0-00FTcW-2b;
	Tue, 11 Jul 2023 17:06:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGox-00FTbU-2R;
	Tue, 11 Jul 2023 17:06:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 471F861592;
	Tue, 11 Jul 2023 17:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A700C433C7;
	Tue, 11 Jul 2023 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689095198;
	bh=x4TLQS4vHmFGtwuzHytb/YnHM4SbO2CsfkdmfEb5LRw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TZTRXs5CNgJBsdF0s59GJgF3vJAmjVuNTz2QpieQPDj2amKzVe10jY32ftd7nYH9p
	 aCZeoM8Qs6QCNfMyeeJIfPzb8u69wkXtvBSVqVxImP1KBxAXuNYFqBkB+1226IbNFV
	 8DWG0oqOh+HV8S3T9mCHfuleq0WD/9nRcAHtDC3tszrsHmxbl2VgBcoqCGRaZ0uY0N
	 njl4PYHSaTV/7L2F28zrmJdlnnYRnqRc+Ovv9KjoiAcGnTrL9gZam6YdK1BUloG1WX
	 oqnB7QylqPvySVtQc1DenqeISWZkVEDGRRQ5SZ3CMXfQHofuCrpd6TNwDHc1SsQKGD
	 xBAys7dtYVXDQ==
Date: Tue, 11 Jul 2023 10:06:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@lst.de>, Mina Almasry <almasrymina@google.com>,
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
Message-ID: <20230711100636.63b0a88a@kernel.org>
In-Reply-To: <ZK2Gh2qGxlpZexCM@ziepe.ca>
References: <ZKNA9Pkg2vMJjHds@ziepe.ca>
	<CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com>
	<ZKxDZfVAbVHgNgIM@ziepe.ca>
	<CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
	<ZKyZBbKEpmkFkpWV@ziepe.ca>
	<20230711042708.GA18658@lst.de>
	<20230710215906.49514550@kernel.org>
	<20230711050445.GA19323@lst.de>
	<ZK1FbjG+VP/zxfO1@ziepe.ca>
	<20230711090047.37d7fe06@kernel.org>
	<ZK2Gh2qGxlpZexCM@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_100639_875190_3B615567 
X-CRM114-Status: GOOD (  13.41  )
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

On Tue, 11 Jul 2023 13:42:47 -0300 Jason Gunthorpe wrote:
> On Tue, Jul 11, 2023 at 09:00:47AM -0700, Jakub Kicinski wrote:
> > > So is Infiniband, Jakub has a unique definition of "proprietary".  
> > 
> > For IB AFAIU there's only one practically usable vendor, such an
> > impressive ecosystem!!  
> 
> IB has roce (RDMA Over Converged Ethernet, better thought of as IB
> over Ethernet) under it's standization umbrella and every major
> commodity NIC vendor (mellanox, broadcom, intel) now implements
> roce.

Now we're getting into our favorite argument and completely
sidetracking the conversation, aren't we? :) And as usual 
our ability to present facts is limited by various NDAs..

> We also have the roce support in the switch from all major
> switch vendors.

By which you mean all major switch vendors should support basic RoCE
requirements. But most vendors will try to put special features into
their switches trying to make the full NIC + switch solution as sticky
as possible.

> IB as a link layer "failed" with most implementors leaving the

Interesting.

> ecosystem broadly because Ethernet link layer always wins in
> networking - this is more of an economic outcome than a
> standardization outcome in my mind.
> 
> Due to roce, IB as a transport and software protocol has a solid
> multi-vendor ecosystem.
 
Last I checked every generation of HW from even a single vendor came out
with a new congestion control algorithm and add-ons. All closed source
and usually patented. That is the core of a transport protocol, the
intelligence, not the frame format (which may or may not itself deviate
thru various encaps and stolen bits).


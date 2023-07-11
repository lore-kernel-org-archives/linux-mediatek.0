Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FD0EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 20:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7hG510JGbYxHLUrfi/whmGkfqDHd7r4mkpF8R37NzA=; b=K0jNEptjS5kJYx9sjnvSC9881s
	NehJWkKlGoRMxcCdQzCUn0rjgpWnbMXhJ8buJHVHWC+lAX4oP7Mg6cvEFxM50fRDI+xRx8tQEsNmQ
	v1KJu54KDPtkxaralVzbV9t0V2EADr7NGNkVlmz/pV+RblmaOpjFlVcm/lO1bF3zTbhPmaWBI1BXP
	449KgwIKlrERLGJHSE3Dyph/fBOXxZFQmPV4RBVoZ9YxfzmvQYObeOEBqSGRn4CSd7stSXswf4Lk8
	jUvPvsI2Ehj2Z/EXmeN+lBCqj41trGv78GmHs6Umye6BrmZn4vB41rfdSi5W7QcNAMbEiFLn4NQgk
	MtKCR3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJK43-00FqkE-1N;
	Tue, 11 Jul 2023 20:34:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJK3z-00FqjV-1f;
	Tue, 11 Jul 2023 20:34:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00448615EB;
	Tue, 11 Jul 2023 20:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AAEC433C7;
	Tue, 11 Jul 2023 20:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689107662;
	bh=Tvmu/JdqsFHoqwxn8e5DiBMwjsswLbqpvPrbdWqX3mU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KT2GetEFtYlkaoWB9SkIWERR/pM6252wtR3+uYa5U8hU6Z72yd0jGdfKEHGRCUPDg
	 cV6CxM61kiS9aR8QbLm1lVOKFqo7tiDLKsmIyqsbhxa0VksU16jxRrop0XkHgITqSP
	 EFW3qqHEOocqEyXqP1oLbP2Pw7wZbnpXltb/judIGIutmoF5JzbncOkM51LN3SO7bm
	 E6tbNJFPipV38BWXPsj0vvodOwB6lnCc+5okEl9j4wKGIrXJaVLbiLW7Ru/TvHo4J8
	 Gr9Nye/bZVAOskwP2AUf4LN5Tsox+cB+wfVMSPjU9nO5urg3uBLRwuMcGC+sSUCrVw
	 seVSCxPh1GKNg==
Date: Tue, 11 Jul 2023 13:34:20 -0700
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
Message-ID: <20230711133420.5df88f02@kernel.org>
In-Reply-To: <ZK2k9YQiXTtcGhp0@ziepe.ca>
References: <ZKxDZfVAbVHgNgIM@ziepe.ca>
	<CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
	<ZKyZBbKEpmkFkpWV@ziepe.ca>
	<20230711042708.GA18658@lst.de>
	<20230710215906.49514550@kernel.org>
	<20230711050445.GA19323@lst.de>
	<ZK1FbjG+VP/zxfO1@ziepe.ca>
	<20230711090047.37d7fe06@kernel.org>
	<ZK2Gh2qGxlpZexCM@ziepe.ca>
	<20230711100636.63b0a88a@kernel.org>
	<ZK2k9YQiXTtcGhp0@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_133423_660115_84E673DF 
X-CRM114-Status: GOOD (  23.86  )
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

On Tue, 11 Jul 2023 15:52:37 -0300 Jason Gunthorpe wrote:
> > Now we're getting into our favorite argument and completely
> > sidetracking the conversation, aren't we? :) And as usual 
> > our ability to present facts is limited by various NDAs..  
> 
> Yes, well, maybe I should stop taking the bait everytime you write
> "proprietary" :)
> 
> > > We also have the roce support in the switch from all major
> > > switch vendors.  
> > 
> > By which you mean all major switch vendors should support basic RoCE
> > requirements. But most vendors will try to put special features into
> > their switches trying to make the full NIC + switch solution as sticky
> > as possible.  
> 
> Yep. At the high end open standards based ethernet has also notably
> "failed" as well. Every switch vendor now offers their own proprietary
> ecosystem on a whole bunch of different axis. They all present
> "ethernet" toward the host but the host often needs to work in a
> special way to really take full advantage of the proprietary fabric
> behaviors.

I'm not familiar with "high end open standards based on ethernet", would
those be some RDMA / storage things? For TCP/IP networks pretty much
the only things that matter in a switch are bandwidth, size of buffers,
power... Implementation stuff.

> > Last I checked every generation of HW from even a single vendor came out
> > with a new congestion control algorithm and add-ons.   
> 
> Probably, but I don't really view this as an IB or roce issue.
> 
> Back in the day, there was "data center ethernet" which was a
> standardization effort to try and tame some of these problems. roce
> was imagined as an important workload over DCE, but the effort was
> ethernet focused and generic. Sadly DCE and successor standard based
> congestion mangement approaches did not work, or were "standardized"
> in a way that had a big hole that needed to be filled with proprietary
> algorithms. Eventualy the interest in standardization seems to have
> waned and several of the big network operators seem to be valuing
> their unique congestion management as a proprietary element. From a
> vendor perspective this is has turned into an interop train
> wreck. Sigh.
> 
> roce is just highly sensitive to loss - which is managed in ethernet
> through congestion management. This is why you see roce and congestion
> management so tightly linked, and perhaps in some deployments becomes
> the motivating reason to look at congestion management.

A lot of "standardization" efforts are just attempts to prove to 
a buyers that an ecosystem exists.

Open source the firmware. Let people actually hack on it and when
the users bring their own algorithms de facto standardization will
happen. Short of that it's all smoke and mirrors.


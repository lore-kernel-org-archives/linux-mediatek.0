Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91018EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 16:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJdfIK450krxSkuYf8Kc0MuuphW744ucwU6pzDk63A0=; b=nX7sMDefQEFwPufZK/NaBY6f1p
	QLilVcZkmdcmx1Xl27gYcObNjzeGLpDeYydCbRgRZlgE4dvQf5kqIWwDnHUP4picUSIvwDJPeftk8
	IDJgOSp8WubuTXpeNjXhRxl5Ndn7fFOVO8FA1oCaSlWZ2Amak4vMWt+0MYqd8Lf1ihMVMsLWCeChu
	n2kln9P52Mj8/vvJoOH9a5S8/uWSjKPTIwSVmi7flgOzHMZWgYjL5Cg0XA8kkxDZ6PsDIsGgd6kEp
	DN1qZm3onXnBez6UBeHxrQFMEk0KXZYcoiYpusY6kMxKXb81gVeJAyTY2g6vGp9mFZd2bhtf2mccQ
	LvJmHOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHSBj-002Cn2-1O;
	Thu, 06 Jul 2023 16:50:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHSBg-002ClX-0j;
	Thu, 06 Jul 2023 16:50:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6BABF60F7E;
	Thu,  6 Jul 2023 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BD1C433C8;
	Thu,  6 Jul 2023 16:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688662230;
	bh=JMMqVQ1L/TaeP106mVLOHP/qWvAPkrzYjnG3d18DeQI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ir2qoTruxn8EC28k39ppqWj7eeCov8opvLIoQZDd9BhZVvkq75++NiA9T82jyZMlh
	 6U1NrBurZzJhfQjPAN2sTXnXGC4DfyJzAcO0hs6Kz36cWRbuYi8qSUGcEz2wVc1/Wh
	 pGMtk8MYumaTLJ8dFBEdjMMWmAfXNvu9r61AKfepXcOKlskr+CjiUhqnkU66slIy2A
	 e1Kpy0y130Rov3/L/vDz+JPUAacRFI7+70NBn2tN/y+bvukoOufS+HrZ1PSFqgqE25
	 PuYlNZIFJ2WmeMrJnak39p7WkaAWuDU++qQoJO51pr3abUjH+93nsp3+ELFvhVYgqt
	 9piME/8krW9sg==
Date: Thu, 6 Jul 2023 09:50:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Jesper Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com,
 Alexander Duyck <alexander.duyck@gmail.com>, Yunsheng Lin
 <linyunsheng@huawei.com>, davem@davemloft.net, pabeni@redhat.com,
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
Message-ID: <20230706095028.19c4c637@kernel.org>
In-Reply-To: <CAHS8izOySGEcXmMg3Gbb5DS-D9-B165gNpwf5a+ObJ7WigLmHg@mail.gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_095036_367000_15276C28 
X-CRM114-Status: GOOD (  24.19  )
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

On Thu, 29 Jun 2023 19:27:46 -0700 Mina Almasry wrote:
> I've discussed your page pool frontend idea with our gve owners and
> the idea is attractive. In particular it would be good not to insert
> much custom code into the driver to support device memory pages or
> other page types. I plan on trying to change my approach to match the
> page pool provider you have in progress here:
> https://github.com/kuba-moo/linux/tree/pp-providers
> 
> In particular the main challenge right now seems to be that my device
> memory pages are ZONE_DEVICE pages, which can't be inserted to the
> page pool as-is due to the union in struct page between the page pool
> entries and the ZONE_DEVICE entries. I have some ideas on how to work
> around that I'm looking into.

Right, have you talked to Willem? I mentioned to him that I initially
pursued the idea of using the page pool as an abstraction but I
realized that fitting both the dma addr and the frag reference count
into struct page which isn't just a basic page will be a challenge.

So the second best thing seems to be to create an API which matches 
the page pool API, and have it select between a page pool and another
provider based on user configuration. As you said the main goal is to
be able to feed kernel / user / device memory to the driver without
having to modify driver code.

I thought this would live "above" the page pool (perhaps that's what
you mean by gen_pool) but Jesper brought up integrating it into the
(middle of?) page pool and have page pool switch on the pp_magic.
No strong preference on which on is better, seems like something that
can only be ironed out by modifying a couple of drivers to find out
what fits best :(

I'm hoping to jump back into the pp_provider work and finish that up
over the next few days, to at least post a PoC. Even if it doesn't work
for user / device memory - being able to feed the page pool from huge
pages is already a big win for the IOTLB.


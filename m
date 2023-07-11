Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3B8EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 23:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leJKi4u06YRTzo0lBrUW1GjV6mczJ561dFwtREQL+Dg=; b=jBIF55awVNGbaLCC8yB0IHRuqB
	Tm8px7qkmgWJ3Khy3qu8FU2X48yf7G6U2/4jCO2rmJ4xMJtm4D9w/DmujSY1+auuYZXnJQ227Ugfi
	+WBZBot8rTy3hp4DzQ7uVCyQjs+lFFIV4zg3KkguAxXfSTs5pcm/CiB02O1H5SZ01YCEodERYyRiA
	+Q7Mh/Sy3ELjeUhkvDYzEfOX+aR180XNQwHnGOOTqPNY3WZau0BI0UsKAJuYZbeTP3CBM+QUqaTKX
	k6sj1sevO9UhQStC5WmzkglVkkEtjX0GeGUJZSauNNGUeLjhodcOJ+UbIVI6jCd49ijP0fIhrhln0
	A8xDwCow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJNE8-00G68a-2E;
	Tue, 11 Jul 2023 23:57:04 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJNE5-00G66k-0b
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jul 2023 23:57:02 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3a337ddff16so4844758b6e.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jul 2023 16:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689119819; x=1691711819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=leJKi4u06YRTzo0lBrUW1GjV6mczJ561dFwtREQL+Dg=;
        b=DXK8WidcvmvzjeVYH/6WijviZ73toBOmyVp9mIOd03ZD+R3rHWdoxQSvE5e9wD1KCJ
         9mK/DDwssbLXSnouE8MAwnVDe+VkRcpQSrinJNmyu0FnYmd+CKVNA1F34dvSGu5lfZwy
         cyr25JKjczwfRObdI7oARPE9gHghtmOAegQpocDq/APkFl+1PNSXGJo1xP2SNdGpJGtv
         /nEQL7vqxVxYsTwIY7luylFSj8xoTEsYM9t5cm2HxYfPwTnzx8rs4qClhieKHRjwL54Q
         8sya8gM8UB4rmOcx/i0v01+HlH4cbtNGlO2x9kzZaZUcFmUL9dtfGxX7fDRkv+FMzf1u
         InjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689119819; x=1691711819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leJKi4u06YRTzo0lBrUW1GjV6mczJ561dFwtREQL+Dg=;
        b=kfaQ0QFsgXqJhfLUGB7XQMP4UIDH14CIk1OuLnzaJZ92CJaHSIijIZTvP0WsUHvlPM
         /k7dhgLJb4SPNFu4055GynZffdnuPGZSYm1jvR0LJoTppPCGbVAfiPV1PWsCM14EC3dq
         TyZmTuFMq6+xBB/4oWL5CTMctNhLg6Yjzme8g+ALMsMNyhtaa0CLGtTzY8ufSUGTb9IP
         Bl7ZjtH45s1Na+dDBOVVkIXIZ6RBPucgc44B/cJ9HPz93b8tIbz7qgF9wMFRAUD2U9OW
         rZ1uIkHOgBNSSqFf+EqXLgF+IWHGZ2YTrfYgtsNEkc6NxvlLERbqXXLAfDbp3oYLkD8U
         KsaQ==
X-Gm-Message-State: ABy/qLa7Bvds43Fsgtc5sp8Jr0a883TeeuEjOo5G8CtyporysH+EZLPX
	Gsx7FVPds620UMZwuaW7FqBTOA==
X-Google-Smtp-Source: APBJJlHPVDwycmPbbNO1kwHaGDMrzsNQAmVLFppzVomF/d82yUMQJxrek5vJqs3gAPlID0cxcW6lxg==
X-Received: by 2002:a05:6808:11cf:b0:3a3:fa64:b543 with SMTP id p15-20020a05680811cf00b003a3fa64b543mr9841890oiv.12.1689119819344;
        Tue, 11 Jul 2023 16:56:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id x11-20020a63b34b000000b005533c53f550sm1952223pgt.45.2023.07.11.16.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 16:56:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qJNE0-000KOY-Hj;
	Tue, 11 Jul 2023 20:56:56 -0300
Date: Tue, 11 Jul 2023 20:56:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Mina Almasry <almasrymina@google.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
	David Ahern <dsahern@kernel.org>,
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
Message-ID: <ZK3sSMSVWM5EbHLG@ziepe.ca>
References: <ZKyZBbKEpmkFkpWV@ziepe.ca>
 <20230711042708.GA18658@lst.de>
 <20230710215906.49514550@kernel.org>
 <20230711050445.GA19323@lst.de>
 <ZK1FbjG+VP/zxfO1@ziepe.ca>
 <20230711090047.37d7fe06@kernel.org>
 <ZK2Gh2qGxlpZexCM@ziepe.ca>
 <20230711100636.63b0a88a@kernel.org>
 <ZK2k9YQiXTtcGhp0@ziepe.ca>
 <20230711133420.5df88f02@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711133420.5df88f02@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_165701_225871_CF12C77E 
X-CRM114-Status: GOOD (  16.14  )
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

On Tue, Jul 11, 2023 at 01:34:20PM -0700, Jakub Kicinski wrote:

> > Yep. At the high end open standards based ethernet has also notably
> > "failed" as well. Every switch vendor now offers their own proprietary
> > ecosystem on a whole bunch of different axis. They all present
> > "ethernet" toward the host but the host often needs to work in a
> > special way to really take full advantage of the proprietary fabric
> > behaviors.
> 
> I'm not familiar with "high end open standards based on ethernet", would
> those be some RDMA / storage things? For TCP/IP networks pretty much
> the only things that matter in a switch are bandwidth, size of buffers,
> power... Implementation stuff.

I would say when you are getting into ethernet deployments with 25 or
51 Tbps switches directly connected to hosts running at >100G you are
getting into the high end side of things.

These are very expensive networks. They run complex congestion
provoking workloads. They have sophisticated multi-pathing. They often
use use a non-blocking topology. Congestion management is important.

Making this work with good utilization, and low tail latency is a
really hard problem. Many of the solutions come with switch features
supporting it.

You'd proably say these are not TCP focused networks, even though they
are based on ethernet and IP.

So I think of them as high end "standards based" ethernet and IP
looking networks that have proprietary elements mixed in throughout.

Right now there is a bit of a press war between vendors on 'ethernet
for AI'. Both Broadcom and NVIDIA are taking techonlogies that were
originally built for TCP ethernet networks and remixing/speeding them
up to run roce workloads effectively. There is alot more information
available now without NDA that shows some detail on this space.

AWS's SRD multipathing, Broadcom "AI Ethernet" and NVIDIA's Spectrum-X
spring to mind as topical to what these sorts of ethernet networks
are.

> A lot of "standardization" efforts are just attempts to prove to 
> a buyers that an ecosystem exists.

Heh, that was probably more true years ago. These days it seems like
some standardization is also being done so the large hyperscalers can
improve their Approved Vendors List.

I suppose as long as the result is something we can implement openly
in Linux the motivation for standardization is less important.

Jason


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7F4EB64D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 03:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGC+6rPypaLJlCQX7D5f9PQLl8/lGoMDODsVm7b1HB0=; b=KqRze+f2S9nwauFy0/vYvFgns8
	ksAcmL+v1i/Hs34JszexCveRhK9vqlVG6DfUhTeZ+m8uonKWodCp6UWxffaY1gAnvaoXA2euRhVbk
	TY8Q/KTwHsLOXa0eXgyncM5RBrzKOuKgUIi6QXauN5ZZIvFKnPbkr3bBII+db+pr8WcB2bCfaigfH
	ihpwrcaCSoSsmcviI3FiClgfzBhGc7KzCqgAyCE/6AHeOZQp8wSs5Lr/hXL6YySXBRlDSJwG397WP
	q+utqKrFN6Sr5lsNdhxRDYDTmSSmavymx5iWqC8dSfWdgybe5jdOU9n/LKC6ynZNfHWpKqz5yykuf
	fbXr5JbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJQkV-00GPdL-2Y;
	Wed, 12 Jul 2023 03:42:43 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJQkS-00GPc2-1a
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 03:42:42 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6355e774d0aso37813376d6.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jul 2023 20:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689133356; x=1691725356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGC+6rPypaLJlCQX7D5f9PQLl8/lGoMDODsVm7b1HB0=;
        b=3GLId8TpPFMbUN9+cqTJNNfvBWQHOwWggxKJsfePx31Keuk7IDA1cPTlVt51od2qSi
         YDxpkLxjSX5K7RB9R0IMlh54mcS5SYJRZ6P/MzOUrhAILetGevNyuWSehecm0MkkDY4B
         cGtibi5VjM67BkjWh3puy/uVWENRwqa13UsXS3DU2fV4AZYmAdnfgTUqRuEGYcJEos5i
         3GK0UELsxf/4Sb87gmmGZVXLaxsYWNHu7nvKWg9GMmPqrKrHBZIuaZzh7JyXtSERo8y4
         mTUDMdrI4PgfLk7lPMQBVMLpNHTuOXBGIXb1AK9mchDingX0e+fVFsGsAW8sBts2z52d
         HkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689133356; x=1691725356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGC+6rPypaLJlCQX7D5f9PQLl8/lGoMDODsVm7b1HB0=;
        b=Szz05HpHZSS5HUyKL14wImB4wq5IPYA6h1MwKhW9OmSgECS7bRO9p2gpQIIFM9J9ev
         V3WXYZKpTyt5YjJgBRW3Ev1vPhNHNuso178zSpU6bDjIalqCMexx9tyibgwQaSr/QaSa
         M5GW6vl+b0A30onligDHgJzl1muiEs0xPUB8DezGrUCTd0Z+HmXPriaM0TqCvcDrdepA
         3AAj70szboTlj+dSzXlg3ST+5ba8takyKaalEJp3CY9hjM+UY2ztrP8Z3ahpqEhSg+XB
         yoTd2Ry/BdXnd8AJwiqJm7mkAtmaF5Edie9sf3+FlPUOwYuImHnzIHJDLoOhMnakCpxc
         Z7sQ==
X-Gm-Message-State: ABy/qLaLIeAYpAEiboNO5f1i72/KT8buBuEfhnxp6+5Yq+WbdqlYKbDt
	2Ih0hY+QSRWskryUx8XFcZPE0Egf7/yuhYkVxa19rg==
X-Google-Smtp-Source: APBJJlGQk5m4ovyiIS1fPut2mEBR26FBNA+DsJcg5Cn6rSJjDN7JUCMrWohf1AoamlB5EuvcTpqlSalrUzemY5XWjM4=
X-Received: by 2002:ac8:7c50:0:b0:403:c417:ba9d with SMTP id
 o16-20020ac87c50000000b00403c417ba9dmr1033325qtv.16.1689133355634; Tue, 11
 Jul 2023 20:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org>
 <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
 <ZKNA9Pkg2vMJjHds@ziepe.ca> <CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com>
 <ZKxDZfVAbVHgNgIM@ziepe.ca> <CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
 <ZKyZBbKEpmkFkpWV@ziepe.ca> <20230711042708.GA18658@lst.de>
 <20230710215906.49514550@kernel.org> <20230711050445.GA19323@lst.de>
 <ZK1FbjG+VP/zxfO1@ziepe.ca> <20230711090047.37d7fe06@kernel.org>
 <04187826-8dad-d17b-2469-2837bafd3cd5@kernel.org> <20230711093224.1bf30ed5@kernel.org>
 <CAHS8izNHkLF0OowU=p=mSNZss700HKAzv1Oxqu2bvvfX_HxttA@mail.gmail.com>
 <20230711133915.03482fdc@kernel.org> <2263ae79-690e-8a4d-fca2-31aacc5c9bc6@kernel.org>
In-Reply-To: <2263ae79-690e-8a4d-fca2-31aacc5c9bc6@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 11 Jul 2023 20:42:24 -0700
Message-ID: <CAHS8izP=k8CqUZk7bGUx4ctm4m2kRC2MyEJv+N4+b0cHVkTQmA@mail.gmail.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
To: David Ahern <dsahern@kernel.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Willem de Bruijn <willemb@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@lst.de>, 
	John Hubbard <jhubbard@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, 
	Jesper Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com, 
	Alexander Duyck <alexander.duyck@gmail.com>, Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net, 
	pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Salil Mehta <salil.mehta@huawei.com>, Eric Dumazet <edumazet@google.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
	Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Jonathan Lemon <jonathan.lemon@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	logang@deltatee.com, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_204240_559612_E68B96A6 
X-CRM114-Status: GOOD (  43.59  )
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

On Tue, Jul 11, 2023 at 2:39=E2=80=AFPM David Ahern <dsahern@kernel.org> wr=
ote:
>
> On 7/11/23 2:39 PM, Jakub Kicinski wrote:
> > On Tue, 11 Jul 2023 10:06:28 -0700 Mina Almasry wrote:
> >>>> Any reason not to allow an alternative representation for skb frags =
than
> >>>> struct page?
> >>>
> >>> I don't think there's a hard technical reason. We can make it work.
> >>
> >> I also think we can switch the representation for skb frags to
> >> something else. However - please do correct me if I'm wrong - I don't
> >> think that is sufficient for device memory TCP. My understanding is
> >> that we also need to modify any NIC drivers that want to use device
> >> memory TCP to understand a new memory type, and the page pool as well
> >> if that's involved. I think in particular modifying the memory type in
> >> all the NIC drivers that want to do device memory TCP is difficult. Do
> >> you think this is feasible?
> >
> > That's why I was thinking about adding an abstraction between
> > the page pool and the driver. Instead of feeding driver pages
> > a new abstraction could feed the driver just an identifier and a PA.
>
> skb frag is currently a bio_vec. Overloading the 'struct page' address
> in that struct with another address is easy to do. Requiring a certain
> alignment on the address gives you a few low bits to use a flags / magic
> / etc.
>
> Overloading len and offset is not really possible - way too much code is
> affected (e.g., iov walking and MSS / TSO segmenting).
>
> ie., you could overload page address with a pointer to an object in your
> new abstraction layer and the struct has the other meta data.
>
> typedef struct skb_frag {
>         union {
>                 struct bio_vec bvec;
>                 struct new_abstraction abs;
>         };
> } skb_frag_t;
>
> where
>
> struct new_abstraction {
>         void *addr,
>         unsigned int len;
>         unsigned int offset;
> };
>
> I have been playing with a similar and it co-exists with the existing
> code quite well with the constraint on location of len and offset.
>
> >
> > Whether we want to support fragmentation in that model or not would
> > have to be decided.
> >
> > We can take pages from the page pool and feed them to drivers via
> > such an API, but drivers need to stop expecting pages.
>
> yes, drivers would have to be updated to understand the new format. A
> downside, but again relatively easy to manage.
>

I'm glad to see that you're open to this approach. As far as I
understand, getting device memory in a struct page form would still be
preferred, no? And the approach you point to would be a backup plan I
presume?

Since the good folks on this thread have pointed me to p2pdma to
address my use case, I've been doing some homework to see if it can
apply. AFACT so far, it applies, and Willem actually had a prototype
of it working a while back. The rough approach Willem and I are
thinking of would be something like:

1. The device memory driver would be the p2pdma provider. It would
expose a user API which allocates a device memory region, calls
pci_p2pdma_add_resource() and pci_p2pmem_publish() on it, and returns
a reference to it to the userspace.

2. The NIC driver would be the p2pdma client and orchestrator. It
would expose a user API which binds an rxq to a pci device. Prior to
the bind the user API would check that the pci device has published
p2p memory (pci_has_p2pmem()), and check the the p2p mem is accessible
to the driver (pci_p2pdma_distance() I think), etc.

3. The NIC would allocate pages from the p2pdma provider for incoming
packets, and create devmem skbs, and deliver the devmem skbs to the
user using the support in my RFC. AFACT all that code need not be
changed.

AFAICT, all the concerns brought up in this thread are sidestepped by
using p2pdma. I need not allocate struct pages in the core dma-buf
code anymore (or anywhere), and I need not allocate pgmaps. I would
just re-use the p2pdma support.

Anyone see any glaring issues with this approach? I plan on trying to
implement a PoC and sending an RFC v2.

The only pending concern is integration with the page pool, but we
already have some ideas on how to solve that.

> >
> > That's for data buffers only, obviously. We can keep using pages
> > and raw page pool for headers.
>
> yes.



--=20
Thanks,
Mina


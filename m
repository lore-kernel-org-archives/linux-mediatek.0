Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684E0EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jul 2023 02:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbHxQY6TxAMzw+E74X1AuxdarcQJj9Gt/ZbpwZ/TygU=; b=XR4RJr8v0iSYo4QT46XSIKVroU
	k9Kw2CscpXqew4U3qkZfyxjAwa4FF+rqKL7q4q1g2+lZsVTNGwHmOVxvV1iLwmbh0RzrhVbay0RLy
	RXCCl1KeINQUaFrZipdkZ1PwRIjgcVfAOrpvzLRk29bGYR1MGu5ghH8wuy3czgwr1lClVJ4fZxdU0
	9rfPqorAMAIVzKE21BlupdRzK5rht4IxSlg4rCkdcuk18FfIml2RnEbI1dCOk55DXdqwuRYTzM9qB
	E+Q7yrLb3I1gGa2fq8WKJ1uQwZt39YGlv7acnsHVjNWdtU5xUk86St1GKLrflM0aMhkcqgHIrHLHc
	OHWVqnHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDcK-000bsd-0U;
	Mon, 17 Jul 2023 02:05:40 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDcE-000bnP-2U
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Jul 2023 02:05:37 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-794af22ed66so1417150241.1
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Jul 2023 19:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689559533; x=1692151533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbHxQY6TxAMzw+E74X1AuxdarcQJj9Gt/ZbpwZ/TygU=;
        b=LlSTUor5++VfrsgeMNhTsQvIQfzINqZTzWZQdM/YlSc1psb5UXBj79x8AXNgn/Hc5A
         KaTvYC4VC1eG+mmxJ4DbPB6p+VgNFFYOC4tYdVzYNT3ug5LNJgsRg8VsoyzcS+sm04pE
         Wt6eRiT0+FDWCzJqcN53T2IfZTeSknkhipnm3jGqPVT4dK4nCvsAPXomUyqhI8+MYlbe
         Tz/Ilq2UPKQNetNtsj4hODKleTp8Z+h1sWKV52KA6HPz8QiUF3xBp4UM4U28CixheMZj
         b6a42JRIQsnZ2XS9G1W0iVxXQt3cn/loHL8RtxGp6yeNpHvnKxpK/70JC5nAjn3wb7MP
         KwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689559533; x=1692151533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbHxQY6TxAMzw+E74X1AuxdarcQJj9Gt/ZbpwZ/TygU=;
        b=LKr8ZSnh4sFOZgGfHr2oIZJKryD5neeVuZVvbfjM2fHyBzWAotUWXvpQAfcXpOqOQp
         fcvGTMws/lrZvGDIKRi7PiMJoOqiB0KMKJ1oiW4HIa0AUFEJyQhkHAXrJ9HPBqzXg2ug
         B4nIQLJ/T31/fyRSwZ7rXDgLVC/y+ay9cwYkpQvAVbLLD7YRSUmjFs8Vubi07k4+DZ6+
         7rJsYXMwq46Z0FiNMUiRjNnmYG4eMgxH/g6S/lteWXsWkXnHpMrRjwpBnkyhgvAAXBx4
         Icu6HE4djKGtmmGZGh/i6VluM2nFybl4ONU+x2X0IidUCmgvpeTPv1dcIx3jAQQBUPiY
         VBGQ==
X-Gm-Message-State: ABy/qLYq0nJBXCvqjSZIQ9NIkG14BDE5tWQHp46Vk006uWBOAtDzKPeU
	SDb4R6pmmhv3Ygl8kqRXZCrzsjHvb8RGjy5d6QkO3Q==
X-Google-Smtp-Source: APBJJlG4p2cK4W1H1tKopPr5y8IaWqaroILZGMK9NaigJZOT2EvVy25vSJ7aG1DyEXnwo0jMC/4B7Ob3YzhioH3ibTM=
X-Received: by 2002:a1f:e004:0:b0:481:2d4c:162d with SMTP id
 x4-20020a1fe004000000b004812d4c162dmr5072269vkg.8.1689559533341; Sun, 16 Jul
 2023 19:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230710215906.49514550@kernel.org> <20230711050445.GA19323@lst.de>
 <ZK1FbjG+VP/zxfO1@ziepe.ca> <20230711090047.37d7fe06@kernel.org>
 <04187826-8dad-d17b-2469-2837bafd3cd5@kernel.org> <20230711093224.1bf30ed5@kernel.org>
 <CAHS8izNHkLF0OowU=p=mSNZss700HKAzv1Oxqu2bvvfX_HxttA@mail.gmail.com>
 <20230711133915.03482fdc@kernel.org> <2263ae79-690e-8a4d-fca2-31aacc5c9bc6@kernel.org>
 <CAHS8izP=k8CqUZk7bGUx4ctm4m2kRC2MyEJv+N4+b0cHVkTQmA@mail.gmail.com>
 <ZK6kOBl4EgyYPtaD@ziepe.ca> <CAHS8izNuda2DXKTFAov64F7J2_BbMPaqJg1NuMpWpqGA20+S_Q@mail.gmail.com>
 <143a7ca4-e695-db98-9488-84cf8b78cf86@amd.com> <CAHS8izPm6XRS54LdCDZVd0C75tA1zHSu6jLVO8nzTLXCc=H7Nw@mail.gmail.com>
 <9cf3ce79-2d5e-090d-c83e-0c359ace1cb9@kernel.org>
In-Reply-To: <9cf3ce79-2d5e-090d-c83e-0c359ace1cb9@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 16 Jul 2023 19:05:21 -0700
Message-ID: <CAHS8izOL593X7=9pGaeC1JJ_5hYookZDn7O=fike=e48+myvxA@mail.gmail.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
To: David Ahern <dsahern@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Hari Ramakrishnan <rharix@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Samiullah Khawaja <skhawaja@google.com>, Willem de Bruijn <willemb@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@lst.de>, John Hubbard <jhubbard@nvidia.com>, 
	Dan Williams <dan.j.williams@intel.com>, Jesper Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com, 
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
	Jonathan Lemon <jonathan.lemon@gmail.com>, logang@deltatee.com, 
	Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_190535_103176_5D2BEF03 
X-CRM114-Status: GOOD (  42.30  )
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

On Fri, Jul 14, 2023 at 8:19=E2=80=AFAM David Ahern <dsahern@kernel.org> wr=
ote:
>
> On 7/14/23 8:55 AM, Mina Almasry wrote:
> >
> > I guess the remaining option not fully explored is the idea of getting
> > the networking stack to consume the scatterlist that
> > dma_buf_map_attachment() provides for the device memory. The very
> > rough approach I have in mind (for the RX path) is:
> >
> > 1. Some uapi that binds a dmabuf to an RX queue. It will do a
> > dma_buf_map_attachment() and get the sg table.
> >
> > 2. We need to feed the scratterlist entries to some allocator that
> > will chunk it up into pieces that can be allocated by the NIC for
> > incoming traffic. I'm thinking genalloc may work for this as-is, but I
> > may need to add one or use something else if I run into some issue.
> >
> > 3. We can implement a memory_provider that allocates these chunks and
> > wraps them in a struct new_abstraction (as David called it) and feeds
> > those into the page pool.
> >
> > 4. The page pool would need to be able to process these struct
> > new_abstraction alongside the struct pages it normally gets from
> > providers. This is maybe the most complicated part, but looking at the
> > page pool code it doesn't seem that big of a hurdle (but I have not
> > tried a POC yet).
> >
> > 5. The drivers (I looked at mlx5) seem to avoid making any mm calls on
> > the struct pages returned by the pool; the pool abstracts everything
> > already. The changes to the drivers may be minimal..?
> >
> > 6. We would need to add a new helper, skb_add_rx_new_abstraction_frag
> > that creates a frag out of new_abstraction rather than a struct page.
> >
> > Once the skb frags with struct new_abstraction are in the TCP stack,
> > they will need some special handling in code accessing the frags. But
> > my RFC already addressed that somewhat because the frags were
> > inaccessible in that case. In this case the frags will be both
> > inaccessible and will not be struct pages at all (things like
> > get_page() will not work), so more special handling will be required,
> > maybe.
> >
> > I imagine the TX path would be considerably less complicated because
> > the allocator and page pool are not involved (I think).
> >
> > Anyone see any glaring issues with this approach?
>
> Moving skb_frags to an alternative scheme is essential to make this
> work. The current page scheme to go from user virtual to pages to
> physical is not needed for the dmabuf use case.
>
> For the driver and hardware queue: don't you need a dedicated queue for
> the flow(s) in question?

In the RFC and the implementation I'm thinking of, the queue is
'dedicated' in that each queue will be a devmem TCP queue or a regular
queue. devmem queues generate devmem skbs and non-devmem queues
generate non-devmem skbs. We support switching queues between devmem
mode and non-devmem mode via a uapi.

> If not, how can you properly handle the
> teardown case (e.g., app crashes and you need to ensure all references
> to GPU memory are removed from NIC descriptors)?

Jason and Christian will correct me if I'm wrong, but AFAICT the
dma-buf API requires the dma-buf provider to keep the attachment
mapping alive as long as the importer requires it. The dma-buf API
gives the importer dma_buf_map_attachment() and
dma_buf_unmap_attachment() APIs, but there is no callback for the
exporter to inform the importer that it has to take the mapping away.
The closest thing I saw was the move_notify() callback, but that is
optional.

In my mind the way it works is that there will be some uapi that binds
a dma-buf to an RX queue, that will create the attachment and the
mapping. If the user crashes or closes the dma-buf handle then that
will unbind the dma-buf from the RX queue, but the mapping will remain
alive (via some refcounting) until all the NIC descriptors are freed
and the mapping is not under use anymore. Usually this will happen
next driver reset which destroys and recreates rx queues thereby
freeing all the NIC descriptors (but could be a new API so that we
don't rely on a driver reset).

> If you agree on this
> point, then you can require the dedicated queue management in the driver
> to use and expect only the alternative frag addressing scheme. ie., it
> knows the address is not struct page (validates by checking skb flag or
> frag flag or address magic), but a reference to say a page_pool entry
> (if you are using page_pool for management of the dmabuf slices) which
> contains the metadata needed for the use case.

Honestly if my understanding above doesn't match what you want, I
could implement 'dedicated queues' instead, just let me know what you
want at some future iteration. Now, I'm more worried about this memory
format issue and I'm working on an RX prototype without struct pages.
So far purely technically speaking it seems possible.


--=20
Thanks,
Mina


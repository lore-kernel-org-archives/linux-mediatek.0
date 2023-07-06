Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E5CEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 01:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLpBEWm0pyR5LDArWKNLZgik34a5WAbJKk4VIu4a3mM=; b=z+YLhSdC/vFSGPg7Z9eIwoUzUs
	Bf4gvnwRwWPkeyQ39rNohLofgcLqV4CQEzdwcA4CzLluMNtyn921pTKdzmUIpGCDVG7Q6On0AGd+s
	OeWk+bC6XmXARlcSVVFjjNCyc4qR5XwPaqKG5/Em/YjKCG0uhrVlgne5txniCScQNv7Ttzs6cG6Wq
	xA71lOkbS6YjO1/W9zRf67ms76uMZPNQt6jrcsJoyTJLxUjlhowSTUto6qaIwS/V3W0PvDW71Nkuk
	Whn904SmZaLQPuMI6tEG8Ck9xc+BAh1fUkCHudv494S/JdzdLHPPkdo4pmb3O1OZNawHJWFBADt/M
	JBRSF2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHDd7-00HYAm-2P;
	Thu, 06 Jul 2023 01:17:57 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHDd5-00HY8j-1C
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jul 2023 01:17:57 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-c2cf4e61bc6so130572276.3
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Jul 2023 18:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688606271; x=1691198271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLpBEWm0pyR5LDArWKNLZgik34a5WAbJKk4VIu4a3mM=;
        b=4//uKxlvWkGMHPzbfDP452dSEOLEXmN1iaJ//zX0rqP/mbDzvCG5TyTIw0DWPUERnF
         bFuiirw8RrlS3ZXoiPx8V5m2pC0/DQmoyQq6pRMgeyiiosUaxxiNJEhNVlxNVkTtjfcD
         O0HbxSwU8xJBqKqU7og1+KqIEUJ3mGr5lsE9XcRDCuzBQbMLXb7X8fhCRp1PtUEgSPxa
         98p815bY0xDraVhFBsnQipGUjeeVYLIte4Tj4mb2UHdtPIGrc/AubtmyLjTwpJ+LFftM
         WS73MxucrQDbAc0IIf+hHxzZ3cp7tBFtvv6B/uj+lOSXbnepsln4ABkuwudKSVOcQbK0
         QYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688606271; x=1691198271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLpBEWm0pyR5LDArWKNLZgik34a5WAbJKk4VIu4a3mM=;
        b=dOGrpWKdvozN6TqZCMqAKYN6LeVXFKzNa5zaDgD4cHzZrqMqDhtzAXtjydXdeFrh3g
         PomTXGHkcIcRhh3GIoAHXe/17CVjnRXRYOM5OHU6LrCQHbkUH+ZXs8hDk5W4IRqH9Yun
         Gr8t9PRdfOM7zStnm1KztewT4ws/vCI3qT0k1Pb4xeGma/7WV5pCtw6SmTfZb/zYd9fp
         x+lXAwD/mQlQxpePSTWSg5j1+bmMkFNnUilP0pygW1booKOOHbyCyba3fu6rYnJLtA18
         VqwMJNWm5MiMIP2OJwY2Vy44DTOpBpIZuVibX90HD/ZjRV1UNVp95s6C2uzP3I88xhVI
         mM/A==
X-Gm-Message-State: ABy/qLY1XTxYhEjdOsbuAiwkwM1xoZtoCqNpt211GN6dAeG9TCrtEa47
	OwZWxY7nzzx5S61tMjJYmZKmFESkVuCKvBA/qDmzwQ==
X-Google-Smtp-Source: APBJJlGkjwSPjge9ilAY8GDDe5IrMG3BEPPOLWt15ljhiPhs9+iYTg+xk7Xou7RlUIzPoz00OzNcF0vADrayLGJqrP8=
X-Received: by 2002:a05:6902:110:b0:c62:bdfa:57f4 with SMTP id
 o16-20020a056902011000b00c62bdfa57f4mr924315ybh.15.1688606271064; Wed, 05 Jul
 2023 18:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAKgT0Uc6Xoyh3Edgt+83b+HTM5j4JDr3fuxcyL9qDk+Wwt9APg@mail.gmail.com>
 <908b8b17-f942-f909-61e6-276df52a5ad5@huawei.com> <CAKgT0UeZfbxDYaeUntrQpxHmwCh6zy0dEpjxghiCNxPxv=kdoQ@mail.gmail.com>
 <72ccf224-7b45-76c5-5ca9-83e25112c9c6@redhat.com> <20230616122140.6e889357@kernel.org>
 <eadebd58-d79a-30b6-87aa-1c77acb2ec17@redhat.com> <20230619110705.106ec599@kernel.org>
 <CAHS8izOySGEcXmMg3Gbb5DS-D9-B165gNpwf5a+ObJ7WigLmHg@mail.gmail.com>
 <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org> <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
 <ZKNA9Pkg2vMJjHds@ziepe.ca>
In-Reply-To: <ZKNA9Pkg2vMJjHds@ziepe.ca>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 5 Jul 2023 18:17:39 -0700
Message-ID: <CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
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
	Jonathan Lemon <jonathan.lemon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_181755_417823_20B76411 
X-CRM114-Status: GOOD (  44.87  )
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

On Mon, Jul 3, 2023 at 2:43=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Sun, Jul 02, 2023 at 11:22:33PM -0700, Mina Almasry wrote:
> > On Sun, Jul 2, 2023 at 9:20=E2=80=AFPM David Ahern <dsahern@kernel.org>=
 wrote:
> > >
> > > On 6/29/23 8:27 PM, Mina Almasry wrote:
> > > >
> > > > Hello Jakub, I'm looking into device memory (peer-to-peer) networki=
ng
> > > > actually, and I plan to pursue using the page pool as a front end.
> > > >
> > > > Quick description of what I have so far:
> > > > current implementation uses device memory with struct pages; I am
> > > > putting all those pages in a gen_pool, and we have written an
> > > > allocator that allocates pages from the gen_pool. In the driver, we
> > > > use this allocator instead of alloc_page() (the driver in question =
is
> > > > gve which currently doesn't use the page pool). When the driver is
> > > > done with the p2p page, it simply decrements the refcount on it and
> > > > the page is freed back to the gen_pool.
> >
> > Quick update here, I was able to get my implementation working with
> > the page pool as a front end with the memory provider API Jakub wrote
> > here:
> > https://github.com/kuba-moo/linux/tree/pp-providers
> >
> > The main complication indeed was the fact that my device memory pages
> > are ZONE_DEVICE pages, which are incompatible with the page_pool due
> > to the union in struct page. I thought of a couple of approaches to
> > resolve that.
> >
> > 1. Make my device memory pages non-ZONE_DEVICE pages.
>
> Hard no on this from a mm perspective.. We need P2P memory to be
> properly tagged and have the expected struct pages to be DMA mappable
> and otherwise, you totally break everything if you try to do this..
>
> > 2. Convert the pages from ZONE_DEVICE pages to page_pool pages and
> > vice versa as they're being inserted and removed from the page pool.
>
> This is kind of scary, it is very, very, fragile to rework the pages
> like this. Eg what happens when the owning device unplugs and needs to
> revoke these pages? I think it would likely crash..
>
> I think it also technically breaks the DMA API as we may need to look
> into the pgmap to do cache ops on some architectures.
>
> I suggest you try to work with 8k folios and then the tail page's
> struct page is empty enough to store the information you need..

Hi Jason, sorry for the late reply,

I think this could work, and the page pool already supports > order 0
allocations. It may end up being a big change to the GVE driver which
as I understand currently deals with order 0 allocations exclusively.

Another issue is that in networks with low MTU, we could be DMAing
1400/1500 bytes into each allocation, which is problematic if the
allocation is 8K+. I would need to investigate a bit to see if/how to
solve that, and we may end up having to split the page and again run
into the 'not enough room in struct page' problem.

> Or allocate per page memory and do a memdesc like thing..
>

I need to review memdesc more closely. Do you imagine I add a pointer
in struct page that points to the memdesc? Or implement a page to
memdesc mapping in the page_pool? Either approach could work. I think
the concern would be accessing the memdesc entries may be a cache miss
unacceptable in fast paths, but I think I already dereference
page->pgmap in a few places and it doesn't seem to be an issue.

> Though overall, you won't find devices creating struct pages for their
> P2P memory today, so I'm not sure what the purpose is. Jonathan
> already got highly slammed for proposing code to the kernel that was
> unusable. Please don't repeat that. Other than a special NVMe use case
> the interface for P2P is DMABUF right now and it is not struct page
> backed.
>

Our approach is actually to extend DMABUF to provide struct page
backed attachment mappings, which as far as I understand sidesteps the
issues Jonathan ran into. Our code is fully functional with any device
that supports dmabuf and in fact a lot of my tests use udmabuf to
minimize the dependencies. The RFC may come with a udmabuf selftest to
showcase that any dmabuf, even a mocked one, would be supported.

> Even if we did get to struct pages for device memory, it is highly
> likely cases you are interested in will be using larger than 4k
> folios, so page pool would need to cope with this nicely as well.
>

--
Thanks,
Mina


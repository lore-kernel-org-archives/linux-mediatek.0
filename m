Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D01EB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 23:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYDiR4A6sQZndl0XT9fcGxrXdj+op4ndy7BoHFL4s70=; b=NvG7sGuc3uIVPU6JuRgqyfD1XB
	NfCMmTsjBPprmBWV7sQ2WrrfoKVgZVEbwVlp0ExyQAPI2rhL01Aemi7DmeAOuX+1atE0udw0E6t5K
	ZEvUHuqJdczaUN/R0wM9E/HpKAspSWpRKH5J4h8xL9pt8OA0nYwo/KH35DzUKQ5s1TNqKhjC9bK1z
	jm48n4rFnXssN9iq70b2boDPC28/92alROost3EiOQul7v08MHIJc+Emn9ckRQUQ3cmcE2BqZUJrm
	7assm3m1zRrEH8n7oV8WhbUNSa7K49HaCpHHfL3L2N8iqUL0THnfxFsmVvtyoFQ+cYz6iqdibCvvO
	93KvqPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIzuY-00CuQU-2s;
	Mon, 10 Jul 2023 23:03:18 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIzuV-00CuNv-1s
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 23:03:17 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-440c5960b58so1432612137.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 16:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689030191; x=1691622191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYDiR4A6sQZndl0XT9fcGxrXdj+op4ndy7BoHFL4s70=;
        b=FVxq5TQOlzhUeYgxXSn6ArdwnVF2hbExv8ZbNJDmV9BNzKz3GBQj6+AD6uZMvrgdjA
         xH2s5MBcoPw8P9HZMTzQhVMKFl7KLPJ/0aYueLJBRDrbwr7gSzHyFM2YiWW1icDJju+E
         vvdGR1RgvoEhOEE7I/nKR+NRqYhT3L43ky2dAfF+c8Z90UTc/eqloAdFhr/7E+KCVHK9
         hmmNiC+ql5Bd32aUQnuNmcp+0Qy7zkHQvVJSNgsTENiN4USow1G7e7mPbk+cREQGS465
         1Oh+BTqTZLre92S8DtOsIdsUe/09sJwqAJZZGaMzR0YFR5OxuiKhWVVSnovORxiSqyLX
         xwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689030191; x=1691622191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYDiR4A6sQZndl0XT9fcGxrXdj+op4ndy7BoHFL4s70=;
        b=ETdS+Wi2yO0JXuU+UQTUCwprh44fO8UzAfAHPWqrkic35BpQGAfkg4u+rjjyE/tO1W
         MrJTFGj8sf6FbRv8t1FdbDrg8f9VUE8/cb3nR3cwxvUFTjwE7gv9CTSx69H34EeJINYf
         c81OmPvfhzBPfbtMhT4QMmfgXG4w7j6NuAEMSwAMbdLx9FqkvaeyBEw9Ff0wmLCVoZzF
         uhU6VDeMg4SQ36XOsC4qmtDtfLwn8RPeeIxlsZ8sfqwlUqvLGuhkIv9SJOM+tIJfSle5
         Fn7i8CyorKTp7il9z75gSOlfCrZmFqd5IFgpDLNQwgyb2M2jSntlf3B00roF7htXb5Bk
         wC2Q==
X-Gm-Message-State: ABy/qLbMfjpSBydAJX9DBRd7u7MmkR7J5pDWWaArHz4JGRSpkdIMtUj2
	QGv9hnnH1uncGypN4FAXpI8TmnVaCYCYLfOfD5Sy5A==
X-Google-Smtp-Source: APBJJlHd8B3bLHM0BGlcUeLB7BK4Rn2fyXUPRVAiBYrDcyC69ohOF9Etzy1j0dKI2yZcDqXki7DFnPYYFtgRKmlffZ0=
X-Received: by 2002:a67:ff91:0:b0:443:8eab:c664 with SMTP id
 v17-20020a67ff91000000b004438eabc664mr5887615vsq.13.1689030190853; Mon, 10
 Jul 2023 16:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAKgT0UeZfbxDYaeUntrQpxHmwCh6zy0dEpjxghiCNxPxv=kdoQ@mail.gmail.com>
 <72ccf224-7b45-76c5-5ca9-83e25112c9c6@redhat.com> <20230616122140.6e889357@kernel.org>
 <eadebd58-d79a-30b6-87aa-1c77acb2ec17@redhat.com> <20230619110705.106ec599@kernel.org>
 <CAHS8izOySGEcXmMg3Gbb5DS-D9-B165gNpwf5a+ObJ7WigLmHg@mail.gmail.com>
 <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org> <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
 <ZKNA9Pkg2vMJjHds@ziepe.ca> <CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com>
 <ZKxDZfVAbVHgNgIM@ziepe.ca>
In-Reply-To: <ZKxDZfVAbVHgNgIM@ziepe.ca>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 10 Jul 2023 16:02:59 -0700
Message-ID: <CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230710_160315_620685_A9962951 
X-CRM114-Status: GOOD (  38.55  )
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

On Mon, Jul 10, 2023 at 10:44=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
>
> On Wed, Jul 05, 2023 at 06:17:39PM -0700, Mina Almasry wrote:
>
> > Another issue is that in networks with low MTU, we could be DMAing
> > 1400/1500 bytes into each allocation, which is problematic if the
> > allocation is 8K+. I would need to investigate a bit to see if/how to
> > solve that, and we may end up having to split the page and again run
> > into the 'not enough room in struct page' problem.
>
> You don't have an intree driver to use this with, so who knows, but
> the out of tree GPU drivers tend to use a 64k memory management page
> size, and I don't expect you'd make progress with a design where a 64K
> naturaly sized allocator is producing 4k/8k non-compound pages just
> for netdev. We are still struggling with pagemap support for variable
> page size folios, so there is a bunch of technical blockers before
> drivers could do this.
>
> This is why it is so important to come with a complete in-tree
> solution, as we cannot review this design if your work is done with
> hacked up out of tree drivers.
>

I think you're assuming the proposal requires dma-buf exporter driver
changes, and I have a 'hacked up out of tree driver' not visible to
you. Both are not quite right. The proposal requires no changes to the
dma-buf exporter, and works with udmabuf _as is_, proving that. Please
do review the proposal:
https://lore.kernel.org/netdev/20230710223304.1174642-1-almasrymina@google.=
com/

If you still don't like the approach, we can try something else.

> Fully and properly adding P2P ZONE_DEVICE to a real world driver is a
> pretty big ask still.
>

There is no such ask.

> > > Or allocate per page memory and do a memdesc like thing..
> >
> > I need to review memdesc more closely. Do you imagine I add a pointer
> > in struct page that points to the memdesc?
>
> Pointer to extra memory from the PFN has been the usual meaning of
> memdesc, so doing an interm where the pointer is in the struct page is
> a reasonable starting point.
>
> > > Though overall, you won't find devices creating struct pages for thei=
r
> > > P2P memory today, so I'm not sure what the purpose is. Jonathan
> > > already got highly slammed for proposing code to the kernel that was
> > > unusable. Please don't repeat that. Other than a special NVMe use cas=
e
> > > the interface for P2P is DMABUF right now and it is not struct page
> > > backed.
> > >
> >
> > Our approach is actually to extend DMABUF to provide struct page
> > backed attachment mappings, which as far as I understand sidesteps the
> > issues Jonathan ran into.
>
> No DMABUF exporters do this today, so your patch series is just as
> incomplete as the prior ones. Please don't post it as non-RFC,
> unusable code like this must not be merged.
>
> > that supports dmabuf and in fact a lot of my tests use udmabuf to
> > minimize the dependencies. The RFC may come with a udmabuf selftest to
> > showcase that any dmabuf, even a mocked one, would be supported.
>
> That is not good enough to get merged. You need to get agreement and
> coded merged from actual driver owners of dmabuf exporters that they
> want to support this direction. As above it has surprising road
> blocks outside netdev :\
>

The current proposal requires no changes to the dma-buf exporters:
https://lore.kernel.org/netdev/20230710223304.1174642-1-almasrymina@google.=
com/

On dma-buf changes required. I do need approval from the dma-buf
maintainers, but AFAICT, no approval from the dma-buf exporters (all I
need is already supported). If we need to change direction to a
proposal that needs additional support from the driver owners, yes,
we'd need their approval, but this is not the case at the moment.

--=20
Thanks,
Mina


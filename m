Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF689C001DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 17:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shCkNkuISpAjo0wvso+e9CaqC7Tu4suQbB4adf5Gg28=; b=IqxQKarCe6d1RBBCE4X71waWQb
	2yxQmnrM+gGilnQ734dixV0vE5HVFfWCtbg1LoBbRN2cfFLZYNJBX3wivHaEwoSRkhlDvF8OsGunB
	sqf5+zCx+GbS7s2v7S3KEAioodsZWIIEyF3GRjz5163ZziJhNE26x2MdhLWlFPxmg78/CAn8fuKFC
	Yebd2ZWIyVY3Qi1VS7BT/RAfGZNz3ojkTe+l8iuGLk0mXrvoAbxiqfxSqndu+B4Y47LjIECgcSuLP
	ri+XEJE89cPsduGN+fbw5aZCeyEh1FjXAlE6tS1d9RRH+qNcYM3/XHfCKeafQBD1uAp8XaEjlZut+
	wg0ONR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGp2-00FTdK-0y;
	Tue, 11 Jul 2023 17:06:44 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGoz-00FTbo-2g
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jul 2023 17:06:43 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-79492b8f4bbso1984261241.2
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jul 2023 10:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689095200; x=1691687200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shCkNkuISpAjo0wvso+e9CaqC7Tu4suQbB4adf5Gg28=;
        b=YbbA06X7m0lTKmRD/qrCSPe46OZZXtyoWwxn94R62ChwLlyI4NVTjYPGfo3UBlMajj
         k6fH+Dkqu85y17natO+NnHXFOP3k1pkffPwP4MSk9drst1XGd/0ospwiBvP1V2Cjsp4w
         kqT2TO4HE+d7uUCguJ2ovnNME5Ya6Nu2B2evKvl7BcEp1EWaRJzM466r1a7+Ac3BeOwj
         E0omfNfD0agGLMLbLYeHEb+3aukvUGiEi+9dtdNeOxvp9oOSGBCChkpDj4aW9pT8bT/k
         Sw2KCbmOc1yGOSVjG88PEgzwwiXTrz+H1cyxyuHyDsyfTWNm1JTQjWbMvuxQVExeMj+M
         gipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689095200; x=1691687200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shCkNkuISpAjo0wvso+e9CaqC7Tu4suQbB4adf5Gg28=;
        b=GflF6gpTK1/BOlaRVAhOdLOIyCu12kb/TuCzIcEItmra50pOame0kwImjpfqm/aqsx
         ghmiAkr02zferxqZeAfnbgERyGSr/YEhaSLrUSZsFEZszH10TLfZ3vb7qtmSx6hi/APV
         hM4Rh9FutV3j3WYsTil1JCxzf80kRmXSEwu9Jt+42eLxXdIbAbtxTUueeAesBY49wMZK
         3YqIP2yLtI7ygUqGBIo7IHiNwaqWxQQ7/TNhsy8WBHpSF8ULm/PKfD+IxjCz5ps68te3
         Ac4YHOrK/xD8EFrWvgro5WtPMFRC4U6iCqysulmPusmb9SCAKkv/qdru+LwjZlWRo49o
         /QmA==
X-Gm-Message-State: ABy/qLZENLGAYB4PXfYsW5dFqVlZPpWfRjZp70P0HM2wFSDAbPP2d9xq
	WMGAkVDLXKGL9IfEMDeyu6SRV+yrkovennCEZdpDPA==
X-Google-Smtp-Source: APBJJlHXFNHBs4KDviEzXlES6rfgeVe8nKhN83Gxg+u3ccdWyDygmItRYbBA45O5bC+ajfLgRYLuiJDC4r1zWGlkDaw=
X-Received: by 2002:a67:e34b:0:b0:444:c49c:a95d with SMTP id
 s11-20020a67e34b000000b00444c49ca95dmr7222548vsm.7.1689095200160; Tue, 11 Jul
 2023 10:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org>
 <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
 <ZKNA9Pkg2vMJjHds@ziepe.ca> <CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com>
 <ZKxDZfVAbVHgNgIM@ziepe.ca> <CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
 <ZKyZBbKEpmkFkpWV@ziepe.ca> <20230711042708.GA18658@lst.de>
 <20230710215906.49514550@kernel.org> <20230711050445.GA19323@lst.de>
 <ZK1FbjG+VP/zxfO1@ziepe.ca> <20230711090047.37d7fe06@kernel.org>
 <04187826-8dad-d17b-2469-2837bafd3cd5@kernel.org> <20230711093224.1bf30ed5@kernel.org>
In-Reply-To: <20230711093224.1bf30ed5@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 11 Jul 2023 10:06:28 -0700
Message-ID: <CAHS8izNHkLF0OowU=p=mSNZss700HKAzv1Oxqu2bvvfX_HxttA@mail.gmail.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
To: Jakub Kicinski <kuba@kernel.org>
Cc: David Ahern <dsahern@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@lst.de>, 
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
	Jonathan Lemon <jonathan.lemon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_100641_871581_E7431451 
X-CRM114-Status: GOOD (  17.75  )
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

On Tue, Jul 11, 2023 at 9:32=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 11 Jul 2023 10:20:58 -0600 David Ahern wrote:
> > On 7/11/23 10:00 AM, Jakub Kicinski wrote:
> > >> RDMA works with the AMD and Intel intree drivers using DMABUF withou=
t
> > >> requiring struct pages using the DRM hacky scatterlist approach.
> > > I see, thanks. We need pages primarily for refcounting. Avoiding all
> > > the infamous problems with memory pins. Oh well.
> >
> > io_uring for example already manages the page pinning. An skb flag was
> > added for ZC Tx API to avoid refcounting in the core networking layer.
>
> Right, we can refcount in similar fashion. Still tracking explicitly
> when buffers are handed over to the NIC.
>
> > Any reason not to allow an alternative representation for skb frags tha=
n
> > struct page?
>
> I don't think there's a hard technical reason. We can make it work.

I also think we can switch the representation for skb frags to
something else. However - please do correct me if I'm wrong - I don't
think that is sufficient for device memory TCP. My understanding is
that we also need to modify any NIC drivers that want to use device
memory TCP to understand a new memory type, and the page pool as well
if that's involved. I think in particular modifying the memory type in
all the NIC drivers that want to do device memory TCP is difficult. Do
you think this is feasible?

--
Thanks,
Mina


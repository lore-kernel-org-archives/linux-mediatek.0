Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C64EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 22:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mz/xfQs228JkD+EmKHVt4aMZuBD4Ky+nWhlpQiowkyI=; b=roPZEHaqhMCMVwrpzVVLEl1MsZ
	PbbOj0hpizRvMRrfoSE83diHJh4DTCVbqkuPMtP/hNbvZtwi7lq1fdgEk4nu2ao8OjlnC4/TfYwTL
	6Fcswp37wRpwtwPR+Q5VWQgPJluIh4SljAcEGkjg7zf4YStQhWyVfSaA7Og1lL53utuyCCRS8N608
	/p4Koj97ikPBWau13y5gEE+RohFLX8Eop8BCt+9sEZFfoD9v9HsdLpxL7gSjMF5bqEsDocTOmNe/9
	jvUmvYv7b48gR9rDhGp5bZL5co/8HUBwEESqDguTlPoMPOr5FJtMc/2s/cVi6bvfDGfRndOGtnj6N
	1WZffIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJiX6-001Pys-2f;
	Wed, 12 Jul 2023 22:42:04 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJiX3-001PyB-34
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 22:42:03 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-440c14d6a5eso78034137.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 15:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689201720; x=1691793720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mz/xfQs228JkD+EmKHVt4aMZuBD4Ky+nWhlpQiowkyI=;
        b=3JuEXg+yPSc6oD9k/gVHY9JmrXpcmYz2DdmUKfAenXycWth8Ys52+0sfJNBJqhx+JA
         POfjtfGzT4R2YWrxkgajUcAHuZwh0tHTbms8ZnyvNuUeIHHVBkyqjnNmi7pVjn+1p2XO
         FT+BJijgfx1i+WKA7jlT7PyuiJDtM4V2bSpZ2ORkcz5BPrprzhZVrwTkYbGJtevpuwWu
         +4s8IYxiO+jzUiXLxbNo6SvC/rtIpPMvBFlxMxrSFT5yrglpO/RRHqDNwsQ7XIWt3Mrm
         6q7/TIQmwLLzR3bbJ6UgAadSF6ClWCYMawulX/tcO2I2umBPB5clyz54VDHR+jYWjASk
         +o/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689201720; x=1691793720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mz/xfQs228JkD+EmKHVt4aMZuBD4Ky+nWhlpQiowkyI=;
        b=Fwhwmalexhjo9G4NYsTnBlp6GB0Kup6Q2lGOYRFiRw6W+oC5W9RK5GZsfEy65B575U
         JBYn/TFTOpBVK8nWmWhSdWDf+j69sct9abNWToryWns6G80oxpbYphWCbSG6Gf8H9xUC
         WdwQBIYmRGAI0lXQY+lC2dzOFhEIJsKtL9XqhYltDhxuIZfuvc4gHT92fRHItPkEU/gt
         +MVJtUoyODtaPTJj5cu0I+qO8vxhXTMK92JExSEAr4ww3Zt1aW8goyfzd+qJugTUzwBb
         Czop7hJY3yYfliddQUqwidSb5LfOTyCjCRxDNDrIcgqYOc6ZjIBMKYsTNHzmtkNC6GNS
         2bHw==
X-Gm-Message-State: ABy/qLYQeo0gYgw5lG3qaVFIEAoYhH02AgZf+hX/gvtxnJvX2TDMRfSK
	TlQQBkzMYyOqQRnQ4z9YSvTft+xvVkzdmeXcleK7ag==
X-Google-Smtp-Source: APBJJlHG9tuCdU7vOjJOYos5RKoNNv0/pCxlxo2gIMlFQovsMtvJLWra+WgillnY1AK2C/ycTstYjvsR47Bt+BOekOU=
X-Received: by 2002:a67:b407:0:b0:443:4eca:f7f0 with SMTP id
 x7-20020a67b407000000b004434ecaf7f0mr99255vsl.11.1689201719631; Wed, 12 Jul
 2023 15:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230711050445.GA19323@lst.de> <ZK1FbjG+VP/zxfO1@ziepe.ca>
 <20230711090047.37d7fe06@kernel.org> <04187826-8dad-d17b-2469-2837bafd3cd5@kernel.org>
 <20230711093224.1bf30ed5@kernel.org> <CAHS8izNHkLF0OowU=p=mSNZss700HKAzv1Oxqu2bvvfX_HxttA@mail.gmail.com>
 <20230711133915.03482fdc@kernel.org> <2263ae79-690e-8a4d-fca2-31aacc5c9bc6@kernel.org>
 <CAHS8izP=k8CqUZk7bGUx4ctm4m2kRC2MyEJv+N4+b0cHVkTQmA@mail.gmail.com>
 <20f6cbda-e361-9a81-de51-b395ec13841a@amd.com> <ZK6ktnwIjXIobFIM@ziepe.ca> <4f6e62e0-b4c2-9fca-6964-28cfea902de0@amd.com>
In-Reply-To: <4f6e62e0-b4c2-9fca-6964-28cfea902de0@amd.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 12 Jul 2023 15:41:47 -0700
Message-ID: <CAHS8izPK4DZ-7JKuxh712tjuh1zpB+Stu6aSdC6vbN3YWHLfMg@mail.gmail.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, David Ahern <dsahern@kernel.org>, 
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
X-CRM114-CacheID: sfid-20230712_154201_988834_2206A3FF 
X-CRM114-Status: GOOD (  24.95  )
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

On Wed, Jul 12, 2023 at 6:35=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 12.07.23 um 15:03 schrieb Jason Gunthorpe:
> > On Wed, Jul 12, 2023 at 09:55:51AM +0200, Christian K=C3=B6nig wrote:
> >
> >>> Anyone see any glaring issues with this approach? I plan on trying to
> >>> implement a PoC and sending an RFC v2.
> >> Well we already have DMA-buf as user API for this use case, which is
> >> perfectly supported by RDMA if I'm not completely mistaken.
> >>
> >> So what problem do you try to solve here actually?
> > In a nutshell, netdev's design currently needs struct pages to do DMA
> > to it's packet buffers.
> >
> > So it cannot consume the scatterlist that dmabuf puts out
> >
> > RDMA doesn't need struct pages at all, so it is fine.
> >
> > If Mina can go down the path of changing netdev to avoid needing
> > struct pages then no changes to DRM side things.
> >
> > Otherwise a P2P struct page and a co-existance with netmem on a
> > ZONE_DEVICE page would be required. :\
>
> Uff, depending on why netdev needs struct page (I think I have a good
> idea why) this isn't really going to work generically either way.
>
> What we maybe able to do is to allow copy_file_range() between DMA-buf
> file descriptor and a TCP socket.
>
> If I'm not completely mistaken that should then end up in DMA-bufs
> file_operations->copy_file_range callback (maybe with some minor change
> to allows this).
>
> The DMA-buf framework could then forward this to the exporter of the
> memory which owns the backing memory could then do the necessary steps.
>

I may be missing something, but the way it works on our end for
receive is that we give a list of buffers (dma_addr + length + other
metadata) to the network card, and the network card writes incoming
packets to these dma_addrs and gives us an rx completion pointing to
the data it DMA'd. Usually the network card does something like an
alloc_page() + dma_map_page() and provides the to the network card.
Transmit path works similarly. Not sure that adding copy_file_range()
support to dma-buf enables this in some way.

--=20
Thanks,
Mina


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2471EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 06:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dh2dAhBT/r+t8dBDKmgiVOzd46bgkC5w60SC2kQomME=; b=h2sCazVHUsjBOPBjep77IsNkyb
	YoNnqaAndM03E59tXE6WKlkvic13t7dnbv6HM8tCkZJYIcWmc2ahAi0SS30kzfQH5l8ID2LaKz4zk
	W2e1V5X0SQxUoHFY2nCC625VfdS48lVG68oxZvYY/MS204pjYLKn6v+k//a28Tn/3RXby6NVr8ADB
	wWre9JTkT5ijtzKbQsgeKK7AjqMQSRXdPPNaIv6zbZG+8/sMBrSVrVXV1BvkefOoVNj45P8XmgCy6
	6gDdS6HtWQekhJu2Ft/YDCgFSOc6PDPRKj1ighghNxL46s4cRxf9dChye64RVE0w2yI0/xwABmgLW
	DpuNN7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGCxZ-009S7l-0N;
	Mon, 03 Jul 2023 06:22:53 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGCxW-009S53-0b
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jul 2023 06:22:51 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-78a1e095508so1371328241.0
        for <linux-mediatek@lists.infradead.org>; Sun, 02 Jul 2023 23:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688365365; x=1690957365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dh2dAhBT/r+t8dBDKmgiVOzd46bgkC5w60SC2kQomME=;
        b=CSbXeIllDKG52Hz2y0BzvzeWTNUEc4fr1uNpd8I0jFTbwT+x3xDzfAMsPWIKx6IndK
         bOfUdQihG5MDXKogCsRu0ZSQMmMqJLNluQnXpau1J4w9cUIMMHIL/jF+DEbhCBDpOV4D
         UrvGya3awuDtGeA3F5CEGu7Tsy5x6It+z9gqJsw2oPuPXEPiIxuE9fQSoLE3tGreKNSn
         n29sZy8eBYgJ3uG2O2Vor2R9NR0H8vnSeaY4+eTO2hqtFSudrrp5NWwTcNsssh4ExF2G
         md6hi/utlTHH/EJqeqUjebheF7KLxlDoH+TCdnplsNmsiqqiOSECjVqhIKnbPUezcxIN
         Ax/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688365365; x=1690957365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dh2dAhBT/r+t8dBDKmgiVOzd46bgkC5w60SC2kQomME=;
        b=mIpg+oofTnLf5wzsh+1APBes469hbWUo/0UETLlU+Lu4iMXIH/D19l+o8rsvCGlzUk
         fSf8aOUSuWLjVHWKHzNbURzDrM/sWWers7fB0pHjSH9LdPJsRIMJRu2DlPLyn42X/zAr
         ilVxF7Pf64HfQQ9Im6GyxEN++v6cnKXI0u3QAKuUvMRaaxboSrk/t9vDSwYTF0kjnbtI
         Yqm35xrtxIcv38aAXwuhTYEH17s1foM2Py0ZJy2Y4cO+VeLoPbWaTwNCp6cRq8EJvYnD
         KjaQxpAX31Sv5hpX8VyV5BISqgDgmN7RMQGjU5wvk6hNhyQ69Xrg2Pp4LaEXpUdhrhcH
         KH4g==
X-Gm-Message-State: ABy/qLbTwdC5bqeBovJmD1Ltpvgbj12wrSk7FBQWkWXb9GO929YCwPss
	TCQwtLOzsnj2SWEIfwa9VuNdQKcKTLfgR9hmhD9JfQ==
X-Google-Smtp-Source: APBJJlH0cEalozKdN1PxBzsfGgMveO3/o2cxZaibne5GXfrl3uwlOSKqPsgSIeVejxm1iGr09N+dbcj5d2OvkAVr1vs=
X-Received: by 2002:a67:ee55:0:b0:443:6052:43ac with SMTP id
 g21-20020a67ee55000000b00443605243acmr3287737vsp.30.1688365364750; Sun, 02
 Jul 2023 23:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230612130256.4572-1-linyunsheng@huawei.com> <20230612130256.4572-5-linyunsheng@huawei.com>
 <20230614101954.30112d6e@kernel.org> <8c544cd9-00a3-2f17-bd04-13ca99136750@huawei.com>
 <20230615095100.35c5eb10@kernel.org> <CAKgT0Uc6Xoyh3Edgt+83b+HTM5j4JDr3fuxcyL9qDk+Wwt9APg@mail.gmail.com>
 <908b8b17-f942-f909-61e6-276df52a5ad5@huawei.com> <CAKgT0UeZfbxDYaeUntrQpxHmwCh6zy0dEpjxghiCNxPxv=kdoQ@mail.gmail.com>
 <72ccf224-7b45-76c5-5ca9-83e25112c9c6@redhat.com> <20230616122140.6e889357@kernel.org>
 <eadebd58-d79a-30b6-87aa-1c77acb2ec17@redhat.com> <20230619110705.106ec599@kernel.org>
 <CAHS8izOySGEcXmMg3Gbb5DS-D9-B165gNpwf5a+ObJ7WigLmHg@mail.gmail.com> <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org>
In-Reply-To: <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 2 Jul 2023 23:22:33 -0700
Message-ID: <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
To: David Ahern <dsahern@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com, 
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
X-CRM114-CacheID: sfid-20230702_232250_249326_2BF79726 
X-CRM114-Status: GOOD (  28.40  )
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

On Sun, Jul 2, 2023 at 9:20=E2=80=AFPM David Ahern <dsahern@kernel.org> wro=
te:
>
> On 6/29/23 8:27 PM, Mina Almasry wrote:
> >
> > Hello Jakub, I'm looking into device memory (peer-to-peer) networking
> > actually, and I plan to pursue using the page pool as a front end.
> >
> > Quick description of what I have so far:
> > current implementation uses device memory with struct pages; I am
> > putting all those pages in a gen_pool, and we have written an
> > allocator that allocates pages from the gen_pool. In the driver, we
> > use this allocator instead of alloc_page() (the driver in question is
> > gve which currently doesn't use the page pool). When the driver is
> > done with the p2p page, it simply decrements the refcount on it and
> > the page is freed back to the gen_pool.

Quick update here, I was able to get my implementation working with
the page pool as a front end with the memory provider API Jakub wrote
here:
https://github.com/kuba-moo/linux/tree/pp-providers

The main complication indeed was the fact that my device memory pages
are ZONE_DEVICE pages, which are incompatible with the page_pool due
to the union in struct page. I thought of a couple of approaches to
resolve that.

1. Make my device memory pages non-ZONE_DEVICE pages. The issue with
that is that if the page is not ZONE_DEVICE, put_page(page) will
attempt to free it to the buddy allocator I think, which is not
correct. The only places where the mm stack currently allow custom
freeing callback (AFAIK), are for ZONE_DEVICE page where
free_zone_device_page() will call the provided callback in
page->pgmap->ops->page_free, and compound pages where the
compound_dtor is specified. My device memory pages aren't compound
pages so only ZONE_DEVICE pages do what I want.

2. Convert the pages from ZONE_DEVICE pages to page_pool pages and
vice versa as they're being inserted and removed from the page pool.
This, I think, works elegantly without any issue, and is the option I
went with. The info from ZONE_DEVICE that I care about for device
memory TCP is the page->zone_device_data which holds the dma_addr, and
the page->pgmap which holds the page_free op. I'm able to store both
in my memory provider so I can swap pages from ZONE_DEVICE and
page_pool back and forth.

So far I haven't needed to make any modifications to the memory
provider implementation Jakub has pretty much, and my functionality
tests are passing. If there are no major objections I'll look into
cleaning up the interface a bit and propose it for merge. This is a
prerequisite of device memory TCP via the page_pool.

>
> I take it these are typical Linux networking applications using standard
> socket APIs (not dpdk or xdp sockets or such)? If so, what does tcpdump
> show for those skbs with pages for the device memory?
>

Yes these are using (mostly) standing socket APIs. We have small
extensions to sendmsg() and recvmsg() to pass a reference to the
device memory in both these cases, but that's about it.

tcpdump is able to access the header of these skbs which is in host
memory, but not the payload in device memory. Here is an example
session with my netcat-like test for device memory TCP:
https://pastebin.com/raw/FRjKf0kv

tcpdump seems to work, and the length of the packets above is correct.
tcpdump -A however isn't able to print the payload of the packets:
https://pastebin.com/raw/2PcNxaZV

--=20
Thanks,
Mina


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B58EB64D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 13:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdLQFPNPGe/xfjjMPC9CiT+YRxrl3hMH3BrdIE5YjaY=; b=f4t5jkwUB1PPDsxIqCl9J+npis
	CK2Ofb/TsTT4p1tyVA9t7UBA2JcCu/EIu6DdCvsM/HS7yvrNxcuaipuN/XwX8l2P9/P4eUpUtWtCv
	jpZ5WPu38gX/cd0c0aotbF7ndHamPIQ3gIp/gdIUdm0/827CpkRHPYChT3t7YFQzGKG2IDkjaRRwU
	kbju8xBT4vf0FrRKFjZgWXwcLgmtyTiMHi5s/QZFnEb7LHxSmXXGNd+04dQhGgLIjMLJZMnBiqlqM
	xhYmGLXgslTqahgaLc+jDqF8SCePkTIV3SZT0TWAp1sxsbdO27FD1K6Vg9q+CNx99jnvr/TxxjMT5
	zQVqCjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZW3-00021p-23;
	Wed, 12 Jul 2023 13:04:23 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZW1-0001yK-15
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 13:04:22 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-76754b9eac0so674821185a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 06:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689167054; x=1691759054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mdLQFPNPGe/xfjjMPC9CiT+YRxrl3hMH3BrdIE5YjaY=;
        b=YI0f6+XglZeneofRioxe+G+n6wemfm3EawZ7D+K5a8tal5n6sf4v0Bhn9PvLpkjxIK
         ZNk+i1n01TVGNdnCUQNAW6cvhz9r4c7zCJNrFd0LMb58e7DRNkqqJ8aPQoz67dGUrFHs
         K808ROVLQXnwZaSdM02syiSLWGvj7C+CKL+eL1mL3EiBhmMcAE2WIWrGzJM0kbAuBUNQ
         xNcv05BkVV8M1LVXNFaNx+C0BHx+DbgBBGkf/4E33OnR0mdkWoeztyw5xr7gXlj1fof+
         7G1XWjNZvn1VhZXeOgIB6lKM6WsJ9nuZdu8lCLjq70wAtKYiFyc2rtStYfhaLlVvT0wg
         T7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689167054; x=1691759054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdLQFPNPGe/xfjjMPC9CiT+YRxrl3hMH3BrdIE5YjaY=;
        b=GWkab5ET3ALx4dA5oPrZV2anGw+eEgbQ8tW1UvByFZ3q/ectVbPg/T6ZC+aMUXkNxv
         0uP3mgupCVbC0G/fLYyEf5N8hTTJXdrU3vlCwc1ioNqlVWMqfcUx0jKZaJ028l8wxe3F
         WAn3ay877Drtsk5wPdg0Y08J11/9r8WrTkMtIfTRi81N8RonL76YjygrOt34fzWqhQii
         u66nwfDKfCY39oQaVQ/mlOdLA7unep6jhrItIgKBhy8KEZMMP/AetqtFvU/pACTJmf85
         t6QP+oQXRrrAk/fQGZ0VhiFuzksV4fSabBVhY4fZrPT1yG5Ulck28VrlF9oTdNumL2es
         1Ksg==
X-Gm-Message-State: ABy/qLZkJYbTnjienteOOxjxljnZqikBC045yzfueqE7RescRuirljJG
	rq48RTCOXeNZo0HYyxBR3ayzeg==
X-Google-Smtp-Source: APBJJlEdeYkVDmlqAfKbS3vhgLsKS/cdCg6j6IrkhW2imk9UWrcFiHdY0Nrk6nRyhVKg/ih/MRHN1Q==
X-Received: by 2002:a05:620a:4105:b0:75b:23a0:e7a1 with SMTP id j5-20020a05620a410500b0075b23a0e7a1mr21820466qko.2.1689167054115;
        Wed, 12 Jul 2023 06:04:14 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id pi21-20020a05620a379500b00767c9915e32sm2126812qkn.70.2023.07.12.06.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 06:04:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qJZVW-000OK0-71;
	Wed, 12 Jul 2023 10:03:50 -0300
Date: Wed, 12 Jul 2023 10:03:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Mina Almasry <almasrymina@google.com>, David Ahern <dsahern@kernel.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@lst.de>,
	John Hubbard <jhubbard@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
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
	Jonathan Lemon <jonathan.lemon@gmail.com>, logang@deltatee.com,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
Message-ID: <ZK6ktnwIjXIobFIM@ziepe.ca>
References: <20230711050445.GA19323@lst.de>
 <ZK1FbjG+VP/zxfO1@ziepe.ca>
 <20230711090047.37d7fe06@kernel.org>
 <04187826-8dad-d17b-2469-2837bafd3cd5@kernel.org>
 <20230711093224.1bf30ed5@kernel.org>
 <CAHS8izNHkLF0OowU=p=mSNZss700HKAzv1Oxqu2bvvfX_HxttA@mail.gmail.com>
 <20230711133915.03482fdc@kernel.org>
 <2263ae79-690e-8a4d-fca2-31aacc5c9bc6@kernel.org>
 <CAHS8izP=k8CqUZk7bGUx4ctm4m2kRC2MyEJv+N4+b0cHVkTQmA@mail.gmail.com>
 <20f6cbda-e361-9a81-de51-b395ec13841a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20f6cbda-e361-9a81-de51-b395ec13841a@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_060421_378273_10BD65AC 
X-CRM114-Status: GOOD (  12.04  )
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

On Wed, Jul 12, 2023 at 09:55:51AM +0200, Christian König wrote:

> > Anyone see any glaring issues with this approach? I plan on trying to
> > implement a PoC and sending an RFC v2.
> 
> Well we already have DMA-buf as user API for this use case, which is
> perfectly supported by RDMA if I'm not completely mistaken.
> 
> So what problem do you try to solve here actually?

In a nutshell, netdev's design currently needs struct pages to do DMA
to it's packet buffers.

So it cannot consume the scatterlist that dmabuf puts out

RDMA doesn't need struct pages at all, so it is fine.

If Mina can go down the path of changing netdev to avoid needing
struct pages then no changes to DRM side things.

Otherwise a P2P struct page and a co-existance with netmem on a
ZONE_DEVICE page would be required. :\

Jason


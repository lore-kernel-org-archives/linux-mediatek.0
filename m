Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDF8EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 13:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPdyri92L3qWMfLakhYh6hhyYNfXQVLXTm4MfbgrCSM=; b=dllvRJLh4FRh3yYYlZvPzk31Qe
	ApT+RA7hxFV15E89+6JgixIlKeG3laiMZaKn0JdzBuEPNYm2ZijgZQhGRBw+AGDtadcIbrrEaeLIx
	yUiNAxyDzVjx0UGGWJghl6w8z9rO4RlrE2qKJsgMUXr9K4We8GPAk1f0BC976XutAhyDw4kU0MPfW
	gVK3RCZDglBeEbQz+pleZiHXrQ8w0HK1Shy4ayoZ08H/YTyHuA6+quS7e0NxvgIz8/NpNhNvbPjV/
	dJqD+J+ttnuNOEMV1MgMoZask2hXDaYNIks8VoRUsiHeQbCP8Eqp20eH1WEN+sKTXhby6gf3n+UEV
	RM5Moeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJD9R-00ExhR-01;
	Tue, 11 Jul 2023 13:11:33 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJD9N-00ExgC-2y
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jul 2023 13:11:31 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-55779047021so3901375a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jul 2023 06:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689081088; x=1691673088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wPdyri92L3qWMfLakhYh6hhyYNfXQVLXTm4MfbgrCSM=;
        b=HwueZwYKGASMpnXA54qa8kJRp+Y4TROwaWVjgJT4DHOi3ase5SMQmwObiWZdcOnT2b
         CwCMZWz9Hl0Nf8clwIL1/U8+96qtWxYbRLt78/Fl90aPtkcN457gFUR5xSld5i5HM9tr
         Oavf4f466zEk31fxGKU7oxnYu6069ftd+pioCLw9L1Zz95x2dH0oN3DPndP4gxw9RR2l
         Q+6idxu3a9Gwva3IUt/XaDHCSfP8VtvG4OKolu00OkEPrPR6Bss4kT7j64ItS/p+g4OJ
         /yCYIbcFLFzGPz5W1FDVexH7CCmz3cmPkKfhUC40s6RPZmxWu/Wm088eTy+yzVLEHOUU
         7VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689081088; x=1691673088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPdyri92L3qWMfLakhYh6hhyYNfXQVLXTm4MfbgrCSM=;
        b=DtY+MesCpF52eM5BxawoGiQ4+tWliZGEi3Da31dEXb2gGZZpQ10DLmHaQnokXnMEv4
         2TmmwOu0gY5qcIbNBpmQh91h66/eTtPSjofz5Gs3lb5TPVB1tMgq6SBHT/DbefSnRnCv
         NHmHszscCTjtIULqpa4sTnRfHc1GUigFDkMRTnETQQNbItoH3TbAoBfMKNazA+bQN6fR
         QVM5cQAtKuM5uH5uFQ5pkAD9hmX+oLp41GMZm7MbFK+4zc1CDpmFiN6O8QZ++2aZJgpU
         hLlS9/nHt23SM1AFeLoA/XbXVnlU8mvHteWlCt34C2Rqvlul3DbirrsKQ0CpvYeWAutb
         pr1g==
X-Gm-Message-State: ABy/qLYbys1XincJ3o+B4K2pCV67PCfamyYnLInKPUGrBztDLhWoCPIc
	dfz6iDpgeQ3WWVSJIPMQyHDtXw==
X-Google-Smtp-Source: APBJJlH/pNqhx9Sk3rAUvsyO9Yo5N3ENJbgYjIKEPGeTeHsBGXcH1oaexcEKAHIm23DxD+Q1c2BUkg==
X-Received: by 2002:a17:90a:df02:b0:25c:571:44bc with SMTP id gp2-20020a17090adf0200b0025c057144bcmr12789299pjb.28.1689081087984;
        Tue, 11 Jul 2023 06:11:27 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id q17-20020a17090a2e1100b00256353eb8f2sm7811671pjd.5.2023.07.11.06.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 06:11:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qJD9J-0009xq-LG;
	Tue, 11 Jul 2023 10:11:25 -0300
Date: Tue, 11 Jul 2023 10:11:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mina Almasry <almasrymina@google.com>
Cc: Christoph Hellwig <hch@lst.de>, John Hubbard <jhubbard@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
Message-ID: <ZK1U/Vo0NvhNm9pq@ziepe.ca>
References: <20230619110705.106ec599@kernel.org>
 <CAHS8izOySGEcXmMg3Gbb5DS-D9-B165gNpwf5a+ObJ7WigLmHg@mail.gmail.com>
 <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org>
 <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
 <ZKNA9Pkg2vMJjHds@ziepe.ca>
 <CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com>
 <ZKxDZfVAbVHgNgIM@ziepe.ca>
 <CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
 <ZKyZBbKEpmkFkpWV@ziepe.ca>
 <CAHS8izOTiSO5PkM+x-CASjwew=U2j=JRNpbz_6NC6AsDTQ17Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS8izOTiSO5PkM+x-CASjwew=U2j=JRNpbz_6NC6AsDTQ17Ug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_061130_041343_E5452F7D 
X-CRM114-Status: GOOD (  11.48  )
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

On Mon, Jul 10, 2023 at 05:45:05PM -0700, Mina Almasry wrote:

> > At least from my position I want to see MEMORY_DEVICE_PCI_P2PDMA used
> > to represent P2P memory.
> 
> Would using p2pdma API instead of dmabuf be an acceptable direction?

"p2pdma API" is really just using MEMORY_DEVICE_PCI_P2PDMA and
teaching the pagepool how to work with ZONE_DEVICE pages.

I suspect this will clash badly with Matthew's work here:

https://lore.kernel.org/all/20230111042214.907030-1-willy@infradead.org/

As from a mm side we haven't ever considered that ZONE_DEVICE and
"netmem" can be composed together. The entire point of netmem like
stuff is that the allocator hands over the majority of struct page to
the allocatee, and ZONE_DEVICE can't work like that. 

However, assuming that can be solved in some agreeable way then it
would be OK to go down this path.

But, I feel like this is just overall too hard a direction from the mm
perspective.

I don't know anything about page pool, but the main sticking point is
its reliance on struct page. If it can find another way to locate its
meta data (eg an xarray), at least for some cases, it would make
things alot easier.

Jason


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE6DEB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 12:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDj/nUPhv/hb6kVZTAGV+ec/xse6Mtcau18exq4wFfg=; b=N7W3NzbUJI6TTQTOIgsbzeTxOZ
	HkJmTBCXHtKJq/20D3ZIxs9xtbAmgj8jbuE0wRthUchu9m2qKJXeYK9ZiuY+tJWP3dhHvnKSeu3e7
	SNiWGDm64avLDxP5TSW37uQ+8bYrTYnkjieLs5pFXN8EgKPwa9n306Xajohw8xBGQLP4IH9Xg0Ngb
	3hAqN0Jg+Zbn5LX7+WMX+ONepPjBg18riH7p5hTw0/QaTNc4kjtgVWTqPX69Gx8wSw7t23AbSSvdr
	KeHg/+Iu0Pk6PuZWDSiJgDR3tlGaRvXgXPYhLCT669ZxKdcnecGuHtwORhzTTJkPdE5FWqlAswA4q
	YJ+rSCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJC7J-00EpCy-1M;
	Tue, 11 Jul 2023 12:05:17 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJC7G-00EpB2-1W
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jul 2023 12:05:15 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-634ddd17647so38408596d6.2
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jul 2023 05:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689077104; x=1691669104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sDj/nUPhv/hb6kVZTAGV+ec/xse6Mtcau18exq4wFfg=;
        b=mJnWqKwDMLasfvZIgnnLjeZubYFEXhgQUriyniboKusYls6+C/mL95Tb4P3ahgb2ly
         UfehINYtKiyzWMJO7IBeL7aNkUVN35SC7VJSVhsw9KFV+q6daoC6BFGPiFkn9FxJajzq
         DGaYAQI13Yu06T7GpFqdzzv2PTbbTGLptVEHwLsBhHqorONeJqwlaEcsfs34Zcq3U9NW
         XheotZD5oo/pIyPuubqGr9ReOeVNnM5310WYJjx2KhOphWoCWgsJm7SEkfyGIZEM39en
         /F4Qgy6k5T17Cq8QWsHYSMwY4649dC6Iii0F1d1VtBiEHgup1B7AOz6IJUhmKOxeJZFa
         AZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077104; x=1691669104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDj/nUPhv/hb6kVZTAGV+ec/xse6Mtcau18exq4wFfg=;
        b=Ke7MAism2RWf8FDeSLtPkB6IkaY6dr3yBdxQS5Ty7Xnnz/JVL4i0xOZVTzYtQ5E+hP
         Blc3NPcCEXqmShzDcgQtPkC1mszzD4+CPwLpcYS/ugd5IpbnIKLkytg5t8dp7EOxmkXC
         IYqZaJ5rUftNwdJWwDuGsxORdmb0qsj60q28I55fgYDE6gw7SRZA26CzH+cMUCOG7e4Z
         k/8/iMLh8LLJP0N6Er3kExJSs1rujvVMJ850gDBhi67bFvFkfT8z48xC3VU9lWDX8QaC
         SYQp4Q+OZfTkukVugODbIoNk8KlOynsyI/P14YjNCvmTZOkut5D71PTQgvRdzSTUULsK
         0zvg==
X-Gm-Message-State: ABy/qLY3RgECupHrFNs5gyOFnb5/0S/tQhWbER7x97R8/Wmls3oBo0gN
	qgjimXLm6+weOL/xf92UtdlNwQ==
X-Google-Smtp-Source: APBJJlHlMSiZUq+WY356by/kwiQKIEq734XHbryNHy9OPRb10YQGqsssS7qFeOD/eSjn/EPBX8tRnQ==
X-Received: by 2002:a0c:a98d:0:b0:635:e209:178c with SMTP id a13-20020a0ca98d000000b00635e209178cmr12615604qvb.10.1689077104237;
        Tue, 11 Jul 2023 05:05:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id q17-20020a0ce211000000b006362d4eeb6esm956869qvl.144.2023.07.11.05.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:05:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qJC74-0008zp-Q7;
	Tue, 11 Jul 2023 09:05:02 -0300
Date: Tue, 11 Jul 2023 09:05:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Cc: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>,
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
Message-ID: <ZK1FbjG+VP/zxfO1@ziepe.ca>
References: <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org>
 <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
 <ZKNA9Pkg2vMJjHds@ziepe.ca>
 <CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com>
 <ZKxDZfVAbVHgNgIM@ziepe.ca>
 <CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
 <ZKyZBbKEpmkFkpWV@ziepe.ca>
 <20230711042708.GA18658@lst.de>
 <20230710215906.49514550@kernel.org>
 <20230711050445.GA19323@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711050445.GA19323@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_050514_514718_964F39F4 
X-CRM114-Status: GOOD (  13.67  )
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

On Tue, Jul 11, 2023 at 07:04:45AM +0200, Christoph Hellwig wrote:
> On Mon, Jul 10, 2023 at 09:59:06PM -0700, Jakub Kicinski wrote:
> > On Tue, 11 Jul 2023 06:27:08 +0200 Christoph Hellwig wrote:
> > > Not going to comment on the rest of this as it seems bat shit crazy
> > > hacks for out of tree junk.  Why is anyone even wasting time on this?
> > 
> > Noob question - how does RDMA integrate with the out of tree junk?
> > AFAIU it's possible to run the "in-tree" RDMA stack and get "GPU
> > direct".
> 
> I don't care and it has absolutel no business being discussed here.
> 
> FYI at leat iWarp is a totally open standard.

So is Infiniband, Jakub has a unique definition of "proprietary".

RDMA works with the AMD and Intel intree drivers using DMABUF without
requiring struct pages using the DRM hacky scatterlist approach.

Jason


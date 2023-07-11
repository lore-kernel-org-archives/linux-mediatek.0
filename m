Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4937EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uu6KIyFq5ICxck51tOZTlrhfx/dAZN9zejRdcXCeDIQ=; b=szSY1ejr7CpGVTEDnZcdBQAqO1
	/po7Tn4bBZFtzrxO1bTqfEXYIB/sv3JZ86C+yap79wruBf6xaNmAoYoo5DAs2tIAx8dS4gNmwhsVb
	tHGE/Gu0yGm/1N3lAW6I5WXf5b2alSlYdvw9BzPBR+jzmYRzRvJAV7e4HXZwV+aYPPfgbisMzU1n7
	Kr2lS+CQ2MVHTGIy0ly1xGof1qkKoFFnILsyeh/U32k4ddHWATskA72AnU5pdXHXdNoJ/rIZ6qwx0
	zTBTcWg4JjIeIAYyQoDmiqbM+odAwjDDZCCN9yGuyjuLDoc4GXQQ7mmBowbqZSyzFoKrRDV+4M3S5
	NBmUr2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGS2-00FQTg-2D;
	Tue, 11 Jul 2023 16:42:58 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGRz-00FQSY-2e
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jul 2023 16:42:57 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-765942d497fso553580585a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jul 2023 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689093769; x=1691685769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uu6KIyFq5ICxck51tOZTlrhfx/dAZN9zejRdcXCeDIQ=;
        b=hutFTkWd80/JWvtlN74IkzBT25OF7LVT1vr1QbOtoLia7gCMDN/IthFasmJc6qiQay
         3tVmOsZw93jMQD1ismCSE3/TO08LFEoKmWO4bSv0VW+Fcc+nXAGs1l4AEEucg2NIWTfz
         qtsg3PHnJJ+65RVJUeDP0+OnLtSMLDGe8uG31BIeuyVQUZmFXwqtQpoxmzPe0CWl2vF+
         PVSnB774tyoY7PSisg55xASa4YKGevTLCboavkgbiFWYJv3oSZ8GGZIln/OlViAGZJQ0
         1osG2kQZAkLmJs3+qeezOegAZ4lq6SI4eQiiwkKS9Ht/DJCtY3YykcRdmrRaLS2HudM/
         80kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689093769; x=1691685769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu6KIyFq5ICxck51tOZTlrhfx/dAZN9zejRdcXCeDIQ=;
        b=dCwGZewiW6lL9M2lV0Asb3LSsbCR6a/t8Mbmn/iQfM6rX74EtBcwaoGhfODlBK79jp
         pKtOT9V94LvKUbqc0OBidT1RBca6UrGaZeJd/mGRklqcIzpp3AU9uEjJj6VLPtTxnQK8
         Rgpod/IxkS+R1Nj8P54DeqimHftbjVb2Fpgo8QLzfwSiDVZZtDK3ZdFrcSP46xs/mk52
         kFkhPmgQnGHUjQ0SVFIh9DhQWpChUg9mrRFYMXItujmFSGnIlesJz1C1LXm0ZW4pvkhH
         kW+hHE3fbpWwMSzafByuDmr2yL6tfSukQkvYQPVrzmvgLe4E8TTZl9GMJDVHyqQ0kIgK
         Fd0g==
X-Gm-Message-State: ABy/qLYBKODmepukZg4MmfYnA+8FECdw0YlDEHy3/7p/wSpnHkeDY2/e
	XrvyAxhXGW1PMdvdbjCA+04xBA==
X-Google-Smtp-Source: APBJJlHrfEpx0F5ZCb1qXKIKZ/LjogbATKeqxd6U5nNdJ3jhzMUvs4D3C+kS3MbzveBt3oiLYSo3MA==
X-Received: by 2002:a37:f70f:0:b0:767:5689:bc7a with SMTP id q15-20020a37f70f000000b007675689bc7amr15355662qkj.25.1689093769195;
        Tue, 11 Jul 2023 09:42:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id k2-20020a05620a138200b00767d6427339sm1165653qki.69.2023.07.11.09.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 09:42:48 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qJGRr-000IQx-QI;
	Tue, 11 Jul 2023 13:42:47 -0300
Date: Tue, 11 Jul 2023 13:42:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Mina Almasry <almasrymina@google.com>,
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
Message-ID: <ZK2Gh2qGxlpZexCM@ziepe.ca>
References: <ZKNA9Pkg2vMJjHds@ziepe.ca>
 <CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com>
 <ZKxDZfVAbVHgNgIM@ziepe.ca>
 <CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
 <ZKyZBbKEpmkFkpWV@ziepe.ca>
 <20230711042708.GA18658@lst.de>
 <20230710215906.49514550@kernel.org>
 <20230711050445.GA19323@lst.de>
 <ZK1FbjG+VP/zxfO1@ziepe.ca>
 <20230711090047.37d7fe06@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711090047.37d7fe06@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_094255_959034_5E00BDBA 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jul 11, 2023 at 09:00:47AM -0700, Jakub Kicinski wrote:

> > So is Infiniband, Jakub has a unique definition of "proprietary".
> 
> For IB AFAIU there's only one practically usable vendor, such an
> impressive ecosystem!!

IB has roce (RDMA Over Converged Ethernet, better thought of as IB
over Ethernet) under it's standization umbrella and every major
commodity NIC vendor (mellanox, broadcom, intel) now implements
roce. We also have the roce support in the switch from all major
switch vendors.

IB as a link layer "failed" with most implementors leaving the
ecosystem broadly because Ethernet link layer always wins in
networking - this is more of an economic outcome than a
standardization outcome in my mind.

Due to roce, IB as a transport and software protocol has a solid
multi-vendor ecosystem.

Jason


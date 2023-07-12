Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD744EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 23:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w48DGD9rzIYkzJBQTh6OIxxXx9CGgucCjaW9OKrfELw=; b=uIxY4UAOwHs1A4D+5WwffLmetc
	PduA3Nv4Bdwr45rOVaJfMYHlDMg5Xv/rYuc7RWN9L6BfR/rXnDVGnAXFVgwECOUMlnYfhQ8Urortm
	UjP6p6FUaMprLi+PmKI+1oB9Y2tMLahlWkM0VDlKfTm4jFZD9dgByKzVr2V60Dlkjd4EOXLntwbMS
	O+9dDUpIeg9kwHfQk2hsaRemJgYRsB34GPZ6PTfe3kk62gMT5QrQCp518dee90h9i3G7/SYDbloEp
	fpJWMi0sLSmm9Mx+yr7yXRoVij/E26OGuo6Y/KT/u6AqMrHfp2eO+5RGF84igRhcgJSgrNSGuFjak
	B01U5FzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJjiK-001X49-0l;
	Wed, 12 Jul 2023 23:57:44 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJjiG-001X2E-2j
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 23:57:42 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6b8b6f7399aso75138a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 16:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689206258; x=1691798258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w48DGD9rzIYkzJBQTh6OIxxXx9CGgucCjaW9OKrfELw=;
        b=dZNheAfiCySsh2SaF2XcW+MMtkBXzAtYE1bKH9YhwIV5aznEQU+CjZeCa77zb9yIk6
         qG+SrhnIMvWxK7E7LJBxvt7kKYojgedSKLDV175irtZzmYSzdjxrNR/orOxNwsksjvXf
         GDMRbGW9fLNbDSM+t3gp6eKGlvp16V9gJTJZ6uT9KJBkGxPNxs9avkoNwrmJ6V9aLc6T
         WfD5p0qtqYKkvHFwuvXwBDY0D/CSjiNJn7J8dSA2CKs095u3oYzL0q4Cvz5tIaiRrOT3
         gRxMAUo38ckigMsyz9+7UyLvXeSyTkAho0dZS5xKm5199rXgmqJgmB2X2XuqQVPPGFxq
         1MDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689206258; x=1691798258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w48DGD9rzIYkzJBQTh6OIxxXx9CGgucCjaW9OKrfELw=;
        b=d/I15I3pNDSReu/vF9UMusPPiaA5r4/Cn9JvESRIJUWa3rAJuMotfTAQO7rlpUElZ+
         ItcXd6BSkIw1nkIuMRWvo1Y0iEPb2mx077H/cT+TBye+LhXC5wNDZ0KsIGc8sA7xgNw1
         SRCWBhsFTFc6JspXPgHUhLSTanl3TvlxhHVLJgVRhp5TjGzHF3djaYL6OIbcqSyLKEF5
         lJk4J8SX/fXe6U0f05nOBYWLkZnicK66LBUenO+FdNHUXKsXDIq/rXGaJa+E/wdDxXTW
         +Okzl2YIgD6+iH3EBw976+qCpOWRV0Flfc7s06XkslPPtaLtdvaRMUDZTiPeM02iWXE4
         C9tA==
X-Gm-Message-State: ABy/qLZeGnisAVmaSmTEc0Xxaf79Ic6NlTQNlWphTKw9mSHbWPUYxrMk
	dIpTk2Tm8QYyGG6yEcpnKcnTyw==
X-Google-Smtp-Source: APBJJlHj3zv5+y0d8YqMlYnepQ1WLcvsZHbqObTNCneoz62gOcAbi9uLTi3aOdJ7p2PueOx0bKfwWQ==
X-Received: by 2002:a05:6870:7309:b0:1b3:c39a:7c34 with SMTP id q9-20020a056870730900b001b3c39a7c34mr397690oal.25.1689206258019;
        Wed, 12 Jul 2023 16:57:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id i14-20020a17090acf8e00b0026596b8f33asm8834060pju.40.2023.07.12.16.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 16:57:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qJjiB-000gjk-N4;
	Wed, 12 Jul 2023 20:57:35 -0300
Date: Wed, 12 Jul 2023 20:57:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mina Almasry <almasrymina@google.com>
Cc: David Ahern <dsahern@kernel.org>,
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
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	logang@deltatee.com, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
Message-ID: <ZK8978wUKKP3/zIW@ziepe.ca>
References: <ZK1FbjG+VP/zxfO1@ziepe.ca>
 <20230711090047.37d7fe06@kernel.org>
 <04187826-8dad-d17b-2469-2837bafd3cd5@kernel.org>
 <20230711093224.1bf30ed5@kernel.org>
 <CAHS8izNHkLF0OowU=p=mSNZss700HKAzv1Oxqu2bvvfX_HxttA@mail.gmail.com>
 <20230711133915.03482fdc@kernel.org>
 <2263ae79-690e-8a4d-fca2-31aacc5c9bc6@kernel.org>
 <CAHS8izP=k8CqUZk7bGUx4ctm4m2kRC2MyEJv+N4+b0cHVkTQmA@mail.gmail.com>
 <ZK6kOBl4EgyYPtaD@ziepe.ca>
 <CAHS8izNuda2DXKTFAov64F7J2_BbMPaqJg1NuMpWpqGA20+S_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS8izNuda2DXKTFAov64F7J2_BbMPaqJg1NuMpWpqGA20+S_Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_165741_131053_A8A4E0A1 
X-CRM114-Status: GOOD (  11.09  )
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

On Wed, Jul 12, 2023 at 01:16:00PM -0700, Mina Almasry wrote:

> The proposal was that the uapi in step #1 allocates a region of GPU
> memory, and sets up a p2pdma provider for this region of memory.

Honestly that feels too hacky, which is why I've said a few times
you'd actually need to integrate p2p pages into a DRM driver properly.

> 2. The p2pdma semantics seem to be global to the pci device. I.e., 1
> GPU can export 1 p2pdma resource at a time (the way I'm reading the
> API).

All of this is just a reflection that you are trying to use it in a
wrong hacky way. The driver is supposed to create a p2p registration
for its entire BAR at startup. Not on demand and not in fragments.

Jason


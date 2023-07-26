Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6F9C001DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 15:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZDS2yGWmuXp/9xMrpvpGI0E4iguSo35McrSwA+nEMI=; b=t2S0Wefrx8Y4dSOLi9xGoD3rqY
	oZ0yNeGBCQlnnoLoP4xjccAj5Jzcgfns6KX7M1aVSETg205mFGm3Ufojigns5KSbOFnN6V9lZCjSO
	BxvUhZCFP7Z4ykA2Zmf3A/hkNfS+RTbo4dUgLCVbfSN10Lauo/pGk2kRDzW13Tw5YEUl7vfVmfqA0
	nTxzA7Nh/J/ZVZpqUOqxPtFPsdjUeeR3SL+GpIAj554vFFq2FLJ2bOMEPd+fZvHZRKUFM/9lbNYcL
	ZAZImTMLc8R4nsp1woNyeZ9/EJ/9oG+GiT8nSbtkdtOlqtQfEttTJIC4dgQu+El1CxduWHjJqTzQh
	m+gdE/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOgmu-00Atqi-2z;
	Wed, 26 Jul 2023 15:50:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOgmq-00AtpM-2s;
	Wed, 26 Jul 2023 15:50:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 50ECF61A2A;
	Wed, 26 Jul 2023 15:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D9AC433C8;
	Wed, 26 Jul 2023 15:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690386651;
	bh=FBVPvVza7HG5I1VIoHJB6h+yX1R7w7DkdilDfqNT6DU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=maYVcK7N/Vm7jnhc68l/McAk7CYwSeld6XBM85yy8GktdXapsIj0lVxwy91fEnsNM
	 qUHskpQW3xDpoahJa5Ia4h6ay96WSBm/MpB2E3Lwna0++qtXTylHp0/Fk7/om4dIXZ
	 5cDAEF+kcyCYwPw4Czm4VyAnVtOOkJ/lcJLYZhEEevuujEBllPDWuf8uuXmjareC3H
	 b7tO2FiRCA4uc9GitfhSc1qbPSIV0rNdyc2IfN9/vZauIQJctXvxD4/KI2jL1TRKcb
	 P+TuLrNc3bw6tMDq/GipoSv4zIAoTXgbZIHE4bsLnWqj70kdEX5PbT+ULYI9M4II26
	 P0CQC5tiJcQsA==
Date: Wed, 26 Jul 2023 08:50:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: Yunsheng Lin <linyunsheng@huawei.com>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, davem@davemloft.net, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet
 <edumazet@google.com>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
 <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team
 <linux-imx@nxp.com>, Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya
 <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad
 <hkelam@marvell.com>, Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne
 Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Kalle
 Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>, linux-rdma@vger.kernel.org,
 bpf@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2] page_pool: split types and declarations
 from page_pool.h
Message-ID: <20230726085049.36b527a4@kernel.org>
In-Reply-To: <CAKgT0UfL4ri-o7WifeewpezGQY1UQKwcBEUSSY80DyKoE8g-0w@mail.gmail.com>
References: <20230725131258.31306-1-linyunsheng@huawei.com>
	<94272ffed7636c4c92fcc73ccfc15236dd8e47dc.camel@gmail.com>
	<16b4ab57-dfb0-2c1d-9be1-57da30dff3c3@intel.com>
	<22af47fe-1347-3e32-70bf-745d833e88b9@huawei.com>
	<CAKgT0UcU4RJj0SMQiVM8oZu86ZzK+5NjzZ2ELg_yWZyWGr04PA@mail.gmail.com>
	<CAKgT0UfL4ri-o7WifeewpezGQY1UQKwcBEUSSY80DyKoE8g-0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_085053_039001_C3B7B88C 
X-CRM114-Status: GOOD (  20.56  )
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

On Wed, 26 Jul 2023 08:39:43 -0700 Alexander Duyck wrote:
> > > I suppose the above suggestion is about splitting or naming by
> > > the user as the discussed in the below thread?
> > > https://lore.kernel.org/all/20230721182942.0ca57663@kernel.org/  
> >
> > Actually my suggestion is more about defining boundaries for what is
> > meant to be used by drivers and what isn't. The stuff you could keep
> > in net/core/page_pool.h would only be usable by the files in net/core/
> > whereas the stuff you are keeping in the include/net/ folder is usable
> > by drivers. It is meant to prevent things like what you were
> > complaining about with the Mellanox drivers making use of interfaces
> > you didn't intend them to use.

FWIW moving stuff which is only supposed to be used by core (xdp, skb,
etc.) to net/core/page_pool.h is a good idea, too. 
Seems a bit independent from splitting the main header, tho.

> > So for example you could pull out functions like
> > page_pool_return_skb_page, page_pool_use_xdp_mem,
> > page_pool_update_nid, and the like and look at relocating them into
> > the net/core/ folder and thereby prevent abuse of those functions by
> > drivers.  
> 
> Okay, maybe not page_pool_update_nid. It looks like that is already in
> use in the form of page_pool_nid_changed by drivers..



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6D5CDB482
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 15:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkNvGnhXvMWWc1ZnNdMpozdtCOxCI8mUWrJf+BPr83s=; b=PCChfhUIvQ7LmlXPaxFDxWTJyh
	8UoGNGF9DB0O9X7NJbrXOlW8r/M/VuQzX48E0PnggHCBHVHFEmwzJ+yWa1QlU5jRNz0CZxqKP6YOj
	tpE0xtbawc4410DGdlu0u8eRz+lQ3m3SpPCG4HLl/pU6dMzMwoTDLWGY2XQ7bRbPN/WZ3NTse8hrO
	690c1//t5dBXtnxxyBmyBOBDzXPMX8FlfxNkEZ41HOSL8Bf0TFT23PGWwn2wzG381nJL2pd3iu+aY
	NbQxSgsrxYpJunl76RHX4YCSCgh/kbV0/pJZ6mSHUcrhiXkYuRbe8WGhthcgjB2DNoQQdc3ed5iKc
	lZ5CqEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8Zw-00F3yO-02;
	Wed, 18 Oct 2023 15:35:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8Zs-00F3wg-2s;
	Wed, 18 Oct 2023 15:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EC6BAB823E3;
	Wed, 18 Oct 2023 15:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DD1C433CB;
	Wed, 18 Oct 2023 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697643318;
	bh=G5i8rgjTCdOtkBia7NJ0E9GJAWq1PZebZiERkTNe52E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dX0U2cBoWRWmcHydY9D9KSYvZpUnGeb2cpV+ocZB3ONcBjC3T4ZKs49Ew9dA+8BoC
	 Y0JPEkDF4yajF2eBhJ2V0Xt0Ymf5AVbFjbu7VEgW+wXLXOuC5GFq583ukUYgH3JqbC
	 cA2L5DP6sa+LLunVH0l3Zpyj01qBLs5QkH2MhH3ArZ0m9ZXiLJh9qrgFwVWTIO3q37
	 jhOkDnSFGhKwCNxgk+tm9i9uYhM+dyQgI63KXCo9F+zea3MBS38B69SG+xmcY2yo42
	 C5seO0cGRTia54M0QNvEF5igJu2sECklqwkMi50rOnnVSffkQlmb2ftQ/g7t3wenX7
	 hSUx4dsqOuHiw==
Date: Wed, 18 Oct 2023 08:35:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: <davem@davemloft.net>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Alexander Duyck
 <alexander.duyck@gmail.com>
Subject: Re: [PATCH net-next v11 0/6] introduce page_pool_alloc() related
 API
Message-ID: <20231018083516.60f64c1a@kernel.org>
In-Reply-To: <67f2af29-59b8-a9e2-1c31-c9a625e4c4b3@huawei.com>
References: <20231013064827.61135-1-linyunsheng@huawei.com>
	<20231016182725.6aa5544f@kernel.org>
	<2059ea42-f5cb-1366-804e-7036fb40cdaa@huawei.com>
	<20231017081303.769e4fbe@kernel.org>
	<67f2af29-59b8-a9e2-1c31-c9a625e4c4b3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_083521_100353_B40D4D7C 
X-CRM114-Status: GOOD (  19.75  )
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

On Wed, 18 Oct 2023 19:47:16 +0800 Yunsheng Lin wrote:
> > mention it in the documentation. Plus the kdoc of the function should
> > say that this is just a thin wrapper around other page pool APIs, and
> > it's safe to mix it with other page pool APIs?  
> 
> I am not sure I understand what do 'safe' and 'mix' mean here.
> 
> For 'safe' part, I suppose you mean if there is a va accociated with
> a 'struct page' without calling some API like kmap()? For that, I suppose
> it is safe when the driver is calling page_pool API without the
> __GFP_HIGHMEM flag. Maybe we should mention that in the kdoc and give a
> warning if page_pool_*alloc_va() is called with the __GFP_HIGHMEM flag?

Sounds good. Warning wrapped in #if CONFIG_DEBUG_NET perhaps?

> For the 'mix', I suppose you mean the below:
> 1. Allocate a page with the page_pool_*alloc_va() API and free a page with
>    page_pool_free() API.
> 2. Allocate a page with the page_pool_*alloc() API and free a page with
>    page_pool_free_va() API.
> 
> For 1, it seems it is ok as some virt_to_head_page() and page_address() call
> between va and 'struct page' does not seem to change anything if we have
> enforce page_pool_*alloc_va() to be called without the __GFP_HIGHMEM flag.
> 
> For 2, If the va is returned from page_address() which the allocation API is
> called without __GFP_HIGHMEM flag. If not, the va is from kmap*()? which means
> we may be calling page_pool_free_va() before kunmap*()? Is that possible?

Right, if someone passes kmap()'ed address they are trying quite hard
to break their own driver. Technically possible but I wouldn't worry.

I just mean that in the common case of non-HIGHMEM page, calling
page_pool_free_va() with the address returned by page_address() 
is perfectly legal.


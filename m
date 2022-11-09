Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DCCC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 19:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQfrGf0TkswjXbAouqlpnUWIy9VgiBcukwnGHhn7JpU=; b=XPI04bvMOJ9bWq787pSD9GcT84
	57hBX41S8xE4fUSe/QfOo+oq03RrXk9PvkgenHpOFqtDAaiPrfmBsaI4v7TzNOyCS2jIJF14qdNiA
	0+9q4NNYfSjpcjt8ncsIw2aKO9HSDMr/wxll9xlrgxfWG11aagSu0Tv8n3JvemLXZxvlW4XfdKnYE
	DPsvKw70TDpFaOjC7mcMu02PVmm/kWYtKISaqo+HQRGbdLb4HC+n2GPQcaQimqCnAoAQp0EHOJ+zB
	7/IDBQoytZPkbNroeobW5XOyijVDhFbtg3B47vFwAPcqF/x+b8bT2IjHXe20Vts8Ne6oZmeWTWArv
	M0kY8DCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqOU-00GS3B-NE; Wed, 09 Nov 2022 19:05:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqOO-00GS0Q-4n
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 19:05:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D4465B80E38;
	Wed,  9 Nov 2022 19:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3B2C433D6;
	Wed,  9 Nov 2022 19:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668020740;
	bh=lQfrGf0TkswjXbAouqlpnUWIy9VgiBcukwnGHhn7JpU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lpxBtp3zvmBYqfi22BFPCfAt2bUiFwC6prDsyQ2ROGmEQMBYatsPXtcWXjHWqBE4O
	 Q7M1sJ7fbpRnovPPU2bK0g35j1XidJK8Ph6YtcLaNB2aH62xfainrAwQ4YuPvBByJe
	 8BuVkLGYO4KrTIzgJFSgOrsNAmH6qepDsOV1kLloBzTvHrgBufz8iOiKyFDiU3sY6D
	 RciWY9+vWdlNkr1zXn48MQ4OTzbvUKeYXb9iv01B0ToM1x+4zsXlTpbLVHz0VDtfpl
	 R0qyI10tqLIZyGTAe+JT0sIwEJ6nTWcJjy3ZWQOTnvQfGaHl55Y7U+5CmcgVmxJS1u
	 f885YNiZnANFQ==
Date: Wed, 9 Nov 2022 11:05:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, Bo.Jiao@mediatek.com,
 sujuan.chen@mediatek.com, ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, daniel@makrotopia.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com,
 kvalo@kernel.org
Subject: Re: [PATCH v4 net-next 0/8] introduce WED RX support to MT7986 SoC
Message-ID: <20221109110538.431355ba@kernel.org>
In-Reply-To: <Y2vBTBUw47sshA+E@localhost.localdomain>
References: <cover.1667687249.git.lorenzo@kernel.org>
	<Y2vBTBUw47sshA+E@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_110544_363157_E71ABAFB 
X-CRM114-Status: GOOD (  11.62  )
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

On Wed, 9 Nov 2022 16:03:40 +0100 Lorenzo Bianconi wrote:
> I noticed today the series state is 'Awaiting Upstream'. I am wondering if
> this series is expected to go through a different tree, e.g. wireless one
> (adding Kalle in cc). In this particular case the series changes only
> the mtk ethernet driver and mt76 is built since we modify a common include (but
> there are no changes in mt76). My personal opinion is this series is suited to
> go through net-next tree but I would be fine even if it goes through Kalle's
> one. Any opinions?

Works either way, we'll see what Kalle says.
Let me bring it back to Under review in the meantime.

While I have you - no acks for the bindings yet? On previous versions?


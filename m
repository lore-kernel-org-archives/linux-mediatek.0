Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608E5C4708C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 02:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2sp9KuW0GDGhnDzEMuM8Sbx+VC5x6bwLGGtCYWFg1Y=; b=2MTIOe8LrJ/e+zC/qYZUEISXMh
	qZVir2heIIv/9eZc+nPiOivZw3HLIFKD6ozzDdbXV/5usbaoOyLvqWdKeUlJf80LQ5tzMrjA+KITy
	txvYKa3YzIcIF2HQ1LSK+YvrxL5QHlsm+mOxxu3ZACT3QJ0oufqw0qjnSCA/sDxSg0UTTf8ph89P8
	Ssrgnahu4bqDr1MtndDH7lDAbR0bDQSx4Q5TehX3LJOhbTfIyhS2YzGcOx9ooWljDGXVUmNi8NqWz
	B7MqUUaL+5yO6ss/TuO9IHVJEL7Sz5U+Lb7b1elSTPyfpHomHh3B+M3MhftgOSi9ts1FCBZKYbArW
	K2qk9VUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2NZD-00FQi3-L7; Tue, 06 Dec 2022 02:20:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2NZA-00FQfi-SL
	for linux-mediatek@lists.infradead.org; Tue, 06 Dec 2022 02:20:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 63A0D61508;
	Tue,  6 Dec 2022 02:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDEDEC433D7;
	Tue,  6 Dec 2022 02:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670293215;
	bh=3xngoC5twmoImoskHL693S6+xKVwrmGdOHi6sk1lcwE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sRLJEJ09nYclz3ALakOAg93398eWnt+O90hc1eeG/M1UjQHmZcc1V9StmcSrVbUbH
	 82rzhzf6PUoy/RuCNH/tOy1SPxRlNcTKrjWrCHyIdn55e47V/ezjFxy+6pXUcMsYJ5
	 gcFgHobATfR3BDB0J00IY5hggu9FuHYPqzLoh1deyx+3RQdMNnd7uuD/dfoBINVzmq
	 w9kOIIe/F1VGkSymPPlh9Req9SzWv48bT/YW+fY5YRn32geEKznFUSKY5RCMF/ogbq
	 iFNsMagaVmWVUbLQQMxKKbfm5gzk6CQt2qyP1F76yZK9w7QCLEwiFf5NF1SuOnvS6A
	 qDzfU45yMxZQg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1A60C395EA;
	Tue,  6 Dec 2022 02:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: mtk_eth_soc: enable flow offload support fot
 MT7986 SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167029321565.12541.13204122359496761946.git-patchwork-notify@kernel.org>
Date: Tue, 06 Dec 2022 02:20:15 +0000
References: <fdcaacd827938e6a8c4aa1ac2c13e46d2c08c821.1670072898.git.lorenzo@kernel.org>
In-Reply-To: <fdcaacd827938e6a8c4aa1ac2c13e46d2c08c821.1670072898.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 sujuan.chen@mediatek.com, lorenzo.bianconi@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_182016_970036_BB5DED12 
X-CRM114-Status: UNSURE (   9.60  )
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

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  3 Dec 2022 14:20:37 +0100 you wrote:
> Since Wireless Ethernet Dispatcher is now available for mt7986 in mt76,
> enable hw flow support for MT7986 SoC.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [net-next] net: mtk_eth_soc: enable flow offload support fot MT7986 SoC
    https://git.kernel.org/netdev/net-next/c/c9f8d73645b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AFCEE49AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 18:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4ueY7PMkYKJ3gqAhbrVPTfATkhutnrn6+EBdUCHDks=; b=nWEuqASYfILOR57QozdVgAd0rM
	mDPcKLnTmJqMGjaYqrWxgWe1NH8/CLvenDtfJcbO1KiFmNWLzCIc1vjVaFQaQen8jrQm8wwCh18E1
	Jsk/HkkjJxbUpr3lbv2lpFhMVJ4A2SyR9yc7lhvz9lktPvhZcrkjTUaRut2LPvzfRb8bnsN5ARE7j
	UgugzIraFfllFj2PHUWEfgJN+5ammZagyTRMGqioIabmr6GYfOSH56btULOkaw/n4ujUtEV8jptPK
	vuSlwo3aIBURIRousxXwgFA7yUn5qvtFilunnSHvyrv+PmoLVjSxAkwwrn+JBlNJ2Ug1d12PXTOvn
	h27engWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYVpn-00Gd1g-06;
	Tue, 22 Aug 2023 18:10:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYVpk-00Gd10-0U;
	Tue, 22 Aug 2023 18:10:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 671FF614F5;
	Tue, 22 Aug 2023 18:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C06C6C433C9;
	Tue, 22 Aug 2023 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692727826;
	bh=U+cSFv8/1fknASccAAc5oGRY0vemVLI+IykDasqvQiU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eBSLngf2UJwYSxajRyiPc43wZS0Upcrex2n3c3ruWYzoh7E+npKodwtj7yMmJVCTC
	 o5lIFbTSDMrb/k9NrSRJDObGF9p+Um/e90sa9K76NDPQLveIcLZ562tkMtD6YSc6hn
	 csPGyqNlz0kw0ONgLFaI/PBiKG7+GlLkYxv5Y1uA1lzvlXJ8kYiWpGjq7+BY8dyhOE
	 RznQbRlLJejUqWvRkATfirnLFqLnbutZifEOVjngz6Gx3Yl/0rZ0eThCwpQ1S4qvDP
	 Nn3sxrrEnfM9VaEhUkenX0KzDfr7DW6AxQesGE6T465oKcLLUpHvbNmS/ER440JxsM
	 +Cgh8+EAR5vlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A0A24E4EAF6;
	Tue, 22 Aug 2023 18:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: fix NULL pointer on hw
 reset
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169272782665.18530.10943324313439520312.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 18:10:26 +0000
References: <5465c1609b464cc7407ae1530c40821dcdf9d3e6.1692634266.git.daniel@makrotopia.org>
In-Reply-To: <5465c1609b464cc7407ae1530c40821dcdf9d3e6.1692634266.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sujuan.chen@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_111028_234918_DE8685F8 
X-CRM114-Status: GOOD (  11.45  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 21 Aug 2023 17:12:44 +0100 you wrote:
> When a hardware reset is triggered on devices not initializing WED the
> calls to mtk_wed_fe_reset and mtk_wed_fe_reset_complete dereference a
> pointer on uninitialized stack memory.
> Break out of both functions in case a hw_list entry is 0.
> 
> Fixes: 08a764a7c51b ("net: ethernet: mtk_wed: add reset/reset_complete callbacks")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Simon Horman <horms@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ethernet: mtk_eth_soc: fix NULL pointer on hw reset
    https://git.kernel.org/netdev/net/c/604204fcb321

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




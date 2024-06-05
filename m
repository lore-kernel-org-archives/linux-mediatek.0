Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20284C25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeJkXWSQREqrNkwIoIJm9Rxx5SWj77ejDqgIavCpbl0=; b=Y/Tze911tUH9x6NTv5LhF3vVId
	kNoWISL1r/z2OTbDz4ugdwMxtQaoCyJsjnt/Gjyu/6uR42gG2jvkIhF0rR56jXo9oxaYqG63eumlU
	tRbk1dazhty/YWZRgaEC0tH+umkE9+550a7D/nOOEU5zTjzGc2HqqSdjOKB3WVqx+S35HdoykC/OI
	mgAxuWDXbBuaBdWhDBnim8Ldq5uam6RY73+1x0Ba0FEx+QH8N7Pd44xxT3iHCzn8TkHX/X+Bmb4Mn
	2PsjHikVxdPKkHdED6rP0K97cXmsoC3Yf/CQHK/mpCq5ALVkyOGVkT9ZouCU1A7EEHS96Y20LDTij
	ocogKSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEqPY-00000006AVr-0jft;
	Wed, 05 Jun 2024 13:10:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEqPR-00000006ATk-2PIh;
	Wed, 05 Jun 2024 13:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B9BA961972;
	Wed,  5 Jun 2024 13:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 844D4C32782;
	Wed,  5 Jun 2024 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717593031;
	bh=u3bAQnWwZ28p/kNsVqk2e4u6Iq8eIG5zznvzDkYoUog=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=k/OmKoe09Hnm9ndfZnuOCZUr5Of+DpVHDTCZ2aB1AuRqQycgkANEzX5Mhejcjt6or
	 eF/GEgPsSTorLYM5jtvxNLaNoSgld5P0WGOgqBNOAjhFWjVgK9xP6BSckBSBTOY2Ny
	 v7y3yyhCyfuDxo6tvjYtyjCpXSOmiclyiivveMrkLJJ0lvXq2A58doanTU1ntfaSpR
	 qsNk6Q2BIm6uP88sHhJJvXuzkgm4yY/WI+ysX0VdgB/UI6wV1LDWGP9GkznMdaxZXF
	 v/FevXfVS3lkD4MAX3jLb28EhlZXt4vy4DcK6fITG2ozKSIgL9rCglsxaEfCJJKGUa
	 oMBv3cVpEaW7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D3E0D3E99A;
	Wed,  5 Jun 2024 13:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net v3] net: ethernet: mtk_eth_soc: handle dma buffer size soc
 specific
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171759303143.15829.1231118828058253183.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jun 2024 13:10:31 +0000
References: <20240603192505.217881-1-linux@fw-web.de>
In-Reply-To: <20240603192505.217881-1-linux@fw-web.de>
To: Frank Wunderlich <linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_061033_758199_6ECC3C89 
X-CRM114-Status: UNSURE (   8.77  )
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
Cc: daniel@makrotopia.org, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, Mark-MC.Lee@mediatek.com, edumazet@google.com, linux-mediatek@lists.infradead.org, bc-bocun.chen@mediatek.com, john@phrozen.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon,  3 Jun 2024 21:25:05 +0200 you wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> The mainline MTK ethernet driver suffers long time from rarly but
> annoying tx queue timeouts. We think that this is caused by fixed
> dma sizes hardcoded for all SoCs.
> 
> We suspect this problem arises from a low level of free TX DMADs,
> the TX Ring alomost full.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: ethernet: mtk_eth_soc: handle dma buffer size soc specific
    https://git.kernel.org/netdev/net/c/c57e55819443

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




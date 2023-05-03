Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302BDC77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 03:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7k3UvXcOvTWD8QXMn9yzrNQrUVLsUztShNUrwH+zPg=; b=o876nztJrPfQdFvgs2aFu6GW2v
	Q7a2KHPBtwAH0BquZf6gskSQRbXQ9spT43uWCJlYt6Pt2dQYRC1QuaQmuQjx0r3iJaWK63Bj+SZHb
	LoIYmfQoUWdd9t0+sFJeUFzy5sPG8/xi/vpd+OYm02XyMyOyZoUGJ0l7V4XDG1ZY29pXoZwv4b5Ox
	uBJJ6X3YG1rVWAnoMJhQfV/8t5fgsUuPHMgYAvdwU0d+7pPYFy2YkMQBMhU/1U12v1xrQckstTzpx
	KlGN17Sp2LFijGDeVxFmqGlCfdIKOw4EiFmbTc+eFEJuyCv6h22I+E+w7lwXHaoIkXGYokKTg/8Im
	fvh43qwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pu3CF-003E4U-2G;
	Wed, 03 May 2023 03:30:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pu3C9-003E3J-2y;
	Wed, 03 May 2023 03:30:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6BA3360B78;
	Wed,  3 May 2023 03:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3392C433EF;
	Wed,  3 May 2023 03:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683084619;
	bh=WLePMFTzjehr9UevzId0j2OA0wYMyFASCHTHGYPPt2w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M32UpwLrF0haRxJJu4+N6DyK2waPH0u80DX/t6PsuBzKMfQdHl5U1+guDJAaWr+pJ
	 P40yjI8fyWwShSe28I1r5pqFwtVnSk14s722dNoho9UE/iKltSn8ytt89ZTFO79OZZ
	 HQtcjEOzDtBVaZxnXiPlEp7MtOHtQIlTUWBwNAnf3YyyEWnP8PYYU/Qjb6xiGtzxJm
	 k0yYwbacdxQwvUuXfYD4ZqRKqOOk2LCTWpy1kT1QDB/hVCngOQ1XSx9HKFhscVbjWI
	 MaWoFnDUAETaE3yfec2NR2xAGfqFqze1Eher+sSLPDwORJJjvg/IFwOjm0GFMb8mkU
	 XjGC+rEVRZ6BA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8E1BEC3959E;
	Wed,  3 May 2023 03:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net v2] net: ethernet: mtk_eth_soc: drop generic vlan rx offload,
 only use DSA untagging
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168308461957.6433.6971778251909204791.git-patchwork-notify@kernel.org>
Date: Wed, 03 May 2023 03:30:19 +0000
References: <20230426172153.8352-1-linux@fw-web.de>
In-Reply-To: <20230426172153.8352-1-linux@fw-web.de>
To: Frank Wunderlich <linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_203022_028894_04DE4FED 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, sean.wang@mediatek.com, linux@armlinux.org.uk, stable@vger.kernel.org, davem@davemloft.net, edumazet@google.com, arinc.unal@arinc9.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, linux-kernel@vger.kernel.org, nbd@nbd.name
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 26 Apr 2023 19:21:53 +0200 you wrote:
> From: Felix Fietkau <nbd@nbd.name>
> 
> Through testing I found out that hardware vlan rx offload support seems to
> have some hardware issues. At least when using multiple MACs and when
> receiving tagged packets on the secondary MAC, the hardware can sometimes
> start to emit wrong tags on the first MAC as well.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ethernet: mtk_eth_soc: drop generic vlan rx offload, only use DSA untagging
    https://git.kernel.org/netdev/net/c/c6d96df9fa2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




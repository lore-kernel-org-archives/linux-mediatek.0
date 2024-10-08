Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F0ACED24E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 00:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lbo/MOF2lc+P52ISjMHVwhpQEfFtJUiKbnh2GgUyBwk=; b=1qyqjqFLXVobzzupjamGqBcADu
	Z57s2jc6/7rNix/oa0ESjGMroqHIFK5a5lpiqBG5AuKjV0seycmW+blxySLtpifaP1f4++kHhCBqJ
	jB3NZ9irReIquYwnYvXNnEpFTLu4CE/RrsDu7B0H23ZZgXaqrF6TbUnFgSZZzimL8fJ6rDE8ZyKSq
	eeN6w8p23i9gp2zWMUtQ+WjVhx7OGlPb+Vd5CWXCe8G1+z7a8kQsv9MZWhv6JqTfv2HNQ8ipwYHaA
	WNXYBf2Cff1qCX/8RQgTs6c2MPMO4gQ0YSilzuTeGtej0BlG/d5y3ORFFQBAmeW8ZF+/xnjix3G/f
	MNAHTvXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxyIN-000000047rO-3VSo;
	Tue, 08 Oct 2024 00:41:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxyH4-000000047nS-1K9Q;
	Tue, 08 Oct 2024 00:40:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6A855A42901;
	Tue,  8 Oct 2024 00:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A320C4CEC6;
	Tue,  8 Oct 2024 00:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728348024;
	bh=ngoL8tWnqZwdr61VyVfbRw1NEBAJJIYMc6WKSCo/joA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UmzXtG5Ht6QMy7jWPXeZqckQChXYja8q0NRB3IoiGlyn3+8aPb4QYkAD5TuiRhHEm
	 sTolPsBfOjDMFxfuaaV+vwCfEeWK5SHsu+8ilN3s6Pp9KErfPkszMlRa9yoV2T2FTf
	 uUBc3jEv7nbZjOi+d2D1NcEktCsyIpSf5o+yA1HAsUb/UAISPOe8IZ0DrFVYjke/x+
	 31Zf2n73hI4dK78Vti2QV7A9VfOaJ7OMNPSjXXO/WwqT2fLSKGVgyngYoxG1892mMr
	 4E4haErqyE4OBXvYaD5jnvzTEqj8xQuKCf1LdovtrTesJq8EOOtT00xRPT7GcTgQ+E
	 zZzNkeR85sg0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFCF3803262;
	Tue,  8 Oct 2024 00:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Update tx cpu dma ring idx at the end of
 xmit loop
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172834802875.31485.3860611664672766759.git-patchwork-notify@kernel.org>
Date: Tue, 08 Oct 2024 00:40:28 +0000
References: <20241004-airoha-eth-7581-mapping-fix-v1-1-8e4279ab1812@kernel.org>
In-Reply-To: <20241004-airoha-eth-7581-mapping-fix-v1-1-8e4279ab1812@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_174026_444048_28FB4314 
X-CRM114-Status: UNSURE (   8.17  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 04 Oct 2024 15:51:26 +0200 you wrote:
> Move the tx cpu dma ring index update out of transmit loop of
> airoha_dev_xmit routine in order to not start transmitting the packet
> before it is fully DMA mapped (e.g. fragmented skbs).
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Reported-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Update tx cpu dma ring idx at the end of xmit loop
    https://git.kernel.org/netdev/net/c/3dc6e998d18b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




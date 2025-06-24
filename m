Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC614C7115B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jun 2025 01:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pswaEvXrxqiCuPqguUrIpa+69TcLaVsgIe/a8Du3h30=; b=c3PJmjr6Bcn9JO8ImKjLtDssnD
	yC+o542YAtFRFVBVFqcfTD0ARK9DRkJn1DvJs4WtBe2L46eo8P7HWMk8lnsu/q+Uc/7i8h1QVKk5k
	x7+kbgo012mMxH0+tD72g3mpfKPQgm2u1KA0chKyzXwy/U2jms3tRqjdNYyFVB8ep3OLEXfguTUBE
	AlkwvXvzdIRNCmv5bppA0RSLHH0avUjCAVEu6j76xlCFZwAKzWbIrfGJMiQH39ZfrNeeVCZfnOQh0
	ivr6L74rEotU2tfU6r4htv1SJDVZgMVQ94LTL0BzAuG+GOHouH+a7tc6imKtoEQR2nt7WUwaLbw2Z
	pQN7T0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTsMW-00000004MNW-3I6f;
	Tue, 24 Jun 2025 01:22:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTsK9-00000004M5E-33Q3;
	Tue, 24 Jun 2025 01:19:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7172629C6;
	Tue, 24 Jun 2025 01:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4619C4CEF3;
	Tue, 24 Jun 2025 01:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750727984;
	bh=i8HmAnFDktLAN6p9Nv9fj36EDKY0uQqypdcdnsV1cUE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qbApFGTxhNc7UDhHKJ6J3UJL7OJd4o9QzP04wE6FkvuMWVkHWcMPGiR4XeEhNt/jt
	 Hm7XfNrXcBTbOyvml0OjsO7A5senyOlKulf7qbDc0gGriU7VfqDi6IWwa2LpHL4yzP
	 eK99+RUI+1DmZhKSI8BvenGL+bVwY1Y8WkBSTih7Lsqtu2ADfL7JHkXQtoi3FsH24Z
	 1291NiwRQsGbpvbC2yBqJUZXUhCrq/vlj75dbhjJkwFMqZNViC4BhQdrTYnBymlQbU
	 JOmCCL1QYq132gIQfwfOiakDt4uED1sNUxCjXIbdKRY2PKwdZJJvx+nKnERCTYwunC
	 oPtTLXkOyNigQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBE5239FEB7D;
	Tue, 24 Jun 2025 01:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next v6 0/4] rework IRQ handling in mtk_eth_soc
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175072801175.3355543.2001178239431704817.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 01:20:11 +0000
References: <20250619132125.78368-1-linux@fw-web.de>
In-Reply-To: <20250619132125.78368-1-linux@fw-web.de>
To: Frank Wunderlich <linux@fw-web.de>
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
Cc: angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, daniel@makrotopia.org, andrew+netdev@lunn.ch, edumazet@google.com, arinc.unal@arinc9.com, linux-mediatek@lists.infradead.org, horms@kernel.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 19 Jun 2025 15:21:20 +0200 you wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series introduces named IRQs while keeping the index based way
> for older dts.
> Further it makes some cleanup like adding consts for index access and
> avoids loading first IRQ which was not used on non SHARED_INT SoCs.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/4] net: ethernet: mtk_eth_soc: support named IRQs
    https://git.kernel.org/netdev/net-next/c/ee85b483fefb
  - [net-next,v6,2/4] net: ethernet: mtk_eth_soc: add consts for irq index
    https://git.kernel.org/netdev/net-next/c/498190100992
  - [net-next,v6,3/4] net: ethernet: mtk_eth_soc: skip first IRQ if not used
    https://git.kernel.org/netdev/net-next/c/9c0feca0a68b
  - [net-next,v6,4/4] net: ethernet: mtk_eth_soc: only use legacy mode on missing IRQ name
    https://git.kernel.org/netdev/net-next/c/070e98dd4e26

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC7CC44536
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jan 2026 04:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ght26adq/qmNhgwvIPGc2W78yaorOKHMzk13dwRsH1o=; b=OZBy18ukZ+XVmav9cDu/znJQym
	GK6OD7gYChsIRyxfZktVT4q2JhY2y1sxp0C4cWNPHfWSfGvI/QDZwj8LojGbIf8zC44JZHeHKWTpZ
	N78lE3nvfGXiAaB4RgxRslpzp43AjCfzaJhKYMgmIDI3iJeNG3zVNLzc6Uhj9U6EmJBEGSF3IpWza
	gUXJO2nJS1o6HDLIrZMXpndjwJCqTRmt7d/rY+pXq1F06ydiNSGQhGcVqrDOr645XFoD21Xtl0YuD
	ixm09EgNJN+a6UDTszP/hn5lKLQQYmxT8PA5CgapB/R55wh800zqhf6WIRr+I3raQ25F0jxFCAdb1
	1ntvbd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vils1-00000006PDN-1p1w;
	Thu, 22 Jan 2026 04:00:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vils0-00000006PDH-2NEv
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Jan 2026 04:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65BB860128;
	Thu, 22 Jan 2026 04:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14BC6C116C6;
	Thu, 22 Jan 2026 04:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769054431;
	bh=0TPXQcGcMeb4eSWYC3RqEvW0ZdfKCckPeLy2PavJ0R0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OCcwfd1lkmOcRECRwLzXlmifA802QJkRdfrj6rKGp9N4qPBxNHvDg0jajn7i97E4j
	 euaCzy1VKjqlY5y1+DQNez96fMf2sUQfdC2qIEEqxr50yML2wp3nYqDnm3xRae54RS
	 vSSFN8bD+RzO/Ge8gJkO44gaAmdp41a443moCgMrOMBdC9tTLNaO3ea8XV1442WZmh
	 TMTy8dKYbrOCtgX6KEBqMVjIJJohKbLQzhO1mwHiY3dkiUVNXlqnsW9oTtm0LvZEQm
	 5oaYAW9Fx9rr6TFsxv2JUy5gnAZNAaTyH0oFivFZBECVfWfXQHa5TipEREsrfLeRGI
	 hxT+y8MCOGKVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11A5B3808200;
	Thu, 22 Jan 2026 04:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 net-next 0/5] PHY polarity inversion via generic device
 tree properties
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176905442759.1550373.5368781764680170431.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 04:00:27 +0000
References: <20260119091220.1493761-1-vladimir.oltean@nxp.com>
In-Reply-To: <20260119091220.1493761-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, horatiu.vultur@microchip.com, bjorn@mork.no,
 andrew+netdev@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ericwouds@gmail.com, lynxis@fe80.eu, chester.a.unal@arinc9.com,
 dqfext@gmail.com, sean.wang@mediatek.com, nbd@nbd.name
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 19 Jan 2026 11:12:15 +0200 you wrote:
> Using the "rx-polarity" and "tx-polarity" device tree properties
> introduced in linux-phy and merged into net-next in
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=96a2d53f24787df907e8bab388cc3e8f180a2314
> we convert here two existing networking use cases - the EN8811H Ethernet
> PHY and the Mediatek LynxI PCS.
> 
> v3 at:
> https://lore.kernel.org/netdev/20260111093940.975359-1-vladimir.oltean@nxp.com/
> Changes since v3:
> It was requested that v3 be resent with just the networking parts, there
> is no change.
> 
> [...]

Here is the summary with links:
  - [v4,net-next,1/5] dt-bindings: net: airoha,en8811h: deprecate "airoha,pnswap-rx" and "airoha,pnswap-tx"
    https://git.kernel.org/netdev/net-next/c/44f62aa1b120
  - [v4,net-next,2/5] net: phy: air_en8811h: deprecate "airoha,pnswap-rx" and "airoha,pnswap-tx"
    https://git.kernel.org/netdev/net-next/c/66d8a334b57e
  - [v4,net-next,3/5] dt-bindings: net: pcs: mediatek,sgmiisys: deprecate "mediatek,pnswap"
    https://git.kernel.org/netdev/net-next/c/9f841922ebd0
  - [v4,net-next,4/5] net: pcs: pcs-mtk-lynxi: pass SGMIISYS OF node to PCS
    https://git.kernel.org/netdev/net-next/c/bde1ae2d52ab
  - [v4,net-next,5/5] net: pcs: pcs-mtk-lynxi: deprecate "mediatek,pnswap"
    https://git.kernel.org/netdev/net-next/c/8871389da151

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




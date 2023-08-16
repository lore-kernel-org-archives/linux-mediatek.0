Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEC9C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 02:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBsVJhZFDGsZHiOct5Zto2WnR5T8UMQHgw/XuMkzX3w=; b=CcC6o5puVckvOGL5rx8uzg753T
	6aM1tKLhOb+6chuYD0l6OSmi26GS1s0IB0Q+D8JmK+5gjQ49KAqhgMZUAU4XXXv6Jj+ntpohOy0FL
	RBudrCevTdCtK/sIwgqctYKUUcvR/yvyfgXbt4FatTXYqzWEbDt5FicniEkSRug9zMGUiyxYOLmlP
	tvhbQS2LmiF35wU5Kcx2CTxlAU2HCFo6uJjwdCAJkKPaipU1GxrfI6Jd5KkQ9LAK7AJIvYN4ewd8i
	buQfhNY4s8fYkRg3LjtqSHk47JyfQzU5W21Wkln0Esh7GyuXrVqMJan6Tb8r41Smet0rihdxy19yK
	cAVPCo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW5pm-002yk6-1B;
	Wed, 16 Aug 2023 02:00:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW5pj-002yjS-1n;
	Wed, 16 Aug 2023 02:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F3356522A;
	Wed, 16 Aug 2023 02:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 888A8C433CC;
	Wed, 16 Aug 2023 02:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692151223;
	bh=/SivyJg8L6IR/Depj/t+YI1jAL7OVWimX+0Y3ciOitI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HoHHqUSN72uGtTeAaxsXXiAJnXHu18/C1a7kcmlmGPJvkOM1eo+FGYfN1R1Qs0dnB
	 N3rvXM8HvY+vmHAOJMa2U9bFsWRWmZbQTrW0W4kz5IGNIx+l2vDEQJgqAEjNmjrCQR
	 UM1bGxm+6W7ttums0RPEiqtLIwvfmWe1pjnZX3lm8Vf357FYnrKkQJODV7IdZegDr5
	 PrNiM3GZqeVPTV8C4ny0u+jZVsb+feD1Thdvo+t8Qnn21GaFVIS1NvscTunEyztQz5
	 ga0nvTbV2kH8AYgTgqn7R7DYNnUEe53Ub4a9pApc5DwMRLajDXUUpNXhqlbUwrTKFC
	 G5S7F7hNxsKGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6B29EC395C5;
	Wed, 16 Aug 2023 02:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: phy: mediatek-ge-soc: support PHY LEDs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169215122343.15326.15132582167017916301.git-patchwork-notify@kernel.org>
Date: Wed, 16 Aug 2023 02:00:23 +0000
References: <dc324d48c00cd7350f3a506eaa785324cae97372.1691977904.git.daniel@makrotopia.org>
In-Reply-To: <dc324d48c00cd7350f3a506eaa785324cae97372.1691977904.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: dqfext@gmail.com, SkyLake.Huang@mediatek.com, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_190027_662333_A620E8E7 
X-CRM114-Status: GOOD (  10.69  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Aug 2023 02:58:14 +0100 you wrote:
> Implement netdev trigger and primitive bliking offloading as well as
> simple set_brigthness function for both PHY LEDs of the in-SoC PHYs
> found in MT7981 and MT7988.
> 
> For MT7988, read boottrap register and apply LED polarities accordingly
> to get uniform behavior from all LEDs on MT7988.
> This requires syscon phandle 'mediatek,pio' present in parenting MDIO bus
> which should point to the syscon holding the boottrap register.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: phy: mediatek-ge-soc: support PHY LEDs
    https://git.kernel.org/netdev/net-next/c/c66937b0f8db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBC6C83F12
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 20:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L02duF6SFy8RjJnLA6g76StEvl2HO8km/+3vH3DebCI=; b=DMaMGHgMh2uqKD2tKfh7PamZuj
	xq1dwcfCIBA0Acbf7wK5Ct/YXBavWMiQsH9cBp3oapjsZ+E6pLonAFwueCO/nENgQ3xBLzMYS/3Gl
	CfgJ0fdZQ8193e2Gge1scLTDa8lkHMamYQPxvdnh3YbZzzggoir+WjjXJOXTfoxRPum4Lxdm8v1V5
	RWSe9vAFgJvHR1AzvrN5+CdzuSbIbtO50XItCfs1PrupHgGPVpQYBQ7AUPPr2euQydXI2bWFE1gic
	1eb9yFS1WngeGc2QSGDbKmBWxzC00f3OQumAbrwps8eVZvD5SUn3oTYwbQ9yCFc1KKUkB7soDLhpg
	MDO8QUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiPV-00ACP5-1u;
	Mon, 28 Aug 2023 20:00:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiPS-00ACNu-2X;
	Mon, 28 Aug 2023 20:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8B40650E2;
	Mon, 28 Aug 2023 20:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6BE7C433CB;
	Mon, 28 Aug 2023 20:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693252823;
	bh=t/0EA6ZpRKGsKfKE0cId3rR1RxU96iAzwfiOXjNwhKY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sLu6b+wOEiJXRq5H7w1dng1+8KdD3nFqEGycifPNB3t5OWlQvzEC8Hyodp0xr8fD9
	 aJ7wi1Wkqk5w7aErb0P4eFLMC8GT8PVfQOSWv1h2O5Tgm6PrhRjxJGqlnI++FLiGfy
	 vxOeAKZGcWszjHf4ZE+y9fF8EWI0ShJoZ5z0VwLWvh49UAbrInvy3FZfGR626iaREq
	 BpIKfy45Ez4ySH6KprHBpG1GY7n7sJJ6UcB0qTz8BA/LAEQ9ESJ+AunoumJ9km7rSR
	 o4xAOji2ioDx6bsuTNOQTzqHLsxXS20+tmsExwLIpO3fCf8hp+LKwzbI+gLQAP7PTI
	 o4xAnc3Jpn+Hw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C2D4E21EDF;
	Mon, 28 Aug 2023 20:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: clarify difference between "interface"
 and "phy_interface"
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169325282356.23387.6771304913662801847.git-patchwork-notify@kernel.org>
Date: Mon, 28 Aug 2023 20:00:23 +0000
References: <E1qZq83-005tts-6K@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1qZq83-005tts-6K@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew@lunn.ch,
 davem@davemloft.net, edumazet@google.com, chenfeiyang@loongson.cn,
 hkallweit1@gmail.com, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, vz@mleia.com, kernel@esmil.dk, samin.guo@starfivetech.com,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_130026_879842_A19B76E4 
X-CRM114-Status: UNSURE (   9.43  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 26 Aug 2023 11:02:51 +0100 you wrote:
> Clarify the difference between "interface" and "phy_interface" in
> struct plat_stmmacenet_data, both by adding a comment, and also
> renaming "interface" to be "mac_interface". The difference between
> these are:
> 
>  MAC ----- optional PCS ----- SerDes ----- optional PHY ----- Media
>        ^                               ^
>  mac_interface                   phy_interface
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: clarify difference between "interface" and "phy_interface"
    https://git.kernel.org/netdev/net-next/c/a014c35556b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




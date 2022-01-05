Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E581C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjNX1EUlJW0DXQEpBVDse9K8elfVtEaP4vkAimUrK6c=; b=wDtc0llEpUbyhH
	k5yEeKk7rV+fjWkUROp6d+rszhPJD1s3Dz1ja57b03cCe+TRyk0Lw4v4u0jQzkWLxqNw8oLJEpd1i
	fFJ0+c7rjE0vNlR4N6gkV8P6fjpyHNfIMKnyAJEgO7Gi1a5mlKF1JKklb1ibViCLSFBSRl3Uv5xoB
	3UqJJ9ZS/v0Y5y7qTkr7h2JabyvFsqV2FSmA4HuQzFYLdDNhqolkXii3AqmaWSGPS11hethyi1GYI
	8bChmdmxUy6zb2tzLWnpbi3x6xtiIEZ6QdWG7LzhW95FMcDJGYTdzgvLbTRZLy8F7cn6MsvTvs/zW
	9QtkigYZBLywihIoA3TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n54Ur-00EfzP-7o; Wed, 05 Jan 2022 11:30:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n54Uf-00EfwY-HD; Wed, 05 Jan 2022 11:30:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6087C616F8;
 Wed,  5 Jan 2022 11:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8EA4C36AED;
 Wed,  5 Jan 2022 11:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641382211;
 bh=NXnK29rweR4LUQ4VydBhLmhRcLlfzwpZeWKkeIjmW/4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=shRNi6YH7cKQuVgeFhNXsSXy0bVLVTBzyEh2u2btgqAJrHbaF27taAWaZHTBWkkKT
 s6M65hCxw5koItsIrrAMIviw7EBsMguC6ulW0xh31TJuOYELh2lEMmXWJtWrSPtn0p
 H+i9PCBPuPG6b9vy0dbpyJgkSWMYJIbrejsAWdVpTLQ3RR98ztI92rc8Si8BmEx4av
 9yxf21ZVSmC+IOHHqmDyrrAeVYz3xBS8zFulMdbiBaW/fJfUnBVXmzEZZT/iWxKD2U
 OPnXqOOMHaA0k/YbeySPMUDtTwpGRTBo1E1ea+OgsxgOAdy4ndHgIwongRJLPUxOEE
 lU0aNjykHz8BQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9CD0CF79408; Wed,  5 Jan 2022 11:30:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v12 0/3] net: ethernet: mtk_eth_soc: refactoring and
 Clause 45
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164138221163.4307.616203536271666789.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jan 2022 11:30:11 +0000
References: <YdQ4HzLjpuVW4YFi@makrotopia.org>
In-Reply-To: <YdQ4HzLjpuVW4YFi@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_033013_657947_91B8D92F 
X-CRM114-Status: GOOD (  13.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue, 4 Jan 2022 12:05:51 +0000 you wrote:
> Rework value and type of mdio read and write functions in mtk_eth_soc
> and generally clean up and unify both functions.
> Then add support to access Clause 45 phy registers, using newly
> introduced helper macros added by a patch Russell King has suggested
> in a reply to an earlier version of this series [1].
> 
> All three commits are tested on the Bananapi BPi-R64 board having
> MediaTek MT7531BE DSA gigE switch using clause 22 MDIO and
> Ubiquiti UniFi 6 LR access point having Aquantia AQR112C PHY using
> clause 45 MDIO.
> 
> [...]

Here is the summary with links:
  - [v12,1/3] net: ethernet: mtk_eth_soc: fix return values and refactor MDIO ops
    https://git.kernel.org/netdev/net-next/c/eda80b249df7
  - [v12,2/3] net: mdio: add helpers to extract clause 45 regad and devad fields
    https://git.kernel.org/netdev/net-next/c/c6af53f038aa
  - [v12,3/3] net: ethernet: mtk_eth_soc: implement Clause 45 MDIO access
    https://git.kernel.org/netdev/net-next/c/e2e7f6e29c99

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

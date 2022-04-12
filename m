Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42053C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 10:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZimSog7D0ZfmCjeUueAiEplB0q5A2Ur83IB1cnBFoyE=; b=z3s/SHDV9n5eLk
	/tv5vkX0gmeiQYvrexL4QsD5UEEy+KRKOsYd2fXMJxKQSLNv+KVfJNSmtX63UZm8JRrpgtnxwFWuI
	oiiF6FhLX7Z+3D7sCVdeHfw85tFYVo56PVOngOpB0zaXEAuDNBx+XLgf4FqAfmSncXNp9sej0TMnf
	ObRZya5pRJ4RlJBkI54bQ7MrexMZbSRKChvKB+wUEAwTs/o882ciKplFtiMiU6Fr4txJsKmYUUEFI
	DxsFdCcFRgBF9XZkM3Bw1bIc3KdeKawOyuBNA/0XOPTVA+1Q9jWDJdnsOy9q2M2R7iG8bhzAZI+IB
	6+uJ30I2iO5FZiqfSpUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDU4-00DBnn-P9; Tue, 12 Apr 2022 10:10:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDTU-00DBYM-G2; Tue, 12 Apr 2022 10:10:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45ED4618A8;
 Tue, 12 Apr 2022 10:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4B4DC385A6;
 Tue, 12 Apr 2022 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649758213;
 bh=awEmwceAHMTLgt++0w0XhcTYw0uJdVpEoFT4/OGcWQQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TSiTHX7SCa8uLekV+0ttDc29QQHz1LE7THUnhnOSsY5Y8R1DEJuS2Wb54rw4tjdrX
 GRyxc11+pUQ3N5Yjx21JWDmBrhmBUWh5DegGV4rJy9PXfZG8A5Cx9wZLmvc4T+eR1Y
 egfMvA5GoLCne/PGMdOGgKi6bogcEeWZM5JtlI87WRqhBej5brXhszYTwd6jUuEkg6
 fsLjflGG/G7yeLMzIXRuXqKII1MoNinRTX/PnV2HT7HgCAquTP/OypPJabb2QNt89n
 OsAUORhhfago/aIHsBMht9jBvtTaDENzl7zw9qLN8zr9zrW/A9xdtrrZqRbE/2meJY
 8kjawORzVeRtg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 831F4E85D15; Tue, 12 Apr 2022 10:10:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 0/9] net: dsa: mt7530: updates for phylink
 changes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164975821353.21132.17881540288519221118.git-patchwork-notify@kernel.org>
Date: Tue, 12 Apr 2022 10:10:13 +0000
References: <YlP4vGKVrlIJUUHK@shell.armlinux.org.uk>
In-Reply-To: <YlP4vGKVrlIJUUHK@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
 kabel@kernel.org, olteanv@gmail.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_031016_624140_B67C89A1 
X-CRM114-Status: GOOD (  12.00  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 11 Apr 2022 10:45:32 +0100 you wrote:
> Hi,
> 
> This revised series is a partial conversion of the mt7530 DSA driver to
> the modern phylink infrastructure. This driver has some exceptional
> cases which prevent - at the moment - its full conversion (particularly
> with the Autoneg bit) to using phylink_generic_validate().
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/9] net: dsa: mt7530: 1G can also support 1000BASE-X link mode
    https://git.kernel.org/netdev/net-next/c/66f862563ed6
  - [net-next,v2,2/9] net: dsa: mt7530: populate supported_interfaces and mac_capabilities
    https://git.kernel.org/netdev/net-next/c/59c2215f3604
  - [net-next,v2,3/9] net: dsa: mt7530: remove interface checks
    https://git.kernel.org/netdev/net-next/c/26f6d8810282
  - [net-next,v2,4/9] net: dsa: mt7530: drop use of phylink_helper_basex_speed()
    https://git.kernel.org/netdev/net-next/c/fd301137e6b3
  - [net-next,v2,5/9] net: dsa: mt7530: only indicate linkmodes that can be supported
    https://git.kernel.org/netdev/net-next/c/7c04c8489115
  - [net-next,v2,6/9] net: dsa: mt7530: switch to use phylink_get_linkmodes()
    https://git.kernel.org/netdev/net-next/c/6789d6d76e81
  - [net-next,v2,7/9] net: dsa: mt7530: partially convert to phylink_pcs
    https://git.kernel.org/netdev/net-next/c/cbd1f243bc41
  - [net-next,v2,8/9] net: dsa: mt7530: move autoneg handling to PCS validation
    https://git.kernel.org/netdev/net-next/c/9d0df207c002
  - [net-next,v2,9/9] net: dsa: mt7530: mark as non-legacy
    https://git.kernel.org/netdev/net-next/c/7b972512ec0e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

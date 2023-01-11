Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1664C46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 00:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoWupDWvLxjR+arT2rw2J3NBAwSy+z4LO+Bee7MSNM8=; b=FoK1v48JFf4qzAgVFGyIBfYTJ+
	ouCOcT0YKQYLsvCq4jrkTjqQXk7Y2mzbXOpQ2YTUBN3Z8ZZ0WQpu7lAT1Iqt7FPW/JmzWb57msq2b
	OV5MANhMqzbwjBuG9wB0gyaimwc73rfyTtG3o1k0KW0hm/dGb8jKKYMzjd5RG1WnGCsiFpiYEbljc
	GXIGbwsZjWjtWkjpk9K2SOH7fihxNFS6FD+apu94I95A5x0H16Pm/tCs2S1SS6n7zPsBjaXLmITWT
	br/B1nNkEg6BUnz/gbHcoY0wTZ08no2iWH58TwNEPEJ0PqRPXfUPLuwqwgAYENuwVaYDfZR2HD9Dz
	9gQ0LHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFOhM-00900d-3y; Wed, 11 Jan 2023 00:10:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFOhB-008zxR-52; Wed, 11 Jan 2023 00:10:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 990FF61987;
	Wed, 11 Jan 2023 00:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 040FBC433D2;
	Wed, 11 Jan 2023 00:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673395818;
	bh=2Oz4hwPxPjuMAf/Gd82dMOKnsmuaokvLtGpniKKLwKI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JS2WpUu9gPQdnTU2OpkuanwmDXxgqopFsvBaVkwuAfiDkEwh3ehmVPeZ/eFAX1yW6
	 Y8citpTQmvbBzwvyKjKQ3H21VtntINErqkGmmEXxVV/0puFOHVjEZ6r+fdpUvDR6xO
	 MyML7rGVE7h5UdftG1t/zwiroly+RSDBZrgGKyx5k1Y1WN9k75WdvZvRnlfLUyZoIc
	 MUC7STUe/MWmtMU4OssdGSBm7muUMFMi/IbZf1ar8SVA+PnGibG7Ku4EPhfMm9oVcH
	 YIeOfCeTgFKNbWpIqO5yKRq7uO9R+zGstoQ1xnPC9M2X515DXJ4N7R4xvZm0ZcJfnQ
	 /amxNjrvOTEdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DAFDEE21EE8;
	Wed, 11 Jan 2023 00:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 00/11] net: mdio: Start separating C22 and C45
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167339581789.32183.5441523442987743331.git-patchwork-notify@kernel.org>
Date: Wed, 11 Jan 2023 00:10:17 +0000
References: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
To: Michael Walle <michael@walle.cc>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 Jose.Abreu@synopsys.com, s.shtylyov@omp.ru, wei.fang@nxp.com,
 shenwei.wang@nxp.com, xiaoning.wang@nxp.com, linux-imx@nxp.com,
 sean.wang@mediatek.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 f.fainelli@gmail.com, olteanv@gmail.com, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, andrew@lunn.ch, geert+renesas@glider.be,
 vladimir.oltean@nxp.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_161021_295596_BAC9A1EE 
X-CRM114-Status: GOOD (  15.37  )
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

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 09 Jan 2023 16:30:41 +0100 you wrote:
> I've picked this older series from Andrew up and rebased it onto
> v6.2-rc1.
> 
> This patch set starts the separation of C22 and C45 MDIO bus
> transactions at the API level to the MDIO Bus drivers. C45 read and
> write ops are added to the MDIO bus driver structure, and the MDIO
> core will try to use these ops if requested to perform a C45
> transfer. If not available a fallback to the older API is made, to
> allow backwards compatibility until all drivers are converted.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,01/11] net: mdio: Add dedicated C45 API to MDIO bus drivers
    (no matching commit)
  - [net-next,v3,02/11] net: pcs: pcs-xpcs: Use C45 MDIO API
    https://git.kernel.org/netdev/net-next/c/3a65e5f91780
  - [net-next,v3,03/11] net: mdio: mdiobus_register: update validation test
    https://git.kernel.org/netdev/net-next/c/555d64c6d8e5
  - [net-next,v3,04/11] net: mdio: C22 is now optional, EOPNOTSUPP if not provided
    https://git.kernel.org/netdev/net-next/c/b063b1924fd9
  - [net-next,v3,05/11] net: mdio: Move mdiobus_c45_addr() next to users
    https://git.kernel.org/netdev/net-next/c/ce30fa56cbf0
  - [net-next,v3,06/11] net: mdio: mdio-bitbang: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/002dd3de097c
  - [net-next,v3,07/11] net: mdio: mvmdio: Convert XSMI bus to new API
    https://git.kernel.org/netdev/net-next/c/b3c84ae5ff99
  - [net-next,v3,08/11] net: mdio: xgmac_mdio: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/c0fc8e6dcee4
  - [net-next,v3,09/11] net: fec: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/8d03ad1ab0b0
  - [net-next,v3,10/11] net: mdio: add mdiobus_c45_read/write_nested helpers
    https://git.kernel.org/netdev/net-next/c/1d914d51f03c
  - [net-next,v3,11/11] net: dsa: mv88e6xxx: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/743a19e38d02

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




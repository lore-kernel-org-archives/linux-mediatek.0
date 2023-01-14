Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A807AC3DA78
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Jan 2023 05:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GEFtWN3Io2koVqVCH6uB4nTDPOW+17y423ncZAgCHU=; b=uFxASxxT1T9Nf43G8r2JjidC8Y
	Cxxa/LAlIio+P9Xo8amXQia4oiaNQi0jrywrJe1+d8Ao6nuI01AK4ai68Oa7o88UABC9O4f+F5L/u
	jUgHv9UbupZuO/3n6a6ECNxLNl3I6Nbnh8FGcYlfu0c6KDva7bpu98ic5YDRiVGBtBRiGC+CAJCIs
	08TYNZWVUs0rjgmpJduN2UwjG9U9u4P2aniori/HOHuYFAB6tWt/DBueHGHMX5YfNAt/9Iq0D7F9y
	tCEIelbinvma+AiJnIpfwvTnSR1GQAtfK8eaa4r7rgPz+XDooOsxVn4EvOQ0KrNVW+7PiLiqA/k0L
	K0nEujGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGZR1-005Iit-2C; Sat, 14 Jan 2023 05:50:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGZQq-005Iho-3b; Sat, 14 Jan 2023 05:50:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4DEE960B45;
	Sat, 14 Jan 2023 05:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99D12C433EF;
	Sat, 14 Jan 2023 05:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673675418;
	bh=ngfQjwFKmCSeocAW86AdE9in/ESlzA2f+NOfkGPnaOg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PbzAb7FuLH7rstaaHzkqO/TKJ0jhzX5/WVGU1Atan9l2+aId0YIBwQBc6HEWGIdOx
	 NpBUiimoP/3W4GeYmgQWkIyK0QxD26i1VH8jDscuPlEWm/rxaumM/fnWM8Us8rXkdc
	 xVnwryq7I1nXtFLtPG4iU0vHUeQs6adLDniT54mEpUIdDbaTldpzW/tSZCCv49Latq
	 ASQ9j+AGIg2kynwAdJes0zFQh1cxh1mZpE8rDdsFr7ssJaPfEAj30VnTs0y0CgEV7e
	 g99L+fsWom9cv4n4jn7ebEEiBWKp8bDx58WvX+T4uizSBRsOOFIll46WgLTttVOLUn
	 Um0jMC9DtZRtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 75D05E21EE0;
	Sat, 14 Jan 2023 05:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/10] net: mdio: Continue separating C22 and C45
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167367541847.15756.1816103460556617097.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jan 2023 05:50:18 +0000
References: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
In-Reply-To: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
To: Michael Walle <michael@walle.cc>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, rjui@broadcom.com,
 sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 andrew@aj.id.au, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, matthias.bgg@gmail.com,
 bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, vladimir.oltean@nxp.com, claudiu.manoil@nxp.com,
 alexandre.belloni@bootlin.com, f.fainelli@gmail.com, leoyang.li@nxp.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linuxppc-dev@lists.ozlabs.org, andrew@lunn.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_215020_245277_1CF7EDF2 
X-CRM114-Status: GOOD (  11.20  )
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

On Thu, 12 Jan 2023 16:15:07 +0100 you wrote:
> I've picked this older series from Andrew up and rebased it onto
> the latest net-next.
> 
> This is the second patch set in the series which separates the C22
> and C45 MDIO bus transactions at the API level to the MDIO bus drivers.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> 
> [...]

Here is the summary with links:
  - [net-next,01/10] net: mdio: cavium: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/93641ecbaa1f
  - [net-next,02/10] net: mdio: i2c: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/87e3bee0f247
  - [net-next,03/10] net: mdio: mux-bcm-iproc: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/d544a25930a7
  - [net-next,04/10] net: mdio: aspeed: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/c3c497eb8b24
  - [net-next,05/10] net: mdio: ipq4019: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/c58e39942adf
  - [net-next,06/10] net: ethernet: mtk_eth_soc: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/900888374e73
  - [net-next,07/10] net: lan743x: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/3d90c03cb416
  - [net-next,08/10] net: stmmac: Separate C22 and C45 transactions for xgmac2
    https://git.kernel.org/netdev/net-next/c/5b0a447efff5
  - [net-next,09/10] net: stmmac: Separate C22 and C45 transactions for xgmac
    https://git.kernel.org/netdev/net-next/c/3c7826d0b106
  - [net-next,10/10] enetc: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/80e87442e69b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




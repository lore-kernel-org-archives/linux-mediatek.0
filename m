Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8C0C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 03:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZ/96idCML7uaJw0ZnIcKugxOLH5KYql+CqPcOncwCc=; b=VrADfxTEONQwivqxUDgOkhXHP8
	csE+p7/TQB/S2vMQn4LFusPNBM2Lx4m8kUT9N6nCo66yr3ymzDHruq7BL0NK2KADroYQu3NPEL7vg
	ODwDx4ZKepuVxL5k/rjqcKNkVJrZWkA5SqOv1sbKSCYOYtA2mjVC8yEHVEcf/zoywPt/IUrztuEc0
	mwHN5eqi5VtBZ40nTleS1sEHR29MTsrIcHnp2PfT/fURxsThXkmLDxILrnXshXTf0EkcdwDeJrdNI
	MaDlZv1xdzt8D3XJYBUgKVGOtbOcWF+/dLZS6tKTlkCIxJVDo8z8sVehfLKfUdg7rZY3BUUo4ZBqC
	OEhNA3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peSEf-00B3tk-2l;
	Tue, 21 Mar 2023 03:00:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peSEc-00B3sF-0H;
	Tue, 21 Mar 2023 03:00:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1CA8761948;
	Tue, 21 Mar 2023 03:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7627CC4339B;
	Tue, 21 Mar 2023 03:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679367620;
	bh=tG3nR/BNTPFfBhbWT130BlqQjCEkjCYaupmLUe7Z3KI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dmZSXPC0b0Pe5MUZDeqoGnap4EwddUaBK0H6Bruu+VpCVi/QApHbCre8vsOmXOGb5
	 YNEeUd++DZ73hql8rXVqB7S10mBPjV8e602/6OykY8OIRMKljxfiNRSopfMyRuQioj
	 /cdle9VRRBnt3nCCqSfN/qf0X5owMUw9EnsOAYgmL4yIthCBKfTyz28UQSUQYn/D/R
	 HHEuFU49olOKVeGq09Z0WJmcq2kIzh1dCw7hc/HJqJgsFQplAaNq6620K64FN6KkDf
	 Ob5sG1eMkW/EgOf175qSBNWj3Jrz5JeTDQUES2UWAuXII6RS/1HvVz7+Cn7PjC8ecI
	 dJgKkpmP546RQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 545C9E68C18;
	Tue, 21 Mar 2023 03:00:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v14 0/9] net: ethernet: mtk_eth_soc: various
 enhancements
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167936762033.19471.10695862996613870183.git-patchwork-notify@kernel.org>
Date: Tue, 21 Mar 2023 03:00:20 +0000
References: <cover.1679230025.git.daniel@makrotopia.org>
In-Reply-To: <cover.1679230025.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_200026_194808_29B47203 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: andrew@lunn.ch, vladimir.oltean@nxp.com, edumazet@google.com, krzysztof.kozlowski+dt@linaro.org, f.fainelli@gmail.com, linux@armlinux.org.uk, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, devicetree@vger.kernel.org, Landen.Chao@mediatek.com, sean.wang@mediatek.com, dqfext@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, olteanv@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, lynxis@fe80.eu, hkallweit1@gmail.com, davem@davemloft.net, bjorn@mork.no, nbd@nbd.name
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 19 Mar 2023 12:56:07 +0000 you wrote:
> This series brings a variety of fixes and enhancements for mtk_eth_soc,
> adds support for the MT7981 SoC and facilitates sharing the SGMII PCS
> code between mtk_eth_soc and mt7530.
> 
> The whole series has been tested on MT7622+MT7531 (BPi-R64),
> MT7623+MT7530 (BPi-R2), MT7981+GPY211 (GL.iNet GL-MT3000) and
> MT7986+MT7531 (BPi-R3). On the BananaPi R3 a variete of SFP modules
> have been tested, all of them (some SGMII with PHY, others 2500Base-X
> or 1000Base-X without PHY) are working well now, however, some of them
> need manually disabling of autonegotiation for the link to come up.
> 
> [...]

Here is the summary with links:
  - [net-next,v14,1/9] net: ethernet: mtk_eth_soc: add support for MT7981 SoC
    https://git.kernel.org/netdev/net-next/c/f5d43ddd334b
  - [net-next,v14,2/9] dt-bindings: net: mediatek,net: add mt7981-eth binding
    https://git.kernel.org/netdev/net-next/c/e3ac1c270466
  - [net-next,v14,3/9] dt-bindings: arm: mediatek: sgmiisys: Convert to DT schema
    https://git.kernel.org/netdev/net-next/c/d4f08a703565
  - [net-next,v14,4/9] dt-bindings: net: pcs: mediatek,sgmiisys: add MT7981 SoC
    https://git.kernel.org/netdev/net-next/c/4f7eb19c4f44
  - [net-next,v14,5/9] net: ethernet: mtk_eth_soc: set MDIO bus clock frequency
    https://git.kernel.org/netdev/net-next/c/c0a440031d43
  - [net-next,v14,6/9] net: ethernet: mtk_eth_soc: ppe: add support for flow accounting
    https://git.kernel.org/netdev/net-next/c/3fbe4d8c0e53
  - [net-next,v14,7/9] net: pcs: add driver for MediaTek SGMII PCS
    https://git.kernel.org/netdev/net-next/c/4765a9722e09
  - [net-next,v14,8/9] net: ethernet: mtk_eth_soc: switch to external PCS driver
    https://git.kernel.org/netdev/net-next/c/2a3ec7ae3133
  - [net-next,v14,9/9] net: dsa: mt7530: use external PCS driver
    https://git.kernel.org/netdev/net-next/c/5b89aeae6e00

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




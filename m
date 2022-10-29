Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07329C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 05:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4tjEHIKJOPklIK8sriOdDCpVeVvx89ZmWKnJJn59V0=; b=4TKD7QedzUVj5kwC9QFyz8OQyW
	83JvcNGAFF+ZvIKs0+5WKmxjTXbnrKd+07jPxip2uI0cr9P39Y3BA6A5NdXzsDqq/EV3xUdTboV8a
	qaeZ5Xba6eKZguk2lHgsVafLyYjSjVWmqtNC1OZGRTLyPFvpGMU6NqrihfIrROotn08mVJYZmtCMA
	xXEL8o/ea7jzILzvTDkJpEMdsZCEXdYnrRWSPDHwxYxCkGx27BH/lGBKxzOY7nCfUzqjidqZB3fhm
	odt0KT3Q3OIieIvDDlxpSiOcfpeELq64EhHOeSA4N2S0grAGnYBEjuUZ4v1dt7sw8MLLPBq5tro2k
	bl3PnSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodxU-004eCF-0L; Sat, 29 Oct 2022 05:00:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodxJ-004eAJ-U3; Sat, 29 Oct 2022 05:00:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC84B60B30;
	Sat, 29 Oct 2022 05:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 115BBC433C1;
	Sat, 29 Oct 2022 05:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667019620;
	bh=YgTaMHcT6qxuBEtL4RXvhCR7fZKLClpgXz88Amhb8CM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SjY1liqTea0rnxiqWfbm+YMCRIZ3rm+C5Ssug2Fdw6q3roGUy7SPcRrMwWXTQEojd
	 KfOtn12je5+rk8OnykmmPEXsyj7vAqfrV1D0KnKnsuA03drzS1hgIC7Syd05D3FymO
	 o5EkcsoQk6yrO/lK/zZwVYKCWHua4Bxl3Ms2+FFAudQtnd1xL+rTsxXlKT0+qDz9pe
	 sU9vYL+tzci0bkOltpL1R6NlIJ3hNO+zAtPcLjoAUY1LAsVIq1hoopUeW47HfXpyuC
	 5FLFXKeJGo6ZG+8R2v5WdUXFU1USxBu3V88UYC+8IkIl54nD5372ToeTgEM3wDsINI
	 7v01ap/Vdj0nA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F346DC4166D;
	Sat, 29 Oct 2022 05:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/11] net: mtk_eth_soc: improve PCS implementation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166701961999.17481.10898142814821409044.git-patchwork-notify@kernel.org>
Date: Sat, 29 Oct 2022 05:00:19 +0000
References: <Y1qDMw+DJLAJHT40@shell.armlinux.org.uk>
In-Reply-To: <Y1qDMw+DJLAJHT40@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_220026_087478_021B526A 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: netdev@vger.kernel.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, edumazet@google.com, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 27 Oct 2022 14:10:11 +0100 you wrote:
> Hi,
> 
> As a result of invesigations from Frank Wunderlich, we know a lot more
> about the Mediatek "SGMII" PCS block, and can implement the PCS support
> correctly. This series achieves that, and Frank has tested the final
> result and reports that it works for him. The series could do with
> further testing by others, but I suspect that is unlikely to happen
> until it is merged based on past performances with this driver.
> 
> [...]

Here is the summary with links:
  - [net-next,01/11] net: phylink: add phylink_get_link_timer_ns() helper
    https://git.kernel.org/netdev/net-next/c/9c5a170677c3
  - [net-next,02/11] net: mtk_eth_soc: add definitions for PCS
    https://git.kernel.org/netdev/net-next/c/b6a709cb51f7
  - [net-next,03/11] net: mtk_eth_soc: eliminate unnecessary error handling
    https://git.kernel.org/netdev/net-next/c/5cf7797526ee
  - [net-next,04/11] net: mtk_eth_soc: add pcs_get_state() implementation
    https://git.kernel.org/netdev/net-next/c/c000dca09800
  - [net-next,05/11] net: mtk_eth_soc: convert mtk_sgmii to use regmap_update_bits()
    https://git.kernel.org/netdev/net-next/c/0d2351dc2768
  - [net-next,06/11] net: mtk_eth_soc: add out of band forcing of speed and duplex in pcs_link_up
    https://git.kernel.org/netdev/net-next/c/12198c3a410f
  - [net-next,07/11] net: mtk_eth_soc: move PHY power up
    https://git.kernel.org/netdev/net-next/c/6f38fffe2179
  - [net-next,08/11] net: mtk_eth_soc: move interface speed selection
    https://git.kernel.org/netdev/net-next/c/f752c0df13df
  - [net-next,09/11] net: mtk_eth_soc: add advertisement programming
    https://git.kernel.org/netdev/net-next/c/c125c66ea71b
  - [net-next,10/11] net: mtk_eth_soc: move and correct link timer programming
    https://git.kernel.org/netdev/net-next/c/3027d89f8770
  - [net-next,11/11] net: mtk_eth_soc: add support for in-band 802.3z negotiation
    https://git.kernel.org/netdev/net-next/c/81b0f12a2a8a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




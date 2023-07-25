Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77723C001DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1SDSY7aGI6OGDdud9g0atU5nFoCMmKzPxt8uBZzbjI=; b=busD6vnGUEcAykRSjENKlbAowF
	6srMubhV/+WpMvI9mERvuoEq9cjMPr3fYMf1k9Nj0x/N75LCGUyHXGYpt9tadZtXOCr9Q7a4KtrgS
	dcDm5nIov56bYqrQP9Vluxf2FQESPUxYBRw8phvg6VVQr11PWePafARyxJn0oA36lcOZaH19+qWLy
	0vNW2tHwStBxvgtJJ1LA3eIJNFU5c4cXu2a3l/ryYfLNYo6iPcihV+jNv8stjLTX6pB/wepFYUFm/
	pu4TPFP8DNXNcmRkYV9hHQpaCQldsxhDYmMFcMI1TvwUv12Qt/eoPNm8FJfIrErf7B+dWjhF32bDD
	qkf0nhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOHo6-007bBu-1Z;
	Tue, 25 Jul 2023 13:10:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOHo1-007bAR-2N;
	Tue, 25 Jul 2023 13:10:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D4E161719;
	Tue, 25 Jul 2023 13:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A8D2C433C7;
	Tue, 25 Jul 2023 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690290622;
	bh=qMzggPT3twoGjwJ/BKYGaRiJYeGvR8ele0FPF405ljQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hDtO2dyOy9fCjJ3qTn2MLgiOA6ry1q6EoJglfOH6QXfqSpz/DS8U+faBxB+83cHRL
	 aIubAgQ7JWEv/8ExC/5V791UjpQMZ98c/bu6TtPV729ZXuXHucQRZ7o0U8uGHrxf4y
	 4ZNzfMh2msexGBXhoZW9xi8sPzvmOjQ75NRbbmAvCZ5D3ZH/bIxews7iD++Bz6t0EN
	 D9QwvfELI7VnOV43QK6V9DD/rqKN+ETAQxDpPdF2jvrhgGn6gc0UiraN0HZnDRJG3G
	 STnia2WTIXV83GyJvDvweUFhS9o/QTTszIjk/3UapfNbvzNHQDIfuZzhEoT14JokCX
	 vNsgJJDQmg6eg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 37CE5C4166D;
	Tue, 25 Jul 2023 13:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/4] Remove legacy phylink behaviour
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169029062222.12684.2359979941607233325.git-patchwork-notify@kernel.org>
Date: Tue, 25 Jul 2023 13:10:22 +0000
References: <ZLw8DoRskRXLQK37@shell.armlinux.org.uk>
In-Reply-To: <ZLw8DoRskRXLQK37@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_061025_818606_643280E0 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: andrew@lunn.ch, pabeni@redhat.com, netdev@vger.kernel.org, arinc.unal@arinc9.com, linux-mediatek@lists.infradead.org, daniel@makrotopia.org, Mark-MC.Lee@mediatek.com, edumazet@google.com, john@phrozen.org, linux-arm-kernel@lists.infradead.org, sean.wang@mediatek.com, nbd@nbd.name, matthias.bgg@gmail.com, kuba@kernel.org, angelogioacchino.delregno@collabora.com, lorenzo@kernel.org, davem@davemloft.net, dwmw@amazon.co.uk, hkallweit1@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 22 Jul 2023 21:29:02 +0100 you wrote:
> Hi,
> 
> This series removes the - as far as I can tell - unreachable code in
> mtk_eth_soc that relies upon legacy phylink behaviour, and then removes
> the support in phylink for this legacy behaviour.
> 
> Patch 1 removes the clocking configuration from mtk_eth_soc for non-
> TRGMII, non-serdes based interface modes, and disables those interface
> modes prior to phylink configuration.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] net: ethernet: mtk_eth_soc: remove incorrect PLL configuration
    https://git.kernel.org/netdev/net-next/c/76a4cb755cf9
  - [net-next,v2,2/4] net: ethernet: mtk_eth_soc: remove mac_pcs_get_state and modernise
    https://git.kernel.org/netdev/net-next/c/28e1737d2544
  - [net-next,v2,3/4] net: phylink: strip out pre-March 2020 legacy code
    https://git.kernel.org/netdev/net-next/c/4d72c3bb60dd
  - [net-next,v2,4/4] net: phylink: explicitly invalidate link_state members in mac_config
    https://git.kernel.org/netdev/net-next/c/c5714f68a76b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




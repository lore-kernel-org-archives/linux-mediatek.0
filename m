Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67EFC761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eo9b3BF5HgiZiQkVEpKdwPxivqQabsniWjd04CVIHb4=; b=mB87ZoCDDn5lhR4lncpu14qYoZ
	oJV3YqXqn7YyIKRW1WVjnhNTpYfh60Q5PgCUlNAgEOcHz13GzQszGKpyN+tjFz3kn5dshAG2WhJGm
	ztLzJSMh6UDGUvOwR3ASobuwSzhUX7DC+omm9eTzZ8dR/0Lvc52BeQiMQKmvQalFYnTXs+vM8ri0f
	npecUpzEh8NsAGRoF2p3akhIhnFlr/NqAe0lgMdKgL6J4oY8gMy9+H1X89now4YmSmVhniAaYQ4TD
	Chp3eh/vtC/fWoinzC/IPk/9AUgOtaxW1yBDkNgOqN9O+NnKG2WgZIi837zkQG/puj8avVLGgAF46
	IahgXNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGMa-00EgYW-31;
	Mon, 03 Apr 2023 09:20:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGMW-00EgV3-0z;
	Mon, 03 Apr 2023 09:20:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DC1B6172E;
	Mon,  3 Apr 2023 09:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E8FDC433A1;
	Mon,  3 Apr 2023 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680513625;
	bh=HOvs3Az/e1R8EGkt90B9hBsreIGgQ7JOuGysC4UKjs0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a4vvq4tiYCIbHg8kEzXlq4iWWS2DhfthAnJuWPrZyDRH0+2b4YnfiMd+B/2XpruM7
	 9nnvvXRFJpL3ShmpilVGF/FPGxFgJeOThfVa7qxhTYYkAjybc8UvOq1joWCbiPOO8o
	 JUdSB6BxwtbLRevsjrsRsx9CzrWG4yLc1lNMihPr8AOCik2//7cxJ9qT/CJyZjNiIg
	 e/9IOSmyRl0vfPnzTygQLHhdL6CgEiMcHznrgEiA8D6ySPR8pSn77K634pL3rpAsjw
	 YoPpa3xsYaj6mSMWyJnMNKxi7Ub52C+ZBXV9TUIhLkc9QzKIorMv6ZcmMbLXXA+gdp
	 dcYhpfsGP7x5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4C1D9E5EA84;
	Mon,  3 Apr 2023 09:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/14] net: dsa: add support for MT7988
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168051362530.15794.2568241679390947127.git-patchwork-notify@kernel.org>
Date: Mon, 03 Apr 2023 09:20:25 +0000
References: <cover.1680483895.git.daniel@makrotopia.org>
In-Reply-To: <cover.1680483895.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sean.wang@mediatek.com,
 Landen.Chao@mediatek.com, dqfext@gmail.com, p.zabel@pengutronix.de,
 linux@armlinux.org.uk, arinc.unal@arinc9.com, Sam.Shih@mediatek.com,
 lorenzo@kernel.org, john@phrozen.org, nbd@nbd.name
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_022028_421228_569A195E 
X-CRM114-Status: GOOD (  14.39  )
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
by David S. Miller <davem@davemloft.net>:

On Mon, 3 Apr 2023 02:16:40 +0100 you wrote:
> The MediaTek MT7988 SoC comes with a built-in switch very similar to
> previous MT7530 and MT7531. However, the switch address space is mapped
> into the SoCs memory space rather than being connected via MDIO.
> Using MMIO simplifies register access and also removes the need for a bus
> lock, and for that reason also makes interrupt handling more light-weight.
> 
> Note that this is different from previous SoCs like MT7621 and MT7623N
> which also came with an integrated MT7530-like switch which yet had to be
> accessed via MDIO.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/14] net: dsa: mt7530: make some noise if register read fails
    https://git.kernel.org/netdev/net-next/c/b6f56cddb5f5
  - [net-next,v2,02/14] net: dsa: mt7530: refactor SGMII PCS creation
    https://git.kernel.org/netdev/net-next/c/9ecc00164dc2
  - [net-next,v2,03/14] net: dsa: mt7530: use unlocked regmap accessors
    https://git.kernel.org/netdev/net-next/c/1bd099c49f65
  - [net-next,v2,04/14] net: dsa: mt7530: use regmap to access switch register space
    https://git.kernel.org/netdev/net-next/c/a08c045580e0
  - [net-next,v2,05/14] net: dsa: mt7530: move SGMII PCS creation to mt7530_probe function
    https://git.kernel.org/netdev/net-next/c/6de285229773
  - [net-next,v2,06/14] net: dsa: mt7530: introduce mutex helpers
    https://git.kernel.org/netdev/net-next/c/1557c679f71c
  - [net-next,v2,07/14] net: dsa: mt7530: move p5_intf_modes() function to mt7530.c
    https://git.kernel.org/netdev/net-next/c/25d15dee34a1
  - [net-next,v2,08/14] net: dsa: mt7530: introduce mt7530_probe_common helper function
    https://git.kernel.org/netdev/net-next/c/37c9c0d8d0b2
  - [net-next,v2,09/14] net: dsa: mt7530: introduce mt7530_remove_common helper function
    https://git.kernel.org/netdev/net-next/c/720d73635176
  - [net-next,v2,10/14] net: dsa: mt7530: split-off common parts from mt7531_setup
    https://git.kernel.org/netdev/net-next/c/7f54cc9772ce
  - [net-next,v2,11/14] net: dsa: mt7530: introduce separate MDIO driver
    https://git.kernel.org/netdev/net-next/c/cb675afcddbb
  - [net-next,v2,12/14] net: dsa: mt7530: skip locking if MDIO bus isn't present
    https://git.kernel.org/netdev/net-next/c/54d4147a121c
  - [net-next,v2,13/14] net: dsa: mt7530: introduce driver for MT7988 built-in switch
    https://git.kernel.org/netdev/net-next/c/110c18bfed41
  - [net-next,v2,14/14] dt-bindings: net: dsa: mediatek,mt7530: add mediatek,mt7988-switch
    https://git.kernel.org/netdev/net-next/c/386f5fc9061b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




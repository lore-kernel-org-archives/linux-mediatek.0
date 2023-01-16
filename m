Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E126C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 18:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpsCuKScbGv9KDi63xpo4EgQlANXQhiJ1+7KADHQw9w=; b=YdyYC6Yh3Rulq9QDpdeqGDv78Z
	79/Q4BCjH7RfTPfJZaZMa65DqLPKNXW339iFOyUzEBGSl/m37UNOkcXw7+0TBOU3SvFKHpOP69KQ1
	ZhlUxS6KltYkPFaD0EXLCktaMQEdREcgUg9A1FlMerTq3Iql3owlq43CqyzPiwCyGssH9bc/f4iW1
	kAIzsZupDdImZpyTEw3k60ZQ4J36zJkoBmuLafjGgAH1h2OjqvJyYyaZQx0PFX4/xD3vlXgfI40mA
	zRC2tpqCv0Dj9PTMkUJZM1LT5maNTDvPA9kUulevM3HHxxNOpoaaHDYQDbxGEKUh0TG5fHccFXqEx
	t2k5IhxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHUYy-00BlZT-RJ; Mon, 16 Jan 2023 18:50:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHUYn-00BlXT-M7; Mon, 16 Jan 2023 18:50:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 38AE9B810BD;
	Mon, 16 Jan 2023 18:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7244C433F0;
	Mon, 16 Jan 2023 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673895018;
	bh=Ek2S+o7lX4iOW9OiFwEK+MWyfVIXlWFpJHWnHVuYrDw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=t6D9OIMxwQdk6gtG2QHP0B/o7FutF5hSWBI3v9Iqp8xS2LzithpsUQkQGXHxmUkwf
	 hLAqQhsh+loB1B97AyuldCp9ka24NI86Zt2w45AHpDmiAxox1CVV1sHf7PC9drc18i
	 5LbHVV4fopBWa/dLxvbuIdue63zr5cHtL8bGxcqaSOuAk8K3Y3jAi1oRiV/mnwb0jw
	 GljDxwT4WsCQmrLYZDRx4KK2Y6pwfw/63tP2JO91YgZ+Y4hMD6A0VRPnCbqkIKcK14
	 ae+NmLEaYzY8YeS8JUx7hpKq+BHyu36iZv6aj6lXYNx+3zLMoDFo70c64W8mhEBte7
	 iWVTwEMR/BH1Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA0AEE54D26;
	Mon, 16 Jan 2023 18:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 net-next 00/10] dt-binding preparation for ocelot switches
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167389501875.8578.15890444041722037565.git-patchwork-notify@kernel.org>
Date: Mon, 16 Jan 2023 18:50:18 +0000
References: <20230112175613.18211-1-colin.foster@in-advantage.com>
In-Reply-To: <20230112175613.18211-1-colin.foster@in-advantage.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, john@phrozen.org,
 alexandre.belloni@bootlin.com, claudiu.manoil@nxp.com, marex@denx.de,
 sean.wang@mediatek.com, dqfext@gmail.com, Landen.Chao@mediatek.com,
 arinc.unal@arinc9.com, clement.leger@bootlin.com, alsi@bang-olufsen.dk,
 linus.walleij@linaro.org, UNGLinuxDriver@microchip.com,
 woojung.huh@microchip.com, matthias.bgg@gmail.com, kurt@linutronix.de,
 robh+dt@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, olteanv@gmail.com, f.fainelli@gmail.com, andrew@lunn.ch,
 george.mccollister@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_105022_060046_440AD1F0 
X-CRM114-Status: GOOD (  11.24  )
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
by David S. Miller <davem@davemloft.net>:

On Thu, 12 Jan 2023 07:56:03 -1000 you wrote:
> Ocelot switches have the abilitiy to be used internally via
> memory-mapped IO or externally via SPI or PCIe. This brings up issues
> for documentation, where the same chip might be accessed internally in a
> switchdev manner, or externally in a DSA configuration. This patch set
> is perparation to bring DSA functionality to the VSC7512, utilizing as
> much as possible with an almost identical VSC7514 chip.
> 
> [...]

Here is the summary with links:
  - [v7,net-next,01/10] dt-bindings: dsa: sync with maintainers
    https://git.kernel.org/netdev/net-next/c/4015dfce2fe7
  - [v7,net-next,02/10] dt-bindings: net: dsa: sf2: fix brcm,use-bcm-hdr documentation
    https://git.kernel.org/netdev/net-next/c/afdc0aab4972
  - [v7,net-next,03/10] dt-bindings: net: dsa: qca8k: remove address-cells and size-cells from switch node
    https://git.kernel.org/netdev/net-next/c/54890925f2a4
  - [v7,net-next,04/10] dt-bindings: net: dsa: utilize base definitions for standard dsa switches
    https://git.kernel.org/netdev/net-next/c/3cec368a8bec
  - [v7,net-next,05/10] dt-bindings: net: dsa: allow additional ethernet-port properties
    https://git.kernel.org/netdev/net-next/c/16401cdb08f0
  - [v7,net-next,06/10] dt-bindings: net: dsa: qca8k: utilize shared dsa.yaml
    https://git.kernel.org/netdev/net-next/c/956826446e3a
  - [v7,net-next,07/10] dt-bindings: net: dsa: mediatek,mt7530: remove unnecessary dsa-port reference
    https://git.kernel.org/netdev/net-next/c/000bd2af9dce
  - [v7,net-next,08/10] dt-bindings: net: add generic ethernet-switch
    https://git.kernel.org/netdev/net-next/c/7f5bccc8b6f8
  - [v7,net-next,09/10] dt-bindings: net: add generic ethernet-switch-port binding
    https://git.kernel.org/netdev/net-next/c/68e3e3be66bc
  - [v7,net-next,10/10] dt-bindings: net: mscc,vsc7514-switch: utilize generic ethernet-switch.yaml
    https://git.kernel.org/netdev/net-next/c/1f4d4ad677c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




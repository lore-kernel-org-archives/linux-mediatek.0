Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8F3C05027
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Jan 2023 02:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGFfGpKxRAKovzkQlrQEOOoL3fm0R+9cG2GbrYqJYUE=; b=NTEIGKXJ8/JH2p0V9eM2I8iLa+
	eaXaFImQE4a7Lec2aVHkPCEq4BTGJ6dB6UH7w1MRrmmnIq208bwuBOaMZbae37kZNEqbMOMMuMfUp
	s+R0JVSkW7LGQQ96OPfeDdrmoNIAwp1IX26416UuOR9WiWAxQ6PqCiq6z92Ljg2j3FxHTmLP3S+iz
	ckdX++ymV4utxl2KsbtQN2eTqyc+V9n+PWZzDAdl5Jo7wZOCwJYbhnvvj6vgVSw5+Dwg4R1RkzGPk
	0P/Oaa0pyGQl6HzrozQ2sYU8Yhmm90I/Vx3r4+XHcPn70aTpRdtKif8deTPOvMgv4oCOAkH7wsorJ
	J1zrRmLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJ3Uf-00D1SE-R9; Sat, 21 Jan 2023 02:20:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJ3UU-00D1Oh-8J; Sat, 21 Jan 2023 02:20:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 44062B82B66;
	Sat, 21 Jan 2023 02:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6920C433A0;
	Sat, 21 Jan 2023 02:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674267617;
	bh=y7M014lk2ucYfpZYK7TqpOQMfKJdndxwV/Xbmbc3ajM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CnDdZvkIowhY0c5wUZf47RObO9PPZANK2I1QmDStTRJAHmY9doWdiHtZb1FqVl6+B
	 jlMiFNhigYJ3pwux+rrfhM0uzWUzGkM8ho7OAsX2WrqpsyL/akeHYXEAktPwQep3C7
	 lyOMT6SnVOP8pvekYptS0RE9CYHj4ODIvjMivZuZL0lcdhi5tR9HJl5HKSkt6WI8Wo
	 IGyi4/0uxcFxt3LD/51/05EY8YwL5BnYO7iaeHrQad97ZPtyRK9u4257ZuLJ55ji/m
	 RKB1zTEcvGI/a+Le7ssOPUX9OVWImRXhWZAo5Wt2VY+5/a5KWSQmmxJE/1gTwxZqCW
	 qOzjEI8CtoV2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBB08C04E34;
	Sat, 21 Jan 2023 02:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND net-next 0/4] net: mdio: Remove support for building
 C45 muxed addresses
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167426761776.30830.16011679653553684585.git-patchwork-notify@kernel.org>
Date: Sat, 21 Jan 2023 02:20:17 +0000
References: <20230119130700.440601-1-michael@walle.cc>
In-Reply-To: <20230119130700.440601-1-michael@walle.cc>
To: Michael Walle <michael@walle.cc>
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch,
 f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 clement.leger@bootlin.com, afaerber@suse.de, mani@kernel.org, nbd@nbd.name,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, matthias.bgg@gmail.com, wellslutw@gmail.com,
 jiawenwu@trustnetic.com, mengyuanlou@net-swift.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, tobias@waldekranz.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_182022_486078_1458CCD6 
X-CRM114-Status: UNSURE (   9.66  )
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

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 19 Jan 2023 14:06:56 +0100 you wrote:
> [Russell told me that his mailserver rejected my mail because of
> an ill-formated "To:" header. Resending now with plain git-send-email
> instead of b4 send.]
> 
> I've picked this older series from Andrew up and rebased it onto
> the latest net-next.
> 
> [...]

Here is the summary with links:
  - [RESEND,net-next,1/4] net: phy: Remove fallback to old C45 method
    https://git.kernel.org/netdev/net-next/c/db1a63aed89c
  - [RESEND,net-next,2/4] net: ngbe: Drop mdiobus_c45_regad()
    https://git.kernel.org/netdev/net-next/c/45d564bf3625
  - [RESEND,net-next,3/4] net: Remove C45 check in C22 only MDIO bus drivers
    https://git.kernel.org/netdev/net-next/c/660a57046035
  - [RESEND,net-next,4/4] net: mdio: Remove support for building C45 muxed addresses
    https://git.kernel.org/netdev/net-next/c/99d5fe9c7f3d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBA0C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 01:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pgOYfGYIeLUJmAVFwtWJFRI20wQT1uozkRhlHVN1U4=; b=IWQnCBaoG7rCA4FoudSgbSIPCy
	B0dDcorReCVhR6jFRzJUtZSKUaKwzxpHruhbjajs5Aqp9heiP8LK5FLU00cChFtsB16qHGe1rA9G5
	UaW8c6u7kNQ2m9GYCCEDr9viWNZR+PmpEhrYy9V7qsGNgjwwj3kiAYl1l6awSZaIcJwZppihD0cCG
	+CyBfxQ1rQQtlPgvAtvOUsbFCkjq1lf3984jmlF3q4WaD6TI+N+DqhCoCrpe6t2sAxplQWjM2y7pF
	Xz438BxHj4IFi5GsHBcS2WS2mgeU8oFhE8Kgz27U6RuQWV14maFPoouZaR9KgqxOoeXe4HU84g+bA
	RYoAU6Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaRmU-00GuPL-SA; Tue, 20 Sep 2022 01:10:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaRmK-00GuMm-2s; Tue, 20 Sep 2022 01:10:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 913E661FFF;
	Tue, 20 Sep 2022 01:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F087CC43141;
	Tue, 20 Sep 2022 01:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663636221;
	bh=07EGYIZem37aOD6C4g6/dH8R2h8ek3SLzRXEZJcQ2wI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VaSPe2qkwOl9/mi+9t5oU7OsiIYCx0w4SgeYPY6UyZWM4dhDqzfh1J3VxmUc05MNv
	 U9ehkpHBrRnD+pLjF/Q4ZkzBHQGRVqREuff92UAHwY6jN68iEQWLFv58dxdT+JpwkG
	 Mnc9MBjnE2FTsRLwDT9unG3ExpurCQ06UR1RG2WgF0EBU8kkHJqvXVtokJFEC0riin
	 OIm01kGKAqH+LjMPiQToVQct55U4kM2lyxJw9oG7B9NtTufX5W8g0rylkxGVijZV4b
	 Mm4Y+kjNplFUG8r1DIjTbLHQfsewt4GO9qyMl73bg43xwr3BvRvb37OQlJuu4hIq5a
	 UK2pXGLhigv+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D173CE52537;
	Tue, 20 Sep 2022 01:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] Remove label = "cpu" from DSA dt-bindings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166363622085.23429.2523783707495550803.git-patchwork-notify@kernel.org>
Date: Tue, 20 Sep 2022 01:10:20 +0000
References: <20220912175058.280386-1-vladimir.oltean@nxp.com>
In-Reply-To: <20220912175058.280386-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@gmail.com,
 f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, george.mccollister@gmail.com,
 kurt@linutronix.de, matthias.bgg@gmail.com, woojung.huh@microchip.com,
 UNGLinuxDriver@microchip.com, linus.walleij@linaro.org, alsi@bang-olufsen.dk,
 clement.leger@bootlin.com, arinc.unal@arinc9.com, Landen.Chao@mediatek.com,
 dqfext@gmail.com, sean.wang@mediatek.com, marex@denx.de, john@phrozen.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_181024_207450_4BA59739 
X-CRM114-Status: GOOD (  10.91  )
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

On Mon, 12 Sep 2022 20:50:55 +0300 you wrote:
> As explained in more detail in patch 1/3, label = "cpu" is not part of
> DSA's device tree bindings, yet we have some checks in the dt-schema for
> mt7530 which are written as if it was.
> 
> Reformulate those checks, and remove all occurrences of this seemingly
> used, but actually unused, property from the binding examples.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] dt-bindings: net: dsa: mt7530: replace label = "cpu" with proper checks
    https://git.kernel.org/netdev/net-next/c/3f301a280078
  - [net-next,2/3] dt-bindings: net: dsa: mt7530: stop requiring phy-mode on CPU ports
    https://git.kernel.org/netdev/net-next/c/cdd3e486d705
  - [net-next,3/3] dt-bindings: net: dsa: remove label = "cpu" from examples
    https://git.kernel.org/netdev/net-next/c/9cc115d8d6f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E6DCE79AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 09:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60/fSnFy7ZsvjsyAgFSsC7W5HooeLTAfk9EwYv3ZC3o=; b=bKmUd6vrnMG7mdeZ0j2wGXAGO4
	Up0uu3YP0VeS4VbOlIjpzs2kk3bZEKMPwQw8dATTXdPka2CXqNT/B60kCfHbfKC9KomsU9uQKN8zJ
	7qQKCfhSsppxqvgiHP6s/k3JDhPUxbJr86LpxvU+4/i39ogkhKqwh1ekkuyqgYE2ELLxYWs2wFKlD
	+rTDCTcURPUKKJ8ViBFu6Rz8TWv8uo9jVclarSByP9nFchTe+QApdeWDAjxjspT92XAy1ct2pKcYI
	ck9HCrFIQ7pXiNcfu9FLvuoZWzz89aSbbiz0DtVvmFf3uehhkGFmgWmfw9q/4exnJItdlDFJuZwJd
	AFhGzndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qitXV-002TFc-36;
	Wed, 20 Sep 2023 09:30:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qitXS-002TE2-2n;
	Wed, 20 Sep 2023 09:30:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 76269B81C89;
	Wed, 20 Sep 2023 09:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AC41C433C7;
	Wed, 20 Sep 2023 09:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695202224;
	bh=vC4eUrsH2Ay5ObH877X6wC9knycta7WDqSvROcgL6fI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RFg/orxs2Kk0ttJSiyrFNgDcPf6uXKdR9qYWcJZhrsFgLFMD2t5hkzlLer0pEUHRG
	 38oaWA1Ew/74EQZDulmnFruZ0siVlC9QJDI0yX4P3yb/hyR6Nw4tUhQyiJ7OlTeNLF
	 s/H7JqPZ4G65Ys8NrfNDxyegdZlqTkLHXMWEPs7zbQQD8o3Jj6vlPMDIBrVNC/hrWv
	 iAnPlVvVy77iPtjgjnyv8dA6tKel0eKzdSUsR1tvUxZZgrWmZXgK5HEILlrf2rm02m
	 QRzXJWZWCFNmDs9xfIYPB1g3MsurPFUQORgYl0QLHau1fwZV6rbaSyooEesmBh9z29
	 quvxmeYUTmbGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EE09FC561EE;
	Wed, 20 Sep 2023 09:30:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/9] net: dsa: Convert to platform remove callback
 returning void
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169520222397.8158.5375930289513597156.git-patchwork-notify@kernel.org>
Date: Wed, 20 Sep 2023 09:30:23 +0000
References: <20230918191916.1299418-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230918191916.1299418-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: florian.fainelli@broadcom.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 kurt@linutronix.de, f.fainelli@gmail.com, hauke@hauke-m.de,
 arinc.unal@arinc9.com, daniel@makrotopia.org, Landen.Chao@mediatek.com,
 dqfext@gmail.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 colin.foster@in-advantage.com, vladimir.oltean@nxp.com,
 claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com,
 UNGLinuxDriver@microchip.com, linus.walleij@linaro.org, alsi@bang-olufsen.dk,
 clement.leger@bootlin.com, netdev@vger.kernel.org, kernel@pengutronix.de,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_023031_177563_F07B4E8A 
X-CRM114-Status: GOOD (  10.89  )
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

On Mon, 18 Sep 2023 21:19:07 +0200 you wrote:
> Hello,
> 
> this series converts all platform drivers below drivers/net/dsa to use
> remove_new. The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
> 
> [...]

Here is the summary with links:
  - [net-next,1/9] net: dsa: b53: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/c306171d6914
  - [net-next,2/9] net: dsa: bcm_sf2: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/75f5205f1dd8
  - [net-next,3/9] net: dsa: hirschmann: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/beb8592d0416
  - [net-next,4/9] net: dsa: lantiq_gswip: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/a59f960c4d10
  - [net-next,5/9] net: dsa: mt7530: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/9764bbad3d33
  - [net-next,6/9] net: dsa: ocelot: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/68ace16ce330
  - [net-next,7/9] net: dsa: realtek: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/d48a5472b8f2
  - [net-next,8/9] net: dsa: rzn1_a5psw: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/76be075d7f99
  - [net-next,9/9] net: dsa: vitesse-vsc73xx: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/ce322d45683f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




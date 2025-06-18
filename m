Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01262C71136
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 01:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYv0Lur8E97sb2QuHlsSSGh9x671eSUeTz28YUFJkJA=; b=k5TRO8GplU8K/k2EmViYVvJUlK
	9Gy+P65kNN2L1mrJEAzWg3IHyhc5ly758Yer1lmBevi4cGoJXEtQYHXphZJcHrkSjLVpGulPBWz8Q
	MtcNHlu/IlWKnU3duzKYw49g7dbR/ePMCrfPPA1NNjdg0lrJVHju+SUYu2U79o9fQwLLBQUGLW/ui
	5h9IahlZq/hWoj33cdzi7QwEzZ+zpB7J1HkESzlsneNAeZhwfB2Dg9pvNKKHlKSEeQtQe3mtrunfD
	sIbBFvAKPBXS80e1nf0Q+J2yoZXLdr1g/OPYHmShO36zM3232bdKawuvuA7iQGnmFugQ4X8ejLaoT
	/tRPNYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhq7-00000008mC5-3sFO;
	Wed, 18 Jun 2025 01:43:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhn8-00000008li1-3alz;
	Wed, 18 Jun 2025 01:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8496A629C5;
	Wed, 18 Jun 2025 01:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348C4C4CEF0;
	Wed, 18 Jun 2025 01:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750210841;
	bh=dWWHgiEt3tYWTZRgQm02U8aGJUCEgTY0w6sEmnkU+4s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dw/g8ufyu11VCbuMaNH4zZzsZdGQI+Frv2Bdhof0fbxSnVzrdeBylNSHvRJhDwibv
	 QD3nGymvb8a2VPn8/d/F+xH5C2fcdkUVNUfs9gBSYOYcnoBtQf/YiioPQ8qWhU/1Fi
	 /TwI0Cz59/BlnTyiC5q7u6K6bE2XF85SWcYyM4R8LcW5T8dAQ6pLOup1yl6nQK2rwo
	 tNb+jVEzw8TSsodBpO8MgA6c/kh20BoqSecflSaYFp9EDsbuguuuZnpJU8gCvFN5nQ
	 WmlL/8Ss+ex1zz0eLaE1Kz/w/ns6U8ZH+eTjGkqyptLL6PEMAm3kXr+3w1NQjjOHsu
	 npR4ZTWw/z2xg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADD338111DD;
	Wed, 18 Jun 2025 01:41:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/5] net: use new GPIO line value setter callbacks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175021086974.3761578.16857215533657509710.git-patchwork-notify@kernel.org>
Date: Wed, 18 Jun 2025 01:41:09 +0000
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, chester.a.unal@arinc9.com, daniel@makrotopia.org,
 dqfext@gmail.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, mkl@pengutronix.de,
 mailhol.vincent@wanadoo.fr, hkallweit1@gmail.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, bartosz.golaszewski@linaro.org
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
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Jun 2025 09:24:03 +0200 you wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips implemented under drivers/net/.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2,1/5] net: dsa: vsc73xx: use new GPIO line value setter callbacks
    https://git.kernel.org/netdev/net-next/c/c73832445bf2
  - [v2,2/5] net: dsa: mt7530: use new GPIO line value setter callbacks
    https://git.kernel.org/netdev/net-next/c/4a03562794a3
  - [v2,3/5] net: can: mcp251x: propagate the return value of mcp251x_spi_write()
    https://git.kernel.org/netdev/net-next/c/b9e3c7af9e4d
  - [v2,4/5] net: can: mcp251x: use new GPIO line value setter callbacks
    https://git.kernel.org/netdev/net-next/c/5d31311715b5
  - [v2,5/5] net: phy: qca807x: use new GPIO line value setter callbacks
    https://git.kernel.org/netdev/net-next/c/dea3be40464a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C254C04E69
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 05:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SouDmedxUrLS9Stt01WcKB5IMOWw+JcY80cyENVGls=; b=OdsBsNWe7pIh1LOVeDz4b4cMzP
	wY0djsbAXN+QaXRdPbXsxuQ47c24NzKZa57R5PlAU6umiOOjL+QGq9kugfSDOpy1+mscoeJddmOvq
	tfTdlrZbLP720jZXudK4fowr06ixTJTZBlKsWDyaXx0aNz8cn+6iRyGoQJU8VA+qD1PAuqW6tmKgn
	7nie7jFpdFRnBr+0veiHVGEnjs8XwRE3roM1s8v+5kXW6JjGmIVLSxPcW44tZEb9A0KXnR8Vcsj+4
	5MvZ7+HazETpYz4zr28EkQN4NVNGemnean1XSkGj0BBw8ONFEJo+HMVV98ypW4P7dOOiTvg5X6p52
	FAzDaq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOt76-00C8oe-2Q;
	Thu, 27 Jul 2023 05:00:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOt6u-00C8iN-0o;
	Thu, 27 Jul 2023 05:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD8DB61D44;
	Thu, 27 Jul 2023 05:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3E10C433D9;
	Thu, 27 Jul 2023 05:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690434021;
	bh=FFH1pgMbxUQkbi+W6prTc8hoMQARLRPlW3fqf2rZAL8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hU+QuS93JAT1VG0BV4/1vkXRtYNlsPiMDnZMIJMNrUGBhTQwago6dU7nrctIYJNce
	 zOamyaphbsrFVLn9XRR3pNzthZgCf8KNTCPxgAg/K64xZAp+LCTwa1Fp1RUczsxAaC
	 PeRFdbKCAIHS/R8PsiZB6QYO/nw9y4S9rsRENzQJrQwsekdtTrviTXA/QRHm0XGUaa
	 nIcvTNRsHXsB+MEfm14XY0IPxfIV/r4aNysr65kT4uQQAjV8HoE92Yq37Lz5gbaY5n
	 hhgTYhPkdLaRoR3WZSIDv68Pv5h3xUMRByCrFFPCvpoO5NE1/gnSO+8bOHHgl6A9NU
	 GRoBBxGMRj+Xw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8BBE9C59A4C;
	Thu, 27 Jul 2023 05:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: phy/pcs: Explicitly include correct DT includes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169043402156.24382.3029642693015868159.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jul 2023 05:00:21 +0000
References: <20230724211905.805665-1-robh@kernel.org>
In-Reply-To: <20230724211905.805665-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, daniel@makrotopia.org, dqfext@gmail.com,
 SkyLake.Huang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_220024_348412_68F04B03 
X-CRM114-Status: GOOD (  10.48  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 24 Jul 2023 15:19:05 -0600 you wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Here is the summary with links:
  - [v2] net: phy/pcs: Explicitly include correct DT includes
    https://git.kernel.org/netdev/net-next/c/ac3cb6de32b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




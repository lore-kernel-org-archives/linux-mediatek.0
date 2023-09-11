Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68705EEB59A
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 04:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZuTJ31wC8GTxI0thPiMiY4huZGwTKwuIdWq8E7VW9c=; b=1V1cIdmk+wajif4ZmeRTHsqDjK
	nfOGbR6QuGWKHURjJOQhAqxiAJQBij0xxBj529q0kng3IHc1jzkPXallP+T0IvgDaBXNpESZ5fA2Z
	FXPgg0dYBSH0o0RHafckthxuTBP7p9BK+kSV+msrd8JJd4BZPzHLKQ+Rvp4+LIwOjvT4D/9UcTPhf
	TGoopdZsew0Q3sVYKdtL+oyFEHH6myB7w8KGUG3AwdxldspPKDpLIA8nxKdB6U7fP/9s7/KptPAG8
	afChLONgtCmndx3x1R59weiGDgXlfqtXp9IUYCmB+lx9xvPnVyvtcVCMqsPzj08bMQMJBOSDaMeKe
	YFgs9zQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfYrE-00HEkk-0D;
	Mon, 11 Sep 2023 04:49:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfYr9-00HEjY-34;
	Mon, 11 Sep 2023 04:49:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5849160F16;
	Mon, 11 Sep 2023 04:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 593E7C43395;
	Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694407740;
	bh=4lLgVJb3LOG8DBSrlEzmuFBXuW0+M3lIby4bathQEJQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C6/eNd9fiXyxGRt5Q8ahEQOhSgCzOfaDjiTl1H8jdUB7+nyLMvI8Z8jnvHGjBdQ49
	 pDudL3FXplQYq7jTK8HLgIy9ITXlxnbVaDIU/4PMDDSn6qJkGjrWtox5bdK/GK3F5p
	 C4G4DS2Wf1CiQbnf16oHi2/OLxkMc9s/eBeQrSQGCwpUsCE1in9Is3GDGfvYRWlM/7
	 2tlXMXWIRD3zJvcrlFXk8QeGnir5Z0kGUyv09GiSS8f+5ARo1lX8qkv1qJbHYp6gz6
	 YuEAVFmOzlKTCXnu+2B+mWUy9DGN2PXOf9rTw2PXn8k2N7iypmSeDiYERSZBfuV9XL
	 EZljecptFgb1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3D213E21EC1;
	Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] pwm: Explicitly include correct DT includes
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <169440774024.22573.12945048122079663648.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 04:49:00 +0000
References: <20230714174852.4062251-1-robh@kernel.org>
In-Reply-To: <20230714174852.4062251-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, bleung@chromium.org, groeck@chromium.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, paul@crapouillou.net, vz@mleia.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, michael@walle.cc, orsonzhai@gmail.com,
 baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, hammerh0314@gmail.com,
 jonathanh@nvidia.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_214904_070000_DD0F28DB 
X-CRM114-Status: UNSURE (   9.90  )
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

This patch was applied to chrome-platform/linux.git (for-next)
by Thierry Reding <thierry.reding@gmail.com>:

On Fri, 14 Jul 2023 11:48:50 -0600 you wrote:
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
  - pwm: Explicitly include correct DT includes
    https://git.kernel.org/chrome-platform/c/0a41b0c5d97a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




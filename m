Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023FCEEB598
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 04:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0/0sXuRmoA1RrKN3+4DYpsF1M/X7wFATpN9wDVCQc8=; b=f8T1fxUQ52QEoUVPsPv4H76Rhr
	ypzdmDdNJzXzW/uEHWq+DKCfvU3aHOEVsLdqyvRCFbD8+Jz1fv8jc8Udvo25sH/WQRlGiTKCJ7Daq
	n9z9r0AR8xAbiXi5RkMViMdYHdQJ9e1Ewe8Gi2oNmNRBw6A/yD1XKWzQ9JYSyngrBz4mk3k96ciMh
	Qd61G6ZP34TCyyyCYKwJfKkfdQVJkTa28AjrEG8P91RhJ3qSfOQK+AHeNNYcwDhvfhTDrSFjzhWyt
	A4g/UUHvcfE+K1ORg3Xqz0pGaKG6yDM3LUR8Qr2aLQYZ1aD5LzfrmaOphpPxB+7MsVK7w6d9k2zra
	fBajCJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfYaU-00HDX2-0I;
	Mon, 11 Sep 2023 04:31:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfYaP-00HDUf-0a;
	Mon, 11 Sep 2023 04:31:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8297E60F0D;
	Mon, 11 Sep 2023 04:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DDE8C43395;
	Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694406700;
	bh=pbAerbSrA6wtl03zwwLTf0Gh4fXZYxeyY96kgyZ05tI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QIti3GvauOwy1aj9y3J9zF2jiDuygqmg43kCqbd3Kb3iSGIl+HvKtQm8IasA3LZiA
	 vsoi333PTEwbjLgLuxGTK9Ofia/GO6zyz5Xem8A62jAXUwzwW0wOpTREiXh0+V6QmC
	 zQ8q2/BqnZu3wZnsEWPxhLVrUwxNUHNYRXo7WS/Mc8P3GXG4ti/oPpVx/u9zDtQk0M
	 nHTf+l5re0BnfXig+WBfRsimMgWur9LEyd13k3og7giF6esJxMfrFbyR6ocBf8ltzL
	 /JivbD2fQyGr1NlX3mICqhzpPbEEXJJDhcwraJZP+bIXBtvPO/WVo+DgJ0fjy7CuJJ
	 OOQ4GoF5EI1BQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2FA91E21EC2;
	Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] pwm: Explicitly include correct DT includes
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <169440670019.22573.2422972280084635660.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 04:31:40 +0000
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
X-CRM114-CacheID: sfid-20230910_213145_279478_75136B74 
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

This patch was applied to chrome-platform/linux.git (for-kernelci)
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




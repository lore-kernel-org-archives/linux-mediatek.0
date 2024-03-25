Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA86C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 01:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtiZw7rjo+MXZ/zrxVgy0vyDkJM0sCKuNGZVL4HMIFM=; b=MrTPW/5JZasXM9mMZTqg34kjeU
	p7Avdq1hvWA6Wu1g6P3PoRX9LDOgaZ0/YS34FLgqimFDwNYZFjQT3CfXyloUNfcxJkx9+P7VwnaFd
	4SubHONcm7qp+JQePreCXSP5aZvxZQ/GDkqjmY0VINvXvmG7BjmetP4OuE8X23EVtWIuCFAwkhenj
	DvB1WOaD+zPrQmAemnBYtZo1NAWRZBEds3cO63yrHWmHBjmY6Nplm9DWoW+iEMAN5QLU84i9A96WJ
	x5OiA9MCpy4qeDGM8MKI3AeqVYFUUBhkmH7IJDbvMLalZLanRiHh+AlKAas1zuOoIDeqIXcO+yHLl
	xGvd+QlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZXr-0000000EVx4-0Kl5;
	Mon, 25 Mar 2024 01:54:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZXd-0000000EVpR-2OmA;
	Mon, 25 Mar 2024 01:54:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1BC060DC6;
	Mon, 25 Mar 2024 01:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70C87C433F1;
	Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711331662;
	bh=x6gbNWDUC3393woiAhRGtrXvkbgxFEKnVO43IWMARsU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jrPZZfZ03PsaQD3fMGm9nq2UPpPmNCR2UhRG5lEG5sj1PDjplq8FZ75Zbzq4M++fX
	 Q6TVSgOVQbUvhZzKhKOQNbQwhQhy2BZ8MRkhAIEF+3w0ilwV/nWxm1rjxE/qfP/Mr+
	 E3yc5dSuBNp0Bm1L/KI5QDwiA8kFCuNjxzWIU7cCRVNPOgSNBZV+qUtQOY4O/YoTDT
	 PFwCgNm3HEFcmI1zG6v/j47VLsywRsjUKgaIEweM6/K8U5bK1qRIu9RKHx/KjIcwnX
	 cAPddvxMuoVuFBd1hKdjXjkxNm2QAvn+OmyKHTZvNymrjm/TZ8YaQVQ3vy0XdpqBcO
	 88LTlEfD/nBQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59B24D2D0E0;
	Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 000/164] pwm: Improve lifetime tracking for pwm_chips
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171133166235.9916.5159550524752322105.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 01:54:22 +0000
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: linux-pwm@vger.kernel.org, corbet@lwn.net, Jonathan.Cameron@huawei.com,
 james.clark@arm.com, andriy.shevchenko@linux.intel.com, broonie@kernel.org,
 marcan@marcan.st, sven@svenpeter.dev, claudiu.beznea@tuxon.dev,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
 shc_work@mail.ru, bleung@chromium.org, p.zabel@pengutronix.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, paul@crapouillou.net,
 vz@mleia.com, mika.westerberg@linux.intel.com, andy@kernel.org,
 linus.walleij@linaro.org, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, j.neuschaefer@gmx.net, heiko@sntech.de,
 krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 mwalle@kernel.org, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
 zhang.lyra@gmail.com, fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, hammerh0314@gmail.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 sean.anderson@seco.com, michal.simek@amd.com, brgl@bgdev.pl,
 andrzej.hajda@intel.com, rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 pavel@ucw.cz, lee@kernel.org, quic_amelende@quicinc.com,
 quic_bjorande@quicinc.com, keescook@chromium.org, robh@kernel.org,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 kernel@pengutronix.de, linux-doc@vger.kernel.org, alyssa@rosenzweig.io,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 groeck@chromium.org, chrome-platform@lists.linux.dev, festevam@gmail.com,
 linux-imx@nxp.com, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mediatek@lists.infradead.org,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 dianders@chromium.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 gustavoars@kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_185425_925128_3D2B3FEB 
X-CRM114-Status: UNSURE (   8.91  )
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

This series was applied to chrome-platform/linux.git (for-kernelci)
by Uwe Kleine-König <u.kleine-koenig@pengutronix.de>:

On Wed, 14 Feb 2024 10:30:47 +0100 you wrote:
> Hello,
> 
> this is v6 of the series introducing better lifetime tracking for
> pwmchips that addresses (for now theoretic) lifetime issues of pwm
> chips. Addressing these is a necessary precondition to introduce chardev
> support for PWMs.
> 
> [...]

Here is the summary with links:
  - [v6,001/164] pwm: Provide an inline function to get the parent device of a given chip
    https://git.kernel.org/chrome-platform/c/4e59267c7a20
  - [v6,003/164] pwm: Provide pwmchip_alloc() function and a devm variant of it
    https://git.kernel.org/chrome-platform/c/024913dbf99f
  - [v6,029/164] pwm: cros-ec: Change prototype of helpers to prepare further changes
    https://git.kernel.org/chrome-platform/c/7256c2e79b8e
  - [v6,030/164] pwm: cros-ec: Make use of pwmchip_parent() accessor
    https://git.kernel.org/chrome-platform/c/19a568a8d3c4
  - [v6,031/164] pwm: cros-ec: Make use of devm_pwmchip_alloc() function
    https://git.kernel.org/chrome-platform/c/452be9421eda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




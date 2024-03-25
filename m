Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFCAC47DD9
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 02:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7HY/finGGu203QE4t7JoPh9OM+J0x46ktKrMD5GDsg=; b=bOLPlVoeHNWEOk3mChxW9Fmi6J
	ah42dflD0zvLH6vdgqAX/O6n6k7h38g+r8tj34m1gR6asJPnpg8K0GX1nyFAnlb0dYV/0MevMr0UE
	YznSESNIFb7YxBlVz2b1IAVN0ttxI32lm356ofE5IcQtypGhMS2euX0/v3W6XPpn2uNE1vaJx36R+
	w/fSFEEze3tW7Xco3pRCukbMkfQBwF+p75Dhc8ZsjFz29rl3WAse78rOaHy5KTxY9jRZNiIDGTaF7
	gwbVGi43SoQIl7mgSuAUZ8SFBqXJ12yeMKRxtnzpTwWXHz3Qr7PGmzt1+NWnsM1SA+KIJfhX3ZvRq
	xibAuajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZq1-0000000EbLb-17Ar;
	Mon, 25 Mar 2024 02:13:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZpm-0000000EbBI-2Rgk;
	Mon, 25 Mar 2024 02:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9561FCE0F95;
	Mon, 25 Mar 2024 02:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76189C43394;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711332787;
	bh=aJvg1KH6joFG6oJkgTHoc61lNEcN6UYDL94Kek/0h5A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bUL61oDb/M+5KYmdH9GZAQdZT3PYKaJ010SbGP/0QAETJ2gY+Rxd19+hfItokn4fc
	 qXm+5UshaVvnLaKO+h8US6GsQq7XoxEkTJDEVJIEaNCFv8M2uUBhoQrMAu3fisTCQo
	 B4fRFMNeMscSki123E/z54cBRXf+v5p5HhYpLJ3jJtc1OvR7VQslOwZ36RRz8NHOez
	 HFUH5lzzeG0rrZGBHCyr2OTeNZB2H2sILwj6OEqE53Bfd2qCAI/Z34pAg9I1JWd2Cn
	 dq/bNtJWoCPVpzv9DjBiOxvAIfXazxrFfLBNOkzXYWWq5P+zSQavVa4Lgiia++T7N2
	 7rjlBqvf/ljRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5AFA0D2D0E0;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 000/164] pwm: Improve lifetime tracking for pwm_chips
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171133278736.9916.5526869645378949035.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 02:13:07 +0000
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
X-CRM114-CacheID: sfid-20240324_191311_090999_62E107AD 
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

This series was applied to chrome-platform/linux.git (for-next)
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




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFB8FEA824
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UWiacNPqbTBMPSYg7bJTAWnfbMXH+FwDSMbsXyySBHg=; b=prYRUXnX2+GasGHnyJcPWdheL6
	ND+4ETe8QkR8oCvm27BqWcgM+5YeTNFWXyWZTeoKK/zeTSudNAhWJhP15z/5YNP8+sUKPAzO+7QCS
	Sa79Eb+OyfOXiZE1KVV133tqwQ7OsiXZfoNy+8Nd2WCdy4VPgf0i7McFpeOnBMY9UnhkF/7QPb1Ae
	gd5Q/JzngnqFyniyjlnPS8WQ8mUwEjDBNGy1dqY+0CSwAcWlKUidIdiym20Noffo4NzqJwAZQuemx
	I9yuAtJ9+SWcV1Y/MEzbJLequC7BvILX3L+5JJI/S0gwUe2MlIwNEDyvtrWV2jy9CU+HjZxvpSuhF
	f9a79zcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5L3i-0000000367O-3uZa;
	Wed, 25 Mar 2026 10:01:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5L3f-0000000366Y-0rw7;
	Wed, 25 Mar 2026 10:01:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 460AF600C4;
	Wed, 25 Mar 2026 10:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778C0C4CEF7;
	Wed, 25 Mar 2026 10:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774432910;
	bh=Q0y68Sh0drunIWBrbPQGi+mpNZ+3qNgyIEg6q1TJwSs=;
	h=From:To:Cc:Subject:Date:From;
	b=Do3onyXUBuQV8Yzx8HEV2pWDywWlNUTdMFucTiA8sKEuTSZvjsuXkZiBhYiQBaNmf
	 Y+iVbspzq7WTgkCMPSfxwxyi7w+7hHkkLLOB9NRbgED2iF9PPm2TNAPqZpTShZ53sF
	 n80ZlTQ/6JXPKKVXoqDZ8H5NPvaGXc0XJ4RPboju1yAO0nOEJLmcn0OigEXJsKfLJd
	 bwHdtB8hgcryXtQkHLLX4dIp1PBRGLb22la0NEWVU+BnEfVZYG3IL7V1b9s8fhDyPb
	 hoSezUtwX0s+IBr73BbBMYs53KjrQxvgNDQo6tgcpCPCM61TncIyZKAlTES5nR+Rbs
	 +3BSYEOXGF5vA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Yixun Lan <dlan@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] gpio: fix up CONFIG_OF dependencies
Date: Wed, 25 Mar 2026 11:01:14 +0100
Message-Id: <20260325100144.1696731-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

A number of GPIO drivers that used to have a CONFIG_OF_GPIO dependency now fail
to build on targets without CONFIG_OF:

WARNING: unmet direct dependencies detected for GPIO_SYSCON
  Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
  Selected by [y]:
  - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])

drivers/gpio/gpio-mt7621.c: In function 'mediatek_gpio_bank_probe':
drivers/gpio/gpio-mt7621.c:254:20: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
  254 |         rg->chip.gc.of_gpio_n_cells = 2;
      |                    ^
drivers/gpio/gpio-tegra186.c: In function 'tegra186_gpio_of_xlate':
drivers/gpio/gpio-tegra186.c:502:25: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
  502 |         if (WARN_ON(chip->of_gpio_n_cells < 2))
      |                         ^~
drivers/gpio/gpio-lpc32xx.c: In function 'lpc32xx_gpio_probe':
drivers/gpio/gpio-lpc32xx.c:523:49: error: 'struct gpio_chip' has no member named 'of_xlate'
  523 |                         lpc32xx_gpiochip[i].chip.of_xlate = lpc32xx_of_xlate;
      |                                                 ^
drivers/gpio/gpio-spacemit-k1.c: In function 'spacemit_gpio_add_bank':
drivers/gpio/gpio-spacemit-k1.c:234:11: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
  234 |         gc->of_gpio_n_cells     = 3;
      |           ^~

Bring that back as a dependency.

Fixes: 7803501e5754 ("gpio: drop unneeded Kconfig dependencies on OF_GPIO")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
There may be more fallout from the change, this is just what I found immediately,
but you could already fold the changes into the broken patch while I look
for additional ones.
---
 drivers/gpio/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e1e48e432133..bcb8ce89396c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -236,6 +236,7 @@ config GPIO_BRCMSTB
 	tristate "BRCMSTB GPIO support"
 	default y if (ARCH_BRCMSTB || BMIPS_GENERIC)
 	depends on ARCH_BRCMSTB || ARCH_BCM2835 || BMIPS_GENERIC || COMPILE_TEST
+	depends on OF
 	select GPIO_GENERIC
 	select IRQ_DOMAIN
 	help
@@ -450,6 +451,7 @@ config GPIO_LPC18XX
 config GPIO_LPC32XX
 	tristate "NXP LPC32XX GPIO support"
 	depends on ARCH_LPC32XX || COMPILE_TEST
+	depends on OF
 	help
 	  Select this option to enable GPIO driver for
 	  NXP LPC32XX devices.
@@ -492,6 +494,7 @@ config GPIO_MPC8XXX
 config GPIO_MT7621
 	bool "Mediatek MT7621 GPIO Support"
 	depends on SOC_MT7620 || SOC_MT7621 || COMPILE_TEST
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -632,6 +635,7 @@ config GPIO_RTD
 
 config GPIO_SAMA5D2_PIOBU
 	tristate "SAMA5D2 PIOBU GPIO support"
+	depends on OF
 	depends on MFD_SYSCON
 	depends on ARCH_AT91 || COMPILE_TEST
 	select GPIO_SYSCON
@@ -672,6 +676,7 @@ config GPIO_SNPS_CREG
 config GPIO_SPACEMIT_K1
 	tristate "SPACEMIT K1 GPIO support"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -737,6 +742,7 @@ config GPIO_TEGRA186
 	tristate "NVIDIA Tegra186 GPIO support"
 	default ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC
 	depends on ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || COMPILE_TEST
+	depends on OF
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
-- 
2.39.5



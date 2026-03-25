Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C54AFEA808
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 10:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnbQXF6DaQ8H6OaOkbjOR+F6C4UMnmifQBy/ewm+atQ=; b=OSfHr/M9UR8eYACApKxx4ixD3X
	qVQW+bZc0s66tDKK7ItRBa41m9sK0BeuEcGD9dhsCMO8O7m/O1msjnYRP8mzpmLmnGQYQR9LF8gvK
	j6ZBrPxtq/1lROLKtIYAobei04RmMl1AT6bPj9pbrYlvcWRr+N9VUxhMIgajpDY7lAumGdpa81k8B
	4mU9StLE7A5TekG4WV5HJ3H9IvE3QUVUK90ZuaNx3diIFCoeYXnHVeLtcoUKWYsfIwu5SjtRAeQ3O
	CSaoaB56TxdzhfLMC+mraIEY347AarD4um9fzkkyJQb4rqtXeQACxsgKNHBAIbiLJ7P9Zn4zcKhnj
	rjXqOsaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LWx-000000039lC-0stk;
	Wed, 25 Mar 2026 10:32:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LWu-000000039k6-3uDF
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 10:32:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52C3241A7C
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 10:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309D3C4CEF7
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434724;
	bh=ocM1mdWqdcmXzLcIYmHxofHeePVA9vqDrQenuhbw7uQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=rQsLCgURkLIEosDEkWhGLHl2g1Ra6qaeLKzy2cRqqnyXRcXcVKKwx3toJni6EMrux
	 2yTlCjJ/KdtIfr9nJlV3R9Uyw8RZjwSCEWZZ46F6kW+ognCmhXZTt+4caRkrSnV4pJ
	 g4EKHg7lADOkIJM8Zy429vK7uL9pAvIYddbYoRTRMs0BHYvdVDX9uYgNCxGUfYD9zg
	 KwaTmNGmGRK3/Fgg/iLtZ3V1Oeowegn1mvk53dgavo/7O2ptF2VSu4l/gEOC/UGQ10
	 b27HeM60vA3MAPu4GdjcQl6p8kfoIuA4k6Bdijgtvn3EOmXmoLIi8zD+zePRhB70dz
	 j8GibjkFw3IsQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so6769525e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 03:32:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOcB5gknpcxBUSc1dYYT28NXbXqVU4hygVkGzGzbUWXyqincj7qd5mHWdLf2Gqiy5rwzXIFPZwKa7zn/6TlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUD/9cOI/Njz7kMw41jSMZDqgCfF2OV9Pv+eUxQ4YxzwhmdgdY
	5DQibtX7w2BQbEVnFPgNPx+SX4Z+x4GCrlkDhdST01FwG+7p4oyM8xvNCsZgdwVVZjdTWdO3VoK
	P0BKmASIWY0l2UX9RH9kHaLe7VMgPv+xPerzrfzwhWg==
X-Received: by 2002:a05:6512:220f:b0:5a1:34a3:757f with SMTP id
 2adb3069b0e04-5a29b9958e6mr1037060e87.25.1774434722860; Wed, 25 Mar 2026
 03:32:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Mar 2026 03:32:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Mar 2026 03:32:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260325100144.1696731-1-arnd@kernel.org>
MIME-Version: 1.0
References: <20260325100144.1696731-1-arnd@kernel.org>
Date: Wed, 25 Mar 2026 03:32:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
X-Gm-Features: AaiRm53MDlZLZwdTwMSs-omwMVxdmGT3F6ltQ_Yfx4HD4BKPWevgMv5IzNZGH1g
Message-ID: <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Yixun Lan <dlan@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_033205_007983_FA7F3247 
X-CRM114-Status: GOOD (  19.76  )
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

On Wed, 25 Mar 2026 11:01:14 +0100, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> A number of GPIO drivers that used to have a CONFIG_OF_GPIO dependency now fail
> to build on targets without CONFIG_OF:
>
> WARNING: unmet direct dependencies detected for GPIO_SYSCON
>   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
>   Selected by [y]:
>   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
>
> drivers/gpio/gpio-mt7621.c: In function 'mediatek_gpio_bank_probe':
> drivers/gpio/gpio-mt7621.c:254:20: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
>   254 |         rg->chip.gc.of_gpio_n_cells = 2;
>       |                    ^
> drivers/gpio/gpio-tegra186.c: In function 'tegra186_gpio_of_xlate':
> drivers/gpio/gpio-tegra186.c:502:25: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
>   502 |         if (WARN_ON(chip->of_gpio_n_cells < 2))
>       |                         ^~
> drivers/gpio/gpio-lpc32xx.c: In function 'lpc32xx_gpio_probe':
> drivers/gpio/gpio-lpc32xx.c:523:49: error: 'struct gpio_chip' has no member named 'of_xlate'
>   523 |                         lpc32xx_gpiochip[i].chip.of_xlate = lpc32xx_of_xlate;
>       |                                                 ^
> drivers/gpio/gpio-spacemit-k1.c: In function 'spacemit_gpio_add_bank':
> drivers/gpio/gpio-spacemit-k1.c:234:11: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
>   234 |         gc->of_gpio_n_cells     = 3;
>       |           ^~
>
> Bring that back as a dependency.
>
> Fixes: 7803501e5754 ("gpio: drop unneeded Kconfig dependencies on OF_GPIO")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> There may be more fallout from the change, this is just what I found immediately,
> but you could already fold the changes into the broken patch while I look
> for additional ones.
> ---

Thanks and sorry for the breakage. However, I'm wondering if it wouldn't make
sense to do the following:

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 17511434ed077..ce0e0df68dbaa 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -473,7 +473,6 @@ struct gpio_chip {
 	struct gpio_irq_chip irq;
 #endif /* CONFIG_GPIOLIB_IRQCHIP */

-#if defined(CONFIG_OF_GPIO)
 	/*
 	 * If CONFIG_OF_GPIO is enabled, then all GPIO controllers described in
 	 * the device tree automatically may have an OF translation
@@ -516,7 +515,6 @@ struct gpio_chip {
 	 */
 	int (*of_xlate)(struct gpio_chip *gc,
 			const struct of_phandle_args *gpiospec, u32 *flags);
-#endif /* CONFIG_OF_GPIO */
 };

 char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);

Symbols from linux/of.h are stubbed out and these drivers can build just fine
with !CONFIG_OF. This would naturally increase the build coverage.

Bartosz


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E86C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/eXvm13X7UxFmciDlGnpbcJN936kcL51wU8pfyCOvA=; b=0+PmttbNHLriU8
	ujueu3oAf3oG2+hGTAHN1VOgqDtRNCwUsK1k0ug7bws5m7brCEINo9pbD1c9yBDMnLoRg/58/zDoc
	oFtvMP/qtZXjbKD1PXnwnay4Gob4uFC3QdyqLCbsr0K4KLN6ez9ewBuAnGSjRFH5TuTkbq0jJhvsB
	tGz6brcNhlR48iuakkR0w+n5idI3bOuhv8P/4B91CGx7I9n/Ig3IAk5olf7yUAFBSB5TqBs5JS564
	j2KK3Bfom8qkp5fPJd91NvcLbzGCJoO/XO9O/Lq2TtfAUFFBZUu0NAni6YkMzzRogm8ym45nLyS0T
	jU+r/0EDAhvxSmVtiMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muDtj-003zDx-N2; Mon, 06 Dec 2021 13:19:15 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muDtc-003z9M-Qa; Mon, 06 Dec 2021 13:19:11 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="217335116"
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="217335116"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 05:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="579370409"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 06 Dec 2021 05:18:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 395F1199; Mon,  6 Dec 2021 15:19:00 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Baruch Siach <baruch@tkos.co.il>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Tony Lindgren <tony@atomide.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jianqun Xu <jay.xu@rock-chips.com>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Thierry Reding <treding@nvidia.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 bcm-kernel-feedback-list@broadcom.com, linux-power@fi.rohmeurope.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-unisoc@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Cc: Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Gregory Fong <gregory.0xf0@gmail.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Keerthy <j-keerthy@ti.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 3/3] gpio: Propagate firmware node from a parent device
Date: Mon,  6 Dec 2021 15:18:52 +0200
Message-Id: <20211206131852.74746-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211206131852.74746-1-andriy.shevchenko@linux.intel.com>
References: <20211206131852.74746-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_051908_944348_8F36F40F 
X-CRM114-Status: GOOD (  15.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When creating MFD platform devices the firmware node is left unset.
This, in particular, prevents GPIO library to use it for different
purposes. Propagate firmware node from the parent device and let
GPIO library do the right thing.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no change
 drivers/gpio/gpio-arizona.c  | 5 ++---
 drivers/gpio/gpio-tps6586x.c | 5 ++---
 drivers/gpio/gpio-tps65910.c | 6 +++---
 drivers/gpio/gpio-twl6040.c  | 5 ++---
 drivers/gpio/gpio-wm831x.c   | 5 ++---
 5 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 2bc173c352ce..02f9ae19cd44 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -151,6 +151,8 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	struct arizona_gpio *arizona_gpio;
 	int ret;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	arizona_gpio = devm_kzalloc(&pdev->dev, sizeof(*arizona_gpio),
 				    GFP_KERNEL);
 	if (!arizona_gpio)
@@ -159,9 +161,6 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	arizona_gpio->arizona = arizona;
 	arizona_gpio->gpio_chip = template_chip;
 	arizona_gpio->gpio_chip.parent = &pdev->dev;
-#ifdef CONFIG_OF_GPIO
-	arizona_gpio->gpio_chip.of_node = arizona->dev->of_node;
-#endif
 
 	switch (arizona->type) {
 	case WM5102:
diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index da0304b764a5..c5713524b581 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -77,6 +77,8 @@ static int tps6586x_gpio_probe(struct platform_device *pdev)
 	struct tps6586x_platform_data *pdata;
 	struct tps6586x_gpio *tps6586x_gpio;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	pdata = dev_get_platdata(pdev->dev.parent);
 	tps6586x_gpio = devm_kzalloc(&pdev->dev,
 				sizeof(*tps6586x_gpio), GFP_KERNEL);
@@ -97,9 +99,6 @@ static int tps6586x_gpio_probe(struct platform_device *pdev)
 	tps6586x_gpio->gpio_chip.get	= tps6586x_gpio_get;
 	tps6586x_gpio->gpio_chip.to_irq	= tps6586x_gpio_to_irq;
 
-#ifdef CONFIG_OF_GPIO
-	tps6586x_gpio->gpio_chip.of_node = pdev->dev.parent->of_node;
-#endif
 	if (pdata && pdata->gpio_base)
 		tps6586x_gpio->gpio_chip.base = pdata->gpio_base;
 	else
diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index 7fa8c841081f..321e6945f0be 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -111,6 +111,8 @@ static int tps65910_gpio_probe(struct platform_device *pdev)
 	int ret;
 	int i;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	tps65910_gpio = devm_kzalloc(&pdev->dev,
 				sizeof(*tps65910_gpio), GFP_KERNEL);
 	if (!tps65910_gpio)
@@ -137,9 +139,7 @@ static int tps65910_gpio_probe(struct platform_device *pdev)
 	tps65910_gpio->gpio_chip.set	= tps65910_gpio_set;
 	tps65910_gpio->gpio_chip.get	= tps65910_gpio_get;
 	tps65910_gpio->gpio_chip.parent = &pdev->dev;
-#ifdef CONFIG_OF_GPIO
-	tps65910_gpio->gpio_chip.of_node = tps65910->dev->of_node;
-#endif
+
 	if (pdata && pdata->gpio_base)
 		tps65910_gpio->gpio_chip.base = pdata->gpio_base;
 	else
diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index 648fb418d775..6c3fbf382dba 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -80,6 +80,8 @@ static int gpo_twl6040_probe(struct platform_device *pdev)
 	struct twl6040 *twl6040 = dev_get_drvdata(twl6040_core_dev);
 	int ret;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	twl6040gpo_chip.base = -1;
 
 	if (twl6040_get_revid(twl6040) < TWL6041_REV_ES2_0)
@@ -88,9 +90,6 @@ static int gpo_twl6040_probe(struct platform_device *pdev)
 		twl6040gpo_chip.ngpio = 1; /* twl6041 have 1 GPO */
 
 	twl6040gpo_chip.parent = &pdev->dev;
-#ifdef CONFIG_OF_GPIO
-	twl6040gpo_chip.of_node = twl6040_core_dev->of_node;
-#endif
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &twl6040gpo_chip, NULL);
 	if (ret < 0) {
diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 9cf1e5ebb352..7eaf8a28638c 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -262,6 +262,8 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
 	struct wm831x_pdata *pdata = &wm831x->pdata;
 	struct wm831x_gpio *wm831x_gpio;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	wm831x_gpio = devm_kzalloc(&pdev->dev, sizeof(*wm831x_gpio),
 				   GFP_KERNEL);
 	if (wm831x_gpio == NULL)
@@ -275,9 +277,6 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
 		wm831x_gpio->gpio_chip.base = pdata->gpio_base;
 	else
 		wm831x_gpio->gpio_chip.base = -1;
-#ifdef CONFIG_OF_GPIO
-	wm831x_gpio->gpio_chip.of_node = wm831x->dev->of_node;
-#endif
 
 	return devm_gpiochip_add_data(&pdev->dev, &wm831x_gpio->gpio_chip, wm831x_gpio);
 }
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

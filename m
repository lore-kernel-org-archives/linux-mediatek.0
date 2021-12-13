Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25597C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztRH8ozV6Go56OkABXNb10SEzUsJ0cLfbqjMcr9Yc0U=; b=wHxNcsETKEDNvO
	TBgq0qgvfQWaONqmXhw/HM46VSfh7sHvK58IMbystncvWjM2xkfviIfnUmlCMWMjeHtjOR+SfY03d
	8rMDc0Z60kIED49UyV9YpfjwUuOnjQ31Hpm+xRvuTRu7U4EvKQI1ReGtVtFLDNdg25R5TOtgXzYJl
	SORviMyaVj7RVTd7Q6pqnT0qpkB5g0s19N+sLCME/aUN4NxkaGkNtKZNMvXg3iK7oT0hIG2mSrKph
	mTA7TZGAcP9lru7UF0iZlnK08xPYm58x5UKmNTJEEPafAo4sKVx15+6vK/brrqSagsNGTnJMZl/UV
	2+MJEtUt9Mrm5XZ01isQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwoNK-00Af6o-BS; Mon, 13 Dec 2021 16:40:30 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwoNG-00Af5o-Lh; Mon, 13 Dec 2021 16:40:28 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="325043647"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="325043647"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 08:39:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="609150188"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2021 08:39:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id E553114F; Mon, 13 Dec 2021 18:39:47 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Shih <sam.shih@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
 Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
 Colin Foster <colin.foster@in-advantage.com>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Sean Wang <sean.wang@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Baruch Siach <baruch@tkos.co.il>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andy Gross <agross@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org
Subject: [PATCH v1 2/2] pinctrl: Propagate firmware node from a parent device
Date: Mon, 13 Dec 2021 18:39:29 +0200
Message-Id: <20211213163929.7509-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211213163929.7509-1-andriy.shevchenko@linux.intel.com>
References: <20211213163929.7509-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_084026_801051_FAA5A1F1 
X-CRM114-Status: GOOD (  13.32  )
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
 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 3 ++-
 drivers/pinctrl/pinctrl-as3722.c             | 4 ++--
 drivers/pinctrl/pinctrl-da9062.c             | 5 ++---
 drivers/pinctrl/pinctrl-max77620.c           | 3 ++-
 drivers/pinctrl/pinctrl-rk805.c              | 4 ++--
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index dce2626384a9..b48646bd3f55 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -1004,13 +1004,14 @@ static int madera_pin_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->dev = &pdev->dev;
 	priv->madera = madera;
-	pdev->dev.of_node = madera->dev->of_node;
 
 	switch (madera->type) {
 	case CS47L15:
diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 13c193156363..d5d0f62fa55b 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -551,12 +551,13 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	struct as3722_pctrl_info *as_pci;
 	int ret;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	as_pci = devm_kzalloc(&pdev->dev, sizeof(*as_pci), GFP_KERNEL);
 	if (!as_pci)
 		return -ENOMEM;
 
 	as_pci->dev = &pdev->dev;
-	as_pci->dev->of_node = pdev->dev.parent->of_node;
 	as_pci->as3722 = dev_get_drvdata(pdev->dev.parent);
 	platform_set_drvdata(pdev, as_pci);
 
@@ -578,7 +579,6 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 
 	as_pci->gpio_chip = as3722_gpio_chip;
 	as_pci->gpio_chip.parent = &pdev->dev;
-	as_pci->gpio_chip.of_node = pdev->dev.parent->of_node;
 	ret = gpiochip_add_data(&as_pci->gpio_chip, as_pci);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Couldn't register gpiochip, %d\n", ret);
diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
index 1c08579f0198..678e33d81856 100644
--- a/drivers/pinctrl/pinctrl-da9062.c
+++ b/drivers/pinctrl/pinctrl-da9062.c
@@ -256,6 +256,8 @@ static int da9062_pctl_probe(struct platform_device *pdev)
 	struct da9062_pctl *pctl;
 	int i;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
 	if (!pctl)
 		return -ENOMEM;
@@ -277,9 +279,6 @@ static int da9062_pctl_probe(struct platform_device *pdev)
 	pctl->gc = reference_gc;
 	pctl->gc.label = dev_name(&pdev->dev);
 	pctl->gc.parent = &pdev->dev;
-#ifdef CONFIG_OF_GPIO
-	pctl->gc.of_node = parent->of_node;
-#endif
 
 	platform_set_drvdata(pdev, pctl);
 
diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index c643ed43ebbf..4b60ff20e9f7 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -551,12 +551,13 @@ static int max77620_pinctrl_probe(struct platform_device *pdev)
 	struct max77620_pctrl_info *mpci;
 	int i;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	mpci = devm_kzalloc(&pdev->dev, sizeof(*mpci), GFP_KERNEL);
 	if (!mpci)
 		return -ENOMEM;
 
 	mpci->dev = &pdev->dev;
-	mpci->dev->of_node = pdev->dev.parent->of_node;
 	mpci->rmap = max77620->rmap;
 
 	mpci->pins = max77620_pins_desc;
diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index c6f4229eb106..528832b54b29 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -420,18 +420,18 @@ static int rk805_pinctrl_probe(struct platform_device *pdev)
 	struct rk805_pctrl_info *pci;
 	int ret;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	pci = devm_kzalloc(&pdev->dev, sizeof(*pci), GFP_KERNEL);
 	if (!pci)
 		return -ENOMEM;
 
 	pci->dev = &pdev->dev;
-	pci->dev->of_node = pdev->dev.parent->of_node;
 	pci->rk808 = dev_get_drvdata(pdev->dev.parent);
 
 	pci->pinctrl_desc = rk805_pinctrl_desc;
 	pci->gpio_chip = rk805_gpio_chip;
 	pci->gpio_chip.parent = &pdev->dev;
-	pci->gpio_chip.of_node = pdev->dev.parent->of_node;
 
 	platform_set_drvdata(pdev, pci);
 
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

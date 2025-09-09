Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BE6CA0FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 11:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIr9hr0mwMBxzADyBcOnBwlkdexYzwvomksGIS6w6RM=; b=IQj6UspxsGF2I9eL4aj5rU3q+V
	36QX8Fn6m67d6TiS+3aktP34hDyqDIQNR7gSY329OwdsoSSwZJBwgyYBidgNqmm0O1U0MM5E2zcv4
	2VHOGywPprHZsRa1BqVeJ2cC73m29s8Z4Vzn0hYZijIcEN3uffnUN1g/8QU4K/rKCA7Gekim0t4dA
	+fHIkuOUr4dKAwTwxfYnsV5izrr5Co/P0oqz1yaPuQ0P4ihflfurLC43jq1i1NZpZJ2EZajD97zBH
	hxbLkeCNKUlfXzQxMBQs+M5kOsMXZPvT/ujBlEO6eerpZz+g7X2IRodN60vGm/DN1m/HJucdDpjGF
	zOxaYfDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwJ7-00000006eV0-2W8l;
	Tue, 09 Sep 2025 11:14:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuS3-00000005sVf-1DsI
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:15:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3da9ad0c1f4so3738743f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 02:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409346; x=1758014146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIr9hr0mwMBxzADyBcOnBwlkdexYzwvomksGIS6w6RM=;
        b=TDECA13OA+a5QrA7w33jNKejlToyHKK0dY6W44CAzH9j6QGEj3LNGdEXvArOIAfHcE
         2NkPjJxDdpiUY5cjNWRmC4P4m2lPRGfPt1ZaFIC7HEK3o6K4a8H+jStI3kjYy6WVfTlx
         IqBcyFyQ0K7FW5VCxrfYIIjNMNIw7TVDyiJnMYISc1HNaR2SgwrheTA/vD2LMOUq1S7L
         yA748z/b7Yoo+y2dyK5fXdYmvmTqJr3nRsY9xtqhOZCVC1zSeC5PP+JDM7LOxPtiZpPh
         m50tef1ki7IETAUKEOywyXcFMZ3Ezw9CzHEn3TWP+AmpwWU9ERJTy18a6ZlDF5znfD/H
         xQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409346; x=1758014146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIr9hr0mwMBxzADyBcOnBwlkdexYzwvomksGIS6w6RM=;
        b=KBT60uXHTL/AfaF6orK+iF3ecJr6Vdomzlx37qlTOxJ96UftAg8oM0/lYsPBr0TwID
         n6R5GaqksAVrUS1VKg99kZjlHMqYtruap/Cck2EvGDRr2B/slF+oR5xFGjoeoRUw3yvY
         dzzr0CpwPh1Y0iG9ZBfKGNGFZNuAT5P7TppHitQ7CSx5OBkdFKY9OoaXJn6WPjDGiVuh
         Q3NXbz8sHj5uTKTredM55H76cqORSJB1mAyvMxaVomSUoTHY8BjlkkLfwt5CPDN6fdWK
         ikAgq0Re3K3kamJM1si2FfoFBBW1aTJCKtSpXrMG+17VfNAMup46xywZUD+sMy06OdXG
         8kZw==
X-Forwarded-Encrypted: i=1; AJvYcCXpCOpL1sLJB1ke8g83Ht6WaG13F2qujUgJccxvJoDa8W+prVX3fyV7IlKYk+OXZkbsmwF1mcAs88DrtOedNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNmgyiV9ngMIikbQIvdmAPUUhZRZryaGBB6pTq7fMF83cPf4/5
	qyQRnVc/erpK6Iik/Q5usZZpQjZvxk3H9m49U+cfNMx+8T4gNku2e+s/Wvn4TeMY3Zw=
X-Gm-Gg: ASbGncudDEfMLZw8rwHfRV9yalEID6/6h+FuudV8zGEL4PjEd4GlzzFjYWY7jTyA3FC
	CEWTTLt6X+hZarpUB8x9lICtOC1k8UlHVr4PzSSVSywFkVtdlZZSJpHC7NL4Gv1p9Uj8T9R9DtA
	MixFyL3rUHxX+bVV8+1hgbPghxV4pYZnkC3/ZBUoQZpFqKBIMoBex5H3KsrsnJ/D91DrvdBty+8
	IPBBMVI9o/MV7UHGA16alf+E0fOy4JmVFXUVlt8I/xemS+KHYNW136fN69l4PHqceXyB07hKRRQ
	ujvrUCpAlMswQHhkl+7+nTTA+RKKQ8HLn8AsNJxtOZb0Eu/nv55WA8ik2AAZCUwdoUG0Nl9k4hX
	JILK3V0YE3F1VWj8XOIbW/1hLcoz8
X-Google-Smtp-Source: AGHT+IGd8DWD9arGkUNKw4zJ2AP1gSmpXBaa6sBHZKQ/RTRSGAXz+ZKk9uFvPaqtbHsYLxTfFq0lRA==
X-Received: by 2002:a05:6000:178e:b0:3ce:a06e:f24e with SMTP id ffacd0b85a97d-3e64c87e0a1mr7050570f8f.52.1757409345752;
        Tue, 09 Sep 2025 02:15:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:29 +0200
Subject: [PATCH 02/15] gpio: loongson1: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-2-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3630;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Wea5gLwd4IgFMNwzQvk4gQjcgC/QooQl4cu1eZu3y4s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A2FKDJ33HmmJ4TKcUEs6Wb765qwJ9kORopw
 zGH1aPIi9SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wNgAKCRARpy6gFHHX
 cotBEACZHjEmFye/YUWwEG1t9JNn7F/QEqvztKESvvpKpdb/j36lRUnsQOK4I6o/CYNKwADuv7s
 lJtwq4Aq3yb08HIvTrVcbalTGGCc8sVoeuhwj45v3RDkH4kzFvlk7x11cEf8jfdhgAc/4L51iqL
 I870Hq3jyRB1Hcx6bStvRB6GpYEwP6haihYpjfK1LAeW5/TG2WggxKlRRQIKNu76uQ3AH8imb/y
 KoMf6QAY+kOGIgAR/0H7X+IUYMNkNbgaTmFWqs1oIIRnoJ8UyCy9CvbgcGqiljfaUozPOa0oSsB
 fAFQyT83ymZOswP7v7fi7xnuPRMyXOYliGC7ezpF1jVIBqS0FNjienW1XJA4U2l/o3BhnWDS0vF
 cvIdcKk19kIZ4S/3gtalBPcjMImvQ+7p+L/JZo7tsnnQrQE5kQKRbXCysmcy/M702tnvS3Wh7QF
 opbm3qz+aJf8Hutpc/M0iDUsSrHBjc/sO9R7FDQOT1qRL7yX5NHIS5HpWEHxHfOTN+48ZReWpBq
 m2X9CLyXoO6+KEdbs/VrnoTNxsz4JBY6hdbCb8BwS2GPyDX92FyQOiOAK5Ab4JweDvoBsuCqUmK
 5mlxO3bM4EweAjJXKZyOhyPpbA5GqJudG82pFFHg5ZJVPRhrpAESFdJ8zebzlGQERDhxTwQiqm4
 pS73JMaWn3/C1Ng==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021547_396608_ADC74039 
X-CRM114-Status: GOOD (  17.11  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-loongson1.c | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-loongson1.c b/drivers/gpio/gpio-loongson1.c
index 6ca3b969db4df231517d021a7b4b5e3ddcf626f7..bb0e101e920889522aa4bbc69e5d6d2c49586cee 100644
--- a/drivers/gpio/gpio-loongson1.c
+++ b/drivers/gpio/gpio-loongson1.c
@@ -5,10 +5,11 @@
  * Copyright (C) 2015-2023 Keguang Zhang <keguang.zhang@gmail.com>
  */
 
+#include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/platform_device.h>
-#include <linux/bitops.h>
 
 /* Loongson 1 GPIO Register Definitions */
 #define GPIO_CFG		0x0
@@ -17,19 +18,18 @@
 #define GPIO_OUTPUT		0x30
 
 struct ls1x_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *reg_base;
 };
 
 static int ls1x_gpio_request(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ls1x_gpio_chip *ls1x_gc = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ls1x_gc->chip);
+
 	__raw_writel(__raw_readl(ls1x_gc->reg_base + GPIO_CFG) | BIT(offset),
 		     ls1x_gc->reg_base + GPIO_CFG);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
 	return 0;
 }
@@ -37,16 +37,16 @@ static int ls1x_gpio_request(struct gpio_chip *gc, unsigned int offset)
 static void ls1x_gpio_free(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ls1x_gpio_chip *ls1x_gc = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ls1x_gc->chip);
+
 	__raw_writel(__raw_readl(ls1x_gc->reg_base + GPIO_CFG) & ~BIT(offset),
 		     ls1x_gc->reg_base + GPIO_CFG);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
 static int ls1x_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct ls1x_gpio_chip *ls1x_gc;
 	int ret;
@@ -59,29 +59,35 @@ static int ls1x_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ls1x_gc->reg_base))
 		return PTR_ERR(ls1x_gc->reg_base);
 
-	ret = bgpio_init(&ls1x_gc->gc, dev, 4, ls1x_gc->reg_base + GPIO_DATA,
-			 ls1x_gc->reg_base + GPIO_OUTPUT, NULL,
-			 NULL, ls1x_gc->reg_base + GPIO_DIR, 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = ls1x_gc->reg_base + GPIO_DATA,
+		.set = ls1x_gc->reg_base + GPIO_OUTPUT,
+		.dirin = ls1x_gc->reg_base + GPIO_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&ls1x_gc->chip, &config);
 	if (ret)
 		goto err;
 
-	ls1x_gc->gc.owner = THIS_MODULE;
-	ls1x_gc->gc.request = ls1x_gpio_request;
-	ls1x_gc->gc.free = ls1x_gpio_free;
+	ls1x_gc->chip.gc.owner = THIS_MODULE;
+	ls1x_gc->chip.gc.request = ls1x_gpio_request;
+	ls1x_gc->chip.gc.free = ls1x_gpio_free;
 	/*
 	 * Clear ngpio to let gpiolib get the correct number
 	 * by reading ngpios property
 	 */
-	ls1x_gc->gc.ngpio = 0;
+	ls1x_gc->chip.gc.ngpio = 0;
 
-	ret = devm_gpiochip_add_data(dev, &ls1x_gc->gc, ls1x_gc);
+	ret = devm_gpiochip_add_data(dev, &ls1x_gc->chip.gc, ls1x_gc);
 	if (ret)
 		goto err;
 
 	platform_set_drvdata(pdev, ls1x_gc);
 
 	dev_info(dev, "GPIO controller registered with %d pins\n",
-		 ls1x_gc->gc.ngpio);
+		 ls1x_gc->chip.gc.ngpio);
 
 	return 0;
 err:

-- 
2.48.1



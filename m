Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573C8CAC583
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 11:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NS6kcVwueQk8PTITkKoVosiwdk6Lg4fQNiLC3+K+D0=; b=SZt0vhziBZhHc2he4hjHIlBhar
	XDIT2tjxgkipdTZaVdT08rYpXrmCKGZItE1oSOQorEzl+c9GD2LNdOxEfkjgI4TMcjDappahixBNI
	N6MyicUYUQu09RXJ2MaRxd8+mwuorZJ+PHEOiotDmHcKJbrTaJztEUht8HDg6woyugWvVRi5Mj9ac
	UIr9NB8WsN3WvgRXFWXOmkaYGFfNbmX/rNiVNwyT0ZA4EynDu7LGUSVAF012SsWX/B1OQJjanBZTU
	HlAZncD06gML3pn88NHJZBH8FjfifAuTy0ONJiHP+zYPibvMSsQGsPsD7f/K4Z5WrFKAuZiU5SJk1
	C7+xpoaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwnv-00000006qVE-2XhH;
	Tue, 09 Sep 2025 11:46:31 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSR-00000005svS-1uXI
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:16:12 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso3373136f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409370; x=1758014170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NS6kcVwueQk8PTITkKoVosiwdk6Lg4fQNiLC3+K+D0=;
        b=grzwVRbb4CITRrE4/x+1rlv7vSJLSpOU366gmV3ChgFJQIHc9EECvkAr34Y3I2UprX
         z8KSr0LX4SBLNHkVTUewm6qp20QTpB3xhi5/LYhqKz8NQ/y7EuKWzw52v/6UG7lg6BkB
         pKHxiG0oETGBNsdGM9j5imJd2EWe7GA8B0H1NE+raOMWaMi5CK3Nj6lW1KlV/grlQIKs
         axnvnHV4px/hjCR+g/31AKxjI+h+LQH2M5J0xUGIX+1avi1Ip9SmhK23v+IEWsQTHE3F
         XwSbNu8hp0QCaVsZG+rcQkJFQuSWTOo0h/PpqJK9LvQUP9jErj7ukA4PZY4rRiDHQO71
         x60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409370; x=1758014170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NS6kcVwueQk8PTITkKoVosiwdk6Lg4fQNiLC3+K+D0=;
        b=W/40Sv93pwB5XmfDQMf0oQXJckL2b5gYL2gokKfU2FWJH6U6hXdtg/maSz6DVozZgk
         aO3Pcl2atZSKyOmPH+Ln9I3IS6PXKaFfDsef1QxpUpEZp+EG9Q6dm8jMX2HYUgBcdh1O
         8pF3tPOtWw+YERJjamWKhJx/gypi/+NmL8Rw5uaMU47WRJ0BTk4XlwDPz/eW4qz4nmNc
         2qfvg5hcDoFQHMDOJayYEgv786XX9zSF8xZ8Sake19a/kYKHDIxHa0ddwUAKjz79j5fb
         y95pg4Y//+1gNNwlmtblz79KoHKVI8Q8sZGylcNHbaSapEB+xKF2lCg+pYtOxZ4x/xWG
         7yjg==
X-Forwarded-Encrypted: i=1; AJvYcCXG5WL7kAU+ULK3jcRYwALA5ORmobAd3YIclNboNCxCPJVDLwPQhEsGVKcyHiOYj3lQuFXp0mOATlgLPicKwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ9JTO7dGtJevMGNdSaNDpIZoqBBj2WbeXKTxCjGxC3CmSRR8o
	uG6QODDvEySASUmPDn9qITyEsiyWb7f5hbKXoYnV/6jsn3BcAqksiQ/ogjqZhkF5KPY=
X-Gm-Gg: ASbGnctWJ2sQRLtMcG8+ihm2S34Y/ndmGw+ra1LamCnUqmOjSzTrjDSJkY0nBeuFWgb
	77ga8qo1ZfCV65a2dLU3aTZVJcCjFHgBdbhyUohIkAcHiavE6AkQYnh34+A1uvjA0bfwQIdKD7m
	KbvGJHMbOoHqwqzXGRv262qxcaC2mmroW6la720jys7a48y8rmDTF4Pq8AQSvbl44fgqbqzoZ+9
	V4/ZqtKsB29nVSPUXQPWKUV1q8zI2YmwuDQPOSx2NHvEx4fQ0oouFhOuoqBZDHN6SApALTehzlk
	iv9V0kp/U+7tBKDsf2FT1Ee6YrPDCmb2xSXF8D/JCB9RdfxVqvfIO4mzz3M8hmAazBU1Pfh4Sn2
	fbJuIaqB92YaKAMjx7zkL6Jl8x6Kx
X-Google-Smtp-Source: AGHT+IGoJXBvUJSpBt2lyPYKxW7iuqKGK81p5w4PzJvmsSblYb1erZflWT5xfvs5LzLHjloaRsoS9A==
X-Received: by 2002:a5d:5f82:0:b0:3e7:4271:8c6d with SMTP id ffacd0b85a97d-3e742718faemr7197437f8f.34.1757409369974;
        Tue, 09 Sep 2025 02:16:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:41 +0200
Subject: [PATCH 14/15] gpio: mmio: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-14-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2852;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ghLIXnylAYcLYVJg4ksyA9B4/RaoUKjw1Cc8UARhArE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A7M1kWuQRnL65yzzeom2IENhFIls+CzXrAj
 boY3wL6vvGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOwAKCRARpy6gFHHX
 cjUbD/sHaYXToO+u0YqX7txBkP4Ezr0jc2j0S4iqMhj2XV/ZOkALp/qxGiMGm3GaPndvBOHLlko
 a+JYIaEtSb2cUM4o/Q7qpaiHJY7TST7XfNadxyDo/SfLQtQr7BzQ5FBU7+WU8omyvO2EonGCvah
 cCGCSQagVc7uqle5HXUtXcx5bglGy23IdFAi3D5HcPbgu8r4hegVKRPB35R3L196GVHJOARdZlJ
 SqGKqXaoRrqsCjoV7KfdkJs7Aq8KZs5lAMV/E7/Vjs0OQ5oL+IGXlf1pkfPQrk+m+bxxPo+CD1s
 o1co0Zh6+J34EVC5uiOvxm4QiWuJNJZ4OrU//m1bYHhAksr0qaLZmf6sd2eJ05ZyV2pCwbRyGcK
 NdN/wr81ld7t7tuLtbiWO85UH3i8G7+jlHyAB5kk4Bu1czKO0SCtM90ng3QeNoqhG/sI++TESm4
 JXHWeVwLLpSZqMU2Bf3EBFk0bPm1futJyBqmHcfDoPrXUJck+4IC/VrLUn09S8Y3evWzn9eTA2L
 NoxZIkWhOuNM8wZeBEuOPJ3IROTEAl0i0TNfkgOm76aAzuo5LXUEgUbIHQbNNi1KB3Wy8DD5i8d
 nkF6QDdT+keKJjVnvSQGBqIefYenhz+NehXtlsxXnYQKSdf3vpEEpWJ9iObJDEZVE3REDYl3+Il
 tXWZSivklUydFdQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021611_517056_C89C721C 
X-CRM114-Status: GOOD (  16.84  )
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
 drivers/gpio/gpio-mmio.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 79e1be149c94842cb6fa6b657343b11e78701220..a5e2f8a826af40ec96d2a3ea58240f1ca8ed250c 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -57,6 +57,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/types.h>
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 
 #include "gpiolib.h"
 
@@ -737,6 +738,8 @@ MODULE_DEVICE_TABLE(of, bgpio_of_match);
 
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
+	struct gpio_generic_chip *gen_gc;
 	struct device *dev = &pdev->dev;
 	struct resource *r;
 	void __iomem *dat;
@@ -748,7 +751,6 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	unsigned long flags = 0;
 	unsigned int base;
 	int err;
-	struct gpio_chip *gc;
 	const char *label;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
@@ -777,8 +779,8 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (IS_ERR(dirin))
 		return PTR_ERR(dirin);
 
-	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
-	if (!gc)
+	gen_gc = devm_kzalloc(&pdev->dev, sizeof(*gen_gc), GFP_KERNEL);
+	if (!gen_gc)
 		return -ENOMEM;
 
 	if (device_is_big_endian(dev))
@@ -787,13 +789,24 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (device_property_read_bool(dev, "no-output"))
 		flags |= BGPIOF_NO_OUTPUT;
 
-	err = bgpio_init(gc, dev, sz, dat, set, clr, dirout, dirin, flags);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = sz,
+		.dat = dat,
+		.set = set,
+		.clr = clr,
+		.dirout = dirout,
+		.dirin = dirin,
+		.flags = flags,
+	};
+
+	err = gpio_generic_chip_init(gen_gc, &config);
 	if (err)
 		return err;
 
 	err = device_property_read_string(dev, "label", &label);
 	if (!err)
-		gc->label = label;
+		gen_gc->gc.label = label;
 
 	/*
 	 * This property *must not* be used in device-tree sources, it's only
@@ -801,11 +814,11 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	 */
 	err = device_property_read_u32(dev, "gpio-mmio,base", &base);
 	if (!err && base <= INT_MAX)
-		gc->base = base;
+		gen_gc->gc.base = base;
 
-	platform_set_drvdata(pdev, gc);
+	platform_set_drvdata(pdev, &gen_gc->gc);
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
+	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
 static const struct platform_device_id bgpio_id_table[] = {

-- 
2.48.1



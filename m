Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA99CAC583
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imvYh5lR/dHX9OHCZw7SQaMxZ7ezZGMquKjwxXrqu/k=; b=0m+E5PM4chyElFAmhIthh8iNEb
	irPxr1NLAQBbiT+IjqbmNXICJ3ZYlQ044VAW45BtxW/A5FiVZMp2+YQhvlqqq/xtToP7FzU0NGVi4
	NwSfdcP0gZNzZ6KXb9PYiS0Z9xhAFBCbIG51O5gB3zX2A7NPHB2UkGlIDJephiXEsSZZ5IsZmBuDe
	5bcA/wQw1/I088fLre8nKdtfyKRwnsOrXN41K2JJA2GZCAQhStwnHrJYV1Bv2MlpbTrhAiNFn/Loe
	LvZewgkfhh+Wt+bNKuvyMLjaVACpW06HyP8h4UcjCOi0YSbAzDcD1boKYvPP6H6/h9HWjXZAhAIMt
	KUydWC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwZp-00000006l13-12bu;
	Tue, 09 Sep 2025 11:31:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSF-00000005sie-3qxY
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:16:01 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso4111395f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 02:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409358; x=1758014158; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imvYh5lR/dHX9OHCZw7SQaMxZ7ezZGMquKjwxXrqu/k=;
        b=2m1dPFyecfnMsnFFE9FeNY2t1697XXhCy8oUTPK8eLfDIltPcOF8e1IbXPOdu6NLuz
         eLHJEhnQZQ7WAtcIvYrYHMtofa7MW80XKmd35F4u1p7dknRaL9lQSZ+KpdmzbDe9Mt1q
         q0JDMU5kY+3V9HCCSTK2b5WI75xxp04rZiJ2iUGX0JdGqsKSfbUH/0F6mIF913Zm4Pmg
         ypRWR2rWyJiiIjxE4Dgu+8GYeLCY4MaEtjSaKFTUduK8cu478Z2f7QV7oL/oxq65n+3L
         ZVxiK7cTJuM+H42Lvo6IiImUQHzNvEtaOUNCk0zC5iCJJfQV418TX68qg7o2Z0pb9iSt
         +Ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409358; x=1758014158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imvYh5lR/dHX9OHCZw7SQaMxZ7ezZGMquKjwxXrqu/k=;
        b=NcV4IV1kp47qO2QbeGrMy4qPeuUL/anaUXIuY4D21qT6jUlmoQ6qNVs9JGIaNuNt/t
         soXpEPXHbtrF82DRI2VimGyVCul3uryL34pcKJDubXha//BsUTaAi/W/jdkA1ha8Vh/9
         erWd1T2/Zobi6I5E6+/HcwxRLN92EOsiP8TC6JR33wBcIOk7gMJXDg9k/0zaWwfjDVtp
         bKaK5c2dJLNJo5sok3ejgdpSEZoq0ehc4tKgrQQrGEpcQGyvXZ0X0C95yPjVP95oOSh/
         Comy9BVuAzNCv5VeK/7nYpug62Xd3S2JdhOJoenAIpvgFmYKWI8T8gy4k/74PHO//zko
         x05Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmUDl7qlXQXLq7xfm0k0tL+t88kOTKBSuPR9/vgKr63LqbagCzHDr4ABttsZtGBCewFZfJcf1/gHHYNDmFOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlFLDhdgwPVgUIwP3L67sE4xwXb/OYxd7PnUs9pYv01uNpnNVt
	fCeCS25PHZoVfwxTDWsdUBRBNmDVQTJ0y/R/XSWJpt2bSxWSnZDCwC2F4DQcutHVC+A=
X-Gm-Gg: ASbGncuTsbXmqecoe5C2gaNS9xt4Z+Lxvsi/AsPL8fpaaEm2K2Egcl8PgdBWyvbcWzv
	Eifn6HY1of5pegSqrgiQYc8BWJwIYSaceSO2w1iNFhgpph4DAeiuKpHaJHKNsFQQb3M/ULa+ga9
	Ob9qsGSfOOmqul5INZuNWsWYYrUdhXrDU/CfPI7FOJIW0ttbvH+6o313yY6jumdwJe2x6VnlAUn
	lvQQ/IILWF7XwOGnn9upTKIAytL0FGQi9H5ZOPFJ+8wkT+BTtksxHKlkRtuBxVccMlvREvRboDa
	HEX/pp4uLSiTP6J/R7TZT/1tTot4IhJTAa9JWjwiDTfuWP8ZRhJ2Armn9rqTfBbwUQTsPHUFczA
	HeNcLK/5NmaceJIbjXA==
X-Google-Smtp-Source: AGHT+IFXdZbV4+FiR+g1iDJ8jJCYsBpu7n34tdX+VbMu0cFX2kWCDQk+M9AJM+qd4ppleGeZ928X+w==
X-Received: by 2002:a05:6000:2f86:b0:3da:484a:3109 with SMTP id ffacd0b85a97d-3e6462581b8mr10915610f8f.38.1757409358327;
        Tue, 09 Sep 2025 02:15:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:35 +0200
Subject: [PATCH 08/15] gpio: mt7621: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4763;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M1OC3OhNMgxsP5tAU1lwG6NLBHcwqFdL7D8NR7XeUHg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A4aZdax70K5uQfOmnaoQXt7HkrYee5gxJRb
 6C6qpw21tGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOAAKCRARpy6gFHHX
 crGMEACO4tQW9r/dZEd11av+YA6qbWLWsdG+wUB7P/ckV/W+L99g0jDIZ8ZxwasnJyqD7RyZ00E
 2DEUCCF/TkBEvZF7s7iZfVuIKwjGb27+59KWDM0loRrPE0MNZSmAB1lxSKe9LglSlOINSmKRTXw
 cRa4kQ/Df8O9mz3y7wSQ41HUnv62dRhoaPmREqSENbZMGTSumq463FnVOI60KiaL5I1eICCWVd/
 uPU3dDiBTgtU9/QSsR2NEXM0jV8X4U86r+jVKCTkP30c13kD5l2fQq6XQe5YCWE9Ltd9meCLkFK
 laYeyO1mk6xHPgr9mik32wx/m9wbwoSgyyRotGrxmOgZCWMrk86iSx9nilpAFuSW2KBcaGpWEQo
 AZ0hPY2YNCR3BivREbh9xKPwPn0e5MxKFJLGzHnSnVFCw1J87ALf7Djs1Eh+HWDd9LF2rg+Vjo4
 8VXPgfe37EZHRKPe1Bw6mosIGM0U4CpTYk6VY+HYU6rM7lJios/x3nfhWnOFj526OHEdDCooA0f
 m/W8+zKBpULtaJbckno/1b1OdvacZ/zfYHxVMjlL7ihR1hCRkFvw7sCzJIE3pDfPQuMv2u3cc+o
 4kVW5zkUcdATe1gdK8LcNb1p4slcV1povBGAcHVdWCWUYcyLHMknJ7ZOgvxFCP4hDT2g9MO5N5u
 v0s8Kkc0/dHTi4w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021600_079049_1ED2AFA4 
X-CRM114-Status: GOOD (  18.48  )
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
 drivers/gpio/gpio-mt7621.c | 51 +++++++++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 93facbebb80efadbdd3fb4500e0db14936287f1a..ed444cc8bc7c2b921be6588ce850027a2e3088b4 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -6,6 +6,7 @@
 
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -30,7 +31,7 @@
 
 struct mtk_gc {
 	struct irq_chip irq_chip;
-	struct gpio_chip chip;
+	struct gpio_generic_chip chip;
 	spinlock_t lock;
 	int bank;
 	u32 rising;
@@ -59,27 +60,29 @@ struct mtk {
 static inline struct mtk_gc *
 to_mediatek_gpio(struct gpio_chip *chip)
 {
-	return container_of(chip, struct mtk_gc, chip);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(chip);
+
+	return container_of(gen_gc, struct mtk_gc, chip);
 }
 
 static inline void
 mtk_gpio_w32(struct mtk_gc *rg, u32 offset, u32 val)
 {
-	struct gpio_chip *gc = &rg->chip;
+	struct gpio_chip *gc = &rg->chip.gc;
 	struct mtk *mtk = gpiochip_get_data(gc);
 
 	offset = (rg->bank * GPIO_BANK_STRIDE) + offset;
-	gc->write_reg(mtk->base + offset, val);
+	gpio_generic_write_reg(&rg->chip, mtk->base + offset, val);
 }
 
 static inline u32
 mtk_gpio_r32(struct mtk_gc *rg, u32 offset)
 {
-	struct gpio_chip *gc = &rg->chip;
+	struct gpio_chip *gc = &rg->chip.gc;
 	struct mtk *mtk = gpiochip_get_data(gc);
 
 	offset = (rg->bank * GPIO_BANK_STRIDE) + offset;
-	return gc->read_reg(mtk->base + offset);
+	return gpio_generic_read_reg(&rg->chip, mtk->base + offset);
 }
 
 static irqreturn_t
@@ -220,6 +223,7 @@ static const struct irq_chip mt7621_irq_chip = {
 static int
 mediatek_gpio_bank_probe(struct device *dev, int bank)
 {
+	struct gpio_generic_chip_config config;
 	struct mtk *mtk = dev_get_drvdata(dev);
 	struct mtk_gc *rg;
 	void __iomem *dat, *set, *ctrl, *diro;
@@ -236,21 +240,30 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 	ctrl = mtk->base + GPIO_REG_DCLR + (rg->bank * GPIO_BANK_STRIDE);
 	diro = mtk->base + GPIO_REG_CTRL + (rg->bank * GPIO_BANK_STRIDE);
 
-	ret = bgpio_init(&rg->chip, dev, 4, dat, set, ctrl, diro, NULL,
-			 BGPIOF_NO_SET_ON_INPUT);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = dat,
+		.set = set,
+		.clr = ctrl,
+		.dirout = diro,
+		.flags = BGPIOF_NO_SET_ON_INPUT,
+	};
+
+	ret = gpio_generic_chip_init(&rg->chip, &config);
 	if (ret) {
-		dev_err(dev, "bgpio_init() failed\n");
+		dev_err(dev, "failed to initialize generic GPIO chip\n");
 		return ret;
 	}
 
-	rg->chip.of_gpio_n_cells = 2;
-	rg->chip.of_xlate = mediatek_gpio_xlate;
-	rg->chip.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
+	rg->chip.gc.of_gpio_n_cells = 2;
+	rg->chip.gc.of_xlate = mediatek_gpio_xlate;
+	rg->chip.gc.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
 					dev_name(dev), bank);
-	if (!rg->chip.label)
+	if (!rg->chip.gc.label)
 		return -ENOMEM;
 
-	rg->chip.offset = bank * MTK_BANK_WIDTH;
+	rg->chip.gc.offset = bank * MTK_BANK_WIDTH;
 
 	if (mtk->gpio_irq) {
 		struct gpio_irq_chip *girq;
@@ -261,7 +274,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		 */
 		ret = devm_request_irq(dev, mtk->gpio_irq,
 				       mediatek_gpio_irq_handler, IRQF_SHARED,
-				       rg->chip.label, &rg->chip);
+				       rg->chip.gc.label, &rg->chip.gc);
 
 		if (ret) {
 			dev_err(dev, "Error requesting IRQ %d: %d\n",
@@ -269,7 +282,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 			return ret;
 		}
 
-		girq = &rg->chip.irq;
+		girq = &rg->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &mt7621_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
@@ -279,17 +292,17 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		girq->handler = handle_simple_irq;
 	}
 
-	ret = devm_gpiochip_add_data(dev, &rg->chip, mtk);
+	ret = devm_gpiochip_add_data(dev, &rg->chip.gc, mtk);
 	if (ret < 0) {
 		dev_err(dev, "Could not register gpio %d, ret=%d\n",
-			rg->chip.ngpio, ret);
+			rg->chip.gc.ngpio, ret);
 		return ret;
 	}
 
 	/* set polarity to low for all gpios */
 	mtk_gpio_w32(rg, GPIO_REG_POL, 0);
 
-	dev_info(dev, "registering %d gpios\n", rg->chip.ngpio);
+	dev_info(dev, "registering %d gpios\n", rg->chip.gc.ngpio);
 
 	return 0;
 }

-- 
2.48.1



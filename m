Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5DACA0FED
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Sep 2025 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6c/pvFPyTaB2IKIW4xwQWlTQpyrmNMmH9gU68Ylyi64=; b=iA82+vhMBIxc7GVfDGgumc3+dY
	F36t3KUxZNsPS4Av+zETh+pfuinoZRAqR9Y1LDi5Nj6Srs/WtyovEhW0CwkgpeD18KQ8/lcQIHcxw
	VeVPA1fQODZxU+8f86ExPGbzaFFmqEjudGBfqDcFuJov49fSbXcuu8kADAw35D7Cq5g77w8Hdxv7O
	/edoQnAmk008lBUk8DTufZS0zYnmjAwMdIaKlJj7xSbLJ+V0cUgm47ZzAgXoiCCFbxtovK5TIoN61
	vRgxdu30ZZn3ULK7FuTQOgYl/XtAg/7jSpRL8UERoUz4DEleVCslBd7KwJ8qKeA/0wPmbB9hfZgdT
	cL4VZIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1j-0000000CSf3-0lu2;
	Wed, 10 Sep 2025 07:13:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF13-0000000CRcF-16Sn
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:19 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso42073735e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Sep 2025 00:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488394; x=1758093194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6c/pvFPyTaB2IKIW4xwQWlTQpyrmNMmH9gU68Ylyi64=;
        b=JwX39JNXlMaA1M4BuS5mPiyr0r/EjNede64h0tMdr8ACn8Mec33OusoCd7ulgiDODd
         KXzjoqkUOGBySFdyqqt1oR73xv/6ljqgM3Us2KpY72iA9EUaf6XJFPbUwq6qF7qXz5+5
         byfV5YojgiX5cIYSonJv6FOggzpqL5daXY2IPwRlw2zzwEVL1dfVXFDj5snzKnxkCQO3
         lqVwmnobXDp3LQQhDzWw/V3aKhifZWrdSsNgrk2HabbxOx/qWNn6HRIK8fLCRz9eVnJE
         4YHrQ6/IFeNznpAWGpfKrcWxAAbMFmIX64edLxOhDTfktqhskb32wTCi/x3L4OwJPvfX
         WXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488394; x=1758093194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6c/pvFPyTaB2IKIW4xwQWlTQpyrmNMmH9gU68Ylyi64=;
        b=M9H/h7RBOtOlPIoMDxKAYWYxIj8gW9DZ+8nX1RNAKSnmkEIPjmP1rwQvHpHdN0mCtr
         YexH30chb+rUd0Jw19bvAqLTdxGp0ROZcaAkuLfbfeGICXWgETCz5trCn6E0p6l5WLJj
         nEy4CuoWHaR8BNG4TJ7bXhzouB4nw4B0sKxz2LeyRUHPX99zZtTA1hm8/lO8pcNb2WTE
         0kaUwMpaubvz5k3wRNP3QdnKT9heiLXt9GjtFOCOasex8wg7PeVDbf0zVRAYsMWMfUxB
         WxmYEnrbPCNqwWHuKuAQjW7ap+W6oXjQpi55HQb1jAApBhiQyotjghgl8q5BEEtjPblc
         oBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtZVpFtNavkE2Rowz5udOAloFud21sUuHL+mZohMhlqvV2FvooNls5IZhEciS70Mw+Pu6LKottYB9qWdft/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+VjscKlkEyHJ7f073n0cCNxPKkhOcdKAys46sp+QWNPAnyy+E
	8T9Y95bveh16CwG8ikl5k9lpwZOjacsTQlnbiqviXW+oViGKkLcT4NJC3AQN0Rorlv4=
X-Gm-Gg: ASbGncvP2i8MPa/7bKVQBfY5gvdgQs+ShCNl9iyo2NBwuDetM0+G11+7VO7kqZXP0dx
	Tv26oH4sCyGoD3lFJoXYx3e8AIvy3feekNGr+84OQhFubpP8ic7xiQKdB/gapE1WxJiBMcoibnu
	D5WgtRUY8dAn4xLJBGZhk452w9W2h0rZVo3PRdNULOBrig/DCnldW5kf8mQSJWAaQ93dGLflmaW
	83HbUOeK6yomHMeGjsDjqGpfkaobn98wYJCe+BL0No/6hN5qa1o3s+7Yq0WHpL4zgwARfdpNXei
	hgPkIZ7e0640l/IMyvbxkMXprF6w+xK5OJIWIMFBnSLPHKeZmhc/A20eiJDYtM1ec5YngqgqJqH
	uw3p1kf8LyPoR22Z3+bu9Qa6ppe0=
X-Google-Smtp-Source: AGHT+IE8/2TOR5e5wBjK6bwnPnGoPFsiXC2aKo6sThqo4Y4RFbUV5dbrmcgYl3+7QyN1qmp1C0uHGQ==
X-Received: by 2002:a05:600c:4ed4:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-45debe22055mr75199565e9.31.1757488394170;
        Wed, 10 Sep 2025 00:13:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:46 +0200
Subject: [PATCH v2 10/15] gpio: menz127: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-10-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3350;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2qJwbWHnGxbd4mos2wZZqovvMW1o0Hu1zLY8DCz5XAk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTuC53hX0ok/Q7bV2FUvI7TGC0rpB5vDWeq2
 RyfDFLq142JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7gAKCRARpy6gFHHX
 clYxEAC3ZY6fYBuRFCcSFDyDskUwOZE2MX3YsufyWILM87g5ZR3/HcyQuHHqj2HQFbM3B2aD4z7
 jETazyJnFEwuK1Zu59qO4JN7NLxyh3p7swxsZUu/xaV+5rChm5DXPX/03l0TLe/OJuAKFrkzr8j
 6NuiO3U9+ljhbhkDSUWl5M2/KiYgR42isjnUCZHWhMzP141dBJBbZRcFqr2tINv4gU1GEaoToBT
 8bkmOtJ7gdezWtPlueZEjvVSpkR2RKQAVDkAACExtQ21X1tfW7Zc0BQBtXZqZqt7FsTDa744Vg3
 +0Zp7WiRMFTYfxEbByqHZShEUpFduKiMbYkzt7NmeRUhUAkmfPThvj0XT7jQWbS/mG8guHkYhCr
 UfQg5zgkbn8fKImUSFJDGis5nQB6LfJ8CybqlZXIHoLKXuG/HNXp4+xCrWu2skxu/9zavbYsFw7
 E3iscHrsHoZVdNbHTykbwgKr7DVBP4ROjyAcp+DVLSnu3hWkINY3udREpTVRHeNH86FfPQ919ou
 I8Gy+JRIXXHqNRWUMbnxsFcA5UU0ZptqQqHZDbck1gSaFtdpdrhJNUX9f2sQHWOs0PbodXHmx4L
 Zf7wbpgGa7xfMSQe7NcXrNOYi9hGxAUu6aCxSUoy+YMY5G5l/S/GmthMZn6ZPoIyy/XkJ6wLWdH
 f7j8pv/nNptmfUQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001317_416170_FF442444 
X-CRM114-Status: GOOD (  14.42  )
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
 drivers/gpio/gpio-menz127.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index ebe5da4933bce730c70f83c1c0f86fc4a4cc9906..da2bf9381cc43cd489f6a8593636bbbc95ab5660 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -12,6 +12,7 @@
 #include <linux/mcb.h>
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 
 #define MEN_Z127_CTRL	0x00
 #define MEN_Z127_PSR	0x04
@@ -30,7 +31,7 @@
 					 (db <= MEN_Z127_DB_MAX_US))
 
 struct men_z127_gpio {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *reg_base;
 	struct resource *mem;
 };
@@ -64,7 +65,7 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 		debounce /= 50;
 	}
 
-	raw_spin_lock(&gc->bgpio_lock);
+	guard(gpio_generic_lock)(&priv->chip);
 
 	db_en = readl(priv->reg_base + MEN_Z127_DBER);
 
@@ -79,8 +80,6 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 	writel(db_en, priv->reg_base + MEN_Z127_DBER);
 	writel(db_cnt, priv->reg_base + GPIO_TO_DBCNT_REG(gpio));
 
-	raw_spin_unlock(&gc->bgpio_lock);
-
 	return 0;
 }
 
@@ -91,7 +90,8 @@ static int men_z127_set_single_ended(struct gpio_chip *gc,
 	struct men_z127_gpio *priv = gpiochip_get_data(gc);
 	u32 od_en;
 
-	raw_spin_lock(&gc->bgpio_lock);
+	guard(gpio_generic_lock)(&priv->chip);
+
 	od_en = readl(priv->reg_base + MEN_Z127_ODER);
 
 	if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN)
@@ -101,7 +101,6 @@ static int men_z127_set_single_ended(struct gpio_chip *gc,
 		od_en &= ~BIT(offset);
 
 	writel(od_en, priv->reg_base + MEN_Z127_ODER);
-	raw_spin_unlock(&gc->bgpio_lock);
 
 	return 0;
 }
@@ -137,6 +136,7 @@ static void men_z127_release_mem(void *data)
 static int men_z127_probe(struct mcb_device *mdev,
 			  const struct mcb_device_id *id)
 {
+	struct gpio_generic_chip_config config;
 	struct men_z127_gpio *men_z127_gpio;
 	struct device *dev = &mdev->dev;
 	int ret;
@@ -163,18 +163,21 @@ static int men_z127_probe(struct mcb_device *mdev,
 
 	mcb_set_drvdata(mdev, men_z127_gpio);
 
-	ret = bgpio_init(&men_z127_gpio->gc, &mdev->dev, 4,
-			 men_z127_gpio->reg_base + MEN_Z127_PSR,
-			 men_z127_gpio->reg_base + MEN_Z127_CTRL,
-			 NULL,
-			 men_z127_gpio->reg_base + MEN_Z127_GPIODR,
-			 NULL, 0);
+	config = (struct gpio_generic_chip_config) {
+		.dev = &mdev->dev,
+		.sz = 4,
+		.dat = men_z127_gpio->reg_base + MEN_Z127_PSR,
+		.set = men_z127_gpio->reg_base + MEN_Z127_CTRL,
+		.dirout = men_z127_gpio->reg_base + MEN_Z127_GPIODR,
+	};
+
+	ret = gpio_generic_chip_init(&men_z127_gpio->chip, &config);
 	if (ret)
 		return ret;
 
-	men_z127_gpio->gc.set_config = men_z127_set_config;
+	men_z127_gpio->chip.gc.set_config = men_z127_set_config;
 
-	ret = devm_gpiochip_add_data(dev, &men_z127_gpio->gc, men_z127_gpio);
+	ret = devm_gpiochip_add_data(dev, &men_z127_gpio->chip.gc, men_z127_gpio);
 	if (ret)
 		return dev_err_probe(dev, ret,
 			"failed to register MEN 16Z127 GPIO controller");

-- 
2.48.1



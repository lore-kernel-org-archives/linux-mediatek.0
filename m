Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB74CA101F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Sep 2025 07:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpH3xP6wyCDFqtxPwQHSi6T7qTG6cxtRQgRVE3rLsKY=; b=OdijJm+IiIH/1KCGavp91ADgzS
	FGhgHtKk4RNx4afj+CvWUhNpkBRJXyEG4Zk6SPILeALXxVzaICvWjRHpV9eBV6fC1J/INccKZ6IKW
	Kucvk0J+xiROFqdGUWYwMus5RMKlzw0dJAN6tXas6QkeOfrhIP2Z0s8kZpxsWA6PgVLkb6Dvu5HHd
	cxhm82jfHj5WZuVq/5xisO956TGPKSdWnFpISoKJXuEM+/Z49MjbFsQEoBicLsYefaYO7xMyXFT/N
	4WJo1SfkuNGuTYO8YhCFXXZjh53BAnNA47ymUgfX/zYbU3IUzL4OMS9XuzpZOIKJj+Xj2pi3SirbL
	bkPIJErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1b-0000000CSRN-1RkE;
	Wed, 10 Sep 2025 07:13:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0z-0000000CRWl-0UkB
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45de6490e74so28899885e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Sep 2025 00:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488390; x=1758093190; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpH3xP6wyCDFqtxPwQHSi6T7qTG6cxtRQgRVE3rLsKY=;
        b=yz4nQ5i+hgca2gYt3+DLjGt21XTjeAsMFy8AcVl5iJb5EPFtw2JPpJmBGF3//xwb4Y
         hWEl50bgg2oyeVeO+Ad0NIYTTsf+rY6JJZxgDd3Go+3ymayNXm1yxzfnDfjoJJMn5zM5
         z5uQzZMEZyaquNAYOct847S1B0K8sE0iypa/JbOCA27ocEIH++looElO0CeW3kF6LWaz
         /6w5L7QfYKhk5F/CqQavAKLENNol0QH4QMrfDvZWqDHrAlNcJcCRET4gmC93cq1mk1SA
         Y8n6BwCM0KgnxAv5KiaWWezIov2aoQ2KjLwSjlIctM+cd1c0eCHO0wF9Qf+lmYgXzQec
         xRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488390; x=1758093190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpH3xP6wyCDFqtxPwQHSi6T7qTG6cxtRQgRVE3rLsKY=;
        b=vU1snCG+rLfvTMTMAH3NxwDQ7jiZy+UzfgXNNYkGkxhKleJjBrWD3QuwSy0ge8U88e
         Rp0umTihZLhYfI5kt6Ym1b22d/gYhApgMs9TwqO5P+SG44jLUNFVBADW6FjlIJTcF9/n
         LE0VB1qWdjQ2T+XImootQ01I4UEEOzC515+kxQaiP15GmWq/c5BfoH/4YGyHabpF5Jll
         Keo+N363y9NJ12U0eZLdEy1rQJeVNSwDps4w36ySfzwN1jyxwlOjCztKTdkue2K9KVcf
         cvWveWfd9yMPtjTWi+fvHuWKOYuIfQX15Oqa1zfWXjOlfQ9rZMDWvYsKWgvo5fUbvUw+
         PD2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8bhqFbvoxup+EzpQPpsXcqSKoyVnYg2fHcv9shVdh9sQ2/VQzhS07IBjYaehHAWNc0mviOLJ2XKUMs4RZZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxEM/J6FM25iI5W3bAinz0Belo8/tyBqlUk9BJ5EzLpSAqLbZB
	KZyAAMeOCwH/RUWh53TkHltkBM+DcFX1M0YHyIQ7xj2+mjX1iy+bK2XTdNSmTseVLQY=
X-Gm-Gg: ASbGncvp6sHBTISshDWk1XdemLVYiA5KDADqysvD/a9BVBHnnfoPzxJ47UqJRoLazEo
	4sdsNhBLCLJ0+UA5SXwFHg8OFF5i9giPOkJJPOe4ZsaaPWpE5uqCC2h8zkwzFFLgwNQn13Ug15I
	LVqr4JroaCKQ6EZiLRUfgjbkXY/Ca7tvYdZZFi++L7N/gOel4zamvIwFGh3PNIBlWyxEoULaGdU
	YaBnW3m+kMewf97FkIlycuxWJgTEKn8my0NvIAKA7Rgn0KjxcbV30LGg3OpM3CkEbTIgv8tTccL
	3gU3jXTso08ISQN/NeOwdbaP1kNgGi6lZ3KMrpl1Qx1eti3Rd0XLpfR23zkg7BwS1qFDlhTV8ll
	jQ1aY6SDt+Xh12gy2
X-Google-Smtp-Source: AGHT+IHvzaTb6l4WV5jftz/0o+nvoCQMLeFIWHVTLr9cshvRdfatjRswFUx/x04ah3EbwRWAp1+4+w==
X-Received: by 2002:a05:600c:3b23:b0:45b:9c93:d21d with SMTP id 5b1f17b1804b1-45ddde957e4mr149455255e9.8.1757488390271;
        Wed, 10 Sep 2025 00:13:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:45 +0200
Subject: [PATCH v2 09/15] gpio: mt7621: use the generic GPIO chip lock for
 IRQ handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-9-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3466;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=11q2Cdfq1GOfHgG+9TvJtv+cnYZQ9ttVALJ5FGWLhWk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTuiV2jdUzIRv5dARsvLCxoAdNPwB3tCj0Wp
 yUtA7jYz6OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7gAKCRARpy6gFHHX
 cnLoD/9oOVXC7jn81QlThye4yt65zIZg8bNy77xMsbujhx+T1ZkIA00xXzPcWUFN+qqLmLzYD67
 7i6XkeUoTgTAPVwo9/YoWHSURE1PUBlPzAG2oeObcx6Nx6rWMNnOzwxgre3p722SfiKAXmI9Sw5
 F3wsjLGHnwlqBKWnVL0yVgDrZxBACpnEwEucj8Di7gGH/7ihgJzLaXVx75XJK701F+pLp/9Jr1b
 c1ljp89dveL18XF8JXKR8nZmWTXhpL5UUOOMNKDpEUkRjJfNlE3qcPFoLPpnCBwf5KAvuB1662Z
 NOdWpl807j5tpMNsDkQF46HO0TWO7x8a2kOQjq+a2LpEmiAbWLNnpZl0nriZC+/4QdtnmORL99P
 HlCfXkeSRSJANw6EIQBw6kabCZ29LmSENq47mJxIBgBjQZ0Dv9qsXH29gMssXXxxDbIwc2pt0Rz
 Dg3AYlmpVgqo86nKo9slX+zfJZfCN/vqpeiMKATef9HH8UX6ZF5VV4MrcBbfkEddTWIrKyXuSYu
 lGknfChnGxXZWC94ReuSzBn20I3JOJ1PhK4M4DsX8Jio5c7C+pAp1MXBa+UAq70CqycsjIDnYFD
 z2EBndwzE9egdkZ9YaRmwFYNNvW/ILgBcppubajjbZcdvPIkL83r8yz8CzrzMylmV4i/KJit1Z8
 q1/yp6vSSydNvbQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001313_329453_EBB6746F 
X-CRM114-Status: GOOD (  12.80  )
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

This driver uses its own spinlock in interrupt routines while the
generic GPIO chip callbacks use a separate one. This is, of course, racy
so use the fact that the lock in generic GPIO chip is also a spinlock and
convert the interrupt handling functions in this module to using the
provided generic GPIO chip locking API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mt7621.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index e56812a1721151c8f3b32b5093aee5c74bb798bc..e7bb9b2cd6cf32baa71b4185ea274075a7bc2d8f 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -11,7 +11,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/spinlock.h>
 
 #define MTK_BANK_CNT	3
 #define MTK_BANK_WIDTH	32
@@ -32,7 +31,6 @@
 struct mtk_gc {
 	struct irq_chip irq_chip;
 	struct gpio_generic_chip chip;
-	spinlock_t lock;
 	int bank;
 	u32 rising;
 	u32 falling;
@@ -111,12 +109,12 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct mtk_gc *rg = to_mediatek_gpio(gc);
 	int pin = d->hwirq;
-	unsigned long flags;
 	u32 rise, fall, high, low;
 
 	gpiochip_enable_irq(gc, d->hwirq);
 
-	spin_lock_irqsave(&rg->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&rg->chip);
+
 	rise = mtk_gpio_r32(rg, GPIO_REG_REDGE);
 	fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
 	high = mtk_gpio_r32(rg, GPIO_REG_HLVL);
@@ -125,7 +123,6 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
 	mtk_gpio_w32(rg, GPIO_REG_FEDGE, fall | (BIT(pin) & rg->falling));
 	mtk_gpio_w32(rg, GPIO_REG_HLVL, high | (BIT(pin) & rg->hlevel));
 	mtk_gpio_w32(rg, GPIO_REG_LLVL, low | (BIT(pin) & rg->llevel));
-	spin_unlock_irqrestore(&rg->lock, flags);
 }
 
 static void
@@ -134,19 +131,18 @@ mediatek_gpio_irq_mask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct mtk_gc *rg = to_mediatek_gpio(gc);
 	int pin = d->hwirq;
-	unsigned long flags;
 	u32 rise, fall, high, low;
 
-	spin_lock_irqsave(&rg->lock, flags);
-	rise = mtk_gpio_r32(rg, GPIO_REG_REDGE);
-	fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
-	high = mtk_gpio_r32(rg, GPIO_REG_HLVL);
-	low = mtk_gpio_r32(rg, GPIO_REG_LLVL);
-	mtk_gpio_w32(rg, GPIO_REG_FEDGE, fall & ~BIT(pin));
-	mtk_gpio_w32(rg, GPIO_REG_REDGE, rise & ~BIT(pin));
-	mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(pin));
-	mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(pin));
-	spin_unlock_irqrestore(&rg->lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &rg->chip) {
+		rise = mtk_gpio_r32(rg, GPIO_REG_REDGE);
+		fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
+		high = mtk_gpio_r32(rg, GPIO_REG_HLVL);
+		low = mtk_gpio_r32(rg, GPIO_REG_LLVL);
+		mtk_gpio_w32(rg, GPIO_REG_FEDGE, fall & ~BIT(pin));
+		mtk_gpio_w32(rg, GPIO_REG_REDGE, rise & ~BIT(pin));
+		mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(pin));
+		mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(pin));
+	}
 
 	gpiochip_disable_irq(gc, d->hwirq);
 }
@@ -232,7 +228,6 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 	rg = &mtk->gc_map[bank];
 	memset(rg, 0, sizeof(*rg));
 
-	spin_lock_init(&rg->lock);
 	rg->bank = bank;
 
 	dat = mtk->base + GPIO_REG_DATA + (rg->bank * GPIO_BANK_STRIDE);

-- 
2.48.1



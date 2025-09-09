Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC36CAC583
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KL9vzdB3rn5rw8BZuNP7vkkI7cxEgPULxm91j0nzvgM=; b=Fh7FRJuo+H0wmnlOyb3CrurXkR
	0PZ6mJ/saNglEQbJMJafb8muZwTBPi1Kv30kj0v4cvj/yUw5Xj86nz/Nde+uqI8rfos2s1ToZoYCc
	xvTOsFucMz+JMmprI18uxYvSiqPCwXO/7WCzD09e0qPkRXBJT9rYIYv9GDp172J5IgI9dFXrn4NGo
	bJvVEyW8Yofm3AW5Z+wYD+GbKfr387LhR3SU26FjR9PV68U38CNAerR359K8hen65seM1WxlhCItX
	G/KQd5114OTwlXG6IJDKu2aXBYFgeDHJ+UjcYPZkVLqy6eoaMblsbnwA9oEYHl6SWjaP2j2saP1MK
	nyRoL2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwa1-00000006l9F-3bgy;
	Tue, 09 Sep 2025 11:32:09 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSH-00000005skP-2dET
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:16:03 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so2640105f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 02:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409360; x=1758014160; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KL9vzdB3rn5rw8BZuNP7vkkI7cxEgPULxm91j0nzvgM=;
        b=HbRUipN5bFXfQ3ilSLysfuc8//iKigRMMegsUu6RAmZH3LcyyIxwh7k6PpLqBmFTpW
         938/d46gXLL0oNEPWCo2DeuWOEfI1+GlXCvSRhZW+DtDx0UEBhsIxxA502Kk3D60oj4H
         EO8nxwb7LYILTtt351AoRJ3DwZecjDQA9CNgvJQRZIGYr8xZ0baTWhVsjK6VjQ0d83rF
         cYKlc2xVAHcbGfGnWj/Gj3bcZQZjqYH1lhMQNWGA86I9E/HI9XIhmP2zQB2e+SrZz/YT
         nU/ZMd1q9OYNUyDwizOvNMBoh0RQ2h0HmkbS8YXuYe2isgP2hpVg+ppNAr8zdif7Hca6
         O4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409360; x=1758014160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KL9vzdB3rn5rw8BZuNP7vkkI7cxEgPULxm91j0nzvgM=;
        b=G3VeV0xD5VcdUp0fxJBmORDngoLCKeV+notYAkeIL1S+z5GIRb2pWIfluOJq8nG7oi
         rFXaF5xho2tAlCZBDCbzh4R8iWiI6vz14mY3q16NL405O/ZWg4ULGz1jBWuEvRiEDIUE
         h5Ir34/J3cQMbrvYxyrNV7Pfk3/MDceHGq/CiK/pF07plUPBBb7dlVzOuvx8N7/sTnNr
         yMkYlKASCRvOrYcVVaUvRNCjGPM1vUQvBN/8804Hd0VEf+Dg3rlazvdYyRpfKOzidUM0
         abPdJ0WeXAc19IPS5P4uceFgO6SaMy+pJywWio1Y7HElRcPsIAd3OMrQ44afD8gChXUo
         ioow==
X-Forwarded-Encrypted: i=1; AJvYcCXRHeeHML18wa8C9OH3YQk0QQ1bNuUFAynBak4ezir3vkcFBCFd0DFuhO19mJ5jjYSH6eLTE3qixhSJiwqBgg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2r1bk9mA4zwTfNnV1Rw6HvJSZ4UV3e6RZgvnI+AHghh7Y8LIn
	nU0sQvx/krKZ+CfJayB0q/V/DZk6yaiNnuy27piS/0jfnS79rIh7PTHo2/CJb16e2WE=
X-Gm-Gg: ASbGncttFB5Joey3dlndo48HccjrWCeJoC29hkWN6XdrQJJI5Dlzdh9PbIy45BT/NbD
	ao3zmFBohR+k8WsV436GzeTlWTbfeJ8yd6CeTclP+RDGrMa9Dz5Etd9Tvs1QOK08fgGtiCOvgop
	Y2INrGQsbxEc2QJil3y4/KKDSD9pQ7J7AW8JcW+SJeAGZoJltTAlhaqGJF8shSY5csMLpX1+zeS
	9TD9EsW/Aut3E1nwFjdaLRtsuP6X3FMTehCNWlwoyoMbhfCRnp5E9JN2vTcvPIsWU8/1NHdAQsW
	vKOllaqndYZVlFIJQGIyxpXKwNeJp80DvanGE2m8WRs1BY2/C8HLEscB5hXX7AqqleY8Y+vhMbZ
	Uz17+L3gwN5ijJNOuvTTW7hRmRT7P
X-Google-Smtp-Source: AGHT+IElprL5INRLVNJ+11qN0fy1HYZVdF9Hf2dkjaJyGXUISCK8Dqmmny10BUou6nIZqG3u9n4RWw==
X-Received: by 2002:a5d:5d82:0:b0:3e0:152a:87be with SMTP id ffacd0b85a97d-3e637465896mr7665428f8f.7.1757409360205;
        Tue, 09 Sep 2025 02:16:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:36 +0200
Subject: [PATCH 09/15] gpio: mt7621: use the generic GPIO chip lock for IRQ
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-9-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3466;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Oz11Eo/choziEy0hLlcQbOcdTEl544VmwNckDeQn6Nk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A56zsdMufj8Pobta094n4YAfVek1kM5dHRc
 3RuFMo6rwSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOQAKCRARpy6gFHHX
 ck/ZD/9kOmHM3sCPOzZ+PtF9D6Vwe/xJuMOGBuy7kR2ISYdA+n+r8GKYNFFP4nYxlpgWmS5AZ4C
 1x73FaP/rL03yvk6FmCRR59qwYYDoXzEvbeFkTQSNWh8LcZqRbR+l+/X5WEU9iRD3ascVlVF2+T
 D/Av/HOzNB0FQAHl8VB+63yHTVFDb2Izvfzk5Pc0f3uqSi6V6pLBst+R3HYv0s2yTQGqFelWKYp
 7raUH5xD0PLH2jiT9I80GASVctUKzPa2att4UUNaUl8t7veUxmRpdS/ZW9G1HwZS2OGvWHgdO8G
 zVARPtwdMr3nnIJL5da+yR38xhYniIU1tzKoYEkiFgZTyPUU/zIERxM9qHxq6oR+diGqaafx0Ma
 GF14s5chu1Di4MmgXJqoMcgeqNr5jWoswrVJLNron55YH+qCfah7n4ggD7plduSdtTvLnqHisYK
 +JXSAFqMchoqJajC2TS/z8xeJQ+2AfOsqKOqWawCCU/YLFPLotCX8UxcpnHeMAvjEaYBIn6Ilyv
 muINEZGvCBa/g8CGMcQzNwC1/x+79zqzAnQuahwXnKcHGzYPYT+8YfySJ6gs44DLHnLg3PXlp4M
 NfNd/bHJRWZIIjENkPi+B2+g6hvot/8XR+7fDQmoM/JaklpmUa2L9WV/IDYk1iWPO9aQ4RwTxUj
 scKngBko4gL2BHA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021601_688601_DFD8101F 
X-CRM114-Status: GOOD (  12.97  )
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
index ed444cc8bc7c2b921be6588ce850027a2e3088b4..31736f12ca100ef615d4aa4b2c968db6b58ef4e1 100644
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



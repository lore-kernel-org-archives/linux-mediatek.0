Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8906CAC583
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 11:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMmaVn+LZJgn5b7c1rWtdZrF0XHWPwWhtZTr2dtFlt4=; b=4TCb1Zwsw+AtVQ6QpCUWsyuth1
	0oM0BX+1jO/7T8YpP1T+yFpMyidRX5SNIH3N0RPFk18XEhVOIgg45n0hdUWAJEiDgWStGKHmgVYRf
	6tD3RbcRdpHwN+yaEtgA6Q11p4POmYjuK4y+h04fM/JHTRIhSTlUZnN1Nmb9dK5HeUkBiUUnoruYK
	E2H8/ph2jqcxlP8jBrcpG0og5+gNWBX00nh4BiXe7KoFTP1Vh05/DPrej14UnGBjETuaJOXQIKWFU
	P9PWnweJGIzL5l7LKZNMDp0GoU5EFcRLVDpsB9ZYnpP1o/Xs5lM+w1XJr4FXpwv5YrYyv1k5+H+RJ
	bpqWwvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwlA-00000006pJ7-36Qj;
	Tue, 09 Sep 2025 11:43:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSP-00000005stL-1LFU
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:16:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45de6415102so16931715e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409368; x=1758014168; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMmaVn+LZJgn5b7c1rWtdZrF0XHWPwWhtZTr2dtFlt4=;
        b=XsQ+TKL8dVTTzpSus38WrKQZWPjtFGJISESbV7L6OXap09xixaOboAlMwQ5lKQ62Ao
         Yv75cnVsKQWsWs/ncYM48KoV1KCMXxnOMgpd8XCGO7G9iRemiT4SLlfVi2/URUkkCsTC
         2qbEitcRFD2kTOuCY2icYWzEgwvBltwkFEiDIk/mI0o2tUV2VIqce5AH28t+aVzUb1sK
         IAAP2B2YzWCGdAbz52xCVpB1iJTvYgQw8yjMqmtFxuYJEabvwTR1uL5DmVLXziYLfBno
         SMTJPBuQLSSDMlBjiW1aLSsv1fCm6VPhCRVpLwzKLPfjS55sZNgpxCC+KbVz9NGuo0H6
         R0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409368; x=1758014168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMmaVn+LZJgn5b7c1rWtdZrF0XHWPwWhtZTr2dtFlt4=;
        b=Z3B7uD11Ju/Z7MhOkizq/2W8tdZrFlrnaLWnvIFFhoscaSN+TUT3assB4oqdsu+5TO
         dnyRJ7qBrjG2MQASYa+8oZ32qSML1Li9feh+S3oW+P4AMIYn6JWLi57YbEGN3jb7U1pz
         icrix9bTQs+MZXBHWGdgyE6u9t5fzcP00WEqK/WWN5YGzIVOGWWlXcQbzmhyDNM6BrLd
         NNehy4Hi8WGb51CnOIXca8jGogYusWxsIErzp+YYsg/1qahU3JlRhQqZ+sKDl6vN2cii
         PvWXl8+TKXBto+yK18J3eMel1bgOF6kiICA2VY+kEzRGXD+Ygr4YcJFVwL7COOM+mU/N
         uYtA==
X-Forwarded-Encrypted: i=1; AJvYcCXru8J1YUiWVEsLnKnOx3qHg5rDDfgfp+GrOaohFCLVgySjnUEk13V6fmyV97/BmS6pD4lqzma4NZpAPURKtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOsmEPcECWYImqYtI+jZVtM5eQauFcHfT/Bwt/DhW08aFdI5U3
	21wO/iEVrOzlZgNjCcnKElspUEZeEd+BKQErmoYgZHCGxGzubdq24RZPfOm8NQ5NxmI=
X-Gm-Gg: ASbGnctXdSTWw8zXuffvlp5WdCGJyohCQ9j+RWzw/jFhji7bmDSjd+6qJM4LbPiVKJ2
	pe9u2M6J+p+vSTD2qZdL2yjo4rj1yokDiVNzOz32/lbODO6XuTYOG2yDVyHg7dNZJQeu9/jwgvg
	yo8pP6gLggDBIvi8Sn/6Lt7Ei9C5T3eM16VPRd3IbvgaojU9mErbxqFujqzt5HtWVegp8haG15z
	ymIXCYkORUBz+BXzNWQOuVs6T8FnIAdNgdRBquGpy3r4iLnoG4d4xw9ZW99uvA9ZbCjIapjbbM+
	j07QnKqQucYDaSJAT7hmq6kvUzTaAnWk/Oc5pggtDxZLTPUk0WFkhdxGBmWB7pwPpLVUd/1HuZO
	eqycZgQdz/7Ir55xHkA==
X-Google-Smtp-Source: AGHT+IFmO6VqhZ9BkxEjJhWWUjTF6UtWEURBON8fvebih0GzMhUphDe9TftqByslO0IRvxtisIwrOw==
X-Received: by 2002:a05:600c:19ce:b0:45b:b05a:aeeb with SMTP id 5b1f17b1804b1-45dddec8ff1mr97136895e9.28.1757409367901;
        Tue, 09 Sep 2025 02:16:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:40 +0200
Subject: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OpZH1E4uX1rbCcdgDBOgsBrK0sLVF3+FQJb0MPT9Hmc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A6p94D+S/c4LzuEPR6IThg0j1mZ/5T2G686
 meGifKdh+SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOgAKCRARpy6gFHHX
 cvcmEADOfAiuC1Ep9RvIkJ+mqoo9WSMNXkDcTeYwBaiwwjIz0muCH85jNMqW9b3ZFhtBFSJuNtX
 arXg6eVDNEk4OcNWPJoc69s1QTJ9+jgvdXEqIvD/bmYCRDMpo+jQnl8UeLBhd7CBBEa45+1a68E
 M+d7xx0SBcN6nLNJqgO912DPu80/cw/gjXeHHbHoFmaCoklpIroAj2MEnMLoRluFVHoFaQ9d+8K
 Bu4Pzdqqu0HRLMJ1LAFhIF3VYoI+tpwPNIgT3E8/+5gmTzkcVW9Z+k/HLDTuKTyzC8lur0Ery/Y
 kT014qHXyE5TGEawY/IxfimrrtPXPu+wV2svkqUHpN3Pv7Qgph9GzQ8xluK3HnRV1tt1HUK/IMe
 f7j/0tewxNFyFeAGBlEua07W3bCnMCARotAno704aWDtPSIuP314GWm3T8z+l44QTe1F7vVVj/2
 8Q8vQYPB7OxkgxJv93dnJymPuJ1f4r/osq1nj6J8nngFzM2/Kc+UleQrCg+vmNpBSv4PTsApf16
 usJOj6hIKzfx05g/FzdSTDCqDptEEALnloKNJqBv1h8Y/qzjzei+M2XQmue1W5e8k7FqFuoP0zo
 AKlT5n8Ntxzdvl3e7GrObrqLBzaR9CTUOYcDGkDl1ixM/qLuQAJZWWxzTQZWfNeu0QrOndJIM/o
 3Bex3gwvCoubkBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021609_395888_D1E4CC49 
X-CRM114-Status: GOOD (  14.76  )
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
 drivers/gpio/gpio-sodaville.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index abd13c79ace09db228e975f93c92e727d3864ef8..6bc224d3a561077bf3438a70591e1f313ac834f3 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -9,6 +9,7 @@
 
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -39,7 +40,7 @@ struct sdv_gpio_chip_data {
 	void __iomem *gpio_pub_base;
 	struct irq_domain *id;
 	struct irq_chip_generic *gc;
-	struct gpio_chip chip;
+	struct gpio_generic_chip gen_gc;
 };
 
 static int sdv_gpio_pub_set_type(struct irq_data *d, unsigned int type)
@@ -180,6 +181,7 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 static int sdv_gpio_probe(struct pci_dev *pdev,
 					const struct pci_device_id *pci_id)
 {
+	struct gpio_generic_chip_config config;
 	struct sdv_gpio_chip_data *sd;
 	int ret;
 	u32 mux_val;
@@ -206,15 +208,21 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 	if (!ret)
 		writel(mux_val, sd->gpio_pub_base + GPMUXCTL);
 
-	ret = bgpio_init(&sd->chip, &pdev->dev, 4,
-			sd->gpio_pub_base + GPINR, sd->gpio_pub_base + GPOUTR,
-			NULL, sd->gpio_pub_base + GPOER, NULL, 0);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = sd->gpio_pub_base + GPINR,
+		.set = sd->gpio_pub_base + GPOUTR,
+		.dirout = sd->gpio_pub_base + GPOER,
+	};
+
+	ret = gpio_generic_chip_init(&sd->gen_gc, &config);
 	if (ret)
 		return ret;
 
-	sd->chip.ngpio = SDV_NUM_PUB_GPIOS;
+	sd->gen_gc.gc.ngpio = SDV_NUM_PUB_GPIOS;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &sd->chip, sd);
+	ret = devm_gpiochip_add_data(&pdev->dev, &sd->gen_gc.gc, sd);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "gpiochip_add() failed.\n");
 		return ret;

-- 
2.48.1



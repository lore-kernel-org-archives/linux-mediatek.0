Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E167C369D5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Apr 2025 09:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aG92M+ThGG8rcCnZb6WUafkA585r/LuxT+alwijT/5c=; b=oY7xY7x6naiclUtSBvayMHpUyI
	0etuzhBzCZR/uniBQCfezmoW1OSIv/jGR46AXepJgAve8sdCs4/xapjGWh+4jcVHy63fXHViRZVd/
	wgbVQpPF2GGOAOQ6KMohsSi9WqNUq69ehzbB8D06h6XDqhbP9VaHajP6woWnnfmsRS3zpN+XYjRM0
	xmsxW/48RDocy0O6MPdaTwDbGBhgGCYTMGRO14nLo1b/F+IEZyyDNGhhJEbxYrnE43dQO5XgHy2Fd
	x0R2pIZZIfcorcDdp77Zq0cXsnWZgb4obh03I3xk4u8PkPDmRFTRmWqx9eJyS8Q+IIijkQ/R5rrsW
	6etluL6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FqW-0000000Gdug-0EYG;
	Fri, 25 Apr 2025 09:59:48 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Evl-0000000GSXN-2Pry
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Apr 2025 09:01:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so1522534f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Apr 2025 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571668; x=1746176468; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aG92M+ThGG8rcCnZb6WUafkA585r/LuxT+alwijT/5c=;
        b=x+URsEzHLz+NfTlCvcyCIOVap9OvCaB087T/Y51B8iIdjrSc1qk6ZDVq3+lLTTcFkG
         qyDScyyq0at6iNsq2bXEom8BA65cQ4cpvO9SCISPkZSZCcKlQU0As9KhBa/ffo4L/HnJ
         OG37LS5UBFFEhq21UZhpAMuG8T9JPMOYWYv144kerm5vGNi8QWPeFbCNSIZrKVDTwS+H
         qgl6Ru4jAxjagC5QQreFZswat3aeaSBzRJmUAKPqFjUwV10y0aTDcw+ZcEpRKO/VKK/g
         n1CotrNyfqA5Ouf6jEurd4NVzw4X9elyWsUHdsdyMtEfPwXwUu6wov4RApGP4iD5PMya
         qaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571668; x=1746176468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aG92M+ThGG8rcCnZb6WUafkA585r/LuxT+alwijT/5c=;
        b=eWmjYdedW02p/XWjwJZOfKwfkU+wpOjzUxU6MoLXN0i8q+6Rl9LY7+sVVxY/0RAIuY
         YCntrQIz5hb1kE1vTcZ3MciyapbBvB1lBvM9v/0trdBQgnJ0b7WVSsbRX1NfJR1Zpnpi
         lkIgr7QiC5QS6GALlsd9K6XGKuv/VJAfjINkH3r81twZa3lDg9K3PYGkLiCCk1ndO92P
         fxB3yukwpY9U4lnuMpzzGK6NTLWuCwuET6Qp20paeq90ALxSuxb8lt6ieXvTQDooxuva
         CzSO6fjgRVFE7i9VbVWcyjk3zNADK828HSYXZInCjmwHMbLPboGdmgyizy66AP5b9/IM
         2/ZA==
X-Gm-Message-State: AOJu0Yzfih5MWRVveqhNWaMKZRPs6T3F4ZHO0jBsypQY2OuCYaopsZg+
	d3TDBH/Jq+StRKSYpBvLubKSEN7ZD8hmyvIGXGGe4fp1GJJgSOB1i45IXh6ryFYyNk3BRYZ4Jl7
	C47s=
X-Gm-Gg: ASbGnctFgGk4T+D5Q3yQxY6BbnjY/H445QMr7RWaXidZAY3OxFqsWpS5hvKH61m7kcP
	7uEsw7XA7URLkpWuQ0VK9wjhEP6EBmjFmJTHPfIWIn7TcKTthdt+HNU/9tl4Ge0GhIZaaNonPS7
	8z8RGMAgRHNfx5TGuS/OpInMBUw6e8IWmS6yKXGiuzrkOEAftbbe0l1+K/7n518KiLbRKec6WP7
	G6DatjUf+IPgQ9gTsi5px6p9euT+ajxAOa3UOBE+Xcr7Lqe+8qt1KywBMKuYlTUBkhH9tEbeSkG
	cQZqOqox51O5l6nw5b+it+0MIszZwZlLUA==
X-Google-Smtp-Source: AGHT+IFW7oHQT2iQkXG5/oplsgKCVuoYvLPqlkf0fWIPHa0BO2c6LkQgBuCA2L7Ixcx9kcJza03b8Q==
X-Received: by 2002:a05:6000:1ac6:b0:38f:483f:8319 with SMTP id ffacd0b85a97d-3a074f4853cmr1080551f8f.51.1745571667902;
        Fri, 25 Apr 2025 02:01:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:00:58 +0200
Subject: [PATCH 2/5] pinctrl: mediatek: paris: don't double-check the GPIO
 number
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-2-93e6a01855e7@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nUKaoN4taOpveP3nc3OVuJSxVohaZIGpFohuQJLAScE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09P1im4kKMb6U7RG39p9G/VrnbdkYWFGjboY
 3bmo1dLQC6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPTwAKCRARpy6gFHHX
 crgtD/9is3Kf21qiXzq1VSscbgtqKAJ8hb/XCsd0cS2PtTKxYDWP1SnTIL4KX7ofzZY6+UNXOZp
 dy+D4aO7WNZsFR0/IHIeqWBWEk3rmMlSGkbfrIVDhpWvtIo6opyCQxql8Q5LViq0LRe6JEPRdoC
 Lor1QT7DRjA92oRtQppJ2/eJZFWLujiVsYYPLfXICUinmpUOHk2wHZ7Juzozwht7N/RM8hDQi5w
 Tq5I9jApIX7HuFwuRuILD7KrOPs3yAIkxg5EIl9t/8uEheTZAUl8gjFrt2oXh1d8QjiG6UIsnQ0
 FCxUF6W7Qt3yoXvJB7BVE+lfhs5yJuhuQiBz7jSQOmUCnEpPC+rnlE6PEgqlrlB4S3UfQMyfxXu
 TkZGAWz6/V/ricSCTfoPbWxtHT/fmyIr/PoIil6NMgsEtw2lsTQZclPoBCEjv8FSHBZaLlZp21M
 QjWftw1cUSxo+sR0S6FDFFCo3EdAN3zIgltKS6I3KlaRXzygoM+OsakxjcXFba51INkzT5w7nD9
 EsU0E0Z17ILt6kloAzswTHoIJKQM1NeKw/qUNa1zMq4sLMkRIadcAf8J8lFYGsqLQt+KrRyjmQN
 85NWWLYzuxDF0gYe0/Ci8Zos6oglGyM6ff6HvFfXZwh0zf1/igURjsYJ8qyXym9CZlTm2F6YJGx
 sWnd0wD08yn563g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020109_605283_2256DC55 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

GPIO core already makes sure we don't pass invalid GPIO numbers down to
the driver callbacks. Remove needless checks from the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 87e958d827bf..852ce0ac7ff9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -840,9 +840,6 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	/*
 	 * "Virtual" GPIOs are always and only used for interrupts
 	 * Since they are only used for interrupts, they are always inputs
@@ -868,9 +865,6 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
@@ -885,9 +879,6 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
-	if (gpio >= hw->soc->npins)
-		return;
-
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
@@ -895,22 +886,12 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
-
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	return pinctrl_gpio_direction_input(chip, gpio);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
-	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
-
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	mtk_gpio_set(chip, gpio, value);
 
 	return pinctrl_gpio_direction_output(chip, gpio);

-- 
2.45.2



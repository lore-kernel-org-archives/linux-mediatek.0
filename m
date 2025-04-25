Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A845CC369C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Apr 2025 09:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZB90erWf+Gm+Y0GtLErqGxR/pE5/v4Z/PlOKc5IF8Kc=; b=pNzTUsVCXiJLfvDOfDqBQRe+Q8
	5+2yxUCw5EA5fPXcHnlYUvPWqN3/ZssFZ3qfkc5cgUqb3S+UOjI6Bh8CiHgap1cOHSxYCG/EX0sLp
	Qfm/1L5dtDdY901NozBDsN6eoFJQYjyucPXVKiZn310BcBoK1uxfF1ypuU3wUkVRiDzNVchCMhmvZ
	iSDlLMYt9GhK95DGB4IH79NHQfdEkqYDFgseuem1lMbXIdnRM9+kTYRrmm6YsQZ38ZcHakfhAZ9Qy
	GuCafaBP5lX20shyj8P130sa6UTeB/fCv2li06PtasmfVMG/8bcBjEvxqPUf8LYkY5GkWJfIkK2pj
	jSPHesQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FqV-0000000GduQ-3AxD;
	Fri, 25 Apr 2025 09:59:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Evk-0000000GSWs-2Uw6
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Apr 2025 09:01:10 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso1286161f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Apr 2025 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571667; x=1746176467; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZB90erWf+Gm+Y0GtLErqGxR/pE5/v4Z/PlOKc5IF8Kc=;
        b=R9yQpTg99ED/if+ZPKOBuJ4M1ar8ASov5w6snyhwH7u4MAxAHTYGbUW9SsfbujxYYe
         jyxHysRJq2MhiNkg+hnE5Xl2HBXz5ZshD5rm/35JF5B6hNVJzooik6IUB8e48P+wybbp
         06CzeC9PvJHyUmo60P0RdNjD63R+79yUd8MlybiQ3Wl0w8Aie0YW1b1DhKx4ikm/uKDA
         ObHMwDb7HiLfIZU6oqhu623oZooiNKCjzPR0G+THse7YhgKZLtHcd8Y8yslU9cjvPJn2
         iqMLcbE9QDonvPxWI2CI8kC5wD7lwrOiHY9AJ8sGwJv5imFnqH0svGDQYnOy55dz9s1h
         arKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571667; x=1746176467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZB90erWf+Gm+Y0GtLErqGxR/pE5/v4Z/PlOKc5IF8Kc=;
        b=xNK1hf2SKxv3zHFrD5/rMi5zvow8GIVBQ5HveueMXgfTWv2oDJtBpDPWngF3jEBEsv
         LIQJsQRzbXVrcHtUlvJJK4lphV80wTLK1GBiDTMhV8HP5MLFemab29Nw1vhubH/KaWcm
         EYYfkDPiceRuc7/79fpDdCFhFsZdFGjfcJCa3zwWop3jlmF2SfMcJN3A4/RMtii8cEc7
         2rGiFMxy/ebzl6QswSbOQZfV4WQhWHeTfKzWlkS6TI6CzJ5PBPVp836JyBSwlyIXHPYj
         zqZudUyiq0xLt4pDPYNnMySBvNFHjaFjufYOZQ2C2skIXSiQVErV7gZG9rNp4q9VT1bY
         vCmA==
X-Gm-Message-State: AOJu0Yyz5jSUK1sqTI+iUQadyUQpfpDIcxdrxQD13TASNU+mhldLkf1z
	lrwbbl5Z9Wdt8krRDHFXgVcE71XdM67MjcYu0bDw8STlxS5znoNCPzhkiHs3KOM=
X-Gm-Gg: ASbGncsXAR2XasZksauRFVtIMIXbVFT3bXBOpv9xBJWADePr++OL2S9jNHnC5RXz+cc
	dA/LpnNw8N1IRWUdvC4VnbQv4BO8ctvFN3w5qN3wqOOEEPiuNHumTA3tAMHoXGsScBMiCJb485z
	+GXXobOTo2ZOIAWAlVcUwuwXan3NBrrfVWpLwL8rQpkG1+vrDIEwL0IXaUQWt2PR1kQ6tYnyZe6
	Z6NLUWEq7SJW5YFaVgAUtSZk0oGyq6iNAsxhXwcYn7naJlvvgRdb/8hqM77Lo0or43gufCzIfhU
	V+AzDGFQuGF6pVU8lB6CGSJMRDyrMyARQA==
X-Google-Smtp-Source: AGHT+IF0m8rX5UMES4nVD0erCZ4KstVSP6VZhmeff7Jfr6OuosoVYyYD4igGlIuV4D5i2BVa1x4EkQ==
X-Received: by 2002:a05:6000:1a88:b0:39c:1257:c96c with SMTP id ffacd0b85a97d-3a074faf4b3mr1205781f8f.56.1745571666825;
        Fri, 25 Apr 2025 02:01:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:00:57 +0200
Subject: [PATCH 1/5] pinctrl: mediatek: airoha: use new GPIO line value
 setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-1-93e6a01855e7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uaHOfJ94TFx8k9XlThx6lSkpYsN9+1e6SW0WrRZmuoc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09Pjw/np8UeS1ttDZIlSftl0HIaXAVQAcTl+
 qHDg6ttNnqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPTwAKCRARpy6gFHHX
 chLhD/429DgRXwmTcgjG7Djz7jHNaXG0YDQCs3in+FxM1KrmgZ7nENGsnYdogEPNSvdYBfsUhwf
 JSQNi2Z47oZ0and5Yvmmv3FnmvnBUpbtPa4O++YpL8TVUq7teVZIBYCPkxG6uWpbX339RqRVb4Z
 Eu9FEoXAE5JRDGSRUmJDfaRHGeGq4apiYTNBsQpo9cnQN5L4m9pDIlRoM7+e2tYyrEzG6/v8egd
 OSP1y6+t9WuoDPeH25a1e9Ta1ehj2ViYsD9E4pQE7gM7EPm0OsJqxT007wmerUBuqvCq4rTncQ2
 0EQP7ORGcUfUsLT5R/cBcIYlUFbhziuNBpeBaKginbJoYLu8wfb+ospruKX203GPKzCFPtSSRQj
 9TyWwf1wV+kQYa/OkcDoCC9ScRxvDE6V7FTE4KzW54hNfzl46gZK8JoJKj1+7yQQgjVnY4AqENs
 Pt5WUaDQWxdfQotValBICHCN1jMnaWl4dDMso+xs72ErbEvVrbB5xIWWPoFuBGdazfWDfMDjyaI
 teZVW4YCDH9O2N30eJRp9/ON2MYaliiSvfVZDr6YcXTCzcmsLIIgKqrvexUxntmwoYebcguTINs
 SGM+230tfxLUtpfvpwqrxYPrpsv28wSCb1BlDuLaLdh+bHvGajSdqgZlxAAN8qwALpRkoR4o/K8
 rSv4Yz4yX+so0eQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020108_671783_5F8F09D6 
X-CRM114-Status: GOOD (  10.65  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5d84a778683d..b97b28ebb37a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2247,15 +2247,16 @@ static int airoha_convert_pin_to_reg_offset(struct pinctrl_dev *pctrl_dev,
 }
 
 /* gpio callbacks */
-static void airoha_gpio_set(struct gpio_chip *chip, unsigned int gpio,
-			    int value)
+static int airoha_gpio_set(struct gpio_chip *chip, unsigned int gpio,
+			   int value)
 {
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(chip);
 	u32 offset = gpio % AIROHA_PIN_BANK_SIZE;
 	u8 index = gpio / AIROHA_PIN_BANK_SIZE;
 
-	regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.data[index],
-			   BIT(offset), value ? BIT(offset) : 0);
+	return regmap_update_bits(pinctrl->regmap,
+				  pinctrl->gpiochip.data[index],
+				  BIT(offset), value ? BIT(offset) : 0);
 }
 
 static int airoha_gpio_get(struct gpio_chip *chip, unsigned int gpio)
@@ -2280,9 +2281,7 @@ static int airoha_gpio_direction_output(struct gpio_chip *chip,
 	if (err)
 		return err;
 
-	airoha_gpio_set(chip, gpio, value);
-
-	return 0;
+	return airoha_gpio_set(chip, gpio, value);
 }
 
 /* irq callbacks */
@@ -2419,7 +2418,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->free = gpiochip_generic_free;
 	gc->direction_input = pinctrl_gpio_direction_input;
 	gc->direction_output = airoha_gpio_direction_output;
-	gc->set = airoha_gpio_set;
+	gc->set_rv = airoha_gpio_set;
 	gc->get = airoha_gpio_get;
 	gc->base = -1;
 	gc->ngpio = AIROHA_NUM_PINS;
@@ -2715,9 +2714,7 @@ static int airoha_pinconf_set_pin_value(struct pinctrl_dev *pctrl_dev,
 	if (pin < 0)
 		return pin;
 
-	airoha_gpio_set(&pinctrl->gpiochip.chip, pin, value);
-
-	return 0;
+	return airoha_gpio_set(&pinctrl->gpiochip.chip, pin, value);
 }
 
 static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,

-- 
2.45.2



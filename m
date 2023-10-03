Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BB2E7AD60
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ks2t/2sFBUuZyfDpT4cAX7qKrPmH6DMrQUqaUAZXib0=; b=pXSAmtbFRVsAiHzBHG6X1eafhg
	rXI4ZeNh7u4n0cZ5zkM7SKmAfFQ9xyGL/6poq91J8+SaB782w/6IrKuq1ydyTp88DI91xH3cFUSQG
	qUvTTZ4zhyPZMFo00qA++Q8RPVz+JNCq1zUcI+x0GDq5T508mUR/Kto+CyjKL1sP4Yrah8va3T4+N
	b5hIMCo+uyQKaME7ENh3rIqM9Bg+iRfTeaEz557QZbapo/QMXfm9ORbESLKEXKEnna6ItJSe/u6Qn
	VabcPew84hk7JcRvE31QCDnBjauWTKQSyCKn3gQAOlU1GIIJ3smucVk3mvXuGuWt6u51AJO78nqLv
	SD0ZRH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qngkU-00EpRr-2j;
	Tue, 03 Oct 2023 14:51:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qngkS-00EpQZ-1K
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Oct 2023 14:51:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso9921365e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Oct 2023 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344700; x=1696949500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ks2t/2sFBUuZyfDpT4cAX7qKrPmH6DMrQUqaUAZXib0=;
        b=DrT/RmEj28haTZdc8EfSJ2iXOfSnzzTREKNXRp50UEd6J5bmeV4MTIP2TbQEfzUCrI
         +XM/bos5GBB8QFOP3Gg7+3BgdLJg7/KuNuFpklu6ZWMRhHFbLeTsSHwEueflAEmC9TG/
         DW+axppxqj9EHXoQ8sR5ofdicQTgNx0PS7ElU2pwvyi2NFCI0qV7WcZAah31IX0e18Ru
         bjFJOr2o9jDwB6pqu9JGDPoThgKxkKuuQwBIUa2LU+OYZZlZGItqAEy9EBtsVjfkEnAK
         KNTebAy/wx8v2oXwEyIoKE0znT2njDKRu/7dgd+GfamnpffBE5R8rgUg9+XRJWKWBBdh
         MYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344700; x=1696949500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ks2t/2sFBUuZyfDpT4cAX7qKrPmH6DMrQUqaUAZXib0=;
        b=iT3dQexEw1VmIKmkIDTmMjdLddhaB/Zm6o2INmCbPuBtvyQQnO7SB6KLkVdIdHYxW1
         FPdN8ml7uVuytUYcZdc3sNVakBDZLRDVTNz1KyeOUBnn/Xsg4R0xJoatOmIoxilQHZ2E
         nnyUrLWmPz5dWAasKGBF0UeL9H6BoEwR2VtKkH5LrSGUQmG7ChmJgRWA3KoV5/UvlM4Q
         bo97z1CyImKLTrHmb9s1G+fZ/5lQsl/HDC7qUURttSJNxmBTUhm7qKv3vyfTuahjjYSM
         y2VRT1J+katbGswVDE/UQIAdLFUexuZOxWjcDguJrVIA4WvViRMobOYaKYOSvR1iyotM
         xxRw==
X-Gm-Message-State: AOJu0YxVwRUn1KinYgG3Xh0/9tp0iza919VxJWi+LK2RsP25Z/gFhsmC
	fpDqlOav+wo4PjyD9NHgHgYZ+Q==
X-Google-Smtp-Source: AGHT+IFUqR+B/szZTRDo5xgv2b0OGWRpC2vhN/v1bUskvnm2BzTjMR/Uc7/sn0fYqGUE09vNlF8eTw==
X-Received: by 2002:a7b:cb89:0:b0:405:3455:e1a3 with SMTP id m9-20020a7bcb89000000b004053455e1a3mr14062183wmi.17.1696344700655;
        Tue, 03 Oct 2023 07:51:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 22/36] pinctrl: mediatek: use new pinctrl GPIO helpers
Date: Tue,  3 Oct 2023 16:51:00 +0200
Message-Id: <20231003145114.21637-23-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_075144_450778_FF49C648 
X-CRM114-Status: GOOD (  13.31  )
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 4 ++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 4 ++--
 drivers/pinctrl/mediatek/pinctrl-paris.c      | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 889469c7ac26..dc41ffa31357 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -512,7 +512,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	return pinctrl_gpio_direction_input(chip->base + gpio);
+	return pinctrl_gpio_direction_input_new(chip, gpio);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
@@ -520,7 +520,7 @@ static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 {
 	mtk_gpio_set(chip, gpio, value);
 
-	return pinctrl_gpio_direction_output(chip->base + gpio);
+	return pinctrl_gpio_direction_output_new(chip, gpio);
 }
 
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 74b15952b742..fc046415b567 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -811,14 +811,14 @@ static const struct pinmux_ops mtk_pmx_ops = {
 static int mtk_gpio_direction_input(struct gpio_chip *chip,
 					unsigned offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
 	mtk_gpio_set(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index b7cb5a1f1060..14b151aec2f9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -916,7 +916,7 @@ static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
-	return pinctrl_gpio_direction_input(chip->base + gpio);
+	return pinctrl_gpio_direction_input_new(chip, gpio);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
@@ -929,7 +929,7 @@ static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 
 	mtk_gpio_set(chip, gpio, value);
 
-	return pinctrl_gpio_direction_output(chip->base + gpio);
+	return pinctrl_gpio_direction_output_new(chip, gpio);
 }
 
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-- 
2.39.2



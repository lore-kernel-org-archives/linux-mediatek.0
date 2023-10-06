Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7ECE81DFE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 13:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gs9kODHBf7pe1hvttMIGP4XQeIHebOI3TikCUwTzhsU=; b=1WCatcdzzYdpvaTeZk1Tx1boXx
	AhyUdEiqTHEtlwIHXR23iJNvWS3cYst0NZaJEHw/2K9/TBU6xKxaEIZ01oO1KzdSFp9F3TioDg7GE
	d4wQAaTtgwimC8SPitcvHoNeuI11Le/zkuP8e5tmoDZDqRfBlgPm6HtGi05f+vzLjkqOytwqL0mnk
	Wxmkb1Csup3mjq76iC11XHhaM7E+figiblbwuwJCectu7IunYC5QcQvmJm1w5wzh1c7GwaaE7JHak
	GRkyPuinjTCQlkD9Mk6/ITW5RvYJzSOy+eXqqKIao1wmDfOIiXkn2ffmzEuZHL0Bjwy4xY9Ld+NmX
	IplnFWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAA-005vE3-1A;
	Fri, 06 Oct 2023 13:46:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolA5-005vAD-0i
	for linux-mediatek@bombadil.infradead.org;
	Fri, 06 Oct 2023 13:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Gs9kODHBf7pe1hvttMIGP4XQeIHebOI3TikCUwTzhsU=; b=mEL8ZYS5TS4lf7TLeFd6ErMPpe
	3p0JUiLX8g8bnqZfleYDfCveWvV7ZezmsqWkBq3uW+noVtXFuPPaIxkK3ExPN3tC4bo9sYRpA7oCY
	0Fp+MtfSVbdjlvPOVlpEmIjJgoAwrIkS2s0NTm+v0+o6qZvog4SmddH0y+ZIzLZrKbdLkAItHhkwn
	Un1uUsJmYz7HZZNiQQNM1Wk67I6/ZKIl8MyyJqMoZzJjzdaXQNSjGy6O+AcE8ObmsOcbnLkt0OHdu
	EXRt/bYuPhea46RNDQQF5dqva9Ak+KVv8OJR6OcmIurRrXz4ErVxcOUVeQz7I0huvmKXud9I1ywEn
	NDUtBsGg==;
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qol9y-00CfUa-18
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 13:46:35 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c1886777d9so25663621fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 06:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599989; x=1697204789; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gs9kODHBf7pe1hvttMIGP4XQeIHebOI3TikCUwTzhsU=;
        b=WcqI5ym6WdOUQAlM5/40c4arxozL7POEjukiQO8r1EnjzKMHvvsm6IqvR0Wb2GhPM7
         GSOm+/tdVLAQOhNJ+IMSMyot9ai4uZbEHwi42SjZAfacC0qRjm9e4/no8NWJ3YtJU/AC
         TpWQOw5ZX8ObDb7LegaoZlP0upWGD+SJHMd01SlypQ6sk1eeMuABqIMQVMLEer1XcGUo
         3kYjhKr8wywTrlGTR9y4UNIzxc6p2pKjesVBv0t2WAjAx647QvMEFPLbkZmjgZq/Z8c9
         VvcYxtqx+vUJyqTNE7JZ93yUWR6oD5xeP1li3IHmn73hpwBpOOTXlYKlF9aZrMw4WvCw
         qOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599989; x=1697204789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gs9kODHBf7pe1hvttMIGP4XQeIHebOI3TikCUwTzhsU=;
        b=eucXXqu57QB9OyfMRZ0J9JqRN90M6SqMdcbfm72wXveq0yNzeIyTj1whLMa+L56LcL
         KfIfiqmEJhtT+VLgUarZADQRKmQm4adh/I6lwdC/pehIDXznL9slBvM+mlOrIF7lYoAV
         DPlXUR+L/dOQIFuKAQOC3nKK9Hr2nRsFQc0BxxyAlzS8iPl5Y26UnSrY90wkEWouF8Xg
         dA0Q3wFqs+7WUDFgVvBBx1JNR2Avq67kBMGEN52xFvMXcNfdrKg41YgF/QDzbNJ/NydT
         BmSeDK2v1SIDNdLHxQX0LOrvDxr+NwVSVx+pggTuRRBoSagmgsYcYXJUhhwy7uAsuxoj
         zTKQ==
X-Gm-Message-State: AOJu0Yzl4U3SYSWXXuXAb72qLmRAySpq6EeB6Ru11BAu9digynXX+NIM
	3QnBRhP+aiYU+FWGyECl85ry8w==
X-Google-Smtp-Source: AGHT+IGilaqLsNAkpUFN8HUXTZkEVfQxXSILLUJqpOsm7o4gtJ9UIFBnw+6Mj0Tl221lqSmXK7G3yQ==
X-Received: by 2002:a05:6512:238a:b0:502:a588:6609 with SMTP id c10-20020a056512238a00b00502a5886609mr9257631lfv.3.1696599989015;
        Fri, 06 Oct 2023 06:46:29 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:25 +0200
Subject: [PATCH 2/8] ASoC: mediatek: mt2701-cs42448: Convert to GPIO
 descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-2-07fe79f337f5@linaro.org>
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_144631_920538_6F7C9A76 
X-CRM114-Status: GOOD (  15.00  )
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

The driver is pretty straight-forward to convert to use GPIO
descriptors, however a separate patch is needed to accept
the DT GPIO resources ending with "-gpio1" and "-gpio2"
instead of the standard "-gpio" or "-gpios" name convention.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt2701/mt2701-cs42448.c | 54 ++++++++++++------------------
 1 file changed, 22 insertions(+), 32 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 08ef109744c7..81b695a19dc7 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -10,16 +10,15 @@
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/pinctrl/consumer.h>
-#include <linux/of_gpio.h>
 
 #include "mt2701-afe-common.h"
 
 struct mt2701_cs42448_private {
 	int i2s1_in_mux;
-	int i2s1_in_mux_gpio_sel_1;
-	int i2s1_in_mux_gpio_sel_2;
+	struct gpio_desc *i2s1_in_mux_sel_1;
+	struct gpio_desc *i2s1_in_mux_sel_2;
 };
 
 static const char * const i2sin_mux_switch_text[] = {
@@ -53,20 +52,20 @@ static int mt2701_cs42448_i2sin1_mux_set(struct snd_kcontrol *kcontrol,
 
 	switch (ucontrol->value.integer.value[0]) {
 	case 0:
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_1, 0);
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_2, 0);
+		gpiod_set_value(priv->i2s1_in_mux_sel_1, 0);
+		gpiod_set_value(priv->i2s1_in_mux_sel_2, 0);
 		break;
 	case 1:
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_1, 1);
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_2, 0);
+		gpiod_set_value(priv->i2s1_in_mux_sel_1, 1);
+		gpiod_set_value(priv->i2s1_in_mux_sel_2, 0);
 		break;
 	case 2:
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_1, 0);
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_2, 1);
+		gpiod_set_value(priv->i2s1_in_mux_sel_1, 0);
+		gpiod_set_value(priv->i2s1_in_mux_sel_2, 1);
 		break;
 	case 3:
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_1, 1);
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_2, 1);
+		gpiod_set_value(priv->i2s1_in_mux_sel_1, 1);
+		gpiod_set_value(priv->i2s1_in_mux_sel_2, 1);
 		break;
 	default:
 		dev_warn(card->dev, "%s invalid setting\n", __func__);
@@ -382,27 +381,18 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	priv->i2s1_in_mux_gpio_sel_1 =
-		of_get_named_gpio(dev->of_node, "i2s1-in-sel-gpio1", 0);
-	if (gpio_is_valid(priv->i2s1_in_mux_gpio_sel_1)) {
-		ret = devm_gpio_request(dev, priv->i2s1_in_mux_gpio_sel_1,
-					"i2s1_in_mux_gpio_sel_1");
-		if (ret)
-			dev_warn(&pdev->dev, "%s devm_gpio_request fail %d\n",
-				 __func__, ret);
-		gpio_direction_output(priv->i2s1_in_mux_gpio_sel_1, 0);
-	}
+	priv->i2s1_in_mux_sel_1 = devm_gpiod_get_optional(dev, "i2s1-in-sel-gpio1",
+							  GPIOD_OUT_LOW);
+	if (IS_ERR(priv->i2s1_in_mux_sel_1))
+		return dev_err_probe(dev, PTR_ERR(priv->i2s1_in_mux_sel_1),
+				     "error getting mux 1 selector\n");
+
+	priv->i2s1_in_mux_sel_2 = devm_gpiod_get_optional(dev, "i2s1-in-sel-gpio2",
+							  GPIOD_OUT_LOW);
+	if (IS_ERR(priv->i2s1_in_mux_sel_2))
+		return dev_err_probe(dev, PTR_ERR(priv->i2s1_in_mux_sel_2),
+				     "error getting mux 2 selector\n");
 
-	priv->i2s1_in_mux_gpio_sel_2 =
-		of_get_named_gpio(dev->of_node, "i2s1-in-sel-gpio2", 0);
-	if (gpio_is_valid(priv->i2s1_in_mux_gpio_sel_2)) {
-		ret = devm_gpio_request(dev, priv->i2s1_in_mux_gpio_sel_2,
-					"i2s1_in_mux_gpio_sel_2");
-		if (ret)
-			dev_warn(&pdev->dev, "%s devm_gpio_request fail2 %d\n",
-				 __func__, ret);
-		gpio_direction_output(priv->i2s1_in_mux_gpio_sel_2, 0);
-	}
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);

-- 
2.34.1



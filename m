Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38A2E81DFE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 13:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcctjBppf75NLO6YkO8Pl2INJRmj2vKxlHT5saQtZoY=; b=W5EZXGvyr+ZslZGb5s83weqQeq
	trVQjxlf4wAeMhUSnT3JLVWM6nmYI3UBnHzLvqC93vjPPzjTakn9FZCCIUEDM8Qs0jNYstdbo/KFY
	PV9LVf4O/2mXpeBCSwpnOBoyCoY7NuUGh6Ywj+6D+6Zeg8fTk1ujLTKFo8zpV+ui+Q40Gw/U7bv9e
	iCgyrtNDYWKVCKp9Ch2hiqvEjeTv8vEPopRTX0ejqqgQ54t+MjCvQZF3VqoAk9l+57aFNXF+BL7yt
	77Y08T8sNI/RzbwXyd/grVLhW3OoZl5jxT/rBFcUrCZa1K5duoqDhhT29LdEMG3VxUmumb9SnCKU7
	btn6xadA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAK-005vL4-0h;
	Fri, 06 Oct 2023 13:46:52 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qol9y-005v4d-1H
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 13:46:39 +0000
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-504b84d59cbso2836101e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 06:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599988; x=1697204788; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcctjBppf75NLO6YkO8Pl2INJRmj2vKxlHT5saQtZoY=;
        b=Z5Os7KVBCbWV2a+/PL1DZ6dUQJDv9BSr+SFNA8T3UUxc5nVtp4WeMi8KCOLzXLNnBD
         H+P1iY7Q/zR22SflE3KvVn6lbtcZ+JvY4HTCkXNuTODaFznYZod/klUkGHM5T99Wq+v7
         nFon/DY5B4WLEWEMyPdz5cm6EfhCquQ/NWbLk5q2pzIIgEtSMXB3NnVr4dn8cyRzRTZI
         7zIWZb3KZ6PITUQtDY7KtaPWzO/bPL0qOmAfYaLZZDw3Qk3+67UpRjz6wCREWvTR2SG9
         0Bw8X2qfx/zwl1juTYK9qsEZt3P772ygN16aIUm6P32RALZu7XAx0EGO7O9kKtj9sDZm
         bcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599988; x=1697204788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcctjBppf75NLO6YkO8Pl2INJRmj2vKxlHT5saQtZoY=;
        b=uU7wGIWk5NyX/xDiV6XRgmoPaW5sq5jNQrcbKntViODnU/4jIxMCV+5EwPs21qWt1g
         asKGAEp443W+NIAGKxNn1RKs2cZnf0CP2ywsVMag3XbE5Qm5JmsLQLi8zQp6+/mY2GG6
         AEUluL17JbftncuAVrBcemReKGW1DSyGVXsFyUqhE78KIjDQo3XhcAcC97w/rI1JdQty
         78by/N2uSGngbIAgeCMVcyJsrAvyvTAzMOiEKWf0QW+SjTJULXgF61bRv+iI2t6Vf7R8
         DNa8zvuzhC1CuTwcPlYHr5tORlWJCcUE/A3mdZQ2t7VuylMIjCqi0hM5oAsFxqTpzNJq
         FnYA==
X-Gm-Message-State: AOJu0YyafVdTaVcqVf/xaQUU+dWKE+9D44JTFYsCCsNwza5xzabpKeWp
	UV2syal2wuc0Kr89iVZqTdIeCw==
X-Google-Smtp-Source: AGHT+IGGfV3zI+nczOVhjRr4Mwdj1t6P4p9VuGFvQPwS1+LInpdbM8MctPtTPICaU62NLB0lwNF8YA==
X-Received: by 2002:ac2:5f62:0:b0:4fe:5860:7abf with SMTP id c2-20020ac25f62000000b004fe58607abfmr5744253lfc.13.1696599988003;
        Fri, 06 Oct 2023 06:46:28 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:24 +0200
Subject: [PATCH 1/8] gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-1-07fe79f337f5@linaro.org>
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
X-CRM114-CacheID: sfid-20231006_064630_435590_6E4919D5 
X-CRM114-Status: GOOD (  10.55  )
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

These gpio names are due to old DT bindings not following the
"-gpio"/"-gpios" conventions. Handle it using a quirk so the
driver can just look up the GPIOs.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 531faabead0f..d9525d95e818 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -512,6 +512,10 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 #if IS_ENABLED(CONFIG_SND_SOC_CS42L56)
 		{ "reset",	"cirrus,gpio-nreset",	"cirrus,cs42l56" },
 #endif
+#if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
+		{ "i2s1-in-sel-gpio1",	NULL,	"mediatek,mt2701-cs42448-machine" },
+		{ "i2s1-in-sel-gpio2",	NULL,	"mediatek,mt2701-cs42448-machine" },
+#endif
 #if IS_ENABLED(CONFIG_SND_SOC_TLV320AIC3X)
 		{ "reset",	"gpio-reset",	"ti,tlv320aic3x" },
 		{ "reset",	"gpio-reset",	"ti,tlv320aic33" },

-- 
2.34.1



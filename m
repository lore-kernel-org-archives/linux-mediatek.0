Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426CCC001DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0cDrJs50zXCjDACInHgYpsbmw7IC3CDn78nE0wDJEU=; b=VAvTE2gFt8BbapfQVDjWxgDZfJ
	LJPNlpQTkMEaMKt1D5d1yajKYfgDHknN3wQwCS45ko4q2DHHefoJ2IQjZI7v3aV965mgJdBuJrE0i
	CCkYAb+iOyh/yDYOutFDqYGoj00M5vtmnTVb2jzRYOEGNiQn1yoO/G+WLNWGGtmao/STMo4F7lNMN
	OeUnwR19lHLgdk/Rl7W3yrI47j+wuL8F042qkXG0WlO0m8n64VoBzcXupgpVxFdr+friEAbR12hhg
	NjPnhR6QGI7zHauS6Y427gc7337CjkDfmGncXSIUuMibXePlkFMf+CRoVB9pv4SPqh+yDbYlFCniE
	w9rWz6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN38-002goV-0I;
	Tue, 08 Aug 2023 13:47:02 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2v-002gez-33
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 13:46:51 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9338e4695so91807041fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691502408; x=1692107208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0cDrJs50zXCjDACInHgYpsbmw7IC3CDn78nE0wDJEU=;
        b=NjFU64ElykuH9jiCm/pdyN+2LgGuqg+6PY/QkPHpGDdN+VoNeAwYjpfKDAQkyo0n+t
         WVSdKIyREy40IZPGENCGy0sigb/tNR9VaFPbRw1OwvTJT7bSCfwZf8dMUWd1neIJIB+z
         WENnrM0jdL7dft1KRNUEZgSjhA4lr7VHb3QmVDp34Qcjr5Iven+S9Ap7KCPyRapV/E+K
         gQzE87WYJTYJ4D6Kna5o1SjtVxN9fal8ZiVHDk+u0R5bi14Xh6zbDSJRAU014MSKLZ0g
         f75/3lNcSfY/5WVaONw/cI+VDmWpXQ3fhKND9+Vk74OtOn5ehaBlPup5C0ztdWtZL365
         wivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691502408; x=1692107208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0cDrJs50zXCjDACInHgYpsbmw7IC3CDn78nE0wDJEU=;
        b=gu9V0egZqQgJV305fmg/ISpasPFvzmelg/YPf2EtKGLz7JsXtV5PXGPQl9cwlebOBA
         dTdnUXp28PM0S5Rr4yas6d6vHy/cjHnW7V1160zkKPZO+7P6XdyM26jYUlIJa0OlPw2x
         drsHh2T1dGYKChQbeMnOU7zzWOywnHyjZHy608WNBQ02TWj0Q7Q17YbhqPcVqEi+Ke/M
         naRL+SNO4J9DDFg20iSsvs7mpg69+/5MuFdFKa26MXLk7opRWqcx4Juak6y3JuhAQWY4
         /ITE0xSdolqvvwymesErVtQrIq3r6RDKr2YuivfYuA2ND1tjX6/BAPys8pb+O8LwPS+Z
         5GJA==
X-Gm-Message-State: AOJu0Yw4ol0NG9JIwJfq2bhcXNNze4TfCw3CQ3XZWJQH56hughyjNdt8
	kIFtN5shFMZQ42Xwww/FBIcwqQ==
X-Google-Smtp-Source: AGHT+IHyCb1MAZ9guoP9QuCWqFrH2Mfihs7/gMTBRCoMInNTntAhiMDP4HfHYPGkmdal7HBOrio1hg==
X-Received: by 2002:a2e:b708:0:b0:2b9:d074:1871 with SMTP id j8-20020a2eb708000000b002b9d0741871mr8655874ljo.45.1691502408584;
        Tue, 08 Aug 2023 06:46:48 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:47 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 15:46:35 +0200
Subject: [PATCH 08/11] regulator: max20086: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-8-939b5e84dd18@linaro.org>
References: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
In-Reply-To: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
To: Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_064650_003878_BA2C18BF 
X-CRM114-Status: GOOD (  10.66  )
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

The max20086 regulator driver includes the legacy header
<linux/gpio.h> for no reason, it is already using the proper
<linux/gpio/consumer.h> include. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/max20086-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
index fad31f5f435e..32f47b896fd1 100644
--- a/drivers/regulator/max20086-regulator.c
+++ b/drivers/regulator/max20086-regulator.c
@@ -6,7 +6,6 @@
 // Copyright (C) 2018 Avnet, Inc.
 
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>

-- 
2.34.1



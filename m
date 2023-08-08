Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D06C001DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7mP4H675HuYuOMx1xcJqbSqbpr2VMcAkjxgMIL4uqE=; b=tgV5Y8vnQavlybxA9DNOC1goa4
	K+vxoBGP0929xivOmOFYmFM9X+waK+bAAJ4ytb3XGvH/AMY7DPS0sKtCt5wm9sscZnMM6PR4c8ZVL
	7JZZ8AHElne+CvcF+u5/5zUzP6sjZcqAakc/R/xL4a/xSdQLMYvK4XFNUqUjjHDKKEwInYIh0pmGy
	MVPBWmuMwcSxoNzaGkViXFl/hLAERLOut4kCfyFr+yBn7vRaJgr9yZZ6a0Aap5p23Hj+su+22d/HF
	yUKh6dQxh7xGJQh0sDKOQ1YmA//50QLCdTXf4VjJiN6BA6NvbbyDR48SEZ/yPXoFlB/RA2T3+JnhG
	CqDEXeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN34-002gkg-1D;
	Tue, 08 Aug 2023 13:46:58 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2r-002gb8-2N
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 13:46:47 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9b5ee9c5aso91263611fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 06:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691502404; x=1692107204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7mP4H675HuYuOMx1xcJqbSqbpr2VMcAkjxgMIL4uqE=;
        b=DtDHlVRSh5DSUYTYoCshX3fGh6xkS1KmvWTHE44F0ISVNb4pY3Xp8CnXUjctsttmzO
         SmxqCXwQ262egLzxNNIQaffzTE7M9L752JDmo1z/ReCeG3vrftmcKcHsIvcyodjF9j9p
         490v9TizgGCLny0Bv4O+c47e2yWs7cBHprYgQE/JZaH5qF6eoiGjK9GuV8nvnI+aAKqG
         unuC/Ar7KoOCnHnYOBKftOJjQfk17hnCoqX0AtQNP/z753YFqoHcHygrbnTNOlLVJqpI
         3W7pFwQ5G1f/6zh1JZP0xDGvxH7FuJPgD4Ry/+l9qx/r8NDpNAnFJd1uGiRAo9KogXKf
         qMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691502404; x=1692107204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7mP4H675HuYuOMx1xcJqbSqbpr2VMcAkjxgMIL4uqE=;
        b=PHvorjYcpaWdYq6PSFTCg/Bl8rghymrj1ieYKdIlBf4emoYYTbFIwyyu5RAZybM23d
         aR9Fqx3rL/XMfuTRkv3odvf4ggXwbPDcXEk1Uw2Hg+tO6jHdiiifhjhlVj4Ouq7OvayT
         5xZ1fPrajiRSWDacMG37x+gX5LK9ziUWQq4OK1qlbehku08quVGY/yJ8U1CEAOWnyR6K
         C71kWpkyQJlNQA6OHG6QQ1yaGdDj1taQcMcfNzWBreWLM5vbiZ5wD1IDhmNeJbmPBMfL
         +jQRQL9mATnie6uNNKuW/wIa29an/fPdF6RMnPd8sEQA2HoxE9r2i8q+EHpeylEDwXHj
         Ljgg==
X-Gm-Message-State: AOJu0YxV5/jCflyTBN6sEY2AU6x8B5ChXZOsVse9VZcynCnPf67gxwTF
	XIx6OAzsUdgAspMIjPpEjwUodQ==
X-Google-Smtp-Source: AGHT+IFqBorBvecJ4DsCotdQRzKRs6+3bXazzEJyN+B+FiwvRNYD3ybpCup1aLJlqFYk3XPz1XFCeA==
X-Received: by 2002:a2e:9e0c:0:b0:2b5:8bb9:4dd6 with SMTP id e12-20020a2e9e0c000000b002b58bb94dd6mr8345831ljk.12.1691502404392;
        Tue, 08 Aug 2023 06:46:44 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 15:46:32 +0200
Subject: [PATCH 05/11] regulator: rc5t583: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-5-939b5e84dd18@linaro.org>
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
X-CRM114-CacheID: sfid-20230808_064645_783691_9D2789F5 
X-CRM114-Status: GOOD (  10.39  )
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

The RC5T583 includes the legacy header <linux/gpio.h> for no
reason, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/rc5t583-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/rc5t583-regulator.c b/drivers/regulator/rc5t583-regulator.c
index a5afca73715d..a25a141e86c4 100644
--- a/drivers/regulator/rc5t583-regulator.c
+++ b/drivers/regulator/rc5t583-regulator.c
@@ -16,7 +16,6 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
-#include <linux/gpio.h>
 #include <linux/mfd/rc5t583.h>
 
 struct rc5t583_regulator_info {

-- 
2.34.1



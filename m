Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ED5C04E69
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtIG2M/ca+5GsdX8n1RK00emvWGjV3tMf5tcX7VIHus=; b=dwxILeTpPLNC/XYUPHceHK50FC
	hsKER9rYt2cyAc/sRdhZieP8+ZhYSJnehP08twkeIZVS6EP88ozBt7ix/9dzPtJv7rNmkKd0NSdUD
	tjq8mW9G4unyw3bHWVFs8svDku/MO9+rr75t3S/l+FTySBwfXnMMaKX5sct4NuTOrQGfqaS6KxuGM
	mH8Ejq9762yBEkko2Hx760lU5HsS8wDvsOlLwWe5h4p/6OBK0WlUuvRqZPbsGLnTJM/CtR9Jf4e3/
	xKycc0X4yF45Czx6gTc3jkfmUH3dYIg2ZAOpbVm2UFLnfy5QDgevb2UHhuA/Yy17bZqVSIGaNFXHP
	Ox9MJY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN34-002gkt-2E;
	Tue, 08 Aug 2023 13:46:58 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2s-002gaM-13
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 13:46:47 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9aa1d3029so91150731fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 06:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691502403; x=1692107203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtIG2M/ca+5GsdX8n1RK00emvWGjV3tMf5tcX7VIHus=;
        b=L1ioPgmqCaR2U1LEvON1pzt4xhIpqkUbXHSqD5kQQdQD8ItW4L7rQu5OvNfP1xQ8Ah
         LRm/YCzvU4jss3oE0aKFQKHMimmQ7ietflCwFVA0kxYT6sbI/LmGAsbHkY0xSjHofXWM
         bNs6c0XG0OFZbQ0AaVtOIIO0ykzTDwFWCYQhXtn2vJoBaIu6HfCktVcJgj5TTUg3sIK9
         w79RIRH0oWhIqAxkDQ7nbqGTE9yaAJFbJm1zp697qxrngU2bV6vOyydY3fCfMl81G8qP
         8Kc7GFQdAcC5chfXg+tU1T4oDpQBxpKl+Deq1qQUFTZ2cQ26yafHT4AiYPR6egBWrhHC
         9Vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691502403; x=1692107203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtIG2M/ca+5GsdX8n1RK00emvWGjV3tMf5tcX7VIHus=;
        b=J1zCfY7MeoOOeWj5ZbW+G4ytRu/P7xA0uh6SXdUnJfGPT54NbprWqfFYCQ4j18NWwx
         9zS/0gaK8p7niARRuuoagi/5R3OICAY/gu1BdJUIp8Gmv3tTTGKh9rPT9XemguaMIftx
         UczZWXIV5IiXWRUaR1nOvojbFpxT1BFufZFV7o7PxYlXb0E9Y7Zo10DKkQ3MRDKsOrn8
         KumJsPZ7vobQeF4M6CPw/fNk2LHRR5CKIdpj1b0A8FwJQEqUl6uIicUhtXo6oFm0HkLG
         6YSGxqDHEKSBxUSUTU0Kaby8D6GQfnnD+h3+WSVse6dodTfaJ7hkvPMXwJZrXGIqMS2m
         xWmQ==
X-Gm-Message-State: AOJu0YxLgtevpdv1f07Vds85e0LJnKc/Q8JsA3harzhY6oUc/K1JyskA
	QJpyERLopsvZMb9j9GoNEdnFjw==
X-Google-Smtp-Source: AGHT+IGabpvcf+YfqqvSp128b6pb/ZcVi3xmONq1O6a4S0szO5ZdOqerklrUaTjPj2ZyYc9Tu1UkPA==
X-Received: by 2002:a2e:6817:0:b0:2b5:8a21:5627 with SMTP id c23-20020a2e6817000000b002b58a215627mr9324746lja.51.1691502403287;
        Tue, 08 Aug 2023 06:46:43 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 15:46:31 +0200
Subject: [PATCH 04/11] regulator: rk808: Drop useless headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-4-939b5e84dd18@linaro.org>
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
X-CRM114-CacheID: sfid-20230808_064646_367291_744E8940 
X-CRM114-Status: UNSURE (   9.70  )
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

The RK808 is already using the proper <linux/gpio/consumer.h>
header and includes the legacy headers <linux/gpio.h> and
<linux/of_gpio.h> for no reason, drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/rk808-regulator.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
index 460525ed006c..e65339ef47ad 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -15,10 +15,8 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/mfd/rk808.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/of_regulator.h>

-- 
2.34.1



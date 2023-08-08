Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5B3C001DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1Y4agTqAvpXPwjQ+6mnmjNw7Ui1CynMHOt3cuxZe6w=; b=CBu2SGUWC7DcfhRI2w+999MVFR
	bd3bOogAah22TJ9BakYql+sEX4mCdRplDEt7tIF2bPzRXkzTjKa3wPNLf2SjJB8qT6cdL6Nm2CjPn
	l7IuRkz91LZYFMEri0TXPcodlfQify4m7PJR2p5ecEP9SXNw0em//4TFUBaMyvr+MsARJHrrQpg4l
	bgx2AoLNU9xLcWGsE59ESD6HUb+JZ+lrpjsUp60FcVyitu07mpsJ4VcENCuKVV0n7esqTbfwadi0C
	BlCHofV7mMitIgjv50SXWCIPQgrXtGrK9vY5WEOyHXG2PDKWthm/mqYLs1Do2GQbukiIFKvHTKgIZ
	ZCx9HWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN34-002gkO-0C;
	Tue, 08 Aug 2023 13:46:58 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2r-002gZP-0T
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 13:46:46 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9cd6a554cso88493681fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 06:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691502402; x=1692107202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1Y4agTqAvpXPwjQ+6mnmjNw7Ui1CynMHOt3cuxZe6w=;
        b=jNilbRRkkQtYWGP4i1XYKqou3vhByOWKINLALftvLE3fLCcCVlcg0yyXYGBw/V1FNt
         gZ4I6Zdwr8H4osu84cp0ePhy4ib+pVvD7VsbHM7yBgWURtAKZzPBckN2T8aX0vvAliJ7
         dy1SUvAtpfq1n1dckC2mGlI34+2GNTiWjqYCnb/AMWw/9kAl8FaQ12z6u87U43brvqyW
         MjH107kW7rELZgVMT3cyvpzSNr5T0r5UtI0NzR9xWFxGLSFwpCFYssqkWlTzCr76+rd2
         Zo0u5PBuNQ1o9ZweNQBD2Zf13ZLNjHtRyFy0SQFZvoq5GatpoPYUjTteCdQ3sNxzIdHu
         7mQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691502402; x=1692107202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1Y4agTqAvpXPwjQ+6mnmjNw7Ui1CynMHOt3cuxZe6w=;
        b=VWvc4rB8eEW8XS776ZAc7aCoqVKowI/D+VfjlxvwdZZdG22xqH4aNxMQ4mZyPR1WOJ
         BjFH/Tq6pucDF6XHj5NsmBVRanib0ehEimk5kjQtv7BZIRFt0NpbNrm4/l/Amfv/zm2j
         PdIdGsmQpW8GHfDdX7/cSF0d7kKSCKH+sn4OP+tJ9cpHyVSW4HcNI9vFfQCFR5yrTGZl
         gLagzMy13TWuqU1myblGlcxZlDeQ1uqzvpAG5T8b/wt7461AOws2Mf3YjYuG9uuxp+v/
         4q4jIkOoaqHE6JTY6XBagDe3IkJbjRXW+cgH8zUrXEx/rLohb0gGqMoBOzZv/uW+yxDZ
         cNwQ==
X-Gm-Message-State: AOJu0Yx7a+mf60NXhdOHLqWHP0OOTGUrMfYt0DawBz2pwJQ2PDGTxuuB
	q/zZ5ayhsXvAuzGyVrZtagRpvg==
X-Google-Smtp-Source: AGHT+IE0omUPskRY/uk1H5XSLkdMB6vFjj8UCg/c58mkRX+yOkrTBA0j/8iJ1xj+dfPUVFqUwwFdrQ==
X-Received: by 2002:a2e:990c:0:b0:2b6:ecdd:16cf with SMTP id v12-20020a2e990c000000b002b6ecdd16cfmr8260383lji.40.1691502401865;
        Tue, 08 Aug 2023 06:46:41 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 15:46:30 +0200
Subject: [PATCH 03/11] regulator: rpi-panel-attiny: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-3-939b5e84dd18@linaro.org>
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
X-CRM114-CacheID: sfid-20230808_064645_201568_98746245 
X-CRM114-Status: GOOD (  10.80  )
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

The RPI panel regulator driver includes the legacy header
<linux/gpio.h> for no reason, this is a driver and <linux/gpio/driver.h>
is already included. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/rpi-panel-attiny-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
index e9719a378a0b..949849baa7dc 100644
--- a/drivers/regulator/rpi-panel-attiny-regulator.c
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -7,7 +7,6 @@
 
 #include <linux/backlight.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/init.h>

-- 
2.34.1



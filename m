Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D477FC001DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MBd/Q+2ZcBfYYCCch4YtWUjRgawyqEqYs8LS5NaBJY=; b=sJH+sT9q3uc+rrMMuTA7nqjeTO
	mS5+OHiadzqpwAL/brf4uXkthd7g3o+rN4uJnRmLocbOBlz0LjU3uPGmPJrjjC+tdRx1RnWmJj4n3
	wWnHQqXBTWueli6jcLLSN6aIUhNBJU4bvgCNNtWHa+Ve9z0GFWhKOzm9OYgP8QRwkDy8JiPfvdcuh
	VKIzZ7UJt9t3rlWZiKnPhhm3ZtdP4GKVPjfhnMfhNXuPzWn26ZKssRNuIablfFe8gHO9kxjkrNJYY
	/2eKvis0+8me9ubNkiNtsOUlxbHpFBTfppp+NNDEjH/RixNJvRrR8YutbhxJL5EFKZz0YbkKx7c0F
	AyICdMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN37-002go4-2E;
	Tue, 08 Aug 2023 13:47:01 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2u-002gdl-2l
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 13:46:51 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9cf2b1309so69014721fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691502407; x=1692107207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MBd/Q+2ZcBfYYCCch4YtWUjRgawyqEqYs8LS5NaBJY=;
        b=a9ecYpxgPottM/ieUjh5VXFwi7HIxuytUIYY85zIOhzjqyl11zbgRuJ85Myjq42Eut
         5gK+H6gXxAQz7JX5F6w7hk9WZ+NspOBd/nRPX7c2NQQCSEASclMGE6Mwq6Bel0Z0UhtX
         UFlv2XdlKVLL7iOXuBFAMcdB12G9YwgbQarVtqcQ4cQFvqqaIg9wiAsm+2DNKkDIeGMa
         /o6E8zga4/S2d92q75KZcDbkxCD7fsJ20sMjtImAYo7CX/6ZAhxnidIFWtzNjxwURrMz
         fp08qD46dmgXdJe4HGr9ZOGtG8e3v0wdC/IbChCm+yjJs9VdWsWfYEiOYtKvnoemIpLw
         +AwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691502407; x=1692107207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MBd/Q+2ZcBfYYCCch4YtWUjRgawyqEqYs8LS5NaBJY=;
        b=fOOgUqyd6Pqbsyvx2h425A3wDvteyaTb3V24emLIta2JXflefKr1icMExFMN1yg0Kc
         ehUJy3AQbMc3Gfukzc98RVrA8mSGSn18IKTdwlWzqgXGIfG9/20fsER3kR3XG4W4s1Zm
         F7V/C8vBri8J8zFoVtksMjWzsfSRw1XBjXZNaNx4oXsvjDhJOhAJaFkJr8aLCXX3ms+9
         RYCqPfK8xKEOTjDbdJ5W72dE0mXtyJggnU1uha5gVMIjwFUcKYy4oJa8wiHIF5MqoJNp
         iQ29okFxGpBmzqghQTwE6+pMRxhWgPGWh3lpfskNccLYBG+h9ZfLfSQHPbbTBK8WexMT
         R3uw==
X-Gm-Message-State: AOJu0Yxg6WjYdE3Wzv16y3OoYld+/7E6UL8zxHoS0unKVE7NK9inMxMC
	hgg/451WRA1c8tZ4FhORT5dfFw==
X-Google-Smtp-Source: AGHT+IHYNMNNe16C8Pb0pzogia3/9JPgNoj8pGTGRiE0IjzmUtDSgfL9UVebVwyuLdRgkO5hZzY/1w==
X-Received: by 2002:a2e:8e22:0:b0:2b9:b8ce:4219 with SMTP id r2-20020a2e8e22000000b002b9b8ce4219mr3051478ljk.6.1691502407365;
        Tue, 08 Aug 2023 06:46:47 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:46 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 15:46:34 +0200
Subject: [PATCH 07/11] regulator: mcp16502: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-7-939b5e84dd18@linaro.org>
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
X-CRM114-CacheID: sfid-20230808_064648_912678_790BA99D 
X-CRM114-Status: GOOD (  10.51  )
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

The mcp16502 regulator driver includes the legacy header
<linux/gpio.h> for no reason, it is already using the proper
<linux/gpio/consumer.h> include. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/mcp16502.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/mcp16502.c b/drivers/regulator/mcp16502.c
index 6c6f5a21362b..7a472a2ef48a 100644
--- a/drivers/regulator/mcp16502.c
+++ b/drivers/regulator/mcp16502.c
@@ -8,7 +8,6 @@
 //
 // Inspired from tps65086-regulator.c
 
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>

-- 
2.34.1



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24947C001DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUr4rBKoQ5U9kNDxTC6J3Fd6dDx63tGiQB8aHXquZB0=; b=sLwAabXXUYh068lr2qqTgzM+oo
	DTQZpI0BtR5fwF4yK9vIcm3MQ8ZcreeZbt/gXaZkPk+BDSJm4p7IBr4b2I/FThrI1Pj0nPxzGO216
	HLBHRh53dKzhlOX2intjCT3SNtFfhr/5ZLlgrcYc68mMDKFMngmKm38yUh9RJzbLQIKkm6mxwehYE
	lP6XiWuwEoBFWIhFL4c5g5W/ZEOMxtREGPjl4z4pxqalSgTJFKZLrfMGlczuiP8p9CfsC7RWt/Fd3
	sytNA38QoUBQRqb0KMhdprfXH0r80krssLA2PozVYMFiYupab9HL/V4fK44azHOgqEwAkahvvjXQV
	2bT4hkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN3B-002gre-03;
	Tue, 08 Aug 2023 13:47:05 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2y-002gfb-2F
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 13:46:53 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b9bf52cd08so88389391fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691502409; x=1692107209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUr4rBKoQ5U9kNDxTC6J3Fd6dDx63tGiQB8aHXquZB0=;
        b=jKEbbtHIcqo164S8rtCxRv1DMuGAvjsPKzOzboUDDSR0zu1t4lA2dAo1PA8pIVtzEA
         hNbPMcrz+uyT5KqDwFP5PSb6DJitElTOIpkGxdKhEXXqroquR3vKhNHOfWk0/jlAIaKQ
         RULEkMcHt9FMrsDgisYbQr+G5SvSaGAtYJHZFikvO2qnlQBmmNQRavkYdaJUYrgq7ngi
         8GW45nFsyd3+L2Sn28IJ7JSnYDHsN2bDcUd0QGtvzsrjdEtpEBmWitr4nCJwcOnYMuu6
         RAGFOjw8R0ia104j42KGY0pVIWboZEzwRSHbVyTq4PmuGP/ge5gQdwjja3BgdSeUbBPK
         rCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691502409; x=1692107209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUr4rBKoQ5U9kNDxTC6J3Fd6dDx63tGiQB8aHXquZB0=;
        b=NstkUJIquVvZb7ddZW39hYg+BH4VuMkehG3BHdCY7d8xtYoKbVZP+HnqNGJb2G+szk
         YdvMMJYWvJeHUOMaIu4/S0oyLSYwWmcJLT1iuIDl9an1eW5oGF6TdxjxHC75Zx6O4efm
         sCDPFAAV7yKBWpSRQveSize4FVva4dPFoKsHWSoI+Xcwcvz9P0GtfKuHIT70Pd1pJTAJ
         rVdTksaZrUAZxk37zpVD9ioZg5uTzH/w+lXRcX7Qg2xVyRO+sdskLpPckzGLcuIp8HwE
         9GqGPLkrd1KGcR0QN2xWMVkCRGFDBrrmknMUXVvk6qRuE1ir/itvjUsfp/cACqvj+C24
         /iTA==
X-Gm-Message-State: AOJu0YxMuLKi5PTzFH8uk3po78Fu5MupwYIU5Mt6nSQWZFgiMxA3sksC
	UmhcV+dM4fPragTNn+NqsOk5aQ==
X-Google-Smtp-Source: AGHT+IGl6ac+w+vJLfJZuq8P35/Ynv+o1liAhoqzrNLA3A9/ISpnNwHIwbTBb6DgRgGMJoZAmBq78w==
X-Received: by 2002:a2e:95cf:0:b0:2b6:a763:5d13 with SMTP id y15-20020a2e95cf000000b002b6a7635d13mr8927600ljh.27.1691502409667;
        Tue, 08 Aug 2023 06:46:49 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 15:46:36 +0200
Subject: [PATCH 09/11] regulator: lp8755: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-9-939b5e84dd18@linaro.org>
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
X-CRM114-CacheID: sfid-20230808_064652_747115_09536B1D 
X-CRM114-Status: GOOD (  10.28  )
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

The lp8755 includes the legacy header <linux/gpio.h> for no
reason, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/lp8755.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/lp8755.c b/drivers/regulator/lp8755.c
index 4bc310f972ed..8d01e18046f3 100644
--- a/drivers/regulator/lp8755.c
+++ b/drivers/regulator/lp8755.c
@@ -13,7 +13,6 @@
 #include <linux/err.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
 #include <linux/regmap.h>
 #include <linux/uaccess.h>
 #include <linux/regulator/driver.h>

-- 
2.34.1



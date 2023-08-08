Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370C3C04E69
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qejuevXVg8c+kej4ztr9ux7GUIQQ5z+UOyvSNuEDXRw=; b=r7bxzD/7SCSrZhuDjXZJ8gQ0Jr
	GBkBf5byiLARhPuZq6+lwwvpV6xRQmz3WwyN3fvtWY4CyvgblZ+l8IGv1WEb+h0sYGd823mRlP/xx
	/j5TOI1GiMuqOSK50uxTPm6ys0RPRF7z0Rn4SR6aVXoFHDkP5/DQXBjNjvtzeDtedb1wciZslCuVX
	TTSX4jjishGoMllz8ZLmfCD6JYblYTX9IZe92/MLJzcC+M1G26KDnvAohp81LN9ymMRjY1qA/6bRN
	ipB6kVrFLok2XKihL1SYHbmeohIafcCCQAoCUR3wNBwbLzhze1DTiUkokFNSVogbqTV2KG1aCMxjF
	y4K+mLIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN3B-002gsp-3D;
	Tue, 08 Aug 2023 13:47:06 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2z-002ghJ-18
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 13:46:55 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b72161c6e9so80682401fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 06:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691502412; x=1692107212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qejuevXVg8c+kej4ztr9ux7GUIQQ5z+UOyvSNuEDXRw=;
        b=okBOyqvwBtnyEm+bpS/bYF9cQDFGVNeIrKoe6vjbS3ZTr1waldRRipzjslMZhqgFaA
         bXlG4a+DnufPmgXsU5UtL6exdBLPu32Z2ufx9SJeiGMOqH4nVWTay3JmRuG7wVEdZ/PC
         /bJ1qcjUkcRMByewRWN/tf4v05oy09Udsz6HkDCVi1qg5pDOyeeZNz1OEOVuGAed2itK
         mAS8o4s3ejC7J5hBCrByo5fCuJ2uprvRC58Us/h669jbCTF0NlwlmsxnFH1JNGQzN0IU
         bVn+c9Ml9ke07F2OepxKFcGIWFad+mSzRQzo9KMBntipKJxPehPwfdRXzx/TcFl71XaH
         7zJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691502412; x=1692107212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qejuevXVg8c+kej4ztr9ux7GUIQQ5z+UOyvSNuEDXRw=;
        b=F+B5nowLIFBKuPIuOT4WMiraRHMWvawGl5+B4rLxNXVCgnXhTJOGHQ/AGjKUuE7UuR
         HH8IQxHeEq8K+9/TVPwqAmaa5Dzl8DHTA+83Kcri0UTk9f91JCbmkXJ6jeaSmUa4xc9G
         02jmMz3/WEivBXjv3AG1R5fkYzR0EqLubPyGsVCcwTYxvUowxdq5jE4UqoldIooW1tzj
         4Br59TcTpoXncBpzEZDH151e51nhseAe1uzRFCDeDKuVSRSNzL9PLlhTgodtYbV/fZOO
         PQ5615bGGYkLTCP4YdX10zkpWdwQz+DZBakvPZLsB/Sp0/yALPqFDC4lf/e3lcHyzCwi
         T1CQ==
X-Gm-Message-State: AOJu0Ywt/+4f+DOLncgvoznuUmIEQ4ZmixblnQ1b06gYNHZHPz/p1FbV
	1h+rEnvRBm1hty91VJvgMik18g==
X-Google-Smtp-Source: AGHT+IFQaReEoylTuoBa3pq7fPTiDA0ZX2U+hTy0EvkesIRlzxiuW1TvGZ9HVbCDFIPha62GXZlwgw==
X-Received: by 2002:a2e:9c89:0:b0:2b6:b7c3:bb89 with SMTP id x9-20020a2e9c89000000b002b6b7c3bb89mr3403498lji.18.1691502411764;
        Tue, 08 Aug 2023 06:46:51 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:51 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 15:46:38 +0200
Subject: [PATCH 11/11] regulator: bd71815: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-11-939b5e84dd18@linaro.org>
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
X-CRM114-CacheID: sfid-20230808_064653_388291_7FACF577 
X-CRM114-Status: GOOD (  11.02  )
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

The bd71815 regulator driver includes the legacy header
<linux/gpio.h> for no reason, it is already using the proper
<linux/gpio/consumer.h> include. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/bd71815-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
index 475b1e0110e7..26192d55a685 100644
--- a/drivers/regulator/bd71815-regulator.c
+++ b/drivers/regulator/bd71815-regulator.c
@@ -18,7 +18,6 @@
 #include <linux/regulator/driver.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <linux/mfd/rohm-generic.h>
 #include <linux/mfd/rohm-bd71815.h>
 #include <linux/regulator/of_regulator.h>

-- 
2.34.1



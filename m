Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D15DC531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bO9KX3t0CameG4s7E8ol/+1HoTbso6o0yUSmdA3MC9U=; b=fqjfliyfRAWdNku2YbObpmUjYD
	5swpEMoSVwaBOSpOBZ+P+1ddrBamdEPZwpi4mvCEcLHxHHN3IMp/cCVysQC7s3QdRY3C3NCOSFNFl
	MQ2TIdhVoxaUB55bYFFJQHIf1GR3oig+sTsSZb1IUQCWmkwRUryvxfgfNxjKKL/Qg4GwdzN7UVQT3
	htDXhkmHbO/jbs40K4se4fXyDsiRvKObw+DbmqnopbyDjxEezEb4qyO3g+zWjjuWXIHy3Qg8SVWNH
	lcdE/BQgcyNV62SiMtodz/Yrjx7Bvzawg7ZxvbDJTJSRjXDx2W4H9HPFoVxKGJt1fHDwzx6wT//Mj
	d9jfg7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sez0n-0000000DQC0-0wBz;
	Fri, 16 Aug 2024 15:37:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyvw-0000000DOcm-21ZH
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37186c2278bso1222059f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822326; x=1724427126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bO9KX3t0CameG4s7E8ol/+1HoTbso6o0yUSmdA3MC9U=;
        b=S/Oys+vLItLprq//mziMXe4jdTx54jDBWhXusurLlT6TYTEWWActwwSHlbZtRHhU5m
         vV6M1LsZXALSUnLY6+3BhYfta1YVyoex3NDtgjkeyWM7vp5tV5pCp17rB9kz1rTabXKH
         elSPxl37qAjlvylzP3Z0GBfp79g4bT1AsHpxVFA4tUuIb+gc1F6DlndkxuPmupQyj5ZC
         WMn4O/fgq+DyEJlYbHbjJNVzXKvkQQm6XTV/14EGZEXwDoYbA72l4FmbaCTrtPLOSAEP
         J5F+27XmystbY5D8XeR9VO2Jc9ZxUKBhmWC+A9rcI7LSWrr9yZzH0f9EoOnwcYBgkEtm
         xf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822326; x=1724427126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bO9KX3t0CameG4s7E8ol/+1HoTbso6o0yUSmdA3MC9U=;
        b=cqWJ759HG41pXKfvNb47bRmwoyS/icGCGY0c1mbCr591ifyGK+tmkoUQy5QvZ1dIbt
         lLK7tfdOdVI/QvH/IS21PPwd2uYhAozHUs0mzvdhbyvUIJlDIDSAPdX7DEcMOU7UOEqm
         0DKKzY+a97mQQw0iT+puuRro2esdLaJfa75kBcYc9chH0IZOYgiFXoQNqiB2FuGWlwCt
         8b/P36POmvPwZPFoOODc7inAPZeAcL7Cb0ulA7AJmXBdSqgfOdfniwYPX+GWX0KlAwht
         3idWe1QwOgAzKjpXokbmzmrF0mEwMjSc+b7hBDSZPn15B641qzFMiF0Gcm+SJ5946zO2
         QBHw==
X-Forwarded-Encrypted: i=1; AJvYcCUjn3G0lL73P97AeDS4P7wDdbKYwQka00gNRjI2j1wkfFjoWwNfUgjgrb64qiV/9jefnq3r1mjikEYtv7k2WUK2wbfqdgg7P5zecdfmt5n572Pd
X-Gm-Message-State: AOJu0Yx3AVx1wvLMI0IuNwJ2p68w94+26CxFXIwdfd7Q2t2NJa8IMF60
	vyq+YuT1JClagJiIkRZlTTbYM0pGCyCEYzFBOiY4EshMQ7r5P9xBsjhhdOsMh88=
X-Google-Smtp-Source: AGHT+IFO6DlpkZlrb7PQDXCCkwkdt1PkYJMksByyV9gy/3kYvIXYmOf5Fd1cqFTrDNfriARDeJMtyA==
X-Received: by 2002:adf:e6c3:0:b0:365:aec0:e191 with SMTP id ffacd0b85a97d-37186d740a7mr5074245f8f.21.1723822326272;
        Fri, 16 Aug 2024 08:32:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:40 +0200
Subject: [PATCH 08/17] leds: bcm6358: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-8-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1287;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gN/N7MTnfesRcU0ZUz+5FDMsGWVo2Qy6wwU3HvO2nBU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DfPgJIiHDC3hZ2bkc5m7qeMomLAN1W2uZDq
 zxZ4A5tqh6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w3wAKCRDBN2bmhouD
 18UJD/9O2BpM8SXiXEcgj51PM7x8myw6JvKSH40bF5oY9mhYIhkrZpWkbw+Q/7QL7B2EcIXbGwo
 LrmxiMbQvg87Z7lN78d8yf0GJr2ja+HX25WLRTCfL9lAoXbHMGotJD66V3I3D4I/NRdUbQTDzMa
 GHxvligWU2jeLN1qjSSE4Z5ZXQcFGaQ22RBOgL5IhzzmHNjVyaQ0I7YMKWJ5UcwIh88EXJikd90
 9Mj5JYSJO5GCunLxqgi5x20aMYuVoCPdhfrhykPvY1/WrKKcA/qfmrjY5VrzSJv06q4CRJ0xQqD
 MMTkyJKgY4S7pwZuJA3SsLEgggw4C2Mcdut6XkUdyiYwmWIk5T9sd2U6qVhDGyzw3GoTtyfvkdh
 3bv18L9qH84cqiM2E9uvA5HGw0+tNVVqcfAaA73pn3TugUj2UBQw0ZACpoNU61mgPROTd9zjE8g
 2ljGiXGegvDG5Lc3FdUQ8NMq27W6vFFcZ7fqUFh9ifzKYDwuU20YsvxySGmH2DbOdhc/wTDNhdD
 ErXZc8VIuCFnfQrbciDcVUluC73s8YaaAMVICIhZNMluBx0SGWut77qF8+CCA/yBy86CXrd1Be1
 mbGNuNEztzvTIQQeX55KCYhBtgdSnordy28kcn6S2dP5p29AGcaoNW3aG83jOWEDjwSyBfuAJ6b
 aRt8rutA2xi1+dw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083208_634680_3297544D 
X-CRM114-Status: GOOD (  12.74  )
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-bcm6358.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 86e51d44a5a7..51fcff2a64fd 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -147,7 +147,6 @@ static int bcm6358_leds_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(&pdev->dev);
-	struct device_node *child;
 	void __iomem *mem;
 	spinlock_t *lock; /* memory lock */
 	unsigned long val;
@@ -184,7 +183,7 @@ static int bcm6358_leds_probe(struct platform_device *pdev)
 	}
 	bcm6358_led_write(mem + BCM6358_REG_CTRL, val);
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		int rc;
 		u32 reg;
 
@@ -198,10 +197,8 @@ static int bcm6358_leds_probe(struct platform_device *pdev)
 		}
 
 		rc = bcm6358_led(dev, child, reg, mem, lock);
-		if (rc < 0) {
-			of_node_put(child);
+		if (rc < 0)
 			return rc;
-		}
 	}
 
 	return 0;

-- 
2.43.0



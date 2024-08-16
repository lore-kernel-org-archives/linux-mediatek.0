Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D692C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqtNBWOnQ3Xg+u5frXQomaMjbI/CKyIXNSmcFe+MZzY=; b=lNlF3ssnK1IuBqtG9667kYvTW0
	SyLtajq3U5OTLziBo7jBsP8nX2GwsoICOHQ10Fi1XtFhfAMTtaVSvPgSBro5CVl3rbdZpTC2rzr3e
	K5jLA6OnA/4R2eGHGC8kicGL2R0pO5Q115aTAfKzm9Efn9LYK90X1JX1UIfMv8l+xBkayYiV5o/MT
	UD+DwZnoJfqw2V6uliW4fuPrI6tlaOPK98ieiBAtYI3yzOtfuztwvCFOdU7SbsGxm93QAhFe4Wr4P
	oiinZeibkNFn0ymt4EuJMgxX2hhXgAtMSa16ZRP98CVX92ucrbIT4JPu8yxo/dpEj9KycZSiw+3BY
	5D3XxVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sez22-0000000DQPD-2tXp;
	Fri, 16 Aug 2024 15:38:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyw1-0000000DOgX-2ISx
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42803bbf842so21550145e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822332; x=1724427132; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqtNBWOnQ3Xg+u5frXQomaMjbI/CKyIXNSmcFe+MZzY=;
        b=naGy/6Ffv4cLPUd91ZEpHTXDHXmomVDH4NyXbackPvXfU5X5o+zs6/HmYCStQ2kRmx
         M9PoimAs23vRf1IdEfScUoBE/dZSmhRrHne0iuaidvI3AUXwMa2MUDZKmKTDp/+WUcN1
         ao71aNdSxj0BPpzEg+VS5wtF/kRa90NmsaHAQHo5wAmyWryJJmgyKGAmeDi18hMnGwMW
         7j1CUjODZDw7T2iCdyKLU5CHBYQ2kqQTzFBtUSEnt8CiXkSkcUuT5vinldFy1ttlW5Es
         jB/OgotYfXbddJYcVP/wRcPX8D0MPfhALsdXqtFkN8rkFk0o0O76lTv2Cq7WgP06GvQF
         6LKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822332; x=1724427132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqtNBWOnQ3Xg+u5frXQomaMjbI/CKyIXNSmcFe+MZzY=;
        b=jezzo8h4rT7G28SoohkJJ1TeGqbwDKKn4adh1NvwGk3mQ9wSLpYtiTDY7R/e4v34wq
         Yc4vf8lL5mwkpmFiesAJIjC6aQtk7Ef4VnI8fGJ5Ndadum+8ueKNez7ve/8nNBZqlKeH
         KlWVTBpCazza1YayVHO7H8UJfdHZJdRq7p131DczPNOb+FZNd/iIpXm90s7Dbp/gp+Cx
         P5v1+Xerdoxzmbmz1ZOyQ3uELrMCjmhSob/LBAXTUjLO9xqX35SIwljZCgD4A213tspN
         tGGrySsCDOkyq74s+Mf3tXB+Z0kAmTK2mtt2ltDBzRIU5NC2e/Nm/dZtljHmaP6wyvkb
         bCIw==
X-Forwarded-Encrypted: i=1; AJvYcCXLtUkF/JoN2LuKpA3maj+vJYmTYez1CXd9MQMEL0LMm4+IB9QxbLg476fDfzg0xs05yetOdqbYW1sENYTlfIOEE9TbKkFw9Kr5LTeaYnFm3KtJ
X-Gm-Message-State: AOJu0YxdthmZE0yyDcsGYfoL1G/JyQEbhaOXppNCRdMqtsfnSQBCb1l2
	SmUGVOmEDP/jnW23T8uBlIYnXwWF1nyoQiRZjelpBO7IAJMVtA940ITiOFBRWQ0=
X-Google-Smtp-Source: AGHT+IGnK3961YuWU4oZFJTYCKl0K2mdOewbI1FmFnvK2B2BUfG+eWPO7zTzTcEARCDrYvRBocT5SA==
X-Received: by 2002:adf:fe03:0:b0:368:4def:921a with SMTP id ffacd0b85a97d-3719469f891mr2605779f8f.48.1723822332005;
        Fri, 16 Aug 2024 08:32:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:44 +0200
Subject: [PATCH 12/17] leds: mt6323: Simplify with scoped for each OF child
 loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-12-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2340;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dbGzjAZfh7gVxRz/TIXrMdBv0rDvyB2K7+HnKJ4gJaE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3Djss2TXuF8dbygBzG44V3L56XAVS0ojN1I5
 q5iB2VHMQSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w4wAKCRDBN2bmhouD
 1yUUD/92B+FeoNj59qOoLdJpY0L0jdj1oyZClGW92U7HP3VT2O9z9IFmIMEsFaaI70ggtfNrrGo
 n3LOrAyB3l1wKms4gb+ZQSmDRYF5Aa0oupBSWPo4/aDejYD6KmRMAG6N1jQlZSmmmbDOYITeoJd
 pHY3KY4kK5eIJy1/HBfZ4YmW0yQp1zlOJYB+JlaPWYtOU4whCpzmVuXybd33sRRgAKutoEzPJSK
 QfRT7WC9b+BMO5Z5XYutvBjQszr0jXXfkJuznDkY2yYLDhZJ1aBxdW+aY/BX1re1l0S3/dD48xH
 xkhARVtXmtZHfioc97M9oW1CJJmzNdsK5JaE/6/hFEghYexU2cN5K8VdAx7ydXoRFJTZGwguwZq
 SEcdGBMuI272hkbmFHQQsXr3mScckzIePahhWqnSh+hG49AcsO6DZ4J44sD230+IsaXQYmqlmxF
 RJrtUXpKSFLuN9+xRUPtEkKwnxLGIzOZC2Fa571U5F71wPuGmfVZ8FMNuw430ewjLkDcmyh4Tpl
 knNeNMNGypnIQTo3/FXuuXkjkgg6zZdomcMYrOTE9PfDpVsGWt8O/bJeetz5k6c5H6Qc/3zFYgD
 MpW3r9d2aTq7KnrbfguCP3P+CA84Qd+xusPgfqTB2WQ13DGwInvp81b0AQbKe/WXO67p8qpCloV
 XifrHJi3R9eQxcg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083214_382821_FFD30A09 
X-CRM114-Status: GOOD (  13.13  )
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
 drivers/leds/leds-mt6323.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index 40d508510823..a19e8e0b6d1b 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -527,7 +527,6 @@ static int mt6323_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
-	struct device_node *child;
 	struct mt6397_chip *hw = dev_get_drvdata(dev->parent);
 	struct mt6323_leds *leds;
 	struct mt6323_led *led;
@@ -565,28 +564,25 @@ static int mt6323_led_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		struct led_init_data init_data = {};
 		bool is_wled;
 
 		ret = of_property_read_u32(child, "reg", &reg);
 		if (ret) {
 			dev_err(dev, "Failed to read led 'reg' property\n");
-			goto put_child_node;
+			return ret;
 		}
 
 		if (reg >= max_leds || reg >= MAX_SUPPORTED_LEDS ||
 		    leds->led[reg]) {
 			dev_err(dev, "Invalid led reg %u\n", reg);
-			ret = -EINVAL;
-			goto put_child_node;
+			return -EINVAL;
 		}
 
 		led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
-		if (!led) {
-			ret = -ENOMEM;
-			goto put_child_node;
-		}
+		if (!led)
+			return -ENOMEM;
 
 		is_wled = of_property_read_bool(child, "mediatek,is-wled");
 
@@ -612,7 +608,7 @@ static int mt6323_led_probe(struct platform_device *pdev)
 		if (ret < 0) {
 			dev_err(leds->dev,
 				"Failed to LED set default from devicetree\n");
-			goto put_child_node;
+			return ret;
 		}
 
 		init_data.fwnode = of_fwnode_handle(child);
@@ -621,15 +617,11 @@ static int mt6323_led_probe(struct platform_device *pdev)
 						     &init_data);
 		if (ret) {
 			dev_err(dev, "Failed to register LED: %d\n", ret);
-			goto put_child_node;
+			return ret;
 		}
 	}
 
 	return 0;
-
-put_child_node:
-	of_node_put(child);
-	return ret;
 }
 
 static void mt6323_led_remove(struct platform_device *pdev)

-- 
2.43.0



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60FDC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs19CWciVe69z8rsWTOPtucmozrfgqJROhrJ589EkVY=; b=sFLI71iV2KF7U+kXyxzukIoDbQ
	MRLozSdcZX+m1Ohq1lgVpsPmSl64fv736zh8kwtpmFRxWZr3/bX/SWXZclogqI6/go/U1XQLQSCww
	8Fd/+GjL8SnL5s28ARKEJebC0bZufLN7a67BGSNsbMZvJ0ZkWsGBR3NvuHKhr+qstxSLpEuDBTDM3
	fOIpbqU3GthOuWJRLESLA1Xd+m76PG/03uzIP9h439RDcRQQV0jd8b49F377SqrIyN0D7hxPgxF+6
	cc8P1UH7h4bY2mkRkeWITeQiLfQaIj4f/RajyzHZJMdb1N5w6a92L+wadPpBL4QMP9bteoIz9yd1Z
	RNAorkbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyx8-0000000DP7B-253I;
	Fri, 16 Aug 2024 15:33:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyvm-0000000DOW6-0X0M
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:31:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so16722465e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822316; x=1724427116; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bs19CWciVe69z8rsWTOPtucmozrfgqJROhrJ589EkVY=;
        b=AkkkoqfeqT1ERqsnPnQR1OtDFgHglGT10JPdyuCz0vnVa5Xlm3d7fCsEjJmict0xYH
         6Ww+KuGhY4uuoOeFnoqjsYnM6bNldi86o84yn3dchICD6RYxRGJ+5ixAA76KeTcsdQum
         N9HSae++2ZiorMSECFUEacUbb9Q1IPuljHL2Z6BxHjqR++orRGAr7jTOpktThL7Lnkl+
         YSv/ZUDMWxdclJVRYp4kQNGtdbF6oTdcWn6AM1Ekl3Vgk1ctL0aWFSB/vv1NIvWax9cp
         pKuVLX5iw6f1FUWGpnAgcwgcbOewXpa/1XyYYteGa89X6ncY4R4MWKLPnDxA75eZMJym
         S14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822316; x=1724427116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bs19CWciVe69z8rsWTOPtucmozrfgqJROhrJ589EkVY=;
        b=GsiBIUfuIGyD+UTsuYXxxxhn11s4N9sCiH+QBYeXz6rDxDDwEXPAiMMhle2x9c5XWO
         3sIJzzzxlyd/ZSsEDVtwGyzNfnEtIY/ZkMLkyEGiP/VsZQq69VRDZKH78G5hRZAPapDQ
         a86BSwzPmzxwThyKFjhnbs4b96fczgL8AT51/uau8S/9yd/NbtMemDT66MrTAvasjHHS
         DRnQ0Y6c7uNf7iekWlMVInuayljk/C1qRUxzMKxm7R/DDOP4UwAiYIHEzIXn1PdEpVDl
         T3m2ZJwnv7MquqO5Bwc62IQd1Rg2nvAS7XFvq0TwLXTh/iEis/uNKeAqtuebbBbICmWK
         YJjg==
X-Forwarded-Encrypted: i=1; AJvYcCVXdJMb542HgD5TlNQsuBa+QqkYoUmmvzu5+3vjomROWN+hH/COOYKTHLrHw9eKx+40of2SyTJqaLfrSaDLdIITl2egpn3WJHa/ZCjA7XSH0PUx
X-Gm-Message-State: AOJu0YwAu/2keuQ/wHTsOL9xZC4yz07t1DLGUu34i/EhzaEb/f9Rca12
	SYzaIhU7zHZ+g+J6W37CSTbAZ+Zj78OOVWs7scESH4TS5tzygMIZmlGQzwigYtk=
X-Google-Smtp-Source: AGHT+IGR3dEEF3paPLhCSZQYsm1dXDhlnka2LZPKsFs9HlMVLbvtSAJs2IkTJafZE9YHaH92MT5WjA==
X-Received: by 2002:a05:600c:4fd1:b0:426:6353:4b7c with SMTP id 5b1f17b1804b1-429ed7855f7mr22773225e9.8.1723822315663;
        Fri, 16 Aug 2024 08:31:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:31:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:33 +0200
Subject: [PATCH 01/17] leds: aat1290: Use scoped device node handling to
 simplify error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-1-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=a1YGQS8jzBzLcYjwPx4kf8irSYV8QsT8hVGiKzaSR0k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DZOpqtaUv4QAkOdHVd+6wkSZBmNTro/fzvY
 CO/ZnU/HP+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w2QAKCRDBN2bmhouD
 18eeD/44UH0sp3C6aYfp1LBephrs+liKt3nfnjZdWSJ0v/TieMbxVM6d4zS9ydJ5ky9FnYwB/bn
 /67+vER0yxMdbgcdPdnq+7RJo3bpW2eqChHfkD1gR59G6Ochw7Zhoue60ljd9KsBK2RPJ9+7Dd+
 Bk0oHl3jNMvbjNIfNBaqvnSCmvazbnZi2n1JrGvRuuhOSF6/oY0hlzCzYJj6U3J5JLoUHo/RvEv
 xIDgNvQXD1Ul8c2AhudnTWUCCXGpw5bwLleLXZNh6r77KiudcrQ+wHjc+3AyB5100d/IDZV9pLz
 T5KFT9Qqgr1UnhKUPqvmz/9zaqtUAp1yqWgIyE6dCiKKs5ll1ljE/4lx04RwwH7gIhPAUDp19um
 23NJqm8wECy/46SyyMgwAsCkV2PlLcjsTWknCQUnZKJlQawsbb/R6DYLt0NlwpkK5q+B5uh4cl7
 kq4UnvALsghb7p84K1nYZ43IKYhaeH0AvYe7Q0nL3rFlNOTwi0+nCoCC8v9EleQ4sNat1X3RRxR
 Bu8JX6oRfVsvIDPeQ1hzmdLHAmva4nLqWQQ3yEu8cwGljT1m2fYTuEzrn7BQnFKV/xC5rID1TqV
 vbAdvyBu4MsxqHL8865ARm42fwwkprl2/gxxZdxmhDNYDD0KmvvJ3WQ0qiDzJATfz6/2/NPYVWP
 V56tjRRvGbYMRoQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083158_197663_D0867D59 
X-CRM114-Status: GOOD (  12.73  )
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

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/flash/leds-aat1290.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/leds-aat1290.c
index e8f9dd293592..c7b6a1f01288 100644
--- a/drivers/leds/flash/leds-aat1290.c
+++ b/drivers/leds/flash/leds-aat1290.c
@@ -7,6 +7,7 @@
  *	Author: Jacek Anaszewski <j.anaszewski@samsung.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/led-class-flash.h>
@@ -215,7 +216,6 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 			struct device_node **sub_node)
 {
 	struct device *dev = &led->pdev->dev;
-	struct device_node *child_node;
 #if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
 	struct pinctrl *pinctrl;
 #endif
@@ -246,7 +246,8 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 	}
 #endif
 
-	child_node = of_get_next_available_child(dev_of_node(dev), NULL);
+	struct device_node *child_node __free(device_node) =
+		of_get_next_available_child(dev_of_node(dev), NULL);
 	if (!child_node) {
 		dev_err(dev, "No DT child node found for connected LED.\n");
 		return -EINVAL;
@@ -267,7 +268,7 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 	if (ret < 0) {
 		dev_err(dev,
 			"flash-max-microamp DT property missing\n");
-		goto err_parse_dt;
+		return ret;
 	}
 
 	ret = of_property_read_u32(child_node, "flash-max-timeout-us",
@@ -275,15 +276,12 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 	if (ret < 0) {
 		dev_err(dev,
 			"flash-max-timeout-us DT property missing\n");
-		goto err_parse_dt;
+		return ret;
 	}
 
 	*sub_node = child_node;
 
-err_parse_dt:
-	of_node_put(child_node);
-
-	return ret;
+	return 0;
 }
 
 static void aat1290_led_validate_mm_current(struct aat1290_led *led,

-- 
2.43.0



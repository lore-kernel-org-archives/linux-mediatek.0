Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C92D5E379
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Nov 2024 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mS9pz7F1aaDN/ZOdRUw2lCD3EzMHHJ9M85Tk+LBqBLI=; b=K7YQb79He3XIo4m5O7bhrWXqBU
	pIWNaNjPiuS9ypDAdOPpJ5ufoi1buIastRgRShCBalt9n6Io2a2x8YvPX1h/+78id9DkX5pOBUukT
	8TU95UmBW5K5QRVQo2enxAC7KpWRLwZoPPbymSrCm8UyxmkXFK4YwOjdZc+ZKavUjMeyRWyk64fkn
	jMy0qw4wBMhi8q6Bj+NW7MAMn6ZJp3O1ENAB0TOJgCvdS116m9EbZ0xwt1mG79YVDGXyrmQgLgXBv
	SdVIfuOeUUaRpMlgEyBKJ0MnyHemWtA7708u9ymFTHScfc5NSYF4QoFkSGi8YEgsxWa3Ul6y8U76w
	YA2fEGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9pYV-0000000Dkns-05XD;
	Sat, 09 Nov 2024 17:47:27 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9pYR-0000000DknC-48v1
	for linux-mediatek@lists.infradead.org;
	Sat, 09 Nov 2024 17:47:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5c9693dc739so4565381a12.3
        for <linux-mediatek@lists.infradead.org>; Sat, 09 Nov 2024 09:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731174442; x=1731779242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mS9pz7F1aaDN/ZOdRUw2lCD3EzMHHJ9M85Tk+LBqBLI=;
        b=OP5MH1JS7ZUYs/nJnzkp6WJDpUBvhkcH5dKD3r5aJv7KGmzx65focHmJLf27sY73nu
         8eZ3BbhRgF/sLTEoPQ+9Vzf6DeClENPB43l0JHBmiG8VPW+8rBO8ZI9aJa44iTl7oshS
         VZ2ArJVWPVKU1P2Iw6P6tNRiPtmF2PkJP49rROklmzW32r9ggMiQDBjP50blMAPJc6g6
         bq+n0Hrq5lT8uw9ZJ3D65eqHthlCuHizP+nFwQGHA32Q/LRgwL9SnQ3yihTgh/jxcz8O
         8AJyzkm6Wn7gsoOIDpelsqguTVtW0x2TqaVKZ9UgupAF4Ojdwa8eZshlhW7WPD2EW2re
         a8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731174442; x=1731779242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mS9pz7F1aaDN/ZOdRUw2lCD3EzMHHJ9M85Tk+LBqBLI=;
        b=rpePEQIvMDOfujpaCKuzjKAg+eLwfJW7yOu8LCfawHCGTrmad4CzMtA4dEs6/vk42s
         fSSHlSk8XPJi6+kpbSu3K2TTCNrclUR6BS21VH+OPorb+1ml1b8WlYOauJtgiHbQ2BSY
         QpALikPQrNTPh1uqsRMFFoxNp5u8fmq8bvgaYfZ1XyHFIEJbVsYTfxltDxNuqZfXZPl0
         /ybuIMTa1luShG2aTESAgYEQ67o/MmjR/SWWk3c+Rp7+gBI49z25uhE2s2eu9SrFjB8s
         AtyrVh5YfHodaJSndwbynIHS7rgNO5Lw3uxLVDqbOe3k78rUQ8YjuvhaR1nZbLGxUIzv
         CMYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXml2WYhBqO8Fjx04o7xdDCPX4C+n33Rpkmmt27anowwXURGHDNriNo8sw9FVQVKwODxcTpesYF1ZlQSvDfLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxT7bOAO9LjhHTMr0qB10qxiUt5lihEtVKwkj0kqljyzE8P++tI
	d8ESw2z01AiUdfjv/Rwnn+PBSQTEF3RzdTlYWnHoz3zRWXasZsSZ11hqHAN/hd0=
X-Google-Smtp-Source: AGHT+IGJCTMOIjftfGiK2wILQrVE69oNLiwz7mzb5YOsUCHt/S1Cp1slGT50grlnlMbHdWGpyNa4Cg==
X-Received: by 2002:a05:6402:5203:b0:5cb:6ca3:af96 with SMTP id 4fb4d7f45d1cf-5cf0a3245camr5846634a12.19.1731174442127;
        Sat, 09 Nov 2024 09:47:22 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03bb7530sm3155853a12.43.2024.11.09.09.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 09:47:20 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] backlight: Switch back to struct platform_driver::remove()
Date: Sat,  9 Nov 2024 18:47:10 +0100
Message-ID: <20241109174710.292128-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8119; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=E2geTdbXiQmLaAty8/2EMgECF6diNU8eKtMXb4ZB/kM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnL6Afi/iMzSDb+OigQAp+L7XwwVJGKjDySz/NY fOeD6CGpd2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZy+gHwAKCRCPgPtYfRL+ ThzhB/sGt+oJ4HQwFpd3iQmQbVXTZGNqc/ag8Kv0rc6jUt1eEG9M5LKySpZneqakogzueVU12Aa 9N0pkYhmrph8F9iskLUhrowJwEHPzvNF4d+iGb9bPMs9eqPDf03T05qiQNDtdviMl8AA8CViwX9 ksWE4uE5+HNIPq9mW0fMoOhukaYrROQ0dpkv8cEOIp91zyifjxlRL9RVU4qXAQqZ0wLZgDTXeiL ePV5Bn6e4r/pjQsX4kwvMKRoIvRrKEEq5+d1+/uVFQktjYLUDsntM8jr2fYt3llq/zxho1zr8vY MSJV4DO3Jt/OSOYcuWtM3vsFxpQBOF0yE6jwqCrXNEsStJGm
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_094724_061467_72D255C6 
X-CRM114-Status: GOOD (  18.32  )
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/backlight to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/video/backlight. While I usually
prefer to do one logical change per patch, this seems to be
overengineering here as the individual changes are really trivial and
shouldn't be much in the way for stable backports. But I'll happily
split the patch if you prefer it split. Also if you object the
indentation stuff, I can rework that.

This is based on yesterday's next, if conflicts arise when you apply it
at some later time and don't want to resolve them, feel free to just
drop the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/video/backlight/aat2870_bl.c         | 2 +-
 drivers/video/backlight/adp5520_bl.c         | 2 +-
 drivers/video/backlight/da9052_bl.c          | 2 +-
 drivers/video/backlight/hp680_bl.c           | 2 +-
 drivers/video/backlight/led_bl.c             | 2 +-
 drivers/video/backlight/lm3533_bl.c          | 2 +-
 drivers/video/backlight/lp8788_bl.c          | 2 +-
 drivers/video/backlight/mt6370-backlight.c   | 2 +-
 drivers/video/backlight/pwm_bl.c             | 2 +-
 drivers/video/backlight/qcom-wled.c          | 2 +-
 drivers/video/backlight/rt4831-backlight.c   | 2 +-
 drivers/video/backlight/sky81452-backlight.c | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 68d327ee4b2e..8b790df1e842 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -186,7 +186,7 @@ static struct platform_driver aat2870_bl_driver = {
 		.name	= "aat2870-backlight",
 	},
 	.probe		= aat2870_bl_probe,
-	.remove_new	= aat2870_bl_remove,
+	.remove		= aat2870_bl_remove,
 };
 
 static int __init aat2870_bl_init(void)
diff --git a/drivers/video/backlight/adp5520_bl.c b/drivers/video/backlight/adp5520_bl.c
index 8e0e9cfe5fe9..aa5c15e8db86 100644
--- a/drivers/video/backlight/adp5520_bl.c
+++ b/drivers/video/backlight/adp5520_bl.c
@@ -375,7 +375,7 @@ static struct platform_driver adp5520_bl_driver = {
 		.pm	= &adp5520_bl_pm_ops,
 	},
 	.probe		= adp5520_bl_probe,
-	.remove_new	= adp5520_bl_remove,
+	.remove		= adp5520_bl_remove,
 };
 
 module_platform_driver(adp5520_bl_driver);
diff --git a/drivers/video/backlight/da9052_bl.c b/drivers/video/backlight/da9052_bl.c
index b8ff7046510e..5e13ef96b717 100644
--- a/drivers/video/backlight/da9052_bl.c
+++ b/drivers/video/backlight/da9052_bl.c
@@ -165,7 +165,7 @@ MODULE_DEVICE_TABLE(platform, da9052_wled_ids);
 
 static struct platform_driver da9052_wled_driver = {
 	.probe		= da9052_backlight_probe,
-	.remove_new	= da9052_backlight_remove,
+	.remove		= da9052_backlight_remove,
 	.id_table	= da9052_wled_ids,
 	.driver	= {
 		.name	= "da9052-wled",
diff --git a/drivers/video/backlight/hp680_bl.c b/drivers/video/backlight/hp680_bl.c
index ddb7ab4df77e..fa9a983533b2 100644
--- a/drivers/video/backlight/hp680_bl.c
+++ b/drivers/video/backlight/hp680_bl.c
@@ -130,7 +130,7 @@ static void hp680bl_remove(struct platform_device *pdev)
 
 static struct platform_driver hp680bl_driver = {
 	.probe		= hp680bl_probe,
-	.remove_new	= hp680bl_remove,
+	.remove		= hp680bl_remove,
 	.driver		= {
 		.name	= "hp680-bl",
 		.pm	= &hp680bl_pm_ops,
diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index c7aefcd6e4e3..ae34d1ecbfbe 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -246,7 +246,7 @@ static struct platform_driver led_bl_driver = {
 		.of_match_table	= led_bl_of_match,
 	},
 	.probe		= led_bl_probe,
-	.remove_new	= led_bl_remove,
+	.remove		= led_bl_remove,
 };
 
 module_platform_driver(led_bl_driver);
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 5d06f8ca976c..babfd3ceec86 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -387,7 +387,7 @@ static struct platform_driver lm3533_bl_driver = {
 		.pm	= &lm3533_bl_pm_ops,
 	},
 	.probe		= lm3533_bl_probe,
-	.remove_new	= lm3533_bl_remove,
+	.remove		= lm3533_bl_remove,
 	.shutdown	= lm3533_bl_shutdown,
 };
 module_platform_driver(lm3533_bl_driver);
diff --git a/drivers/video/backlight/lp8788_bl.c b/drivers/video/backlight/lp8788_bl.c
index 0b7663519fa5..f61a64905a02 100644
--- a/drivers/video/backlight/lp8788_bl.c
+++ b/drivers/video/backlight/lp8788_bl.c
@@ -177,7 +177,7 @@ static void lp8788_backlight_remove(struct platform_device *pdev)
 
 static struct platform_driver lp8788_bl_driver = {
 	.probe = lp8788_backlight_probe,
-	.remove_new = lp8788_backlight_remove,
+	.remove = lp8788_backlight_remove,
 	.driver = {
 		.name = LP8788_DEV_BACKLIGHT,
 	},
diff --git a/drivers/video/backlight/mt6370-backlight.c b/drivers/video/backlight/mt6370-backlight.c
index 94422c956453..e55f26888d0f 100644
--- a/drivers/video/backlight/mt6370-backlight.c
+++ b/drivers/video/backlight/mt6370-backlight.c
@@ -340,7 +340,7 @@ static struct platform_driver mt6370_bl_driver = {
 		.of_match_table = mt6370_bl_of_match,
 	},
 	.probe = mt6370_bl_probe,
-	.remove_new = mt6370_bl_remove,
+	.remove = mt6370_bl_remove,
 };
 module_platform_driver(mt6370_bl_driver);
 
diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index e942908d1275..237d3d3f3bb1 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -697,7 +697,7 @@ static struct platform_driver pwm_backlight_driver = {
 		.of_match_table	= of_match_ptr(pwm_backlight_of_match),
 	},
 	.probe		= pwm_backlight_probe,
-	.remove_new	= pwm_backlight_remove,
+	.remove		= pwm_backlight_remove,
 	.shutdown	= pwm_backlight_shutdown,
 };
 
diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 10129095a4c1..9afe701b2a1b 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1741,7 +1741,7 @@ MODULE_DEVICE_TABLE(of, wled_match_table);
 
 static struct platform_driver wled_driver = {
 	.probe = wled_probe,
-	.remove_new = wled_remove,
+	.remove = wled_remove,
 	.driver	= {
 		.name = "qcom,wled",
 		.of_match_table	= wled_match_table,
diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
index c2f6fb29e1d0..7ead75929a43 100644
--- a/drivers/video/backlight/rt4831-backlight.c
+++ b/drivers/video/backlight/rt4831-backlight.c
@@ -224,7 +224,7 @@ static struct platform_driver rt4831_bl_driver = {
 		.of_match_table = rt4831_bl_of_match,
 	},
 	.probe = rt4831_bl_probe,
-	.remove_new = rt4831_bl_remove,
+	.remove = rt4831_bl_remove,
 };
 module_platform_driver(rt4831_bl_driver);
 
diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index 935043b67786..2749231f0385 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -337,7 +337,7 @@ static struct platform_driver sky81452_bl_driver = {
 		.of_match_table = of_match_ptr(sky81452_bl_of_match),
 	},
 	.probe = sky81452_bl_probe,
-	.remove_new = sky81452_bl_remove,
+	.remove = sky81452_bl_remove,
 };
 
 module_platform_driver(sky81452_bl_driver);

base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
-- 
2.45.2



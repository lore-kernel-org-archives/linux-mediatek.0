Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7242BCEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z03eGnj6iGqYzDELmW5r9JfCTcrG6sf4eOCgWvySkE=; b=AR+x8EQC515C8e19rbqe5PO5zF
	2ldQ6s70OPqXQ39yWOeASSn9T3eWFtxnBsX9gbqJJMHJDCxiPWLTgE1FGEbedo6g2i1QuUGBo6YEW
	WN0kC2TBj6NglG5u3XmlZgkU0FD/C0PBhahI7w5qXma4WI5kSeToL4nFS9MfKb3VbcEL1ARi4RX4q
	6PFQND6Ey2WUYQZIIU+wHEQCuKydRh5TY6BEUFp1aSd9NdECRXHa2cdsubqIVnB0Oukk+6xZ0jLXo
	MrzMmTsQo+CnGHrWAfEL3a/CxKQReXSneoBDOt47FRXOy5kOT3zTFH8gkA7Pg2JXS09LopjmWCvxr
	3TiM0VVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stxz0-00000009b4h-26SY;
	Thu, 26 Sep 2024 23:33:14 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnl-00000009YzU-1W8K;
	Thu, 26 Sep 2024 23:21:39 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a910860e4dcso215223666b.3;
        Thu, 26 Sep 2024 16:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392895; x=1727997695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z03eGnj6iGqYzDELmW5r9JfCTcrG6sf4eOCgWvySkE=;
        b=Ghfrk/dFPtYh8Qq9iKCGw+lRdsmtgydRKvIq8KPzHwuRJtfb+zvydNjK/qV7TwRKIZ
         6yr2pUQY1fzftMsqApKuZfHvcPaNKvV1CfWjuClfBuPKoLREPzFEf1xmHa4tVYZXe42C
         RsU6icKZzXxL5PFCJYvqSgqKTwCjLnDSsBMxQZMGS3Gb12KwKmcu+3g5WusUJLV1wmgH
         TouLPgfR9oAFxMZoNNjTtjV+C9xGQZOIln6RrKUkMS5qbmZqCbQCVNkEI6dTcvCUMwuY
         vY0ulabMZCIzeUfrFiW1uu11qtdwy6hhlbWAcemWuHeIywvG6+lgKpXq7M90H7tG1KFF
         vsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392895; x=1727997695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z03eGnj6iGqYzDELmW5r9JfCTcrG6sf4eOCgWvySkE=;
        b=AwZvL2MjxFVsu7fb2aItC9NKG5L+xW9yYloRUr10dTlJZivRVDzK+P1kpid3rd2pOw
         qXPl/11z0nu8jN/+fAkzuyQ+D0g25E0QM/abHOAAV3014XoEa6SKIZCE96iRzSuOaXVt
         va/7tAPX+8g9O5ceUw35BntRhXSluRECRaT0lVMZ5HoKwiyPOR5cB5J9k7iYjjZ+eu6i
         kEZAU5JSBUKVZWttBklNzJ63W2pAuDs0+6EepJLhebgrYWOGwLRXmjlPkjwYpxHqxtOL
         iQRrhf5mtfFTGaH2graDxS9DPl0JfD0SaYdAfOhrKVjUz1ocGIUVelMOefmbtRFGWDa3
         YMSA==
X-Forwarded-Encrypted: i=1; AJvYcCUjptQ/UYNAz+iwEXj4AJYkCQHEuFIWCnfkXQAGWyyWzlvZHz9GEK2tgx5nTzObf3EbgyEjOYpLfbZAZ/w2b+8=@lists.infradead.org, AJvYcCVH2TbZb1ezXiarTTDr8W2d8KGm4vmnPvrE+JjbhhJVrGydZY8P2/7D/sg31rZwWFmnZiXfD1VFmRe7zdu/uyc0@lists.infradead.org
X-Gm-Message-State: AOJu0YxhdO5t3hICEhDC8Q2SjVSKYBElSsc26ifuKC3f4Kx/qpfoMM1/
	srVzihdtgf2/qJrOxuRxkfrUDmACQ8KCSgKpF+Z+vBuuX5wa94vlPIC7G6Ul
X-Google-Smtp-Source: AGHT+IHzRwIU6UAzlavm/QZ6zyKdlkN5H8May0eKhpEiWtxIy3j8Q0eikPpKvoRwQ2Ar8Be+Bn0Hew==
X-Received: by 2002:a17:906:4787:b0:a8b:154b:7643 with SMTP id a640c23a62f3a-a93c492a5dcmr98770966b.28.1727392894740;
        Thu, 26 Sep 2024 16:21:34 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:34 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:59 +0200
Subject: [PATCH 08/18] leds: lm3532: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-8-95c0614b38c8@gmail.com>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=2745;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=v0iYfIBPWrhBeMk5GmLZkiz62OQVqii6tL7xBG0nuYo=;
 b=vv0qMx18gJDO2AXmo395Dj+OG11mPwp0TR26/SNLfM9jrHi1Va8TeNdbSx8stlq/n+ILIf4c3
 gYOYGMQVm0qArDwfN4d+6vbuDJ3QihySKHfjHS8w1myjgZBJRpxCUpZ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162137_445342_ADCB7C3C 
X-CRM114-Status: GOOD (  14.37  )
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

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

After switching to the scoped variant, there is no longer need for a
jump to 'child_out', as an immediate return is possible.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-lm3532.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 54b5650877f7..24dc8ad27bb3 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -551,7 +551,6 @@ static void gpio_set_low_action(void *data)
 
 static int lm3532_parse_node(struct lm3532_data *priv)
 {
-	struct fwnode_handle *child = NULL;
 	struct lm3532_led *led;
 	int control_bank;
 	u32 ramp_time;
@@ -587,7 +586,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 	else
 		priv->runtime_ramp_down = lm3532_get_ramp_index(ramp_time);
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node_scoped(priv->dev, child) {
 		struct led_init_data idata = {
 			.fwnode = child,
 			.default_label = ":",
@@ -599,7 +598,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		ret = fwnode_property_read_u32(child, "reg", &control_bank);
 		if (ret) {
 			dev_err(&priv->client->dev, "reg property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		if (control_bank > LM3532_CONTROL_C) {
@@ -613,7 +612,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 					       &led->mode);
 		if (ret) {
 			dev_err(&priv->client->dev, "ti,led-mode property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		if (fwnode_property_present(child, "led-max-microamp") &&
@@ -647,7 +646,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 						    led->num_leds);
 		if (ret) {
 			dev_err(&priv->client->dev, "led-sources property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		led->priv = priv;
@@ -657,23 +656,20 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		if (ret) {
 			dev_err(&priv->client->dev, "led register err: %d\n",
 				ret);
-			goto child_out;
+			return ret;
 		}
 
 		ret = lm3532_init_registers(led);
 		if (ret) {
 			dev_err(&priv->client->dev, "register init err: %d\n",
 				ret);
-			goto child_out;
+			return ret;
 		}
 
 		i++;
 	}
-	return 0;
 
-child_out:
-	fwnode_handle_put(child);
-	return ret;
+	return 0;
 }
 
 static int lm3532_probe(struct i2c_client *client)

-- 
2.43.0



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6974FCEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbKG8yQzAXSNKnNqMlC3vDG+SObBOdoBsMSFHrHh/gQ=; b=CIQiY7EUoW+UDAZnDc+f0XyanI
	7tJTx3TcDtFA+a9l82cd7h9QFYvbRbt39ypCyb4D5umgMA6Hk9XsFGm7ZlKpUxQRZZjE7IVG4TzNt
	8y8auciEWBy89DFohct+CARM9nc9kmVQbxmHsk3dhWrUgtsTZ/RqOkM31ITCqT1QY5+BFfGa+c+4h
	65XL7NWYvsXIT2skvXi/LM03XokFgtlP5ClOAWABgBUFY49JU8ZDUALBOx110hkOnBe4Rw9d85OIa
	gWxLaUVWZMieoU/vPUCMwfO9jEf4SkrAE/wRUYQeVLphIXK9srNN8n+pq5Nqx9QRYhzQLfJOaUOwl
	Fz1xMsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sty1H-00000009bLX-1gcF;
	Thu, 26 Sep 2024 23:35:35 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnp-00000009Z11-0MrA;
	Thu, 26 Sep 2024 23:21:42 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5365b71a6bdso1985059e87.2;
        Thu, 26 Sep 2024 16:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392898; x=1727997698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbKG8yQzAXSNKnNqMlC3vDG+SObBOdoBsMSFHrHh/gQ=;
        b=hg4YlA6YY+OAYErucdSDk0ziAGULYdtWJeMEoazmslDv8JtY4ywM6k1Tff+15FUKD3
         6FzW61mE7zv9p0zRoizDaRi6kxtm8o97ZSCK5EbAPBXvw7BMAZS4snjzBlVtfA27UKjs
         Q13offwV8se/zT+qOXtXntNnevpjxyIPwpjo3xdQgUAplS5gSfAzI46wTm+ZZxF0oQeN
         iXFYf4U81oLKzCmHxZvh3m8avw17CvjdfSQ7QBy0obg8KU4VcXb/kIKbJgfvkACv/pH3
         oUEsQnCW5PwyMQhb6NVL8nRF5TNO8OuwBe2FeYEyaB3l6Yu98LkhSzllLS3edRvU9yZm
         rxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392898; x=1727997698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbKG8yQzAXSNKnNqMlC3vDG+SObBOdoBsMSFHrHh/gQ=;
        b=eKHduMDadpnx/ojDSMyvqXjYWXLR0by7L24Fq2jASEQc1vCDTHHUXn3E7fQ9zdDpda
         jmRgMYXt590cKSJAngQjhZUAHs3vyzMs8MB+OrmUiO5ZdVO9M6YAMzf4t97RpNWTdbgH
         LmRMlO3tADe4NY29IFQ8VVX0noU8SYpAYSaV3ZUpAAaPN/3cBj0SCtqQ+gPp3bw4gBT/
         2RCjpkmY3WyQ/ojoV0Ka3OpO0KvEg+1cByW31zmOJOMzsGXCFkAW43BEpdpAIJkQQg2h
         3tAAD830nP+BJDIGW8LL6g6SEpp2NucGvQWWWZgb5c57wDlB+tp1MJezSE9qi4p7jjfQ
         wX0A==
X-Forwarded-Encrypted: i=1; AJvYcCW1bqOzrVGD6Rrg1WgoIEZNTn1zz9T7COhDEln2s2HtN9nPanX2R2TshtFC0ki1T5236DnUtmqhcTMI8E2O2kBa@lists.infradead.org, AJvYcCWwDc/IpFZdlEDXDVtHyh69PiTkq1h362pTwyFy9Je9FK9ytsExElr3+8z+oM8bXYPBMlsrGLLNudbEacZCdUY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgd/KHMraUiPS/p6etsfBXLRRf8dw8boFoPdUHifYZd8vYWaGJ
	w9ymLxEK7TMFoqEvisug4xK9KZ3SbjuIv8Fvd8DtJWUHMxmhdCHG7O7Cg2Ze
X-Google-Smtp-Source: AGHT+IHargOBULwRmlTYho66CY6TIIKNF6jhPFgs1jxdfin7EzZ3x+Ihx+4IF9Pdg3mdG2UXbYfTUQ==
X-Received: by 2002:a05:6512:3b0e:b0:533:4477:28a2 with SMTP id 2adb3069b0e04-5389fc3bd4cmr983572e87.16.1727392898039;
        Thu, 26 Sep 2024 16:21:38 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:37 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:01 +0200
Subject: [PATCH 10/18] leds: lp50xx: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-10-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=2725;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wVCMNpNXMBYRf/3Qo+CvGWvj1uX3gLZ/0II5tIZcKP4=;
 b=gvqzp5RpDFRs+Bq7QHctcXoi4uXIDmfAqWPfacNwek7XmLGTnkrq8CcrnDg8YhcpKi7G9Dh5l
 Mj0YUm6RICjA0yWhlPqzXPpjj3PJpAdJDq6e44FbnnPGX71dsvI63Wq
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162141_166235_85539774 
X-CRM114-Status: GOOD (  14.69  )
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
 drivers/leds/leds-lp50xx.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 175d4b06659b..32ca45aec76c 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -434,7 +434,6 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
 
 static int lp50xx_probe_dt(struct lp50xx *priv)
 {
-	struct fwnode_handle *child = NULL;
 	struct fwnode_handle *led_node = NULL;
 	struct led_init_data init_data = {};
 	struct led_classdev *led_cdev;
@@ -454,17 +453,17 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 	if (IS_ERR(priv->regulator))
 		priv->regulator = NULL;
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node_scoped(priv->dev, child) {
 		led = &priv->leds[i];
 		ret = fwnode_property_count_u32(child, "reg");
 		if (ret < 0) {
 			dev_err(priv->dev, "reg property is invalid\n");
-			goto child_out;
+			return ret;
 		}
 
 		ret = lp50xx_probe_leds(child, priv, led, ret);
 		if (ret)
-			goto child_out;
+			return ret;
 
 		init_data.fwnode = child;
 		num_colors = 0;
@@ -475,10 +474,8 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		 */
 		mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
 					   sizeof(*mc_led_info), GFP_KERNEL);
-		if (!mc_led_info) {
-			ret = -ENOMEM;
-			goto child_out;
-		}
+		if (!mc_led_info)
+			return -ENOMEM;
 
 		fwnode_for_each_child_node(child, led_node) {
 			ret = fwnode_property_read_u32(led_node, "color",
@@ -486,7 +483,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			if (ret) {
 				fwnode_handle_put(led_node);
 				dev_err(priv->dev, "Cannot read color\n");
-				goto child_out;
+				return ret;
 			}
 
 			mc_led_info[num_colors].color_index = color_id;
@@ -504,16 +501,12 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 						       &init_data);
 		if (ret) {
 			dev_err(priv->dev, "led register err: %d\n", ret);
-			goto child_out;
+			return ret;
 		}
 		i++;
 	}
 
 	return 0;
-
-child_out:
-	fwnode_handle_put(child);
-	return ret;
 }
 
 static int lp50xx_probe(struct i2c_client *client)

-- 
2.43.0



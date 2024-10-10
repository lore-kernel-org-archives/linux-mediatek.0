Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7320BD2444F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 21:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NP8lfF3+tt2bERQMe+43qAzEv8h11+8hyUY3IsdG9dE=; b=UHuZsOJ9IjiBZ7BJMUIFPBx4wD
	lpWMUGZDGqY1irJbfE+1BxSd1SpfVgN5KZaD63s3Y8brzjJl//OsWPyblrGmkYgP9wv8DHsoe/ANQ
	jSOORze6O6a6CLw/CrEshn+wFw4ci0Y1+wGcYPG82DVHjYHElhtP7SwybFCOvcz3UmFXqZKAsFUj3
	9iVpeaKRoTUImOxiNtODA9G13r7XZck19vXqKRCklPeNmaXC8D0w108rRK2wpOcC79tJGQpoyjwLw
	fOGW30Us15bjxD377soPjK8b8PcTUPS9nB3NUQR1LdaVsjxCL+t9gr/F+oR1Hxrq/zv5lVG/apttP
	Mxra/c3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0iN-0000000EPdN-1zUc;
	Thu, 10 Oct 2024 21:28:55 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fa-0000000EP3D-0vrC;
	Thu, 10 Oct 2024 21:26:03 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d495d217bso1024771f8f.0;
        Thu, 10 Oct 2024 14:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595560; x=1729200360; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NP8lfF3+tt2bERQMe+43qAzEv8h11+8hyUY3IsdG9dE=;
        b=ekS2NQvWC5D57LKgHx7cXEWfIGUpvYwOMEEcwZqdZ76Qj8KIXnS+vC3qwWmeP0w6Ia
         z/K+BJ9q3r/iyZ8Sq9F4DPkx4lnk/81H+tHCYBdLprGqWEpBg/00R22+/xqklI/orTun
         S4VPyKgDYWrWEkMRsx/QoVMvl/HHHEXCfdZ9BZqJoxWi+XMs9iOxsibTI9jxqEf4nd7r
         XMcXrZYzLasPXBnZ1EFxKNRKe/oHBUbwrJdOd8OzJko/IpSceaO3Z/uIcogSApvQT/jw
         mYPTzQFkGzuOyfSsqJPE5L0PNY1oVKt307Wbw0pX7+c2wymI4pjvygkO6eU4yhb6kSwj
         j6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595560; x=1729200360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NP8lfF3+tt2bERQMe+43qAzEv8h11+8hyUY3IsdG9dE=;
        b=C7DpwWnlLo1Lv7UAwlsGXnYDs3LdVSXo8c1EzZ596kUkiNLR6QVkTbt/BXrm+benoq
         bva+fZb0Ub6Y9D/1Pe/PnTqxDQDuWsI2CAze/EIG2UPYVaK43ThaJfmxBPFBYqgkwAB1
         nVQpHRGXQWsRveZML+bf/yjE8N0WzgiyWC+EgCIpTNfgJuA16Kieu5SOg6M90WK42kRm
         QgGvqxaf/E6ABhiqgPlHGQc0LGYVh3RcgNDG+K7BJ75RrLiBrmUa+nSF9Ge1875QU2Pn
         YAZE/3LwJO99P13osB5bnIOhwwFoFzm00zFnWFf+WWwmTvvGNFF0SZY9pxxxXZw/BvW5
         26HA==
X-Forwarded-Encrypted: i=1; AJvYcCVZZ1K9kjs0hgkd0HqzZHqf6TTDT8dSwnx2Fs4DYSrhqpq8mqCwdt8Dwn6XL2e9CJ4icK4h9uH2kydHiEt+lRCO@lists.infradead.org, AJvYcCWJOTjhPyWRdowENzTSgH4h6S2S5SZ1TKUbkKdNTWrhN6eP8GvSV89lMHY7Q5fPzzGRfrlirncDdLd0kOq4Ez4=@lists.infradead.org, AJvYcCXF6h1Xca7THrFJAQpMrOiIT1DK1Gspw2PXxIYnwqIkQO45X9tHhhOAagS5ZwfMBhC6BC2OXgVhlJtEgesezW0NcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUh9CNdGW1yIBH6Gl698PI2fC5HGdASpdzxjKhmO57XLM8pORO
	/7Y/Sr5x+1FMpVCobkZ4k6MehdKjxEyRDR5jNPguc9u3L43tGqzNdYSO1tcV
X-Google-Smtp-Source: AGHT+IE4KFtceqWgFI5Exk1ggU7gG6fN1lLUM7411oUgT6YiAdrbwe1U80pIh0+6rzapsH7z+JsyYQ==
X-Received: by 2002:adf:f585:0:b0:37c:d1ea:f1ce with SMTP id ffacd0b85a97d-37d551d53dbmr354861f8f.25.1728595560283;
        Thu, 10 Oct 2024 14:26:00 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:25:59 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:51 +0200
Subject: [PATCH 01/10] Input: cap11xx - switch to
 for_each_child_of_node_scoped
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-1-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1675;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=t9fa1o1a5Sgyy/pkELwXsraoor0CZUbJK+3ORgewgNE=;
 b=b31gP7WKvaxSGCe8LGxC0VFmrQkeU9+dZDzn0FUk6fhSEtR5GsZSn0RkT3Hsunh8on+1vLtSE
 bY5XwOwbB/8CemBxLFfFlFJk8eGyd/NjIzj/SvQvHebIoHP0HzSadpD
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_142602_298911_BA6BB94E 
X-CRM114-Status: GOOD (  12.48  )
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

Use the scoped variant of the macro to simplify the code and error
handling. This makes the error handling more robust by ensuring that
the child node is always freed.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/keyboard/cap11xx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/cap11xx.c
index b21ef9d6ff9d..0c17cbaa3d27 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -416,7 +416,7 @@ static int cap11xx_led_set(struct led_classdev *cdev,
 static int cap11xx_init_leds(struct device *dev,
 			     struct cap11xx_priv *priv, int num_leds)
 {
-	struct device_node *node = dev->of_node, *child;
+	struct device_node *node = dev->of_node;
 	struct cap11xx_led *led;
 	int cnt = of_get_child_count(node);
 	int error;
@@ -445,7 +445,7 @@ static int cap11xx_init_leds(struct device *dev,
 	if (error)
 		return error;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		u32 reg;
 
 		led->cdev.name =
@@ -458,19 +458,15 @@ static int cap11xx_init_leds(struct device *dev,
 		led->cdev.brightness = LED_OFF;
 
 		error = of_property_read_u32(child, "reg", &reg);
-		if (error != 0 || reg >= num_leds) {
-			of_node_put(child);
+		if (error != 0 || reg >= num_leds)
 			return -EINVAL;
-		}
 
 		led->reg = reg;
 		led->priv = priv;
 
 		error = devm_led_classdev_register(dev, &led->cdev);
-		if (error) {
-			of_node_put(child);
+		if (error)
 			return error;
-		}
 
 		priv->num_leds++;
 		led++;

-- 
2.43.0



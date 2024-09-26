Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F308CEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njNW1TfRFsU+HRABWUBqLsQLOj2MxWgzdzaH2G/Qjz8=; b=13yDjVfRbKFA0dOW3dSaIRKf7n
	ROC973hi+lCic3om59R9UzQjnd5QCJI7+Zsd4rMSTiIalUVjcknUy0PUDYh7eCqdz1f1Ij89Q+R+6
	otvKuCqsvO510KTzG0FEM8tjYMmPpi7RNA1blN4odKc1uu3CWX/+JSNg+f7GGNrCXgiyGe4gGK6hc
	glG+ElUz09GG14uazJtyvE3La/JWGIf69B1JwMZMWcChfaDqHOkCzz03iNruLu6FhOn1b3HgHqKdU
	+cJIj3EGPO878n/ZI3LCPFbDI7kzohjf8Sz+E0nphT5l8A0aaHDgIqN9b+Fb9YpPte4XdCiGzQ6Ai
	73CSSLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stxxs-00000009ay9-1X5T;
	Thu, 26 Sep 2024 23:32:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnj-00000009YyA-2MGz;
	Thu, 26 Sep 2024 23:21:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so14244495e9.3;
        Thu, 26 Sep 2024 16:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392893; x=1727997693; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njNW1TfRFsU+HRABWUBqLsQLOj2MxWgzdzaH2G/Qjz8=;
        b=cQxRWG7itid0wvs5xRvKx2goDlzHo6LwteT0CEYiiLbpkmtQz9NwM+ylflrrhg2oZe
         nnw89qA4sBHc4tBWQpwboKkc27yFNxRHkRMUzLAWfq7kwmpvnHqkh96L06OGQhE6uK9o
         ojZUwIME6AiRHQp1K2vChycSq4DOxjNn2IgYQIzLXW3aYVfqAAQ4ZUoX247mYl61KAKD
         BsNl23oAgKTIBn7d43scAaET+sfYdYMFDWKnsvsLFNbtoldapAo4vPkS1sIlcvNPLvRz
         y/brlL3nd35+ZBMhog/LkkmVX2M1aNJRTG01hTSbG1wSL/A05ba4H14wk8gu1uK+Na5c
         pa8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392893; x=1727997693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njNW1TfRFsU+HRABWUBqLsQLOj2MxWgzdzaH2G/Qjz8=;
        b=hI5Gy8oiY4gZYGZ38AF+CrwHz8b8nKF7pj41X29dXnV5VRX93yUiucwAsOX1d8Cnme
         SYMZhDexIX5Chh1iII5gEGEPsx31gJHIQY7KqSnu0xYEYA4r0M1LoiYC48FQJ3LbR+Sa
         8TA2JB/8dgGbgbj7Q3GOSHF0QM6LvB+PsPgTY/Bc7ASNq4+Z3K7Pchu679p9FX1v+me5
         wMgfa93MDWDDfkQsjRSZ+e5r35vm3MFeW1LCzpIAHVOY9Tx8CB3CSgPiPQcdfhc/W077
         6L8qCU5o7qDUOlVsi0Ew93+KOYsiZEGJZEloIZ+EUSLqBT0lIqdZXJwk56hLlJ1t0j0r
         59vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr2CjfwcvZzot6na0wFFW8jEBAq8nVtJF1VeN0Quy61Oi9mgxz3Jx2ySGuaKdD4rthvX9yRygSsp5bFIdbnvxs@lists.infradead.org, AJvYcCXMNtOjQGJjydc05ntNzH6E4gTxePZOS4GqWH+k8dvykmmhherTOSbtEnxXx0zcBclOJlxrpexriGkWloPWW9A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyenPwFBWKSEyhqHF+ZpOZBeOXp3qtBSx4Wt6zt4GKquKu53SWX
	16/OoSzG85qs9kcbSoWXn4hogMQeJGtGWgamxKH5UPV0VtLoRnRkCAm0/xUX
X-Google-Smtp-Source: AGHT+IFoitU4rHzuAlGaN0CepshD8zukebslAy4qEv5jClIy8HmE5FNZn/uF/6GAUB+QSUSFAl2R6w==
X-Received: by 2002:adf:f4c8:0:b0:374:b97b:c69 with SMTP id ffacd0b85a97d-37cd5b1b9damr807113f8f.48.1727392892968;
        Thu, 26 Sep 2024 16:21:32 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:32 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:58 +0200
Subject: [PATCH 07/18] leds: gpio: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-7-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1859;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=YvOQrDMAC/x5xAIds/zbIhc77SSn9FZnaj7kTpsmuOI=;
 b=F2/BmA3k318R3nNJ4o+UdX5dm9/ZS5qzvXg9eIRN46g7PjN1BIAHbn7DjaItKHdhF2qnEkj6C
 BtRfhRRoXksBEEmVczX8toVRs3aBAvQxOXiWB/l5LPYF47XYVrkWYG1
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162135_640284_993F3A52 
X-CRM114-Status: GOOD (  14.59  )
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

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-gpio.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 4d1612d557c8..7d4488191241 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -148,7 +148,6 @@ struct gpio_leds_priv {
 
 static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
 {
-	struct fwnode_handle *child;
 	struct gpio_leds_priv *priv;
 	int count, used, ret;
 
@@ -162,7 +161,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
 	priv->num_leds = count;
 	used = 0;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct gpio_led_data *led_dat = &priv->leds[used];
 		struct gpio_led led = {};
 
@@ -176,7 +175,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
 		if (IS_ERR(led.gpiod)) {
 			dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to get GPIO '%pfw'\n",
 				      child);
-			fwnode_handle_put(child);
 			return ERR_CAST(led.gpiod);
 		}
 
@@ -192,10 +190,9 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
 			led.panic_indicator = 1;
 
 		ret = create_gpio_led(&led, led_dat, dev, child, NULL);
-		if (ret < 0) {
-			fwnode_handle_put(child);
+		if (ret < 0)
 			return ERR_PTR(ret);
-		}
+
 		/* Set gpiod label to match the corresponding LED name. */
 		gpiod_set_consumer_name(led_dat->gpiod,
 					led_dat->cdev.dev->kobj.name);

-- 
2.43.0



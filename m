Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA04CEBF61
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsOsZwrJIVejL5A3KYmk/iH+gmiGbQUrbC+6txQSDz8=; b=C1MeJ5FYws+t0LQHM5Xn/axpB8
	aBH/b8v6IEcxP8timDRI5eYnSihJhgZQLx0H9GWrRRCiCnqXlDVWHZKpfY5Pq0EvtzMg178z264G4
	9vNmpbxHK3PilIPezYQWATgke4M34Z7CE+9r0SkmfP+2Vvb8oTWReWSOvOzHyNd+dv8at/RtRMRxU
	HX1HzbwgBo2S4U86tX3kj9sGY+1zevuku7vUKInMzG8RJVoyiVUB4pTP/wFpcf/qu2qc20aKnbbT/
	9ULe3pFmFHOJGNDeaPqZGKJ3TKEnXQyJ05cCRpr+wNRQpOkiaM9FqEU6zL/BRYlecCq06A8nzZkri
	kYxaoFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sty2Q-00000009bVC-2bIV;
	Thu, 26 Sep 2024 23:36:46 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnq-00000009Z1P-0akP;
	Thu, 26 Sep 2024 23:21:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-374c3400367so1338904f8f.2;
        Thu, 26 Sep 2024 16:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392900; x=1727997700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsOsZwrJIVejL5A3KYmk/iH+gmiGbQUrbC+6txQSDz8=;
        b=PxjW1ScgVjBNmiRWdc5sbWVtKrxWSJO+pLubr5LFAa5WoE8uZNZxbFieDamDH5a4N1
         SiU7diKek8GATXRKa2XPjtzzHoeQpT4uZ8KaqOazUfGK77C2V4WMuEpj6Qs2/+kTpZzq
         bsiEX0tsMBjmo4FNfrOUDEAq8WGbgMe/VTZT7ZKgGhdG2/qKwBSFqsLU8WqstgqiMS4H
         1p8r2+BKTZuuoOGLPoozaQ5LHxG4KRleyQL6yIdcjr0za7BsXe6qkG7FU+GtZPYgFBTp
         kYN8o+kYPdiCwOu78NyvGbWlqjbY4uTQHyHt8EkRFaCgnY3elSs5uKG++xhsAXv+6WmJ
         dPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392900; x=1727997700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsOsZwrJIVejL5A3KYmk/iH+gmiGbQUrbC+6txQSDz8=;
        b=MU/uOiAw+3pUTSbwAjFFcTi1N00YW4SGwXvc9280a8gYbkiqR2O50Lr50k6Ws+Cs4j
         jHSWCGlRxd4hZSSYROZH8krtwk1w6vzDZQs3P3wyuN6twdRjF5iy/WOnLkA7MDyGbeqH
         2BAhcTxc20KimNccgkarsKSXp3tRdmO+l/bj9apYiXhf4EzetOSzQaI4Gk+aOEmc25gw
         SQaFfHP3UvUgrrn36cRZwbkVXeLjlTNEoysdq/uASa4shJIz3IjKL2Kd/bU/KnTUZdhQ
         TfqCIzZhjg/C/5qUeAT/C4RIYlVyCvyWl/JOf09f16ODrqfRjOSDeVkzftwTOuY2WgYj
         HqBg==
X-Forwarded-Encrypted: i=1; AJvYcCVT/XWJXvxeaH9iUDBn27Yjs8eT4qkjhequavzdhfysqSNLP9ITYqoOj6Nox7UuzjUiX7kcoApw5GhlWt+YGL0F@lists.infradead.org, AJvYcCWItbiD3PWFOsVJFFWl9z6xSr7MLWHeJ++iUgy6J2QPeybX4wZXob9IQ2pAtz1sGa7Yv44s8WJI3kYVm12uHqs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzFjsmayvbqdw9zyJZJB2rvINRleh2oJOc7qL/eo+A423Xs1Nd
	wg+rtw6iQ3HvujhzAYNVmsazMCsbSev6tbUSvz7uZ+nFtKv8kCZye8PynQku
X-Google-Smtp-Source: AGHT+IFUS8qz9IpKL5ZcAZ8OyFyLvVNgici/BBziOfQFbnEaYTDdxY4F9CAtftsOOYRvJ/CoOPKo9w==
X-Received: by 2002:a5d:574b:0:b0:37c:cf1a:b2a8 with SMTP id ffacd0b85a97d-37cd59def87mr961455f8f.0.1727392899862;
        Thu, 26 Sep 2024 16:21:39 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:39 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:02 +0200
Subject: [PATCH 11/18] leds: max77650: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=2297;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=GGAv58INZAAcONt61Bpt35Ntgip4w7Gu6UUVWWUtppE=;
 b=8bF3DQ/2DWcbOXH4dFor2UErTpk8gkcWEtJam43Nw0mF8/Zn9foJ+D7oYX405KrNhZyrd0vzr
 F5Z7Ns6Yd7HCiI8Ke73l2dScfUxJ1IBnD7u7ujtB4pnx6fEvO1lSltl
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162142_216548_E902BA78 
X-CRM114-Status: GOOD (  14.91  )
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
jump to 'err_node_out', as an immediate return is possible.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-max77650.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 1eeac56b0014..f8c47078a3bb 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -62,7 +62,6 @@ static int max77650_led_brightness_set(struct led_classdev *cdev,
 
 static int max77650_led_probe(struct platform_device *pdev)
 {
-	struct fwnode_handle *child;
 	struct max77650_led *leds, *led;
 	struct device *dev;
 	struct regmap *map;
@@ -84,14 +83,12 @@ static int max77650_led_probe(struct platform_device *pdev)
 	if (!num_leds || num_leds > MAX77650_LED_NUM_LEDS)
 		return -ENODEV;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_init_data init_data = {};
 
 		rv = fwnode_property_read_u32(child, "reg", &reg);
-		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
-			rv = -EINVAL;
-			goto err_node_put;
-		}
+		if (rv || reg >= MAX77650_LED_NUM_LEDS)
+			return -EINVAL;
 
 		led = &leds[reg];
 		led->map = map;
@@ -108,23 +105,20 @@ static int max77650_led_probe(struct platform_device *pdev)
 		rv = devm_led_classdev_register_ext(dev, &led->cdev,
 						    &init_data);
 		if (rv)
-			goto err_node_put;
+			return rv;
 
 		rv = regmap_write(map, led->regA, MAX77650_LED_A_DEFAULT);
 		if (rv)
-			goto err_node_put;
+			return rv;
 
 		rv = regmap_write(map, led->regB, MAX77650_LED_B_DEFAULT);
 		if (rv)
-			goto err_node_put;
+			return rv;
 	}
 
 	return regmap_write(map,
 			    MAX77650_REG_CNFG_LED_TOP,
 			    MAX77650_LED_TOP_DEFAULT);
-err_node_put:
-	fwnode_handle_put(child);
-	return rv;
 }
 
 static const struct of_device_id max77650_led_of_match[] = {

-- 
2.43.0



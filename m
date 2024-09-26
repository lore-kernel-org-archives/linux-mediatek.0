Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FB8CEBF61
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHGLYSMhagE5fSOewtprIrN3fA4YzjKM29kt0KG+UpM=; b=ohVtjKR/NfxJvNTQ9p5ROEVOV3
	zNmpU3yB6f2HvruaN8qTmVlkmvF6o7qg4Af05CJmPGPSzNBJYUkw2dtzqg0gKcMIm1WB4vgQDXQqw
	bK5IMa1wi19IDJlxRZHsvBCL8ikMYoxiDPGyoG9hJiSSDKQ/Fhj+P6CuiVaqEqvT4kDIoGe5MgyA8
	3Uqe8XEkIZAsPNA2lW+x7DgJRHJPmozybXz35TWKLciWsZGUa+ytGDMKoDgqNnWkd690+H47guJ23
	9KNvOwpeim/TU28RNIjvoTDfcQTROCkAYPVoyOqW/MvYn4mpTWZE1+c9QqqvhrmXPYbPTk2siOivU
	Vkp+QeCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sty61-00000009cZK-0Kiy;
	Thu, 26 Sep 2024 23:40:29 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxny-00000009Z5R-2h4q;
	Thu, 26 Sep 2024 23:21:51 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso2430702e87.2;
        Thu, 26 Sep 2024 16:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392908; x=1727997708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHGLYSMhagE5fSOewtprIrN3fA4YzjKM29kt0KG+UpM=;
        b=nPWU6mDFJr/znNxSpxt6AXwI6AH/8HUgj2nBTcBk32PLW2WpC641RxNN7t62fPKjPM
         xX7llylUoQ/pegngCXVbwidEWXkaQbxej7Bf9d/VwEROKnV8XQjRa5e/wRVvKiE+GUho
         7fyN8idu/XRz1cy5GJtlotU0SGJ0TcotHXI0BX9LNgB3E/kCwpltaX1qXw/onXgZ5409
         Xm40UGRMVGPVjy9vFnmjxBqjU8BwSnQjy+ULWe3hwQpYtyBzF3s/cmD5/8FE2dknCQxm
         /zTLgCSfkFSLGRRdQelNNi3UMOi9zwAghqXT4HhRbIr5W/FW5sbdCJ6iAhzBlRNSsSGJ
         V/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392908; x=1727997708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHGLYSMhagE5fSOewtprIrN3fA4YzjKM29kt0KG+UpM=;
        b=Wnlk1QC7WnV4pVmGYRPSPv5AGf3fwrggT1hspjCgBrZlwlRMweKvIAOoAfDxfqOr0g
         It1t3LGde1ZO8/IBcJ9kBqvEmO8uplXp1aVVC97lmxAXZY5xQrGrpACJ8UnD7lcrjnYW
         vg1tu17SY+ybNn8bwnbDBqQXJosDW9XsKw6VhCFz9zKIYq5rQtvW4lP7STHI+iwvWbmK
         B+3Ib+cE+ZKg82oX6FzPwyN0No9rD6zazC6JABLSfizfWd0xk0zSUnq7Fb02FzV8LWX0
         W95pGJH9KmdrtJhPI/jFVVriri69c35APvvOYBUvtnnNcWOIQkQ0HRJsV3bcm3LNCJp6
         TiRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOqytM1HcxT6CX5+gpYkEH6tBB3JCDJv3bp8BO0KNT2isv9Gd+n5RTUr12bB3d+S3Hh0YClNmOtXYNVn7DL9U=@lists.infradead.org, AJvYcCWs4nsGyGxAzmhecR6/DcSBJAlstep0fcMlp3JpVMSVxCTwyNNrL7Wx/fNw4lfzfNqO4B0CDpXHljfQPPRIw3Ut@lists.infradead.org
X-Gm-Message-State: AOJu0YxMkusHQf183oYWssU0znP05UIDcDX3lYtdThaxbYX7tCzh0jg4
	JhU94UFKkc9g606em++Jw6cRa+S4nbfVp0FRQoCnbnL5gWwJpNKp3P85sV3P
X-Google-Smtp-Source: AGHT+IHlD2G2E7GSRoMpuBNsI0X5mi6Ua8JvRQEFmnFC/8WxUbT+wMtBf0onF8DjiKH20jT0Ia2fqA==
X-Received: by 2002:a05:6512:3d8d:b0:52c:9877:71b7 with SMTP id 2adb3069b0e04-5389fca4475mr1025221e87.59.1727392908032;
        Thu, 26 Sep 2024 16:21:48 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:47 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:05 +0200
Subject: [PATCH 14/18] leds: pwm: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-14-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1845;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=h1wO2Y5y3snunIjQvp9wEO38mWmGcGSDzqEh5GMe7fI=;
 b=J1kuyS1rctHLvv769c4EZm6T2XBPkiw9ibZoWkMdEGXw3txrJVIYnZXZTRhRj50ABFFbr7IzF
 VoKASt4M5y0BuAGDuF4YB9A9l9nGY60szrd+yDBg2/dQb2i/6z43d4J
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162150_718474_515D19D6 
X-CRM114-Status: GOOD (  14.75  )
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
jump to 'err_child_out', as an immediate return is possible.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-pwm.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index e1b414b40353..7961dca0db2f 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -140,21 +140,18 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 
 static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 {
-	struct fwnode_handle *fwnode;
 	struct led_pwm led;
 	int ret;
 
-	device_for_each_child_node(dev, fwnode) {
+	device_for_each_child_node_scoped(dev, fwnode) {
 		memset(&led, 0, sizeof(led));
 
 		ret = fwnode_property_read_string(fwnode, "label", &led.name);
 		if (ret && is_of_node(fwnode))
 			led.name = to_of_node(fwnode)->name;
 
-		if (!led.name) {
-			ret = -EINVAL;
-			goto err_child_out;
-		}
+		if (!led.name)
+			return -EINVAL;
 
 		led.active_low = fwnode_property_read_bool(fwnode,
 							   "active-low");
@@ -165,14 +162,10 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 
 		ret = led_pwm_add(dev, priv, &led, fwnode);
 		if (ret)
-			goto err_child_out;
+			return ret;
 	}
 
 	return 0;
-
-err_child_out:
-	fwnode_handle_put(fwnode);
-	return ret;
 }
 
 static int led_pwm_probe(struct platform_device *pdev)

-- 
2.43.0



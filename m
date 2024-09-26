Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3767CEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxTvYBMAH6K76CxmrsMQCXDoyFzNi14dQqKe3hz4/gE=; b=BhJeCzOM8S/4yU9XbOL3yVeUz6
	aumDlaTIaPyevNcCapBUBk7zRjNI8YOIUzbIv0ukyjSb3EGmRUKmgcPIKzSuzdK598wLM4J2c26hX
	9W1VILwF3q5vsn2qu/u4COCCXiimyXeW69tV/vxZaHj5hqhBnhWhS4xgPyMzs2YBbKzT9IGgiIhh+
	xTQT63w7Q9oVVbSe3KCg+4HIlV5BqEfCmA1R4x89kf3w8MPZBMmp2Sq7pTZdHGBqGsARa75JIwopn
	LgDCOkzO6Ik9SOSfd+zPtzHwOvGSMhLoDguKriqD8a1p0dOV1x71vzHyDADZ+DzpqkVUtiiIsqccR
	Y9EsMHpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sty7A-00000009coj-42kz;
	Thu, 26 Sep 2024 23:41:40 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxo0-00000009Z64-0HuC;
	Thu, 26 Sep 2024 23:21:53 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a8d56155f51so176268166b.2;
        Thu, 26 Sep 2024 16:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392910; x=1727997710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxTvYBMAH6K76CxmrsMQCXDoyFzNi14dQqKe3hz4/gE=;
        b=gf/SNH2krvPHq6djD56DqZtlUD5e1tCvHE2lPUuC3CSG7iOssbz+sB1xlcQAGtBCX8
         uh2uXk25C54z6PA6U+G9jQ74WVUYJrmU3eiJun1EycHJUksZCdABJNcDXyfhBwy0rYpc
         jYxOUfXpayuB/WSeCcJkT5/vdzpPz/P76AK5MYmHJBhTmODD/CKnuEYOZg3Zj8prmqe+
         10Kt9E6V/dAO42J33IZsBng7iCUrILUAW4cfebStft23v5J++Vslpju/lXVTv6VQbVpi
         n7MoV/o0CznminrRdIj+2uhDLWa0h5lBE6m4ZzMMSta66MUxtBICJeEetnRGqSHGhOcQ
         rIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392910; x=1727997710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxTvYBMAH6K76CxmrsMQCXDoyFzNi14dQqKe3hz4/gE=;
        b=bDDfvyIl4376nUErq9uP35NgmBCP+sI217jHaz/ziOPTZ+qGwhGaq11SeFf8beW3Sh
         C6bD5C/FCCeo3Ev5SU+P1Zzi3mNSKOBQmk7Fe2nuOZK1rsrknNPwzsutbxw965a+QjUZ
         KXMB/japSagNNTHVBkcgETIgOS8vcRmIyiFDbTEM0KhaU8x8+3I6xU9GAGCe60vbu0Zh
         yqrY0p+8TnNvklbzjFJbGAf+0oyXKh1N1QZmwCfwsv9i4jLCGgQj5tGj0DnsUg1pLYn2
         sUQNxJ5byFKQ1A2UJnVgg61GV49sfReBME1UwO30RjHRudDmbiQ+Ds904FvBACoNdBbQ
         O8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVKbtL4qze/WeJTuP8CnIxuQ5scE+S+PYvYfHcbS+okjRKzmngwlB/7ldNoS64mIXIU8ZUwSxfsT76rpqiIKLF2@lists.infradead.org, AJvYcCWf6qBTCG1F7a2rdUxZarkSAkrjsX4IKjxLUiY+WCDTwouU/1ykp3+K5Nv/5I/kXaXm5KErd1TzsYqD52998Rk=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbv403QWyuHK+S37n6LQv64KNK/YrKvAFBkNsbtq8xyH4KHWJw
	/NoD7SRpMeLa3FKYaidCb8LzrKh9NJ4cpTCgIFK4xAoo/1rcWaJb6zbkQtrc
X-Google-Smtp-Source: AGHT+IGRFpVHqTjLsEHhuX5kjF6xyPuBHJW+zrrF725EKx1jN/+wFjAEQNE/hCfydi8zaA50x0RLFw==
X-Received: by 2002:a17:907:7e85:b0:a77:f2c5:84b3 with SMTP id a640c23a62f3a-a93c491f380mr76021266b.22.1727392910067;
        Thu, 26 Sep 2024 16:21:50 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:49 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:06 +0200
Subject: [PATCH 15/18] leds: sun50i-a100: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-15-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=3318;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Fm7F+4MLH582iBnJnE4p4FnmOoiX1OKki6L98DcIN8s=;
 b=f73Nl+8leOeKTCe124dSLiK3ZYOKg3Q7P72HDYcJ6IZ07AvEQUvjA731Hl8QEMGU3egu+VFHI
 +vPMS/2qRmIBoqp6rhj8XlbLqzyW7QoOokmZylHrnKLr2RNAmi848fy
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162152_159464_9A3AE494 
X-CRM114-Status: GOOD (  16.93  )
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

The error handling after 'err_put_child' has been moved to the only goto
that jumps to it (second device_for_each_child_node()), and the call to
fwnode_handle_put() has been removed accordingly.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-sun50i-a100.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-sun50i-a100.c
index 4c468d487486..03f1b6424692 100644
--- a/drivers/leds/leds-sun50i-a100.c
+++ b/drivers/leds/leds-sun50i-a100.c
@@ -392,7 +392,6 @@ static int sun50i_a100_ledc_probe(struct platform_device *pdev)
 	struct sun50i_a100_ledc_led *led;
 	struct device *dev = &pdev->dev;
 	struct sun50i_a100_ledc *priv;
-	struct fwnode_handle *child;
 	struct resource *mem;
 	u32 max_addr = 0;
 	u32 num_leds = 0;
@@ -402,21 +401,17 @@ static int sun50i_a100_ledc_probe(struct platform_device *pdev)
 	 * The maximum LED address must be known in sun50i_a100_ledc_resume() before
 	 * class device registration, so parse and validate the subnodes up front.
 	 */
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		u32 addr, color;
 
 		ret = fwnode_property_read_u32(child, "reg", &addr);
-		if (ret || addr >= LEDC_MAX_LEDS) {
-			fwnode_handle_put(child);
+		if (ret || addr >= LEDC_MAX_LEDS)
 			return dev_err_probe(dev, -EINVAL, "'reg' must be between 0 and %d\n",
 					     LEDC_MAX_LEDS - 1);
-		}
 
 		ret = fwnode_property_read_u32(child, "color", &color);
-		if (ret || color != LED_COLOR_ID_RGB) {
-			fwnode_handle_put(child);
+		if (ret || color != LED_COLOR_ID_RGB)
 			return dev_err_probe(dev, -EINVAL, "'color' must be LED_COLOR_ID_RGB\n");
-		}
 
 		max_addr = max(max_addr, addr);
 		num_leds++;
@@ -502,7 +497,7 @@ static int sun50i_a100_ledc_probe(struct platform_device *pdev)
 		return ret;
 
 	led = priv->leds;
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_classdev *cdev;
 
 		/* The node was already validated above. */
@@ -527,7 +522,11 @@ static int sun50i_a100_ledc_probe(struct platform_device *pdev)
 		ret = led_classdev_multicolor_register_ext(dev, &led->mc_cdev, &init_data);
 		if (ret) {
 			dev_err_probe(dev, ret, "Failed to register multicolor LED %u", led->addr);
-			goto err_put_child;
+			while (led-- > priv->leds)
+				led_classdev_multicolor_unregister(&led->mc_cdev);
+			sun50i_a100_ledc_suspend(&pdev->dev);
+
+			return ret;
 		}
 
 		led++;
@@ -536,14 +535,6 @@ static int sun50i_a100_ledc_probe(struct platform_device *pdev)
 	dev_info(dev, "Registered %u LEDs\n", num_leds);
 
 	return 0;
-
-err_put_child:
-	fwnode_handle_put(child);
-	while (led-- > priv->leds)
-		led_classdev_multicolor_unregister(&led->mc_cdev);
-	sun50i_a100_ledc_suspend(&pdev->dev);
-
-	return ret;
 }
 
 static void sun50i_a100_ledc_remove(struct platform_device *pdev)

-- 
2.43.0



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E938CEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQNsFzUPUUPsb4bHTQ95hMBvvP4G234MZae0hcpLMbY=; b=cEXtF6keOI16S6KnRgGEFdq6LV
	ZIOpMc8D9kSXygRrhgVqbytAxZZv2CZuSX6/Ncg2HB1zHDELYqiWv9v51bFRGcLPy6AZolQnmLgT3
	agTC37Ao08fKPr0MoPQdaV9F1l1dkQXLW0tzx++W/6w1BIrQ7XocHVz11W5hhewzSlZBgERBqgRFx
	up4p8jJzVHh0vL86gEfyWEs98Egia7NN+xQhD5lLW85ocGVNC+6Lr4ufDiV8cDbrrmd+nDSUDiO8+
	028XNTfc+fHNikz30deTP6xb6XMCxWfBD+xpaDMFmpfq7fE+AAQPsUzeyaLP64JOYKWBXvlAqBRiA
	r5mdzqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sty0A-00000009bEj-1fr3;
	Thu, 26 Sep 2024 23:34:26 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnm-00000009Z06-1YcB;
	Thu, 26 Sep 2024 23:21:40 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a8d60e23b33so205020866b.0;
        Thu, 26 Sep 2024 16:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392896; x=1727997696; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQNsFzUPUUPsb4bHTQ95hMBvvP4G234MZae0hcpLMbY=;
        b=k7NXlvgxmpn7jF+xPR7cjO5uOIyCIG3qAYY+8QCjI+aQKAjp5RaOxgWDTLtJf05acK
         V92klloBU8o2EyJ/YyT6vgjWr1iD1r+ieqm/G8Bxp4QRfUHEprLqSFBzlarPHbRJeIb4
         pEB5uxxsMVNyzZD87nLVn4DllwVqz8/K+dwfslhaPYLqkRWc90Tj4drvGrox7hV4WL1r
         O5EOi8RiVppY0kzYxV2yq+3WX1D+lYdkcEZXmGeRKgPcTDRSi9oiG/RJFGey/N812r5F
         WYXC3lTLbpHpIj+GMQHnZtecv2cR4COu7ej9ue9bJgt6PcaGUyBRGKMfEKMaDwfNeUTr
         YufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392896; x=1727997696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQNsFzUPUUPsb4bHTQ95hMBvvP4G234MZae0hcpLMbY=;
        b=iLPHVgXoA2+M9lmW5TFXC/D+IZzR429IdE4iw6tuqzBFf1D/W7A7zdj5/hJk/SJ5ON
         mBmj9D6dg938G55BBOBYJpGZp2pBlvBV4F0hG7ERF7+EVt26iFPIf3KPXBW5QgUKtV1q
         Lv+iTdmCVk/4IOECgjg72LWaUnxvoMVcfepPx2AP1qMydCV5aVq4we1IC6uBhKW64rSY
         Mk0AaJMGRTg5fEXcNuKePiKyKLRFD+ev/aPzU1fU2bAkqx8rJzSDvwk92j94d/GHtyY7
         XPfKQYs+e5nxBg+iso3Dtbnx01vAEWSvPddDZD5qzAj+EbhW1lWXgC2pQxHmGW4C6B+J
         yQFA==
X-Forwarded-Encrypted: i=1; AJvYcCUSKpOcSxIawsEjFi+jyvjUu+8KEh2LOpYeQVsKQ2XoFsRgrCn81L0MMQ7us4XkxESP+zKCYX8nGBVEw6x/XG4=@lists.infradead.org, AJvYcCXaBX6FOi3kmbY3dAn3Be9qd1iloUiloFDXn6934K9tujt8jGPkLLlRvtjGzRtoFchX7w9haK7Ogz90QQNQc6dt@lists.infradead.org
X-Gm-Message-State: AOJu0YzZd2XYq12BsMuOhWlnlqwhJbLJOvKGBWYJCdgD6J0XAmXYnMMg
	z3++DnV/y33LdUAAxlybDJemdiYuxaFUUijy1E1KR1NbPMRI2i2DVAc2C5Gl
X-Google-Smtp-Source: AGHT+IEyOGNZ71T4Vzvgj3bKvi7dihBSn/dSInDBzZVsM1XUQPQ44OJgPDcuSpfwKzM4zpJDbvxA3w==
X-Received: by 2002:a17:906:794c:b0:a8c:d6a3:d03a with SMTP id a640c23a62f3a-a93c491f3b2mr103908966b.21.1727392896321;
        Thu, 26 Sep 2024 16:21:36 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:35 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:00 +0200
Subject: [PATCH 09/18] leds: lm3697: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-9-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=2273;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=fs0ieuWlVTuCmcLPVCaC9tRU1u41+9gEsw3Vo/oP6MU=;
 b=W7PpV2kxni+RR0wy6YwJI0c2sUNCxXu+i08YXpIMr6XkyMRvsaXGdZ2iuGj13YAu0Wxs7NeRP
 b7bgPKb5Zo6AJcco0ow/T7yOT/DNC6kxjWbdvRLSxzKncZ93rGydqGU
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162138_449632_5C893AB5 
X-CRM114-Status: GOOD (  14.06  )
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
 drivers/leds/leds-lm3697.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 99de2a331727..7ad232780a31 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -202,7 +202,6 @@ static int lm3697_init(struct lm3697 *priv)
 
 static int lm3697_probe_dt(struct lm3697 *priv)
 {
-	struct fwnode_handle *child = NULL;
 	struct device *dev = priv->dev;
 	struct lm3697_led *led;
 	int ret = -EINVAL;
@@ -220,19 +219,18 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 	if (IS_ERR(priv->regulator))
 		priv->regulator = NULL;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_init_data init_data = {};
 
 		ret = fwnode_property_read_u32(child, "reg", &control_bank);
 		if (ret) {
 			dev_err(dev, "reg property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		if (control_bank > LM3697_CONTROL_B) {
 			dev_err(dev, "reg property is invalid\n");
-			ret = -EINVAL;
-			goto child_out;
+			return -EINVAL;
 		}
 
 		led = &priv->leds[i];
@@ -262,7 +260,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 						    led->num_leds);
 		if (ret) {
 			dev_err(dev, "led-sources property missing\n");
-			goto child_out;
+			return ret;
 		}
 
 		for (j = 0; j < led->num_leds; j++)
@@ -286,17 +284,13 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 						     &init_data);
 		if (ret) {
 			dev_err(dev, "led register err: %d\n", ret);
-			goto child_out;
+			return ret;
 		}
 
 		i++;
 	}
 
-	return ret;
-
-child_out:
-	fwnode_handle_put(child);
-	return ret;
+	return 0;
 }
 
 static int lm3697_probe(struct i2c_client *client)

-- 
2.43.0



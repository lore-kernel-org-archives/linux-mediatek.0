Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426E6CEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsf1H9vGvMDgxqrrd3JfvSIa5200NszB5Zt97OWrjd0=; b=asRqO2f7Ko9j+DZMN82uZwfiy7
	dsEVC5yFg7mJCTSnuD/o9bqqtQK3vCJdMSwoY22Ab5d2ZFfpnXmCo3OSHeHenJsRDRv3Cdn0Lknel
	50D3zzmoCIGBj5nnTx8cSDENI7ufMXgb6RwdRMeoQjFi2P3WJUdsudeKdq8T0mdbXi7svfW41uiBo
	V7rTwey+J+LK9Rzqa/DhClRI4pZNyMBbS2dKW7ewQy0R12PKrvYL1rG/tsruIklDZI/omB8uf7jvg
	5r7B7cHoGOSpTGeROOIazH+Ixc5OjVl5WaQ/k8ULvtS8ZfyrnDgo0VBuBVD308YbmYDJu61Hj11D5
	L3EzcV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1styAa-00000009dE9-0d1I;
	Thu, 26 Sep 2024 23:45:12 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxo8-00000009Z8L-0NXB;
	Thu, 26 Sep 2024 23:22:02 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a8d56155f51so176274366b.2;
        Thu, 26 Sep 2024 16:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392917; x=1727997717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsf1H9vGvMDgxqrrd3JfvSIa5200NszB5Zt97OWrjd0=;
        b=CPXuCbWsn2nEo2ZjsFtcUhUMBkJZAG5pP5xYEgnB/DVlyRsglOyFCp6HjRGelV2ab7
         unELuE2eyPQ9Jgc9LEHE2e/IrMkt493kNoWESysJg4gRfYfrKKH4fe3EjtbJ/7+9T5mP
         Q9BpX5sRRNyjF7xELtDpPfEal3EmXXxZ6+WN1kUztQdLfSWHX92OI/2tDVWAKUIRoQmH
         WpSd0OzJ7Isa2eIPbHM+K42TIC0rAYNPgtGDnmgmyd85OR8Npwr8JJ8bZAG2K6X3DsDW
         yQtc2Rm10zmMdEWkBbi9qtWbY6Q4sf8qHlLGeUku/twOVmkX6xa/sky+Q5Pf+ViM34qW
         P/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392917; x=1727997717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsf1H9vGvMDgxqrrd3JfvSIa5200NszB5Zt97OWrjd0=;
        b=AVX8HspeyPHu6x5ObJ5UEE7FDGDCcAwltlcZ88N5YuxJOSqSdPuprQYwT5wGGQeuuA
         7RcvSabJiUdrnSKMpctceGLFBqFF695kSLuZgFgPsQmBsZbt7tcRtTDuIbJdjlVYaIY/
         0cGFVJrNfaCaGIL0iYePRABwWTCmW+D4OJLSSqGM81qMEjpmdg3Rq29X/XXytcsw39wI
         lC/ZxBGImHLz67Pmrm04GbsAyan9xmK9J51oaLVSPIvKHnmtJsm+Z+nTcmvS33M/gzK7
         YWIc9qkGf2HobQ7q/vgtSWwt5iSvqvi2UdsXYi+K4ST6KsQXciQeLI5Wcy+XzjrDJWmG
         nnzg==
X-Forwarded-Encrypted: i=1; AJvYcCUPHW3pfeCQ4DXXz1A10G/m66ifV2n3Vw4LDnV6deKOO3efAfFn9FWp8BDFZU8lngsiyr7KxT7kUtxzT0GhUwS5@lists.infradead.org, AJvYcCWnf2I5ozWR7APzrw5r/tdRH51HkByFRs/VFpO9ytDWwiEOWTozKHpRFu3/2BwdrmwOGWUmzRvrvkt66sl6aeE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvOg08aT3kxZGkNbJS8nmq4Jxc47MoE+2vb9b02RRF+IrN3B4a
	/jN1j63Z1MGNr7J+p9ldapJCqK6YMa5uAF7N/dxgzbKKTrrtppYp5nj6DAEU
X-Google-Smtp-Source: AGHT+IFFYGWgxNe3W6HVZ9vKaXN55rWL1eirSET5THcsDSbxqgt+Ehox2JsTuD01KAWPP5hH/gwWVw==
X-Received: by 2002:a17:907:320d:b0:a8d:128a:cc23 with SMTP id a640c23a62f3a-a93c4c2d809mr96338766b.59.1727392917484;
        Thu, 26 Sep 2024 16:21:57 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:57 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:09 +0200
Subject: [PATCH 18/18] leds: rgb: mt6370: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-18-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=3209;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=PSVqt2hzPQNutXFJ1ySerbu1QMLwioqVyiO4z6jxrQ8=;
 b=CwV0EpzUvZAO2Xr3Lvw35f2AWkJgxILgyeJ44eQr3MbK8h5/RqojjHPTG/zr0owvVEhgiQYxU
 1I/cZWn0KknD6O57SSfoyl0TPR+QYf61STH2RPg5oIKED+kOJG42L2i
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162200_176163_C62F2DE2 
X-CRM114-Status: GOOD (  18.44  )
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
jump to 'fwnode_release', as an immediate return is possible. Given that
the loop is called in the probe function, and it already uses
dev_err_probe(), the common "dev_err() + return" has been updated as
well.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/rgb/leds-mt6370-rgb.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
index 359ef00498b4..fe76e8e27f9c 100644
--- a/drivers/leds/rgb/leds-mt6370-rgb.c
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -905,7 +905,6 @@ static int mt6370_leds_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mt6370_priv *priv;
-	struct fwnode_handle *child;
 	size_t count;
 	unsigned int i = 0;
 	int ret;
@@ -936,37 +935,27 @@ static int mt6370_leds_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to allocate regmap field\n");
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct mt6370_led *led = priv->leds + i++;
 		struct led_init_data init_data = { .fwnode = child };
 		u32 reg, color;
 
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret) {
-			dev_err(dev, "Failed to parse reg property\n");
-			goto fwnode_release;
-		}
+		if (ret)
+			dev_err_probe(dev, ret, "Failed to parse reg property\n");
 
-		if (reg >= MT6370_MAX_LEDS) {
-			ret = -EINVAL;
-			dev_err(dev, "Error reg property number\n");
-			goto fwnode_release;
-		}
+		if (reg >= MT6370_MAX_LEDS)
+			return dev_err_probe(dev, -EINVAL, "Error reg property number\n");
 
 		ret = fwnode_property_read_u32(child, "color", &color);
-		if (ret) {
-			dev_err(dev, "Failed to parse color property\n");
-			goto fwnode_release;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to parse color property\n");
 
 		if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
 			reg = MT6370_VIRTUAL_MULTICOLOR;
 
-		if (priv->leds_active & BIT(reg)) {
-			ret = -EINVAL;
-			dev_err(dev, "Duplicate reg property\n");
-			goto fwnode_release;
-		}
+		if (priv->leds_active & BIT(reg))
+			return dev_err_probe(dev, -EINVAL, "Duplicate reg property\n");
 
 		priv->leds_active |= BIT(reg);
 
@@ -975,18 +964,14 @@ static int mt6370_leds_probe(struct platform_device *pdev)
 
 		ret = mt6370_init_led_properties(dev, led, &init_data);
 		if (ret)
-			goto fwnode_release;
+			return ret;
 
 		ret = mt6370_led_register(dev, led, &init_data);
 		if (ret)
-			goto fwnode_release;
+			return ret;
 	}
 
 	return 0;
-
-fwnode_release:
-	fwnode_handle_put(child);
-	return ret;
 }
 
 static const struct of_device_id mt6370_rgbled_device_table[] = {

-- 
2.43.0



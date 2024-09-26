Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A1BCEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJpECgac0QWqDyY0V1N/RenFz/N/de4tQaF+Hl64Xww=; b=2rtmMUxlmJf2XNuv9roiKbSrVB
	3KozTVH96xtO5R9XmAbMURm3UQPYbwIkYuQ7urMyDFF5yllvP2vutS+HmU2sA6CArh4P8PS5uwrjk
	xBfqvc0quTFCWduVNWQrwAlZCa6+8YVAY4cKeWE1Sk2Y94caXNzL5X98GxD5AfYW1FLYnmzH7kn6j
	Im4FewKzTfykFb7KZ2mz7FPaTZtkpKcB3yMXG3AYlDfpCOwCpD3O7pWvqh5VU0objT506Z6M5C2wM
	elhds9jHaqVMtzVb+l4O8ckFBRJeMQ/qTAIGZMnztCGJ1oxOl1AOtoeA+PGivJhi+IVChZ2wVzlF7
	8Pki/oiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stxwj-00000009anP-1wdq;
	Thu, 26 Sep 2024 23:30:53 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnh-00000009Yx2-2RRE;
	Thu, 26 Sep 2024 23:21:35 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a86e9db75b9so235046866b.1;
        Thu, 26 Sep 2024 16:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392891; x=1727997691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJpECgac0QWqDyY0V1N/RenFz/N/de4tQaF+Hl64Xww=;
        b=ktmcMetnYjdmlL3fnRWXwAMExh8exKqKuSLuJIxTwAYjBEWlUjUrlKW171K3pkguP/
         BZRVVPlkmcZjItVw+fO3KlFiL877gWw2fccMyZBSjkJxeBUtLNEay3r2ZWhy7mv4KXoB
         iR+2/ILFeOvehct/4o6tyU6zm8cu1PQosJsYRB2zW1h9CUeCrVuY6uwZqKywiV+Ot73E
         KU/8Z40FNdtdKfi67k7t0/fk50aVQnIG06ezv7guGL24HdgxpbYKxtLP+JeabZlfhuA+
         VaSH1H9JVqVHeAyDzvFl/KS+feJlPMz841+2BrQ9ZMmjqGjDuYaNJEnDIrPAjcgyOm+K
         tipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392891; x=1727997691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJpECgac0QWqDyY0V1N/RenFz/N/de4tQaF+Hl64Xww=;
        b=fH35FhnbmFM295Il8lCywpIpRjW/pAO3ccZ2C75A//6eY5tjB+4PnQY4AorryWXGWL
         RQNam3lCLUbPHu502tE3XypcKqSEqJGo32BAwJECO6YyzXGqgfyoT+Wf9J1YY8TaRI5b
         aYvFaVTrQr24Wn+Pk7NK2b2XdDiDY1265GgQg8rq3sGYdJI4cXfAZist65vOLy5gYGS6
         aZrzy4vG/maL7376pPiOfLvodOWcmorUt06N79JDZKXUauNwyLT7uydIU+Q6v/6a+ksp
         duIpaUdU9mbr9+NHQppRyGtdoH55NRjDMVmO2/V0rRHSdJVKCmpZFmxJUc+2KWE9fFWg
         nY4w==
X-Forwarded-Encrypted: i=1; AJvYcCUVmk2MAIqkmmlXb3gWm2u/Ake8LHAS1i49cKvKddDyBF2yNASyg2JsDmEaAzJu/Cx11Zhp8G52vzPP5Hih9d0=@lists.infradead.org, AJvYcCUcX6puxe3Khn13X9zdH9Ru410hO2rdCAEjtEbpE51ms8+RU3TZZG713/vkWcwwJbbm8IFQdAy0LVr7C3Ry/gWX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8ZfAUhzthYMduYFFA15/Mdbc6uSJZbI9THgA6RhiA7BSzDvSy
	iS88tN0S+27fdsa4Vqqz9zOExBQFY29SmrhYgGUMwtvXxxIOTGREHPbCSpQA
X-Google-Smtp-Source: AGHT+IGSWoR1fCEWrIDtr8bTLXKGUTs29eDV3zKtmwo1hMD14zDFeQuF3IPtFA71mpm1QVUnbVuMZA==
X-Received: by 2002:a17:907:2681:b0:a7a:ab8a:38f with SMTP id a640c23a62f3a-a93c4a67dcamr84483466b.41.1727392891222;
        Thu, 26 Sep 2024 16:21:31 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:30 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:57 +0200
Subject: [PATCH 06/18] leds: el15203000: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-6-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1939;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=V8haQmgnRaMTwlG5K1E7vGaVHwPa1IZaQXMfy8Pe7ck=;
 b=sTqeCbZp2AB1Bc5Bt7/iASwDkXreNOXxX6b+ivRKl7l5AcLYxvapJeVNieVkPiZPuXREO5n0U
 8lb5CaGQyzlD8lCR4pv1xcQkTYZrQwZmlV1zDdjGoSHCfLUUuJ9Nwts
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162133_682116_1DEE431F 
X-CRM114-Status: GOOD (  12.96  )
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
 drivers/leds/leds-el15203000.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index d40194a3029f..e26d1654bd0d 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -237,22 +237,20 @@ static int el15203000_pattern_clear(struct led_classdev *ldev)
 static int el15203000_probe_dt(struct el15203000 *priv)
 {
 	struct el15203000_led	*led = priv->leds;
-	struct fwnode_handle	*child;
 	int			ret;
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node_scoped(priv->dev, child) {
 		struct led_init_data init_data = {};
 
 		ret = fwnode_property_read_u32(child, "reg", &led->reg);
 		if (ret) {
 			dev_err(priv->dev, "LED without ID number");
-			goto err_child_out;
+			return ret;
 		}
 
 		if (led->reg > U8_MAX) {
 			dev_err(priv->dev, "LED value %d is invalid", led->reg);
-			ret = -EINVAL;
-			goto err_child_out;
+			return -EINVAL;
 		}
 
 		led->priv			  = priv;
@@ -274,17 +272,13 @@ static int el15203000_probe_dt(struct el15203000 *priv)
 			dev_err(priv->dev,
 				"failed to register LED device %s, err %d",
 				led->ldev.name, ret);
-			goto err_child_out;
+			return ret;
 		}
 
 		led++;
 	}
 
 	return 0;
-
-err_child_out:
-	fwnode_handle_put(child);
-	return ret;
 }
 
 static int el15203000_probe(struct spi_device *spi)

-- 
2.43.0



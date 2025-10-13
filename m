Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C0CCCD190
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQZvCnP1P0SuqiqaQUtwVRm3JfcVlv6UnYBLGV8/TWE=; b=JSnXxP3UcR+ult9gkuB4RS9f2X
	40EaJIdP64xLBSLZ1bY3bXnbW152zTleisW/tsvnBTCAsfO3XoU1oGRcrKkWbb6DSmmqkFJzcugMX
	A3AYXufKpdHmUeORdIyvQny4tnVjVgkVV9gBClP+58k4YfHJy/XyH/mdDHDikA52OFKYJK1dhoTN/
	+YAJzRgjBA9/JjPUq8xqAiAe1xRMm1R+4HLUd3n9uHt87bgKxD6oL4bG5AU4sIigl+BDosa+esYmG
	ORRld76Pw6A0Arr4NrZkXhlMOpYobij4pPPWrZWp0C29VirbwU+lqyc85Rx3fzD5rZ/m9Ppd3Qoie
	Aroo3/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKi-0000000DLTn-1zqv;
	Mon, 13 Oct 2025 14:15:28 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKI-0000000DKis-3jkW
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:05 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390347e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364901; x=1760969701; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQZvCnP1P0SuqiqaQUtwVRm3JfcVlv6UnYBLGV8/TWE=;
        b=jwImHgz9qaWMQGuRzXN9UewwMuD7gS/UvYBUMcbxJY5bYjB+b2rsB9jpG0gKuOQA7H
         Lb2SpEkv7EgkiWusbLZCCjpN0by89k4YYj3ruWcbWEsdRFOkAy8+YAVnOATTnPY+BvOh
         C0ea9kbQojgqnCl4VW/ECZHdj6qemcoAluNmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364901; x=1760969701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQZvCnP1P0SuqiqaQUtwVRm3JfcVlv6UnYBLGV8/TWE=;
        b=E/UCZg8nVMJO/4/X0TD9p9vDx9E3T4CeB5q15p0JyngQ6rvOpkmISnBZC1HzIzZtDO
         ajrICiw6oc1z7EacGKhyHKqgeBctpgH9QJIY3/tesIefMWmebtDOj78BdlNXSS4IEx2x
         U8GnnVb6ocm2gqdfzXrAXgugExCuaAz6gbTwJoq/eg6mj9JuaoYIIgjcYstAmGgxdPPE
         GJ7amCQek3CcNyrBpGDNKMXrKPXhZZM6PFyKTgrP2YTJ2swJdWQLWk9qwoDUHeE5gNgY
         /rMVy2iCk42Bt9RhOp9Kmm0iuUHsAHcvGOD4h2Tw55V+i5oivSncEAOK0eUszypbyotu
         fXaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/tznHHGqd2uD9fUFx+Fc6B2GHwlaAFuVfATOm2QCj0FSqZ3UBBdvHKE0TZYXu3NZ4znc3dca9uKzCuv+dgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyU+1Ada12Kp3SeZ8ji/HpPsLWnoCzSe4OwEfBzpAEt56ugbVMD
	vlRbxF094FzlcOgBvsVKzAzWrxLW3ev3JwhZVLpFHGt81sQQcONpWe6g3QIOZRl5DA==
X-Gm-Gg: ASbGncteJj9WFR41ffm3D5BPFkVyZZAdWzBuS5ROajItkTtDUhW/nu76EWmlLBENh5G
	lCU8N/czOsrSj3SHn8H07pM+0GQYaz9uFtc9i68K79gHsB4NUwsOQ9pTQ12gOCnH6ArsEsGRyP7
	Po4SiTeFf7Cqe43lZildjgFZl6syVRs2vhl+FiiNRj4sysdxzQXX1MiAh24QnNQvKoxdDw9nHzE
	fCZ3cojAtP6FSLFqx7nwVReMHfjRBm/L9PC2BYm2tUI5TZGyreJiB2+9dhTRfpBlvJ1TgjN3zrf
	3VvzhDE+eUjnLlRZjEJeO2Py8P/TAvLDXXtTjjH/tymS9QvmVdmrU6352ifuI5ObQUDIBbpmMDJ
	e5GgrEL0DfW7vuUbG0WNHf4eYeSaGUyqaIftsHhbp0S9O4Lb+0rQZRuSLL2/RyUrtLu6Z6LzOSP
	KDLnGnjZyDt5D1WaZVLk6E8wH2e0DL
X-Google-Smtp-Source: AGHT+IHp8qUEbZiZFjcq8gL768jxh7/txPc1OJzdAQ1KXrMavPh6zmcAuzYCqI5NGEMHZ2sFOcmEXw==
X-Received: by 2002:a05:6512:a90:b0:55f:6759:a792 with SMTP id 2adb3069b0e04-5906d8ed836mr5438343e87.34.1760364900643;
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:59 +0000
Subject: [PATCH 19/32] media: rj54n1cb0c: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-19-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_071503_013512_526E69CE 
X-CRM114-Status: GOOD (  11.80  )
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

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR().

This patch fixes this cocci report:
./i2c/rj54n1cb0c.c:1361:4-11: WARNING: Consider using %pe to print PTR_ERR()
./i2c/rj54n1cb0c.c:1370:4-11: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/rj54n1cb0c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index 6dfc912168510fb1bd308f834911f9de705844b7..e95342d706c39a853e8c18de1ce447a5fa508565 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -1357,8 +1357,8 @@ static int rj54n1_probe(struct i2c_client *client)
 	rj54n1->pwup_gpio = gpiod_get_optional(&client->dev, "powerup",
 					       GPIOD_OUT_LOW);
 	if (IS_ERR(rj54n1->pwup_gpio)) {
-		dev_info(&client->dev, "Unable to get GPIO \"powerup\": %ld\n",
-			 PTR_ERR(rj54n1->pwup_gpio));
+		dev_info(&client->dev, "Unable to get GPIO \"powerup\": %pe\n",
+			 rj54n1->pwup_gpio);
 		ret = PTR_ERR(rj54n1->pwup_gpio);
 		goto err_clk_put;
 	}
@@ -1366,8 +1366,8 @@ static int rj54n1_probe(struct i2c_client *client)
 	rj54n1->enable_gpio = gpiod_get_optional(&client->dev, "enable",
 						 GPIOD_OUT_LOW);
 	if (IS_ERR(rj54n1->enable_gpio)) {
-		dev_info(&client->dev, "Unable to get GPIO \"enable\": %ld\n",
-			 PTR_ERR(rj54n1->enable_gpio));
+		dev_info(&client->dev, "Unable to get GPIO \"enable\": %pe\n",
+			 rj54n1->enable_gpio);
 		ret = PTR_ERR(rj54n1->enable_gpio);
 		goto err_gpio_put;
 	}

-- 
2.51.0.760.g7b8bcc2412-goog



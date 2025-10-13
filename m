Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550F6CCD18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+HlSqes1yCsLkQoWVAYYhek4ZxMIKlt6Lo2LEEYk1o=; b=IOcOTUgHwoNldRaMgisVwS1hDc
	XGfDkVAOTa7+e0uSUJdD1+XhGBmXwkWEX5trzWDPg/xu7bHrOZxgIWjNUDQyJOHjSr++tubllOxfR
	6GdkEwEFl9mm/EZrnje7rLzK32UK36sVrZxlyf1SlQ9kjGCh2jRcKe7ZXMSQMWzA95eJpfckvh8pT
	BNcqUoQQ+efIVL2jY1n4kcP6KpWb9Hi1PnFgTrMvZfwNPXNrYyxV3IlHrXEIbtI/ElN3i4QAhD4Ki
	XllfrvaBxR/TsM0H3hkuz0yW8wEdJ7cR28jevxio9gnTN0swuUfQXjfgV5/1Hd/wLKBU62v/cWh5D
	qlxjLebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKs-0000000DLlu-0fJ2;
	Mon, 13 Oct 2025 14:15:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKO-0000000DKuQ-2uSU
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=U+HlSqes1yCsLkQoWVAYYhek4ZxMIKlt6Lo2LEEYk1o=; b=LPkKZOhPZHwJZZ/mnLqXphqgyZ
	6LGNZMlbKLCPzdSkS7jYyMlJWvgSgnTqepwcVillbfrXJ9DI9YJ7ssf3mtwXus1DgzMf3ND8U1/OU
	OJuEUdsX+fzYLhMsTMtH4FUgcDckdrfgQl+LJiJjX9opIMtEMrxYZf6U13jze2cyHbGl2kinCPI7i
	ZmQ7K5V1RnCOqzCFv5/bTveuWeR4DJUohkY6poGhmlR5e3XJRhPclOvnxz9ByaP6X97mZRiJoWUrG
	kGIhOwmBFgWPf3Lvcm4NrL51gxny9uWEexyH6vx1RcPzCkh5CtlBfT3/ELZSKzfL3yQfMoLOhFMP5
	m9ZXwA6Q==;
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKF-00000004N4u-2xeu
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:07 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5797c8612b4so5253071e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364898; x=1760969698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+HlSqes1yCsLkQoWVAYYhek4ZxMIKlt6Lo2LEEYk1o=;
        b=hsNrwhW50gAldxmMQTJVlIKHdMSIeAFgNQmbWXDRPmBlCTvlWFnphfuVR0eR1T3Iu9
         qf7HSYcWwe517aegEEyn3zl/zoVzsjV2VR4T63puvyjwa/P8IjgSEO2RBCs8INCjuwo3
         VFx0xj4oivZvREiWcTtj4IBocyWo7B4YnyqK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364898; x=1760969698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+HlSqes1yCsLkQoWVAYYhek4ZxMIKlt6Lo2LEEYk1o=;
        b=JJWMeEO8LMK2Y2quTWgB6GOyrFq33M+8jOdITe+UMGVwjUyXqUVYgpbc3CQ3VCmAEI
         4E0Sfm+u2xlytSymX/0hfPPvGfYu8EQK89TjvFzFPoBpgVpHqkwy1rl6s5yj+7+CHzFZ
         QbS1OMsWPsVdY3/DK4opTSkIKdT8ly77HgI+HWBxEtRu2abhbmkXqeYvNWBECq+gx3kH
         2essaT4p8lsk8pRFX6Ys8oIGmP3JTJmw3UgDJt1LPf2Dlbjr3Kd0QRKN3FvuDFd9fMp5
         JXFxbIW8oDU4e/ncNlpNGs9L+UrfllZa8/WoOM4GhwogybBhyR8nQwlLKarYUsCph9cy
         5TYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI5CM6j9EihSPYQRCp1oA4MVNrbM6gKsXnMv+mlJtnB+0leXELyvQUUOrn3HriVvNvTNNYnUwNyuOmS4oFgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywoa5eSWCQLFozwBYMs3oUtM3x5+B613oo5zIpYqGPs3vYaodKK
	ZEm14vjPgnNeXdAzij9MA7Rk4n3LXi+DaLA78L+viQvot/HYuBTVUJbtfeRTEFQ9eg==
X-Gm-Gg: ASbGnctMuxPy7nOgqU33Cr0Bax6Or5F3ksP4RAGH88pGcnuQ3pBKxKGCb1+KWi/13Br
	H73Y/XwHsXe8wUShAcAKhG6cBl4JkIdv+R9Mz8R3k2Piv2qSv0NumHOpKmBN0bJHjgbhjcIE2Eg
	V6aJ25zITyt2ioVuXOM7R3M2loJfGpo5Dds5XSysvYgx4fi88ajyVVfR7FruIoBHLGhmCpD1L0S
	6ex1fPPqggccFfO11oY0rvJhyirv3ATXz9GvXDXV6QWPG9benARalEo9PNqO6c0l+IC0tbOwNAd
	qLQKjt7ys7+O9+R/BTmp148DiK+px1UnPv6IueIY7BfXR5an0A1hIdsmeWdj17OqIUTzlFSR1z8
	kMbtcGV1dwzeceLkJnkkvU/TeTO0CdityE7wDFZQqgWNw3B+Dk37OCHFEb9OEzubD59Y0o2Qj1m
	K4H7SRjqyzr7qHnhok7A==
X-Google-Smtp-Source: AGHT+IH27CfYjloqEXA5bxWZfYaU4LA1SVwbUAxn03k9AIO/MXhXvYZJr7Cls4Tsp0u6mygHRedkXg==
X-Received: by 2002:a05:6512:3d94:b0:579:d89:20c7 with SMTP id 2adb3069b0e04-5906d896e12mr6073927e87.9.1760364898078;
        Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:54 +0000
Subject: [PATCH 14/32] media: i2c: mt9m111: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-14-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151500_045554_07F12D4D 
X-CRM114-Status: GOOD (  12.41  )
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
./i2c/mt9m111.c:1290:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/mt9m111.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 05dcf37c6f013b1cefb5d85f893af08f4533c7b4..3532c7c38becc21df88957f8f323c77033026a81 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1286,8 +1286,8 @@ static int mt9m111_probe(struct i2c_client *client)
 
 	mt9m111->regulator = devm_regulator_get(&client->dev, "vdd");
 	if (IS_ERR(mt9m111->regulator)) {
-		dev_err(&client->dev, "regulator not found: %ld\n",
-			PTR_ERR(mt9m111->regulator));
+		dev_err(&client->dev, "regulator not found: %pe\n",
+			mt9m111->regulator);
 		return PTR_ERR(mt9m111->regulator);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog



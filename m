Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45F0CCD18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d45bLyS6OUqH7RU6UEzRVYwiTiUKaQxVUhJVNzyYRQY=; b=wHIB4Liz2PeSIeqanmV2y21z6K
	BwIH8iKrqpmhe2M/orWYW3Z/Faq5HHrtaaG8nvNZf3ZVEJpdLsBQrCAy4l29dlxMC7W3Xe/qClV4g
	o2aZSru5Tzne8xuI8778nAEJqLOWmpYLpCJYrYZSJAec5YReGLSMS6Hfik5939MRLeZj8j0aBY/8b
	9yxOZFtU50LtBzgQE9+4F6OPns/+uSzk9qXSq5VSKw4L7QZYqXLZv+sLHqSiku9YkSkM2uKVpTU1N
	bXO6NCQSAcnmPMldbqLw70UbaKOrfudN6sBIUZfraV+/mnGF/8cU8OwBQ2ID5k8BUkHSOy9gEEFKs
	6Y2wHthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKb-0000000DLIp-3VOo;
	Mon, 13 Oct 2025 14:15:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKI-0000000DKj1-1yRG
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=d45bLyS6OUqH7RU6UEzRVYwiTiUKaQxVUhJVNzyYRQY=; b=HISsDvdUh49AKw3aDC5SLbW5HQ
	ZIv+DhIclsW7ktLa1uMkRjo/ZfhhI1XS8nhKFroaeNOyyGUpkLlXUwrricmD7l4WxhiN8X0j8HbTM
	5hJ51ZPRaaXD8+wy4cdnt2YhfEuCdkbQeO0AzXn0xdeLcd0b3Hdhd4SiQoGrsrg3joBv3l819mf81
	AAGn0ZuX+0nGNWr4vbya9npeG6DCK/bCVED795hY9hbRHln0kIp7YiaBkCLDUIYMNje7m6FMWaggg
	Qh27zsXnmGrAGjZdlWe9htPx6PZ7dPFMmXd2O/kCijDjNrl/6Km1VmdmxOpvUwKPUkWgII5KFBB0k
	y0Pa60RA==;
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKD-00000004N2d-0fI4
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:00 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-57a59124323so4619645e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364895; x=1760969695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d45bLyS6OUqH7RU6UEzRVYwiTiUKaQxVUhJVNzyYRQY=;
        b=JuW0222IyCqr69FxVM8O81pPta9Y75Tma4AlVeKZH5H4d02EB8ogloEM5pxI960ojL
         y4H/R/tO6pMy7TqEDZSuqHhTGeNYkomrPaFoT5ZhHJFhAJd61+G/F+2C9dXEQejyJBY4
         /FPWo29mYfu7+kOWUEQm6xC+T4StFbVV/aIC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364895; x=1760969695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d45bLyS6OUqH7RU6UEzRVYwiTiUKaQxVUhJVNzyYRQY=;
        b=I9WWOoEH3xW0qCTs3nMXm7yN8yPMX0MWOi4XJtzOt1s9ghAsTslN0yoH+wHiSkura/
         oxD9RSmxWKsOygYdupbNZUEYszZT0RZCh59ajzZRrnociTnCsDOsPo5ihkBhLHW+uWWt
         uYS6qHB3TWKyMHZZYiUSxv4Wg+ZbhQ3UYbfxnPpK51t9+ko9GOFD1n0I9+I9yrTRKpAu
         cJNDW7cI/QtXkQiEL9CMV03nhtbyoU4KTia942+e2XDPlJVXSlAnWYp2fjDPj/x0yysf
         /Rg8pymQmSU0DUn4i88dPREz9oJmsZ93A7QsrcWkGYwBoPfo+D/7u3BZOpvoJG2FH+q4
         pDgA==
X-Forwarded-Encrypted: i=1; AJvYcCW5lgIHSZcbPH8EtcRHsNZ1SIAZfi7ibXbMvjeJQ9O/UiSXay4P5eJFhMq05KL9PdbdBqRgZ0+q6tI7+MDV+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOWyjMaAnfliUbBLT6C2cuSnlCScwR5P4sHScaDinnNwv+96RS
	PkrmhDg6fVo1L3FKrgJa21t9uzS3GSLRZYaOtE9CqiuSqw9QArTwwotHFHXEIScbYA==
X-Gm-Gg: ASbGncuQNKjLy7djOxXRZFIVXgsIvgGUigiLaOobZIzmA96FtEAzjH9av2rIsyW/NRN
	6H64/UZWHPPeFWeEFt8xt+aXDk3yj8hxBpG5VA9kHseRb9rpSH2sibfQWlxyidhJ5xmhJ7oI5n5
	IRfE3OLxTAxFiYzEOVPhRm3wLjsJQu6yit9RHgytzv3UetmbTaAbnB4fxe6tA3J7PHUGPI/JgOB
	j3SC2RYWqp6jPD+Kzv+WB+he19aPfPS8F++aP4NJzCI0qNx9fXS2AU4A32ZF6fTjazhDCb4bFPY
	P2HIJvhZMWKJ5j5R6H6VQ8dSLSzxiAgFRcKHbwy7WitFsPITzyC+rj6HdswU8tS3x/8iRkiiUmp
	9zobdNTxl5nXaB5ZYYbx7bDTZKSfVad90U5XNWfRrba3Knpq7UcSFlfmqUCXGDfaFJ7APdWH2aS
	DE/+CeLw/W1Zy6Cyr5m3C6Z0ahFeXy
X-Google-Smtp-Source: AGHT+IHgHmnkM5LbjRZWE+rax/DE80YYaaKxmy85wL7to7vxyhdrC5Nac5EP5ziTh632ueTTsgzZbQ==
X-Received: by 2002:a05:6512:2388:b0:57a:6d7d:dd7b with SMTP id 2adb3069b0e04-5906d773bedmr6253929e87.8.1760364895143;
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:49 +0000
Subject: [PATCH 09/32] media: i2c: imx274: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-9-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151457_379887_6CF97883 
X-CRM114-Status: GOOD (  11.70  )
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
./i2c/imx274.c:2038:32-39: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/imx274.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index d86d08c29174584b26e109a7858542313219c19a..8ec78b60bea6d47d2088b8251b679224e0d34980 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -2034,8 +2034,7 @@ static int imx274_probe(struct i2c_client *client)
 	/* initialize regmap */
 	imx274->regmap = devm_regmap_init_i2c(client, &imx274_regmap_config);
 	if (IS_ERR(imx274->regmap)) {
-		dev_err(dev,
-			"regmap init failed: %ld\n", PTR_ERR(imx274->regmap));
+		dev_err(dev, "regmap init failed: %pe\n", imx274->regmap);
 		ret = -ENODEV;
 		goto err_regmap;
 	}

-- 
2.51.0.760.g7b8bcc2412-goog



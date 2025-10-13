Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41B5CCD18E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cw6YFePVdJ/w0HUJNx+YTiAEhWK3QpB9xmEBqnhTSDQ=; b=24pfyb3BAOTDdI3s4jceH3jfzd
	8lwohaI7TKasOvDp8YWdRU+lauzUbqjsH8JDJ72BdCGmF1b1vuoIy4gpD/fXpe39vxPQQE5t3hvow
	vV9oPovc91UprJKDz/mj7X6hvFfsrArTGvDxY+tndRIZsT2tB/61pw0hAM16wnFThe2WBNGLpWQdq
	6BgAIUlFar5aGMXXokGWXLOumywcgrMqMOH2nQSrCPKn47zyLKp101bfSmO9VSAFaICcCZOruuCsn
	cuG7GazBjsqzW4Sk4Z6RBZKt6WTSG5wcWdeJH3Hnx4WE3lAQPU2ltlPaB7PunxMkz4sR5qO6BgGy3
	IZPP6NJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKI-0000000DKkr-383q;
	Mon, 13 Oct 2025 14:15:02 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JK9-0000000DKUQ-3Z46
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:14:57 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-579363a4602so5034388e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364892; x=1760969692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw6YFePVdJ/w0HUJNx+YTiAEhWK3QpB9xmEBqnhTSDQ=;
        b=BsS9IpkuKCElB57i0Yv/KGwyK3FbHcpNU0yRvQFv1IRUp6ifXK1A7h5EPUYIfeBiYZ
         lwaLQ1nAHlcMsOgeSiHjn9HJ+4aGNlLTQFq/If2BysEQKhNrWF95sMB6POsEcwphqv1W
         4bjjS6CsE9NiSPSff5uEQF5liHDe+zWA1NL44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364892; x=1760969692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw6YFePVdJ/w0HUJNx+YTiAEhWK3QpB9xmEBqnhTSDQ=;
        b=Ob8SmRUxjCHVK6DQT1Dypy7NTWaaelGTVrR0QSd0TcdT3s9vukyGkNFhTPy6oCTcqP
         IlIndPxUIHOvHZplioB4BQRADGxbxWZPDcafLK7ErHwPXVx9MA35TYtxg/s5IzkYewBA
         u2U6Timfreqo9f6qP9Zft0A6nI6+kgs5Uh8BFwC28CmEoBM9mmIKNsCQRGsWVRpDS+LR
         01Tuw/NzHkfJitRzooe56ooylLxEFptUTSXTRl9ScT8O81GKRvZckT7eLJPSkEdkxXyN
         bsenH7pBmVK9utx7T2i6vV/BR26zHD76rAnvejcldgmwhBBR5Any6xe/s9/sN/7Bkzh6
         NbPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk5ncFQYhbQYZ0uZCa9PPEQM2/CD6zGBwz4CsNeT3G0PoZvqeZ3eiKtK3/1f9sW2Ty+4z03DfvlWpIWwg0yA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8ua6yhw92aNe8UwkGeuMAjVpLBU7+pWC7bfd2qQ4v9ZCddldo
	y7nGhwNWkJ0v5g5/+iQcsHWDNnXvG5yslUTRe1qSqWUci5o7HamFoGTMVbf8lQ8vag==
X-Gm-Gg: ASbGnctvv4B5f6ljGzjl0jfZdzFXOrzsz6nYwLC0WEfT3e6Kmiz534ABzWg3Zb5h5/l
	mFdy4+7HARomHtrAyxKRJ8DY8Eyx7hUfZFmf/MRHPCAn0kIqePQj5ccflKh6WVqt+GPiQrKhyAC
	tjtIoLvKLHTK4qi2+pYagNK/YoUQsQjLqKDr/66vWzSWPXldpHgDjEu6LZMkWB2c2NQvxsnD5WE
	Y57ciLBQ4SqYRpu1K9sev0zYAG9N0x0jNQHjfWLRIFK1j9DmB2OEgecoK/SO42Pzt4W9MesW8IK
	EeqUpwNnhfSAUQBEMmMxjFd/2Tq7aHFtHmT+sZy1R7XV6XobSnTJYn9Txz/Py6VtXR/IMUgyLhg
	hBpTqYws6ZVCJOX0B67AoRBehsM4BhyAYmGCXzEzvFEomlhlEp5GDJez3i4zJVbH/wKUZ0LBmqw
	IMvSfnY+SmMKYb2VkTHA==
X-Google-Smtp-Source: AGHT+IEKVe60oXFEuaV/5sAfkl2vR8IvNhsEsPje9O6F0QVcXOQ4CmYWAzNOjArzbT4yXoFh7KUNeA==
X-Received: by 2002:a05:6512:2309:b0:57a:baaa:394 with SMTP id 2adb3069b0e04-5906dd51898mr4676162e87.27.1760364891849;
        Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:43 +0000
Subject: [PATCH 03/32] media: mn88443x: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-3-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_071453_896825_21F35D3A 
X-CRM114-Status: GOOD (  11.62  )
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
omitting PTR_ERR()

This patch fixes this cocci report:
./dvb-frontends/mn88443x.c:698:3-10: WARNING: Consider using %pe to print PTR_ERR()
./dvb-frontends/mn88443x.c:713:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/mn88443x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/mn88443x.c b/drivers/media/dvb-frontends/mn88443x.c
index 7a58f53ab9996031e319711a21b1a8f1c13abed4..818c4e67364c7c6ec2bfc17f21e2cac360f6bfb3 100644
--- a/drivers/media/dvb-frontends/mn88443x.c
+++ b/drivers/media/dvb-frontends/mn88443x.c
@@ -694,8 +694,7 @@ static int mn88443x_probe(struct i2c_client *client)
 
 	chip->mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(chip->mclk) && !conf) {
-		dev_err(dev, "Failed to request mclk: %ld\n",
-			PTR_ERR(chip->mclk));
+		dev_err(dev, "Failed to request mclk: %pe\n", chip->mclk);
 		return PTR_ERR(chip->mclk);
 	}
 
@@ -709,8 +708,8 @@ static int mn88443x_probe(struct i2c_client *client)
 	chip->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						   GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->reset_gpio)) {
-		dev_err(dev, "Failed to request reset_gpio: %ld\n",
-			PTR_ERR(chip->reset_gpio));
+		dev_err(dev, "Failed to request reset_gpio: %pe\n",
+			chip->reset_gpio);
 		return PTR_ERR(chip->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog



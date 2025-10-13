Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C80CCD192
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8BE8cd4ehs+vvBX7b/XSqVzFH/A9VcJiWIwNhqGmEE=; b=z8NyKx+K7PM/BAA/dtPc6D2OMN
	6xDABFkVSygv/h3tpOOI1DNnV0gh5kg6PXroaNjN6ZBNxZZNIj8Ak3UM32m+b1E6cdL+x0+0Q84fW
	mTq8SfpB9YesWSSspn5AN69M0WtPqSC2vK1ad6Z6f/0mzdJP5IaSj0asxKnhDJfi8QQ9VpqD8Bwlf
	NdNBniN+NTL0Ie7UP+WzrvJxtZYCyGd8hS6Tm1RWMoL7rO/cxDAANbpRoyF0f5qUu21UAqPWpY+wh
	yVu6a6m9OC8krGX0nLY3g0DjWtJW7zx8i5Fvzi5+43b3R518Io8V92L4HfkJjUHKQ7h/zuC+ePtC1
	KLO/Y8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKm-0000000DLbK-28R7;
	Mon, 13 Oct 2025 14:15:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKM-0000000DKrS-414R
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p8BE8cd4ehs+vvBX7b/XSqVzFH/A9VcJiWIwNhqGmEE=; b=aXFdLaJiIFPT5TW0PN5/Yh8rSL
	dmhdZOW5mFyq/JqK3M/CfiV8Ifu738yoIlUdJJH823E2PmuLGEHEA6VVX2MWr36uTgJC/u1/aWuwW
	kQbLp35Tjt1eetQ/9GF9ZF3B/Lw0dmHOLgMFZUgN3o3xtjJhuGW9+eTpQFksP4j/gM62ta9YiKO1N
	kteNfHyPf/CepjUaiIpEWGn+bQxuD5NIHHjPP6nH6/IF47rJtzeN6H5gpRjl2bikYnCVzditc34UK
	QzuiCKvv+GnIqKiyUzJH5Xw50I47/1o7ZQCC8vJFoU/QD4JvXzkYQb2W8kb2lEtqQ4/fmEJGmpwBB
	4fmJcafw==;
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKG-00000004N6h-25oT
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:05 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-579363a4602so5034599e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364899; x=1760969699; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8BE8cd4ehs+vvBX7b/XSqVzFH/A9VcJiWIwNhqGmEE=;
        b=BZ3St/ZMhtovsj1c2t6WYXDPojJZYziJY1fkQtciTdYWTcAx8EjoBuNRILV9KBFpT+
         6UpSRUScSrFCy9lDblVqZBUEJpBKbEOHNcx11h7JHWN19+Rcr5/ZFK7pLTNcQvglGRy3
         3oHFweeijhjy5SJitpls6Sv+als9lBNLGPS1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364899; x=1760969699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8BE8cd4ehs+vvBX7b/XSqVzFH/A9VcJiWIwNhqGmEE=;
        b=B6IcJrbaUUulvjJvrCwJjDec5kp/mWwzBcwmHKo/cYyNs9cYOQ35V3in07nD1g9OMd
         9VAptwQgqvNsvGew+WY1rOvIKRQxt3UJaudieolyAQ7lTUIvSGMLZu/ANy1XniviA3VJ
         1Ips8lv57lG+RTvP0QQBZZBrF786/UM63auH6DrR6AR5RoboPX9zfZYLT3OeiIClFhjo
         OpqXNMdWWq5445i0vb2lRspYg96UbYte9QD22lo2YQE1EsOu8RaYy2ElFOmB57muapl0
         mwusS6fvx/yGidvj62C9/okGbsZn67ZL2yz3kABUDD/qu6ijYOhRR6OCQ4VfOWiCMHfP
         NutQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBXrACzepeOzmPv5auDoivXBIlLcjR47vkzIcE28FjdHrpl1fFiGwKOyrUQ3a8/vMNF18lB1UsWPLBYbP0xA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBIa1BYB8ULeGTopCsBehmczHRt4VyU+qotkfdzuzZgTIQrggw
	1fgN8ijMA25dgJPEm4xD+uoNybI+aPt0ha1wCg3lF+zjRPeVJ1k3Z6dr0XNvDqbjrg==
X-Gm-Gg: ASbGncuw5HmaZt8fswO8zcOXNjdTRHKwi8tLEzVu5Y8e8d9bbqDk6QnS7wLH5C1DGHE
	vUFmjuK0NUwWKY5iYx+a2W5oNR0UMrtn601snrrzEnz13PcrH/TKTHe/HUyhokkyqP6DrWBWsnt
	aeJ7PPA80h277nXlap6OZk//V7JtJU/djHhv7SxaMeH3bK7jZXNADAIpgkFGYDcXRhLSyFMRxXR
	xMNe12BVfcgfs2nfHVgDCUotuuav3AxI0XeaxTAs+UAf2aOEkL3KKmNTKRTQOZjlf5evutu53d0
	0eKL10JauTCrHWeeW1O3+j3QtJloLV+chY2SWBou5e9qPqownmKOT6xzu5adeEZcHE+m9c7UDJR
	0cZYEWJ1rz4I/MWXtMtI797a7TPnu2KeA0BZVXjO4nczvpPQqQKy/ZGotnKUT0HvryKM8TI7R1o
	7Lz4n4p1JNiy4j9SVo7+Ziu6d2r0HO
X-Google-Smtp-Source: AGHT+IGpJ2y0KS2EDpbOsMnyHnkw2vKTe9VvDcatboc6qkM7xgDjulc/G8CRi01zrNhs6YMLw6/H1Q==
X-Received: by 2002:a05:6512:1053:b0:590:651b:10e9 with SMTP id 2adb3069b0e04-5906dd514d8mr6137707e87.34.1760364898568;
        Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:55 +0000
Subject: [PATCH 15/32] media: i2c: mt9v111: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-15-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151500_713138_AE27E1AC 
X-CRM114-Status: GOOD (  11.60  )
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
./i2c/mt9v111.c:1143:3-10: WARNING: Consider using %pe to print PTR_ERR()
./i2c/mt9v111.c:1151:3-10: WARNING: Consider using %pe to print PTR_ERR()
./i2c/mt9v111.c:1159:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/mt9v111.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index b4f2703faa1854a3a5e7d92ef312d01a39879a5a..64a758c95ab7b767de452304615a8d1f986dd23d 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -1139,24 +1139,24 @@ static int mt9v111_probe(struct i2c_client *client)
 	mt9v111->oe = devm_gpiod_get_optional(&client->dev, "enable",
 					      GPIOD_OUT_LOW);
 	if (IS_ERR(mt9v111->oe)) {
-		dev_err(&client->dev, "Unable to get GPIO \"enable\": %ld\n",
-			PTR_ERR(mt9v111->oe));
+		dev_err(&client->dev, "Unable to get GPIO \"enable\": %pe\n",
+			mt9v111->oe);
 		return PTR_ERR(mt9v111->oe);
 	}
 
 	mt9v111->standby = devm_gpiod_get_optional(&client->dev, "standby",
 						   GPIOD_OUT_HIGH);
 	if (IS_ERR(mt9v111->standby)) {
-		dev_err(&client->dev, "Unable to get GPIO \"standby\": %ld\n",
-			PTR_ERR(mt9v111->standby));
+		dev_err(&client->dev, "Unable to get GPIO \"standby\": %pe\n",
+			mt9v111->standby);
 		return PTR_ERR(mt9v111->standby);
 	}
 
 	mt9v111->reset = devm_gpiod_get_optional(&client->dev, "reset",
 						 GPIOD_OUT_LOW);
 	if (IS_ERR(mt9v111->reset)) {
-		dev_err(&client->dev, "Unable to get GPIO \"reset\": %ld\n",
-			PTR_ERR(mt9v111->reset));
+		dev_err(&client->dev, "Unable to get GPIO \"reset\": %pe\n",
+			mt9v111->reset);
 		return PTR_ERR(mt9v111->reset);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog



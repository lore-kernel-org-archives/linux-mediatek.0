Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5784CCD192
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9T8mO4GmxU6Sp5lObaHqxq0/smUXIq4FXIudPa6OeB0=; b=2Lq/rTlb8wNrEO5xTbvXKzgVH9
	PUQ4xxlWXaHVqCnkra9Y51ONrqP0IB+tFEA9oN/yskz6c2OopLuQyO1rwlz5fENCUtMdNqyXiLQee
	huzPRNyjwcrmxN55/2K0p8ixl4RTq2qc55yuu1CBLZ5zc/NB5W0xlk2leJtWAWBifug5Nrc53o9jU
	7wARKbxw3ZMK5qNQAjbq561z066K8BlOzsTblTd3xio+KsDQJH7w0ez4DkWRs7wsPZqWwJwMONj7w
	9PcdiZbHMyI870UOEUq/ASVuWL0ntlF1fzUvw/xRzgmvkBfHdd6nbufRqUF4uw7NLtpIBoQWVfJos
	kQBx7tGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKS-0000000DL4k-3nCH;
	Mon, 13 Oct 2025 14:15:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKG-0000000DKf9-20QJ
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9T8mO4GmxU6Sp5lObaHqxq0/smUXIq4FXIudPa6OeB0=; b=KRO8fh8Y1hIC+G2hUyKkzclOo7
	UMCG5k3F92v24jHxh1EEhGqGkObrEf22KwLbFXKwVFukgeoOpasEt+NKoeui9yrN/GJWlAof7/EWo
	dPHw3IHGSNulYVE66BwiSreLqtEb8nPK6Wlc+XHsXZMn79GsLiU38A7X4Vi0i3TnnTEoeQ94Xz82Y
	S3lo/DAF3NjmvV164X5MvCUBHiGhb8bKsQC/axktHpBXg8MupxAKYg3165dA6sULyrCXDwKtlmFYW
	9RqLhoQzfS33I9OkK8G0YJe5PC4AYZSQhPreCnxf4TXeQYuJW4IoMtABV7O3rykCf/LSiBcnOV2ca
	SuuejJFg==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKB-00000004N1m-0t0k
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:14:59 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso1150050e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364893; x=1760969693; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9T8mO4GmxU6Sp5lObaHqxq0/smUXIq4FXIudPa6OeB0=;
        b=e47GQCNzQGzMpsKjju9KuHYyKdXoaRy5QNo6vpVuoYND6/28WFvjZE+o3pJTyXJgHM
         S9kCBIhYNNhZx+CT9aKWsVeIV4ohEEToLxUOSC0xz96BNNwU58/5fxQU51XMumcO44AF
         neZLYoWhjgVK6HP5t3wmptSDt4eI7lsqK3TGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364893; x=1760969693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9T8mO4GmxU6Sp5lObaHqxq0/smUXIq4FXIudPa6OeB0=;
        b=XoM7pLqyfmaWSD82GeKATRR2k64ghfQg9dtD58ZpNF0jIt/bQkv5gKToUjXe7FYvM3
         nyE65JUA77CJEgnV0J7GrnGUG2QEKaCAc/efKIplMypBgozDWTBLwS7PLiQjq9D7AeNe
         LyEV5hJmaZJemxf7TH744BxVtMmmwxMozWu8IOgzrPWXzUwHMpm+l2ICFYkC7GC58ZEF
         bldkC1+1tySJ9LIy9sJFSZIB7cDtUAVYDcErPLe/AhJqEKljQUObExagcA+SEjtOOR11
         cYUK7BL92dbm8yOUh6LrdtZMg+I+CITOL+9A4McapDk7jPJPHpQoDYmGs7olp0KtXIhS
         dxuw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Q9LErXnIYLj/GXdzlvQ+xaxcjsvIqYLmXDWUu9h0MOMgewb+NPfGKLa/psrH4Q/LxurjXxh8QaafioiPfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWR6uF44bPHyjpSCMJ+1BvGmJ6NDn1RLTkYYQ3dJzWFw3mJdES
	mQFSNVJ+qUsu2nwJeuvuisYa3Mldl9Je2dD1QWbStKdiQvWOp0oIqwJqG12WIUL8gg==
X-Gm-Gg: ASbGnctDl+OQYnWE82YlAnvOW+8QO6p7x9cnz2wloMeyQUc3Q8PUHvooHGDCC0q1sf/
	tc+eULCDzXEEFlwJWfjHjHMVRJH7a9ON/YnJWRAwdChOoc3IgqxCAj4zpfhDFMqX6GiWYFpgb//
	wNpvplqENwiqX4y5gOTYSvZaO9XaOPaERmRRrefpm6fikc2KY6tnAhRKKoyM/dC2duImGYcx4gq
	X230jNG8gDBURrt35csxmRIzJlQc/l/U6MXyrnr8Dnm1rOc5A5/gXAPkBq38zKycPKyoMst5oyP
	KLc0rYjgz7TJElZA40LoOKVPcOtKFjo9tfe2/x3nxA+Bk/vJhJ5HAAOuyACJ1LKRETukHTmJJ8Q
	HcbnUdk9ZtFK7Yc/cCOcCZKxEV6BhVtVnk4ta4s53BOyFkLsSOLNeVc7fNHzN3whJx7tzIGS6Fk
	YSWWZSp7WZ0Sb1ysLr+bcBL1zTjEaF
X-Google-Smtp-Source: AGHT+IF29XnVuKewIk2Zn4qpOdHSO/Y/bSkdxJ/SAd2VXfC5cMU7PSQseV2CsRuBBvo11GHLWuTn2Q==
X-Received: by 2002:a05:6512:3d14:b0:55f:4633:7b2 with SMTP id 2adb3069b0e04-5906dd73db3mr5724883e87.46.1760364893403;
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:46 +0000
Subject: [PATCH 06/32] media: ccs: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-6-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151455_840963_E644CA9A 
X-CRM114-Status: GOOD (  11.87  )
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
./i2c/ccs/ccs-core.c:3241:3-10: WARNING: Consider using %pe to print PTR_ERR()
./i2c/ccs/ccs-core.c:3298:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1c889c878abd3aeb1b7a887cff29b5eb864ab057..f8523140784c7120eaf018ffa9e3b43ea12ef72f 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3237,8 +3237,8 @@ static int ccs_probe(struct i2c_client *client)
 		dev_info(&client->dev, "no clock defined, continuing...\n");
 		sensor->ext_clk = NULL;
 	} else if (IS_ERR(sensor->ext_clk)) {
-		dev_err(&client->dev, "could not get clock (%ld)\n",
-			PTR_ERR(sensor->ext_clk));
+		dev_err(&client->dev, "could not get clock (%pe)\n",
+			sensor->ext_clk);
 		return -EPROBE_DEFER;
 	}
 
@@ -3294,8 +3294,8 @@ static int ccs_probe(struct i2c_client *client)
 
 	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(sensor->regmap)) {
-		dev_err(&client->dev, "can't initialise CCI (%ld)\n",
-			PTR_ERR(sensor->regmap));
+		dev_err(&client->dev, "can't initialise CCI (%pe)\n",
+			sensor->regmap);
 		return PTR_ERR(sensor->regmap);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog



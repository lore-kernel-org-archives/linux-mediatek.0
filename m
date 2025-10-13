Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABFECCD192
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8uWudxYngdjU1rcL6v5EBbp/gDU20W7uHc3A+q35uM=; b=f79I2I/FFyU+ij1TYtLryRv5+q
	+sawz8avg3Qi/b+/OpuNYWOIk5AqGxROwi+X5DQSrj6/wMfmYfBvcHVY9WIu+2lJkZmg2+U5Fwfjt
	kE+WIlUXYHF6CtCm0pEuyEY/+GJs3rWVNwdMLx1k7+6FykS5FG8Ra9su9dzoCutv1j7KNznskH19Y
	jabbp+adZ09c+qlKofvsGVFKWMs92q2zqQS0u1+oSRRJTmzvLcESKiFr3Q9mLKoRTt/p2/i7zENHU
	dux1lVKi8dq93piTuPwt0o6YanOD9Inpyu2Se5IS+07yFppXXV4N1HGuppS4rsl//TSaMDyWrz07C
	x605uNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKi-0000000DLUh-3px0;
	Mon, 13 Oct 2025 14:15:28 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKJ-0000000DKir-1CQ4
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:05 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57a59124323so4619764e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364900; x=1760969700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8uWudxYngdjU1rcL6v5EBbp/gDU20W7uHc3A+q35uM=;
        b=hTWKz/h8WUh+65lTnv33ni9pWqhCIdmFIrBcRo4Wq8nTMmqdyo0E0avU+FmycwXokB
         /OdaFZRGqqIKj7f8teWYKG1o9xiuwL28w9T3Cq2Y7b5Q9I3nGk2ugZlNWyjkiR1pEFxO
         ukMYPJPSggJPp8iXnwONoxzGKpt/xMTBZn+2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364900; x=1760969700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8uWudxYngdjU1rcL6v5EBbp/gDU20W7uHc3A+q35uM=;
        b=BO6dKA+lZglImEXPJdJpUoTL0PBAjfJUDDLgQY+uaDlXVY98TkJs1rKDWwy+VLKY1/
         1b4LIBmqDP0KrRr74pIjlRYLbFB+4W9vIgy4L4qzq/8HU3MpbOPVZf3QGyw34L8uVs0Q
         3f4+xcE/C+8GgK2YFhf1Vh4sjmoRIC8k9boy4M6PnXgydg6Yg2o+rOo1PkamZF+Xs6dP
         A9Td75JQhyAU/29R+ynji9rMGqe7t1HnFMI6LLfMSGEooYtiEWLkS8+VHoE37aiojPD2
         g/xOv5Tuqaq8BKRqkQeQh8vXq0bub0ob/qX3VMS4+Kap3v0Degx01lzQhA+vUbSH1K6X
         qWpA==
X-Forwarded-Encrypted: i=1; AJvYcCXr4gKO1WnKsxBI2nrFOL6JPqBAfF9+ya1obSUklVNePVOuIaESE97+MPTxYifwnksLucA+zqZCq6iNR9T4qA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMVAI50mKXv1BNjqhclAmT2LCHD6GHM1XsXrko5ZDsOA3UrhGs
	WRNb5MpnI/1tKEO4TFG/8F70icjn/uCUddPkpiqE0wv2OA39v5crIiyqSsNOBuVgkA==
X-Gm-Gg: ASbGncusHtQDhZDLYELsknwQnCxye+DrsXhz/xOoO/cqRx2pDe1n63QgOzpCOmkURop
	YxY3kgkb7JZ8Pg7s5ss1qUsCSwZeIK7tTrai+EVGdFwanmwHL+76pVaMQwovllbUOW2onUVPGxE
	1w9pHJQmuMG7f2EHsw0wkwwg1pDV4C5QXggLgEDpwdCpv6NkXUlx8OyowfQmk3m6iBl0q03Y9Xb
	DiJTeXNqE9aQWFj5deuwG+gD7dVsqzQqkGNN/LrfaDEM0gCXOEPHhNeRT6FG8G/uoYgW32/TZk6
	fWlmbMDQdM4EXwBEgai5tBJ2cvN/IYBCnlRm/yrLD9CdzY/TfMyGvIxYV8fpoP0NrEMXOvv2o/t
	94bCKAknDx1rYpicirX2c1LMpEzrbzDsD4m670LMe3GZy+HgxAFa5kw6NOpTsSYFbKemK8xZAPR
	78TRAj8ModJ5PPwKgJ+g==
X-Google-Smtp-Source: AGHT+IEH9NSSx39JZw7O8X2sLmRDHl36VtDy7qnNgdDgO7X/hYoH/eK9oEmeokNHWwuJqGEVp7ffAA==
X-Received: by 2002:a05:6512:2388:b0:57a:6d7d:dd7b with SMTP id 2adb3069b0e04-5906d773bedmr6254025e87.8.1760364900095;
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:58 +0000
Subject: [PATCH 18/32] media: i2c: ov9282: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_071503_522496_6B56BDBB 
X-CRM114-Status: GOOD (  12.60  )
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
./i2c/ov9282.c:1133:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov9282.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index a9f6176e9729d500a40004de92c35b9abf89b08c..3e24d88f603c1432865b4d880670e4b67f1b5cec 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1129,8 +1129,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(ov9282->reset_gpio)) {
-		dev_err(ov9282->dev, "failed to get reset gpio %ld",
-			PTR_ERR(ov9282->reset_gpio));
+		dev_err(ov9282->dev, "failed to get reset gpio %pe",
+			ov9282->reset_gpio);
 		return PTR_ERR(ov9282->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog



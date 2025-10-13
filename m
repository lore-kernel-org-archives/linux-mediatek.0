Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CA5CCD18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+YhCU9BSkNGYIn59ygfcOhebsOBGxL8NqrMakgbz3w=; b=Laqj/mDRYJuhTV94R5XKk2SiCH
	0cvYxj8VMGsv18qWkcanhSmdFpEANUh6Q6cc5MaAgE9QlG5ROnQqUCeayBEsINpWl8L02BvnDNE1L
	MzwoPLxVPT42Or1mk7FzmEcKruvyiL4UFkoWl1y5Ae1sZuRyZCNs2whKZTVIlmhd74zw70CQFqi+E
	KvEf05Wlq4AMjIW5cmwRRTPSEQZViuYh9MEuIDycUF+FkzL87PQdUogyTP/oj8wZtBEnHv0ABGaMX
	hpfnPOv+9EsLPX2oYIB4jnS/Kjq/HWChnS/oeNm77zwFl+6sQs95t4O/N+fw2dqeCF42RDi1h+TBU
	UvIfmikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKC-0000000DKZt-3498;
	Mon, 13 Oct 2025 14:14:56 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JK9-0000000DKUJ-02cZ
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:14:55 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59070c9111eso5223702e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364891; x=1760969691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+YhCU9BSkNGYIn59ygfcOhebsOBGxL8NqrMakgbz3w=;
        b=BA3cikMo0okmudridYw3wUIzu30wlGE+epllHoZMK09e4D3FHzFz9IZl2gBq82O6oT
         9fzZWjp1yPp7wiT75CKLByVZdfhIdLLZVVTBP6sUMjd1tJ+YIYYLMvoOpalzm5i8MAbp
         X2sug02vprlrXd2QNiX//RHkJpXVJ9XNqlKyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364891; x=1760969691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+YhCU9BSkNGYIn59ygfcOhebsOBGxL8NqrMakgbz3w=;
        b=CE2pY7S+GMbXjh+BGklOZQe2bqdHk/ed1RslPQoXbUSLbWKqoxCF5hKOiT+C6KzD8x
         m7MicbDRAqHwO7uQ25oxnUe7+cpuFlVYiuyYJaNr+3TxKbe4iwB2fsalsHHiQ//YiQGP
         9/6EWOUz0AmyPJ8BX9CZ0Vwuy+0RsgFje05rqS8ipkDATuxcVgKeZgUNHCByOJHqWUgV
         /DZ3L9t9v87aE5GTC8HDD//9fK4L5hmA9iN5w+buOcbItCeOjTDy3sQvLgxMe6NHMd91
         fXg0WqR5DO9k0jpDlgG6aFB5wtf2/WYn9+gT/yJdU+Iugtb4cRdhF+GN3CB5QNrQ01cG
         5T9g==
X-Forwarded-Encrypted: i=1; AJvYcCUb+7NwUt/ffamjjgZws3NhRgm2FuhXLzjT1EUFIjoTWZ0TWSfw72ExDBXOX9eJ9RAlIpKUM8TPVSm0kqcJ+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKvAn0QIhfnTm18yp3C1PrjUP1zmk2dh0rIfrkNc/LGkiwinRy
	bIBM9HlXF18xsA7b6xSdpUX7g33zzYIVPAb2a5OYdub0chKrjzVo+7OfYCXjh20InQ==
X-Gm-Gg: ASbGncuB6kxlNZVc53EWlTf+DxrXR+khil0WQ5qHJa6eNPMG+Afh87dNaZj5EQEClOI
	dnb40zmGkxCgwRg/ybglPm/vE/K1UOr+mDyfkecidkMV+XiWVevU5N4p8Q10qkmGk7SvOm7bTbM
	doqMCBqfRIHgWjrhNVRaor+ueYXJuh6R5vGLyFp/jy/tDfh2b+FsqhVraPr9cdwr4G+SpEm+fbR
	YBcesQ0tUpPdLv8ibKzzBMS4ATZXdINijtu2wnxwOlyBvQZlx1cu1fjeMAS/x8u1yo7yadWlxkc
	lHn9AXJtPKTRacIfR3B7zbNTKMyOWBAuu3xLuyuJ6HCQVQcWDOFanPb0jMrS26IfI2rZm3AgWau
	e7K3IKMy2HNw0VxTlz5IPsBtMv2SLvKr+OQ8FJgJxLHomEMUGLXbV8J3uE4lkdoLLXqSh9obpAR
	k/Xhmpiot+MF9dTyWf+11vLDTvv/cY
X-Google-Smtp-Source: AGHT+IG2QYB2+56krLBk85ko6pGpX0D4THrfkt1zz892JTpjDOUAww9G2kctwSbBGnVpsEQJrH5Ywg==
X-Received: by 2002:a05:6512:3f12:b0:58a:fa11:b7af with SMTP id 2adb3069b0e04-5906d782160mr6219748e87.14.1760364890722;
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:41 +0000
Subject: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_071453_113619_278D3F97 
X-CRM114-Status: GOOD (  12.35  )
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
./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/input/touchscreen/cyttsp5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
 
 	regmap = devm_regmap_init_i2c(client, &config);
 	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "regmap allocation failed: %ld\n",
-			PTR_ERR(regmap));
+		dev_err(&client->dev, "regmap allocation failed: %pe\n",
+			regmap);
 		return PTR_ERR(regmap);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog



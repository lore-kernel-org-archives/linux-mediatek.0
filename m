Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21519CCD183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/KkfbsbDFUpgpWR/Q+1n2e+SsZd/m2BbfBCG6Meudo=; b=YnmGdnMBCBho8KqBqUf33t5P6h
	1ywEsqkDEkbFbKNATkG0FAnmmaNxYiW+8SWZSO3J+SiaZ0GufPA9Yo+xoE5r3lPYaJjkcE4axO8aF
	kJwrXq8KgK++9JOIwe/vqDRZrFvrAG5XQ1li4gNoEjxYU6yXbXHYw1RXQcbJENoGtPcUGtLSv+gUT
	kYk7Ex/ERQzi0uzpzkm9Oeodl/3OUP9iW0kClShLA6sxQ879MSOPLx8JOVn4o6lSKyijXibPtw1dY
	Y3Z9ndmMEZhZKl6zodpnkLMbe6clxf3G2Kab8fnTeQ3pOhj4FaCjlCC2zXZqt/Re5otc+EQCRzEtI
	C/0o32dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKg-0000000DLQS-2AvC;
	Mon, 13 Oct 2025 14:15:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKK-0000000DKm3-0CpF
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=h/KkfbsbDFUpgpWR/Q+1n2e+SsZd/m2BbfBCG6Meudo=; b=obF0VfkXWQ+4pOebNYpxoN8p/C
	muQzgcUJx8Qk1tms14W/B6OzJ2drx3AMatJIr1leCQMNLOMCH9zJ5n18d+tw8pvCbvVwvJQM2/9R2
	k0BoOhhb+7eeuEWNX1v+nmJatfwJO8zJIUpAEQe5zhDoFssHK7kTuLWBacwHLVaCL3kzl2IbGmkAq
	xniUWfB0zA6U4I5TN26BZtTTGru9uOA1RuLwsIrdyJ3jMoyr2vKytS0aEWNPqrS9IY0kAhUmx0q6p
	EMWTv1YJMXqSbmEvNmL45NBI0RUY7gCNBpdutyylx6JMDtzwj6WSArW9mW7FocytqeiWG6gvL7gEY
	uUN4WjSA==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKF-00000004N4q-1qFZ
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:02 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so4681825e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364898; x=1760969698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/KkfbsbDFUpgpWR/Q+1n2e+SsZd/m2BbfBCG6Meudo=;
        b=TICadt2oWZCctfjIVpFklv8dN/0YsPp8l/sxdfICLj3ZYAv7/dfoG+l8YFST8EMA23
         HLAjqkJCEIP7WAd/oUE6xwqegwmdLPzhfiY8c0LKqhQLRBoOyw+qt0eEj5ZqWl/Akuye
         2uO1spjCAvdeMD80QDHSg1a3M/si7D92A55fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364898; x=1760969698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/KkfbsbDFUpgpWR/Q+1n2e+SsZd/m2BbfBCG6Meudo=;
        b=NZxlxaqBjwzfKDqT8BspVFlzP12e98EPARK830L5e8BuGKfR7TGQ1Rzv0AI1MwBVr/
         W999kr4nkgV8QzYxX708mY+FHGub59dPDC4GImi5Z7tgH9LhZQtdD/xvG7grHVeP/1LX
         SrenIh/4wqGeufCNzG4YXuBpEYP/kCGz9fmW2FnLodrxn5UNqNLDlJXA43dvb/I7k4Oi
         JZW3hc2fCHFvjfdjRUJsSyna6QKZXJi1Ep1100xwxaVIe3VW2IFkvBTKO5ULb7wOk6ZH
         it8AIlquDFqTEuhIjnf0DA8V+jToZocrrvJ6QWnbKTPEF4q7pc2cUVv2xiC57BQtEoAn
         ulTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Vi9pVDuM/eeC2rmjmTwC+emAQ8XOMqvxvNhd4ogpfMdL9IWWJpzg1HlniVatsXOhYdxur6wCWL8X9MxQww==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfvZZvBqbk2XL2HqVh4H5jckcT1QtlBnkrV12rAeTiIJgE5RNZ
	C6+UmeU1zN3lx8OYqidKjZdEu4/lgBKg2R01mMbt2x7A3UUyIYQn2pFjJ447R4xFFA==
X-Gm-Gg: ASbGncv10XHxB+zj1yD/VUwsyGbNxstE62vFA2Qc8Llf3d5wcV+dFjIvoIyVmrQBi2L
	Jq1rbRvTfKvNMxIeQ96XMUH0arwzU+GYTw9oG18LlARzkx93o5yp+zy2e0a8YReEj/WZoNdtD+3
	5qSIwtZiZ4I5HJA8vIM2r5fnA5Uwb3E5F/39AacN62bU5/sB0mvM6IlqvCT8Wm2tEY8hq7JZmxT
	2zsQ1HgquZBKwaFG2yFPW/tIeLA9b7Rb9o/glwgNsvPx4mWYyfnVUrwJ47c0q5i5+78Tc8QikYh
	PxO4mJGuhbcQliC1gsfvnb8m2B8oK9rX18SlhZiQDALscVO8fCILMgzEk/mqTK3ERjIy3p5/9KI
	+yLdL5d8UrUHfApqMXmAZd6kXoZLFI6qUp/eplMfKFa1TWPuuW16MOehPCDK3qrV8nDb9M+LuB6
	9phTkIezrcnyxBXKuIITuJmcpjhyN6
X-Google-Smtp-Source: AGHT+IHydw0CVPv6HxiK0rxt7/F7rhhFXqFXXsY7vFrPuGUIbADwLidmgxRKInXX5MSWX37dI8vbkg==
X-Received: by 2002:a05:6512:3d17:b0:57d:9f0b:fd4b with SMTP id 2adb3069b0e04-5906db0ccd1mr6079921e87.6.1760364897595;
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:53 +0000
Subject: [PATCH 13/32] media: i2c: max96717: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-13-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151459_706860_5D622FFF 
X-CRM114-Status: GOOD (  12.79  )
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
./i2c/max96717.c:653:44-51: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/max96717.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index c8ae7890d9fa87a78084df1f3be631004acbf57b..71ec4fdb8e3d96dddc23ab090a63b23b1d093fd4 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -650,7 +650,7 @@ static int max96717_v4l2_notifier_register(struct max96717_priv *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		dev_err(dev, "Failed to add subdev: %pe", asd);
 		v4l2_async_nf_cleanup(&priv->notifier);
 		return PTR_ERR(asd);
 	}

-- 
2.51.0.760.g7b8bcc2412-goog



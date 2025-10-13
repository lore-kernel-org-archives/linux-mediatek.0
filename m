Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23547CCD18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQOTcbEIyF8Gidv4VnpqffbURmu3SD1oIPY/sSQVQc4=; b=Pdg6r658p7l5y1CvbPZyfTL9Ve
	N2ebsUbk7eoIzzjouT5sVQWAjJRObSpyXcZ0fthlY7MJq1cp0czEzwxsPTmP017hfrzB6M5DfMioO
	vjlBE8ByJPdyz+Nh2WDNGNKvJ32gR0pHkkgHyGVkJyBJthmZrojT5SO5gVO2Ow9vNOQ4qiY8sK4Vv
	NbHWYYAK+meJKkzqIfpo6aOHfetlmG7XKrJg+gTd4j65yKaRpKwtF27IGnarUGgDsbKVlgZa++nLZ
	YbHwVOgvjxUDCc2vfKz2sEC63w3tMDWvWUW3oC+ZH51CJoyUqkKZMLKqK6hwGUip3/ncUPC2LPL/s
	BndWpgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKR-0000000DL11-00mB;
	Mon, 13 Oct 2025 14:15:11 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKC-0000000DKY8-2EhW
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:14:59 +0000
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso4965096e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364894; x=1760969694; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQOTcbEIyF8Gidv4VnpqffbURmu3SD1oIPY/sSQVQc4=;
        b=bx73R4crlZuvsK59FWpFiExhVaRQQJE9/5gNraNTdHnMofCNrLGcghw2nsjXTUCIZs
         aq3FraqlqXoXyi4knlDVQm0uEDVmGXKUHa8/L/8irBfSofb0YOuqAeS63GvB6Bm0DkxE
         4pZ1VFN/4WqCgGEruoU3oOd9AAMZsT2wDpkE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364894; x=1760969694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQOTcbEIyF8Gidv4VnpqffbURmu3SD1oIPY/sSQVQc4=;
        b=r0GK446ob8HxDwMwXQ52khDDFS65cyGYjPbcBQocWl/nSn3UWzlfAVc5qK5NDmX1FR
         /XXUt7riCkvqOE2pvNTdFJzbq1qGez15+mJ2Vwshy5Voe//AcaUBRxNwzKN0j2mOfZs6
         o76HNOAHIvyKwfpss0Q5WqUSNQuzh18cxFOqEd5P1hTElaYvF0DlDTcLpd/+GVA/TqJq
         CZpWMoWL2tEIGFjCdQNL9uTAxfwrXeeBMClcZKgplT/IQDLkOuCogQciptLP+tcXfAxS
         VRclC2bdIu3jJjZ7SHUdXRO6+cIHn7dRpygaGnE2wjaHAHltHEEqsDv0F/EouFD3Lp0P
         pmZA==
X-Forwarded-Encrypted: i=1; AJvYcCXS9AUxCz88uqpmJ9/772ovj5/PPkTWOr4sIytSzKqU5B2wSQB1tg7fLs75JE+q3hvKDgR0x8RT9OM2uB08cQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLZX6QVJFtMBztlsFPUxS7ILnL1ReDw+6FX3a+N8Z718HdXEUm
	lRI0gueC5HD0qmRWcm8/gidDTwLyu0oNo7kBMXF17uyzXDPONbHwv63p0qOaObDQfw==
X-Gm-Gg: ASbGnct2qBOZoalRiVQeGyDAxVtyPsKHjWF/0B1/3cK1P6O5eMvSlwMlyyvRMDa3Q3V
	WnjFtVKhuhFZ2JQwOQO3p/hYoG7GZYstVzrfEeB/jxb/x0jqIffsKvNDqoSpzsTgd8VBDN0xSVW
	mumIBr/zMuJfkm34Qhmp9aGIfQl/Sj3EY4ytJCOCsz9cxkn9/VLf6e4BXmBYHfwizjNXZ62qu2V
	FIzL1Wy0GwcdP3XmWT1Cxz27rnDqbC5oWEWXv638ulZaq9dCoKAEmdtOmqnUzdznn6LK/5hpJ79
	ytdaPK30AZMS5ruCFvLUi9uEtJldSWg2coJ+ojS/QyZ2eVqKnSg+Kmx4gvWyq43DSSS7OfPYOzf
	BKred1AuR83Isup9O3e5OaDkeLFA2loi13BVY7RJKOm1maUx3g2Katuhy6Jgy4NlB3yvmu8uLH+
	wHYabVz13ZIq8cLXblwg==
X-Google-Smtp-Source: AGHT+IGDBA6vFVbdaAIVk4TqwO+W9UovYsrjETSu90SPXIb8+mEsMg943qVguajtHcsDf6ytgGLF1Q==
X-Received: by 2002:a05:6512:6c3:b0:57e:f60:2327 with SMTP id 2adb3069b0e04-5906dae8090mr6097318e87.49.1760364893949;
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:47 +0000
Subject: [PATCH 07/32] media: i2c: ds90ub913: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-7-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_071456_596838_4DA79434 
X-CRM114-Status: GOOD (  12.84  )
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
./i2c/ds90ub913.c:625:44-51: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ds90ub913.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 73150061ea458937ae4ba7a937ea030b0d98bce3..e97e499b04e6c2700d7d433ccb4fdc57ff12b586 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -622,7 +622,7 @@ static int ub913_v4l2_notifier_register(struct ub913_data *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		dev_err(dev, "Failed to add subdev: %pe", asd);
 		v4l2_async_nf_cleanup(&priv->notifier);
 		return PTR_ERR(asd);
 	}

-- 
2.51.0.760.g7b8bcc2412-goog



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBACECCD190
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPyzKdSQgEFTOs6vrnV72MjIpSFJDGoFOT83Au3htUM=; b=Rv3i9Gq8sO3Fe7w+bgvUYPzpMB
	Hk5NBWQqtxK5wMF9t4u8Phvxedmu4nLEI4+ppqZZSOVkC265aJxGlBFYtO4CmTO12XFvFOLwaoImI
	gIM47n/B5ubq/AByNJwaYK2WOUeEdWlcR9vlxeaYS/UMTj2o412ZA7Hnh4daSF2tbvOsjVgehj/Re
	XjdXjSuI+ZcVnMXDVM9uY1S+z/2Oim4isIRVKlL+oMBxaqBDyBTc36c7cTUhPKZYGLShknqNAIMPM
	rt+ZzvmxJVXxemvEafIDjJZkppjzpI2gIPJpx0Zov9msGyq4afC4b7HXBL8+BGowXs/qfeQijnLCh
	OEA2QM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JL0-0000000DM6N-46HQ;
	Mon, 13 Oct 2025 14:15:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKR-0000000DL12-43cY
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MPyzKdSQgEFTOs6vrnV72MjIpSFJDGoFOT83Au3htUM=; b=sDS7BaGuD0Eu7n+HhYAcfEFahh
	ZwpwTzGSBCFhCgL2PRgPYoctf3tJmckJj34EM9jHbZWJsz5UV4U8I+YZp17c6nxFpooXbus9YKVXJ
	SjriKxiKuMB33mlRRVLjt0ASY/xd2m0+GjhN7qXrIo+vTC5pl4cfiAphmaHnvxWKoYGWYqN5HlI2m
	SrTL2AdGQ3EeHY4pgYuOK9ECZiK4GPZMrjm5CXysEL+NLWAS2rZxEn7PhEuHz15Vs6eYEs9nOcRYb
	HucIkLGLH+rM5gvtIm0fVhErfI3rEiI5JbqoR7uxFgjB0+wMoy9spyyqi2v+ZCewbJ3gjzw9BDgKI
	3UBk9raA==;
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKN-00000007W5x-0GTs
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:10 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-57a59124323so4619855e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364905; x=1760969705; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPyzKdSQgEFTOs6vrnV72MjIpSFJDGoFOT83Au3htUM=;
        b=arVJPm+v8vPxAOoU4jNSMpceJwIcZR2yAnqUSBw2bpU2s+DxnXnDniNga6FDYm7Jrt
         NGnvFrnFYwlK26kq/wKAiZ44UvIyhdSNONFwm0YVkfqDm+GfmCTKbmwpvlZRCsH9J3Mx
         NshT3/YinoSahaK1G9X8djVipUIUkZXRXmy9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364905; x=1760969705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPyzKdSQgEFTOs6vrnV72MjIpSFJDGoFOT83Au3htUM=;
        b=gnV0wWsVDbSIAywEgp232l/54Fs5F9LD2WOkVe9y+EJzPlVZhMVMwHbftH2JA5MIX/
         Uxg1A6JMudRAZeOFYU6zHPa58QWD8YxkMem9byP+Q7Y+75n5JNPqWxz7XS6sJMICLWkR
         8HXbuwpCnGuE5i9E8KeV3Wz8wAw9Y7LjaJnE9k592BUg6w6FQVBX8cXifrBuClSrJAo5
         AP5e6nDEIkL70xSWv7xJGqFsHj+fNm1PQfYKGyTKLZu1nrdUU7PQUUQa6ao+9uDHmNpP
         4jsUjgmlL1mlhmAUeTJy8ngDRaK8dlpMv8WzXZ9M6XGFJgCk2DvymuKKrGonR0TrKP0x
         iLmg==
X-Forwarded-Encrypted: i=1; AJvYcCVFgXo1DKnY7AlXRRZyfQA40SEWoSiGaxs/FKgmUPp8qTVNuKUg579Az85eFK4aazZki3o1gAQ0XBuT3G7aPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsGDn7U4DMbqaOoUYa22hDQcBkF2kHHh3rlC2F4b7Ujk/y50Fa
	hKUFG6L81tpAfws6wbJ9P7X9XJAvcY8SC4S6SmkRExa8xQFcPN+pVa/OYaIRQ05c4Q==
X-Gm-Gg: ASbGncszqNBwD8aYDoVqLNWaeNqVh+yixtonZXuJ00JLBTaHA9R1bn+7t4K2ve+bye5
	vbHxSW7c/35IxuiHv+n73zsV5gokvhZ80EITZuHumBfALJ7OM4NvbnxAF5P88PijAYiojdepS0W
	aY1qS0RkcGQ03+KrsxhB0p4osMkgboNylgWkgvIj98jOMIrzZA7HncioGinpvh9fP1soIdSVohA
	kW8KqkbimRupOhfh76nqCGPMb5waY05Wd4kXW/p2ARq2g5+Yv8hIQZfCl54FjxOhKXIpcJ7b3RC
	6COZZlhnTnAlWQYkGNuAMbkIMM3jYFn70tGEuulEvFZ1svmf2neVQGqx6UKT1jtFL6qNPxWkK0T
	Q9bWDNRLuT/w6HDnLsHLicUmZ3cqvalgwvc7uCW9BBbFUm99rAlLbeDWP0RR6ZbR9fUq/9n20mG
	yx159qb47Gtm4Vm5FbVSUm7wxxjFxs
X-Google-Smtp-Source: AGHT+IHCybNyNMb0drsyz0aREmcwI4Uni6luvsP458rJiLZIzoW/QcUDGoAA5wmoQMp1unUYu7EgCQ==
X-Received: by 2002:a05:6512:2c06:b0:58a:92cc:581d with SMTP id 2adb3069b0e04-5906dafd171mr5060480e87.50.1760364904884;
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:06 +0000
Subject: [PATCH 26/32] media: platform: rzg2l-cru: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-26-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_151508_363499_C2823D85 
X-CRM114-Status: GOOD (  10.03  )
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
./platform/renesas/rzg2l-cru/rzg2l-csi2.c:307:30-37: WARNING: Consider using %pe to print PTR_ERR()
./platform/renesas/rzg2l-cru/rzg2l-csi2.c:726:30-37: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 1520211e74185fea3bca85f36239254f6b4651db..0fbdae280fdc49f963269a4bdaea38ff2e51884e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -303,8 +303,8 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
 
 	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
 	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
-			csi2->remote_source->name, PTR_ERR(remote_pad));
+		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
+			csi2->remote_source->name, remote_pad);
 		return PTR_ERR(remote_pad);
 	}
 
@@ -722,8 +722,8 @@ static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
 	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
-			csi2->remote_source->name, PTR_ERR(remote_pad));
+		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
+			csi2->remote_source->name, remote_pad);
 		return PTR_ERR(remote_pad);
 	}
 	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,

-- 
2.51.0.760.g7b8bcc2412-goog



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13EBCCD18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGG/+lvAfLoFYTFsHBbdKee0g975J4ynYIjn3miRvz8=; b=zFqmTZDPy4bT3Bn268MELGw+jB
	hJkGIDjgLpmBrshetmUquH8Xwm5rdOYcacAePrxXiiGuWntWtWTmdz+GkLPiDR77JjCvIFd+jq0Zm
	VH0R/wV/iWMU5Zn9wx/U9UEMn+CJxivhp0A/4iLdeSj1T+ABkfaHpIoxUJRkVajhS71BfQFVXS0L2
	hmbbpGQwYIk2O5vXcJrb+7CB7Fkxbl9OKl6TzRIf9aSD4dkG0aBitDqpjajn8S5kbOM6pcKJN4lEU
	XgxxRu/VPan+f4ONVizrmGhVQ7wVXvRIFZxaeE2AErJr3ZrQnnYo730Bd79b/Ym16iTFFIgtk3Q+U
	/tHQUHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JL1-0000000DM77-16El;
	Mon, 13 Oct 2025 14:15:47 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKR-0000000DKz4-0MT5
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:15:13 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390578e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364908; x=1760969708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGG/+lvAfLoFYTFsHBbdKee0g975J4ynYIjn3miRvz8=;
        b=hnHlv6Ca2lVjBc28KpZT2/7MBeMfBu7FGl0/r4xee1bqgV7lsCtpKWDwCQRnFxKlCx
         Yf/1S1pof1WGbwnBWlpIPV+XkFM4cqiJgwli2lj1PGmWXFjPBEWyFY5qjJ135dtj6h9B
         a3NABlLu8AnbfJeAs5SsYa/uUnAv9SrV4nyQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364908; x=1760969708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGG/+lvAfLoFYTFsHBbdKee0g975J4ynYIjn3miRvz8=;
        b=qVV6lyLfndCo7pC/hO9VUfW7DxglYhVWQdhaJsnykvcPGcjNx7QgRyDNZzmbhJogaU
         o+HSdiwpEJan1+bN/ozXe3TJaZ9URo8LxrNitxkbQ98atdkZOWgTjbH+yjRVHSfknasK
         Q6gWSYRuez0yY4l8g0RSZcvQjOV/K/fuom+fXwZ8LiATwrgsrucXIx3s/p2dvYbJPLlM
         6XxbrrkhbbakORTahrSWCB+/8dg1EZOAE6TyQxn0zMSppgZEDQ3kw5ENNDTURoT1aVsW
         HUkM9e5tWJ8LyfIBr3YGS4wc319IFWjxYyMDJeS5t9/DsKC69vu1zI0AEPHn7qTaagMI
         9g+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMytj1H6Hi7Jz8ode+xm/BYXU0j7mWVEo/9IynmNQe0OHgyqdMzcxTi2vXyCQv0wxLi1htYP8pZdJfeSNiMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPEUvNGRq4wmBYWeem8lOXYdotqddBDia/ksY9rARLYLpSoe0i
	E8W1+Mgu5/LuoCFGJV5P8BOeYIWeK2EZaGpLn183A38uchW6Npk0b41RWMiSbEVPNg==
X-Gm-Gg: ASbGncuq3HxMlMeJmm7l8TeI3SJDECT4CviORh2l6vrjiJqDQMUWkJ3OaadLxBhBbpW
	HQU3PIQqlUwyZSX/mVe8fCI/kMNkZx/HHH8wshRgJhqVzHRFGU9Uu/HrWATIq1imkWSQBoOB5ID
	bBZw7eQTiqleLuNPdxCP+hki3jypIWw0JMZGANoXWYV2o8qKqQQBqkvOC/6IgCPbyjHggjJVvf0
	vvWc/AVZ6YQuBgjNwSYN/MSnBmb3QtYO2ZzFlGv4BHowyiHAaykVtjwy03EZeGeqHugwBzBesXc
	SFbMGmvNnPGDoFPbqSBRM8cg6F8p9Zpadi82WUGTkFYfH3T+VKF6InLmJ87W65KQlXBI0lynQ6J
	udqRSk6K1yoPlooCRobCBOoAgd8UFDnvHcVrWtPzOKXX870vDTyWJolBLFqUquN/HWFvjR0Muwa
	zbq7ufzgLRpBZzpBhQ3kiNHAlMzi5JYHa8v/uY01E=
X-Google-Smtp-Source: AGHT+IHonGCa8by4IRlUhFwqne0G+xChLaB77A4Elu7KHX/ytkwCKxhNDSfo6zsqaOoV+Q8fGGx9SA==
X-Received: by 2002:a05:6512:1093:b0:587:a4fa:1e50 with SMTP id 2adb3069b0e04-5906dae5b56mr5886844e87.41.1760364908274;
        Mon, 13 Oct 2025 07:15:08 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:12 +0000
Subject: [PATCH 32/32] media: staging/ipu7: Use %pe format specifier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-32-2c5efbd82952@chromium.org>
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
X-CRM114-CacheID: sfid-20251013_071511_201911_7950B2C4 
X-CRM114-Status: GOOD (  12.29  )
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
./ipu7/ipu7-isys-csi-phy.c:311:23-30: WARNING: Consider using %pe to print PTR_ERR()
./ipu7/ipu7-isys-csi2.c:59:22-29: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 4 ++--
 drivers/staging/media/ipu7/ipu7-isys-csi2.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
index b8c5db7ae3009e16264d7aaca6d4d237c1402ab7..2d57178835188a44b002b38712437cbd551751a5 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
@@ -307,8 +307,8 @@ static int ipu7_isys_csi_ctrl_dids_config(struct ipu7_isys_csi2 *csi2, u32 id)
 
 	pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(pad)) {
-		dev_warn(dev, "can't get remote source pad of %s (%ld)\n",
-			 csi2->asd.sd.name, PTR_ERR(pad));
+		dev_warn(dev, "can't get remote source pad of %s (%pe)\n",
+			 csi2->asd.sd.name, pad);
 		return PTR_ERR(pad);
 	}
 
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
index 4023db4a6466dd57f0ac007847bdd74bcdf394f7..f34eabfe8a985f29fa48b4a8896a058fde2f2b2f 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
@@ -55,8 +55,8 @@ s64 ipu7_isys_csi2_get_link_freq(struct ipu7_isys_csi2 *csi2)
 	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(src_pad)) {
 		dev_err(&csi2->isys->adev->auxdev.dev,
-			"can't get source pad of %s (%ld)\n",
-			csi2->asd.sd.name, PTR_ERR(src_pad));
+			"can't get source pad of %s (%pe)\n",
+			csi2->asd.sd.name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog



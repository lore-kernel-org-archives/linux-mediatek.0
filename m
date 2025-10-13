Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F98FCCD183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4+LqH67jKM/F3LSKb9pvwKSduKssNZljIxm4L3nejxY=; b=TXeN8EyH6thate
	xAVKAEVV46PktscMRz3kqkEPEW6HiKC/P2x6iOwvkJ7U5mxnTYhEbLGbg9qOGKuRCmw63cmoeSC7S
	armUGgwG/936L3zuZnL7CBXmWXPygjSezqAszagI8PQIr9Bowc3/xPQWDh/pnnDKl0465s4oHERtw
	0LADPtHGhWBhdhyrrKaRA5P+3d17aAptNqXca4b3o9Ll5oQCqSMD7Aj8jx/GENt3Y+d6teFHhZxcS
	i12eYUj+DnLGIbh+GU+GyOsRtFRREY77FR+dfdbcZAKw5XGeHTs8BBmURUESOgRAwKFgzL0jlqwza
	B7NWwqiYmUUT/ySv8PyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JKC-0000000DKZG-1mcE;
	Mon, 13 Oct 2025 14:14:56 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JK8-0000000DKUF-3yuR
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:14:54 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-579d7104c37so5206791e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364890; x=1760969690; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4+LqH67jKM/F3LSKb9pvwKSduKssNZljIxm4L3nejxY=;
        b=FMCffsP0BYAx/afMhAn0/9Ac8I5mXYMCm/rLYd4COjQEufCt+HwbecXcFElzSq6Vh0
         KrjOWnl5IOrt6cbiCQuNOmdPSV1qYLwJsWunycKHkLLM1N20f2I6XmesMGAqT9QQ/cbp
         qqBQCx6J6gSdSNm6exPGHIw3NkbgRvtp9JzLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364890; x=1760969690;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+LqH67jKM/F3LSKb9pvwKSduKssNZljIxm4L3nejxY=;
        b=afgAPAkdPBIcBgYUhGwqj9JgjKL3fRJ5MaQoHMzWsxTXvkIuJZ3m/rVK2q9dSfjzdW
         zHdm0WN1oF5BCHdUkJEpNG504maBsYJEt4yG0WbQl1Y+nYRJUr1gr7WEKuHAM5hdgMh/
         9r8Er4CvDSGSEc+SrMlj0X5Bo3ccHLK+V8/cpt0pGh9JHqTyA96vRvScclh+tWcWbxNM
         owmk7TtE2rI8eIt5iNmPAR4wVEMq0dICp7LvgVRpwBfGoIsrin1/neQfBVpj6s7Ms8qH
         e1U4NX/R5II6p9IfM66jXzfgZSym4q3mXQe1GKN8mpF6QtQUZycMqyBhTld9Qdfsy4io
         6m+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWS83NFZ57hI10A5Y+0weymqLSW6n7KuezIN+m9u50wWMkJQeuFyS+1PtN/C77h+9bNgzWhZ4adzCkE0sg8Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGZA7X3088VvxFwwK4b7MAok+hGLprbfK7sFCFKam+cors4R6e
	/kCDUVRYkd3A5Lo3zcxxgAb+5WMEo/1wWOUbHghmzkEEfRQuDD7Lm5mhI1xnG5/MLQ==
X-Gm-Gg: ASbGncvPzRhHRiJ0wXRs46PsB/y6Dk+RPzktHKV3IUDlMWW30LKdDe0nmMhW1MpKvZm
	NMBWMpQnuplNU2s83yXc+xUQzN+AkvVYmLtPTjK61wgyv21BThJmOhQiwkL8HCZOd5+1lTxoAd9
	zca9lzcWmLLnib4PI00vGGBbD3mvIvILvT56jpTjXNGxdYBSI5zPWudkzfrEwOr7tNL8W3QGbro
	Q2DdIz3PCHjijxt8FHlyFyGy5K6zGEypPF09dIPqyotszMzYy4XfuphVhvKwDpEOT6Vx0wLAEoF
	A8vRjNb96G0FpIs2hNFAqbEb7iB6LCC19EFy9JibZaLeQL8eif6Q40CO/ws3nlweegYPSO0IxBI
	gTzaAh8ZxsxAx/TQbrQk1/eYzdksH9uQvhpon9Rt/ezFhfba8GwIHA1HCKFs+UDhUzMD2NJ23Gk
	eSOr5lvBTRr3dKxQxNuCV867+TaAvH
X-Google-Smtp-Source: AGHT+IG+iBDcqiuo6CtjHJApPQk8SPIEd1S5IwUf4U1/yNdgttxsX0zixn6oQdpzKAlIqjeJyJH+pw==
X-Received: by 2002:a05:6512:1110:b0:590:656c:d114 with SMTP id 2adb3069b0e04-5906dae5d1bmr5995198e87.46.1760364890201;
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 00/32] media: Use %pe format specifier
Date: Mon, 13 Oct 2025 14:14:40 +0000
Message-Id: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFAJ7WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3YKSovjUoiJdy0RzSzOLtOQUQ8s0JaDqgqLUtMwKsEnRsbW1AKj
 z2DxZAAAA
X-Change-ID: 20251013-ptr_err-9a7968fcd19f
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
X-CRM114-CacheID: sfid-20251013_071453_022945_BCD1DFAB 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

The recently introduced test scripts/coccinelle/misc/ptr_err_to_pe.cocci
checks that we use %pe. Let's make it happy.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (32):
      Input: cyttsp5 - Use %pe format specifier
      media: dvbdev: Use %pe format specifier
      media: mn88443x: Use %pe format specifier
      media: adv7842: Use %pe format specifier
      media: ar0521: Use %pe format specifier
      media: ccs: Use %pe format specifier
      media: i2c: ds90ub913: Use %pe format specifier
      media: i2c: ds90ub953: Use %pe format specifier
      media: i2c: imx274: Use %pe format specifier
      media: i2c: imx335: Use %pe format specifier
      media: i2c: imx412: Use %pe format specifier
      media: i2c: max9286: Use %pe format specifier
      media: i2c: max96717: Use %pe format specifier
      media: i2c: mt9m111: Use %pe format specifier
      media: i2c: mt9v111: Use %pe format specifier
      media: i2c: ov5675: Use %pe format specifier
      media: i2c: ov5693: Use %pe format specifier
      media: i2c: ov9282: Use %pe format specifier
      media: rj54n1cb0c: Use %pe format specifier
      media: i2c: st-mipid02: Use %pe format specifier
      media: ipu-bridge: Use %pe format specifier
      media: ipu3-cio2: Use %pe format specifier
      media: ipu6: isys: Use %pe format specifier
      media: mediatek: vcodec: Use %pe format specifier
      media: imx8mq-mipi-csi2: Use %pe format specifier
      media: platform: rzg2l-cru: Use %pe format specifier
      media: renesas: vsp1: Use %pe format specifier
      media: rkisp1: Use %pe format specifier
      media: samsung: exynos4-is: Use %pe format specifier
      media: ti: cal Use %pe format specifier
      media: staging: ipu3-imgu: Use %pe format specifier
      media: staging/ipu7: Use %pe format specifier

 drivers/input/touchscreen/cyttsp5.c                          |  4 ++--
 drivers/media/dvb-core/dvbdev.c                              |  4 ++--
 drivers/media/dvb-frontends/mn88443x.c                       |  7 +++----
 drivers/media/i2c/adv7842.c                                  |  4 ++--
 drivers/media/i2c/ar0521.c                                   |  4 ++--
 drivers/media/i2c/ccs/ccs-core.c                             |  8 ++++----
 drivers/media/i2c/ds90ub913.c                                |  2 +-
 drivers/media/i2c/ds90ub953.c                                |  2 +-
 drivers/media/i2c/imx274.c                                   |  3 +--
 drivers/media/i2c/imx335.c                                   |  4 ++--
 drivers/media/i2c/imx412.c                                   |  4 ++--
 drivers/media/i2c/max9286.c                                  |  4 ++--
 drivers/media/i2c/max96717.c                                 |  2 +-
 drivers/media/i2c/mt9m111.c                                  |  4 ++--
 drivers/media/i2c/mt9v111.c                                  | 12 ++++++------
 drivers/media/i2c/ov5675.c                                   |  4 ++--
 drivers/media/i2c/ov5693.c                                   |  4 ++--
 drivers/media/i2c/ov9282.c                                   |  4 ++--
 drivers/media/i2c/rj54n1cb0c.c                               |  8 ++++----
 drivers/media/i2c/st-mipid02.c                               |  4 ++--
 drivers/media/pci/intel/ipu-bridge.c                         |  4 ++--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c                     |  4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c                |  4 ++--
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  4 ++--
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c                |  4 ++--
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c        |  8 ++++----
 drivers/media/platform/renesas/vsp1/vsp1_drv.c               |  3 +--
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c          |  4 ++--
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c          |  4 ++--
 drivers/media/platform/samsung/exynos4-is/media-dev.c        |  4 ++--
 drivers/media/platform/ti/cal/cal.c                          |  3 +--
 drivers/staging/media/ipu3/ipu3.c                            |  3 +--
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c               |  4 ++--
 drivers/staging/media/ipu7/ipu7-isys-csi2.c                  |  4 ++--
 34 files changed, 72 insertions(+), 77 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-ptr_err-9a7968fcd19f

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>



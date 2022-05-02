Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9656C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5JG+Q1zDv/81WoVmeaLMnNgaj2TxWXjMAM2bzzo7Nk=; b=rlmj3/80pL8t1w
	WPA4lnL2sCw+YklDjMMHZAj0gvRZ+hnJ7Lx0Sz7lfIKwMLuAcmQz/PPAL5eP4J6fAYjmz4QXXnnab
	BhbfozfA7XiKkJSrUJBYHCyUS0wJmlXN56azfZ/EQD84Zktl0VIxacsOAAhnOAd/E4P15n7qciRsK
	FT1WxbEXJvBL3bknBtRriJia+FeIewBdGU6iI1Xt8vpRcrP9y9pO3TrQWtk6ONHWmA0t3emo5zQSP
	BvllNpPKzyDrge5yKIxb5oGTBIiQLN1ZpoHuquXmXpiTia0/zlB2EbKwn3VOC4op3352QtSD6DAuI
	8sMX8Dayo2X/o/IYSUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlRk5-000Shc-0O; Mon, 02 May 2022 08:49:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlRk0-000SeI-52
 for linux-mediatek@lists.infradead.org; Mon, 02 May 2022 08:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651481351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zqT+Zv/sTFZb4ORqIiaxu9+mW23ZhJ+5Iqax9Traq1U=;
 b=Af+9UBHvjC4VNWzAtJisktdpncPEYwQePXNjEaJoeMWVaBX9zV+Okxaya70otDklMUQ4UJ
 Q4LNGawZdbEHdgI/lrbYq+vYdFSLHL2EyZB37PMfmPJSmFmmGY9IPD6I4EnZYmVZPvoYkK
 ust2ll/wI6UpMneXQLpXbBoNpTiRffc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-nuDvq_nnNpCm3rfwNjCR9Q-1; Mon, 02 May 2022 04:49:10 -0400
X-MC-Unique: nuDvq_nnNpCm3rfwNjCR9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 125-20020a1c0283000000b003928cd3853aso9586527wmc.9
 for <linux-mediatek@lists.infradead.org>; Mon, 02 May 2022 01:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zqT+Zv/sTFZb4ORqIiaxu9+mW23ZhJ+5Iqax9Traq1U=;
 b=Z9tI7rOopgbmqGFgG4RX+LQytf4cOwzF9V44tHm2GN+IiWAhn6gI0YYXqGune0wQvo
 4UE17F72J4wSk55xETYzP5Fje09TnLua9OMIwYvtdzEW3yVEooaKoLWGjnBfc/AKT2DA
 k219F+xYXJEHdDRtZvTByoc6QDFNXLBBXwehUkozNlbTIck/fiXpV4x7EX+0ueuMCbj4
 rBjr9uwd6dkvf9e+m6NILOYM44TAhecm6JH5O0u049MkttMjOgojFPGsIgJMwoQFugaQ
 W8rP8KGcKlsmB4pEwuwPPUNkALuqcPln6qGs5PLcgyO7XhtbYvULzKTW9lwyK0xhFtoC
 W8ow==
X-Gm-Message-State: AOAM532VJNDlaaf4hSCw0ibDJMlzZOBPcDO8BTaNv1TjS1uVoSwyuvMI
 SMpWmG+szziYm68miR4KYGbTi98cNO1J3otFzrbFY9AzU7vZ4OtzbOC0pyhG1EFrM0uTAHqbfxg
 6N0jlJ/wwyabHhO6A2ZuuEdww1fqRRuTS
X-Received: by 2002:a5d:4989:0:b0:20a:c907:2110 with SMTP id
 r9-20020a5d4989000000b0020ac9072110mr8621541wrq.476.1651481348787; 
 Mon, 02 May 2022 01:49:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5KEpKOF5xwqEHsDpgLM4OfRzNuQQfMdJfkLawAy7fhmgXpJxlDccWOfuSvNh7jIPl0aT+4A==
X-Received: by 2002:a5d:4989:0:b0:20a:c907:2110 with SMTP id
 r9-20020a5d4989000000b0020ac9072110mr8621438wrq.476.1651481348343; 
 Mon, 02 May 2022 01:49:08 -0700 (PDT)
Received: from minerva.. ([90.167.94.74]) by smtp.gmail.com with ESMTPSA id
 i14-20020adfa50e000000b0020c5253d8c6sm8032307wrb.18.2022.05.02.01.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 01:49:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Alison Wang <alison.wang@nxp.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Brian Starkey <brian.starkey@arm.com>, Chen Feng <puck.chen@hisilicon.com>,
 Chen-Yu Tsai <wens@csie.org>, Chia-I Wu <olvaffe@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Evan Quan <evan.quan@amd.com>, Fabio Estevam <festevam@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Hao Fang <fanghao11@huawei.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Joel Stanley <joel@jms.id.au>,
 John Stultz <john.stultz@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Vasut <marex@denx.de>, Mario Limonciello <mario.limonciello@amd.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Paul Cercueil <paul@crapouillou.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Solomon Chiu <solomon.chiu@amd.com>, Stefan Agner <stefan@agner.ch>,
 Tian Tao <tiantao6@hisilicon.com>, Tomi Valkeinen <tomba@kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Yong Wu <yong.wu@mediatek.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 spice-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 2/3] drm/fb-helper: Rename preferred_bpp
 drm_fbdev_generic_setup() parameter
Date: Mon,  2 May 2022 10:48:29 +0200
Message-Id: <20220502084830.285639-3-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502084830.285639-1-javierm@redhat.com>
References: <20220502084830.285639-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_014912_456656_D03D4631 
X-CRM114-Status: GOOD (  21.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

By default the bits per pixel for the emulated framebuffer device is set
to dev->mode_config.preferred_depth, but some devices need another value.

Since this second parameter is only used by a few drivers, and to allow
drivers to use it for passing other configurations when registering the
fbdev, rename @preferred_bpp to @options and make it a multi-field param.

The DRM_FB_SET_OPTION() and DRM_FB_GET_OPTION() macros are provided for
drivers to set and get an option respectively. For now, only DRM_FB_BPP
option exists but other options would be added later.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c         |  6 ++++--
 drivers/gpu/drm/arm/hdlcd_drv.c                 |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c                |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c         |  2 +-
 drivers/gpu/drm/ast/ast_drv.c                   |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c    |  2 +-
 drivers/gpu/drm/drm_drv.c                       |  2 +-
 drivers/gpu/drm/drm_fb_helper.c                 | 16 ++++++++++++----
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       |  2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c             |  2 +-
 drivers/gpu/drm/imx/imx-drm-core.c              |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c       |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c                 |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  2 +-
 drivers/gpu/drm/meson/meson_drv.c               |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c               |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c               |  2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                   |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c           |  2 +-
 drivers/gpu/drm/sti/sti_drv.c                   |  2 +-
 drivers/gpu/drm/stm/drv.c                       |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c               |  2 +-
 drivers/gpu/drm/tidss/tidss_drv.c               |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c             |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                   |  2 +-
 drivers/gpu/drm/tiny/bochs.c                    |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c             |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c            |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                   |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c            |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c             |  2 +-
 include/drm/drm_fb_helper.h                     | 12 ++++++++++++
 33 files changed, 58 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index b03663f42cc9..f5fae3838cdc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2118,9 +2118,11 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	    !list_empty(&adev_to_drm(adev)->mode_config.connector_list)) {
 		/* select 8 bpp console on low vram cards */
 		if (adev->gmc.real_vram_size <= (32*1024*1024))
-			drm_fbdev_generic_setup(adev_to_drm(adev), 8);
+			drm_fbdev_generic_setup(adev_to_drm(adev),
+						DRM_FB_SET_OPTION(DRM_FB_BPP, 8));
 		else
-			drm_fbdev_generic_setup(adev_to_drm(adev), 32);
+			drm_fbdev_generic_setup(adev_to_drm(adev),
+						DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 	}
 
 	ret = amdgpu_debugfs_init(adev);
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index e89ae0ec60eb..636b0e989398 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -321,7 +321,7 @@ static int hdlcd_drm_bind(struct device *dev)
 	if (ret)
 		goto err_register;
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index d5aef21426cf..8f7c4f3136d5 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -863,7 +863,7 @@ static int malidp_bind(struct device *dev)
 	if (ret)
 		goto register_fail;
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 7780b72de9e8..c16837fd1f8d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -343,7 +343,7 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
-	drm_fbdev_generic_setup(&priv->drm, 32);
+	drm_fbdev_generic_setup(&priv->drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 	return 0;
 
 err_unload:
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 7465c4f0156a..813e9af00983 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -126,7 +126,7 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, 32);
+	drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 651e3c109360..e18dcd16ff8a 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -760,7 +760,7 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
-	drm_fbdev_generic_setup(ddev, 24);
+	drm_fbdev_generic_setup(ddev, DRM_FB_SET_OPTION(DRM_FB_BPP, 24));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..6695937945a5 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -324,7 +324,7 @@ void drm_minor_release(struct drm_minor *minor)
  *		if (ret)
  *			return ret;
  *
- *		drm_fbdev_generic_setup(drm, 32);
+ *		drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
  *
  *		return 0;
  *	}
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d265a73313c9..f626947bb9b9 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2501,8 +2501,16 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
 /**
  * drm_fbdev_generic_setup() - Setup generic fbdev emulation
  * @dev: DRM device
- * @preferred_bpp: Preferred bits per pixel for the device.
- *                 @dev->mode_config.preferred_depth is used if this is zero.
+ * @options: options for the registered framebuffer.
+ *
+ * The @options parameter is a multi-field parameter that can contain
+ * different options for the emulated framebuffer device registered.
+ *
+ * The options must be set using DRM_FB_SET_OPTION() and obtained using
+ * DRM_FB_GET_OPTION(). The options field are the following:
+ *
+ * * DRM_FB_BPP: bits per pixel for the device. If the field is not set,
+ *               @dev->mode_config.preferred_depth is used instead.
  *
  * This function sets up generic fbdev emulation for drivers that supports
  * dumb buffers with a virtual address and that can be mmap'ed.
@@ -2525,10 +2533,10 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
  *
  * The fbdev is destroyed by drm_dev_unregister().
  */
-void drm_fbdev_generic_setup(struct drm_device *dev,
-			     unsigned int preferred_bpp)
+void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int options)
 {
 	struct drm_fb_helper *fb_helper;
+	unsigned int preferred_bpp = DRM_FB_GET_OPTION(DRM_FB_BPP, options);
 	int ret;
 
 	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 7a503bf08d0f..7bd8129388f2 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -334,7 +334,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto put;
 
-	drm_fbdev_generic_setup(drm, legacyfb_depth);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, legacyfb_depth));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 2af51df6dca7..90aa59b77d31 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -237,7 +237,7 @@ static int kirin_drm_bind(struct device *dev)
 	if (ret)
 		goto err_kms_cleanup;
 
-	drm_fbdev_generic_setup(drm_dev, 32);
+	drm_fbdev_generic_setup(drm_dev, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 9b84df34a6a1..a4736ae85881 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -148,7 +148,7 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 	if (ret)
 		goto cleanup_crtc;
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return kms;
 
diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index a57812ec36b1..4151f9b1b645 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -251,7 +251,7 @@ static int imx_drm_bind(struct device *dev)
 	if (ret)
 		goto err_poll_fini;
 
-	drm_fbdev_generic_setup(drm, legacyfb_depth);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, legacyfb_depth));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 8eb0ad501a7b..9726c901677c 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1388,7 +1388,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		goto err_clk_notifier_unregister;
 	}
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index e601baa87e55..1382a818c66b 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -238,7 +238,7 @@ static int mcde_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto unbind;
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 247c6ff277ef..146f3f064e3e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -393,7 +393,7 @@ static int mtk_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto err_deinit;
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 1b70938cfd2c..76463b940349 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -350,7 +350,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (ret)
 		goto uninstall_irq;
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 9d71c55a31c0..5e4c8e15eca7 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -357,7 +357,7 @@ static int mxsfb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 520301b405f1..b9d1762051c8 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -308,7 +308,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	if (ret < 0)
 		goto dev_put;
 
-	drm_fbdev_generic_setup(drm, priv->variant->fb_bpp);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, priv->variant->fb_bpp));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 1cb6f0c224bb..fb7936bbdea8 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -122,7 +122,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto modeset_cleanup;
 
-	drm_fbdev_generic_setup(&qdev->ddev, 32);
+	drm_fbdev_generic_setup(&qdev->ddev, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 	return 0;
 
 modeset_cleanup:
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 957ea97541d5..c2c1523c5c47 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -681,7 +681,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 
 	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
 
-	drm_fbdev_generic_setup(&rcdu->ddev, 32);
+	drm_fbdev_generic_setup(&rcdu->ddev, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index d858209cf8de..7fa653b28233 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -200,7 +200,7 @@ static int sti_bind(struct device *dev)
 
 	drm_mode_config_reset(ddev);
 
-	drm_fbdev_generic_setup(ddev, 32);
+	drm_fbdev_generic_setup(ddev, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 0da7cce2a1a2..36301d93e566 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -203,7 +203,7 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put;
 
-	drm_fbdev_generic_setup(ddev, 16);
+	drm_fbdev_generic_setup(ddev, DRM_FB_SET_OPTION(DRM_FB_BPP, 16));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 275f7e4a03ae..2ec41525fe86 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -112,7 +112,7 @@ static int sun4i_drv_bind(struct device *dev)
 	if (ret)
 		goto finish_poll;
 
-	drm_fbdev_generic_setup(drm, 32);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 04cfff89ee51..83bcfdc6d654 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -180,7 +180,7 @@ static int tidss_probe(struct platform_device *pdev)
 		goto err_irq_uninstall;
 	}
 
-	drm_fbdev_generic_setup(ddev, 32);
+	drm_fbdev_generic_setup(ddev, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	dev_dbg(dev, "%s done\n", __func__);
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index eee3c447fbac..e342ea5031c8 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -384,7 +384,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 		goto init_failed;
 	priv->is_registered = true;
 
-	drm_fbdev_generic_setup(ddev, bpp);
+	drm_fbdev_generic_setup(ddev, DRM_FB_SET_OPTION(DRM_FB_BPP, bpp));
 	return 0;
 
 init_failed:
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index f0fa3b15c341..7f291db460e9 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -392,7 +392,7 @@ static int arcpgu_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
-	drm_fbdev_generic_setup(&arcpgu->drm, 16);
+	drm_fbdev_generic_setup(&arcpgu->drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 16));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index ed971c8bb446..fc52d9e7d50e 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -663,7 +663,7 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 	if (ret)
 		goto err_free_dev;
 
-	drm_fbdev_generic_setup(dev, 32);
+	drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 	return ret;
 
 err_free_dev:
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 6d9d2921abf4..737cebb655a0 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -226,7 +226,7 @@ static int tve200_probe(struct platform_device *pdev)
 	 * Passing in 16 here will make the RGB565 mode the default
 	 * Passing in 32 will use XRGB8888 mode
 	 */
-	drm_fbdev_generic_setup(drm, 16);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 16));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index f4f2bd79a7cb..fbe1f7368d53 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -79,7 +79,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto err_irq_fini;
 
-	drm_fbdev_generic_setup(&vbox->ddev, 32);
+	drm_fbdev_generic_setup(&vbox->ddev, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 162bc18e7497..ecd2b41b87b3 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -291,7 +291,7 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto unbind_all;
 
-	drm_fbdev_generic_setup(drm, 16);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 16));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 5f25a8d15464..ef1e1b6e8cac 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -128,7 +128,7 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 	if (ret)
 		goto err_deinit;
 
-	drm_fbdev_generic_setup(vdev->priv, 32);
+	drm_fbdev_generic_setup(vdev->priv, DRM_FB_SET_OPTION(DRM_FB_BPP, 32));
 	return 0;
 
 err_deinit:
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 824b510e337b..2937e72d9fac 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -135,7 +135,7 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 		goto err_poll_fini;
 
 	/* Initialize fbdev generic emulation. */
-	drm_fbdev_generic_setup(drm, 24);
+	drm_fbdev_generic_setup(drm, DRM_FB_SET_OPTION(DRM_FB_BPP, 24));
 
 	return 0;
 
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 3af4624368d8..1da3ef76f499 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -35,6 +35,7 @@ struct drm_fb_helper;
 #include <drm/drm_client.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
+#include <linux/bitfield.h>
 #include <linux/kgdb.h>
 
 enum mode_set_atomic {
@@ -42,6 +43,17 @@ enum mode_set_atomic {
 	ENTER_ATOMIC_MODE_SET,
 };
 
+#define DRM_FB_BPP_MASK GENMASK(7, 0)
+
+/* Using the GNU statement expression extension */
+#define DRM_FB_SET_OPTION(option, value)			\
+	({							\
+		WARN_ON(!FIELD_FIT(option##_MASK, value));	\
+		FIELD_PREP(option##_MASK, value);		\
+	})
+
+#define DRM_FB_GET_OPTION(option, word) FIELD_GET(option##_MASK, word)
+
 /**
  * struct drm_fb_helper_surface_size - describes fbdev size and scanout surface size
  * @fb_width: fbdev width
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

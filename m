Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1D3C3DA50
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jul 2024 06:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vHeVYfGqNabvibk/9w5FnJgNU6UmH7iNA5EQ4Ui4NI=; b=ZR2a5rDBtohTdfLmfvB5rHqi6W
	5lUM2xcyWkAkewKnbj551XxMYu5dXgz/MevTMzcBsh/z6Bsw88OGbiWmH+PYQGbFL6x7MctjKIemd
	wwSmesIHy1IS57uz3WgWkAHjRpBgTOc8+XC5Rc7WpRiew/JI7cmo8gzyT5g6GAbJ+xnMj9R0F/XGN
	b3nXwvHGe3MqFsNJHZQcRgYExuTHOZE2TTBVzGE6By9y74uwEuoXPyp6oix4bOVAuVBGSi/mIYjdl
	I4S60TdCIvE3Ycz4WXdn48BEPL4YpcB/pmo+p0daE5O0ar1Ehg5QCxtTbjE/IGzanxKvyzjsRaI0T
	3z9tk5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTFHY-000000062yu-3Ofe;
	Mon, 15 Jul 2024 06:33:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTFH7-000000062aE-2xSU
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Jul 2024 06:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+vHeVYfGqNabvibk/9w5FnJgNU6UmH7iNA5EQ4Ui4NI=; b=qvn3XVNHTjRIsSh0tJ0g47Cja7
	eKNKhY6yxOoXkI2VE+zse0TWJVSpmymPKex4mAT/THrVxccn8fbHUBbluBjkFJcL/Dc/RX0o81rrY
	83vwVSfpVwHxzQuIMdpHFAASB/UTAN24MYB+W2YVP0x+aPqC/1699CTCCahbNGCVowSDHvxyRZV28
	4mZEvB1xAPnwultZXbZL6qVGBWvJz0f5lVwYMvxCxY9V3vCpMSQ2Z36PBPGcmZAg788jbKgdhtE0Q
	GssD9LTbhZ6sMWbpqd5jgxRAtvgRgKKqS/XQV0l9qXmrk188vwRaoegIbk7rd6pYip5yHxo1DFUdt
	KVKpxbkg==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTFH2-00000001kNO-0f10
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jul 2024 06:33:28 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52ea5dc3c66so6049066e87.3
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jul 2024 23:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721025198; x=1721629998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vHeVYfGqNabvibk/9w5FnJgNU6UmH7iNA5EQ4Ui4NI=;
        b=yrnpl0D84KzCuM+++LDrPjLBW2Bh8XedrAJHLf0EcW/uAw5ySTvmvrIfgkDTjbL3nj
         nvSvp3hWYSMnS1d4UBDMnaH2WmsctP0J2M+pe9zAenNHwbul7b8poByfcm/OL+1ttfNd
         vMlf6eKUYO5p5l+GqljFe6y44PTuYPlAdQR25V+fz+X/FFWpExeeKIdUmwU82TefGdHm
         7ERfXQsbjav2d6dFdsoSikOmxe/lWUZRG9JEUp9MR94d/6B9FOdRuRj7ObzZe1wqMx9G
         kQGEg14Hahh1W3/RVT+e3rxWG9c6yhsXF9wD0h7ZoYZGBk6fYZOGx+DfrPo+eNvGDLdl
         mAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721025198; x=1721629998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vHeVYfGqNabvibk/9w5FnJgNU6UmH7iNA5EQ4Ui4NI=;
        b=SsR0c7ySdVTyQU7xrLM8NiAExWBM0H7knT+XI4hPc7VdZaJlMQQHnaZvdaZa4tuo8C
         7yt2JgOHGZ21sDazm0n5Jknv/qF6O/mWUR40ooxWhDdnasEDp+F6HnJ1HzHGKwKjaDfv
         nFZkeoH7aYAkgGKk5iAOjWddqYlzRHj9HL/EA6rcnODPjvZDtwJJSDbUvlwUL+yCqJlz
         q1GwutbJJxZNiVHiKetbkoFbEny2R73fgId04Lo5c1VDz92nwZK12qWYfjV3Lr/2OuGS
         SXXPs9+KjMxeDathPOcu/yzQv0ne6xR5Ey2/5sJjdNOqW6qwCVJAIxs5fYqsP8a46dMw
         AOBA==
X-Forwarded-Encrypted: i=1; AJvYcCUb0mfAPlAAqfPhdOGZ+7f+AmqmEoDBrpccdNAaF/FDKySaWYJP4/stOyD+UpG5+aIEYQGZfoVAL4RFpO5kCvPyk49GTnMl4E3Wc/h3Q/EXD4uY
X-Gm-Message-State: AOJu0YwtSWEI2boWjlPftd4LvWNaumjPvJfY9QNYbambYShmdpvyWCtL
	igfezY4/UhlHeBm2jFCc8JKjDhhYJSholFVw3XS5CmQ2jmBdytyEhO29Lt64Bs4=
X-Google-Smtp-Source: AGHT+IE0Vu1spcM/T87vZurqpzBRz3R7sEgYPkaXWB60TYbxXlOBRFUqmcDFh0xQL1oW+eKZujF6Og==
X-Received: by 2002:ac2:442e:0:b0:52c:e17c:cd7b with SMTP id 2adb3069b0e04-52eb999c2cfmr12589424e87.22.1721025198191;
        Sun, 14 Jul 2024 23:33:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24e188esm743543e87.47.2024.07.14.23.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 23:33:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 09:33:04 +0300
Subject: [PATCH v4 4/5] drm/bridge-connector: move to DRM_DISPLAY_HELPER
 module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-4-61e6417cfd99@linaro.org>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11672;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SO83gOuowWxufva1NS5CzakE3Qtikarrj4ZVUdAlLjs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmlMKo1zEhmDhqyXSJMESLI/Rju4KbuGbQa8mf3
 v4V90mZu0yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpTCqAAKCRCLPIo+Aiko
 1b+ZB/47ZtWAGzgu2zqokucxO4rkP1EQuDs+gU6ih1SNNSlN5xVS74lZfht1obZS1dAzdU8j0OU
 Rg+YtTnfecFTIdN5QmSKAp3/ShJNmr7luercUNhc+CnGOXe5lsLfHtLY8ka7vRL1hYyuBWgao34
 oWAhyB+Ot34pLaFffRv/OGkD5iDRxbC/2koEg3LW8QZp4/oEmFf9R3w+OFjIp4S55Bw0FG1ghae
 W1ScZk5QY4gSx3/fB0u6rpGBwbBB5gkkVQgtrfk2/CMRzMu+RKMtCvggHgMm9flbuFVCjvKCLRM
 iTZYl9B//pVf9x6i+rX0PIaN117B+oDphsYnbbChKkwkG/2j
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_073324_741483_94266CC0 
X-CRM114-Status: GOOD (  14.07  )
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

drm_bridge_connector is a "leaf" driver, belonging to the display
helper, rather than the "CRTC" drm_kms_helper module. Move the driver
to the drm/display and add necessary Kconfig selection clauses.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS                                          | 2 +-
 drivers/gpu/drm/Makefile                             | 1 -
 drivers/gpu/drm/bridge/Kconfig                       | 1 +
 drivers/gpu/drm/display/Kconfig                      | 5 +++++
 drivers/gpu/drm/display/Makefile                     | 2 ++
 drivers/gpu/drm/{ => display}/drm_bridge_connector.c | 0
 drivers/gpu/drm/imx/dcss/Kconfig                     | 2 ++
 drivers/gpu/drm/imx/lcdc/Kconfig                     | 2 ++
 drivers/gpu/drm/ingenic/Kconfig                      | 2 ++
 drivers/gpu/drm/kmb/Kconfig                          | 2 ++
 drivers/gpu/drm/mediatek/Kconfig                     | 2 ++
 drivers/gpu/drm/meson/Kconfig                        | 2 ++
 drivers/gpu/drm/msm/Kconfig                          | 1 +
 drivers/gpu/drm/omapdrm/Kconfig                      | 2 ++
 drivers/gpu/drm/renesas/rcar-du/Kconfig              | 2 ++
 drivers/gpu/drm/renesas/rz-du/Kconfig                | 2 ++
 drivers/gpu/drm/renesas/shmobile/Kconfig             | 2 ++
 drivers/gpu/drm/rockchip/Kconfig                     | 4 ++++
 drivers/gpu/drm/tegra/Kconfig                        | 1 +
 drivers/gpu/drm/tidss/Kconfig                        | 2 ++
 drivers/gpu/drm/xlnx/Kconfig                         | 1 +
 21 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb1df8c29f5a..5b5520ed57fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7463,8 +7463,8 @@ S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/
 F:	drivers/gpu/drm/bridge/
+F:	drivers/gpu/drm/display/drm_bridge_connector.c
 F:	drivers/gpu/drm/drm_bridge.c
-F:	drivers/gpu/drm/drm_bridge_connector.c
 F:	include/drm/drm_bridge.h
 F:	include/drm/drm_bridge_connector.h
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 68cc9258ffc4..fa432a1ac9e2 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -128,7 +128,6 @@ obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 drm_kms_helper-y := \
 	drm_atomic_helper.o \
 	drm_atomic_state_helper.o \
-	drm_bridge_connector.o \
 	drm_crtc_helper.o \
 	drm_damage_helper.o \
 	drm_encoder_slave.o \
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c621be1a99a8..3eb955333c80 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -390,6 +390,7 @@ config DRM_TI_SN65DSI86
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 9c2da1e48b75..8c174ceb0c4d 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -13,6 +13,11 @@ config DRM_DISPLAY_HELPER
 
 if DRM_DISPLAY_HELPER
 
+config DRM_BRIDGE_CONNECTOR
+	bool
+	help
+	  DRM connector implementation terminating DRM bridge chains.
+
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
 	select DRM_DISPLAY_DP_HELPER
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index a023f72fa139..629c834c3192 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -3,6 +3,8 @@
 obj-$(CONFIG_DRM_DISPLAY_DP_AUX_BUS) += drm_dp_aux_bus.o
 
 drm_display_helper-y := drm_display_helper_mod.o
+drm_display_helper-$(CONFIG_DRM_BRIDGE_CONNECTOR) += \
+	drm_bridge_connector.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
 	drm_dp_dual_mode_helper.o \
 	drm_dp_helper.o \
diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
similarity index 100%
rename from drivers/gpu/drm/drm_bridge_connector.c
rename to drivers/gpu/drm/display/drm_bridge_connector.c
diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
index 3ffc061d392b..59e3b6a1dff0 100644
--- a/drivers/gpu/drm/imx/dcss/Kconfig
+++ b/drivers/gpu/drm/imx/dcss/Kconfig
@@ -2,6 +2,8 @@ config DRM_IMX_DCSS
 	tristate "i.MX8MQ DCSS"
 	select IMX_IRQSTEER
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
 	depends on DRM && ARCH_MXC && ARM64
diff --git a/drivers/gpu/drm/imx/lcdc/Kconfig b/drivers/gpu/drm/imx/lcdc/Kconfig
index 7e57922bbd9d..9c28bb0f4662 100644
--- a/drivers/gpu/drm/imx/lcdc/Kconfig
+++ b/drivers/gpu/drm/imx/lcdc/Kconfig
@@ -3,5 +3,7 @@ config DRM_IMX_LCDC
       depends on DRM && (ARCH_MXC || COMPILE_TEST)
       select DRM_GEM_DMA_HELPER
       select DRM_KMS_HELPER
+      select DRM_DISPLAY_HELPER
+      select DRM_BRIDGE_CONNECTOR
       help
         Found on i.MX1, i.MX21, i.MX25 and i.MX27.
diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index 3db117c5edd9..8cd7b750dffe 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -8,6 +8,8 @@ config DRM_INGENIC
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select REGMAP
 	select REGMAP_MMIO
diff --git a/drivers/gpu/drm/kmb/Kconfig b/drivers/gpu/drm/kmb/Kconfig
index fd011367db1d..e5ae3ec52392 100644
--- a/drivers/gpu/drm/kmb/Kconfig
+++ b/drivers/gpu/drm/kmb/Kconfig
@@ -3,6 +3,8 @@ config DRM_KMB_DISPLAY
 	depends on DRM
 	depends on ARCH_KEEMBAY || COMPILE_TEST
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DSI
 	help
diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index d6449ebae838..417ac8c9af41 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -9,6 +9,8 @@ config DRM_MEDIATEK
 	depends on MTK_MMSYS
 	select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	select MEMORY
diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
index 615fdd0ce41b..2544756538cc 100644
--- a/drivers/gpu/drm/meson/Kconfig
+++ b/drivers/gpu/drm/meson/Kconfig
@@ -4,6 +4,8 @@ config DRM_MESON
 	depends on DRM && OF && (ARM || ARM64)
 	depends on ARCH_MESON || COMPILE_TEST
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_DISPLAY_CONNECTOR
 	select VIDEOMODE_HELPERS
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 420385c47193..94d3ed4f7761 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -17,6 +17,7 @@ config DRM_MSM
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index 6c49270cb290..0c6d5afc1ef4 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -4,6 +4,8 @@ config DRM_OMAP
 	depends on DRM && OF
 	depends on ARCH_OMAP2PLUS
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	select VIDEOMODE_HELPERS
 	select HDMI
diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
index c17e7c50492c..025677fe88d3 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
@@ -5,6 +5,8 @@ config DRM_RCAR_DU
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
 	help
diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 5f0db2c5fee6..e1a6dd322caf 100644
--- a/drivers/gpu/drm/renesas/rz-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
@@ -6,6 +6,8 @@ config DRM_RZG2L_DU
 	depends on VIDEO_RENESAS_VSP1
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select VIDEOMODE_HELPERS
 	help
 	  Choose this option if you have an RZ/G2L alike chipset.
diff --git a/drivers/gpu/drm/renesas/shmobile/Kconfig b/drivers/gpu/drm/renesas/shmobile/Kconfig
index 027220b8fe1c..c329ab8a7a8b 100644
--- a/drivers/gpu/drm/renesas/shmobile/Kconfig
+++ b/drivers/gpu/drm/renesas/shmobile/Kconfig
@@ -5,6 +5,8 @@ config DRM_SHMOBILE
 	depends on ARCH_RENESAS || ARCH_SHMOBILE || COMPILE_TEST
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
 	help
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 7df875e38517..23c49e91f1cc 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -86,6 +86,8 @@ config ROCKCHIP_LVDS
 	bool "Rockchip LVDS support"
 	depends on DRM_ROCKCHIP
 	depends on PINCTRL && OF
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  Choose this option to enable support for Rockchip LVDS controllers.
 	  Rockchip rk3288 SoC has LVDS TX Controller can be used, and it
@@ -96,6 +98,8 @@ config ROCKCHIP_RGB
 	bool "Rockchip RGB support"
 	depends on DRM_ROCKCHIP
 	depends on PINCTRL
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  Choose this option to enable support for Rockchip RGB output.
 	  Some Rockchip CRTCs, like rv1108, can directly output parallel
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 782f51d3044a..e688d8104652 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -8,6 +8,7 @@ config DRM_TEGRA
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/tidss/Kconfig b/drivers/gpu/drm/tidss/Kconfig
index 378600806167..2385c56493b9 100644
--- a/drivers/gpu/drm/tidss/Kconfig
+++ b/drivers/gpu/drm/tidss/Kconfig
@@ -3,6 +3,8 @@ config DRM_TIDSS
 	depends on DRM && OF
 	depends on ARM || ARM64 || COMPILE_TEST
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	help
 	  The TI Keystone family SoCs introduced a new generation of
diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index 68ee897de9d7..626e5ac4c33d 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -8,6 +8,7 @@ config DRM_ZYNQMP_DPSUB
 	select DMA_ENGINE
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select GENERIC_PHY

-- 
2.39.2



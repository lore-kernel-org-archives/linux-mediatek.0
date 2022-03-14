Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D3CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 17:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bZtyj8u4Up4qejmdYzhUEZx8MimQ1S5WeK6TsGwiVw=; b=QFgq1PsM8n+t+A
	w6mmnb72dUqA/e9EpjH0c7Ir/oyO4TRAxjZ++o0TwXd4IjTyhjSdMAVUXgvgmH/4PxLMK74MCPhHC
	EjgNWFMNFwfM3PBOrqDG/Yg/NBwbY4hO3ZnBdB+9hUdHX7yuWo0dWFrkXMFHRi1ch7/RG22Z8pnCl
	BFjPkoV5oS69VbVRwNc229yuo7S1F/gr/5pxk21QrB17lRrRG9gQXcHHSeoDfhpiA98i7lesdfq4W
	/CWO6P7iESBJQzNtmaIfvNMMOfhrr0/M46ITCEtr4ouyQscYgIObTcspAGXTEkNJ2p+W/TNQK0y13
	MvEWtACi5ll27mKmzh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nToBR-006Gje-4o; Mon, 14 Mar 2022 17:08:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTo1b-006Cfr-Sc; Mon, 14 Mar 2022 16:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tyTITQTXCRG11vsJNkL6L8wS7cq174I1YX7L53Y1x5Y=; b=MpIVgd+2cRVKutUKbB2rfwtq1r
 05BzyFYpBi2XerUCYuhLxgDaBzYdY814AQWcz4Sw3OdkX19hbmW0IGPpZrX+jsxI9IebCq0C8rScH
 gBHRbeFsn68u4/kBAT21UbiwZ+eK7RgKeQjMIqFl6YBP8wVnNXlqKlkpEZ3zHlUpUWvd/nQrqk++T
 S53bnIrKZ4ybJdX4g11eB+DAYBcNWhnNvz9akmkh90msvu6oOLpwt7gYR4RlqohReoIGW7EDWha3T
 Pvnxda8G54qdXUo56qCxRDHy+sZTS2GRQXiBeJvL5vywvDTlQ2qVVxJ4WaRMCei5WiaQKodAw/Azr
 zmgm1VBA==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTnfC-004DQJ-Gq; Mon, 14 Mar 2022 16:35:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F5C2B80EC5;
 Mon, 14 Mar 2022 16:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08178C36B10;
 Mon, 14 Mar 2022 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647275710;
 bh=8JpXjjyF24k0hF8LjOuHvMt2VTG3d3BfEFsLdEg6D6g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S3OS2Ebm9WtiiKclLtao7kn7ub+rGbGD5uH7aEl1BXP4NyWTFMby0rUEKJ5ZqY3nJ
 Z0ZIJQE4TIjhobmt5LXe7oOe1OrJLAymsr/r0bwYKqZ8+r2Gyw8KxTfvCHKdIsflIQ
 Zwn4W0I2knPabgs5XDzRXoCalyhMYFbyldjsY55NXSsEe+V1vZZ2MYdIW2j1vEuO8K
 /YQZR53hADTKZsk2uI9SHnGK65TocUfv3gq2lZ9EE+2ELBAyR/t8+a+nLN0pG5rBKU
 hmnpsbPk9oYBV068MZRXFPNElNoNfxvd2Q51IQREZ/1vMURyJoO4lWcHNTM3cZaAaY
 EVY5rL/Ws11Og==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTnf1-001x4d-PI; Mon, 14 Mar 2022 17:35:07 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Jeffery <andrew@aj.id.au>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Eddie James <eajames@linux.ibm.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Heiko Stuebner <heiko@sntech.de>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Jacopo Mondi <jacopo@jmondi.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org
Subject: [PATCH v2 64/67] media: platform/*/Kconfig: make manufacturer menus
 more uniform
Date: Mon, 14 Mar 2022 17:34:59 +0100
Message-Id: <4a598f62a03bd0e48f0be36cf32829291392cca8.1647274407.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647274406.git.mchehab@kernel.org>
References: <cover.1647274406.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_163518_612864_AEDA9FA2 
X-CRM114-Status: GOOD (  16.41  )
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

Do some adjustments at the per-vendor Kconfig, adding a comment at
the beginning in order to identify the manufacturer, and adjust
a few entries to make them look more uniform.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

 drivers/media/platform/allegro-dvt/Kconfig |  3 +++
 drivers/media/platform/amlogic/Kconfig     |  3 +++
 drivers/media/platform/aspeed/Kconfig      |  3 +++
 drivers/media/platform/atmel/Kconfig       |  3 +++
 drivers/media/platform/cadence/Kconfig     | 13 +------------
 drivers/media/platform/chips-media/Kconfig |  3 +++
 drivers/media/platform/intel/Kconfig       |  3 +++
 drivers/media/platform/marvell/Kconfig     |  3 +++
 drivers/media/platform/mediatek/Kconfig    |  3 +++
 drivers/media/platform/nvidia/Kconfig      |  3 +++
 drivers/media/platform/nxp/Kconfig         | 22 +++++-----------------
 drivers/media/platform/qcom/Kconfig        |  2 ++
 drivers/media/platform/renesas/Kconfig     |  2 ++
 drivers/media/platform/rockchip/Kconfig    |  3 +++
 drivers/media/platform/samsung/Kconfig     |  3 +++
 drivers/media/platform/stm/Kconfig         |  2 ++
 drivers/media/platform/via/Kconfig         |  3 +++
 drivers/media/platform/xilinx/Kconfig      |  7 +++----
 18 files changed, 51 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
index dd528e9d0958..674d234be5de 100644
--- a/drivers/media/platform/allegro-dvt/Kconfig
+++ b/drivers/media/platform/allegro-dvt/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Allegro DVT drivers"
+
 config VIDEO_ALLEGRO_DVT
 	tristate "Allegro DVT Video IP Core"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
index c67e00df6202..c1376ec1fe23 100644
--- a/drivers/media/platform/amlogic/Kconfig
+++ b/drivers/media/platform/amlogic/Kconfig
@@ -1,2 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Amlogic drivers"
+
 source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
diff --git a/drivers/media/platform/aspeed/Kconfig b/drivers/media/platform/aspeed/Kconfig
index 5025e892844c..153e3e5381d5 100644
--- a/drivers/media/platform/aspeed/Kconfig
+++ b/drivers/media/platform/aspeed/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Aspeed drivers"
+
 config VIDEO_ASPEED
 	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
index 5122290729ae..cef12629f4ef 100644
--- a/drivers/media/platform/atmel/Kconfig
+++ b/drivers/media/platform/atmel/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Atmel drivers"
+
 config VIDEO_ATMEL_ISC
 	tristate "ATMEL Image Sensor Controller (ISC) support"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
index 79a7e9fb2575..3ae6f4e51eec 100644
--- a/drivers/media/platform/cadence/Kconfig
+++ b/drivers/media/platform/cadence/Kconfig
@@ -1,15 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config VIDEO_CADENCE
-	bool "Cadence Video Devices"
-	depends on V4L_PLATFORM_DRIVERS
-	help
-	  If you have a media device designed by Cadence, say Y.
 
-	  Note that this option doesn't include new drivers in the kernel:
-	  saying N will just cause Kconfig to skip all the questions about
-	  Cadence media devices.
-
-if VIDEO_CADENCE
+comment "Cadence drivers"
 
 config VIDEO_CADENCE_CSI2RX
 	tristate "Cadence MIPI-CSI2 RX Controller"
@@ -34,5 +25,3 @@ config VIDEO_CADENCE_CSI2TX
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called cdns-csi2tx.
-
-endif
diff --git a/drivers/media/platform/chips-media/Kconfig b/drivers/media/platform/chips-media/Kconfig
index ae495fd7b25a..adf466a05699 100644
--- a/drivers/media/platform/chips-media/Kconfig
+++ b/drivers/media/platform/chips-media/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Chips&Media drivers"
+
 config VIDEO_CODA
 	tristate "Chips&Media Coda multi-standard codec IP"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/intel/Kconfig b/drivers/media/platform/intel/Kconfig
index aeda421f7248..8a730d9bcf52 100644
--- a/drivers/media/platform/intel/Kconfig
+++ b/drivers/media/platform/intel/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Intel drivers"
+
 config VIDEO_PXA27x
 	tristate "PXA27x Quick Capture Interface driver"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/marvell/Kconfig b/drivers/media/platform/marvell/Kconfig
index bfe655b2cedd..626e0673f12c 100644
--- a/drivers/media/platform/marvell/Kconfig
+++ b/drivers/media/platform/marvell/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Marvell drivers"
+
 config VIDEO_CAFE_CCIC
 	tristate "Marvell 88ALP01 (Cafe) CMOS Camera Controller support"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
index 6d74839df3d6..aa79626088ec 100644
--- a/drivers/media/platform/mediatek/Kconfig
+++ b/drivers/media/platform/mediatek/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Mediatek drivers"
+
 source "drivers/media/platform/mediatek/mtk-jpeg/Kconfig"
 source "drivers/media/platform/mediatek/mtk-mdp/Kconfig"
 source "drivers/media/platform/mediatek/mtk-vcodec/Kconfig"
diff --git a/drivers/media/platform/nvidia/Kconfig b/drivers/media/platform/nvidia/Kconfig
index 1162e272b5f9..597402090680 100644
--- a/drivers/media/platform/nvidia/Kconfig
+++ b/drivers/media/platform/nvidia/Kconfig
@@ -1,2 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "NVidia drivers"
+
 source "drivers/media/platform/nvidia/tegra-vde/Kconfig"
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index df52d32ebe50..44a0d7c38936 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -2,20 +2,10 @@
 
 # V4L drivers
 
-menuconfig VIDEO_IMX
-	bool "V4L2 capture drivers for NXP i.MX devices"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on ARCH_MXC || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
-	help
-	  Say yes here to enable support for capture drivers on i.MX SoCs.
-	  Support for the single SoC features are selectable in the sub-menu
-	  options.
-
-if VIDEO_IMX
+comment "NXP drivers"
 
 config VIDEO_IMX_MIPI_CSIS
-	tristate "MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
+	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
@@ -24,10 +14,8 @@ config VIDEO_IMX_MIPI_CSIS
 	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
 	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
 
-endif # VIDEO_IMX
-
 config VIDEO_VIU
-	tristate "Freescale/NXP VIU Video Driver"
+	tristate "NXP VIU Video Driver"
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_V4L2 && (PPC_MPC512x || COMPILE_TEST) && I2C
 	select VIDEOBUF_DMA_CONTIG
@@ -42,7 +30,7 @@ config VIDEO_VIU
 # mem2mem drivers
 
 config VIDEO_IMX_PXP
-	tristate "i.MX Pixel Pipeline (PXP)"
+	tristate "NXP i.MX Pixel Pipeline (PXP)"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV && VIDEO_V4L2 && (ARCH_MXC || COMPILE_TEST)
 	select VIDEOBUF2_DMA_CONTIG
@@ -52,7 +40,7 @@ config VIDEO_IMX_PXP
 	  color space conversion, and rotation.
 
 config VIDEO_MX2_EMMAPRP
-	tristate "Freescale/NXP MX2 eMMa-PrP support"
+	tristate "NXP MX2 eMMa-PrP support"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on SOC_IMX27 || COMPILE_TEST
diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
index 9f6c91cc95ca..4a89587e932d 100644
--- a/drivers/media/platform/qcom/Kconfig
+++ b/drivers/media/platform/qcom/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+comment "Qualcomm drivers"
+
 source "drivers/media/platform/qcom/camss/Kconfig"
 source "drivers/media/platform/qcom/venus/Kconfig"
diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platform/renesas/Kconfig
index 3f35f1b5106d..2e3a66ea95bd 100644
--- a/drivers/media/platform/renesas/Kconfig
+++ b/drivers/media/platform/renesas/Kconfig
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+comment "Renesas drivers"
+
 # V4L drivers
 
 config VIDEO_RCAR_ISP
diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
index 2f97c0e0268a..4351e3258d14 100644
--- a/drivers/media/platform/rockchip/Kconfig
+++ b/drivers/media/platform/rockchip/Kconfig
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Rockchip drivers"
+
 source "drivers/media/platform/rockchip/rga/Kconfig"
 source "drivers/media/platform/rockchip/rkisp1/Kconfig"
diff --git a/drivers/media/platform/samsung/Kconfig b/drivers/media/platform/samsung/Kconfig
index 94f30c1bca9b..c187cefbec5a 100644
--- a/drivers/media/platform/samsung/Kconfig
+++ b/drivers/media/platform/samsung/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "Samsung drivers"
+
 source "drivers/media/platform/samsung/exynos-gsc/Kconfig"
 source "drivers/media/platform/samsung/exynos4-is/Kconfig"
 source "drivers/media/platform/samsung/s3c-camif/Kconfig"
diff --git a/drivers/media/platform/stm/Kconfig b/drivers/media/platform/stm/Kconfig
index 27942626a630..58cbb6b888bf 100644
--- a/drivers/media/platform/stm/Kconfig
+++ b/drivers/media/platform/stm/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+comment "STMicroelectronics drivers"
+
 source "drivers/media/platform/stm/sti/Kconfig"
 source "drivers/media/platform/stm/stm32/Kconfig"
diff --git a/drivers/media/platform/via/Kconfig b/drivers/media/platform/via/Kconfig
index 1dcf789dce96..f4f4293cf25c 100644
--- a/drivers/media/platform/via/Kconfig
+++ b/drivers/media/platform/via/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+comment "VIA drivers"
+
 config VIDEO_VIA_CAMERA
 	tristate "VIAFB camera controller support"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/platform/xilinx/Kconfig
index a9531d5efd50..47f1eeb5d669 100644
--- a/drivers/media/platform/xilinx/Kconfig
+++ b/drivers/media/platform/xilinx/Kconfig
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+comment "Xilinx drivers"
+
 config VIDEO_XILINX
 	tristate "Xilinx Video IP (EXPERIMENTAL)"
 	depends on V4L_PLATFORM_DRIVERS
@@ -11,9 +13,8 @@ config VIDEO_XILINX
 	help
 	  Driver for Xilinx Video IP Pipelines
 
-if VIDEO_XILINX
-
 config VIDEO_XILINX_CSI2RXSS
+	depends on VIDEO_XILINX
 	tristate "Xilinx CSI-2 Rx Subsystem"
 	help
 	  Driver for Xilinx MIPI CSI-2 Rx Subsystem. This is a V4L sub-device
@@ -32,5 +33,3 @@ config VIDEO_XILINX_VTC
 	depends on VIDEO_XILINX
 	help
 	   Driver for the Xilinx Video Timing Controller
-
-endif #VIDEO_XILINX
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

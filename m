Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B11C35273
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 07:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjESqkY1lCTfdl1bAJmWB2xd/ctKamOWSgvx9x5tzG4=; b=ZAybnFng5wd3f5
	G0CbHUAir64x2UWOsT8a5wG8yC20L8EOABAbDfv94/kAxj/JGiWGdkX+EQfhzjpDVHa8TzFESAuHZ
	Blnwt6fhb8TzkK3gNaEdoItSr11uvwVii2DFM9m4kHv/6O2kDlGZnT4n8bVbAwj6ySgCmR/8aIbjQ
	XiDLhuJ+ISQCuNdzwpGrH6vQnPzAiPvdT4yOG2nkfYat6qaRGCZx6/3iqLhnKEsSrHoB3QiMCdyv1
	Jla29aBOhBV8I48/YPrYVAkurc6l+AB7/5gMS6FcDCPu2AZ5647US6Fpss9/yk8NOxQ4aksveGyN5
	C+Gj2Noyb0kpF/qWNT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTfZR-004FsP-9A; Mon, 14 Mar 2022 07:56:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfYh-004FYD-M1; Mon, 14 Mar 2022 07:56:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4205F61197;
 Mon, 14 Mar 2022 07:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AEAC34110;
 Mon, 14 Mar 2022 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647244561;
 bh=TFsfQFdGOSp/d2PY6RK1+XJEsuW1EnlOtXk3B099kBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VX/jvbS7nV2e0TlzfwCiVHIzl0joaQ35X/MHYCHIN3bjM9xe2Tszss55sZ1UQNCKV
 0Q92u6BvqClo5apTNzTQ/E4pGgUo2A51NctP+/TWyGt2AmZA+9wnoW/dHmHkUj8E+k
 +BSFPi5DC/liMM0F7aleBJO/0j7tXnvFiwEtpwHa1mIKhTssFz6Uwu2i1Rm0x88lZ1
 VA2u5+6GvK1sg1fgLpooFbZxW7ztH4EXm5CUpUl5eH6Pl4MH4J8o8+xA5VpaqHV6Q7
 Ierpr5QlCyuj0ADWODYbrtNgiyiX/JHlEszH/czm/yNgn66ID7tmLZlL74oCDHGOXv
 YzmO62TwICfNw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTfYd-001kVH-1t; Mon, 14 Mar 2022 08:55:59 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Dmitry Osipenko <digetx@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 17/64] media: platform: mtk-mdp: move config to its own file
Date: Mon, 14 Mar 2022 08:55:09 +0100
Message-Id: <ae30b7f5d43c6d9f25137dc7c46009a42cc52310.1647242579.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647242578.git.mchehab@kernel.org>
References: <cover.1647242578.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_005603_821040_99FC35DE 
X-CRM114-Status: GOOD (  16.46  )
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

In order to better organize the platform/Kconfig, place
mtk-mdp-specific config stuff on a separate Kconfig file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/64] at: https://lore.kernel.org/all/cover.1647242578.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig         | 18 +-----------------
 drivers/media/platform/mtk-mdp/Kconfig | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 17 deletions(-)
 create mode 100644 drivers/media/platform/mtk-mdp/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index f517aa951460..3b3d7af47ca1 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -49,6 +49,7 @@ source "drivers/media/platform/davinci/Kconfig"
 source "drivers/media/platform/exynos-gsc/Kconfig"
 source "drivers/media/platform/meson/ge2d/Kconfig"
 source "drivers/media/platform/mtk-jpeg/Kconfig"
+source "drivers/media/platform/mtk-mdp/Kconfig"
 source "drivers/media/platform/omap/Kconfig"
 
 source "drivers/media/platform/aspeed/Kconfig"
@@ -196,23 +197,6 @@ config VIDEO_MEDIATEK_VPU
 	    To compile this driver as a module, choose M here: the
 	    module will be called mtk-vpu.
 
-config VIDEO_MEDIATEK_MDP
-	tristate "Mediatek MDP driver"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on MTK_IOMMU || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
-	depends on ARCH_MEDIATEK || COMPILE_TEST
-	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
-	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_MEM2MEM_DEV
-	select VIDEO_MEDIATEK_VPU
-	help
-	    It is a v4l2 driver and present in Mediatek MT8173 SoCs.
-	    The driver supports for scaling and color space conversion.
-
-	    To compile this driver as a module, choose M here: the
-	    module will be called mtk-mdp.
-
 config VIDEO_MEDIATEK_VCODEC
 	tristate "Mediatek Video Codec driver"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/mtk-mdp/Kconfig b/drivers/media/platform/mtk-mdp/Kconfig
new file mode 100644
index 000000000000..0cc743165a1a
--- /dev/null
+++ b/drivers/media/platform/mtk-mdp/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_MEDIATEK_MDP
+	tristate "Mediatek MDP driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on MTK_IOMMU || COMPILE_TEST
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	select VIDEO_MEDIATEK_VPU
+	help
+	    It is a v4l2 driver and present in Mediatek MT8173 SoCs.
+	    The driver supports for scaling and color space conversion.
+
+	    To compile this driver as a module, choose M here: the
+	    module will be called mtk-mdp.
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

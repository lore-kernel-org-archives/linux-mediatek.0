Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD288C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 07:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1B3PPfhQFfyMWmFzaJLmxxH2esx9M6EZ0bG0IQqHpg=; b=nn8wjtKqDskrSz
	e6Z7HmKY57AV9YXmKWr6aD7bZz8iVTxgcZlYlCZYnVy/PAHdlfEnH6ALnaGhROJ6ya97qQ5G/CV0G
	ouR1YPwo5ukFE0wHYHeLwFTx80N0ky9Q22J51mSDxxsGO/p43sfH9lu5hUPBSwnBgqVB/6UrpMtem
	93OJmFqbJe68DuZbSDJEP/3kpgUzGW0JM7sgZ0MXlQamunj+RBORU3DWbZWycWgI/6EjotLs7VCDc
	oucVnzrGjfzmEdHaaLG7hjD2+fv9qBFGvo2k9yj1Cq4JKrfL7ZymKaOwncG7Q7AMoQo2+Oei2wF7c
	nr8oeDrF1OIx8PFJIQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTfbL-004GnG-UU; Mon, 14 Mar 2022 07:58:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfYk-004FcI-Vn; Mon, 14 Mar 2022 07:56:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8240F611B7;
 Mon, 14 Mar 2022 07:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F41AC3410F;
 Mon, 14 Mar 2022 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647244561;
 bh=h2oPKiOhkQOnumUdeyDJRnfkogJA7+jnEd2l+b1ekfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MaBb4LOGt7po3yDa+ua8Q8EZNPqnBdafzREASDBHBGvhGm3jlqZYqltVcIrxpKatb
 NfoC0FLkGiMLCJU1bGNfF6c/7/oLYOrnfD5GsJPOkHZs0D7NDyUFcwbYcS8mph4A/X
 y0WgUT/e2iGiRYSIBSqBOdyNutnoHjmMwMsAF6kUBFFuqUetV/whPo9Rrnz8hPgNbN
 wgK/sSN+Ins1dgUdEhJri3jvz0q4yOiKidQ7ykRq2GKJ1YAJYbT8aa18BimMByzW0t
 G3+mPWRIbEuSkWTHzpONTT5aLD1KmEPchbN6r/PNzgGOyU/I4RKxL8fLuVY/0/95UP
 VDhxA17LHFWBw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTfYd-001kVD-0c; Mon, 14 Mar 2022 08:55:59 +0100
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
Subject: [PATCH 16/64] media: platform: mtk-jpeg: move config to its own file
Date: Mon, 14 Mar 2022 08:55:08 +0100
Message-Id: <0eed3a494bdfcdefe2155a15c8ab2c916a003850.1647242579.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647242578.git.mchehab@kernel.org>
References: <cover.1647242578.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_005607_137262_8B5744E1 
X-CRM114-Status: GOOD (  15.53  )
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
mtk-jpeg-specific config stuff on a separate Kconfig file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/64] at: https://lore.kernel.org/all/cover.1647242578.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig          | 17 +----------------
 drivers/media/platform/mtk-jpeg/Kconfig | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 16 deletions(-)
 create mode 100644 drivers/media/platform/mtk-jpeg/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index d3b7bef19237..f517aa951460 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -48,6 +48,7 @@ source "drivers/media/platform/davinci/Kconfig"
 
 source "drivers/media/platform/exynos-gsc/Kconfig"
 source "drivers/media/platform/meson/ge2d/Kconfig"
+source "drivers/media/platform/mtk-jpeg/Kconfig"
 source "drivers/media/platform/omap/Kconfig"
 
 source "drivers/media/platform/aspeed/Kconfig"
@@ -181,22 +182,6 @@ config VIDEO_TI_CAL_MC
 
 # Mem2mem drivers
 
-config VIDEO_MEDIATEK_JPEG
-	tristate "Mediatek JPEG Codec driver"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on MTK_IOMMU_V1 || MTK_IOMMU || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
-	depends on ARCH_MEDIATEK || COMPILE_TEST
-	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
-	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_MEM2MEM_DEV
-	help
-	  Mediatek jpeg codec driver provides HW capability to decode
-	  JPEG format
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called mtk-jpeg
-
 config VIDEO_MEDIATEK_VPU
 	tristate "Mediatek Video Processor Unit"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/mtk-jpeg/Kconfig b/drivers/media/platform/mtk-jpeg/Kconfig
new file mode 100644
index 000000000000..72ed920b011a
--- /dev/null
+++ b/drivers/media/platform/mtk-jpeg/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_MEDIATEK_JPEG
+	tristate "Mediatek JPEG Codec driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on MTK_IOMMU_V1 || MTK_IOMMU || COMPILE_TEST
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	help
+	  Mediatek jpeg codec driver provides HW capability to decode
+	  JPEG format
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called mtk-jpeg
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

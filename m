Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA06EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+FBkYSa06mgKVO1q7xKUQkWi4NnQpcoNe1BDHAuXT0=; b=o0dyG9iTmVOqUW
	8bb2E7Vm1rnK3mwh1GxY6LMG5TYFVRwUqGf/CLCVydAA7bBgNUptgmUEN4pcdXgSYWWhvrGeme7dh
	l/+lQNKtZVUpDJ/MLkq8T16ZwZp0KGfKHXIrAgVgeR98Pxk1Ka8NHVHKKAXir4cAg34JIC25Jbyt7
	95VOaU3b6RTnMCz6pMLFVi++ml1/kOTK+1Q+OaavvqwtZc/DebZFBmaFwIY7gvaevHcz2xVG53ye6
	Y5TsRH6trzDUv3VVy3+8Ei2869BrENisf6oALR4qTt02VDVXQUV1PI6rt3XLsv+ONd4yPdA7+e5se
	SjuLz6/JgjcaVD97d60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSg3w-00Ghsh-Gj; Fri, 11 Mar 2022 14:16:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSfxd-00GeQA-6h; Fri, 11 Mar 2022 14:09:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EFE1B82C09;
 Fri, 11 Mar 2022 14:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734EEC36AE2;
 Fri, 11 Mar 2022 14:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647007777;
 bh=H/WtLlPvqonunkqsJM9/To1ZriYUO8O8KNV0Z6F0ADg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jiJgivGaCJyn7+92eS2UzaOSvTwQ2BChVPIVdlL+/Yh75QCZmG4ZvbVMCIJuMqti/
 A7SWYgHmdhECA42jAUKYgBRPkTdb5K7igCd7IuiQ8LbKPQlYzrjR0Tm6W3pBGHgdGD
 +iPrGvLnAsE/CsDmpmVnSBZFNToRN4UyV/1V+M4rhfx+tGb+HjyJFD8ilfX6ifq1yq
 Bns1HPvBblBRVfWcEGXn1Caeh1FpdQ4fusSa8cEtxKrYjCcOY/HeV+RngYuKCtae47
 PhTAHOlgIeWXSo5gQWYQhUWR4XBCwc34bf4FtCcEe1Wp+tp4SRAZlaty/3/unhxjaz
 UirqmHG+W7ujQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nSfxX-000lHN-6W; Fri, 11 Mar 2022 15:09:35 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Bin Liu <bin.liu@mediatek.com>, Dmitry Osipenko <digetx@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Rick Chang <rick.chang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 16/38] media: platform: mtk-jpeg: move config to its own
 file
Date: Fri, 11 Mar 2022 15:07:29 +0100
Message-Id: <b3e46789ac2e7cce2fcfef96749191f640a44fc2.1647006877.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647006877.git.mchehab@kernel.org>
References: <cover.1647006877.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_060941_562478_6A52C75E 
X-CRM114-Status: GOOD (  15.64  )
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
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/38] at: https://lore.kernel.org/all/cover.1647006877.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig          | 17 +----------------
 drivers/media/platform/mtk-jpeg/Kconfig | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 16 deletions(-)
 create mode 100644 drivers/media/platform/mtk-jpeg/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index da1fa4642bca..41162dcfafcc 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -55,6 +55,7 @@ source "drivers/media/platform/davinci/Kconfig"
 
 source "drivers/media/platform/exynos-gsc/Kconfig"
 source "drivers/media/platform/meson/ge2d/Kconfig"
+source "drivers/media/platform/mtk-jpeg/Kconfig"
 source "drivers/media/platform/omap/Kconfig"
 
 source "drivers/media/platform/aspeed/Kconfig"
@@ -192,22 +193,6 @@ config VIDEO_TI_CAL_MC
 
 source "drivers/media/platform/imx-jpeg/Kconfig"
 
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

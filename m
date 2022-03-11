Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EE9C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yX/lQI8oiCgxtIqFZEXQpUKDU9UsfS983onazy472MQ=; b=YLdh1S275DzpvI
	lsKZqVprlMu7Tq9GvRReJJXFpOLLgIIWYkQqM7GeIF0ArPDy8tXkBFlDEyJMKPFl8ORiEE1t6u+Ms
	HY4YrWNxCyeceuIZG1Gr/NB+wyBAl4wGRcVoqp2RLtkZx45Hwb7gJ+k2NJuAp1l7NYbJEfZqaGxcs
	LGs9lCHieX75ujm5Cc1gMQ2qD/cSTTXlhQSGFgrh9n7xcc5dm1z4JfJuZVm7r3oQkn7EfdhhckIuc
	2rCFlcrAc6rzir8+BYxJoXfyAxuvr7HQUQeZ5aAVrdaQkoyW4J1qlnbvJohS2tbd1uDayU3IItdP0
	Op9iuztQvHJ+M9rvKGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSg01-00Gfs8-3v; Fri, 11 Mar 2022 14:12:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSfxb-00GeOX-Jf; Fri, 11 Mar 2022 14:09:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 172CB61EEA;
 Fri, 11 Mar 2022 14:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0AEC34100;
 Fri, 11 Mar 2022 14:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647007777;
 bh=f6rVcnC4NQzIhGu0zc2CZYVuVZxuemnCqfneah5wGCc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nAHgHdUE4MR2wobRq8B5mp9TSRW+4vNhxY6xwptFcuOFkRehjjecSMPJK4v3ON11n
 9uiHAvqB+uvlFZJoXAaLVq/ujksbijaGKfKqj+13zYKyYoqSOklGkfRGSuja4sOvSw
 isyE1FSBOPIL0mclpUMQ/rPnkiQLDDBLFwU2Qks/AHIasZFMUEdx+C1qlOIyxQP001
 mMbSaoE/imG8Dk0eVNsHnpXqq567+YFe91zirCCfkStc5Sa6w3Xt9hSL7PyUQ1NBps
 sUubhTVV0VHDCG4wtR3fytJMAoBvG3TmVKjvkuQOxLJ4GklW77UV/w9Z5q5K6bCYhL
 iJVZ2SNLMfO9g==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nSfxX-000lHZ-CZ; Fri, 11 Mar 2022 15:09:35 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 19/38] media: platform: mtk-vpu: move config to its own file
Date: Fri, 11 Mar 2022 15:07:32 +0100
Message-Id: <6064dc98df604cbc70a6d58df471a74e78c03338.1647006877.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647006877.git.mchehab@kernel.org>
References: <cover.1647006877.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_060939_746859_59C8C88C 
X-CRM114-Status: GOOD (  16.24  )
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
mtk-vpu-specific config stuff on a separate Kconfig file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/38] at: https://lore.kernel.org/all/cover.1647006877.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig         | 15 +--------------
 drivers/media/platform/mtk-vpu/Kconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 14 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vpu/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 4553e7fc193c..1c6358d6fa89 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -58,6 +58,7 @@ source "drivers/media/platform/meson/ge2d/Kconfig"
 source "drivers/media/platform/mtk-jpeg/Kconfig"
 source "drivers/media/platform/mtk-mdp/Kconfig"
 source "drivers/media/platform/mtk-vcodec/Kconfig"
+source "drivers/media/platform/mtk-vpu/Kconfig"
 source "drivers/media/platform/omap/Kconfig"
 
 source "drivers/media/platform/aspeed/Kconfig"
@@ -195,20 +196,6 @@ config VIDEO_TI_CAL_MC
 
 source "drivers/media/platform/imx-jpeg/Kconfig"
 
-config VIDEO_MEDIATEK_VPU
-	tristate "Mediatek Video Processor Unit"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
-	depends on ARCH_MEDIATEK || COMPILE_TEST
-	help
-	    This driver provides downloading VPU firmware and
-	    communicating with VPU. This driver for hw video
-	    codec embedded in Mediatek's MT8173 SOCs. It is able
-	    to handle video decoding/encoding in a range of formats.
-
-	    To compile this driver as a module, choose M here: the
-	    module will be called mtk-vpu.
-
 config VIDEO_MEM2MEM_DEINTERLACE
 	tristate "Deinterlace support"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/mtk-vpu/Kconfig b/drivers/media/platform/mtk-vpu/Kconfig
new file mode 100644
index 000000000000..df679ea79ed0
--- /dev/null
+++ b/drivers/media/platform/mtk-vpu/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_MEDIATEK_VPU
+	tristate "Mediatek Video Processor Unit"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	    This driver provides downloading VPU firmware and
+	    communicating with VPU. This driver for hw video
+	    codec embedded in Mediatek's MT8173 SOCs. It is able
+	    to handle video decoding/encoding in a range of formats.
+
+	    To compile this driver as a module, choose M here: the
+	    module will be called mtk-vpu.
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

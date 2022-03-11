Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF3CC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 14:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MV3KXblKYD4gUrxAafgpnx87vRl0FVcTc2HxXNpTGpA=; b=xJlwXgPxwq9/ec
	hw63NoNE5bYc5SdBtDMtEh+ot6JKaXUJuQC9iK/mr9pr7UjmZRJrP8EMrhG3A6iBjx/ILOZuoiOTT
	mlG5YsMkstcjDNbAhhEjhQivAyHCz1t/FUVlsn/hkQPu8DGwfQ86Ori4v+QAd4kwwfNDLJv3c8Bpc
	RPN+VQlZ46yI99j0Bb4opjHfRa8nuOQsTqXvzZMpkMrpcuZk0lpfQy+ohs9PUAz5mfuVIEKwpfpFD
	VbDYUb44nOk8JI/f3qxCzWCLmhoJlindseoE+6+zN9jTNVACvwY/jYmTRfGp4zM8aQx+qQmVn736P
	7yEg+JAkP2jrWGZ319Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSfyW-00Gezj-Md; Fri, 11 Mar 2022 14:10:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSfxb-00GeNP-3Y; Fri, 11 Mar 2022 14:09:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BCD061EDE;
 Fri, 11 Mar 2022 14:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D073C340FF;
 Fri, 11 Mar 2022 14:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647007777;
 bh=zmjNlJhuJFaRKaa6ele8wIQsyiwuEBuYitOkpE9ulBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tTzKBaorwQsL1LqgCl7swLECbFcz509pkVbw8yrMXuJqVF6/xni9EoljrxzLGP9Ax
 7P0NKdhCFjL4EbpnxX44MdKT5ovS9lkXRnM9RRadfx3j/XGQH0wgpQWoLqbxaBDuOl
 lSzeuS/cRW7Pm1zCw4p2nzS0pEMudlF5auL9bI/rSaFP9WUbpFaUu/TbHzxxGKedYF
 yHhucTaO0tGuccH9v59TyeKF0SUzRDk4XlXPvocqIqwQ3VLcxYJR8atgU+n2VPG9wJ
 Ot5Ngnwf27wbYGjt+KFPW+QOToZG10RTbUzuZURl30hpzN9bOFb/epLhyrhORrSjXq
 wI7yE5ljTj9TQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nSfxX-000lHV-AI; Fri, 11 Mar 2022 15:09:35 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 18/38] media: platform: mtk-vcodec: move config to its own
 file
Date: Fri, 11 Mar 2022 15:07:31 +0100
Message-Id: <483c81e6d5127bd44e140dec4526b9c2d3107d6d.1647006877.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647006877.git.mchehab@kernel.org>
References: <cover.1647006877.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_060939_288542_31E49FB8 
X-CRM114-Status: GOOD (  17.74  )
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
mtk-vcodec-specific config stuff on a separate Kconfig file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/38] at: https://lore.kernel.org/all/cover.1647006877.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig            | 37 +----------------------
 drivers/media/platform/mtk-vcodec/Kconfig | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+), 36 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 00d77779ab0d..4553e7fc193c 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -57,6 +57,7 @@ source "drivers/media/platform/exynos-gsc/Kconfig"
 source "drivers/media/platform/meson/ge2d/Kconfig"
 source "drivers/media/platform/mtk-jpeg/Kconfig"
 source "drivers/media/platform/mtk-mdp/Kconfig"
+source "drivers/media/platform/mtk-vcodec/Kconfig"
 source "drivers/media/platform/omap/Kconfig"
 
 source "drivers/media/platform/aspeed/Kconfig"
@@ -208,42 +209,6 @@ config VIDEO_MEDIATEK_VPU
 	    To compile this driver as a module, choose M here: the
 	    module will be called mtk-vpu.
 
-config VIDEO_MEDIATEK_VCODEC
-	tristate "Mediatek Video Codec driver"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on MTK_IOMMU || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
-	depends on ARCH_MEDIATEK || COMPILE_TEST
-	depends on VIDEO_MEDIATEK_VPU || MTK_SCP
-	# The two following lines ensure we have the same state ("m" or "y") as
-	# our dependencies, to avoid missing symbols during link.
-	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
-	depends on MTK_SCP || !MTK_SCP
-	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
-	select VIDEOBUF2_DMA_CONTIG
-	select V4L2_MEM2MEM_DEV
-	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
-	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
-	select V4L2_H264
-	select MEDIA_CONTROLLER
-	select MEDIA_CONTROLLER_REQUEST_API
-	help
-	  Mediatek video codec driver provides HW capability to
-	  encode and decode in a range of video formats on MT8173
-	  and MT8183.
-
-	  Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
-	  also be selected. Support for MT8183 depends on MTK_SCP.
-
-	  To compile this driver as modules, choose M here: the
-	  modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
-
-config VIDEO_MEDIATEK_VCODEC_VPU
-	bool
-
-config VIDEO_MEDIATEK_VCODEC_SCP
-	bool
-
 config VIDEO_MEM2MEM_DEINTERLACE
 	tristate "Deinterlace support"
 	depends on V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/mtk-vcodec/Kconfig b/drivers/media/platform/mtk-vcodec/Kconfig
new file mode 100644
index 000000000000..635801a19d55
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/Kconfig
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_MEDIATEK_VCODEC_SCP
+	bool
+
+config VIDEO_MEDIATEK_VCODEC_VPU
+	bool
+
+config VIDEO_MEDIATEK_VCODEC
+	tristate "Mediatek Video Codec driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on MTK_IOMMU || COMPILE_TEST
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on VIDEO_MEDIATEK_VPU || MTK_SCP
+	# The two following lines ensure we have the same state ("m" or "y") as
+	# our dependencies, to avoid missing symbols during link.
+	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
+	depends on MTK_SCP || !MTK_SCP
+	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
+	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
+	select V4L2_H264
+	select MEDIA_CONTROLLER
+	select MEDIA_CONTROLLER_REQUEST_API
+	help
+	  Mediatek video codec driver provides HW capability to
+	  encode and decode in a range of video formats on MT8173
+	  and MT8183.
+
+	  Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
+	  also be selected. Support for MT8183 depends on MTK_SCP.
+
+	  To compile this driver as modules, choose M here: the
+	  modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

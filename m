Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAF9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 17:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ok8Nr1tpgQ+jUXVNHDBqtYf9XIz/HyPWQcP2CYNRDkY=; b=tsaFd08CyQdUiu
	Sj+zbqZoRI4eS5aeqJjSme6Jgb0ZLvodjTE2jExZLnzLBthXSSPpyYbWeHATw1f6MZ/6yop0oY/7a
	55CCGdxJ4JDEMUXVz3OSZ3YPkr5qxJxBJrNf54OlQ/rNOZxRg2SCqm3jRWt0+XKWImcDI1oWaSOM5
	EE4lbr8a2JzcqGJxxPv73iF0K0LFJsa1SsWxmaiL62BcdXYZZz/aRgrgOb8Hy66EZS5lnnbpXiDMe
	cAs96DsZCtJkH/rrLUCM4GLVjV92w3HXX7uxnKvuQG5UI3P6t7rcFpZaZ3fGeezsF5qjMjk6z85PH
	1qvzLz9a/7H/pKJMjvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nToBN-006GiN-5H; Mon, 14 Mar 2022 17:08:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTo1e-006Cfr-LB; Mon, 14 Mar 2022 16:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=HtDo48HrvpKtbsAmNPc346dCLrzvDMprT/nGUleojkA=; b=u2gSL2GvBuM7u2502lG5+KIpJ0
 4rlLzR1GjSKPYr8uSb7rbozclnhHufM8k/zmNV7lkgLSnQibWnFP0UDbovxDQUTKXJz1M80HQYzn2
 w1q/On1J43o5hjUyUXJn1RoNjSb6rSOkRS+ikLlKi9Om6gfI/MnjIftGtl2GMe7xRhPt2C3SINJ4q
 9/LY/ZGOSnhjKTSY6FJQ6kcUuWKXgKxCyrnqKKK00egGAVrDmifUkgPSxGPyx4IaWy7YdR3+PlNf+
 LA1a74SBoalZmCyO1nqED2nNL6iwycQKDF0RazLUzufn9tO89q9NGZM2hqnfDZurXr37etU25c0lT
 2j3rijMw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTnfB-004DOy-86; Mon, 14 Mar 2022 16:35:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E2DD761452;
 Mon, 14 Mar 2022 16:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E235C36B03;
 Mon, 14 Mar 2022 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647275707;
 bh=oR/Nqcf8uV2nNNdkbYKq+1DFuBdrsIdZT4cOwhjy4dk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ptmuRLEs3wsSnLiRNvUZ1PXi3FQm4MWbMq/SMJOg++sKPzZJtjXP9Yildc5p5Cm6l
 Rvn+/K5dhAo6z1+i4oYQMl9cq2UDtSQ/oy+YPibFO7/7fLu1QbKQyqLFSS1aeSfcHu
 GQvU8I4LWlGAJaAsOW8qfUiTYjkVzeDRRrtLvq8fiwg8oUyCNtzXlC0oZQZeG61AAN
 +ecOPn/1RbBOdztRLf+ZcGE353/WrM4URrKFKrWPecCGceDPPHWBIFnAXgwZr/IhEX
 +Zby3Ygp17AhancB3vWZLzlt8Xjk5l9xlL45NoZ4twLZE/Dx2bDWkpUDcG07zeJpJk
 QrGD/KOVLxz+g==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTnez-001wx9-3O; Mon, 14 Mar 2022 17:35:05 +0100
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
Subject: [PATCH v2 16/67] media: platform: mtk-jpeg: move config to its own
 file
Date: Mon, 14 Mar 2022 17:34:11 +0100
Message-Id: <d46abc044bbbab877446adb362d28794a67493ac.1647274406.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647274406.git.mchehab@kernel.org>
References: <cover.1647274406.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_163517_541475_2219324B 
X-CRM114-Status: GOOD (  14.22  )
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
See [PATCH v2 00/67] at: https://lore.kernel.org/all/cover.1647274406.git.mchehab@kernel.org/

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

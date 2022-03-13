Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69053C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Mar 2022 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TD3Qc1sjUlq6cDPUwqoQmEXoCvuGgxZgdNSSSdb8BaA=; b=06rgBd2D9DqF0k
	3Rzk3Z5k+c62SK14XKp16Twx6VXcDBwyudicD9DR27Hbrqyr0ezdWKwedhJZRvkXMry6fZsIvUaTb
	vf1yVpJiY2neaJHMViMUEp2bobU+Z6QuH5WhLss6jeSrcYoAq7Bp2q1B+Po1Qd/zat2kklZfhvylJ
	z30mCkh9nMaLr15JcfDLp+iIHK3Ce8gNSew+E4exRg7qnTIhM7XjdeogJF8xVSpqjHugt1NuHfAfx
	WtmP219oQHkZ+J+4LBNw+yXeVsBuDzIRvRZrO84AUnaw2Hu1GWwXo4S3OTe8SdWjfgj6UZlxA2X0b
	WbHrVcAWYEZG82OEx3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTIa4-002JnU-P4; Sun, 13 Mar 2022 07:23:56 +0000
Received: from desiato.infradead.org ([90.155.92.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTIYI-002IuP-4G; Sun, 13 Mar 2022 07:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=PO7D7Tj8iP6FtNLdJtLOcm5zFAXXAAINMUHFvNvo7iE=; b=qZ/HL3ztIR7Cu2wYrcLZA0B8nb
 OB5wRzvZqqesr4VoKb7nYus8128c1mE28U7NhVejyQVheVGFDlqBWOvTxoUrAIt8bndZbPX/pPz1P
 7gw5c9PzXCAUYDMgJx3bQsjCSx5xHmeeeWBraesn1gQdHxXI1MsDZ9eWDNRWyyU2MBV4ygmiiVE9m
 FvVaocItZCZIOtJynG1qyV3rC152Na0zREjCEiWAOuS2eriyJSnzdqecm394p2AEpN4dbDRsGczOO
 Uaj4rfuVAo5zAQDEmw6N3aHSHH9JjllprrYaWyegL+uyWWEWsgIs+BxkjJsXV3n2zbPkUfeQr2JJH
 tUz+Mppg==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTIYE-000S2L-7v; Sun, 13 Mar 2022 07:22:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB12EB80C8B;
 Sun, 13 Mar 2022 07:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6A5C34115;
 Sun, 13 Mar 2022 07:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647156114;
 bh=2VP/D+842etQuFMo6fMzz45pTfZVm/2IyG71qbDWSJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M76jZPgwzXhef8pwkclkACbP/Wvyu1kAAzbVFua/NjZnrFrO8wd5cTokH8nJcJxPH
 ve2E1/Ab+ibCY5qTXGXFcV7G+god1fMCyWRbQZQDG2UE6TfT5vmxXMU4reFCaT/Gdn
 E7JItrx40w/l7cLJVCKO3halHFBbNdIJiCGlRzA+4Y+JO1QvW6cD9MseUpu3n5mDM2
 nYcX9LrZS6gNdpBVTH7A7ZC8tDH693hMbsPpkP38+NrKHA1DDh7eIv54gpIzr0gO0p
 cB6TKViqIezGaY5u6IdexMDiTC3KrTtQGNyiZyVoXhoXL4kSbbhSfK6T0OJsCZ1SeN
 W6CxBFsTkEC9g==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTIY3-0012wa-O2; Sun, 13 Mar 2022 08:21:51 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 17/39] media: platform: mtk-mdp: move config to its own file
Date: Sun, 13 Mar 2022 08:21:26 +0100
Message-Id: <33f2b85ee1f2d431334d1cbb666e9ca27c47a3b3.1647155572.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647155572.git.mchehab@kernel.org>
References: <cover.1647155572.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_072202_450961_94560C8D 
X-CRM114-Status: GOOD (  16.48  )
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
See [PATCH v3 00/39] at: https://lore.kernel.org/all/cover.1647155572.git.mchehab@kernel.org/

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

Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F526C63777
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 23:14:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B5572244C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 23:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XeNNNX7R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqYM+dWG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B5572244C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcMVKwmF5IZz2KVWM27g0d+RpqmAXF2aBmJpmBDP+/s=; b=XeNNNX7RQYxfXfOAfAJt8qu4dZ
	lWgU0dChr5nzmlEYY7gPxeuWSvVgj1e4NV597NSevltNA0tKVcMwadf/4VmS9RdxzKQt9eIbmhwls
	TfP9dK1uaW1SopBTB+EdwLIGkRLv4lfuaFa3bvtv6/VfAxMWUaJeQJVze6j4v3Fxm5mBpRQPEajS3
	IQF5eh/wJdQDbDYxtI+d8SSOL0+6+PreO0ZN2CAL8/3cM5svRJrl5RyyvFqtZ+agNmHpsAPAku3Zo
	6R6BJ1U89Vfiioh9TGulSGdkyhsf27LlXLto4xN1+95iNcBoIuunoLop3cSMDBReLamhzrVjg+blz
	T3U2fCEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kenhh-0003u6-VW; Mon, 16 Nov 2020 23:14:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kenhe-0003sB-OY
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 23:14:32 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28CEE23A32;
 Mon, 16 Nov 2020 23:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605568470;
 bh=eUg16iMbYyzUK83g3LNvHzG2VMMUY4pbe/Vx5Nm9z/I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DqYM+dWGiX2wOXr0iXF+kZLb23r7xuY6IPXTN7DfPvX7LAhhpAx6+RfjGNSBr8Exo
 rub1GolRoVCiz/bXUAbXzX63cn51+t3JEsdR4q6H4y8olqjSho2dwdM6dtT9/XuILh
 1/TcrogctE9f5+dIt3xvL8Q0JGfoOqODZeoRIx/8=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: [RESEND PATCH 1/3] drm/mediatek: Separate mtk_mipi_tx to an
 independent module
Date: Tue, 17 Nov 2020 07:14:05 +0800
Message-Id: <20201116231407.94-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116231407.94-1-chunkuang.hu@kernel.org>
References: <20201116231407.94-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_181431_174152_09B513A4 
X-CRM114-Status: GOOD (  17.35  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_mipi_tx is a part of mtk_drm module, but phy driver should be an
independent module rather than be part of drm module, so separate the phy
driver to an independent module.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/Kconfig       | 8 ++++++++
 drivers/gpu/drm/mediatek/Makefile      | 9 ++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.h | 1 -
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c | 3 +++
 5 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 65cd03a4be29..24c4890a6e65 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -13,6 +13,7 @@ config DRM_MEDIATEK
 	select DRM_PANEL
 	select MEMORY
 	select MTK_SMI
+	select PHY_MTK_MIPI_DSI
 	select VIDEOMODE_HELPERS
 	help
 	  Choose this option if you have a Mediatek SoCs.
@@ -27,3 +28,10 @@ config DRM_MEDIATEK_HDMI
 	select PHY_MTK_HDMI
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
+
+config PHY_MTK_MIPI_DSI
+	tristate "Mediatek MIPI-DSI-PHY Driver"
+	depends on ARCH_MEDIATEK && OF
+	select GENERIC_PHY
+	help
+	  Support MIPI DSI PHY for Mediatek SoCs.
diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 77b0fd86063d..baa188000543 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -10,9 +10,6 @@ mediatek-drm-y := mtk_disp_color.o \
 		  mtk_drm_gem.o \
 		  mtk_drm_plane.o \
 		  mtk_dsi.o \
-		  mtk_mipi_tx.o \
-		  mtk_mt8173_mipi_tx.o \
-		  mtk_mt8183_mipi_tx.o \
 		  mtk_dpi.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
@@ -22,3 +19,9 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi_ddc.o
 
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
+
+phy-mtk-mipi-dsi-drv-objs := mtk_mipi_tx.o \
+			     mtk_mt8173_mipi_tx.o \
+			     mtk_mt8183_mipi_tx.o
+
+obj-$(CONFIG_PHY_MTK_MIPI_DSI) += phy-mtk-mipi-dsi-drv.o
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 59c85c63b7cc..bad75c5be090 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -636,7 +636,6 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
 	&mtk_drm_platform_driver,
-	&mtk_mipi_tx_driver,
 	&mtk_dsi_driver,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index b5be63e53176..6ff98a68444b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -54,6 +54,5 @@ extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
-extern struct platform_driver mtk_mipi_tx_driver;
 
 #endif /* MTK_DRM_DRV_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
index 8cee2591e728..f2a892e16c27 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
@@ -242,4 +242,7 @@ struct platform_driver mtk_mipi_tx_driver = {
 		.of_match_table = mtk_mipi_tx_match,
 	},
 };
+module_platform_driver(mtk_mipi_tx_driver);
 
+MODULE_DESCRIPTION("MediaTek MIPI TX Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

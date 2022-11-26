Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFEEC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Nov 2022 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crcjwsV4NOG4GJ2+Y84qY7nobCnxpVJZV2I/yVjgeSY=; b=zYLY1sWvRyO349bDnUWosreBLk
	CK8qhoXq5nXuiOtrZ6Xfl/h4/nDHPgbAx9PfCKkhvtfkHV8cbtH5ItMTicAuLHEAQoVbFbJgWLHkH
	3J4G1WM2C/gcmVNmyidcqhz9kYLg34zOWeV1lBlzQYxdwFEwKR49+5mtdAumOmqKfKAjZcqZRLb/Q
	/3E5E1Bz7YzeJAhuqDCQidPmSd217RqkvEhj90ZaQ4OTrFqK2jkOPqYl45KaHUxtm2vkQVrERANpW
	DIoOJt4oVVrD801YNrXZ/lWMpJl1/O7Gd4oSDJY9U4JQ4Iwc/hfcY58Jt/utEDwSdpr8ZTNeGlxEx
	BpU5NPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oysxS-005ff7-BK; Sat, 26 Nov 2022 11:02:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oysx3-005fR3-5o; Sat, 26 Nov 2022 11:02:32 +0000
X-UUID: 339057c3ef154911a3f6394b09cc7b82-20221126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=crcjwsV4NOG4GJ2+Y84qY7nobCnxpVJZV2I/yVjgeSY=;
	b=isdJFPuMt51HkKMQoJDjhPqdHjF5JAZRBAeSlwqf1jDp8O6ypkG0JgNYXCf0XboSox2lqxusPMfKi2a4kxkPfoQDMu6ghScZhdMcLzfD4hdxBis7Ik5k515gSng4Rmqo4+Q2Ds9/kJ2PJbd1VK2h7WZOtZFMnUG2vKAQDWQuRHA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:889537c6-1c57-434f-9bbb-037785febcf4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:727ae22f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 339057c3ef154911a3f6394b09cc7b82-20221126
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1904209387; Sat, 26 Nov 2022 04:02:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 26 Nov 2022 18:12:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 26 Nov 2022 18:12:21 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 1/3] Revert "drm/mediatek: Add mediatek-drm of vdosys0 support for mt8195"
Date: Sat, 26 Nov 2022 18:12:18 +0800
Message-ID: <20221126101220.18179-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221126101220.18179-1-jason-jh.lin@mediatek.com>
References: <20221126101220.18179-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_030229_318451_5D3A22F7 
X-CRM114-Status: GOOD (  19.46  )
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

This reverts commit 7266e90a51a32722a94daa3cb5b8fa278059e49e.

Due to the compatible changing of mt8195 from "mediatek,mt8195-mmsys"
to "mediatek,mt8195-vdosys0", we have to revert this patch and send a
new patch with the new compatible.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 150 ++---------------------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   6 -
 3 files changed, 14 insertions(+), 150 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 0ec2e4049e07..2cb90466798c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -370,8 +370,8 @@ static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
 	.fifo_size = 5 * SZ_1K,
 };
 
-static const struct mtk_disp_rdma_data mt8195_rdma_driver_data = {
-	.fifo_size = 1920,
+static const struct mtk_disp_rdma_data mt8192_rdma_driver_data = {
+	.fifo_size = 5 * SZ_1K,
 };
 
 static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
@@ -381,8 +381,8 @@ static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	  .data = &mt8173_rdma_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-rdma",
 	  .data = &mt8183_rdma_driver_data},
-	{ .compatible = "mediatek,mt8195-disp-rdma",
-	  .data = &mt8195_rdma_driver_data},
+	{ .compatible = "mediatek,mt8192-disp-rdma",
+	  .data = &mt8192_rdma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 39a42dc8fb85..a15aa8081fdc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -4,8 +4,6 @@
  * Author: YT SHEN <yt.shen@mediatek.com>
  */
 
-#include <linux/clk.h>
-#include <linux/clk-provider.h>
 #include <linux/component.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
@@ -197,19 +195,6 @@ static const enum mtk_ddp_comp_id mt8192_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
-static const enum mtk_ddp_comp_id mt8195_mtk_ddp_main[] = {
-	DDP_COMPONENT_OVL0,
-	DDP_COMPONENT_RDMA0,
-	DDP_COMPONENT_COLOR0,
-	DDP_COMPONENT_CCORR,
-	DDP_COMPONENT_AAL0,
-	DDP_COMPONENT_GAMMA,
-	DDP_COMPONENT_DITHER0,
-	DDP_COMPONENT_DSC0,
-	DDP_COMPONENT_MERGE0,
-	DDP_COMPONENT_DP_INTF0,
-};
-
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -218,13 +203,6 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.shadow_register = true,
 };
 
-static const struct mtk_mmsys_match_data mt2701_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt2701_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
 	.main_path = mt7623_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt7623_mtk_ddp_main),
@@ -233,13 +211,6 @@ static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
 	.shadow_register = true,
 };
 
-static const struct mtk_mmsys_match_data mt7623_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt7623_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.main_path = mt2712_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
@@ -249,25 +220,11 @@ static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
 };
 
-static const struct mtk_mmsys_match_data mt2712_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt2712_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.main_path = mt8167_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8167_mtk_ddp_main),
 };
 
-static const struct mtk_mmsys_match_data mt8167_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8167_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.main_path = mt8173_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
@@ -275,13 +232,6 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
 };
 
-static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8173_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.main_path = mt8183_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8183_mtk_ddp_main),
@@ -289,13 +239,6 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
 };
 
-static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8183_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.main_path = mt8186_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8186_mtk_ddp_main),
@@ -303,13 +246,6 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8186_mtk_ddp_ext),
 };
 
-static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8186_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.main_path = mt8192_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
@@ -317,31 +253,6 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
 };
 
-static const struct mtk_mmsys_match_data mt8192_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8192_mmsys_driver_data,
-	},
-};
-
-static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
-	.io_start = 0x1c01a000,
-	.main_path = mt8195_mtk_ddp_main,
-	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
-};
-
-static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
-	.io_start = 0x1c100000,
-};
-
-static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8195_vdosys0_driver_data,
-		&mt8195_vdosys1_driver_data,
-	},
-};
-
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -559,16 +470,12 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_DITHER },
 	{ .compatible = "mediatek,mt8183-disp-dither",
 	  .data = (void *)MTK_DISP_DITHER },
-	{ .compatible = "mediatek,mt8195-disp-dsc",
-	  .data = (void *)MTK_DISP_DSC },
 	{ .compatible = "mediatek,mt8167-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
-	{ .compatible = "mediatek,mt8195-disp-merge",
-	  .data = (void *)MTK_DISP_MERGE },
 	{ .compatible = "mediatek,mt2701-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2712-disp-mutex",
@@ -583,8 +490,6 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
-	{ .compatible = "mediatek,mt8195-disp-mutex",
-	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -617,7 +522,7 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8183-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8195-disp-rdma",
+	{ .compatible = "mediatek,mt8192-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
@@ -648,53 +553,30 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
-	  .data = &mt2701_mmsys_match_data},
+	  .data = &mt2701_mmsys_driver_data},
 	{ .compatible = "mediatek,mt7623-mmsys",
-	  .data = &mt7623_mmsys_match_data},
+	  .data = &mt7623_mmsys_driver_data},
 	{ .compatible = "mediatek,mt2712-mmsys",
-	  .data = &mt2712_mmsys_match_data},
+	  .data = &mt2712_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8167-mmsys",
-	  .data = &mt8167_mmsys_match_data},
+	  .data = &mt8167_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8173-mmsys",
-	  .data = &mt8173_mmsys_match_data},
+	  .data = &mt8173_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8183-mmsys",
-	  .data = &mt8183_mmsys_match_data},
+	  .data = &mt8183_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8186-mmsys",
-	  .data = &mt8186_mmsys_match_data},
+	  .data = &mt8186_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
-	  .data = &mt8192_mmsys_match_data},
-	{ .compatible = "mediatek,mt8195-mmsys",
-	  .data = &mt8195_mmsys_match_data},
+	  .data = &mt8192_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
 
-static int mtk_drm_find_match_data(struct device *dev,
-				   const struct mtk_mmsys_match_data *match_data)
-{
-	int i;
-	struct platform_device *pdev = of_find_device_by_node(dev->parent->of_node);
-	struct resource *res;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get parent resource\n");
-		return -EINVAL;
-	}
-
-	for (i = 0; i < match_data->num_drv_data; i++)
-		if (match_data->drv_data[i]->io_start == res->start)
-			return i;
-
-	return -EINVAL;
-}
-
 static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
-	const struct mtk_mmsys_match_data *match_data;
 	struct mtk_drm_private *private;
 	struct device_node *node;
 	struct component_match *match = NULL;
@@ -715,19 +597,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	if (!of_id)
 		return -ENODEV;
 
-	match_data = of_id->data;
-	if (match_data->num_drv_data > 1) {
-		/* This SoC has multiple mmsys channels */
-		ret = mtk_drm_find_match_data(dev, match_data);
-		if (ret < 0) {
-			dev_err(dev, "Couldn't get match driver data\n");
-			return ret;
-		}
-		private->data = match_data->drv_data[ret];
-	} else {
-		dev_dbg(dev, "Using single mmsys channel\n");
-		private->data = match_data->drv_data[0];
-	}
+	private->data = of_id->data;
 
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(phandle->parent, node) {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 7b37b5cf9629..64a1f66df26a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -21,7 +21,6 @@ struct drm_property;
 struct regmap;
 
 struct mtk_mmsys_driver_data {
-	const resource_size_t io_start;
 	const enum mtk_ddp_comp_id *main_path;
 	unsigned int main_len;
 	const enum mtk_ddp_comp_id *ext_path;
@@ -32,11 +31,6 @@ struct mtk_mmsys_driver_data {
 	bool shadow_register;
 };
 
-struct mtk_mmsys_match_data {
-	unsigned short num_drv_data;
-	const struct mtk_mmsys_driver_data *drv_data[];
-};
-
 struct mtk_drm_private {
 	struct drm_device *drm;
 	struct device *dma_dev;
-- 
2.18.0



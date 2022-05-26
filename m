Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96869C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 10:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgkupTRG+K7tNPLlykbP3nfTuADo0gJ7psV9kNZUtCE=; b=fqnBYvB63U58w+
	IWQdC5w6tHXglXxFYyQW1RrR8MWGj4sEFENPJDmG7jCQIOoGOBmv5g120I/sWOzD8JLlf4K+CPJBx
	SOVNnKuvMAYkZiVEPeUSuqs+qsw5LboWHwfISV17W+pUgbkvYx8Mm+RwdiHdQjE5Fa+07ub1NajcA
	eh9Sk2qhyRMQf7Ko/5H+eeoPBREdM6BGxDQKvbinSEQU8aLUbohUdiALx85OGlTitEEgUi6eqOAUy
	DRqAP/fgRTQH3VwucY5gk9fTC9Zxjky0zW/ozwuz/jBaYexsCo533CmVW/iEM2Rcc6VPQLKQtaJan
	XiknAnSGlp+ORb2luRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAcg-00EO0u-6e; Thu, 26 May 2022 10:21:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAcd-00ENz4-GA; Thu, 26 May 2022 10:21:41 +0000
X-UUID: 965588656e5245a9aefcd1c3e0a12b7f-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:051d3753-85a0-4abe-b374-407f3d1cee6a,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:6c7358b8-3c45-407b-8f66-25095432a27a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 965588656e5245a9aefcd1c3e0a12b7f-20220526
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1202296555; Thu, 26 May 2022 03:21:31 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 03:21:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 18:21:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 26 May 2022 18:21:27 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, jason-jh.lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH v22 3/5] drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
Date: Thu, 26 May 2022 18:21:24 +0800
Message-ID: <20220526102126.19756-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220526102126.19756-1-jason-jh.lin@mediatek.com>
References: <20220526102126.19756-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_032139_572717_D828B36E 
X-CRM114-Status: GOOD (  20.30  )
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

From: "jason-jh.lin" <jason-jh.lin@mediatek.com>

1. Add driver data of mt8195 vdosys0 to mediatek-drm and the sub driver.
2. Add get driver data function to identify which vdosys by io_start.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 150 +++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   6 +
 3 files changed, 153 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 1be4caf9ff96..a000bba04e01 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -372,6 +372,10 @@ static const struct mtk_disp_rdma_data mt8192_rdma_driver_data = {
 	.fifo_size = 5 * SZ_1K,
 };
 
+static const struct mtk_disp_rdma_data mt8195_rdma_driver_data = {
+	.fifo_size = 1920,
+};
+
 static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-rdma",
 	  .data = &mt2701_rdma_driver_data},
@@ -381,6 +385,8 @@ static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	  .data = &mt8183_rdma_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-rdma",
 	  .data = &mt8192_rdma_driver_data},
+	{ .compatible = "mediatek,mt8195-disp-rdma",
+	  .data = &mt8195_rdma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 5c1c657ceb6e..eb477c17a0ce 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -4,6 +4,8 @@
  * Author: YT SHEN <yt.shen@mediatek.com>
  */
 
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/component.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
@@ -195,6 +197,19 @@ static const enum mtk_ddp_comp_id mt8192_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
+static const enum mtk_ddp_comp_id mt8195_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DSC0,
+	DDP_COMPONENT_MERGE0,
+	DDP_COMPONENT_DP_INTF0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -203,6 +218,13 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.shadow_register = true,
 };
 
+static const struct mtk_mmsys_match_data mt2701_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt2701_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
 	.main_path = mt7623_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt7623_mtk_ddp_main),
@@ -211,6 +233,13 @@ static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
 	.shadow_register = true,
 };
 
+static const struct mtk_mmsys_match_data mt7623_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt7623_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.main_path = mt2712_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
@@ -220,11 +249,25 @@ static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
 };
 
+static const struct mtk_mmsys_match_data mt2712_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt2712_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.main_path = mt8167_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8167_mtk_ddp_main),
 };
 
+static const struct mtk_mmsys_match_data mt8167_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8167_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.main_path = mt8173_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
@@ -232,6 +275,13 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8173_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.main_path = mt8183_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8183_mtk_ddp_main),
@@ -239,6 +289,13 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8183_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.main_path = mt8186_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8186_mtk_ddp_main),
@@ -246,6 +303,13 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8186_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8186_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.main_path = mt8192_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
@@ -253,6 +317,31 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_match_data mt8192_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8192_mmsys_driver_data,
+	},
+};
+
+static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
+	.io_start = 0x1c01a000,
+	.main_path = mt8195_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
+};
+
+static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
+	.io_start = 0x1c100000,
+};
+
+static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8195_vdosys0_driver_data,
+		&mt8195_vdosys1_driver_data,
+	},
+};
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -470,12 +559,16 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_DITHER },
 	{ .compatible = "mediatek,mt8183-disp-dither",
 	  .data = (void *)MTK_DISP_DITHER },
+	{ .compatible = "mediatek,mt8195-disp-dsc",
+	  .data = (void *)MTK_DISP_DSC },
 	{ .compatible = "mediatek,mt8167-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
+	{ .compatible = "mediatek,mt8195-disp-merge",
+	  .data = (void *)MTK_DISP_MERGE },
 	{ .compatible = "mediatek,mt2701-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2712-disp-mutex",
@@ -490,6 +583,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8195-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -524,6 +619,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8192-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8195-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt8173-disp-wdma",
@@ -549,30 +646,53 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
-	  .data = &mt2701_mmsys_driver_data},
+	  .data = &mt2701_mmsys_match_data},
 	{ .compatible = "mediatek,mt7623-mmsys",
-	  .data = &mt7623_mmsys_driver_data},
+	  .data = &mt7623_mmsys_match_data},
 	{ .compatible = "mediatek,mt2712-mmsys",
-	  .data = &mt2712_mmsys_driver_data},
+	  .data = &mt2712_mmsys_match_data},
 	{ .compatible = "mediatek,mt8167-mmsys",
-	  .data = &mt8167_mmsys_driver_data},
+	  .data = &mt8167_mmsys_match_data},
 	{ .compatible = "mediatek,mt8173-mmsys",
-	  .data = &mt8173_mmsys_driver_data},
+	  .data = &mt8173_mmsys_match_data},
 	{ .compatible = "mediatek,mt8183-mmsys",
-	  .data = &mt8183_mmsys_driver_data},
+	  .data = &mt8183_mmsys_match_data},
 	{ .compatible = "mediatek,mt8186-mmsys",
-	  .data = &mt8186_mmsys_driver_data},
+	  .data = &mt8186_mmsys_match_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
-	  .data = &mt8192_mmsys_driver_data},
+	  .data = &mt8192_mmsys_match_data},
+	{ .compatible = "mediatek,mt8195-mmsys",
+	  .data = &mt8195_mmsys_match_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
 
+static int mtk_drm_find_match_data(struct device *dev,
+				   const struct mtk_mmsys_match_data *match_data)
+{
+	int i;
+	struct platform_device *pdev = of_find_device_by_node(dev->parent->of_node);
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "failed to get parent resource\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < match_data->num_drv_data; i++)
+		if (match_data->drv_data[i]->io_start == res->start)
+			return i;
+
+	return -EINVAL;
+}
+
 static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
+	const struct mtk_mmsys_match_data *match_data;
 	struct mtk_drm_private *private;
 	struct device_node *node;
 	struct component_match *match = NULL;
@@ -593,7 +713,19 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	if (!of_id)
 		return -ENODEV;
 
-	private->data = of_id->data;
+	match_data = of_id->data;
+	if (match_data->num_drv_data > 1) {
+		/* This SoC has multiple mmsys channels */
+		ret = mtk_drm_find_match_data(dev, match_data);
+		if (ret < 0) {
+			dev_err(dev, "Couldn't get match driver data\n");
+			return ret;
+		}
+		private->data = match_data->drv_data[ret];
+	} else {
+		dev_dbg(dev, "Using single mmsys channel\n");
+		private->data = match_data->drv_data[0];
+	}
 
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(phandle->parent, node) {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index a58cebd01d35..9fc922b1684f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -21,6 +21,7 @@ struct drm_property;
 struct regmap;
 
 struct mtk_mmsys_driver_data {
+	const resource_size_t io_start;
 	const enum mtk_ddp_comp_id *main_path;
 	unsigned int main_len;
 	const enum mtk_ddp_comp_id *ext_path;
@@ -31,6 +32,11 @@ struct mtk_mmsys_driver_data {
 	bool shadow_register;
 };
 
+struct mtk_mmsys_match_data {
+	unsigned short num_drv_data;
+	const struct mtk_mmsys_driver_data *drv_data[];
+};
+
 struct mtk_drm_private {
 	struct drm_device *drm;
 	struct device *dma_dev;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

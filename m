Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2433AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 10:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eAPZxoWe05Esb53iCVV5w5CHz1ip5TyogZBpZFC5eQ=; b=ezKkviqR4mWT99
	/IDdejXsYex83sjY31rMI8+kcyUTjxqOvbJk7NlRmkbQkbiQGuICrMiksjt4C311S/Yc3cifDw3lx
	b/ow+dNsECn5jDP29sdmg2cl5hQab5EBe77uQhYwpwQSX60vcaAP490311usSjreyU4U0FPfPv+mx
	2OCDF11jUpHAzxUtdmRQvw4kWPfHUNm+iv/+iD3qsWxd2Hr4sljnpxkTa+kCX3XH5NB7bJfDoI8j9
	Rzld5HxwTFHGfAAdKEf+xo7VRXlWhZvF/AN9kQu0qUxZRmr6kiA6bLTMkOdOeQwP+4uKrQ8y9NzHj
	kHKdUYsk9eBC9AyagMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neE1f-00DP6s-CZ; Tue, 12 Apr 2022 10:45:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDwe-00DMMn-0V; Tue, 12 Apr 2022 10:40:27 +0000
X-UUID: f3c4e50d89744679889f20664115b2a5-20220412
X-UUID: f3c4e50d89744679889f20664115b2a5-20220412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1022973176; Tue, 12 Apr 2022 03:40:15 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 03:31:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 18:31:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 Apr 2022 18:31:16 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v18 07/10] drm/mediatek: add mediatek-drm of vdosys0 support
 for mt8195
Date: Tue, 12 Apr 2022 18:31:11 +0800
Message-ID: <20220412103114.19922-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
References: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_034024_109131_29755CB4 
X-CRM114-Status: GOOD (  20.99  )
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
Cc: David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 CK Hu <ck.hu@mediatek.com>, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 moudy.ho@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. Add driver data of mt8195 vdosys0 to mediatek-drm and the sub driver.
2. Add get driver data function to identify which vdosys by io_start.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c |   6 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 126 ++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   6 ++
 3 files changed, 137 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 662e91d9d45f..8ce60371536e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -364,6 +364,10 @@ static const struct mtk_disp_rdma_data mt8192_rdma_driver_data = {
 	.fifo_size = 5 * SZ_1K,
 };
 
+static const struct mtk_disp_rdma_data mt8195_rdma_driver_data = {
+	.fifo_size = 1920,
+};
+
 static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-rdma",
 	  .data = &mt2701_rdma_driver_data},
@@ -373,6 +377,8 @@ static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	  .data = &mt8183_rdma_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-rdma",
 	  .data = &mt8192_rdma_driver_data},
+	{ .compatible = "mediatek,mt8195-disp-rdma",
+	  .data = &mt8195_rdma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index f54b650a2ea1..1b5bef25d17b 100644
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
@@ -177,6 +179,19 @@ static const enum mtk_ddp_comp_id mt8192_mtk_ddp_ext[] = {
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
@@ -185,6 +200,13 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
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
@@ -193,6 +215,13 @@ static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
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
@@ -202,11 +231,25 @@ static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
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
@@ -214,6 +257,13 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
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
@@ -221,6 +271,13 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8183_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.main_path = mt8192_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
@@ -228,6 +285,31 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
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
@@ -445,12 +527,16 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
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
@@ -463,6 +549,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8195-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -497,6 +585,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8192-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8195-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt8173-disp-wdma",
@@ -533,15 +623,37 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8183_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
 	  .data = &mt8192_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8195-mmsys"},
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
+	if (IS_ERR(res)) {
+		dev_err(dev, "failed to get mmsys resource\n");
+		return PTR_ERR(res);
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
@@ -562,7 +674,19 @@ static int mtk_drm_probe(struct platform_device *pdev)
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
index a58cebd01d35..e1a37ca091f3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -21,6 +21,7 @@ struct drm_property;
 struct regmap;
 
 struct mtk_mmsys_driver_data {
+	const unsigned int io_start;
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

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E637C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 18:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaWT8fim/gWQ4AlJx4tyopGtiiy0OTez/SYLWXIz0L8=; b=PzrmogsEBMDJbF
	Px56/eRapiV9lmU7gKsbM5k80DzO2Pz+JAa7GhOa2b71At5pbl7pkyuGZAW7HSA029wZ++ri0yHMI
	dnIWzVcz7WXyVsJaOTvZMlKSL6LfocchaqxjTIHCFlrmLFUPgD47Ps1UxKwLhU4xnYPBJwQw6/scF
	BSW3Vp7rcWeVOMY3mwW5TOeo5tImk7ktFDiNtO+UIsW2pOGidkdkzMnXoqew+IxvZV9VapvNnT55D
	oeUjxxvuUXyMsZePKDJjseVntB5SlucIpIBI3Xj7moRtitXmb0IhReCHas5Jn7I1Zo71R9ZIlKhQC
	jHqKp1k7xA47KqkHcsuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZzSd-003AxH-P1; Thu, 31 Mar 2022 18:23:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZzSP-003Asf-82; Thu, 31 Mar 2022 18:23:44 +0000
X-UUID: e42f76d7a50043afb65266e569d566d0-20220331
X-UUID: e42f76d7a50043afb65266e569d566d0-20220331
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1415568581; Thu, 31 Mar 2022 11:23:36 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 11:23:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 02:23:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Apr 2022 02:23:33 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v17 7/7] drm/mediatek: add mediatek-drm of vdosys0 support for
 mt8195
Date: Fri, 1 Apr 2022 02:23:31 +0800
Message-ID: <20220331182331.27205-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220331182331.27205-1-jason-jh.lin@mediatek.com>
References: <20220331182331.27205-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_112341_348739_4CCC578D 
X-CRM114-Status: GOOD (  19.96  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, CK
 Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. Add driver data of mt8195 vdosys0 to mediatek-drm and the sub driver.
2. Add get driver data by clock name function to get the corresponding
   driver data for mt8195 vdosys0.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  6 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 80 ++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |  2 +
 3 files changed, 88 insertions(+)

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
index 230b8aee12b2..cd3a5b215087 100644
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
+	DDP_COMPONENT_DITHER0,
+	DDP_COMPONENT_DSC0,
+	DDP_COMPONENT_MERGE0,
+	DDP_COMPONENT_DP_INTF0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -228,6 +243,13 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
+	.clk_name = "cfg_vdo0",
+	.clk_platform = "clk-mt8195",
+	.main_path = mt8195_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
+};
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -445,12 +467,16 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
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
@@ -463,6 +489,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8195-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -497,6 +525,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8192-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8195-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt8173-disp-wdma",
@@ -533,10 +563,56 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8183_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
 	  .data = &mt8192_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8195-mmsys"},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
 
+static const struct of_device_id mtk_clk_platform_labels[] = {
+	{ .compatible = "mediatek,mt8195-mmsys",
+	  .data = (void *)"clk-mt8195"},
+};
+
+static int mtk_drm_get_match_data_by_clk_name(const struct mtk_mmsys_driver_data **data,
+					      struct device *dev)
+{
+	int i;
+	struct platform_device *pdev = of_find_device_by_node(dev->parent->of_node);
+	struct clk *clk;
+	const char *clk_name;
+	const struct of_device_id *of_id = of_match_node(mtk_clk_platform_labels,
+							 dev->parent->of_node);
+	const struct mtk_mmsys_driver_data *drvdata[] = {
+		&mt8195_vdosys0_driver_data,
+	};
+
+	if (!of_id || !of_id->data) {
+		dev_err(dev, "Can't find match clk platform labels\n");
+		return -EINVAL;
+	}
+
+	clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(&pdev->dev, "failed to get parent clk\n");
+		return PTR_ERR(clk);
+	}
+
+	clk_name = __clk_get_name(clk);
+	if (!clk_name) {
+		dev_err(dev, "invalid mmsys clk name\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(drvdata); i++)
+		if (strncmp(drvdata[i]->clk_name, clk_name, strlen(clk_name)) == 0 &&
+		    strncmp(drvdata[i]->clk_platform, of_id->data, strlen(of_id->data)) == 0) {
+			*data = drvdata[i];
+			return 0;
+		}
+
+	return -EINVAL;
+}
+
 static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -563,6 +639,10 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	private->data = of_id->data;
+	if (!private->data && mtk_drm_get_match_data_by_clk_name(&private->data, dev) < 0) {
+		dev_err(dev, "Couldn't get match driver data\n");
+		return -EINVAL;
+	}
 
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(phandle->parent, node) {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index a58cebd01d35..78cbf1ae3bd5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -21,6 +21,8 @@ struct drm_property;
 struct regmap;
 
 struct mtk_mmsys_driver_data {
+	const char *clk_name;
+	const char *clk_platform;
 	const enum mtk_ddp_comp_id *main_path;
 	unsigned int main_len;
 	const enum mtk_ddp_comp_id *ext_path;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

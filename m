Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DACAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 09:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLIsLdcJy7W6oXfQB8I0BNobe5VwnokUiOv0eS6dV/8=; b=PkB7ab8sglf358
	R6mM3UJPbz4XQwV4/mUbD569p80A9mJAmCi0X3IRSpvSP8rLsRUF9GZ08um76u+ep59FP0hJG9+tZ
	bannkf0lCQipyBm+QNiH8BsuCbNRcX1M1BuBIQtIEsyxYu8YZ7xVoGi44UxhlwqokXEZJufoeLvp5
	qIsDR+DqGyznu7SfF/zmadSZOgrmfGKMfxek0vBWxvkcfluCO7y7ziBPhSoWAg9Kfyt36Yd4uYUGE
	DjQWXt6swHEPJmmVU708U22coy6nuGrP2En773aXLw+f4M1WvJUXPV7FPHRy4u+3lC9xj0oyCuTtO
	4dr4ConsNgX2Dle4krqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWJ6-003XOI-AE; Tue, 08 Mar 2022 09:39:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWDv-003Usx-Hg; Tue, 08 Mar 2022 09:33:45 +0000
X-UUID: 58f4108201554922bc2515116c4c9d35-20220308
X-UUID: 58f4108201554922bc2515116c4c9d35-20220308
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1291921181; Tue, 08 Mar 2022 02:33:32 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 01:30:24 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 17:30:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Mar 2022 17:30:23 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [RESEND v13 20/22] drm/mediatek: add drm ovl_adaptor sub driver for
 MT8195
Date: Tue, 8 Mar 2022 17:30:16 +0800
Message-ID: <20220308093018.24189-21-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220308093018.24189-1-nancy.lin@mediatek.com>
References: <20220308093018.24189-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_013343_642376_540769F8 
X-CRM114-Status: GOOD (  21.59  )
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

Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
the component exists in the path.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 18 ++++------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 31 +++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 40 ++++++++++++---------
 4 files changed, 58 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 0cca1966b622..28a691328998 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -889,20 +889,16 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	for (i = 0; i < path_len; i++) {
 		enum mtk_ddp_comp_id comp_id = path[i];
 		struct device_node *node;
-		struct mtk_ddp_comp *comp;
 
 		node = priv->comp_node[comp_id];
-		comp = &priv->ddp_comp[comp_id];
 
-		if (!node) {
-			dev_info(dev,
-				 "Not creating crtc %d because component %d is disabled or missing\n",
-				 crtc_i, comp_id);
-			return 0;
-		}
-
-		if (!comp->dev) {
-			dev_err(dev, "Component %pOF not initialized\n", node);
+		/* Not all drm components have a DTS device node, such as ovl_adaptor,
+		 * which is the drm bring up sub driver
+		 */
+		if (!node && comp_id != DDP_COMPONENT_OVL_ADAPTOR) {
+			dev_err(dev,
+				"Not creating crtc %d because component %d is disabled, missing or not initialized\n",
+				crtc_i, comp_id);
 			return -ENODEV;
 		}
 	}
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 26d197da41c0..acc6f09da653 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -385,6 +385,19 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 	.start = mtk_ufoe_start,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
+	.clk_enable = mtk_ovl_adaptor_clk_enable,
+	.clk_disable = mtk_ovl_adaptor_clk_disable,
+	.config = mtk_ovl_adaptor_config,
+	.start = mtk_ovl_adaptor_start,
+	.stop = mtk_ovl_adaptor_stop,
+	.layer_nr = mtk_ovl_adaptor_layer_nr,
+	.layer_config = mtk_ovl_adaptor_layer_config,
+	.enable_vblank = mtk_ovl_adaptor_enable_vblank,
+	.disable_vblank = mtk_ovl_adaptor_disable_vblank,
+	.dma_dev_get = mtk_ovl_adaptor_dma_dev_get,
+};
+
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_AAL] = "aal",
 	[MTK_DISP_BLS] = "bls",
@@ -398,6 +411,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_OVL] = "ovl",
 	[MTK_DISP_OVL_2L] = "ovl-2l",
+	[MTK_DISP_OVL_ADAPTOR] = "ovl_adaptor",
 	[MTK_DISP_POSTMASK] = "postmask",
 	[MTK_DISP_PWM] = "pwm",
 	[MTK_DISP_RDMA] = "rdma",
@@ -443,6 +457,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2, &ddp_ovl },
+	[DDP_COMPONENT_OVL_ADAPTOR]	= { MTK_DISP_OVL_ADAPTOR,	0, &ddp_ovl_adaptor },
 	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0, &ddp_postmask },
 	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0, NULL },
 	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1, NULL },
@@ -548,12 +563,17 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 
 	comp->id = comp_id;
 	comp->funcs = mtk_ddp_matches[comp_id].funcs;
-	comp_pdev = of_find_device_by_node(node);
-	if (!comp_pdev) {
-		DRM_INFO("Waiting for device %s\n", node->full_name);
-		return -EPROBE_DEFER;
+	/* Not all drm components have a DTS device node, such as ovl_adaptor,
+	 * which is the drm bring up sub driver
+	 */
+	if (node) {
+		comp_pdev = of_find_device_by_node(node);
+		if (!comp_pdev) {
+			DRM_INFO("Waiting for device %s\n", node->full_name);
+			return -EPROBE_DEFER;
+		}
+		comp->dev = &comp_pdev->dev;
 	}
-	comp->dev = &comp_pdev->dev;
 
 	/* Only DMA capable components need the LARB property */
 	if (type == MTK_DISP_OVL ||
@@ -573,6 +593,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_MERGE ||
 	    type == MTK_DISP_OVL ||
 	    type == MTK_DISP_OVL_2L ||
+	    type == MTK_DISP_OVL_ADAPTOR ||
 	    type == MTK_DISP_PWM ||
 	    type == MTK_DISP_RDMA ||
 	    type == MTK_DPI ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 4f7fae41c916..1862eba41c45 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_OD,
 	MTK_DISP_OVL,
 	MTK_DISP_OVL_2L,
+	MTK_DISP_OVL_ADAPTOR,
 	MTK_DISP_POSTMASK,
 	MTK_DISP_PWM,
 	MTK_DISP_RDMA,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a05703843af2..99f37f8f6639 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -351,9 +351,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
 	struct mtk_drm_private *priv_n;
-	struct platform_device *pdev;
-	struct device_node *np = NULL;
-	struct device *dma_dev;
+	struct device *dma_dev = NULL;
 	int ret, i, j;
 
 	ret = drmm_mode_config_init(drm);
@@ -388,7 +386,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	 *    different drm private data structures. Loop through crtc index to
 	 *    create crtc from the main path and then ext_path and finally the
 	 *    third path.
-	 * 3. Use OVL device for all DMA memory allocations
 	 */
 	for (i = 0; i < MAX_CRTC; i++) {
 		for (j = 0; j < private->data->mmsys_dev_num; j++) {
@@ -400,9 +397,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 				if (ret)
 					goto err_component_unbind;
 
-				if (!np)
-					np = priv_n->comp_node[priv_n->data->main_path[0]];
-
 				continue;
 			} else if (i == 1 && priv_n->data->ext_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->ext_path,
@@ -410,9 +404,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 				if (ret)
 					goto err_component_unbind;
 
-				if (!np)
-					np = priv_n->comp_node[priv_n->data->ext_path[0]];
-
 				continue;
 			} else if (i == 2 && priv_n->data->third_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->third_path,
@@ -420,22 +411,19 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 				if (ret)
 					goto err_component_unbind;
 
-				if (!np)
-					np = priv_n->comp_node[priv_n->data->third_path[0]];
-
 				continue;
 			}
 		}
 	}
 
-	pdev = of_find_device_by_node(np);
-	if (!pdev) {
+	/* Use OVL device for all DMA memory allocations */
+	dma_dev = mtk_drm_crtc_dma_dev_get(drm_crtc_from_index(drm, 0));
+	if (!dma_dev) {
 		ret = -ENODEV;
 		dev_err(drm->dev, "Need at least one OVL device\n");
 		goto err_component_unbind;
 	}
 
-	dma_dev = &pdev->dev;
 	for (i = 0; i < private->data->mmsys_dev_num; i++)
 		private->all_drm_private[i]->dma_dev = dma_dev;
 
@@ -514,6 +502,11 @@ static int compare_of(struct device *dev, void *data)
 	return dev->of_node == data;
 }
 
+static int compare_dev(struct device *dev, void *data)
+{
+	return dev == (struct device *)data;
+}
+
 static int mtk_drm_bind(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -702,6 +695,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	struct mtk_drm_private *private;
 	struct device_node *node;
 	struct component_match *match = NULL;
+	struct platform_device *ovl_adaptor;
 	int ret;
 	int i;
 
@@ -727,6 +721,18 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	/* Bringup ovl_adaptor */
+	if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_OVL_ADAPTOR)) {
+		ovl_adaptor = platform_device_register_data(dev, "mediatek-disp-ovl-adaptor",
+							    PLATFORM_DEVID_AUTO,
+							    (void *)private->mmsys_dev,
+							    sizeof(*private->mmsys_dev));
+		private->ddp_comp[DDP_COMPONENT_OVL_ADAPTOR].dev = &ovl_adaptor->dev;
+		mtk_ddp_comp_init(NULL, &private->ddp_comp[DDP_COMPONENT_OVL_ADAPTOR],
+				  DDP_COMPONENT_OVL_ADAPTOR);
+		component_match_add(dev, &match, compare_dev, &ovl_adaptor->dev);
+	}
+
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(phandle->parent, node) {
 		const struct of_device_id *of_id;
@@ -780,6 +786,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_MERGE ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
+		    comp_type == MTK_DISP_OVL_ADAPTOR ||
 		    comp_type == MTK_DISP_RDMA ||
 		    comp_type == MTK_DPI ||
 		    comp_type == MTK_DSI) {
@@ -882,6 +889,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_color_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_merge_driver,
+	&mtk_disp_ovl_adaptor_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB92C001DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IVB1CC6BZwxJkece5d/SoXOpHZFxcvvr7Jdp61fNso=; b=h2tWHamX/sWDb1K2g6hSeaAIzc
	4fPbKQDtvwiEbaBfdNnj04rc5NbqTuu1FkXPyKhouvwD701WavJyQGkwJMbMWb4Q/dQRUQCpihTk5
	uRtsXELEe91g6v1Nl1+/y4TkGAgp8mB5zEtwzEij0VZmxJH2zTNS2jCUz7fqgsI3ljK5fQP+5U1YY
	VXM5swDVlfUZjvFApm8uof6N/5qp3rGlsbGE6sA4Rk6DJU8iEHpMBTGEviFcShMzzvRh8JUQ+3AFX
	3T8A1OAXnhB02BUQjl/X9w3ol65fy/01oyqw+WDu/nPEgrwi/8G9KQGUj1XtJzkhaDBbdDg70m0Fz
	smuZP4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDT1-005BWK-1e;
	Wed, 02 Aug 2023 15:08:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDSy-005BVA-03;
	Wed, 02 Aug 2023 15:08:49 +0000
X-UUID: 7783ca28314611ee83ed1395ce914268-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7IVB1CC6BZwxJkece5d/SoXOpHZFxcvvr7Jdp61fNso=;
	b=SrZjH5llkzSsm1WP6TZDUlzARdfoza/TGWQgwrEbci9e9RRYUMD7wlS98LTVn8a++7mZfa6ZPQDBy+/+HAkc0KcJY5o+lLy9cIqT1XyyOfs23Y7VNgIS0XzjoO35/rUkuTtFuZtdgV8lW+Bz6djrHH1DGjgdXLCZBuj5ttnVPIk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:6237ec74-7e0b-4215-8587-c2e356a95344,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:1fcc6f8,CLOUDID:721cbe42-d291-4e62-b539-43d7d78362ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7783ca28314611ee83ed1395ce914268-20230802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 813507891; Wed, 02 Aug 2023 08:08:41 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Aug 2023 22:48:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Aug 2023 22:48:04 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eugen Hristev
	<eugen.hristev@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>
Subject: [PATCH v8 6/8] drm/mediatek: Add ability to support dynamic connector selection
Date: Wed, 2 Aug 2023 22:48:00 +0800
Message-ID: <20230802144802.751-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230802144802.751-1-jason-jh.lin@mediatek.com>
References: <20230802144802.751-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_080848_053498_7039D61F 
X-CRM114-Status: GOOD (  23.12  )
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

1. Move output drm connector from each ddp_path array to connector array.
2. Add dynamic select available connector flow in crtc create and enable.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 81 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 27 ++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 20 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  7 ++
 5 files changed, 133 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..c57012f9c0c8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -62,6 +62,8 @@ struct mtk_drm_crtc {
 	struct mtk_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
+	unsigned int			num_conn_routes;
+	const struct mtk_drm_route	*conn_routes;
 
 	/* lock for display hardware access */
 	struct mutex			hw_lock;
@@ -649,6 +651,47 @@ static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 	mtk_ddp_comp_disable_vblank(comp);
 }
 
+static void mtk_drm_crtc_update_output(struct drm_crtc *crtc,
+				       struct drm_atomic_state *state)
+{
+	int crtc_index = drm_crtc_index(crtc);
+	int i;
+	struct device *dev;
+	struct drm_crtc_state *crtc_state = state->crtcs[crtc_index].new_state;
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	unsigned int comp_id;
+	unsigned int encoder_mask = crtc_state->encoder_mask;
+
+	if (!crtc_state->connectors_changed)
+		return;
+
+	if (!mtk_crtc->num_conn_routes)
+		return;
+
+	priv = priv->all_drm_private[crtc_index];
+	dev = priv->dev;
+
+	dev_dbg(dev, "connector change:%d, encoder mask:0x%x for crtc:%d\n",
+		crtc_state->connectors_changed, encoder_mask, crtc_index);
+
+	for (i = 0; i < mtk_crtc->num_conn_routes; i++) {
+		struct mtk_ddp_comp *comp;
+
+		comp_id = mtk_crtc->conn_routes[i].route_ddp;
+		comp = &priv->ddp_comp[comp_id];
+		if (comp->encoder_index >= 0 &&
+		    encoder_mask & BIT(comp->encoder_index)) {
+			mtk_crtc->ddp_comp[mtk_crtc->ddp_comp_nr - 1] = comp;
+			dev_dbg(dev, "Add comp_id: %d at path index %d\n",
+				comp->id, mtk_crtc->ddp_comp_nr - 1);
+			break;
+		}
+	}
+
+	dev_dbg(dev, "Update total comp num:%d", mtk_crtc->ddp_comp_nr);
+}
+
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state)
 {
@@ -681,6 +724,8 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 
+	mtk_drm_crtc_update_output(crtc, state);
+
 	ret = pm_runtime_resume_and_get(comp->dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n", ret);
@@ -886,7 +931,8 @@ struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
 
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const unsigned int *path, unsigned int path_len,
-			int priv_data_index)
+			int priv_data_index, const struct mtk_drm_route *conn_routes,
+			unsigned int num_conn_routes)
 {
 	struct mtk_drm_private *priv = drm_dev->dev_private;
 	struct device *dev = drm_dev->dev;
@@ -1040,5 +1086,38 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		init_waitqueue_head(&mtk_crtc->cb_blocking_queue);
 	}
 #endif
+
+	if (conn_routes) {
+		struct device_node *node;
+		struct mtk_ddp_comp *comp;
+		unsigned int comp_id;
+
+		for (i = 0; i < num_conn_routes; i++) {
+			comp_id = conn_routes[i].route_ddp;
+			node = priv->comp_node[comp_id];
+			comp = &priv->ddp_comp[comp_id];
+
+			if (!comp->dev) {
+				dev_dbg(dev, "comp_id:%d, Component %pOF not initialized\n",
+					comp_id, node);
+				comp->encoder_index = -1;
+				continue;
+			}
+
+			mtk_ddp_comp_encoder_index_set(&priv->ddp_comp[comp_id]);
+		}
+
+		mtk_crtc->num_conn_routes = num_conn_routes;
+		mtk_crtc->conn_routes = conn_routes;
+
+		/* append the last ddp_comp and ddp_comp_nr at the end of mtk_drm_crtc_create */
+		mtk_crtc->ddp_comp[mtk_crtc->ddp_comp_nr] =
+			devm_kmalloc(dev, sizeof(*mtk_crtc->ddp_comp), GFP_KERNEL);
+		if (!mtk_crtc->ddp_comp[mtk_crtc->ddp_comp_nr])
+			return -ENOMEM;
+
+		mtk_crtc->ddp_comp_nr++;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 3e9046993d09..3c224595fa71 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_crtc.h>
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
 
 #define MTK_LUT_SIZE	512
@@ -18,7 +19,9 @@ void mtk_drm_crtc_commit(struct drm_crtc *crtc);
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const unsigned int *path,
 			unsigned int path_len,
-			int priv_data_index);
+			int priv_data_index,
+			const struct mtk_drm_route *conn_routes,
+			unsigned int num_conn_routes);
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state);
 void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index effaaa769b46..c1ea112e6be8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -508,6 +508,23 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
 	return false;
 }
 
+static int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
+					      const struct mtk_drm_route *routes,
+					      unsigned int num_routes,
+					      struct mtk_ddp_comp *ddp_comp)
+{
+	unsigned int i;
+
+	if (!routes)
+		return -EINVAL;
+
+	for (i = 0; i < num_routes; i++)
+		if (dev == ddp_comp[routes[i].route_ddp].dev)
+			return BIT(routes[i].crtc_id);
+
+	return -ENODEV;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type)
 {
@@ -539,7 +556,15 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 					  private->data->third_len, private->ddp_comp))
 		ret = BIT(2);
 	else
-		DRM_INFO("Failed to find comp in ddp table\n");
+		ret = mtk_drm_find_comp_in_ddp_conn_path(dev,
+							 private->data->conn_routes,
+							 private->data->num_conn_routes,
+							 private->ddp_comp);
+
+	if (ret <= 0) {
+		DRM_INFO("Failed to find comp in ddp table, ret =%d\n", ret);
+		ret = 0;
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index c12886f31e54..9900007667a2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -185,7 +185,10 @@ static const unsigned int mt8188_mtk_ddp_main[] = {
 	DDP_COMPONENT_GAMMA,
 	DDP_COMPONENT_POSTMASK0,
 	DDP_COMPONENT_DITHER0,
-	DDP_COMPONENT_DP_INTF0,
+};
+
+static const struct mtk_drm_route mt8188_mtk_ddp_main_routes[] = {
+	{0, DDP_COMPONENT_DP_INTF0},
 };
 
 static const unsigned int mt8192_mtk_ddp_main[] = {
@@ -287,6 +290,8 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.main_path = mt8188_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
+	.conn_routes = mt8188_mtk_ddp_main_routes,
+	.num_conn_routes = ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
 	.mmsys_dev_num = 1,
 };
 
@@ -419,6 +424,11 @@ static bool mtk_drm_find_mmsys_comp(struct mtk_drm_private *private, int comp_id
 			if (drv_data->third_path[i] == comp_id)
 				return true;
 
+	if (drv_data->num_conn_routes)
+		for (i = 0; i < drv_data->num_conn_routes; i++)
+			if (drv_data->conn_routes[i].route_ddp == comp_id)
+				return true;
+
 	return false;
 }
 
@@ -477,21 +487,23 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 			if (i == CRTC_MAIN && priv_n->data->main_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
-							  priv_n->data->main_len, j);
+							  priv_n->data->main_len, j,
+							  priv_n->data->conn_routes,
+							  priv_n->data->num_conn_routes);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
 			} else if (i == CRTC_EXT && priv_n->data->ext_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->ext_path,
-							  priv_n->data->ext_len, j);
+							  priv_n->data->ext_len, j, NULL, 0);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
 			} else if (i == CRTC_THIRD && priv_n->data->third_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->third_path,
-							  priv_n->data->third_len, j);
+							  priv_n->data->third_len, j, NULL, 0);
 				if (ret)
 					goto err_component_unbind;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index f4de8bb27685..6f98fff4f1a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -28,6 +28,11 @@ struct drm_fb_helper;
 struct drm_property;
 struct regmap;
 
+struct mtk_drm_route {
+	const unsigned int crtc_id;
+	const unsigned int route_ddp;
+};
+
 struct mtk_mmsys_driver_data {
 	const unsigned int *main_path;
 	unsigned int main_len;
@@ -35,6 +40,8 @@ struct mtk_mmsys_driver_data {
 	unsigned int ext_len;
 	const unsigned int *third_path;
 	unsigned int third_len;
+	const struct mtk_drm_route *conn_routes;
+	unsigned int num_conn_routes;
 
 	bool shadow_register;
 	unsigned int mmsys_id;
-- 
2.18.0



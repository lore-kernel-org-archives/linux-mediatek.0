Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E77CDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 04:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbjXlNeTaWOAgDiP7qRRiuPNtFIqTcPeM3WN/tA9eQc=; b=s0+1PCc8eoKesR5IdvwUwhsaGa
	cKy+L0LlgxaUztuQ3UUFC+qF2QabvDT09AD65POCQwtQzlfPRUlRaWWRu2P6ps8rJ50cq2B+6+E1a
	8Rt+fyAquWBIQN/+oHs3rq0GtfnZrQwn0E3IOH+iNvDneprmJ5bV6niLEwCUTWTo0UJTyxRv0nec+
	Vg8Ftleut33PfjKsO6b+xbP+XqAmZSNNzRIL3LPFMUWRIlIL4SB748YS2lPqt4Sna77R9e58OmMBt
	27AYOiyytrNzQ4dVa0G12EhOAIgCHrGF7DRnU5CevK9mzFhaMUZ9lCfUzRK/HElmSn6WKuy+sJGS6
	rCI8L/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsyK4-00DlAx-20;
	Wed, 18 Oct 2023 04:38:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsyIq-00DjxE-1Y;
	Wed, 18 Oct 2023 04:37:08 +0000
X-UUID: fa1200c66d6f11ee86758d4a7c00f3a0-20231017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gbjXlNeTaWOAgDiP7qRRiuPNtFIqTcPeM3WN/tA9eQc=;
	b=ryoyhtcAHbLBDDANTvUppiSI1ByEbt9C68EBbUX65/c9Ho5QarPp1+S1dSpMFb3f2yNTvXKkjrkrf9imdXgnfPMqjm8/kK9ZGh0TSceFgdZlE412pF+n4Bb5VfosbbeOJEV+vAaJ3WRj5tHA/RnqLNG/FH1NIivWTrT1NjnpDmE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:1091b053-8f5e-4a35-933a-ec49a5810058,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:c7e90fc0-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fa1200c66d6f11ee86758d4a7c00f3a0-20231017
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 115909678; Tue, 17 Oct 2023 21:36:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Oct 2023 12:36:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 18 Oct 2023 12:36:55 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v9 22/23] drm/mediatek: Power on devices in OVL adaptor when atomic enable
Date: Wed, 18 Oct 2023 12:36:49 +0800
Message-ID: <20231018043650.22532-23-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231018043650.22532-1-shawn.sung@mediatek.com>
References: <20231018043650.22532-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_213704_565735_E54373B0 
X-CRM114-Status: GOOD (  28.01  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Different from OVL, OVL adaptor is a pseudo device so we didn't
define it in the device tree, consequently, pm_runtime_resume_and_get()
called by .atomic_enable() powers on no device in OVL adaptor and
leads to power outage in the corresponding IOMMU.

To resolve the issue, we implement a function to power on the RDMAs
in OVL adaptor, and the system will make sure the IOMMU is powered on
as well because of the device link (iommus) in the RDMA nodes in DTS.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  4 ++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 63 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 28 +++------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   | 20 ++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 16 +++++
 6 files changed, 112 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index e2b602037ac3..c44f5b31bab5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -109,6 +109,8 @@ void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev,
 			     unsigned int next);
 void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev,
 				unsigned int next);
+int mtk_ovl_adaptor_power_on(struct device *dev);
+void mtk_ovl_adaptor_power_off(struct device *dev);
 int mtk_ovl_adaptor_clk_enable(struct device *dev);
 void mtk_ovl_adaptor_clk_disable(struct device *dev);
 void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
@@ -150,6 +152,8 @@ void mtk_rdma_disable_vblank(struct device *dev);
 const u32 *mtk_rdma_get_formats(struct device *dev);
 size_t mtk_rdma_get_num_formats(struct device *dev);
 
+int mtk_mdp_rdma_power_on(struct device *dev);
+void mtk_mdp_rdma_power_off(struct device *dev);
 int mtk_mdp_rdma_clk_enable(struct device *dev);
 void mtk_mdp_rdma_clk_disable(struct device *dev);
 void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 753a7f829173..35bbce35b7b5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -98,6 +98,8 @@ static const struct mtk_ddp_comp_funcs padding = {
 };
 
 static const struct mtk_ddp_comp_funcs rdma = {
+	.power_on = mtk_mdp_rdma_power_on,
+	.power_off = mtk_mdp_rdma_power_off,
 	.clk_enable = mtk_mdp_rdma_clk_enable,
 	.clk_disable = mtk_mdp_rdma_clk_disable,
 };
@@ -241,6 +243,67 @@ void mtk_ovl_adaptor_stop(struct device *dev)
 	}
 }
 
+/**
+ * power_off - Power off the devices in OVL adaptor
+ * @dev: Device to be powered off
+ * @num: Number of the devices to be powered off
+ *
+ * Calls the .power_off() ovl_adaptor component callback if it is present.
+ */
+static inline void power_off(struct device *dev, unsigned int num)
+{
+	int i;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	if (num > OVL_ADAPTOR_ID_MAX)
+		num = OVL_ADAPTOR_ID_MAX;
+
+	for (i = num - 1; i >= 0; i--) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i] ||
+		    !comp_matches[i].funcs->power_off)
+			continue;
+
+		comp_matches[i].funcs->power_off(ovl_adaptor->ovl_adaptor_comp[i]);
+	}
+}
+
+/**
+ * mtk_ovl_adaptor_power_on - Power on the devices in OVL adaptor
+ * @dev: Device to be powered on
+ *
+ * Different from OVL, OVL adaptor is a pseudo device so
+ * we didn't define it in the device tree, pm_runtime_resume_and_get()
+ * called by .atomic_enable() power on no device in OVL adaptor,
+ * we have to implement a function to do the job instead.
+ *
+ * Return: Zero for success or negative number for failure.
+ */
+int mtk_ovl_adaptor_power_on(struct device *dev)
+{
+	int i, ret;
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i] ||
+		    !comp_matches[i].funcs->power_on)
+			continue;
+
+		ret = comp_matches[i].funcs->power_on(ovl_adaptor->ovl_adaptor_comp[i]);
+		if (ret < 0) {
+			dev_err(ovl_adaptor->ovl_adaptor_comp[i],
+				"Failed to power on: %d\n", ret);
+			power_off(dev, i);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+void mtk_ovl_adaptor_power_off(struct device *dev)
+{
+	power_off(dev, OVL_ADAPTOR_ID_MAX);
+}
+
 int mtk_ovl_adaptor_clk_enable(struct device *dev)
 {
 	int i;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index a0b2ba3cbcdb..c7edd80be428 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -6,7 +6,6 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/mailbox_controller.h>
-#include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
@@ -362,22 +361,16 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc, struct drm_atomic
 		drm_connector_list_iter_end(&conn_iter);
 	}
 
-	ret = pm_runtime_resume_and_get(crtc->dev->dev);
-	if (ret < 0) {
-		DRM_ERROR("Failed to enable power domain: %d\n", ret);
-		return ret;
-	}
-
 	ret = mtk_mutex_prepare(mtk_crtc->mutex);
 	if (ret < 0) {
 		DRM_ERROR("Failed to enable mutex clock: %d\n", ret);
-		goto err_pm_runtime_put;
+		goto error;
 	}
 
 	ret = mtk_crtc_ddp_clk_enable(mtk_crtc);
 	if (ret < 0) {
 		DRM_ERROR("Failed to enable component clocks: %d\n", ret);
-		goto err_mutex_unprepare;
+		goto error;
 	}
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
@@ -426,16 +419,13 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc, struct drm_atomic
 
 	return 0;
 
-err_mutex_unprepare:
+error:
 	mtk_mutex_unprepare(mtk_crtc->mutex);
-err_pm_runtime_put:
-	pm_runtime_put(crtc->dev->dev);
 	return ret;
 }
 
 static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 {
-	struct drm_device *drm = mtk_crtc->base.dev;
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	int i;
 
@@ -465,8 +455,6 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 	mtk_crtc_ddp_clk_disable(mtk_crtc);
 	mtk_mutex_unprepare(mtk_crtc->mutex);
 
-	pm_runtime_put(drm->dev);
-
 	if (crtc->state->event && !crtc->state->active) {
 		spin_lock_irq(&crtc->dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
@@ -774,7 +762,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 	}
 
-	ret = pm_runtime_resume_and_get(comp->dev);
+	ret = mtk_ddp_comp_power_on(comp);
 	if (ret < 0) {
 		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n", ret);
 		return;
@@ -782,7 +770,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	ret = mtk_crtc_ddp_hw_init(mtk_crtc, state);
 	if (ret) {
-		pm_runtime_put(comp->dev);
+		mtk_ddp_comp_power_off(comp);
 		return;
 	}
 
@@ -795,7 +783,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-	int i, ret;
+	int i;
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 	if (!mtk_crtc->enabled)
@@ -825,9 +813,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 	mtk_crtc_ddp_hw_fini(mtk_crtc);
-	ret = pm_runtime_put(comp->dev);
-	if (ret < 0)
-		DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n", ret);
+	mtk_ddp_comp_power_off(comp);
 
 	mtk_crtc->enabled = false;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 10402e07a4a7..9940909c7435 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -396,6 +396,8 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
+	.power_on = mtk_ovl_adaptor_power_on,
+	.power_off = mtk_ovl_adaptor_power_off,
 	.clk_enable = mtk_ovl_adaptor_clk_enable,
 	.clk_disable = mtk_ovl_adaptor_clk_disable,
 	.config = mtk_ovl_adaptor_config,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 1c1d670cfe41..2597dd7ac0d2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -7,6 +7,7 @@
 #define MTK_DRM_DDP_COMP_H
 
 #include <linux/io.h>
+#include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
@@ -46,6 +47,8 @@ enum mtk_ddp_comp_type {
 struct mtk_ddp_comp;
 struct cmdq_pkt;
 struct mtk_ddp_comp_funcs {
+	int (*power_on)(struct device *dev);
+	void (*power_off)(struct device *dev);
 	int (*clk_enable)(struct device *dev);
 	void (*clk_disable)(struct device *dev);
 	void (*config)(struct device *dev, unsigned int w,
@@ -91,6 +94,23 @@ struct mtk_ddp_comp {
 	int encoder_index;
 };
 
+static inline int mtk_ddp_comp_power_on(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->power_on)
+		return comp->funcs->power_on(comp->dev);
+	else
+		return pm_runtime_resume_and_get(comp->dev);
+	return 0;
+}
+
+static inline void mtk_ddp_comp_power_off(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->power_off)
+		comp->funcs->power_off(comp->dev);
+	else
+		pm_runtime_put(comp->dev);
+}
+
 static inline int mtk_ddp_comp_clk_enable(struct mtk_ddp_comp *comp)
 {
 	if (comp->funcs && comp->funcs->clk_enable)
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index cb36a961786f..8feeb6dce217 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -243,6 +243,22 @@ size_t mtk_mdp_rdma_get_num_formats(struct device *dev)
 	return ARRAY_SIZE(formats);
 }
 
+int mtk_mdp_rdma_power_on(struct device *dev)
+{
+	int ret = pm_runtime_resume_and_get(dev);
+
+	if (ret < 0) {
+		dev_err(dev, "Failed to power on: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+void mtk_mdp_rdma_power_off(struct device *dev)
+{
+	pm_runtime_put(dev);
+}
+
 int mtk_mdp_rdma_clk_enable(struct device *dev)
 {
 	struct mtk_mdp_rdma *rdma = dev_get_drvdata(dev);
-- 
2.18.0



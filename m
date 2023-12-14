Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84009C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 05:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzTxvIK+6W2eU4tTsg+v5yMdYNXEpNz3g/b/lbRszQA=; b=Zjj8zxyySz7TkaYqBoCquj+rBx
	PWor0AMTxbkZpY1zLcKzkG7f4u8S6IrRanouyjpljxNq+3Q14Xc1OCb87cNIYCR0C2MA1B5q83HVK
	mUXD1ph8lvFiyVHwZ4bkJBp0RBAiF2IlT1HGAq914FEJpxAPjkbt2XugyNw5HRm8uId69ednrd5Ni
	V0C5HimzjYpa9C0KtVNPBpcCV8YlQrU+p/nhmzyLyQFc770CoLRUe8IMovM4TaWF3Z5gG9UyNLmJG
	SnA9ShHutx7sySc3qOpFp8QpI9GFXZA14Ds/f/cv5mZinxnSVwqIA9FFWIZ4T7p2rj8bXLN/pK1gt
	mSsDh6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDekt-00GsJu-1q;
	Thu, 14 Dec 2023 05:59:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDekT-00Grpf-0p;
	Thu, 14 Dec 2023 05:59:08 +0000
X-UUID: dcff2e0c9a4511ee958cff29c719f35b-20231213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SzTxvIK+6W2eU4tTsg+v5yMdYNXEpNz3g/b/lbRszQA=;
	b=G8nGd8Ft+DUFvfthnnQUOIsgqJgssXl/00vYJophWPhCI09jx5JV72mD0RrJGKfx4nOMy79LSLoM1TCTkP9iSBr2kJlAePj9gL+gQc60LbRfUWajdmRU2EbO/npIJcbPMycIYxhcaEg+LeihDc9QoHhClmdXYdlkOODVqSr68bg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:8396fb0c-9a5d-4193-a66b-46908c93cb2a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:cb5fc673-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dcff2e0c9a4511ee958cff29c719f35b-20231213
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 186668699; Wed, 13 Dec 2023 22:58:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Dec 2023 13:58:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Dec 2023 13:58:50 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Matthias Brugger <matthias.bgg@gmail.com>, Moudy Ho <moudy.ho@mediatek.com>,
	Hsiao Chien Sung <shawn.sung@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, "Roy-CW .
 Yeh" <roy-cw.yeh@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	xinlei lee <xinlei.lee@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v12 14/23] drm/mediatek: Power on/off devices with function pointers
Date: Thu, 14 Dec 2023 13:58:38 +0800
Message-ID: <20231214055847.4936-15-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231214055847.4936-1-shawn.sung@mediatek.com>
References: <20231214055847.4936-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_215905_354573_2E55A848 
X-CRM114-Status: GOOD (  26.47  )
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

Different from OVL, OVL adaptor is a pseudo device so we didn't
define it in the device tree, consequently, pm_runtime_resume_and_get()
called by .atomic_enable() powers on no device. For this reason, we
implement a function to power on the RDMAs in OVL adaptor, and the
system will make sure the IOMMUs are powered on as well because of the
device link (iommus) in the RDMA nodes in DTS.

This patch separates power and clock management process, it would be
easier to maintain and add extensions.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  4 +
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 75 +++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 10 +--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   | 20 +++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 16 ++++
 6 files changed, 107 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 1311562d25cc..2d426775b7ea 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -110,6 +110,8 @@ void mtk_ovl_adaptor_connect(struct device *dev, struct device *mmsys_dev,
 			     unsigned int next);
 void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys_dev,
 				unsigned int next);
+int mtk_ovl_adaptor_power_on(struct device *dev);
+void mtk_ovl_adaptor_power_off(struct device *dev);
 int mtk_ovl_adaptor_clk_enable(struct device *dev);
 void mtk_ovl_adaptor_clk_disable(struct device *dev);
 void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
@@ -151,6 +153,8 @@ void mtk_rdma_disable_vblank(struct device *dev);
 const u32 *mtk_rdma_get_formats(struct device *dev);
 size_t mtk_rdma_get_num_formats(struct device *dev);
 
+int mtk_mdp_rdma_power_on(struct device *dev);
+void mtk_mdp_rdma_power_off(struct device *dev);
 int mtk_mdp_rdma_clk_enable(struct device *dev);
 void mtk_mdp_rdma_clk_disable(struct device *dev);
 void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index a815dc8e2110..e00d8a395ca0 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -80,6 +80,8 @@ static const struct mtk_ddp_comp_funcs merge = {
 };
 
 static const struct mtk_ddp_comp_funcs rdma = {
+	.power_on = mtk_mdp_rdma_power_on,
+	.power_off = mtk_mdp_rdma_power_off,
 	.clk_enable = mtk_mdp_rdma_clk_enable,
 	.clk_disable = mtk_mdp_rdma_clk_disable,
 };
@@ -201,21 +203,72 @@ void mtk_ovl_adaptor_stop(struct device *dev)
 	mtk_ethdr_stop(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
 }
 
-int mtk_ovl_adaptor_clk_enable(struct device *dev)
+/**
+ * power_off - Power off the devices in OVL adaptor
+ * @dev: Device to be powered off
+ * @num: Number of the devices to be powered off
+ *
+ * Calls the .power_off() ovl_adaptor component callback if it is present.
+ */
+static inline void power_off(struct device *dev, int num)
 {
 	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
-	struct device *comp;
-	int ret;
 	int i;
 
-	for (i = 0; i < OVL_ADAPTOR_MERGE0; i++) {
-		comp = ovl_adaptor->ovl_adaptor_comp[i];
-		ret = pm_runtime_get_sync(comp);
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
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	int i, ret;
+
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i] ||
+		    !comp_matches[i].funcs->power_on)
+			continue;
+
+		ret = comp_matches[i].funcs->power_on(ovl_adaptor->ovl_adaptor_comp[i]);
 		if (ret < 0) {
 			dev_err(dev, "Failed to enable power domain %d, err %d\n", i, ret);
-			goto error;
+			power_off(dev, i);
+			return ret;
 		}
 	}
+	return 0;
+}
+
+void mtk_ovl_adaptor_power_off(struct device *dev)
+{
+	power_off(dev, OVL_ADAPTOR_ID_MAX);
+}
+
+int mtk_ovl_adaptor_clk_enable(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+	struct device *comp;
+	int ret;
+	int i;
 
 	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
 		comp = ovl_adaptor->ovl_adaptor_comp[i];
@@ -226,16 +279,10 @@ int mtk_ovl_adaptor_clk_enable(struct device *dev)
 			dev_err(dev, "Failed to enable clock %d, err %d\n", i, ret);
 			while (--i >= 0)
 				comp_matches[i].funcs->clk_disable(comp);
-			i = OVL_ADAPTOR_MERGE0;
-			goto error;
+			return ret;
 		}
 	}
 	return 0;
-error:
-	while (--i >= 0)
-		pm_runtime_put(ovl_adaptor->ovl_adaptor_comp[i]);
-
-	return ret;
 }
 
 void mtk_ovl_adaptor_clk_disable(struct device *dev)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index c277b9fae950..4d5ff39dc2ef 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -721,7 +721,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 
-	ret = pm_runtime_resume_and_get(comp->dev);
+	ret = mtk_ddp_comp_power_on(comp);
 	if (ret < 0) {
 		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n", ret);
 		return;
@@ -731,7 +731,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
 	if (ret) {
-		pm_runtime_put(comp->dev);
+		mtk_ddp_comp_power_off(comp);
 		return;
 	}
 
@@ -744,7 +744,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-	int i, ret;
+	int i;
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 	if (!mtk_crtc->enabled)
@@ -774,9 +774,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 	mtk_crtc_ddp_hw_fini(mtk_crtc);
-	ret = pm_runtime_put(comp->dev);
-	if (ret < 0)
-		DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n", ret);
+	mtk_ddp_comp_power_off(comp);
 
 	mtk_crtc->enabled = false;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 3046c0409353..a9b5a21cde2d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -398,6 +398,8 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
+	.power_on = mtk_ovl_adaptor_power_on,
+	.power_off = mtk_ovl_adaptor_power_off,
 	.clk_enable = mtk_ovl_adaptor_clk_enable,
 	.clk_disable = mtk_ovl_adaptor_clk_disable,
 	.config = mtk_ovl_adaptor_config,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 4bae55bdb034..15b2eafff438 100644
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
@@ -92,6 +95,23 @@ struct mtk_ddp_comp {
 	const struct mtk_ddp_comp_funcs *funcs;
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
index c3adaeefd551..dc7c9e991990 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -242,6 +242,22 @@ size_t mtk_mdp_rdma_get_num_formats(struct device *dev)
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



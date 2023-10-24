Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446F3C25B48
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 13:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BP2yqgHClt6hgOu3mKbZnUqOzvqQvdUhgLU6NBmNZoc=; b=LKUBYjABrR7B1sX97LJZuJKc0I
	VysEpsSgxa6Iyu6UN92L5spndXVga+H5zb9CGEt1n6Q80UHUx8cUTTFCERnZXK/e/OQsLM7I82bX4
	aHsSuf46oU+t+zWVZh6apVAhGa2aAnzoeozyMCKwZcdRLESTJUL1Er7rsXzdHPeg/NovMM6cC2Sjw
	V83M5ze2cmujXcftGgxp1fF+UZrNc5RNF7xomFU04j+25lBj07Uxm9syiWwQLezyT3xjd40M6d0er
	vz4S6s0wNveoViF3nK0J3CH+dNBwp8gVuu6EUk3tyYU8fBJ4rdTUgIU5SWp6m3aNV3lJM0S0Lk+4s
	WvZE0bRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvH2E-009qmw-0h;
	Tue, 24 Oct 2023 13:01:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvH1s-009qWx-2L;
	Tue, 24 Oct 2023 13:01:12 +0000
X-UUID: 5f3c7bb4726d11ee86758d4a7c00f3a0-20231024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BP2yqgHClt6hgOu3mKbZnUqOzvqQvdUhgLU6NBmNZoc=;
	b=aWfqUobeYblW8mmfCskIpeNj+tTUmxBRW0+OdFpR8CcWjt2DrsXLGAqbYT8ukzMSnmRqc1+BvCotO/hNVstoTLeK27/tmflwQcD6rsUwDlLMT4kk72+fua8izJTWEWgWugu1dIm8Tmtoy2UT/adHQobFjw8l/hETMQzXrZnqk2M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:af2afd56-3b51-49d0-ad97-f6fc71477743,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:b3809394-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5f3c7bb4726d11ee86758d4a7c00f3a0-20231024
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 56523543; Tue, 24 Oct 2023 06:00:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Oct 2023 21:00:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Oct 2023 21:00:54 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v11 14/23] drm/mediatek: Power on/off devices with function pointers
Date: Tue, 24 Oct 2023 21:00:39 +0800
Message-ID: <20231024130048.14749-15-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231024130048.14749-1-shawn.sung@mediatek.com>
References: <20231024130048.14749-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_060104_846728_2308BDEB 
X-CRM114-Status: GOOD (  26.32  )
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
index bf06ccb65652..8465beeab435 100644
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
index 81067f49ea69..048d56ee344d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -79,6 +79,8 @@ static const struct mtk_ddp_comp_funcs merge = {
 };
 
 static const struct mtk_ddp_comp_funcs rdma = {
+	.power_on = mtk_mdp_rdma_power_on,
+	.power_off = mtk_mdp_rdma_power_off,
 	.clk_enable = mtk_mdp_rdma_clk_enable,
 	.clk_disable = mtk_mdp_rdma_clk_disable,
 };
@@ -200,21 +202,72 @@ void mtk_ovl_adaptor_stop(struct device *dev)
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
@@ -225,16 +278,10 @@ int mtk_ovl_adaptor_clk_enable(struct device *dev)
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
index a0b2ba3cbcdb..bc4cc75cca18 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -774,7 +774,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 	}
 
-	ret = pm_runtime_resume_and_get(comp->dev);
+	ret = mtk_ddp_comp_power_on(comp);
 	if (ret < 0) {
 		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n", ret);
 		return;
@@ -782,7 +782,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	ret = mtk_crtc_ddp_hw_init(mtk_crtc, state);
 	if (ret) {
-		pm_runtime_put(comp->dev);
+		mtk_ddp_comp_power_off(comp);
 		return;
 	}
 
@@ -795,7 +795,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-	int i, ret;
+	int i;
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 	if (!mtk_crtc->enabled)
@@ -825,9 +825,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 
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
index 5746f06220c1..769ae7564da2 100644
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



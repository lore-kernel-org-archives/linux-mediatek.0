Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC88BC7EE2F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 12:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlsKd1xRujfpIYovDuZ/xowCpeEy76JvOwFCL04G64Q=; b=zqUGLEsXXb7WArz/nl8/Tly8vS
	qvFqd1aH0B4t7XkoK8ynHEuOGCKflfbCjYxy5nunAQZpzgjvbbMExWiOjxoawaztlIHzodZ0pHW3K
	PCIj4j7/SBuMJhIFv/aUbCYebL26/xS1gX0C3E78J4g3yo5bbch5TC+5qW6edNz/Y9OAN2IHcfenw
	u5G8NX1ykvUSf/8mEo3gX9g3sFW0ryGi1hth/MaT0af8Qp2aPqF97msQktj6j4Z3nHAtErD+PhI+w
	Feks6NP2wiZkMOvDgtP4dKVDockv9b4l719PtdifQJn8lm0z0p+uwW4GFge2B565xxl4ClNPd1xVB
	6MAIdfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4hRT-003X06-1Y;
	Thu, 01 Jun 2023 12:30:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4h8R-003O1P-0o;
	Thu, 01 Jun 2023 12:10:33 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5194E6606ECA;
	Thu,  1 Jun 2023 13:10:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685621430;
	bh=uez5eoRMhsgOOXOBI1JFSa4MIzsNoJQ/JLxh/1eaBjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V95ztNcsT49ja3BN7FZ0uaamUJ/Efrq19oJ8F+0crkKcxkG/3WB0KMCc2YycdJO31
	 eqxzeUrUSKblIDj4mFAZBZoUCH4Adtbi+4OAcgabK6GNpntWBDnCl0rb7/oUGXlglW
	 mL7tCDee4MQEPkzPaT9F1EHn5H1jOG/OHORDsgtNhR0Omr44OmA920guP8Z7lLWd6h
	 5CHE0+C6VGB11Ng7jRQqB8+0VgybP/7Q39f6+DQF8E1UhtQuyXwd8DjkmW37DhlNrF
	 hWKr3CWmt2sdqH/9z/zC+givgOakgrAGMUXOl9WxO0ODYaUTKM1g9vfr/TTlB0vdj8
	 JjW+cB8Yz7JjQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>
Subject: [PATCH v5 03/11] drm/mediatek: gamma: Support SoC specific LUT size
Date: Thu,  1 Jun 2023 14:10:14 +0200
Message-Id: <20230601121022.2401844-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601121022.2401844-1-angelogioacchino.delregno@collabora.com>
References: <20230601121022.2401844-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_051031_538453_0D83C21A 
X-CRM114-Status: GOOD (  20.19  )
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

Newer SoCs support a bigger Gamma LUT table: wire up a callback
to retrieve the correct LUT size for each different Gamma IP.

Co-developed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
[Angelo: Rewritten commit message/description + porting]
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 25 ++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 ++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 ++++++++
 6 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 75045932353e..e554b19f4830 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -53,6 +53,7 @@ void mtk_gamma_clk_disable(struct device *dev);
 void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int h, unsigned int vrefresh,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+unsigned int mtk_gamma_get_lut_size(struct device *dev);
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
 void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state);
 void mtk_gamma_start(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index ce6f2499b891..b25ba209e7a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -25,10 +25,12 @@
 #define DISP_GAMMA_LUT				0x0700
 
 #define LUT_10BIT_MASK				0x03ff
+#define LUT_SIZE_DEFAULT			512
 
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
+	u16 lut_size;
 };
 
 /*
@@ -55,6 +57,17 @@ void mtk_gamma_clk_disable(struct device *dev)
 	clk_disable_unprepare(gamma->clk);
 }
 
+unsigned int mtk_gamma_get_lut_size(struct device *dev)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+	unsigned int lut_size = LUT_SIZE_DEFAULT;
+
+	if (gamma && gamma->data)
+		lut_size = gamma->data->lut_size;
+
+	return lut_size;
+}
+
 void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
@@ -62,6 +75,7 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	bool lut_diff;
+	u16 lut_size;
 	u32 word;
 	u32 diff[3] = {0};
 
@@ -69,17 +83,20 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	if (!state->gamma_lut)
 		return;
 
-	if (gamma && gamma->data)
+	if (gamma && gamma->data) {
 		lut_diff = gamma->data->lut_diff;
-	else
+		lut_size = gamma->data->lut_size;
+	} else {
 		lut_diff = false;
+		lut_size = LUT_SIZE_DEFAULT;
+	}
 
 	reg = readl(regs + DISP_GAMMA_CFG);
 	reg = reg | GAMMA_LUT_EN;
 	writel(reg, regs + DISP_GAMMA_CFG);
 	lut_base = regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
-	for (i = 0; i < MTK_LUT_SIZE; i++) {
+	for (i = 0; i < lut_size; i++) {
 		if (!lut_diff || (i % 2 == 0)) {
 			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
 				(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
@@ -196,10 +213,12 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
+	.lut_size = 512,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
 	.lut_diff = true,
+	.lut_size = 512,
 };
 
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..0df62b076f49 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -958,8 +958,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		mtk_crtc->ddp_comp[i] = comp;
 
 		if (comp->funcs) {
-			if (comp->funcs->gamma_set)
-				gamma_lut_size = MTK_LUT_SIZE;
+			if (comp->funcs->gamma_set && comp->funcs->gamma_get_lut_size)
+				gamma_lut_size = mtk_ddp_gamma_get_lut_size(comp);
 
 			if (comp->funcs->ctm_set)
 				has_ctm = true;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 3e9046993d09..b2e50292e57d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -10,7 +10,6 @@
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_plane.h"
 
-#define MTK_LUT_SIZE	512
 #define MTK_MAX_BPC	10
 #define MTK_MIN_BPC	3
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index f114da4d36a9..c77af2e4000f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -322,6 +322,7 @@ static const struct mtk_ddp_comp_funcs ddp_dsi = {
 static const struct mtk_ddp_comp_funcs ddp_gamma = {
 	.clk_enable = mtk_gamma_clk_enable,
 	.clk_disable = mtk_gamma_clk_disable,
+	.gamma_get_lut_size = mtk_gamma_get_lut_size,
 	.gamma_set = mtk_gamma_set,
 	.config = mtk_gamma_config,
 	.start = mtk_gamma_start,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index febcaeef16a1..c1355960e195 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -67,6 +67,7 @@ struct mtk_ddp_comp_funcs {
 	void (*layer_config)(struct device *dev, unsigned int idx,
 			     struct mtk_plane_state *state,
 			     struct cmdq_pkt *cmdq_pkt);
+	unsigned int (*gamma_get_lut_size)(struct device *dev);
 	void (*gamma_set)(struct device *dev,
 			  struct drm_crtc_state *state);
 	void (*bgclr_in_on)(struct device *dev);
@@ -186,6 +187,14 @@ static inline void mtk_ddp_comp_layer_config(struct mtk_ddp_comp *comp,
 		comp->funcs->layer_config(comp->dev, idx, state, cmdq_pkt);
 }
 
+static inline unsigned int mtk_ddp_gamma_get_lut_size(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->gamma_get_lut_size)
+		return comp->funcs->gamma_get_lut_size(comp->dev);
+
+	return 0;
+}
+
 static inline void mtk_ddp_gamma_set(struct mtk_ddp_comp *comp,
 				     struct drm_crtc_state *state)
 {
-- 
2.40.1



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3A3C41513
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZ/RJ4O+jzLeBoespGWHqrsEafIETtooyO1shbTBc78=; b=3oXkZXpNnVBD0myu1u5pZZW4D4
	JrCYis6DdcN78qXXEVdcCzG3g2U2clYPrOv+znj0jAfDtKODNxIFbxDdUOR/22ITSq2m3l9mJxRfI
	GeQp6eVqr+S2ptUT3aBsXZjqkzghZhK/ZoNtgpuHBtMkPnYnwpHM/d68GHM+dD01D1ia+X7+HRlaB
	wmPWkyowSkyX2l/K/C2WHMC7Ie8XjeszgWYPi2f1jietVWUA5Qmy0lXzEqXzuhTGBdS06c1g1Gw41
	WR3mdWb9h5rTAtXkaWrODLwyt4Ru/xLJW5kJZS0NcgQutzbCVBcrCC1yMuToqeZgpktiMSggcClR8
	9iblDj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpFP-00Bmf3-2o;
	Fri, 04 Aug 2023 07:29:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpFB-00BmOl-19;
	Fri, 04 Aug 2023 07:29:07 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 78E8066071B9;
	Fri,  4 Aug 2023 08:29:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691134144;
	bh=JEghBTvHNSu8yfdUBd7VO3HyemOteRFeB2SfmGR0Hfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bdVg24vJakDUuqCNbVft7PDFqonlDz85iOyEAaD02foARH5vQJ2GUAIM76VXt/8dR
	 mcdv8isTfbpG9UDjqJ0vxWcj4GVIvcBYU5fN+eG5RKV/p9/uDYK0MWJ3lVdhnShunA
	 5A/2ORdPqozTDg4TKK7Elrp1UD7QKFuNrsENylQx5Ta6cqxAIecjNHHv7LETElQP9g
	 GYWEfhBmeCDbhWpeLYEHq46OCrQ450s9oXLERe5uN8BFv9Kr4BBY9Cn/itglgn1Bt9
	 yLGnQnkL4Bt3qUyeacH8TeshWkoWEWnfUh+Xv+QeAArp33nGseYCifG+m+Thr8srSi
	 x9U5PrvRuUmtw==
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
	ehristev@collabora.com
Subject: [PATCH v10 08/16] drm/mediatek: De-commonize disp_aal/disp_gamma gamma_set functions
Date: Fri,  4 Aug 2023 09:28:42 +0200
Message-ID: <20230804072850.89365-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_002905_648621_81FECA12 
X-CRM114-Status: GOOD (  20.73  )
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

In preparation for adding a 12-bits gamma support for the DISP_GAMMA
IP, remove the mtk_gamma_set_common() function and move the relevant
bits in mtk_gamma_set() for DISP_GAMMA and mtk_aal_gamma_set() for
DISP_AAL: since the latter has no more support for gamma manipulation
(being moved to a different IP) in newer revisions, those functions
are about to diverge and it makes no sense to keep a common one (with
all the complications of passing common data and making exclusions
for device driver data) for just a few bits.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 39 +++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  1 -
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 34 ++++----------------
 3 files changed, 44 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index bec035780db0..21b25470e9b7 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -17,10 +17,18 @@
 
 #define DISP_AAL_EN				0x0000
 #define AAL_EN						BIT(0)
+#define DISP_AAL_CFG				0x0020
+#define AAL_RELAY_MODE					BIT(0)
+#define AAL_GAMMA_LUT_EN				BIT(1)
 #define DISP_AAL_SIZE				0x0030
 #define DISP_AAL_SIZE_HSIZE				GENMASK(28, 16)
 #define DISP_AAL_SIZE_VSIZE				GENMASK(12, 0)
 #define DISP_AAL_OUTPUT_SIZE			0x04d8
+#define DISP_AAL_GAMMA_LUT			0x0700
+#define DISP_AAL_GAMMA_LUT_R				GENMASK(29, 20)
+#define DISP_AAL_GAMMA_LUT_G				GENMASK(19, 10)
+#define DISP_AAL_GAMMA_LUT_B				GENMASK(9, 0)
+#define DISP_AAL_LUT_BITS			10
 #define DISP_AAL_LUT_SIZE			512
 
 struct mtk_disp_aal_data {
@@ -85,9 +93,36 @@ unsigned int mtk_aal_gamma_get_lut_size(struct device *dev)
 void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+	struct drm_color_lut *lut;
+	unsigned int i;
+	u32 cfg_val;
+
+	/* If gamma is not supported in AAL, go out immediately */
+	if (!(aal->data && aal->data->has_gamma))
+		return;
+
+	/* Also, if there's no gamma lut there's nothing to do here. */
+	if (!state->gamma_lut)
+		return;
+
+	cfg_val = readl(aal->regs + DISP_AAL_CFG);
+	lut = (struct drm_color_lut *)state->gamma_lut->data;
+
+	for (i = 0; i < DISP_AAL_LUT_SIZE; i++) {
+		struct drm_color_lut hwlut = {
+			.red = drm_color_lut_extract(lut[i].red, DISP_AAL_LUT_BITS),
+			.green = drm_color_lut_extract(lut[i].green, DISP_AAL_LUT_BITS),
+			.blue = drm_color_lut_extract(lut[i].blue, DISP_AAL_LUT_BITS)
+		};
+		u32 word;
+
+		word = FIELD_PREP(DISP_AAL_GAMMA_LUT_R, hwlut.red);
+		word |= FIELD_PREP(DISP_AAL_GAMMA_LUT_G, hwlut.green);
+		word |= FIELD_PREP(DISP_AAL_GAMMA_LUT_B, hwlut.blue);
+		writel(word, (aal->regs + DISP_AAL_GAMMA_LUT) + (i * 4));
+	}
 
-	if (aal->data && aal->data->has_gamma)
-		mtk_gamma_set_common(NULL, aal->regs, state);
+	writel(cfg_val, aal->regs + DISP_AAL_CFG);
 }
 
 void mtk_aal_start(struct device *dev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index ca377265e5eb..54d3712e2afd 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -56,7 +56,6 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 unsigned int mtk_gamma_get_lut_size(struct device *dev);
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
-void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state);
 void mtk_gamma_start(struct device *dev);
 void mtk_gamma_stop(struct device *dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index ea91d3619716..001b98694761 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -73,42 +73,29 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 	return LUT_SIZE_DEFAULT;
 }
 
-void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
+void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 {
-	struct mtk_disp_gamma *gamma;
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
 	unsigned int i;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
-	bool lut_diff;
-	u16 lut_size;
 	u32 cfg_val, word;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
 		return;
 
-	/* If we're called from AAL, dev is NULL */
-	gamma = dev ? dev_get_drvdata(dev) : NULL;
-
-	if (gamma && gamma->data) {
-		lut_diff = gamma->data->lut_diff;
-		lut_size = gamma->data->lut_size;
-	} else {
-		lut_diff = false;
-		lut_size = LUT_SIZE_DEFAULT;
-	}
-
-	cfg_val = readl(regs + DISP_GAMMA_CFG);
-	lut_base = regs + DISP_GAMMA_LUT;
+	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
+	lut_base = gamma->regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
-	for (i = 0; i < lut_size; i++) {
+	for (i = 0; i < gamma->data->lut_size; i++) {
 		struct drm_color_lut diff, hwlut;
 
 		hwlut.red = drm_color_lut_extract(lut[i].red, LUT_BITS_DEFAULT);
 		hwlut.green = drm_color_lut_extract(lut[i].green, LUT_BITS_DEFAULT);
 		hwlut.blue = drm_color_lut_extract(lut[i].blue, LUT_BITS_DEFAULT);
 
-		if (!lut_diff || (i % 2 == 0)) {
+		if (!gamma->data->lut_diff || (i % 2 == 0)) {
 			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
 			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
 			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
@@ -132,14 +119,7 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	/* Enable the gamma table */
 	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
-	writel(cfg_val, regs + DISP_GAMMA_CFG);
-}
-
-void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
-{
-	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
-
-	mtk_gamma_set_common(dev, gamma->regs, state);
+	writel(cfg_val, gamma->regs + DISP_GAMMA_CFG);
 }
 
 void mtk_gamma_config(struct device *dev, unsigned int w,
-- 
2.41.0



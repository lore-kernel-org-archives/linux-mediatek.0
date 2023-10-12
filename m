Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A91ECDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=La1tCl2Df6I5M0VxE3Qfj0ERUNLAd5MIeKoGt3E7mno=; b=fgPz3+ZCwgKIrJU8No8PFzrBIL
	HJm/Id/pvGTl9yl+EC2e7X+BQlbixzRh01OQhFG7dBlZtp/UO5XUBvcqEtpER1Es+tZ9L22g98CK9
	yKcsqB3kom/3H9/2Bw+ao1WXNkXyo1fQHOLd8v3pulTizS8qIXAtqkqi4+0/7lf6GlGgTWU+5KCiu
	/aJa77EvipOsMGneM9aObD2ObEGZrCVJAr+1U6t5tq9DqBjNYxU/b3DZZ8mDfaQDVNkoPTN6T6RrG
	FndO9CJg87/l3M/pmu6l9OsYyTqsm34tLe+ba8P7u97tnIgsuCC9J9J6t3y8gqloZDf2195sxkoBf
	Qrks7eLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsSF-000TO5-19;
	Thu, 12 Oct 2023 09:58:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsRz-000T4Z-31;
	Thu, 12 Oct 2023 09:57:54 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D3FCB6607356;
	Thu, 12 Oct 2023 10:57:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104670;
	bh=QCs4wI96fPs5unPYTZSQukv443uPSWfhQ3mtjInGcpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mDvO5LZUBOAR4HnZNh5431O7PsLGsP1VfJSAYoETc54G2JtzJ8zMV6BYPX65WzXH0
	 zqaEWIhF7k32kjqlsDwjpnF702SSfcq7R4tyYC7PWmNkxQs8BIYcZtOhBFKV2c88FS
	 eyhQaFMOS1FhOXtJAJIotxKUIIZ7IndYcm17JVcUH66JIPVJ657KVpBleiTg8LuN//
	 dtiYGlTPsnDQmd01lDUNtPfJPxczyocxaYW7NXD2G99tJaCE5/0A3brAmYthcRTr0Z
	 RJWvNgZDP7nCGXcRCuTbrLyye1/ElPBplfnXXhLnpe8w6Q9rdcRrg9aS+mY0gEvtau
	 Uqdud4QWF666w==
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
	ehristev@collabora.com,
	nfraprado@collabora.com
Subject: [PATCH v11 08/16] drm/mediatek: De-commonize disp_aal/disp_gamma gamma_set functions
Date: Thu, 12 Oct 2023 11:57:28 +0200
Message-ID: <20231012095736.100784-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025752_244232_761051E3 
X-CRM114-Status: GOOD (  20.40  )
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
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 41 +++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  1 -
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 34 ++++---------------
 3 files changed, 46 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 05f9be23fa47..a618be9b3dba 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -17,10 +17,17 @@
 
 #define DISP_AAL_EN				0x0000
 #define AAL_EN						BIT(0)
+#define DISP_AAL_CFG				0x0020
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
@@ -80,9 +87,39 @@ unsigned int mtk_aal_gamma_get_lut_size(struct device *dev)
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
+	lut = (struct drm_color_lut *)state->gamma_lut->data;
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
+		writel(word, aal->regs + DISP_AAL_GAMMA_LUT + i * 4);
+	}
 
-	if (aal->data && aal->data->has_gamma)
-		mtk_gamma_set_common(NULL, aal->regs, state);
+	cfg_val = readl(aal->regs + DISP_AAL_CFG);
+
+	/* Enable the gamma table */
+	cfg_val |= FIELD_PREP(AAL_GAMMA_LUT_EN, 1);
+
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
index 81c04518a5eb..0929f8830d6d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -69,41 +69,28 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 	return 0;
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
-		lut_size = 512;
-	}
-
-	lut_base = regs + DISP_GAMMA_LUT;
+	lut_base = gamma->regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
-	for (i = 0; i < lut_size; i++) {
+	for (i = 0; i < gamma->data->lut_size; i++) {
 		struct drm_color_lut diff, hwlut;
 
 		hwlut.red = drm_color_lut_extract(lut[i].red, 10);
 		hwlut.green = drm_color_lut_extract(lut[i].green, 10);
 		hwlut.blue = drm_color_lut_extract(lut[i].blue, 10);
 
-		if (!lut_diff || (i % 2 == 0)) {
+		if (!gamma->data->lut_diff || (i % 2 == 0)) {
 			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
 			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
 			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
@@ -124,19 +111,12 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		writel(word, (lut_base + i * 4));
 	}
 
-	cfg_val = readl(regs + DISP_GAMMA_CFG);
+	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
 
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
2.42.0



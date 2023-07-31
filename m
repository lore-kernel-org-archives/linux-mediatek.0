Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0316C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9K0WbbWiMRu8OTiJQtJgnElIRnTLikE8x/VIwZTPGQ8=; b=3EJlELyGpjJxDsXk0NKZxpoV5w
	B4I4D4aIcIuqXqqtW5KOw6LR+zp8fEcSOS1uGsYpJC2mGFT0Bh39sUWwOBf+8ju5YNa79MhYB7au/
	aRA+nUPxpZ8WaZ76WGdvoswy5it5T7XhrUGJJTZu19fLo9Sfm5rc9O2LGrjBj39q2peqjLs/9QDjV
	ba85U/4vE2y09VG9FzcFU2kmKtQDkh7MD5kJx8SU2yq/Z3PDtC9jNAiDuFMI5oAFrTDoFh3LZX9Jw
	GV7sKm47dKQ9yqT9XYMwPh01QJnC0gFmHiv50yYgeljLLAy+SV6LK99QLyowQGpgV0/u+u2j6e8Te
	HMcigFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSbB-00FgKm-2g;
	Mon, 31 Jul 2023 13:06:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSZy-00Ffik-1X;
	Mon, 31 Jul 2023 13:04:56 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E0F96607003;
	Mon, 31 Jul 2023 14:04:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690808693;
	bh=JPjjG2QuZmeysV616cmfgYvud3Z5xrxzJr7h2Ftv49o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i+Roxdh4itWI5pmDZ2gel4FwjItXoIteJQMPZvJNE/bNTxmU1uatMiMhdUKJITFRK
	 aoNkwA3uAzW8pJ8J2KuSctQ/40WrD4941ZN+JCfXv/ZcybdIQNNIk/mTwAJm7losj4
	 IduN1Qz+sTgNLAnJcwUV0oTpINjRCnzkBjcFinCDcmaQFdHpdYBOA2QBqPLqbdiF7z
	 l5qb+gaInpZ+xKYmPR59kpEmi5+AXA0Ji8QpHmUvCTas6qoOiEHlk/mvvd8Afyg6WJ
	 NKvKeiN4J4Vgblg2lKugq0x0fFwLi9Sw+Z3I2ieFjjZkQV+67lWjysUCnZTzdEHLDL
	 FEckK3wT8lPRA==
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
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v7 08/13] drm/mediatek: gamma: Support multi-bank gamma LUT
Date: Mon, 31 Jul 2023 15:04:36 +0200
Message-ID: <20230731130441.173960-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731130441.173960-1-angelogioacchino.delregno@collabora.com>
References: <20230731130441.173960-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_060454_770569_D30671B9 
X-CRM114-Status: GOOD (  17.29  )
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

Newer Gamma IP have got multiple LUT banks: support specifying the
size of the LUT banks and handle bank-switching before programming
the LUT in mtk_gamma_set_common() in preparation for adding support
for MT8195 and newer SoCs.

Suggested-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
[Angelo: Refactored original commit]
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 74 ++++++++++++++---------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 8a45eac53875..65b90e1831c5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -24,6 +24,8 @@
 #define DISP_GAMMA_SIZE				0x0030
 #define DISP_GAMMA_SIZE_HSIZE				GENMASK(28, 16)
 #define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
+#define DISP_GAMMA_BANK				0x0100
+#define DISP_GAMMA_BANK_BANK				GENMASK(1, 0)
 #define DISP_GAMMA_LUT				0x0700
 
 #define DISP_GAMMA_LUT_10BIT_R			GENMASK(29, 20)
@@ -37,6 +39,7 @@
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
+	u16 lut_bank_size;
 	u16 lut_size;
 	u8 lut_bits;
 };
@@ -81,9 +84,10 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	bool lut_diff;
-	u16 lut_size;
+	u16 lut_bank_size, lut_size;
 	u8 lut_bits;
-	u32 cfg_val, word;
+	u32 cfg_val, lbank_val, word;
+	int cur_bank, num_lut_banks;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
@@ -94,43 +98,57 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 
 	if (gamma && gamma->data) {
 		lut_diff = gamma->data->lut_diff;
+		lut_bank_size = gamma->data->lut_bank_size;
 		lut_bits = gamma->data->lut_bits;
 		lut_size = gamma->data->lut_size;
 	} else {
 		lut_diff = false;
+		lut_bank_size = LUT_SIZE_DEFAULT;
 		lut_bits = LUT_BITS_DEFAULT;
 		lut_size = LUT_SIZE_DEFAULT;
 	}
+	num_lut_banks = lut_size / lut_bank_size;
 
 	cfg_val = readl(regs + DISP_GAMMA_CFG);
 	lut_base = regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
-	for (i = 0; i < lut_size; i++) {
-		struct drm_color_lut diff, hwlut;
-
-		hwlut.red = drm_color_lut_extract(lut[i].red, lut_bits);
-		hwlut.green = drm_color_lut_extract(lut[i].green, lut_bits);
-		hwlut.blue = drm_color_lut_extract(lut[i].blue, lut_bits);
-
-		if (!lut_diff || (i % 2 == 0)) {
-			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
-		} else {
-			diff.red = lut[i].red - lut[i - 1].red;
-			diff.red = drm_color_lut_extract(diff.red, lut_bits);
-
-			diff.green = lut[i].green - lut[i - 1].green;
-			diff.green = drm_color_lut_extract(diff.green, lut_bits);
-
-			diff.blue = lut[i].blue - lut[i - 1].blue;
-			diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
-
-			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
-			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
+
+	for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
+
+		/* Switch gamma bank and set data mode before writing LUT */
+		if (num_lut_banks > 1) {
+			lbank_val = FIELD_PREP(DISP_GAMMA_BANK_BANK, cur_bank);
+			writel(lbank_val, regs + DISP_GAMMA_BANK);
+		}
+
+		for (i = 0; i < lut_bank_size; i++) {
+			int n = (cur_bank * lut_bank_size) + i;
+			struct drm_color_lut diff, hwlut;
+
+			hwlut.red = drm_color_lut_extract(lut[n].red, lut_bits);
+			hwlut.green = drm_color_lut_extract(lut[n].green, lut_bits);
+			hwlut.blue = drm_color_lut_extract(lut[n].blue, lut_bits);
+
+			if (!lut_diff || (i % 2 == 0)) {
+				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
+			} else {
+				diff.red = lut[n].red - lut[n - 1].red;
+				diff.red = drm_color_lut_extract(diff.red, lut_bits);
+
+				diff.green = lut[n].green - lut[n - 1].green;
+				diff.green = drm_color_lut_extract(diff.green, lut_bits);
+
+				diff.blue = lut[n].blue - lut[n - 1].blue;
+				diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
+
+				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
+				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
+			}
+			writel(word, (lut_base + i * 4));
 		}
-		writel(word, (lut_base + i * 4));
 	}
 
 	/* Enable the gamma table */
@@ -241,11 +259,13 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
+	.lut_bank_size = 512,
 	.lut_bits = 10,
 	.lut_size = 512,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
+	.lut_bank_size = 512,
 	.lut_bits = 10,
 	.lut_diff = true,
 	.lut_size = 512,
-- 
2.41.0



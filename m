Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4705AC41513
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 11:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KFqqtYMUx6OFXWApfzEJwnhOHG6dnbWO1x87t86gmw=; b=WSuEm6CO5XzNyCFxtSGekMFup4
	HtNjZUdFeBWzn9XKPvWQ+a1/07OZTzf+O9PhugPyInEQDAO76v2DbMKHz255OTXqm76OeICtjwwP7
	r/lze8ivqBULX582eNcQno+W1dqyperbXq/Cm8uoq3CEp2bT62JeDEtnDEEiSP7ne7mWp/AFwxoNG
	T/HiaZTYksmKXBEPpYwB8WEvSx7V1G6wpudCQVRZsBPB7BH/S5bINZZbOz2YpHt1SCEQe4yUiXSV4
	cEyEyKufxENb0gAwKATctqKK0XHvGyZDQHXgc6j53opyr6KuunyxWiSf0RpNFrQqX07mIE9irDL3O
	JfyRFpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQo25-0029lE-2l;
	Tue, 01 Aug 2023 11:59:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQo1t-0029Vz-2B;
	Tue, 01 Aug 2023 11:59:12 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6180C6607199;
	Tue,  1 Aug 2023 12:59:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690891148;
	bh=TVDX6Wbe4BzuqQdeWe8CTawxJUw/+TZsfYlFuzshf40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ImLMGSWtV2Rahsx3JNsQDlJaHBnvDu4+tJWoqRbUuLmyqS0SdbEoWK3Kg2HWfQMIa
	 0smgExm89ckBFESoU26KfOSCQW2mK55NLSAIqp3XxSj/ZNBbjcV9EDTOmvnx0Mg3eQ
	 k1rNiHW9PdJk3ewIi8AC2/E680z8tHZdthiyjrFE4Uuf0jfmEg57YNTAvGiWqJ2BF9
	 5eTW6wrUdlo5/lRcWCzsxWyhRp7ExjhqreNGooe7rk/XM65PVHpjF4PyP4rVvYXXyg
	 jECuSeLVAtw7FyUZWRxPg0Zc1xjvmwl0g++FEn1q67tgYFl3qfXyVvjlMAOIcoirz0
	 xIyKzLia1QZOw==
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
Subject: [PATCH v8 08/13] drm/mediatek: gamma: Support multi-bank gamma LUT
Date: Tue,  1 Aug 2023 13:58:49 +0200
Message-ID: <20230801115854.150346-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801115854.150346-1-angelogioacchino.delregno@collabora.com>
References: <20230801115854.150346-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_045910_038162_26A6DCDD 
X-CRM114-Status: GOOD (  17.34  )
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
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 73 +++++++++++++++--------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index a6f7af1a9e8e..fb7c3650a9f7 100644
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
@@ -32,10 +34,12 @@
 
 #define LUT_10BIT_MASK				0x03ff
 #define LUT_BITS_DEFAULT			10
+#define LUT_BANK_SIZE_DEFAULT			512
 
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
+	u16 lut_bank_size;
 	u16 lut_size;
 	u8 lut_bits;
 };
@@ -80,7 +84,9 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 	void __iomem *lut_base;
 	bool lut_diff;
 	u8 lut_bits;
-	u32 cfg_val, word;
+	u16 lut_bank_size;
+	u32 cfg_val, lbank_val, word;
+	int cur_bank, num_lut_banks;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
@@ -91,41 +97,54 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 
 	if (gamma && gamma->data) {
 		lut_diff = gamma->data->lut_diff;
+		lut_bank_size = gamma->data->lut_bank_size;
 		lut_bits = gamma->data->lut_bits;
 	} else {
 		lut_diff = false;
+		lut_bank_size = LUT_BANK_SIZE_DEFAULT;
 		lut_bits = LUT_BITS_DEFAULT;
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
@@ -236,11 +255,13 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 
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



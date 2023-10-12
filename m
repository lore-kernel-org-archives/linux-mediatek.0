Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BC2CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUJeNhnrMIr5YwfXXVMErK+G2ms4APE5w2a7j5kok4Y=; b=MSu9hBG16K+r/CH8oGZw0vf93J
	k129mEh/ldd1Xw9hxAWAPySf1wACLRwBCDncHQT49AjyTZzox6+806JuimD3wgLRkmVZFOIkkt8xm
	TaHYRrikbRuaAw7ABYHfQ5VTwH+nA3SW6kYdekoVa8W5zn/w7ZLG0iRfMUq4IkNmxrAIMAmAt7ouq
	LCQfPzoLpeMpHr0BzPwLjd8k3nir64u8XoOuDD3aJQZCkD0ucNQ9G9AmX+o3IU4vzj8nTY4fT3WFq
	d3Mx+sSM/P/hSq9vSDYxv8aeOSRDKq6KKwxXxapfN6wJp7Pe/ysafycYydWbChr2L1k6Zl3MUGBnR
	1OARmARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsSJ-000TTY-0r;
	Thu, 12 Oct 2023 09:58:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsS1-000T6Y-2g;
	Thu, 12 Oct 2023 09:57:56 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BE70166071A3;
	Thu, 12 Oct 2023 10:57:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104672;
	bh=OKxW0Teq4t4s0TFxFYrNU/LGHfTxhMGulUaNeRmnmIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kZvW+8sG6P3xYBl4DtKIBSjG4k02Lm4Opv2Ee5PgT/1+ZTVB2z1RH8dSD6ydoRxH5
	 5a/HLfoyC/r3OFFnqshOi+uG1aZD3k+JSrzX81rwPCxmPO4qh7ro9dP0nnqRuVHsLx
	 GOn5E7MEKzJjKUpZjAqjq98Ah1N9CcFEw8dO09DIFuSMMvS9KjsbKLM/nIsigL1Icu
	 hJVVcg9IFcpgdFt83RZjGP/fvt6tV/Q+/tv5kjX/v3Fz1hjP1WdPytPsQpBNy6qhbh
	 S4F8Ia4jY7NnWHnrLYb1L8W68iuM1HztZSK0cFLCJnhu5o+PyuF7ThJYZseeJ68iR/
	 /f2wKIogdxgyQ==
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
	nfraprado@collabora.com,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v11 10/16] drm/mediatek: gamma: Add support for 12-bit LUT
Date: Thu, 12 Oct 2023 11:57:30 +0200
Message-ID: <20231012095736.100784-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025754_147193_A4839C3C 
X-CRM114-Status: GOOD (  19.79  )
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

New SoCs, like MT8195, not only may support bigger lookup tables, but
have got a different register layout to support bigger precision:
support specifying the number of `lut_bits` for each SoC and use it
in mtk_gamma_set_common() to perform the right calculations and add
support for 12-bit gamma lookup tables.

While at it, also reorder the variables in mtk_gamma_set_common()
and rename `lut_base` to `lut0_base` to improve readability.

Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 83 +++++++++++++++++------
 1 file changed, 64 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 911468984ad5..6305cd95e6d4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -26,17 +26,26 @@
 #define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
 #define DISP_GAMMA_BANK				0x0100
 #define DISP_GAMMA_BANK_BANK				GENMASK(1, 0)
+#define DISP_GAMMA_BANK_DATA_MODE			BIT(2)
 #define DISP_GAMMA_LUT				0x0700
+#define DISP_GAMMA_LUT1				0x0b00
 
+/* For 10 bit LUT layout, R/G/B are in the same register */
 #define DISP_GAMMA_LUT_10BIT_R			GENMASK(29, 20)
 #define DISP_GAMMA_LUT_10BIT_G			GENMASK(19, 10)
 #define DISP_GAMMA_LUT_10BIT_B			GENMASK(9, 0)
 
+/* For 12 bit LUT layout, R/G are in LUT, B is in LUT1 */
+#define DISP_GAMMA_LUT_12BIT_R			GENMASK(11, 0)
+#define DISP_GAMMA_LUT_12BIT_G			GENMASK(23, 12)
+#define DISP_GAMMA_LUT_12BIT_B			GENMASK(11, 0)
+
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
 	u16 lut_bank_size;
 	u16 lut_size;
+	u8 lut_bits;
 };
 
 /*
@@ -72,28 +81,48 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 	return 0;
 }
 
+/*
+ * SoCs supporting 12-bits LUTs are using a new register layout that does
+ * always support (by HW) both 12-bits and 10-bits LUT but, on those, we
+ * ignore the support for 10-bits in this driver and always use 12-bits.
+ *
+ * Summarizing:
+ * - SoC HW support 9/10-bits LUT only
+ *   - Old register layout
+ *     - 10-bits LUT supported
+ *     - 9-bits LUT not supported
+ * - SoC HW support both 10/12bits LUT
+ *   - New register layout
+ *     - 12-bits LUT supported
+ *     - 10-its LUT not supported
+ */
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
-	unsigned int i;
-	struct drm_color_lut *lut;
-	void __iomem *lut_base;
-	u32 cfg_val, lbank_val, word;
+	void __iomem *lut0_base = gamma->regs + DISP_GAMMA_LUT;
+	void __iomem *lut1_base = gamma->regs + DISP_GAMMA_LUT1;
+	u32 cfg_val, data_mode, lbank_val, word[2];
+	u8 lut_bits = gamma->data->lut_bits;
 	int cur_bank, num_lut_banks;
+	struct drm_color_lut *lut;
+	unsigned int i;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
 		return;
 
 	num_lut_banks = gamma->data->lut_size / gamma->data->lut_bank_size;
-	lut_base = gamma->regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
 
+	/* Switch to 12 bits data mode if supported */
+	data_mode = FIELD_PREP(DISP_GAMMA_BANK_DATA_MODE, !!(lut_bits == 12));
+
 	for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
 
 		/* Switch gamma bank and set data mode before writing LUT */
 		if (num_lut_banks > 1) {
 			lbank_val = FIELD_PREP(DISP_GAMMA_BANK_BANK, cur_bank);
+			lbank_val |= data_mode;
 			writel(lbank_val, gamma->regs + DISP_GAMMA_BANK);
 		}
 
@@ -101,29 +130,43 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 			int n = cur_bank * gamma->data->lut_bank_size + i;
 			struct drm_color_lut diff, hwlut;
 
-			hwlut.red = drm_color_lut_extract(lut[n].red, 10);
-			hwlut.green = drm_color_lut_extract(lut[n].green, 10);
-			hwlut.blue = drm_color_lut_extract(lut[n].blue, 10);
+			hwlut.red = drm_color_lut_extract(lut[n].red, lut_bits);
+			hwlut.green = drm_color_lut_extract(lut[n].green, lut_bits);
+			hwlut.blue = drm_color_lut_extract(lut[n].blue, lut_bits);
 
 			if (!gamma->data->lut_diff || (i % 2 == 0)) {
-				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
-				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
-				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
+				if (lut_bits == 12) {
+					word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, hwlut.red);
+					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, hwlut.green);
+					word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, hwlut.blue);
+				} else {
+					word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
+					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
+					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
+				}
 			} else {
 				diff.red = lut[n].red - lut[n - 1].red;
-				diff.red = drm_color_lut_extract(diff.red, 10);
+				diff.red = drm_color_lut_extract(diff.red, lut_bits);
 
 				diff.green = lut[n].green - lut[n - 1].green;
-				diff.green = drm_color_lut_extract(diff.green, 10);
+				diff.green = drm_color_lut_extract(diff.green, lut_bits);
 
 				diff.blue = lut[n].blue - lut[n - 1].blue;
-				diff.blue = drm_color_lut_extract(diff.blue, 10);
-
-				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
-				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
-				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
+				diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
+
+				if (lut_bits == 12) {
+					word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, diff.red);
+					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, diff.green);
+					word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, diff.blue);
+				} else {
+					word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
+					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
+					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
+				}
 			}
-			writel(word, lut_base + i * 4);
+			writel(word[0], lut0_base + i * 4);
+			if (lut_bits == 12)
+				writel(word[1], lut1_base + i * 4);
 		}
 	}
 
@@ -225,11 +268,13 @@ static void mtk_disp_gamma_remove(struct platform_device *pdev)
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
 	.lut_bank_size = 512,
+	.lut_bits = 10,
 	.lut_size = 512,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
 	.lut_bank_size = 512,
+	.lut_bits = 10,
 	.lut_diff = true,
 	.lut_size = 512,
 };
-- 
2.42.0



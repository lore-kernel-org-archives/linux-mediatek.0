Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AC5C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 12:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRr+Glj9klTlm3ifugQCCLZOWLlw8cR80fnWjkhBVNI=; b=JNmqFV35yKeec7GkJ1oPUeOoRW
	e/YRQUCzie96nVOI0JckPGbvncwEIJgRlbqfckM9sT7tSWfdueSB/zgL+f2QLdNqg89KYWMU/HAaa
	cp64ciu9gmAZNhK0+UjkLsf451vPT6veP3usExWt73fXYtw0UJlSe9pKk+ZqAuverOmfaSd+uqN9W
	Z/g0pYn5TQQOzvD89bkDt1WaZkoA2x3pmqTsQbXKJMHiLm3imW7HJ+HjNgP4bQa76RTyFWFSvA00f
	20y7PBLkhLF2x10ytsO5c2TkSb2Pg2FJ4xHTCGsZfhf1rA9SPIuWVubhEHWlUtnHu1KEic0uQbxy7
	8e6mEHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4hRa-003X8Z-0B;
	Thu, 01 Jun 2023 12:30:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4h8U-003O4W-0U;
	Thu, 01 Jun 2023 12:10:36 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 320E46606EC8;
	Thu,  1 Jun 2023 13:10:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685621432;
	bh=3I8Rjj9QMcA+JJ4/+HINgDnaxJetoJetOg2mGldS5tI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lNvJVaw9Qg3hqwhe1jvPK/WEIfm2kNdvIY/f4JRPTftAwjL/ymp5xhyfWhwG+PYks
	 jYddPx5C2kplfkij6My/voJMbPudzafbN2eWdxL66kaC3llR/9DRKZxn2LP36BKCDJ
	 nRbqsV2iPLvpKkIwUO0+YF6Gl4YWysPtC6pCpRQOoayp0ECBKI5TH+d1ZD/WlQRyMl
	 bAHIIAvexEBNJBmx9+IVNHrPK3uNAF5GItnf5+oUkPvX7e0n2lWbhS7h+6DU3y8j/p
	 O9nbZdoSBo0ZK493WH3Hrfxv20LGPBiCs0BgdCldopuIfl3f0M6JIGcLsF7A8ZOv8r
	 i92a+xKvl1VWw==
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
Subject: [PATCH v5 06/11] drm/mediatek: gamma: Use bitfield macros
Date: Thu,  1 Jun 2023 14:10:17 +0200
Message-Id: <20230601121022.2401844-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601121022.2401844-1-angelogioacchino.delregno@collabora.com>
References: <20230601121022.2401844-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_051034_467578_048E0958 
X-CRM114-Status: GOOD (  12.96  )
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

Make the code more robust and improve readability by using bitfield
macros instead of open coding bit operations.
While at it, also add a definition for LUT_BITS_DEFAULT.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 41 ++++++++++++++---------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index b75a77af5205..f4bf5b37992c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2021 MediaTek Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/module.h>
@@ -22,9 +23,16 @@
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
+#define DISP_GAMMA_SIZE_HSIZE				GENMASK(28, 16)
+#define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
 #define DISP_GAMMA_LUT				0x0700
 
+#define DISP_GAMMA_LUT_10BIT_R			GENMASK(29, 20)
+#define DISP_GAMMA_LUT_10BIT_G			GENMASK(19, 10)
+#define DISP_GAMMA_LUT_10BIT_B			GENMASK(9, 0)
+
 #define LUT_10BIT_MASK				0x03ff
+#define LUT_BITS_DEFAULT			10
 #define LUT_SIZE_DEFAULT			512
 
 struct mtk_disp_gamma_data {
@@ -96,33 +104,33 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	for (i = 0; i < lut_size; i++) {
 		struct drm_color_lut diff, hwlut;
 
-		hwlut.red = drm_color_lut_extract(lut[i].red, 10);
-		hwlut.green = drm_color_lut_extract(lut[i].green, 10);
-		hwlut.blue = drm_color_lut_extract(lut[i].blue, 10);
+		hwlut.red = drm_color_lut_extract(lut[i].red, LUT_BITS_DEFAULT);
+		hwlut.green = drm_color_lut_extract(lut[i].green, LUT_BITS_DEFAULT);
+		hwlut.blue = drm_color_lut_extract(lut[i].blue, LUT_BITS_DEFAULT);
 
 		if (!lut_diff || (i % 2 == 0)) {
-			word = hwlut.red << 20 +
-			       hwlut.green << 10 +
-			       hwlut.red;
+			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
+			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
+			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
 		} else {
 			diff.red = lut[i].red - lut[i - 1].red;
-			diff.red = drm_color_lut_extract(diff.red, 10);
+			diff.red = drm_color_lut_extract(diff.red, LUT_BITS_DEFAULT);
 
 			diff.green = lut[i].green - lut[i - 1].green;
-			diff.green = drm_color_lut_extract(diff.green, 10);
+			diff.green = drm_color_lut_extract(diff.green, LUT_BITS_DEFAULT);
 
 			diff.blue = lut[i].blue - lut[i - 1].blue;
-			diff.blue = drm_color_lut_extract(diff.blue, 10);
+			diff.blue = drm_color_lut_extract(diff.blue, LUT_BITS_DEFAULT);
 
-			word = diff.blue << 20 +
-			       diff.green << 10 +
-			       diff.red;
+			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
+			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
+			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
 		}
 		writel(word, (lut_base + i * 4));
 	}
 
 	/* Enable the gamma table */
-	cfg_val = cfg_val | GAMMA_LUT_EN;
+	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
 	writel(cfg_val, regs + DISP_GAMMA_CFG);
 }
@@ -139,9 +147,12 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+	u32 sz;
+
+	sz = FIELD_PREP(DISP_GAMMA_SIZE_HSIZE, w);
+	sz |= FIELD_PREP(DISP_GAMMA_SIZE_VSIZE, h);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &gamma->cmdq_reg, gamma->regs,
-		      DISP_GAMMA_SIZE);
+	mtk_ddp_write(cmdq_pkt, sz, &gamma->cmdq_reg, gamma->regs, DISP_GAMMA_SIZE);
 	if (gamma->data && gamma->data->has_dither)
 		mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc,
 				      DISP_GAMMA_CFG, GAMMA_DITHERING, cmdq_pkt);
-- 
2.40.1



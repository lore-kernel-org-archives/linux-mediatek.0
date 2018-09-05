From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v2 03/13] drm/mediatek: adjust EDGE to match clock and data
Date: Wed, 5 Sep 2018 16:31:36 +0800
Message-ID: <20180905083146.14727-4-bibby.hsieh@mediatek.com>
References: <20180905083146.14727-1-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905083146.14727-1-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, YT Shen <yt.shen@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, CK Hu <ck.hu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, chunhui dai <chunhui.dai@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: chunhui dai <chunhui.dai@mediatek.com>

The default timing of DPI data and clock is not match.
We could adjust this bit to make them match.

Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c      | 8 ++++++++
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 3db959fed493..df27107b1f0b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -120,6 +120,7 @@ struct mtk_dpi_yc_limit {
 
 struct mtk_dpi_conf {
 	const u32 reg_h_fre_con;
+	bool edge_sel_en;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -350,6 +351,12 @@ static void mtk_dpi_config_2n_h_fre(struct mtk_dpi *dpi)
 	mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, H_FRE_2N, H_FRE_2N);
 }
 
+static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
+{
+	if (dpi->conf->edge_sel_en)
+		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
+}
+
 static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 					enum mtk_dpi_out_color_format format)
 {
@@ -535,6 +542,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
 	mtk_dpi_config_color_format(dpi, dpi->color_format);
 	mtk_dpi_config_2n_h_fre(dpi);
+	mtk_dpi_config_disable_edge(dpi);
 	mtk_dpi_sw_reset(dpi, false);
 
 	return 0;
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
index 040444d7718d..d9db8c4cacd7 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -223,5 +223,6 @@
 #define ESAV_CODE2			(0xFFF << 0)
 #define ESAV_CODE3_MSB			BIT(16)
 
+#define EDGE_SEL_EN			BIT(5)
 #define H_FRE_2N			BIT(25)
 #endif /* __MTK_DPI_REGS_H */
-- 
2.12.5.2.gbdf23ab

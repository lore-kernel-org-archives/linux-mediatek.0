From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v2 06/13] drm/mediatek: add dpi driver for mt2701 and mt7623
Date: Wed, 5 Sep 2018 16:31:39 +0800
Message-ID: <20180905083146.14727-7-bibby.hsieh@mediatek.com>
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

This patch adds dpi dirver suppot for both mt2701 and mt7623.
And also support other (existing or future) chips that use
the same binding and driver.

Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c     | 25 ++++++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index ed2c153c70a2..1af25765ab5f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -641,9 +641,7 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 	}
 	drm_encoder_helper_add(&dpi->encoder, &mtk_dpi_encoder_helper_funcs);
 
-	/* Currently DPI0 is fixed to be driven by OVL1 */
-	dpi->encoder.possible_crtcs = BIT(1);
-
+	dpi->encoder.possible_crtcs = BIT(0) | BIT(1);
 	ret = drm_bridge_attach(&dpi->encoder, dpi->bridge, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to attach bridge: %d\n", ret);
@@ -691,12 +689,33 @@ static unsigned int mt8173_calculate_factor(int clock)
 		return 3 << 1;
 }
 
+static unsigned int mt2701_calculate_factor(int clock)
+{
+	if (clock <= 64000)
+		return 16;
+	else if (clock <= 128000)
+		return 8;
+	else if (clock <= 256000)
+		return 4;
+	else
+		return 2;
+}
+
 static const struct mtk_dpi_conf mt8173_conf = {
 	.cal_factor = mt8173_calculate_factor,
 	.reg_h_fre_con = 0xe0,
 };
 
+static const struct mtk_dpi_conf mt2701_conf = {
+	.cal_factor = mt2701_calculate_factor,
+	.reg_h_fre_con = 0xb0,
+	.edge_sel_en = true,
+};
+
 static const struct of_device_id mtk_dpi_of_ids[] = {
+	{ .compatible = "mediatek,mt2701-dpi",
+	  .data = &mt2701_conf,
+	},
 	{ .compatible = "mediatek,mt8173-dpi",
 	  .data = &mt8173_conf,
 	},
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 39721119713b..d961112fa2f5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -424,6 +424,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8173-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt2701-dpi",
+	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8173-dpi",
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt2701-disp-mutex",
-- 
2.12.5.2.gbdf23ab

From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v2 04/13] drm/mediatek: add clock factor for different IC
Date: Wed, 5 Sep 2018 16:31:37 +0800
Message-ID: <20180905083146.14727-5-bibby.hsieh@mediatek.com>
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

different IC has different clock designed in HDMI, the factor for
calculate clock should be different. Usinng the data in of_node
to find this factor.

Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index df27107b1f0b..3758cfeb586b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -119,6 +119,7 @@ struct mtk_dpi_yc_limit {
 };
 
 struct mtk_dpi_conf {
+	unsigned int (*cal_factor)(int clock);
 	const u32 reg_h_fre_con;
 	bool edge_sel_en;
 };
@@ -458,16 +459,12 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	unsigned long pll_rate;
 	unsigned int factor;
 
+	if (!dpi) {
+		dev_err(dpi->dev, "invalid argument\n");
+		return -EINVAL;
+	}
 	/* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
-
-	if (mode->clock <= 27000)
-		factor = 3 << 4;
-	else if (mode->clock <= 84000)
-		factor = 3 << 3;
-	else if (mode->clock <= 167000)
-		factor = 3 << 2;
-	else
-		factor = 3 << 1;
+	factor = dpi->conf->cal_factor(mode->clock);
 	drm_display_mode_to_videomode(mode, &vm);
 	pll_rate = vm.pixelclock * factor;
 
@@ -681,7 +678,20 @@ static const struct component_ops mtk_dpi_component_ops = {
 	.unbind = mtk_dpi_unbind,
 };
 
+static unsigned int mt8173_calculate_factor(int clock)
+{
+	if (clock <= 27000)
+		return 3 << 4;
+	else if (clock <= 84000)
+		return 3 << 3;
+	else if (clock <= 167000)
+		return 3 << 2;
+	else
+		return 3 << 1;
+}
+
 static const struct mtk_dpi_conf mt8173_conf = {
+	.cal_factor = mt8173_calculate_factor,
 	.reg_h_fre_con = 0xe0,
 };
 
-- 
2.12.5.2.gbdf23ab

From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [v2 PATCH 1/4] phy: phy-mtk-tphy: get optional clock by devm_clk_get_optional()
Date: Wed, 10 Apr 2019 14:13:03 +0800
Message-ID: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Motoya Tanigawa <tanigawa.motoya@socionext.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Use devm_clk_get_optional() to get optional clock

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 5b6a470ca145..cb2ed3b25068 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -1103,13 +1103,9 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 	}
 
 	/* it's deprecated, make it optional for backward compatibility */
-	tphy->u3phya_ref = devm_clk_get(dev, "u3phya_ref");
-	if (IS_ERR(tphy->u3phya_ref)) {
-		if (PTR_ERR(tphy->u3phya_ref) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		tphy->u3phya_ref = NULL;
-	}
+	tphy->u3phya_ref = devm_clk_get_optional(dev, "u3phya_ref");
+	if (IS_ERR(tphy->u3phya_ref))
+		return PTR_ERR(tphy->u3phya_ref);
 
 	tphy->src_ref_clk = U3P_REF_CLK;
 	tphy->src_coef = U3P_SLEW_RATE_COEF;
-- 
2.21.0

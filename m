From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 1/4] phy: phy-mtk-tphy: get optional clock by
 devm_clk_get_optional()
Date: Sat, 30 Mar 2019 17:11:35 +0800
Message-ID: <a8539bcf66065380069676fbea99a51254309803.1553914418.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Use devm_clk_get_optional() to get optional clock

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
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
2.20.1

From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [v2 PATCH 2/4] phy: qcom-qusb2: get optional clock by devm_clk_get_optional()
Date: Wed, 10 Apr 2019 14:13:04 +0800
Message-ID: <50f5c2410bb86691329e5cb4d7ec38d1811fff33.1554874961.git.chunfeng.yun@mediatek.com>
References: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Motoya Tanigawa <tanigawa.motoya@socionext.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: linux-mediatek@lists.infradead.org

Use devm_clk_get_optional() to get optional clock

Cc: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 8fd7ce139772..1cbf1d6f28ce 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -822,14 +822,9 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	qphy->iface_clk = devm_clk_get(dev, "iface");
-	if (IS_ERR(qphy->iface_clk)) {
-		ret = PTR_ERR(qphy->iface_clk);
-		if (ret == -EPROBE_DEFER)
-			return ret;
-		qphy->iface_clk = NULL;
-		dev_dbg(dev, "failed to get iface clk, %d\n", ret);
-	}
+	qphy->iface_clk = devm_clk_get_optional(dev, "iface");
+	if (IS_ERR(qphy->iface_clk))
+		return PTR_ERR(qphy->iface_clk);
 
 	qphy->phy_reset = devm_reset_control_get_by_index(&pdev->dev, 0);
 	if (IS_ERR(qphy->phy_reset)) {
-- 
2.21.0

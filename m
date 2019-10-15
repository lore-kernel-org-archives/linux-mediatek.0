From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] clk: mediatek: mt2712: use devm_platform_ioremap_resource() to simplify code
Date: Tue, 15 Oct 2019 19:26:44 +0800
Message-ID: <20191015112644.19816-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, kstewart@linuxfoundation.org, allison@lohutok.net, yuehaibing@huawei.com, tglx@linutronix.de, weiyi.lu@mediatek.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/mediatek/clk-mt2712.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index 354c26f..a3bd9a1 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1306,9 +1306,8 @@ static int clk_mt2712_top_probe(struct platform_device *pdev)
 	int r, i;
 	struct device_node *node = pdev->dev.of_node;
 	void __iomem *base;
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		pr_err("%s(): ioremap failed\n", __func__);
 		return PTR_ERR(base);
@@ -1394,9 +1393,8 @@ static int clk_mt2712_mcu_probe(struct platform_device *pdev)
 	int r;
 	struct device_node *node = pdev->dev.of_node;
 	void __iomem *base;
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		pr_err("%s(): ioremap failed\n", __func__);
 		return PTR_ERR(base);
-- 
2.7.4

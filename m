From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] clk: mediatek: mt6779: use devm_platform_ioremap_resource() to simplify code
Date: Tue, 15 Oct 2019 20:10:35 +0800
Message-ID: <20191015121035.24736-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, wendell.lin@mediatek.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-mediatek@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/mediatek/clk-mt6779.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 608a9a6..9766ccc 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1225,12 +1225,11 @@ static int clk_mt6779_apmixed_probe(struct platform_device *pdev)
 
 static int clk_mt6779_top_probe(struct platform_device *pdev)
 {
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	void __iomem *base;
 	struct clk_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.7.4

From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] clk: mediatek: mt7622: use devm_platform_ioremap_resource() to simplify code
Date: Tue, 15 Oct 2019 20:17:35 +0800
Message-ID: <20191015121735.26228-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, rfontana@redhat.com, allison@lohutok.net, tglx@linutronix.de, gregkh@linuxfoundation.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-mediatek@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/mediatek/clk-mt7622.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index 8190dab..ef5947e1 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -614,9 +614,8 @@ static int mtk_topckgen_init(struct platform_device *pdev)
 	struct clk_onecell_data *clk_data;
 	void __iomem *base;
 	struct device_node *node = pdev->dev.of_node;
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
@@ -695,9 +694,8 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 	void __iomem *base;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.7.4

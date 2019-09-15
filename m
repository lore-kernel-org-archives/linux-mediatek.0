From: Satendra Singh Thakur <sst2005@gmail.com>
Subject: [PATCH 5/9] probe/dma/mtk-hs: removed redundant code from mediatek hs dma controller's probe function
Date: Sun, 15 Sep 2019 13:00:48 +0530
Message-ID: <20190915073048.23817-1-sst2005@gmail.com>
References: <20190915072644.23329-1-sst2005@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190915072644.23329-1-sst2005@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: satendrasingh.thakur@hcl.com, Satendra Singh Thakur <sst2005@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

1. In order to remove duplicate code, following functions:
platform_get_resource
devm_kzalloc
devm_ioremap_resource
devm_clk_get
platform_get_irq
are replaced with a macro devm_platform_probe_helper.

2. Fixed a memory leak when devm_request_irq fails,
Called of_dma_controller_free in such case.

3. This patch depends on the file include/linux/probe-helper.h
which is pushed in previous patch [01/09].

Signed-off-by: Satendra Singh Thakur <satendrasingh.thakur@hcl.com>
Signed-off-by: Satendra Singh Thakur <sst2005@gmail.com>
---
 drivers/dma/mediatek/mtk-hsdma.c | 38 ++++++++++----------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index 1a2028e1c29e..6fc01093aeea 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/refcount.h>
 #include <linux/slab.h>
+#include <linux/probe-helper.h>
 
 #include "../virt-dma.h"
 
@@ -896,41 +897,24 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	struct mtk_hsdma_device *hsdma;
 	struct mtk_hsdma_vchan *vc;
 	struct dma_device *dd;
-	struct resource *res;
 	int i, err;
 
-	hsdma = devm_kzalloc(&pdev->dev, sizeof(*hsdma), GFP_KERNEL);
-	if (!hsdma)
-		return -ENOMEM;
-
+	/*
+	 * This macro internally combines following functions:
+	 * devm_kzalloc, platform_get_resource, devm_ioremap_resource,
+	 * devm_clk_get, platform_get_irq
+	 */
+	err = devm_platform_probe_helper(pdev, hsdma, "hsdma");
+	if (err < 0)
+		return err;
 	dd = &hsdma->ddev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hsdma->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(hsdma->base))
-		return PTR_ERR(hsdma->base);
-
 	hsdma->soc = of_device_get_match_data(&pdev->dev);
 	if (!hsdma->soc) {
 		dev_err(&pdev->dev, "No device match found\n");
 		return -ENODEV;
 	}
 
-	hsdma->clk = devm_clk_get(&pdev->dev, "hsdma");
-	if (IS_ERR(hsdma->clk)) {
-		dev_err(&pdev->dev, "No clock for %s\n",
-			dev_name(&pdev->dev));
-		return PTR_ERR(hsdma->clk);
-	}
-
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "No irq resource for %s\n",
-			dev_name(&pdev->dev));
-		return -EINVAL;
-	}
-	hsdma->irq = res->start;
-
 	refcount_set(&hsdma->pc_refcnt, 0);
 	spin_lock_init(&hsdma->lock);
 
@@ -997,7 +981,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev,
 			"request_irq failed with err %d\n", err);
-		goto err_unregister;
+		goto err_free;
 	}
 
 	platform_set_drvdata(pdev, hsdma);
@@ -1006,6 +990,8 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_free:
+	of_dma_controller_free(pdev->dev.of_node);
 err_unregister:
 	dma_async_device_unregister(dd);
 
-- 
2.17.1

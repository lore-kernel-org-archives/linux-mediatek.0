From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 1/5] usb: xhci-mtk: get optional clock by devm_clk_get_optional()
Date: Sat, 30 Mar 2019 17:28:16 +0800
Message-ID: <2ec86ffd7de45dabaa7257019a79f1e80751934c.1553937592.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Use devm_clk_get_optional() to get optional clock

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 60987c787e44..026fe18972d3 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -206,19 +206,6 @@ static int xhci_mtk_ssusb_config(struct xhci_hcd_mtk *mtk)
 	return xhci_mtk_host_enable(mtk);
 }
 
-/* ignore the error if the clock does not exist */
-static struct clk *optional_clk_get(struct device *dev, const char *id)
-{
-	struct clk *opt_clk;
-
-	opt_clk = devm_clk_get(dev, id);
-	/* ignore error number except EPROBE_DEFER */
-	if (IS_ERR(opt_clk) && (PTR_ERR(opt_clk) != -EPROBE_DEFER))
-		opt_clk = NULL;
-
-	return opt_clk;
-}
-
 static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
 {
 	struct device *dev = mtk->dev;
@@ -229,15 +216,15 @@ static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
 		return PTR_ERR(mtk->sys_clk);
 	}
 
-	mtk->ref_clk = optional_clk_get(dev, "ref_ck");
+	mtk->ref_clk = devm_clk_get_optional(dev, "ref_ck");
 	if (IS_ERR(mtk->ref_clk))
 		return PTR_ERR(mtk->ref_clk);
 
-	mtk->mcu_clk = optional_clk_get(dev, "mcu_ck");
+	mtk->mcu_clk = devm_clk_get_optional(dev, "mcu_ck");
 	if (IS_ERR(mtk->mcu_clk))
 		return PTR_ERR(mtk->mcu_clk);
 
-	mtk->dma_clk = optional_clk_get(dev, "dma_ck");
+	mtk->dma_clk = devm_clk_get_optional(dev, "dma_ck");
 	return PTR_ERR_OR_ZERO(mtk->dma_clk);
 }
 
-- 
2.20.1

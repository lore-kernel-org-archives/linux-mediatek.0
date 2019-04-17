From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v3 1/6] usb: xhci-mtk: get optional clock by devm_clk_get_optional()
Date: Wed, 17 Apr 2019 16:28:16 +0800
Message-ID: <bacafa9a60c2f437e2be0ccdf504492343fc0a66.1555488276.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Use devm_clk_get_optional() to get optional clock instead of
optional_clk_get() which uses devm_clk_get() to get clock and
checks for -EPROBE_DEFER but not -ENOENT as devm_clk_get_optional()
does, in fact, only ignoring -ENOENT will cover more errors, so the
replacement doesn't change original purpose.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: modify changelog comment
v2: no changes
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
2.21.0

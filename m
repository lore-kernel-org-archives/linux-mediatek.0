From: Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] usb: mtk-xhci: Set the XHCI_NO_64BIT_SUPPORT quirk
Date: Thu, 10 Oct 2019 16:50:04 +0900
Message-ID: <20191010075004.192818-1-tfiga@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
        support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
        support" <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Changqi Hu <Changqi.Hu@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Shik Chen <shik@chromium.org>, Tomasz Figa <tfiga@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

MediaTek XHCI host controller does not support 64-bit addressing despite
the AC64 bit of HCCPARAMS1 register being set. The platform-specific
glue sets the DMA mask to 32 bits on its own, but it has no effect,
because xhci_gen_setup() overrides it according to hardware
capabilities.

Use the XHCI_NO_64BIT_SUPPORT quirk to tell the XHCI core to force
32-bit DMA mask instead.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/usb/host/xhci-mtk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index b18a6baef204a..4d101d52cc11b 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -395,6 +395,11 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
 	xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
 	if (mtk->lpm_support)
 		xhci->quirks |= XHCI_LPM_SUPPORT;
+	/*
+	 * MTK host controller does not support 64-bit addressing, despite
+	 * having the AC64 bit of the HCCPARAMS1 register set.
+	 */
+	xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
 }
 
 /* called during probe() after chip reset completes */
@@ -488,11 +493,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
-	/* Initialize dma_mask and coherent_dma_mask to 32-bits */
-	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
-	if (ret)
-		goto disable_clk;
-
 	hcd = usb_create_hcd(driver, dev, dev_name(dev));
 	if (!hcd) {
 		ret = -ENOMEM;
-- 
2.23.0.581.g78d2f28ef7-goog

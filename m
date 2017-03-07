From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 1/2] usb: xhci-mtk: check hcc_params after adding primary hcd
Date: Tue, 7 Mar 2017 11:32:22 +0800
Message-ID: <1488857543-9384-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>
List-Id: linux-mediatek@lists.infradead.org

hcc_params is set in xhci_gen_setup() called from usb_add_hcd(),
so checks the Maximum Primary Stream Array Size in the hcc_params
register after adding primary hcd.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 9066ec9..6ac73a6 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -678,13 +678,13 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		goto power_off_phys;
 	}
 
-	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
-		xhci->shared_hcd->can_do_streams = 1;
-
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto put_usb3_hcd;
 
+	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
+		xhci->shared_hcd->can_do_streams = 1;
+
 	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto dealloc_usb2_hcd;
-- 
1.7.9.5

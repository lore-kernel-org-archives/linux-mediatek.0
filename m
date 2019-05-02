From: Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 2/2] usb: xhci-mtk: Do not create shared_hcd if no USB 3.0 port available
Date: Thu,  2 May 2019 12:56:30 +0800
Message-ID: <20190502045631.229386-2-drinkcat@chromium.org>
References: <20190502045631.229386-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502045631.229386-1-drinkcat@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Khuong Dinh <khuong@os.amperecomputing.com>, Hoan Tran <hoan@os.amperecomputing.com>
List-Id: linux-mediatek@lists.infradead.org

When the controller only supports USB 2.0, do not even create the
USB 3.0 hcd/root hub.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/usb/host/xhci-mtk.c | 44 +++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 026fe18972d3e5b..189f5dc614e6e05 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -527,23 +527,28 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	xhci->imod_interval = 5000;
 	device_property_read_u32(dev, "imod-interval-ns", &xhci->imod_interval);
 
-	xhci->shared_hcd = usb_create_shared_hcd(driver, dev,
+	/* Only create shared_hcd when USB3.0 port is available. */
+	if (xhci->usb3_rhub.num_ports > 0) {
+		xhci->shared_hcd = usb_create_shared_hcd(driver, dev,
 			dev_name(dev), hcd);
-	if (!xhci->shared_hcd) {
-		ret = -ENOMEM;
-		goto disable_device_wakeup;
+		if (!xhci->shared_hcd) {
+			ret = -ENOMEM;
+			goto disable_device_wakeup;
+		}
 	}
 
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto put_usb3_hcd;
 
-	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
-		xhci->shared_hcd->can_do_streams = 1;
+	if (xhci->usb3_rhub.num_ports > 0) {
+		if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
+			xhci->shared_hcd->can_do_streams = 1;
 
-	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
-	if (ret)
-		goto dealloc_usb2_hcd;
+		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
+		if (ret)
+			goto dealloc_usb2_hcd;
+	}
 
 	return 0;
 
@@ -552,7 +557,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 
 put_usb3_hcd:
 	xhci_mtk_sch_exit(mtk);
-	usb_put_hcd(xhci->shared_hcd);
+	if (xhci->shared_hcd)
+		usb_put_hcd(xhci->shared_hcd);
 
 disable_device_wakeup:
 	device_init_wakeup(dev, false);
@@ -579,12 +585,14 @@ static int xhci_mtk_remove(struct platform_device *dev)
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	struct usb_hcd  *shared_hcd = xhci->shared_hcd;
 
-	usb_remove_hcd(shared_hcd);
+	if (shared_hcd)
+		usb_remove_hcd(shared_hcd);
 	xhci->shared_hcd = NULL;
 	device_init_wakeup(&dev->dev, false);
 
 	usb_remove_hcd(hcd);
-	usb_put_hcd(shared_hcd);
+	if (shared_hcd)
+		usb_put_hcd(shared_hcd);
 	usb_put_hcd(hcd);
 	xhci_mtk_sch_exit(mtk);
 	xhci_mtk_clks_disable(mtk);
@@ -611,8 +619,10 @@ static int __maybe_unused xhci_mtk_suspend(struct device *dev)
 	xhci_dbg(xhci, "%s: stop port polling\n", __func__);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	del_timer_sync(&hcd->rh_timer);
-	clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	del_timer_sync(&xhci->shared_hcd->rh_timer);
+	if (xhci->shared_hcd) {
+		clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+		del_timer_sync(&xhci->shared_hcd->rh_timer);
+	}
 
 	xhci_mtk_host_disable(mtk);
 	xhci_mtk_clks_disable(mtk);
@@ -631,8 +641,10 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	xhci_mtk_host_enable(mtk);
 
 	xhci_dbg(xhci, "%s: restart port polling\n", __func__);
-	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	usb_hcd_poll_rh_status(xhci->shared_hcd);
+	if (xhci->shared_hcd) {
+		set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+		usb_hcd_poll_rh_status(xhci->shared_hcd);
+	}
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	usb_hcd_poll_rh_status(hcd);
 	return 0;
-- 
2.21.0.593.g511ec345e18-goog

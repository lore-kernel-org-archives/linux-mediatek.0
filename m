From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2] usb: xhci-mtk: fix AHB bus hang up caused by roothubs polling
Date: Sat, 5 Dec 2015 11:16:45 +0800
Message-ID: <1449285405-12015-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

when ip fails to enter sleep mode, register access protection will
be disabled, at the same time if all clocks are disabled, access
register will hang up AHB bus.
the common case causes ip sleep failure is that after all ports
enter U3 but before ip enters sleep mode, a port receives a resume
signal('K'). this will happens when such as clicks mouse to try to
do remote-wakeup to stop system enter suspend.
so stop polling root hubs to avoid access xHCI register on bus
suspend, and restart it when bus resumes.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/host/xhci-mtk.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index c9ab6a4..9532f5a 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -696,9 +696,24 @@ static int xhci_mtk_remove(struct platform_device *dev)
 }
 
 #ifdef CONFIG_PM_SLEEP
+/*
+ * if ip sleep fails, and all clocks are disabled, access register will hang
+ * AHB bus, so stop polling roothubs to avoid regs access on bus suspend.
+ * and no need to check whether ip sleep failed or not; this will cause SPM
+ * to wake up system immediately after system suspend complete if ip sleep
+ * fails, it is what we wanted.
+ */
 static int xhci_mtk_suspend(struct device *dev)
 {
 	struct xhci_hcd_mtk *mtk = dev_get_drvdata(dev);
+	struct usb_hcd *hcd = mtk->hcd;
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	xhci_dbg(xhci, "%s: stop port polling\n", __func__);
+	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
+	del_timer_sync(&hcd->rh_timer);
+	clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+	del_timer_sync(&xhci->shared_hcd->rh_timer);
 
 	xhci_mtk_host_disable(mtk);
 	xhci_mtk_phy_power_off(mtk);
@@ -710,11 +725,19 @@ static int xhci_mtk_suspend(struct device *dev)
 static int xhci_mtk_resume(struct device *dev)
 {
 	struct xhci_hcd_mtk *mtk = dev_get_drvdata(dev);
+	struct usb_hcd *hcd = mtk->hcd;
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 
 	usb_wakeup_disable(mtk);
 	xhci_mtk_clks_enable(mtk);
 	xhci_mtk_phy_power_on(mtk);
 	xhci_mtk_host_enable(mtk);
+
+	xhci_dbg(xhci, "%s: restart port polling\n", __func__);
+	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
+	usb_hcd_poll_rh_status(hcd);
+	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+	usb_hcd_poll_rh_status(xhci->shared_hcd);
 	return 0;
 }
 
-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 1/2] usb: xhci: Make it possible to not have a secondary HCD
 (3.0)
Date: Thu,  2 May 2019 12:56:29 +0800
Message-ID: <20190502045631.229386-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Khuong Dinh <khuong@os.amperecomputing.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Hoan Tran <hoan@os.amperecomputing.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Some XHCI controllers may not have any USB 3.0 port, in this case, it
is not useful to create add hcd->shared_hcd, which has 2 main
downsides:
 - A useless USB 3.0 root hub is created.
 - A warning is thrown on boot:
hub 2-0:1.0: config failed, hub doesn't have any ports! (err -19)

The change is mostly about checking if hcd->shared_hcd is NULL before
accessing it. The one special case is in xhci_run, where we need to
call xhci_run_finished immediately, if there is no secondary hcd.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

This is a respin of https://lore.kernel.org/patchwork/patch/863993/,
hopefully addressing the comments there. Note that I dropped the change
in xhci-plat.c, as I do not have a device to test it, but made a
similar change in xhci-mtk.c, in the next patch.

(the @apm.com addresses seem to bounce, so I added some
@amperecomputing.com instead, if somebody there can track back the
original issue, I'm happy to provide a patch for xhci-plat.c as well)

drivers/usb/host/xhci-hub.c |  7 ++++--
 drivers/usb/host/xhci.c     | 45 +++++++++++++++++++++++++++----------
 2 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 3abe70ff1b1e2af..9a9c5a63ae57c6d 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -627,8 +627,11 @@ static int xhci_enter_test_mode(struct xhci_hcd *xhci,
 	/* Put all ports to the Disable state by clear PP */
 	xhci_dbg(xhci, "Disable all port (PP = 0)\n");
 	/* Power off USB3 ports*/
-	for (i = 0; i < xhci->usb3_rhub.num_ports; i++)
-		xhci_set_port_power(xhci, xhci->shared_hcd, i, false, flags);
+	if (xhci->shared_hcd) {
+		for (i = 0; i < xhci->usb3_rhub.num_ports; i++)
+			xhci_set_port_power(xhci, xhci->shared_hcd, i, false,
+					flags);
+	}
 	/* Power off USB2 ports*/
 	for (i = 0; i < xhci->usb2_rhub.num_ports; i++)
 		xhci_set_port_power(xhci, xhci->main_hcd, i, false, flags);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9bb796794e3937..a2cf715c53f2164 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -523,6 +523,10 @@ static void compliance_mode_recovery(struct timer_list *t)
  */
 static void compliance_mode_recovery_timer_init(struct xhci_hcd *xhci)
 {
+	/* No compliance mode recovery needed if there is no USB 3.0 hcd. */
+	if (!xhci->shared_hcd)
+		return;
+
 	xhci->port_status_u0 = 0;
 	timer_setup(&xhci->comp_mode_recovery_timer, compliance_mode_recovery,
 		    0);
@@ -610,7 +614,8 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 		xhci_halt(xhci);
 		return -ENODEV;
 	}
-	xhci->shared_hcd->state = HC_STATE_RUNNING;
+	if (xhci->shared_hcd)
+		xhci->shared_hcd->state = HC_STATE_RUNNING;
 	xhci->cmd_ring_state = CMD_RING_STATE_RUNNING;
 
 	if (xhci->quirks & XHCI_NEC_HOST)
@@ -698,6 +703,10 @@ int xhci_run(struct usb_hcd *hcd)
 
 	xhci_debugfs_init(xhci);
 
+	/* There is no secondary HCD, start the host controller immediately. */
+	if (!xhci->shared_hcd)
+		return xhci_run_finished(xhci);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_run);
@@ -984,7 +993,8 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 		return 0;
 
 	if (hcd->state != HC_STATE_SUSPENDED ||
-			xhci->shared_hcd->state != HC_STATE_SUSPENDED)
+			(xhci->shared_hcd &&
+				xhci->shared_hcd->state != HC_STATE_SUSPENDED))
 		return -EINVAL;
 
 	xhci_dbc_suspend(xhci);
@@ -997,15 +1007,18 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 	xhci_dbg(xhci, "%s: stopping port polling.\n", __func__);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	del_timer_sync(&hcd->rh_timer);
-	clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	del_timer_sync(&xhci->shared_hcd->rh_timer);
+	if (xhci->shared_hcd) {
+		clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+		del_timer_sync(&xhci->shared_hcd->rh_timer);
+	}
 
 	if (xhci->quirks & XHCI_SUSPEND_DELAY)
 		usleep_range(1000, 1500);
 
 	spin_lock_irq(&xhci->lock);
 	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
+	if (xhci->shared_hcd)
+		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
 	/* step 1: stop endpoint */
 	/* skipped assuming that port suspend has done */
 
@@ -1103,7 +1116,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		msleep(100);
 
 	set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-	set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
+	if (xhci->shared_hcd)
+		set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
 
 	spin_lock_irq(&xhci->lock);
 	if ((xhci->quirks & XHCI_RESET_ON_RESUME) || xhci->broken_suspend)
@@ -1145,7 +1159,9 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
 		/* Let the USB core know _both_ roothubs lost power. */
 		usb_root_hub_lost_power(xhci->main_hcd->self.root_hub);
-		usb_root_hub_lost_power(xhci->shared_hcd->self.root_hub);
+		if (xhci->shared_hcd)
+			usb_root_hub_lost_power(
+					xhci->shared_hcd->self.root_hub);
 
 		xhci_dbg(xhci, "Stop HCD\n");
 		xhci_halt(xhci);
@@ -1185,10 +1201,12 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		retval = xhci_run(hcd->primary_hcd);
 		if (!retval) {
 			xhci_dbg(xhci, "Start the secondary HCD\n");
-			retval = xhci_run(secondary_hcd);
+			if (secondary_hcd)
+				retval = xhci_run(secondary_hcd);
 		}
 		hcd->state = HC_STATE_SUSPENDED;
-		xhci->shared_hcd->state = HC_STATE_SUSPENDED;
+		if (xhci->shared_hcd)
+			xhci->shared_hcd->state = HC_STATE_SUSPENDED;
 		goto done;
 	}
 
@@ -1216,7 +1234,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 	if (retval == 0) {
 		/* Resume root hubs only when have pending events. */
 		if (xhci_pending_portevent(xhci)) {
-			usb_hcd_resume_root_hub(xhci->shared_hcd);
+			if (xhci->shared_hcd)
+				usb_hcd_resume_root_hub(xhci->shared_hcd);
 			usb_hcd_resume_root_hub(hcd);
 		}
 	}
@@ -1235,8 +1254,10 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
 	/* Re-enable port polling. */
 	xhci_dbg(xhci, "%s: starting port polling.\n", __func__);
-	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	usb_hcd_poll_rh_status(xhci->shared_hcd);
+	if (xhci->shared_hcd) {
+		set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+		usb_hcd_poll_rh_status(xhci->shared_hcd);
+	}
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	usb_hcd_poll_rh_status(hcd);
 
-- 
2.21.0.593.g511ec345e18-goog

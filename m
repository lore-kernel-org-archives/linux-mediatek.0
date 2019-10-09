From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 2/2] usb: mtu3: fix race condition about delayed_status
Date: Wed, 9 Oct 2019 17:05:00 +0800
Message-ID: <1570611900-7112-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1570611900-7112-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570611900-7112-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

usb_composite_setup_continue() may be called before composite_setup()
return USB_GADGET_DELAYED_STATUS, then the controller driver will
delay status stage after composite_setup() finish, but the class driver
don't ask the controller to continue delayed status anymore, this will
cause control transfer timeout.

happens when use mass storage (also enabled other class driver):

cpu1:                               cpu2
handle_setup(SET_CONFIG) //gadget driver
  unlock (g->lock)
  gadget_driver->setup()
    composite_setup()
      lock(cdev->lock)
        set_config()
          fsg_set_alt() // maybe some times due to many class are enabled
            raise FSG_STATE_CONFIG_CHANGE
            return USB_GADGET_DELAYED_STATUS
                                    handle_exception()
                                    usb_composite_setup_continue()
      unlock(cdev->lock)
                                      lock(cdev->lock)
                                        ep0_queue()
                                          lock (g->lock)
                                          //no delayed status, nothing todo
                                          unlock (g->lock)
                                      unlock(cdev->lock)
    return USB_GADGET_DELAYED_STATUS // composite_setup
  lock (g->lock)
get USB_GADGET_DELAYED_STATUS //handle_setup [1]

Try to fix the race condition as following:
After the driver gets USB_GADGET_DELAYED_STATUS at [1], if we find
there is a usb_request in ep0 request list, it means composite already
asked us to continue delayed status by usb_composite_setup_continue(),
so we skip request about delayed_status by composite_setup() and still
do status stage.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget_ep0.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index df3fd055792f..2be182bd793a 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -671,8 +671,16 @@ __acquires(mtu->lock)
 	if (mtu->test_mode) {
 		;	/* nothing to do */
 	} else if (handled == USB_GADGET_DELAYED_STATUS) {
-		/* handle the delay STATUS phase till receive ep_queue on ep0 */
-		mtu->delayed_status = true;
+
+		mreq = next_ep0_request(mtu);
+		if (mreq) {
+			/* already asked us to continue delayed status */
+			ep0_do_status_stage(mtu);
+			ep0_req_giveback(mtu, &mreq->request);
+		} else {
+			/* do delayed STATUS stage till receive ep0_queue */
+			mtu->delayed_status = true;
+		}
 	} else if (le16_to_cpu(setup.wLength) == 0) { /* no data stage */
 
 		ep0_do_status_stage(mtu);
-- 
2.23.0

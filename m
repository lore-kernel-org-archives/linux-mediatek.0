From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [RFC/RFT usb-next v1 6/6] usb: core: hcd: remove support for initializing a single PHY
Date: Thu, 25 Jan 2018 01:16:39 +0100
Message-ID: <20180125001639.14681-7-martin.blumenstingl@googlemail.com>
References: <20180125001639.14681-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180125001639.14681-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, Peter.Chen-3arQi8VN3Tc@public.gmane.org
Cc: mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

With the new PHY wrapper in place we can now handle multiple PHYs.
Remove the code which handles only one generic PHY as this is now
covered (with support for multiple PHYs as well as suspend/resume
support) by the new PHY wrapper.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/usb/core/hcd.c  | 37 -------------------------------------
 include/linux/usb/hcd.h |  1 -
 2 files changed, 38 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index fc99cddc117e..5d59e0b4d463 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2757,30 +2757,6 @@ int usb_add_hcd(struct usb_hcd *hcd,
 		}
 	}
 
-	if (IS_ENABLED(CONFIG_GENERIC_PHY) && !hcd->phy) {
-		struct phy *phy = phy_get(hcd->self.sysdev, "usb");
-
-		if (IS_ERR(phy)) {
-			retval = PTR_ERR(phy);
-			if (retval == -EPROBE_DEFER)
-				goto err_phy;
-		} else {
-			retval = phy_init(phy);
-			if (retval) {
-				phy_put(phy);
-				goto err_phy;
-			}
-			retval = phy_power_on(phy);
-			if (retval) {
-				phy_exit(phy);
-				phy_put(phy);
-				goto err_phy;
-			}
-			hcd->phy = phy;
-			hcd->remove_phy = 1;
-		}
-	}
-
 	hcd->phy_roothub = usb_phy_roothub_init(hcd->self.sysdev);
 	if (IS_ERR(hcd->phy_roothub)) {
 		retval = PTR_ERR(hcd->phy_roothub);
@@ -2959,13 +2935,6 @@ int usb_add_hcd(struct usb_hcd *hcd,
 err_usb_phy_roothub_power_on:
 	usb_phy_roothub_exit(hcd->phy_roothub);
 err_phy_roothub_init:
-	if (IS_ENABLED(CONFIG_GENERIC_PHY) && hcd->remove_phy && hcd->phy) {
-		phy_power_off(hcd->phy);
-		phy_exit(hcd->phy);
-		phy_put(hcd->phy);
-		hcd->phy = NULL;
-	}
-err_phy:
 	if (hcd->remove_phy && hcd->usb_phy) {
 		usb_phy_shutdown(hcd->usb_phy);
 		usb_put_phy(hcd->usb_phy);
@@ -3046,12 +3015,6 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 	usb_phy_roothub_power_off(hcd->phy_roothub);
 	usb_phy_roothub_exit(hcd->phy_roothub);
 
-	if (IS_ENABLED(CONFIG_GENERIC_PHY) && hcd->remove_phy && hcd->phy) {
-		phy_power_off(hcd->phy);
-		phy_exit(hcd->phy);
-		phy_put(hcd->phy);
-		hcd->phy = NULL;
-	}
 	if (hcd->remove_phy && hcd->usb_phy) {
 		usb_phy_shutdown(hcd->usb_phy);
 		usb_put_phy(hcd->usb_phy);
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 9e8fc9c5f394..e464c7384bd5 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -103,7 +103,6 @@ struct usb_hcd {
 	 * other external phys should be software-transparent
 	 */
 	struct usb_phy		*usb_phy;
-	struct phy		*phy;
 	struct usb_phy_roothub	*phy_roothub;
 
 	/* Flags that need to be manipulated atomically because they can
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

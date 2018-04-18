From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH usb v6 1/6] usb: core: phy: fix return value of
 usb_phy_roothub_exit()
Date: Wed, 18 Apr 2018 21:39:46 +0200
Message-ID: <20180418193951.17922-2-martin.blumenstingl@googlemail.com>
References: <20180418193951.17922-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180418193951.17922-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: d-gerlach-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, j-keerthy-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rishabh Bhatnagar <rishabhb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, rogerq-l0cyMroinI0@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

usb_phy_roothub_exit() should return the error code from the phy_exit()
call if exiting the PHY failed.
However, since a wrong variable is used usb_phy_roothub_exit() currently
always returns 0, even if one of the phy_exit calls returned an error.
Clang also reports this bug:
kernel/drivers/usb/core/phy.c:114:8: warning: explicitly assigning value of
variable of type 'int' to itself [-Wself-assign] error, forbidden
warning: phy.c:114

Fix this by assigning the error code from phy_exit() to the "ret"
variable to propagate the error correctly.

Fixes: 07dbff0ddbd86c ("usb: core: add a wrapper for the USB PHYs on the HCD")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Signed-off-by: Rishabh Bhatnagar <rishabhb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Tested-by: Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/core/phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
index 09b7c43c0ea4..f19aaa3c899c 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -111,7 +111,7 @@ int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub)
 	list_for_each_entry(roothub_entry, head, list) {
 		err = phy_exit(roothub_entry->phy);
 		if (err)
-			ret = ret;
+			ret = err;
 	}
 
 	return ret;
-- 
2.17.0

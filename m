From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH usb v6 4/6] usb: core: phy: make it a no-op if
 CONFIG_GENERIC_PHY is disabled
Date: Wed, 18 Apr 2018 21:39:49 +0200
Message-ID: <20180418193951.17922-5-martin.blumenstingl@googlemail.com>
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
Cc: d-gerlach-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, j-keerthy-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, rogerq-l0cyMroinI0@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

If the generic PHY support is disabled the stub of devm_of_phy_get_by_index
returns ENOSYS. This corner case isn't handled properly by
usb_phy_roothub_add_phy and at least breaks USB support on Raspberry Pi
(bcm2835_defconfig):

    dwc2 20980000.usb: dwc2_hcd_init() FAILED, returning -38
    dwc2: probe of 20980000.usb failed with error -38

Let usb_phy_roothub_alloc() return in case CONFIG_GENERIC_PHY is
disabled to fix this issue (compilers might even be smart enough to
optimize away most of the code within usb_phy_roothub_alloc and
usb_phy_roothub_add_phy if CONFIG_GENERIC_PHY is disabled). All
existing usb_phy_roothub_* functions are already NULL-safe, so no
special handling is required there.

Fixes: 07dbff0ddbd8 ("usb: core: add a wrapper for the USB PHYs on the HCD")
Reported-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/usb/core/phy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
index a39d9bb26a4f..9879767452a2 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -50,6 +50,9 @@ struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev)
 	struct usb_phy_roothub *phy_roothub;
 	int i, num_phys, err;
 
+	if (!IS_ENABLED(CONFIG_GENERIC_PHY))
+		return NULL;
+
 	num_phys = of_count_phandle_with_args(dev->of_node, "phys",
 					      "#phy-cells");
 	if (num_phys <= 0)
-- 
2.17.0

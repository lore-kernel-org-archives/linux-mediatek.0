From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] usb: mtu3: fix U3 port link issue
Date: Wed, 7 Dec 2016 15:23:13 +0800
Message-ID: <1481095393-23198-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Oliver Neukum <oneukum-IBi9RG/b67k@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alan Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

the issue is introduced when @is_u3_ip is used in mtu3_device_enabe()
before initialized in mtu3_mem_alloc(), so get global IP information
at first before used by following functins.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/mtu3/mtu3_core.c |   18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 520e55a..af3e531 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -481,21 +481,14 @@ static int mtu3_mem_alloc(struct mtu3 *mtu)
 	void __iomem *mbase = mtu->mac_base;
 	struct mtu3_ep *ep_array;
 	int in_ep_num, out_ep_num;
-	u32 cap_epinfo, cap_dev;
+	u32 cap_epinfo;
 	int ret;
 	int i;
 
-	mtu->hw_version = mtu3_readl(mtu->ippc_base, U3D_SSUSB_HW_ID);
-
-	cap_dev = mtu3_readl(mtu->ippc_base, U3D_SSUSB_IP_DEV_CAP);
-	mtu->is_u3_ip = !!SSUSB_IP_DEV_U3_PORT_NUM(cap_dev);
-
 	cap_epinfo = mtu3_readl(mbase, U3D_CAP_EPINFO);
 	in_ep_num = CAP_TX_EP_NUM(cap_epinfo);
 	out_ep_num = CAP_RX_EP_NUM(cap_epinfo);
 
-	dev_info(mtu->dev, "IP version 0x%x(%s IP)\n", mtu->hw_version,
-		mtu->is_u3_ip ? "U3" : "U2");
 	dev_info(mtu->dev, "fifosz/epnum: Tx=%#x/%d, Rx=%#x/%d\n",
 		 mtu3_readl(mbase, U3D_CAP_EPNTXFFSZ), in_ep_num,
 		 mtu3_readl(mbase, U3D_CAP_EPNRXFFSZ), out_ep_num);
@@ -730,8 +723,17 @@ irqreturn_t mtu3_irq(int irq, void *data)
 
 static int mtu3_hw_init(struct mtu3 *mtu)
 {
+	u32 cap_dev;
 	int ret;
 
+	mtu->hw_version = mtu3_readl(mtu->ippc_base, U3D_SSUSB_HW_ID);
+
+	cap_dev = mtu3_readl(mtu->ippc_base, U3D_SSUSB_IP_DEV_CAP);
+	mtu->is_u3_ip = !!SSUSB_IP_DEV_U3_PORT_NUM(cap_dev);
+
+	dev_info(mtu->dev, "IP version 0x%x(%s IP)\n", mtu->hw_version,
+		mtu->is_u3_ip ? "U3" : "U2");
+
 	mtu3_device_reset(mtu);
 
 	ret = mtu3_device_enable(mtu);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

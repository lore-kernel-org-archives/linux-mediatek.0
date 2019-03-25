From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] usb: mtu3: fix EXTCON dependency
Date: Mon, 25 Mar 2019 14:54:30 +0100
Message-ID: <20190325135440.2166315-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

When EXTCON is a loadable module, mtu3 fails to link as built-in:

drivers/usb/mtu3/mtu3_plat.o: In function `mtu3_probe':
mtu3_plat.c:(.text+0x690): undefined reference to `extcon_get_edev_by_phandle'

Add a Kconfig dependency to force mtu3 also to be a loadable module
if extconn is, but still allow it to be built without extcon.

Fixes: d0ed062a8b75 ("usb: mtu3: dual-role mode support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/mtu3/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/mtu3/Kconfig b/drivers/usb/mtu3/Kconfig
index bcc23486c4ed..928c2cd6fc00 100644
--- a/drivers/usb/mtu3/Kconfig
+++ b/drivers/usb/mtu3/Kconfig
@@ -6,6 +6,7 @@ config USB_MTU3
 	tristate "MediaTek USB3 Dual Role controller"
 	depends on USB || USB_GADGET
 	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on EXTCON || !EXTCON
 	select USB_XHCI_MTK if USB_SUPPORT && USB_XHCI_HCD
 	help
 	  Say Y or M here if your system runs on MediaTek SoCs with
-- 
2.20.0

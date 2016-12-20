From: John Crispin <john@phrozen.org>
Subject: [PATCH] usb: make the MTK XHCI driver compile for older MIPS SoCs
Date: Tue, 20 Dec 2016 19:08:58 +0100
Message-ID: <1482257338-60884-1-git-send-email-john@phrozen.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, John Crispin <john@phrozen.org>
List-Id: linux-mediatek@lists.infradead.org

The MIPS based MT7621 shares the same XHCI core as the newer generation of
ARM based SoCs. The driver works out of the box and we only need to make it
buildable in Kconfig.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/usb/host/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 0b80cee..eb121b2 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -45,9 +45,9 @@ config USB_XHCI_PLATFORM
 	  If unsure, say N.
 
 config USB_XHCI_MTK
-	tristate "xHCI support for Mediatek MT65xx"
+	tristate "xHCI support for Mediatek MT65xx/MT7621"
 	select MFD_SYSCON
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on (MIPS && SOC_MT7621) || ARCH_MEDIATEK || COMPILE_TEST
 	---help---
 	  Say 'Y' to enable the support for the xHCI host controller
 	  found in Mediatek MT65xx SoCs.
-- 
1.7.10.4

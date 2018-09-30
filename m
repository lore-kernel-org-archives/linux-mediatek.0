From: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH]  mt76: fix header guard macro define names
Date: Sun, 30 Sep 2018 23:57:15 +0100
Message-ID: <20180930225715.18491-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

The header guards that are #defined are different from those being
checked.  Fix this by #defining them to the correct name.

Fixes clang warnings:
drivers/net/wireless/mediatek/mt76/mt76x02_mcu.h:17:9:
warning: '__MT76x02_MCU_H' is used as a header guard here, followed
by #define of a different macro [-Wheader-guard]

drivers/net/wireless/mediatek/mt76/mt76x02_usb.h:17:9:
warning: '__MT76x02_USB_H' is used as a header guard here, followed
by #define of a different macro [-Wheader-guard]

Fixes: 905db7470199 ("mt76: usb: move mt76x02 mcu code in mt76x02-usb module")
Fixes: edaa580bc830 ("mt76: move shared mcu_calibrate routine in mt76x02-lib module")
Signed-off-by: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_mcu.h | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x02_usb.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76x02_mcu.h
index 2f5af3dad2bb..6e178bec07d8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mcu.h
@@ -15,7 +15,7 @@
  */
 
 #ifndef __MT76x02_MCU_H
-#define __MT76x0x_MCU_H
+#define __MT76x02_MCU_H
 
 #define MT_MCU_RESET_CTL		0x070C
 #define MT_MCU_INT_LEVEL		0x0718
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_usb.h b/drivers/net/wireless/mediatek/mt76/mt76x02_usb.h
index 2482f9761fcd..39dcfeee39f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_usb.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_usb.h
@@ -15,7 +15,7 @@
  */
 
 #ifndef __MT76x02_USB_H
-#define __MT76x0x_USB_H
+#define __MT76x02_USB_H
 
 #include "mt76.h"
 
-- 
2.17.1

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 12/16] mt76x0: remove unused mt76x0_wait_asic_ready routine
Date: Sat, 25 Aug 2018 12:40:52 +0200
Message-ID: <20180825104056.9130-13-lorenzo.bianconi@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nbd-Vt+b4OUoWG0@public.gmane.org
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Delete core.c source file since, removing mt76x0_wait_asic_ready
routine, it is no longer needed

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 .../wireless/mediatek/mt76/mt76x0/Makefile    |  2 +-
 .../net/wireless/mediatek/mt76/mt76x0/core.c  | 34 -------------------
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/core.c

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/Makefile b/drivers/net/wireless/mediatek/mt76/mt76x0/Makefile
index 7843908261ba..2f1721263aa5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/Makefile
@@ -2,6 +2,6 @@ obj-$(CONFIG_MT76x0U)    += mt76x0.o
 
 mt76x0-objs	= \
 	usb.o init.o main.o mcu.o trace.o dma.o eeprom.o phy.o \
-	mac.o util.o debugfs.o tx.o core.o
+	mac.o util.o debugfs.o tx.o
 # ccflags-y := -DDEBUG
 CFLAGS_trace.o := -I$(src)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/core.c b/drivers/net/wireless/mediatek/mt76/mt76x0/core.c
deleted file mode 100644
index 892803fce842..000000000000
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/core.c
+++ /dev/null
@@ -1,34 +0,0 @@
-/*
- * Copyright (C) 2014 Felix Fietkau <nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
- * Copyright (C) 2015 Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2
- * as published by the Free Software Foundation
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#include "mt76x0.h"
-
-int mt76x0_wait_asic_ready(struct mt76x0_dev *dev)
-{
-	int i = 100;
-	u32 val;
-
-	do {
-		if (test_bit(MT76_REMOVED, &dev->mt76.state))
-			return -EIO;
-
-		val = mt76_rr(dev, MT_MAC_CSR0);
-		if (val && ~val)
-			return 0;
-
-		udelay(10);
-	} while (i--);

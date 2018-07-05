From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 11/11] mt76: Kconfig and Makefile for mt76x0 driver
Date: Thu,  5 Jul 2018 08:12:22 +0200
Message-ID: <1530771142-4118-12-git-send-email-sgruszka@redhat.com>
References: <1530771142-4118-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1530771142-4118-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Add Kconfig and Makefiles for mt76x0 driver. Now the driver
can be build.

Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/Kconfig         | 7 +++++++
 drivers/net/wireless/mediatek/mt76/Makefile        | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x0/Makefile | 7 +++++++
 3 files changed, 15 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt76x0/Makefile

diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
index fc05d79c80d0..84854736809a 100644
--- a/drivers/net/wireless/mediatek/mt76/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/Kconfig
@@ -1,6 +1,13 @@
 config MT76_CORE
 	tristate
 
+config MT76x0U
+	tristate "MediaTek MT76x0U (USB) support"
+	depends on MAC80211
+	depends on USB
+	help
+	  This adds support for MT7610U-based wireless USB dongles.
+
 config MT76x2E
 	tristate "MediaTek MT76x2E (PCIe) support"
 	select MT76_CORE
diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index a0156bc01dea..08f93127e9e7 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_MT76_CORE) += mt76.o
+obj-$(CONFIG_MT76x0U) += mt76x0/
 obj-$(CONFIG_MT76x2E) += mt76x2e.o
 
 mt76-y := \
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/Makefile b/drivers/net/wireless/mediatek/mt76/mt76x0/Makefile
new file mode 100644
index 000000000000..7843908261ba
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/Makefile
@@ -0,0 +1,7 @@
+obj-$(CONFIG_MT76x0U)    += mt76x0.o
+
+mt76x0-objs	= \
+	usb.o init.o main.o mcu.o trace.o dma.o eeprom.o phy.o \
+	mac.o util.o debugfs.o tx.o core.o
+# ccflags-y := -DDEBUG
+CFLAGS_trace.o := -I$(src)
-- 
1.9.3

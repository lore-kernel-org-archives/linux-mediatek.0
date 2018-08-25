From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 06/16] mt76x0: remove mt76x0_vendor_reset routine
Date: Sat, 25 Aug 2018 12:40:46 +0200
Message-ID: <20180825104056.9130-7-lorenzo.bianconi@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nbd-Vt+b4OUoWG0@public.gmane.org
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Remove mt76x0_vendor_reset duplicated routine and use mt76u_mcu_fw_reset
utility function for mcu fw reset

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/usb.c | 6 ------
 drivers/net/wireless/mediatek/mt76/mt76x0/usb.h | 1 -
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
index 75768ebf8b30..c8ea3126e7dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
@@ -571,7 +571,7 @@ static int mt76x0_load_firmware(struct mt76x0_dev *dev)
 	mt76_set(dev, MT_USB_DMA_CFG, (MT_USB_DMA_CFG_RX_BULK_EN |
 				       MT_USB_DMA_CFG_TX_BULK_EN) |
 				       FIELD_PREP(MT_USB_DMA_CFG_RX_BULK_AGG_TOUT, 0x20));
-	mt76x0_vendor_reset(dev);
+	mt76u_mcu_fw_reset(&dev->mt76);
 	msleep(5);
 /*
 	mt76x0_rmw(dev, MT_PBF_CFG, 0, (MT_PBF_CFG_TX0Q_EN |
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
index 09e7f9590f01..fdb71b907419 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
@@ -131,12 +131,6 @@ int mt76x0_vendor_request(struct mt76x0_dev *dev, const u8 req,
 	return ret;
 }
 
-void mt76x0_vendor_reset(struct mt76x0_dev *dev)
-{
-	mt76x0_vendor_request(dev, MT_VEND_DEV_MODE, USB_DIR_OUT,
-			      MT_VEND_DEV_MODE_RESET, 0, NULL, 0);
-}

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 03/16] mt76: move mt76x2u_mcu_deinit routine in mt76-usb module
Date: Sat, 25 Aug 2018 12:40:43 +0200
Message-ID: <20180825104056.9130-4-lorenzo.bianconi@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nbd-Vt+b4OUoWG0@public.gmane.org
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Move mt76x2u_mcu_deinit routine in usb_mcu layer in order to
be reused by mt76x0 driver in usb mcu layer unification between
mt76x0 and mt76x2u drivers

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h         | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x2u.h      | 1 -
 drivers/net/wireless/mediatek/mt76/mt76x2u_init.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x2u_mcu.c  | 8 --------
 drivers/net/wireless/mediatek/mt76/usb_mcu.c      | 9 +++++++++
 5 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 5579b90afee9..f84f35c2e37a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -629,5 +629,6 @@ int mt76u_mcu_send_msg(struct mt76_dev *dev, struct sk_buff *skb,
 		       int cmd, bool wait_resp);
 void mt76u_mcu_fw_reset(struct mt76_dev *dev);
 int mt76u_mcu_init_rx(struct mt76_dev *dev);
+void mt76u_mcu_deinit(struct mt76_dev *dev);
 
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2u.h b/drivers/net/wireless/mediatek/mt76/mt76x2u.h
index 008092f0cd8a..a83c17cb6be5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2u.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2u.h
@@ -65,7 +65,6 @@ int mt76x2u_mcu_load_cr(struct mt76x2_dev *dev, u8 type,
 			u8 temp_level, u8 channel);
 int mt76x2u_mcu_init(struct mt76x2_dev *dev);
 int mt76x2u_mcu_fw_init(struct mt76x2_dev *dev);
-void mt76x2u_mcu_deinit(struct mt76x2_dev *dev);
 
 int mt76x2u_alloc_queues(struct mt76x2_dev *dev);
 void mt76x2u_queues_deinit(struct mt76x2_dev *dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2u_init.c b/drivers/net/wireless/mediatek/mt76/mt76x2u_init.c
index 4986f5388222..48b0b941c0fe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2u_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2u_init.c
@@ -312,5 +312,5 @@ void mt76x2u_cleanup(struct mt76x2_dev *dev)
 	mt76x2u_mcu_set_radio_state(dev, false);
 	mt76x2u_stop_hw(dev);
 	mt76u_queues_deinit(&dev->mt76);
-	mt76x2u_mcu_deinit(dev);
+	mt76u_mcu_deinit(&dev->mt76);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2u_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76x2u_mcu.c
index 22c16d638baa..31677e898427 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2u_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2u_mcu.c
@@ -453,11 +453,3 @@ int mt76x2u_mcu_init(struct mt76x2_dev *dev)
 
 	return mt76x2u_mcu_set_radio_state(dev, true);
 }
-
-void mt76x2u_mcu_deinit(struct mt76x2_dev *dev)
-{
-	struct mt76_usb *usb = &dev->mt76.usb;

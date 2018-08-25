From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 14/16] mt76x0: remove unused mt76x0_mcu structure
Date: Sat, 25 Aug 2018 12:40:54 +0200
Message-ID: <20180825104056.9130-15-lorenzo.bianconi@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nbd-Vt+b4OUoWG0@public.gmane.org
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Remove no longer used mt76x0_mcu data structure

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c   |  2 --
 .../net/wireless/mediatek/mt76/mt76x0/mt76x0.h    | 15 ---------------
 2 files changed, 17 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
index 39b2ec0c1ee0..d49557834658 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
@@ -452,8 +452,6 @@ int mt76x0_mcu_init(struct mt76x0_dev *dev)
 {
 	int ret;
 
-	mutex_init(&dev->mcu.mutex);
-
 	ret = mt76x0_load_firmware(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
index 298b7af31911..cdace0565d51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
@@ -49,19 +49,6 @@ struct mt76x0_dma_buf {
 	size_t len;
 };
 
-struct mt76x0_mcu {
-	struct mutex mutex;
-
-	u8 msg_seq;
-
-	struct mt76x0_dma_buf resp;
-
-	struct mt76_reg_pair *reg_pairs;
-	unsigned int reg_pairs_len;
-	u32 reg_base;
-	bool burst_read;
-};
-
 struct mac_stats {
 	u64 rx_stat[6];
 	u64 tx_stat[6];
@@ -160,8 +147,6 @@ struct mt76x0_dev {
 	unsigned long wcid_mask[DIV_ROUND_UP(N_WCIDS, BITS_PER_LONG)];
 	unsigned long vif_mask;
 
-	struct mt76x0_mcu mcu;

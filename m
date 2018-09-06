From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 08/42] mt76: move mt76x2u_tx_status_data in mt76x02-lib module
Date: Thu,  6 Sep 2018 11:18:24 +0200
Message-ID: <1536225538-16454-9-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Move mt76x2u_tx_status_data routine in mt76x02-lib module and rename it
in mt76x02_tx_status_data in order to be reused in mt76x0 driver

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_util.c | 13 +++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76x02_util.h |  1 +
 drivers/net/wireless/mediatek/mt76/mt76x2u.h      |  1 -
 drivers/net/wireless/mediatek/mt76/mt76x2u_core.c | 13 -------------
 drivers/net/wireless/mediatek/mt76/mt76x2u_init.c |  2 +-
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index 6ed558c12786..432c3661312e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -433,4 +433,17 @@ int mt76x02_set_txinfo(struct sk_buff *skb, struct mt76_wcid *wcid, u8 ep)
 }
 EXPORT_SYMBOL_GPL(mt76x02_set_txinfo);
 
+bool mt76x02_tx_status_data(struct mt76_dev *dev, u8 *update)
+{
+	struct mt76x02_tx_status stat;
+
+	if (!mt76x02_mac_load_tx_status(dev, &stat))
+		return false;
+
+	mt76x02_send_tx_status(dev, &stat, update);
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(mt76x02_tx_status_data);
+
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.h b/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
index ad4112cc7800..383031b9b6d8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
@@ -50,4 +50,5 @@ void mt76x02_remove_dma_hdr(struct sk_buff *skb);
 void mt76x02_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue *q,
 			    struct mt76_queue_entry *e, bool flush);
 int mt76x02_set_txinfo(struct sk_buff *skb, struct mt76_wcid *wcid, u8 ep);
+bool mt76x02_tx_status_data(struct mt76_dev *dev, u8 *update);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2u.h b/drivers/net/wireless/mediatek/mt76/mt76x2u.h
index 180779bebaa2..5a11217c03ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2u.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2u.h
@@ -69,7 +69,6 @@ int mt76x2u_mcu_fw_init(struct mt76x2_dev *dev);
 int mt76x2u_alloc_queues(struct mt76x2_dev *dev);
 void mt76x2u_queues_deinit(struct mt76x2_dev *dev);
 void mt76x2u_stop_queues(struct mt76x2_dev *dev);
-bool mt76x2u_tx_status_data(struct mt76_dev *mdev, u8 *update);
 int mt76x2u_tx_prepare_skb(struct mt76_dev *mdev, void *data,
 			   struct sk_buff *skb, struct mt76_queue *q,
 			   struct mt76_wcid *wcid, struct ieee80211_sta *sta,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c b/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c
index 3c8be57002b9..a61ab329f13c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c
@@ -30,19 +30,6 @@ mt76x2u_check_skb_rooms(struct sk_buff *skb)
 	return skb_cow(skb, need_head);
 }
 
-bool mt76x2u_tx_status_data(struct mt76_dev *mdev, u8 *update)
-{
-	struct mt76x2_dev *dev = container_of(mdev, struct mt76x2_dev, mt76);
-	struct mt76x02_tx_status stat;
-
-	if (!mt76x02_mac_load_tx_status(&dev->mt76, &stat))
-		return false;
-
-	mt76x02_send_tx_status(&dev->mt76, &stat, update);
-
-	return true;
-}

From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 02/42] mt76: move mt76x2_tx_complete routine in mt76x02-lib module
Date: Thu,  6 Sep 2018 11:18:18 +0200
Message-ID: <1536225538-16454-3-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Move mt76x2_tx_complete routine in mt76x02-lib module and rename it in
mt76x02_tx_complete in order to be used in mt76x0 driver

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_util.c     | 15 +++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76x02_util.h     |  1 +
 drivers/net/wireless/mediatek/mt76/mt76x2.h           |  1 -
 drivers/net/wireless/mediatek/mt76/mt76x2_mac.c       |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt76x2_tx_common.c | 16 ----------------
 drivers/net/wireless/mediatek/mt76/mt76x2u_core.c     |  2 +-
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index a32ce164fb76..37b70d723fba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -377,4 +377,19 @@ void mt76x02_remove_hdr_pad(struct sk_buff *skb, int len)
 }
 EXPORT_SYMBOL_GPL(mt76x02_remove_hdr_pad);
 
+void mt76x02_tx_complete(struct mt76_dev *dev, struct sk_buff *skb)
+{
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+
+	if (info->flags & IEEE80211_TX_CTL_AMPDU) {
+		ieee80211_free_txskb(dev->hw, skb);
+	} else {
+		ieee80211_tx_info_clear_status(info);
+		info->status.rates[0].idx = -1;
+		info->flags |= IEEE80211_TX_STAT_ACK;
+		ieee80211_tx_status(dev->hw, skb);
+	}
+}
+EXPORT_SYMBOL_GPL(mt76x02_tx_complete);
+
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.h b/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
index 953c4bea4051..19fe42c40bed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
@@ -45,4 +45,5 @@ void mt76x02_sta_rate_tbl_update(struct ieee80211_hw *hw,
 				struct ieee80211_sta *sta);
 int mt76x02_insert_hdr_pad(struct sk_buff *skb);
 void mt76x02_remove_hdr_pad(struct sk_buff *skb, int len);
+void mt76x02_tx_complete(struct mt76_dev *dev, struct sk_buff *skb);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2.h b/drivers/net/wireless/mediatek/mt76/mt76x2.h
index 9f495d4cfb6a..efed3c0a82ce 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2.h
@@ -215,7 +215,6 @@ int mt76x2_tx_queue_mcu(struct mt76x2_dev *dev, enum mt76_txq_id qid,
 			struct sk_buff *skb, int cmd, int seq);
 void mt76x2_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	       struct sk_buff *skb);
-void mt76x2_tx_complete(struct mt76_dev *dev, struct sk_buff *skb);
 int mt76x2_tx_prepare_skb(struct mt76_dev *mdev, void *txwi,
 			  struct sk_buff *skb, struct mt76_queue *q,
 			  struct mt76_wcid *wcid, struct ieee80211_sta *sta,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2_mac.c b/drivers/net/wireless/mediatek/mt76/mt76x2_mac.c
index db0cb4a2500b..241ede98e6d3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2_mac.c
@@ -19,6 +19,7 @@
 #include "mt76x2_mcu.h"
 #include "mt76x2_eeprom.h"
 #include "mt76x2_trace.h"
+#include "mt76x02_util.h"
 
 void mt76x2_mac_set_bssid(struct mt76x2_dev *dev, u8 idx, const u8 *addr)
 {
@@ -73,7 +74,7 @@ mt76x2_mac_queue_txdone(struct mt76x2_dev *dev, struct sk_buff *skb,
 	txi->wcid = txwi->wcid;
 	txi->pktid = txwi->pktid;
 	trace_mac_txdone_add(dev, txwi->wcid, txwi->pktid);
-	mt76x2_tx_complete(&dev->mt76, skb);
+	mt76x02_tx_complete(&dev->mt76, skb);
 }
 
 void mt76x2_mac_process_tx_status_fifo(struct mt76x2_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2_tx_common.c b/drivers/net/wireless/mediatek/mt76/mt76x2_tx_common.c
index 663229dc269d..c3c06e036832 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2_tx_common.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2_tx_common.c
@@ -116,19 +116,3 @@ void mt76x2_tx_set_txpwr_auto(struct mt76x2_dev *dev, s8 txpwr)
 		       MT_PROT_AUTO_TX_CFG_AUTO_PADJ, txpwr_adj);
 }
 EXPORT_SYMBOL_GPL(mt76x2_tx_set_txpwr_auto);
-
-void mt76x2_tx_complete(struct mt76_dev *dev, struct sk_buff *skb)
-{
-	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
-
-	if (info->flags & IEEE80211_TX_CTL_AMPDU) {
-		ieee80211_free_txskb(dev->hw, skb);
-	} else {
-		ieee80211_tx_info_clear_status(info);
-		info->status.rates[0].idx = -1;
-		info->flags |= IEEE80211_TX_STAT_ACK;
-		ieee80211_tx_status(dev->hw, skb);
-	}
-}
-EXPORT_SYMBOL_GPL(mt76x2_tx_complete);

From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 21/42] mt76x0: remove unused mt76x0_tx_status routine
Date: Thu,  6 Sep 2018 11:18:37 +0200
Message-ID: <1536225538-16454-22-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Remove no longer used mt76x0_tx_status routine since
mt76x0 driver uses mt76-usb utility routines to report tx-feedbacks

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h |  1 -
 drivers/net/wireless/mediatek/mt76/mt76x0/tx.c     | 15 ---------------
 2 files changed, 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
index 6ba5e9ba2c7f..24712ac924ef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
@@ -185,7 +185,6 @@ void mt76x0_mac_set_ampdu_factor(struct mt76x0_dev *dev);
 /* TX */
 void mt76x0_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 		struct sk_buff *skb);
-void mt76x0_tx_status(struct mt76x0_dev *dev, struct sk_buff *skb);
 
 void mt76x0_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 			 struct sk_buff *skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c b/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
index de12c769b353..b59b16d374e1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
@@ -16,21 +16,6 @@
 #include "trace.h"
 #include "../mt76x02_util.h"
 
-void mt76x0_tx_status(struct mt76x0_dev *dev, struct sk_buff *skb)
-{
-	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
-
-	mt76x02_remove_dma_hdr(skb);
-
-	ieee80211_tx_info_clear_status(info);
-	info->status.rates[0].idx = -1;
-	info->flags |= IEEE80211_TX_STAT_ACK;
-
-	spin_lock(&dev->mac_lock);
-	ieee80211_tx_status(dev->mt76.hw, skb);
-	spin_unlock(&dev->mac_lock);
-}

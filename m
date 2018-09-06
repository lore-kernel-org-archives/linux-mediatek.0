From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 07/42] mt76x0: introduce mt76x0_tx_prepare_skb routine
Date: Thu,  6 Sep 2018 11:18:23 +0200
Message-ID: <1536225538-16454-8-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Add mt76x0_tx_prepare_skb routine as tx txwi handler.
mt76x0_tx_prepare_skb will be used by mt76-usb layer

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h |  5 ++++-
 drivers/net/wireless/mediatek/mt76/mt76x0/tx.c     | 15 +++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
index 8510f120a121..8b0bef9a15e4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
@@ -250,5 +250,8 @@ void mt76x0_dma_cleanup(struct mt76x0_dev *dev);
 
 int mt76x0_dma_enqueue_tx(struct mt76x0_dev *dev, struct sk_buff *skb,
 			   struct mt76_wcid *wcid, int hw_q);
-
+int mt76x0_tx_prepare_skb(struct mt76_dev *mdev, void *data,
+			  struct sk_buff *skb, struct mt76_queue *q,
+			  struct mt76_wcid *wcid, struct ieee80211_sta *sta,
+			  u32 *tx_info);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c b/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
index de2643d54a1e..d6dbd9b8d68b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
@@ -116,6 +116,21 @@ void mt76x0_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	trace_mt76x0_tx(&dev->mt76, skb, msta, txwi);
 }
 
+int mt76x0_tx_prepare_skb(struct mt76_dev *mdev, void *data,
+			  struct sk_buff *skb, struct mt76_queue *q,
+			  struct mt76_wcid *wcid, struct ieee80211_sta *sta,
+			  u32 *tx_info)
+{
+	struct mt76x0_dev *dev = container_of(mdev, struct mt76x0_dev, mt76);
+	int len = skb->len, *hwq_ptr = (int *)data;
+	struct mt76x02_txwi *txwi;
+
+	mt76x02_insert_hdr_pad(skb);
+	txwi = mt76x0_push_txwi(dev, skb, sta, wcid, len);
+
+	return mt76x02_set_txinfo(skb, wcid, q2ep(*hwq_ptr));
+}
+
 void mt76x0_tx_stat(struct work_struct *work)
 {
 	struct mt76x0_dev *dev = container_of(work, struct mt76x0_dev,
-- 
2.7.5

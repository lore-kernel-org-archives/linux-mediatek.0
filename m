From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 14/42] mt76x0: add mt76x0_queue_rx_skb routine
Date: Thu,  6 Sep 2018 11:18:30 +0200
Message-ID: <1536225538-16454-15-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Introduce mt76x0_queue_rx_skb routine as mt76x0 driver
frame rx handler. mt76x0_queue_rx_skb will be run by mt76-usb layer
rx datapath

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h |  3 +++
 drivers/net/wireless/mediatek/mt76/mt76x0/tx.c     | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
index 8b0bef9a15e4..8a01efb8d499 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
@@ -245,6 +245,9 @@ void mt76x0_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 void mt76x0_tx_status(struct mt76x0_dev *dev, struct sk_buff *skb);
 void mt76x0_tx_stat(struct work_struct *work);
 
+void mt76x0_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
+			 struct sk_buff *skb);
+
 int mt76x0_dma_init(struct mt76x0_dev *dev);
 void mt76x0_dma_cleanup(struct mt76x0_dev *dev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c b/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
index d6dbd9b8d68b..7de739b7c46c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
@@ -131,6 +131,21 @@ int mt76x0_tx_prepare_skb(struct mt76_dev *mdev, void *data,
 	return mt76x02_set_txinfo(skb, wcid, q2ep(*hwq_ptr));
 }
 
+void mt76x0_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
+			 struct sk_buff *skb)
+{
+	struct mt76x0_dev *dev = container_of(mdev, struct mt76x0_dev, mt76);
+	void *rxwi = skb->data;
+
+	skb_pull(skb, sizeof(struct mt76x02_rxwi));
+	if (!mt76x0_mac_process_rx(dev, skb, rxwi)) {
+		dev_kfree_skb(skb);
+		return;
+	}
+
+	mt76_rx(&dev->mt76, q, skb);
+}
+
 void mt76x0_tx_stat(struct work_struct *work)
 {
 	struct mt76x0_dev *dev = container_of(work, struct mt76x0_dev,
-- 
2.7.5

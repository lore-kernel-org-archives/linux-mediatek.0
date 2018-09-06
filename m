From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 06/42] mt76: move mt76x2u_set_txinfo in mt76x02-lib module
Date: Thu,  6 Sep 2018 11:18:22 +0200
Message-ID: <1536225538-16454-7-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Move mt76x2u_set_txinfo routine in mt76x02-lib module and rename it in
mt76x02_set_txinfo in order to be reused in mt76x0 driver

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_util.c | 21 ++++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76x02_util.h |  1 +
 drivers/net/wireless/mediatek/mt76/mt76x2u_core.c | 24 +----------------------
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index e4cf4e934153..6ed558c12786 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -412,4 +412,25 @@ void mt76x02_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue *q,
 }
 EXPORT_SYMBOL_GPL(mt76x02_tx_complete_skb);
 
+int mt76x02_set_txinfo(struct sk_buff *skb, struct mt76_wcid *wcid, u8 ep)
+{
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	enum mt76_qsel qsel;
+	u32 flags;
+
+	if ((info->flags & IEEE80211_TX_CTL_RATE_CTRL_PROBE) ||
+	    ep == MT_EP_OUT_HCCA)
+		qsel = MT_QSEL_MGMT;
+	else
+		qsel = MT_QSEL_EDCA;
+
+	flags = FIELD_PREP(MT_TXD_INFO_QSEL, qsel) |
+		MT_TXD_INFO_80211;
+	if (!wcid || wcid->hw_key_idx == 0xff || wcid->sw_iv)
+		flags |= MT_TXD_INFO_WIV;
+
+	return mt76u_skb_dma_info(skb, WLAN_PORT, flags);
+}
+EXPORT_SYMBOL_GPL(mt76x02_set_txinfo);
+
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.h b/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
index a7c20e6fb4ab..ad4112cc7800 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
@@ -49,4 +49,5 @@ void mt76x02_tx_complete(struct mt76_dev *dev, struct sk_buff *skb);
 void mt76x02_remove_dma_hdr(struct sk_buff *skb);
 void mt76x02_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue *q,
 			    struct mt76_queue_entry *e, bool flush);
+int mt76x02_set_txinfo(struct sk_buff *skb, struct mt76_wcid *wcid, u8 ep);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c b/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c
index 7ba5e5c71dc3..3c8be57002b9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c
@@ -30,28 +30,6 @@ mt76x2u_check_skb_rooms(struct sk_buff *skb)
 	return skb_cow(skb, need_head);
 }
 
-static int
-mt76x2u_set_txinfo(struct sk_buff *skb,
-		   struct mt76_wcid *wcid, u8 ep)
-{
-	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
-	enum mt76x2_qsel qsel;
-	u32 flags;
-
-	if ((info->flags & IEEE80211_TX_CTL_RATE_CTRL_PROBE) ||
-	    ep == MT_EP_OUT_HCCA)
-		qsel = MT_QSEL_MGMT;
-	else
-		qsel = MT_QSEL_EDCA;
-
-	flags = FIELD_PREP(MT_TXD_INFO_QSEL, qsel) |
-		MT_TXD_INFO_80211;
-	if (!wcid || wcid->hw_key_idx == 0xff || wcid->sw_iv)
-		flags |= MT_TXD_INFO_WIV;
-
-	return mt76u_skb_dma_info(skb, WLAN_PORT, flags);
-}

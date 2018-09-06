From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 04/42] mt76: move mt76x2u_tx_complete_skb in mt76x02-lib moudule
Date: Thu,  6 Sep 2018 11:18:20 +0200
Message-ID: <1536225538-16454-5-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Move mt76x2u_tx_complete_skb routine in mt76x02-lib module
and rename it in mt76x02_tx_complete_skb in order to be reused
in mt76x0 driver

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_util.c | 8 ++++++++
 drivers/net/wireless/mediatek/mt76/mt76x02_util.h | 2 ++
 drivers/net/wireless/mediatek/mt76/mt76x2u.h      | 2 --
 drivers/net/wireless/mediatek/mt76/mt76x2u_core.c | 8 --------
 drivers/net/wireless/mediatek/mt76/mt76x2u_init.c | 3 ++-
 5 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index a8ad3088ad8b..e4cf4e934153 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -404,4 +404,12 @@ void mt76x02_tx_complete(struct mt76_dev *dev, struct sk_buff *skb)
 }
 EXPORT_SYMBOL_GPL(mt76x02_tx_complete);
 
+void mt76x02_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue *q,
+			    struct mt76_queue_entry *e, bool flush)
+{
+	mt76x02_remove_dma_hdr(e->skb);
+	mt76x02_tx_complete(mdev, e->skb);
+}
+EXPORT_SYMBOL_GPL(mt76x02_tx_complete_skb);
+
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.h b/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
index 6b6e963454c8..a7c20e6fb4ab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
@@ -47,4 +47,6 @@ int mt76x02_insert_hdr_pad(struct sk_buff *skb);
 void mt76x02_remove_hdr_pad(struct sk_buff *skb, int len);
 void mt76x02_tx_complete(struct mt76_dev *dev, struct sk_buff *skb);
 void mt76x02_remove_dma_hdr(struct sk_buff *skb);
+void mt76x02_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue *q,
+			    struct mt76_queue_entry *e, bool flush);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2u.h b/drivers/net/wireless/mediatek/mt76/mt76x2u.h
index a83c17cb6be5..6946123820e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2u.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2u.h
@@ -74,8 +74,6 @@ int mt76x2u_tx_prepare_skb(struct mt76_dev *mdev, void *data,
 			   struct sk_buff *skb, struct mt76_queue *q,
 			   struct mt76_wcid *wcid, struct ieee80211_sta *sta,
 			   u32 *tx_info);
-void mt76x2u_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue *q,
-			     struct mt76_queue_entry *e, bool flush);
 int mt76x2u_skb_dma_info(struct sk_buff *skb, enum dma_msg_port port,
 			 u32 flags);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c b/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c
index 01dcc5382798..7ba5e5c71dc3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c
@@ -86,11 +86,3 @@ int mt76x2u_tx_prepare_skb(struct mt76_dev *mdev, void *data,
 
 	return mt76x2u_set_txinfo(skb, wcid, q2ep(*hwq_ptr));
 }
-
-void mt76x2u_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue *q,
-			     struct mt76_queue_entry *e, bool flush)
-{
-	mt76x02_remove_dma_hdr(e->skb);
-	mt76x02_tx_complete(mdev, e->skb);
-}

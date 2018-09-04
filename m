From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 11/22] mt76x0: remove vif_mask
Date: Tue,  4 Sep 2018 16:41:04 +0200
Message-ID: <1536072075-6990-12-git-send-email-sgruszka@redhat.com>
References: <1536072075-6990-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536072075-6990-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Make remove_interface more similar to mt76x2.

Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/main.c   | 11 +----------
 drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h |  2 --
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/main.c b/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
index f87103aea868..a818a47f8e4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
@@ -56,14 +56,7 @@ static int mt76x0_add_interface(struct ieee80211_hw *hw,
 				 struct ieee80211_vif *vif)
 {
 	struct mt76x0_dev *dev = hw->priv;
-	unsigned int idx;
-
-	idx = ffs(~dev->vif_mask);
-	if (!idx || idx > 8)
-		return -ENOSPC;
-
-	idx--;
-	dev->vif_mask |= BIT(idx);
+	unsigned int idx = 0;
 
 	mt76x02_vif_init(&dev->mt76, vif, idx);
 	return 0;
@@ -73,9 +66,7 @@ static void mt76x0_remove_interface(struct ieee80211_hw *hw,
 				     struct ieee80211_vif *vif)
 {
 	struct mt76x0_dev *dev = hw->priv;
-	struct mt76x02_vif *mvif = (struct mt76x02_vif *) vif->drv_priv;
 
-	dev->vif_mask &= ~BIT(mvif->idx);
 	mt76_txq_remove(&dev->mt76, vif->txq);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
index e65e6c09877c..c3669735965b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
@@ -134,8 +134,6 @@ struct mt76x0_dev {
 	u8 in_ep[__MT_EP_IN_MAX];
 	u16 in_max_packet;
 
-	unsigned long vif_mask;

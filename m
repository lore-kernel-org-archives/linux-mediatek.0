From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 20/22] mt76x0: reserve enough space in mac80211
Date: Tue,  4 Sep 2018 16:41:13 +0200
Message-ID: <1536072075-6990-21-git-send-email-sgruszka@redhat.com>
References: <1536072075-6990-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536072075-6990-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Allocate skg with enough headroom by mac80211 , this eliminate need
to add extra skb headroom by the mt76x0 driver.

Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/init.c |  1 +
 drivers/net/wireless/mediatek/mt76/mt76x0/tx.c   | 17 +----------------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/init.c b/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
index 84fc306d2cbf..45c9f1f7a89a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
@@ -685,6 +685,7 @@ int mt76x0_register_device(struct mt76x0_dev *dev)
 	hw->max_rates = 1;
 	hw->max_report_rates = 7;
 	hw->max_rate_tries = 1;
+	hw->extra_tx_headroom = sizeof(struct mt76x02_txwi) + 4 + 2;
 
 	hw->sta_data_size = sizeof(struct mt76x02_sta);
 	hw->vif_data_size = sizeof(struct mt76x02_vif);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c b/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
index fa902ac227ec..35db38523e3b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
@@ -55,18 +55,6 @@ void mt76x0_tx_status(struct mt76x0_dev *dev, struct sk_buff *skb)
 	spin_unlock(&dev->mac_lock);
 }
 
-static int mt76x0_skb_rooms(struct mt76x0_dev *dev, struct sk_buff *skb)
-{
-	int hdr_len = ieee80211_get_hdrlen_from_skb(skb);
-	u32 need_head;
-
-	need_head = sizeof(struct mt76x02_txwi) + 4;
-	if (hdr_len % 4)
-		need_head += 2;
-
-	return skb_cow(skb, need_head);
-}

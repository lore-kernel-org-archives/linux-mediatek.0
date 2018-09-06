From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 10/42] mt76x0: use mt76_alloc_device for device allocation
Date: Thu,  6 Sep 2018 11:18:26 +0200
Message-ID: <1536225538-16454-11-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Use mt76_alloc_device utility routine for mt76x0_dev/mt76_dev
allocation

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/init.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/init.c b/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
index 23b47c49bc17..ddbb52b4e5ac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
@@ -490,24 +490,22 @@ struct mt76x0_dev *mt76x0_alloc_device(struct device *pdev)
 		.tx_status_data = mt76x02_tx_status_data,
 		.rx_skb = mt76x0_queue_rx_skb,
 	};
-	struct ieee80211_hw *hw;
 	struct mt76x0_dev *dev;
+	struct mt76_dev *mdev;
 
-	hw = ieee80211_alloc_hw(sizeof(*dev), &mt76x0_ops);
-	if (!hw)
+	mdev = mt76_alloc_device(sizeof(*dev), &mt76x0_ops);
+	if (!mdev)
 		return NULL;
 
-	dev = hw->priv;
-	dev->mt76.dev = pdev;
-	dev->mt76.hw = hw;
-	dev->mt76.drv = &drv_ops;
+	mdev->dev = pdev;
+	mdev->drv = &drv_ops;
+
+	dev = container_of(mdev, struct mt76x0_dev, mt76);
 	mutex_init(&dev->usb_ctrl_mtx);
 	mutex_init(&dev->reg_atomic_mutex);
 	mutex_init(&dev->hw_atomic_mutex);
-	mutex_init(&dev->mt76.mutex);
 	spin_lock_init(&dev->tx_lock);
 	spin_lock_init(&dev->rx_lock);
-	spin_lock_init(&dev->mt76.lock);
 	spin_lock_init(&dev->mac_lock);
 	spin_lock_init(&dev->con_mon_lock);
 	atomic_set(&dev->avg_ampdu_len, 1);
@@ -515,7 +513,7 @@ struct mt76x0_dev *mt76x0_alloc_device(struct device *pdev)
 
 	dev->stat_wq = alloc_workqueue("mt76x0", WQ_UNBOUND, 0);
 	if (!dev->stat_wq) {
-		ieee80211_free_hw(hw);
+		ieee80211_free_hw(mdev->hw);
 		return NULL;
 	}
 
-- 
2.7.5

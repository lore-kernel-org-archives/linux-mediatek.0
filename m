From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 22/42] mt76x0: remove unused endpoint definitions
Date: Thu,  6 Sep 2018 11:18:38 +0200
Message-ID: <1536225538-16454-23-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

remove unused usb endpoint definitions since mt76x0
uses mt76-usb ones. Moreover remove unused usb_ctrl mutex

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/init.c   | 1 -
 drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/init.c b/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
index a7d6e747f221..75597b5a2427 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
@@ -502,7 +502,6 @@ struct mt76x0_dev *mt76x0_alloc_device(struct device *pdev)
 	mdev->drv = &drv_ops;
 
 	dev = container_of(mdev, struct mt76x0_dev, mt76);
-	mutex_init(&dev->usb_ctrl_mtx);
 	mutex_init(&dev->reg_atomic_mutex);
 	mutex_init(&dev->hw_atomic_mutex);
 	spin_lock_init(&dev->mac_lock);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
index 24712ac924ef..0bcf54c0a06f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
@@ -79,14 +79,8 @@ enum mt_bw {
 struct mt76x0_dev {
 	struct mt76_dev mt76; /* must be first */
 
-	struct mutex usb_ctrl_mtx;
 	u8 data[32];
 
-	u8 out_ep[__MT_EP_OUT_MAX];
-	u16 out_max_packet;
-	u8 in_ep[__MT_EP_IN_MAX];
-	u16 in_max_packet;

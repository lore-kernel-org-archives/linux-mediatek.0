From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 11/16] mt76x0: use mt76_wcid_free in mt76x0
Date: Wed, 29 Aug 2018 13:16:42 +0200
Message-ID: <1535541407-27149-12-git-send-email-sgruszka@redhat.com>
References: <1535541407-27149-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1535541407-27149-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Use helper from util instead of custom code.

Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/main.c b/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
index a5bdd324f6ec..66e8389d489f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
@@ -197,7 +197,7 @@ mt76x0_sta_remove(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mutex_lock(&dev->mt76.mutex);
 	rcu_assign_pointer(dev->wcid[idx], NULL);
 	mt76x02_mac_wcid_set_drop(&dev->mt76, idx, true);
-	dev->wcid_mask[idx / BITS_PER_LONG] &= ~BIT(idx % BITS_PER_LONG);
+	mt76_wcid_free(dev->wcid_mask, idx);
 	mt76x02_mac_wcid_setup(&dev->mt76, idx, 0, NULL);
 	mt76x0_mac_set_ampdu_factor(dev);
 	mutex_unlock(&dev->mt76.mutex);
-- 
2.7.5

From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 05/17] mt76: fix mt76xx-lib module license
Date: Fri, 24 Aug 2018 13:15:09 +0200
Message-ID: <1535109321-17126-6-git-send-email-sgruszka@redhat.com>
References: <1535109321-17126-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1535109321-17126-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Add module license.

Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76xx_util.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76xx_util.c b/drivers/net/wireless/mediatek/mt76/mt76xx_util.c
index 3b0f9006eaa2..82a647d8398b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76xx_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76xx_util.c
@@ -51,3 +51,5 @@ void mt76xx_configure_filter(struct ieee80211_hw *hw,
 	mutex_unlock(&dev->mutex);
 }
 EXPORT_SYMBOL_GPL(mt76xx_configure_filter);
+
+MODULE_LICENSE("Dual BSD/GPL");
-- 
1.9.3

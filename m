From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 07/17] mt76: add helpers for register access with mt76_dev struct
Date: Mon, 27 Aug 2018 16:56:21 +0200
Message-ID: <1535381791-14908-8-git-send-email-sgruszka@redhat.com>
References: <1535381791-14908-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1535381791-14908-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Add helpers for register access from common code.

Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 79017dbd364d..10959c4669bd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -404,6 +404,11 @@ struct mt76_rx_status {
 	s8 chain_signal[IEEE80211_MAX_CHAINS];
 };
 
+#define __mt76_rr(dev, ...)	(dev)->bus->rr((dev), __VA_ARGS__)
+#define __mt76_wr(dev, ...)	(dev)->bus->wr((dev), __VA_ARGS__)
+#define __mt76_rmw(dev, ...)	(dev)->bus->rmw((dev), __VA_ARGS__)
+#define __mt76_wr_copy(dev, ...)	(dev)->bus->copy((dev), __VA_ARGS__)
+
 #define mt76_rr(dev, ...)	(dev)->mt76.bus->rr(&((dev)->mt76), __VA_ARGS__)
 #define mt76_wr(dev, ...)	(dev)->mt76.bus->wr(&((dev)->mt76), __VA_ARGS__)
 #define mt76_rmw(dev, ...)	(dev)->mt76.bus->rmw(&((dev)->mt76), __VA_ARGS__)
-- 
2.7.5

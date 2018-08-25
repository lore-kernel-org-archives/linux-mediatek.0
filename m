From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 08/16] mt76x0: remove mt76x0_mcu_msg_alloc routine
Date: Sat, 25 Aug 2018 12:40:48 +0200
Message-ID: <20180825104056.9130-9-lorenzo.bianconi@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nbd-Vt+b4OUoWG0@public.gmane.org
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Remove mt76x0_mcu_msg_alloc duplicated routine and use mt76u_mcu_msg_alloc
utility function for usb mcu message allocation

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 .../net/wireless/mediatek/mt76/mt76x0/mcu.c   | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
index cf3acee12dc3..8a258fa33c2a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
@@ -59,21 +59,6 @@ static inline void trace_mt76x0_mcu_msg_send_cs(struct mt76_dev *dev,
 	trace_mt76x0_mcu_msg_send(dev, skb, csum, need_resp);
 }
 
-static struct sk_buff *
-mt76x0_mcu_msg_alloc(struct mt76x0_dev *dev, const void *data, int len)
-{
-	struct sk_buff *skb;
-
-	WARN_ON(len % 4); /* if length is not divisible by 4 we need to pad */
-
-	skb = alloc_skb(len + MT_DMA_HDR_LEN + 4, GFP_KERNEL);
-	if (skb) {
-		skb_reserve(skb, MT_DMA_HDR_LEN);
-		memcpy(skb_put(skb, len), data, len);
-	}
-	return skb;
-}

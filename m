From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH] mt76: use skb_pad() instead of __skb_pad()
Date: Tue, 25 Sep 2018 21:52:51 +0200
Message-ID: <20180925195251.10568-1-hauke@hauke-m.de>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

mt76 uses __skb_pad() with free_on_error set to true, this is the same
as calling skb_pad().
This patch does not change any functionality, but it makes it easier to
backport this driver in backports, because skb_pad() is also available
in older kernel versions.

Fixes: b40b15e1521f ("mt76: add usb support to mt76 layer")
Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 7780b07543bb..e03de13f5afe 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -535,7 +535,7 @@ int mt76u_skb_dma_info(struct sk_buff *skb, int port, u32 flags)
 	}
 
 	if (unlikely(pad)) {
-		if (__skb_pad(last, pad, true))
+		if (skb_pad(last, pad))
 			return -ENOMEM;
 		__skb_put(last, pad);
 	}
-- 
2.11.0

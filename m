From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] mt76: usb: remove WARN_ON in mt76u_get_rx_entry_len
Date: Tue, 18 Sep 2018 14:12:05 +0200
Message-ID: <c9d8d73f3353c2ad953d8a298c52a32922ed2bcc.1537272524.git.lorenzo.bianconi@redhat.com>
References: <cover.1537272524.git.lorenzo.bianconi@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1537272524.git.lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nbd-Vt+b4OUoWG0@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Remove not useful WARN_ON macros in mt76u_get_rx_entry_len routine
since corrupted frames should just be silently discarded

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 7780b07543bb..81f036b3df86 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -326,9 +326,9 @@ static int mt76u_get_rx_entry_len(u8 *data, u32 data_len)
 	min_len = MT_DMA_HDR_LEN + MT_RX_RXWI_LEN +
 		  MT_FCE_INFO_LEN;
 
-	if (data_len < min_len || WARN_ON(!dma_len) ||
-	    WARN_ON(dma_len + MT_DMA_HDR_LEN > data_len) ||
-	    WARN_ON(dma_len & 0x3))
+	if (data_len < min_len || !dma_len ||
+	    dma_len + MT_DMA_HDR_LEN > data_len ||
+	    (dma_len & 0x3))
 		return -EINVAL;
 	return dma_len;
 }
-- 
2.17.1

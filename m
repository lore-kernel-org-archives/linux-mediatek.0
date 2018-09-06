From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 11/42] mt76x0: disable usb rx bulk aggregation
Date: Thu,  6 Sep 2018 11:18:27 +0200
Message-ID: <1536225538-16454-12-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

In order to use zero-copying, disable usb rx bulk aggregation

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/init.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/init.c b/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
index ddbb52b4e5ac..b28ea45a7282 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
@@ -110,17 +110,17 @@ static void mt76x0_reset_csr_bbp(struct mt76x0_dev *dev)
 
 static void mt76x0_init_usb_dma(struct mt76x0_dev *dev)
 {
-	struct mt76_usb *usb = &dev->mt76.usb;
 	u32 val;
 
 	val = mt76_rr(dev, MT_USB_DMA_CFG);
 
-	val |= FIELD_PREP(MT_USB_DMA_CFG_RX_BULK_AGG_TOUT, MT_USB_AGGR_TIMEOUT) |
-	       FIELD_PREP(MT_USB_DMA_CFG_RX_BULK_AGG_LMT, MT_USB_AGGR_SIZE_LIMIT) |
-	       MT_USB_DMA_CFG_RX_BULK_EN |
+	val |= MT_USB_DMA_CFG_RX_BULK_EN |
 	       MT_USB_DMA_CFG_TX_BULK_EN;
-	if (usb->in_max_packet == 512)
-		val |= MT_USB_DMA_CFG_RX_BULK_AGG_EN;
+
+	/* disable AGGR_BULK_RX in order to receive one
+	 * frame in each rx urb and avoid copies
+	 */
+	val &= ~MT_USB_DMA_CFG_RX_BULK_AGG_EN;
 	mt76_wr(dev, MT_USB_DMA_CFG, val);
 
 	val = mt76_rr(dev, MT_COM_REG0);
-- 
2.7.5

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 07/16] mt76x0: remove mt76x0_vendor_single_wr routine
Date: Sat, 25 Aug 2018 12:40:47 +0200
Message-ID: <20180825104056.9130-8-lorenzo.bianconi@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nbd-Vt+b4OUoWG0@public.gmane.org
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Remove mt76x0_vendor_single_wr routine and use mt76u_single_wr
utility function for mcu firmware loading

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 .../net/wireless/mediatek/mt76/mt76x0/mcu.c   | 13 +++++--------
 .../net/wireless/mediatek/mt76/mt76x0/usb.c   | 19 -------------------
 .../net/wireless/mediatek/mt76/mt76x0/usb.h   |  2 --
 3 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
index c8ea3126e7dc..cf3acee12dc3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
@@ -416,15 +416,12 @@ static int __mt76x0_dma_fw(struct mt76x0_dev *dev,
 	memcpy(buf.buf + sizeof(reg), data, len);
 	memset(buf.buf + sizeof(reg) + len, 0, 8);
 
-	ret = mt76x0_vendor_single_wr(dev, MT_VEND_WRITE_FCE,
-				       MT_FCE_DMA_ADDR, dst_addr);
-	if (ret)
-		return ret;
+	mt76u_single_wr(&dev->mt76, MT_VEND_WRITE_FCE, MT_FCE_DMA_ADDR,
+			dst_addr);
+
 	len = roundup(len, 4);
-	ret = mt76x0_vendor_single_wr(dev, MT_VEND_WRITE_FCE,
-				       MT_FCE_DMA_LEN, len << 16);
-	if (ret)
-		return ret;
+	mt76u_single_wr(&dev->mt76, MT_VEND_WRITE_FCE, MT_FCE_DMA_LEN,
+			len << 16);
 
 	buf.len = MT_DMA_HDR_LEN + len + 4;
 	ret = mt76x0_usb_submit_buf(dev, USB_DIR_OUT, MT_EP_OUT_INBAND_CMD,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
index fdb71b907419..a9835bb7b921 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
@@ -131,25 +131,6 @@ int mt76x0_vendor_request(struct mt76x0_dev *dev, const u8 req,
 	return ret;
 }
 
-int mt76x0_vendor_single_wr(struct mt76x0_dev *dev, const u8 req,
-			     const u16 offset, const u32 val)
-{
-	struct mt76x0_dev *mdev = dev;
-	int ret;
-
-	mutex_lock(&mdev->usb_ctrl_mtx);
-
-	ret = mt76x0_vendor_request(dev, req, USB_DIR_OUT,
-				    val & 0xffff, offset, NULL, 0);
-	if (!ret)
-		ret = mt76x0_vendor_request(dev, req, USB_DIR_OUT,
-					    val >> 16, offset + 2, NULL, 0);
-
-	mutex_unlock(&mdev->usb_ctrl_mtx);
-
-	return ret;
-}

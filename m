From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 02/16] mt76: split __mt76u_mcu_send_msg and mt76u_mcu_send_msg routines
Date: Sat, 25 Aug 2018 12:40:42 +0200
Message-ID: <20180825104056.9130-3-lorenzo.bianconi@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nbd-Vt+b4OUoWG0@public.gmane.org
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Split __mt76u_mcu_send_msg and mt76u_mcu_send_msg in order to be reused
by mt76x0 driver in usb mcu layer unification between mt76x0 and
mt76x2u drivers

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h    |  2 ++
 drivers/net/wireless/mediatek/mt76/usb_mcu.c | 27 +++++++++++++-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index fc27260080af..5579b90afee9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -623,6 +623,8 @@ int mt76u_mcu_fw_send_data(struct mt76_dev *dev, const void *data,
 			   int data_len, u32 max_payload, u32 offset);
 void mt76u_mcu_complete_urb(struct urb *urb);
 struct sk_buff *mt76u_mcu_msg_alloc(const void *data, int len);
+int __mt76u_mcu_send_msg(struct mt76_dev *dev, struct sk_buff *skb,
+			 int cmd, bool wait_resp);
 int mt76u_mcu_send_msg(struct mt76_dev *dev, struct sk_buff *skb,
 		       int cmd, bool wait_resp);
 void mt76u_mcu_fw_reset(struct mt76_dev *dev);
diff --git a/drivers/net/wireless/mediatek/mt76/usb_mcu.c b/drivers/net/wireless/mediatek/mt76/usb_mcu.c
index ebf3e7ffb26b..4039b0b709a0 100644
--- a/drivers/net/wireless/mediatek/mt76/usb_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/usb_mcu.c
@@ -86,8 +86,8 @@ static int mt76u_mcu_wait_resp(struct mt76_dev *dev, u8 seq)
 	return -ETIMEDOUT;
 }
 
-int mt76u_mcu_send_msg(struct mt76_dev *dev, struct sk_buff *skb,
-		       int cmd, bool wait_resp)
+int __mt76u_mcu_send_msg(struct mt76_dev *dev, struct sk_buff *skb,
+			 int cmd, bool wait_resp)
 {
 	struct usb_interface *intf = to_usb_interface(dev->dev);
 	struct usb_device *udev = interface_to_usbdev(intf);
@@ -100,8 +100,6 @@ int mt76u_mcu_send_msg(struct mt76_dev *dev, struct sk_buff *skb,
 	if (test_bit(MT76_REMOVED, &dev->state))
 		return 0;
 
-	mutex_lock(&usb->mcu.mutex);
-
 	pipe = usb_sndbulkpipe(udev, usb->out_ep[MT_EP_OUT_INBAND_CMD]);
 	if (wait_resp) {
 		seq = ++usb->mcu.msg_seq & 0xf;
@@ -114,22 +112,33 @@ int mt76u_mcu_send_msg(struct mt76_dev *dev, struct sk_buff *skb,
 	       MT_MCU_MSG_TYPE_CMD;
 	ret = mt76u_skb_dma_info(skb, CPU_TX_PORT, info);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = usb_bulk_msg(udev, pipe, skb->data, skb->len, &sent, 500);
 	if (ret)
-		goto out;
+		return ret;
 
 	if (wait_resp)
 		ret = mt76u_mcu_wait_resp(dev, seq);
 
-out:
-	mutex_unlock(&usb->mcu.mutex);

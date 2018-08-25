From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 09/16] mt76x0: use shared mt76 usb mcu completion
Date: Sat, 25 Aug 2018 12:40:49 +0200
Message-ID: <20180825104056.9130-10-lorenzo.bianconi@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nbd-Vt+b4OUoWG0@public.gmane.org
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Use mt76 usb shared completion data structure in
mt76x0_mcu_wait_resp routine and remove mt76x0
private one

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c    | 11 ++++++-----
 drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h |  1 -
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
index 8a258fa33c2a..bfaabe018216 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
@@ -93,11 +93,12 @@ static void mt76x0_read_resp_regs(struct mt76x0_dev *dev, int len)
 static int mt76x0_mcu_wait_resp(struct mt76x0_dev *dev, u8 seq)
 {
 	struct urb *urb = dev->mcu.resp.urb;
+	struct mt76_usb *usb = &dev->mt76.usb;
 	u32 rxfce;
 	int urb_status, ret, try = 5;
 
 	while (try--) {
-		if (!wait_for_completion_timeout(&dev->mcu.resp_cmpl,
+		if (!wait_for_completion_timeout(&usb->mcu.cmpl,
 						 msecs_to_jiffies(300))) {
 			dev_warn(dev->mt76.dev, "Warning: %s retrying\n", __func__);
 			continue;
@@ -113,7 +114,7 @@ static int mt76x0_mcu_wait_resp(struct mt76x0_dev *dev, u8 seq)
 		ret = mt76x0_usb_submit_buf(dev, USB_DIR_IN, MT_EP_IN_CMD_RESP,
 					     &dev->mcu.resp, GFP_KERNEL,
 					     mt76x0_complete_urb,
-					     &dev->mcu.resp_cmpl);
+					     &usb->mcu.cmpl);
 		if (ret)
 			return ret;
 
@@ -151,7 +152,7 @@ __mt76x0_mcu_msg_send(struct mt76x0_dev *dev, struct sk_buff *skb,
 
 	mt76x0_dma_skb_wrap_cmd(skb, seq, cmd);
 
-	if (dev->mcu.resp_cmpl.done)
+	if (&usb->mcu.cmpl.done)
 		dev_err(dev->mt76.dev, "Error: MCU response pre-completed!\n");
 
 	trace_mt76x0_mcu_msg_send_cs(&dev->mt76, skb, wait_resp);
@@ -609,13 +610,13 @@ int mt76x0_mcu_init(struct mt76x0_dev *dev)
 
 int mt76x0_mcu_cmd_init(struct mt76x0_dev *dev)
 {
+	struct mt76_usb *usb = &dev->mt76.usb;
 	int ret;
 
 	ret = mt76x0_mcu_function_select(dev, Q_SELECT, 1);
 	if (ret)
 		return ret;
 
-	init_completion(&dev->mcu.resp_cmpl);
 	if (mt76x0_usb_alloc_buf(dev, MCU_RESP_URB_SIZE, &dev->mcu.resp)) {
 		mt76x0_usb_free_buf(dev, &dev->mcu.resp);
 		return -ENOMEM;
@@ -623,7 +624,7 @@ int mt76x0_mcu_cmd_init(struct mt76x0_dev *dev)
 
 	ret = mt76x0_usb_submit_buf(dev, USB_DIR_IN, MT_EP_IN_CMD_RESP,
 				     &dev->mcu.resp, GFP_KERNEL,
-				     mt76x0_complete_urb, &dev->mcu.resp_cmpl);
+				     mt76x0_complete_urb, &usb->mcu.cmpl);
 	if (ret) {
 		mt76x0_usb_free_buf(dev, &dev->mcu.resp);
 		return ret;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
index a694cc46fac8..298b7af31911 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
@@ -55,7 +55,6 @@ struct mt76x0_mcu {
 	u8 msg_seq;
 
 	struct mt76x0_dma_buf resp;
-	struct completion resp_cmpl;
 
 	struct mt76_reg_pair *reg_pairs;
 	unsigned int reg_pairs_len;
-- 
2.18.0

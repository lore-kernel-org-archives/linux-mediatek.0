From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3] mt76: mt7615: add support for per-chain signal strength
 reporting
Date: Thu, 13 Jun 2019 15:13:29 +0800
Message-ID: <ec6ccb9ad8e083bbc960c84adcb3164a4e190c7c.1560338170.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Fill in RX status->chain_signal to avoid empty value.

Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
Changes since v3 - use hweight8 instead.
Changes since v2 - correct calculation sequence.
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 22 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7615/mac.h   |  5 +++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index b60d42b5923d..1eb0e9c9970c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -13,6 +13,11 @@
 #include "../dma.h"
 #include "mac.h"
 
+static inline s8 to_rssi(u32 field, u32 rxv)
+{
+	return (FIELD_GET(field, rxv) - 220) / 2;
+}
+
 static struct mt76_wcid *mt7615_rx_get_wcid(struct mt7615_dev *dev,
 					    u8 idx, bool unicast)
 {
@@ -120,6 +125,7 @@ int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	if (rxd0 & MT_RXD0_NORMAL_GROUP_3) {
 		u32 rxdg0 = le32_to_cpu(rxd[0]);
 		u32 rxdg1 = le32_to_cpu(rxd[1]);
+		u32 rxdg3 = le32_to_cpu(rxd[3]);
 		u8 stbc = FIELD_GET(MT_RXV1_HT_STBC, rxdg0);
 		bool cck = false;
 
@@ -169,7 +175,21 @@ int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 
 		status->enc_flags |= RX_ENC_FLAG_STBC_MASK * stbc;
 
-		/* TODO: RSSI */
+		status->chains = dev->mt76.antenna_mask;
+		status->chain_signal[0] = to_rssi(MT_RXV4_RCPI0, rxdg3);
+		status->chain_signal[1] = to_rssi(MT_RXV4_RCPI1, rxdg3);
+		status->chain_signal[2] = to_rssi(MT_RXV4_RCPI2, rxdg3);
+		status->chain_signal[3] = to_rssi(MT_RXV4_RCPI3, rxdg3);
+		status->signal = status->chain_signal[0];
+
+		for (i = 1; i < hweight8(dev->mt76.antenna_mask); i++) {
+			if (!(status->chains & BIT(i)))
+				continue;
+
+			status->signal = max(status->signal,
+					     status->chain_signal[i]);
+		}
+
 		rxd += 6;
 		if ((u8 *)rxd - skb->data >= skb->len)
 			return -EINVAL;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index 18ad4b8a3807..b00ce8db58e9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -98,6 +98,11 @@ enum rx_pkt_type {
 #define MT_RXV2_GROUP_ID		GENMASK(26, 21)
 #define MT_RXV2_LENGTH			GENMASK(20, 0)
 
+#define MT_RXV4_RCPI3			GENMASK(31, 24)
+#define MT_RXV4_RCPI2			GENMASK(23, 16)
+#define MT_RXV4_RCPI1			GENMASK(15, 8)
+#define MT_RXV4_RCPI0			GENMASK(7, 0)
+
 enum tx_header_format {
 	MT_HDR_FORMAT_802_3,
 	MT_HDR_FORMAT_CMD,
-- 
2.18.0

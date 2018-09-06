From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 03/42] mt76: move mt76x2u_remove_dma_hdr in mt76x02-lib module
Date: Thu,  6 Sep 2018 11:18:19 +0200
Message-ID: <1536225538-16454-4-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Move mt76x2u_remove_dma_hdr in mt76x02-lib module and rename it in
mt76x02_remove_dma_hdr. Moreover use mt76x02_remove_hdr_pad routine
in mt76x02_remove_dma_hdr function.
Furthermore remove mt76x0_tx_skb_remove_dma_overhead routine

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/tx.c    | 14 +-------------
 drivers/net/wireless/mediatek/mt76/mt76x02_util.c | 12 ++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76x02_util.h |  1 +
 drivers/net/wireless/mediatek/mt76/mt76x2u_core.c | 14 +-------------
 4 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c b/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
index 0dab1c6528f9..de2643d54a1e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/tx.c
@@ -29,23 +29,11 @@ static u8 skb2q(struct sk_buff *skb)
 	return mt76_ac_to_hwq(qid);
 }
 
-static void mt76x0_tx_skb_remove_dma_overhead(struct sk_buff *skb,
-					       struct ieee80211_tx_info *info)
-{
-	int pkt_len = (unsigned long)info->status.status_driver_data[0];
-
-	skb_pull(skb, sizeof(struct mt76x02_txwi) + 4);
-	if (ieee80211_get_hdrlen_from_skb(skb) % 4)
-		mt76x02_remove_hdr_pad(skb, 2);
-
-	skb_trim(skb, pkt_len);
-}
-
 void mt76x0_tx_status(struct mt76x0_dev *dev, struct sk_buff *skb)
 {
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 
-	mt76x0_tx_skb_remove_dma_overhead(skb, info);
+	mt76x02_remove_dma_hdr(skb);
 
 	ieee80211_tx_info_clear_status(info);
 	info->status.rates[0].idx = -1;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index 37b70d723fba..a8ad3088ad8b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -16,6 +16,7 @@
  */
 
 #include "mt76.h"
+#include "dma.h"
 #include "mt76x02_regs.h"
 #include "mt76x02_mac.h"
 
@@ -377,6 +378,17 @@ void mt76x02_remove_hdr_pad(struct sk_buff *skb, int len)
 }
 EXPORT_SYMBOL_GPL(mt76x02_remove_hdr_pad);
 
+void mt76x02_remove_dma_hdr(struct sk_buff *skb)
+{
+	int hdr_len;
+
+	skb_pull(skb, sizeof(struct mt76x02_txwi) + MT_DMA_HDR_LEN);
+	hdr_len = ieee80211_get_hdrlen_from_skb(skb);
+	if (hdr_len % 4)
+		mt76x02_remove_hdr_pad(skb, 2);
+}
+EXPORT_SYMBOL_GPL(mt76x02_remove_dma_hdr);
+
 void mt76x02_tx_complete(struct mt76_dev *dev, struct sk_buff *skb)
 {
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.h b/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
index 19fe42c40bed..6b6e963454c8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.h
@@ -46,4 +46,5 @@ void mt76x02_sta_rate_tbl_update(struct ieee80211_hw *hw,
 int mt76x02_insert_hdr_pad(struct sk_buff *skb);
 void mt76x02_remove_hdr_pad(struct sk_buff *skb, int len);
 void mt76x02_tx_complete(struct mt76_dev *dev, struct sk_buff *skb);
+void mt76x02_remove_dma_hdr(struct sk_buff *skb);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c b/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c
index 7b72482b8275..01dcc5382798 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2u_core.c
@@ -18,18 +18,6 @@
 #include "dma.h"
 #include "mt76x02_util.h"
 
-static void mt76x2u_remove_dma_hdr(struct sk_buff *skb)
-{
-	int hdr_len;
-
-	skb_pull(skb, sizeof(struct mt76x02_txwi) + MT_DMA_HDR_LEN);
-	hdr_len = ieee80211_get_hdrlen_from_skb(skb);
-	if (hdr_len % 4) {
-		memmove(skb->data + 2, skb->data, hdr_len);
-		skb_pull(skb, 2);
-	}
-}

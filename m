From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2] mt76: fix endianness sparse warnings
Date: Fri, 26 Apr 2019 16:09:22 +0800
Message-ID: <d593c15bae7b4d72df17c3c4670ca9e28ef5c47f.1556265836.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Fix many warnings with incorrect endian assumptions.

Reported-by: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
Change since v2: use standard le16_to_cpu() instead of underscored version 
---
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index 2f2961ee0a92..b1d96a46a41c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -627,7 +627,7 @@ mt7603_mac_fill_rx(struct mt7603_dev *dev, struct sk_buff *skb)
 	status->aggr = unicast &&
 		       !ieee80211_is_qos_nullfunc(hdr->frame_control);
 	status->tid = *ieee80211_get_qos_ctl(hdr) & IEEE80211_QOS_CTL_TID_MASK;
-	status->seqno = IEEE80211_SEQ_TO_SN(hdr->seq_ctrl);
+	status->seqno = IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 1bf3e7b5f6a7..b8f48d10f27a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -235,7 +235,7 @@ int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	status->aggr = unicast &&
 		       !ieee80211_is_qos_nullfunc(hdr->frame_control);
 	status->tid = *ieee80211_get_qos_ctl(hdr) & IEEE80211_QOS_CTL_TID_MASK;
-	status->seqno = IEEE80211_SEQ_TO_SN(hdr->seq_ctrl);
+	status->seqno = IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
 
 	return 0;
 }
@@ -337,7 +337,7 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 	struct ieee80211_vif *vif = info->control.vif;
 	int tx_count = 8;
 	u8 fc_type, fc_stype, p_fmt, q_idx, omac_idx = 0;
-	u16 fc = le16_to_cpu(hdr->frame_control);
+	__le16 fc = hdr->frame_control;
 	u16 seqno = 0;
 	u32 val;
 
@@ -353,8 +353,8 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 		tx_count = msta->rate_count;
 	}
 
-	fc_type = (fc & IEEE80211_FCTL_FTYPE) >> 2;
-	fc_stype = (fc & IEEE80211_FCTL_STYPE) >> 4;
+	fc_type = (le16_to_cpu(fc) & IEEE80211_FCTL_FTYPE) >> 2;
+	fc_stype = (le16_to_cpu(fc) & IEEE80211_FCTL_STYPE) >> 4;
 
 	if (ieee80211_is_data(fc)) {
 		q_idx = skb_get_queue_mapping(skb);
@@ -468,7 +468,7 @@ void mt7615_txp_skb_unmap(struct mt76_dev *dev,
 	txp = (struct mt7615_txp *)(txwi + MT_TXD_SIZE);
 	for (i = 1; i < txp->nbuf; i++)
 		dma_unmap_single(dev->dev, le32_to_cpu(txp->buf[i]),
-				 le32_to_cpu(txp->len[i]), DMA_TO_DEVICE);
+				 le16_to_cpu(txp->len[i]), DMA_TO_DEVICE);
 }
 
 int mt7615_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
@@ -506,7 +506,7 @@ int mt7615_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	txp = (struct mt7615_txp *)(txwi + MT_TXD_SIZE);
 	for (i = 0; i < nbuf; i++) {
 		txp->buf[i] = cpu_to_le32(tx_info->buf[i + 1].addr);
-		txp->len[i] = cpu_to_le32(tx_info->buf[i + 1].len);
+		txp->len[i] = cpu_to_le16(tx_info->buf[i + 1].len);
 	}
 	txp->nbuf = nbuf;
 
-- 
2.18.0

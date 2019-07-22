From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 1/2] mt76: mt7615: add 4 WMM sets support
Date: Mon, 22 Jul 2019 16:50:08 +0800
Message-ID: <f5c814ad88a8d959376fc77930531582eedf1a63.1563779728.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hardware supports 4 sets of WMM that should be put to good use.
And fix incorrect queue mapping in mt7615_conf_tx().

Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c  |  5 +++--
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 16 ++++++----------
 .../net/wireless/mediatek/mt76/mt7615/mt7615.h   |  1 +
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 8f9a2bb68ded..d85b3904f33a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -314,7 +314,7 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	struct ieee80211_vif *vif = info->control.vif;
 	int tx_count = 8;
-	u8 fc_type, fc_stype, p_fmt, q_idx, omac_idx = 0;
+	u8 fc_type, fc_stype, p_fmt, q_idx, omac_idx = 0, wmm_idx = 0;
 	__le16 fc = hdr->frame_control;
 	u16 seqno = 0;
 	u32 val;
@@ -323,6 +323,7 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 		struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 
 		omac_idx = mvif->omac_idx;
+		wmm_idx = mvif->wmm_idx;
 	}
 
 	if (sta) {
@@ -335,7 +336,7 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 	fc_stype = (le16_to_cpu(fc) & IEEE80211_FCTL_STYPE) >> 4;
 
 	if (ieee80211_is_data(fc) || ieee80211_is_bufferable_mmpdu(fc)) {
-		q_idx = skb_get_queue_mapping(skb);
+		q_idx = skb_get_queue_mapping(skb) + wmm_idx * MT7615_MAX_WMM_SETS;
 		p_fmt = MT_TX_TYPE_CT;
 	} else if (ieee80211_is_beacon(fc)) {
 		q_idx = MT_LMAC_BCN0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 2c702b31d55f..ea48dcdb65c0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -85,9 +85,9 @@ static int mt7615_add_interface(struct ieee80211_hw *hw,
 	}
 	mvif->omac_idx = idx;
 
-	/* TODO: DBDC support. Use band 0 and wmm 0 for now */
+	/* TODO: DBDC support. Use band 0 for now */
 	mvif->band_idx = 0;
-	mvif->wmm_idx = 0;
+	mvif->wmm_idx = mvif->idx % MT7615_MAX_WMM_SETS;
 
 	ret = mt7615_mcu_set_dev_info(dev, vif, 1);
 	if (ret)
@@ -241,16 +241,12 @@ static int
 mt7615_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif, u16 queue,
 	       const struct ieee80211_tx_queue_params *params)
 {
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct mt7615_dev *dev = hw->priv;
-	static const u8 wmm_queue_map[] = {
-		[IEEE80211_AC_BK] = 0,
-		[IEEE80211_AC_BE] = 1,
-		[IEEE80211_AC_VI] = 2,
-		[IEEE80211_AC_VO] = 3,
-	};
 
-	/* TODO: hw wmm_set 1~3 */
-	return mt7615_mcu_set_wmm(dev, wmm_queue_map[queue], params);
+	queue += mvif->wmm_idx * MT7615_MAX_WMM_SETS;
+
+	return mt7615_mcu_set_wmm(dev, queue, params);
 }
 
 static void mt7615_configure_filter(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 2f43101343c3..f3f1738a01e7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -10,6 +10,7 @@
 #include "regs.h"
 
 #define MT7615_MAX_INTERFACES		4
+#define MT7615_MAX_WMM_SETS		4
 #define MT7615_WTBL_SIZE		128
 #define MT7615_WTBL_RESERVED		(MT7615_WTBL_SIZE - 1)
 #define MT7615_WTBL_STA			(MT7615_WTBL_RESERVED - \
-- 
2.18.0

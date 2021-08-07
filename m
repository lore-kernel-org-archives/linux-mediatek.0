Return-Path: <SRS0=znLv=M6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4583DC4338F
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Aug 2021 03:14:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62EB61181
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Aug 2021 03:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D62EB61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cpM3mjKdZVzpJRxKBkUE4v+TsD/Phb3had4hIYhDxeQ=; b=PHHQ0COE96D01z
	dPjKcAZajbUIgrGbAILhYP+lCtHGm2YASBDhzal1k8Z0ayHkOVcwGHKTrAGlshXrfin5AeV6F85LV
	xbqcxqvbOLxAIraUP7KLc7kfRgvOJTNmY/idhPhkJUM6xkjeWpyHBo6YsvpCej8gWWBYi195d+vcG
	3bymaIijeWYUsqBefiP4dbSo52zkaxkHjaQP9YLaVgyB5t7SqTYhFsfYuyNREmGyqkyS4sOmbG1X0
	FCjghAqY+PUjl887CMQsWCKk+vTlbMil9ZNqRdCuTmKKoOiHr5TPXMC4H1LhX1GY9XGxLHP3LS0Oz
	LLk/KzMCo5/jplQOuxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCCnK-00E4YN-GX; Sat, 07 Aug 2021 03:14:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCCnF-00E4XR-Pr
 for linux-mediatek@lists.infradead.org; Sat, 07 Aug 2021 03:14:39 +0000
X-UUID: 9d9470adf4884404ab0a661484904ccd-20210806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nsnddgIy0nhm6EZ5X43ZpecNLxOTF9IE88s8LmqBVlc=; 
 b=RpaGu4Nac4YwN6RiXN3R5ZF7lAxfOU3vpAP6NPkrPng4b5vdw4bOcDZRaKLg7uAdAfvFUmvvfooQglxOcTxE2ZiVHbLNXHmV4N5FTiF3YB0Fh8OhT9MNztmMEDVq/C2to62bNhpCG/7wXXymTuYaSGZluaCOZMW8GjlV2KUm2S4=;
X-UUID: 9d9470adf4884404ab0a661484904ccd-20210806
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 492536115; Fri, 06 Aug 2021 20:14:28 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Aug 2021 20:14:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 7 Aug 2021 11:14:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 7 Aug 2021 11:14:25 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 1/4] mt76: mt7915: checkpatch cleanup
Date: Sat, 7 Aug 2021 11:14:21 +0800
Message-ID: <77372f644903053e09d671325c0cd44cf75e14ac.1628301615.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_201437_908734_DD2812A0 
X-CRM114-Status: GOOD (  19.86  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix reasonable checkpatch warnings and clean up codes.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  3 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 43 ++++++++++---------
 .../net/wireless/mediatek/mt76/mt7915/mac.h   | 21 ++-------
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  6 +--
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 17 +++-----
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  5 +--
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  9 ++--
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  4 +-
 8 files changed, 46 insertions(+), 62 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index a1b9e1b3f700..9b9cb3ce2a0d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -149,7 +149,7 @@ static void mt7915_unregister_thermal(struct mt7915_phy *phy)
 	struct wiphy *wiphy = phy->mt76->hw->wiphy;
 
 	if (!phy->cdev)
-	    return;
+		return;
 
 	sysfs_remove_link(&wiphy->dev.kobj, "cooling_device");
 	thermal_cooling_device_unregister(phy->cdev);
@@ -505,7 +505,6 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
 	if (ret < 0)
 		return ret;
 
-
 	if (dev->flash_mode) {
 		ret = mt7915_mcu_apply_group_cal(dev);
 		if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index dfc5ea2cf7d0..667ccb2dab78 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -52,6 +52,19 @@ static const struct mt7915_dfs_radar_spec jp_radar_specs = {
 	},
 };
 
+static struct mt7915_txp *
+mt7915_txwi_to_txp(struct mt76_dev *dev, struct mt76_txwi_cache *t)
+{
+	u8 *txwi;
+
+	if (!t)
+		return NULL;
+
+	txwi = mt76_get_txwi_ptr(dev, t);
+
+	return (struct mt7915_txp *)(txwi + MT_TXD_SIZE);
+}
+
 static struct mt76_wcid *mt7915_rx_get_wcid(struct mt7915_dev *dev,
 					    u16 idx, bool unicast)
 {
@@ -868,7 +881,6 @@ static void
 mt7915_mac_write_txwi_8023(struct mt7915_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid)
 {
-
 	u8 tid = skb->priority & IEEE80211_QOS_CTL_TID_MASK;
 	u8 fc_type, fc_stype;
 	bool wmm = false;
@@ -1255,11 +1267,6 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
 		mt76_queue_tx_cleanup(dev, mphy_ext->q_tx[MT_TXQ_BE], false);
 	}
 
-	/*
-	 * TODO: MT_TX_FREE_LATENCY is msdu time from the TXD is queued into PLE,
-	 * to the time ack is received or dropped by hw (air + hw queue time).
-	 * Should avoid accessing WTBL to get Tx airtime, and use it instead.
-	 */
 	count = FIELD_GET(MT_TX_FREE_MSDU_CNT, le16_to_cpu(free->ctrl));
 	for (i = 0; i < count; i++) {
 		u32 msdu, info = le32_to_cpu(free->info[i]);
@@ -1489,7 +1496,7 @@ void mt7915_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 		break;
 	case PKT_TYPE_TXS:
 		for (rxd += 2; rxd + 8 <= end; rxd += 8)
-		    mt7915_mac_add_txs(dev, rxd);
+			mt7915_mac_add_txs(dev, rxd);
 		dev_kfree_skb(skb);
 		break;
 	case PKT_TYPE_NORMAL:
@@ -1546,13 +1553,9 @@ void mt7915_mac_reset_counters(struct mt7915_phy *phy)
 		mt76_rr(dev, MT_TX_AGG_CNT2(ext_phy, i));
 	}
 
-	if (ext_phy) {
-		dev->mt76.phy2->survey_time = ktime_get_boottime();
-		i = ARRAY_SIZE(dev->mt76.aggr_stats) / 2;
-	} else {
-		dev->mt76.phy.survey_time = ktime_get_boottime();
-		i = 0;
-	}
+	phy->mt76->survey_time = ktime_get_boottime();
+	i = ext_phy ? ARRAY_SIZE(dev->mt76.aggr_stats) / 2 : 0;
+
 	memset(&dev->mt76.aggr_stats[i], 0, sizeof(dev->mt76.aggr_stats) / 2);
 
 	/* reset airtime counters */
@@ -1762,13 +1765,13 @@ mt7915_dma_reset(struct mt7915_dev *dev)
 		 MT_WFDMA1_GLO_CFG_OMIT_RX_INFO);
 	if (dev->hif2) {
 		mt76_set(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
-			(MT_WFDMA0_GLO_CFG_TX_DMA_EN |
-			 MT_WFDMA0_GLO_CFG_RX_DMA_EN));
+			 (MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+			  MT_WFDMA0_GLO_CFG_RX_DMA_EN));
 		mt76_set(dev, MT_WFDMA1_GLO_CFG + hif1_ofs,
-			(MT_WFDMA1_GLO_CFG_TX_DMA_EN |
-			 MT_WFDMA1_GLO_CFG_RX_DMA_EN |
-			 MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
-			 MT_WFDMA1_GLO_CFG_OMIT_RX_INFO));
+			 (MT_WFDMA1_GLO_CFG_TX_DMA_EN |
+			  MT_WFDMA1_GLO_CFG_RX_DMA_EN |
+			  MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
+			  MT_WFDMA1_GLO_CFG_OMIT_RX_INFO));
 	}
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index ccce994dc07a..e6ac3ea31559 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -153,10 +153,10 @@ enum rx_pkt_type {
 #define MT_CRXV_HE_BEAM_CHNG		BIT(13)
 #define MT_CRXV_HE_DOPPLER		BIT(16)
 
-#define MT_CRXV_SNR		GENMASK(18, 13)
-#define MT_CRXV_FOE_LO		GENMASK(31, 19)
-#define MT_CRXV_FOE_HI		GENMASK(6, 0)
-#define MT_CRXV_FOE_SHIFT	13
+#define MT_CRXV_SNR			GENMASK(18, 13)
+#define MT_CRXV_FOE_LO			GENMASK(31, 19)
+#define MT_CRXV_FOE_HI			GENMASK(6, 0)
+#define MT_CRXV_FOE_SHIFT		13
 
 enum tx_header_format {
 	MT_HDR_FORMAT_802_3,
@@ -402,17 +402,4 @@ struct mt7915_dfs_radar_spec {
 	struct mt7915_dfs_pattern radar_pattern[16];
 };
 
-static inline struct mt7915_txp *
-mt7915_txwi_to_txp(struct mt76_dev *dev, struct mt76_txwi_cache *t)
-{
-	u8 *txwi;
-
-	if (!t)
-		return NULL;
-
-	txwi = mt76_get_txwi_ptr(dev, t);
-
-	return (struct mt7915_txp *)(txwi + MT_TXD_SIZE);
-}
-
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 825cb44c9107..fc2110dc4a75 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1013,9 +1013,9 @@ static void mt7915_sta_set_4addr(struct ieee80211_hw *hw,
 }
 
 static void mt7915_sta_set_decap_offload(struct ieee80211_hw *hw,
-				 struct ieee80211_vif *vif,
-				 struct ieee80211_sta *sta,
-				 bool enabled)
+					 struct ieee80211_vif *vif,
+					 struct ieee80211_sta *sta,
+					 bool enabled)
 {
 	struct mt7915_dev *dev = mt7915_hw_dev(hw);
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index cb3f833181d9..8ece8bf907cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -828,12 +828,7 @@ mt7915_mcu_bss_rfch_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	}
 
 	if (vif->bss_conf.he_support && vif->type == NL80211_IFTYPE_STATION) {
-		struct mt7915_dev *dev = phy->dev;
-		struct mt76_phy *mphy = &dev->mt76.phy;
-		bool ext_phy = phy != &dev->phy;
-
-		if (ext_phy && dev->mt76.phy2)
-			mphy = dev->mt76.phy2;
+		struct mt76_phy *mphy = phy->mt76;
 
 		ch->he_ru26_block =
 			mt7915_check_he_obss_narrow_bw_ru(mphy->hw, vif);
@@ -1462,7 +1457,7 @@ mt7915_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 
 static void
 mt7915_mcu_sta_uapsd_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
-		     struct ieee80211_vif *vif)
+			 struct ieee80211_vif *vif)
 {
 	struct sta_rec_uapsd *uapsd;
 	struct tlv *tlv;
@@ -1560,7 +1555,7 @@ mt7915_mcu_sta_amsdu_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 	struct tlv *tlv;
 
 	if (!sta->max_amsdu_len)
-	    return;
+		return;
 
 	tlv = mt7915_mcu_add_tlv(skb, STA_REC_HW_AMSDU, sizeof(*amsdu));
 	amsdu = (struct sta_rec_amsdu *)tlv;
@@ -2431,7 +2426,7 @@ mt7915_mcu_beacon_cont(struct mt7915_dev *dev, struct sk_buff *rskb,
 }
 
 int mt7915_mcu_add_beacon(struct ieee80211_hw *hw,
-			  struct ieee80211_vif *vif, int en)
+			  struct ieee80211_vif *vif, bool en)
 {
 #define MAX_BEACON_SIZE 512
 	struct mt7915_dev *dev = mt7915_hw_dev(hw);
@@ -3308,8 +3303,8 @@ int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset)
 	int ret;
 	u8 *buf;
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_QUERY(EFUSE_ACCESS), &req,
-				sizeof(req), true, &skb);
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_QUERY(EFUSE_ACCESS),
+					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 31c31a2a532b..d109548994cf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -211,8 +211,8 @@ struct mt7915_mcu_tx {
 #define WMM_TXOP_SET		BIT(3)
 #define WMM_PARAM_SET		GENMASK(3, 0)
 
-#define MCU_PQ_ID(p, q)			(((p) << 15) | ((q) << 10))
-#define MCU_PKT_ID			0xa0
+#define MCU_PQ_ID(p, q)		(((p) << 15) | ((q) << 10))
+#define MCU_PKT_ID		0xa0
 
 enum {
 	MCU_Q_QUERY,
@@ -228,7 +228,6 @@ enum {
 	MCU_S2D_H2CN
 };
 
-
 #define __MCU_CMD_FIELD_ID	GENMASK(7, 0)
 #define __MCU_CMD_FIELD_EXT_ID	GENMASK(15, 8)
 #define __MCU_CMD_FIELD_QUERY	BIT(16)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index d06b7536bba6..cc74dd2c2c72 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -55,7 +55,7 @@ enum mt7915_txq_id {
 };
 
 enum mt7915_rxq_id {
-	MT7915_RXQ_BAND0 = 0,
+	MT7915_RXQ_BAND0,
 	MT7915_RXQ_BAND1,
 	MT7915_RXQ_MCU_WM = 0,
 	MT7915_RXQ_MCU_WA,
@@ -82,6 +82,7 @@ struct mt7915_sta {
 
 	struct mt7915_sta_key_conf bip;
 };
+
 struct mt7915_vif {
 	u16 idx;
 	u8 omac_idx;
@@ -191,7 +192,7 @@ struct mt7915_dev {
 };
 
 enum {
-	HW_BSSID_0 = 0x0,
+	HW_BSSID_0,
 	HW_BSSID_1,
 	HW_BSSID_2,
 	HW_BSSID_3,
@@ -306,9 +307,9 @@ int mt7915_mcu_add_key(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		       struct mt7915_sta *msta, struct ieee80211_key_conf *key,
 		       enum set_key_cmd cmd);
 int mt7915_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-			  int enable);
+			  bool enable);
 int mt7915_mcu_add_obss_spr(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-                            bool enable);
+			    bool enable);
 int mt7915_mcu_add_rate_ctrl(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			     struct ieee80211_sta *sta);
 int mt7915_mcu_add_he(struct mt7915_dev *dev, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index 340b364da5f0..80215e1a1313 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -353,8 +353,8 @@ static int __init mt7915_init(void)
 
 static void __exit mt7915_exit(void)
 {
-    pci_unregister_driver(&mt7915_pci_driver);
-    pci_unregister_driver(&mt7915_hif_driver);
+	pci_unregister_driver(&mt7915_pci_driver);
+	pci_unregister_driver(&mt7915_hif_driver);
 }
 
 module_init(mt7915_init);
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

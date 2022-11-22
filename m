Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FEBC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpiHWK6fci8zF6W2gnl/CTePeiTh1/TGd9hnP3i1XZI=; b=LJjnkVTSj0GwJ98oN2kpOHPuZt
	UQ5wOW0KbM+LtjT5DbT09y/RYiv+RwXkCB2TpiDBYxEBqsbUfz9sYZ1yQ2eH+/YndExRug02+Jy0e
	HLYwxgWlyl2X2PtAeogq+CVqU/zW0cKiYMvFsfcM+LuVgOcVcB9foFkUan5OETq4ijqQm6oEyPeBq
	bFtsqDql9FipKR5/XHht6EpCtTsr7yXL++z7G9vCtPzR5UaHupm6+w2c+AF6q6C6N/3XDiqU0J5Ap
	t4CRF1LajfKQhUSvmBWx12+LxHtEq6DeeuR+NGXY5A9pzE5d1We5Nv966VmrEFq6hQwbSYeK+w5lp
	Etzh2kzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOZS-006DRd-Fj; Tue, 22 Nov 2022 08:23:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOZO-006DOk-JP
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 08:23:56 +0000
X-UUID: 57cba1e90d97408bbc6f0fe643b38c83-20221122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JpiHWK6fci8zF6W2gnl/CTePeiTh1/TGd9hnP3i1XZI=;
	b=AiA/M904mC105ZvPQSFUaxqVPSnx112Sr32GN3HcaBn/Uu5jaH8mzvqYXgUcpwx0vMbmsb6hOPEM+FULRC1cZUqWYg8NTOGv2ZR6vpG6BuDjN4EFHO3pMa0wRdBAucxK+ewpG0saBMA6e7aeGjfmYI1KNltOzjT6Uz1K2K0Gjxo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:5db9a3c2-4fb4-4329-9b10-fa4ee1b3b249,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:6df8e4db-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 57cba1e90d97408bbc6f0fe643b38c83-20221122
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1599102762; Tue, 22 Nov 2022 01:23:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 22 Nov 2022 15:53:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 22 Nov 2022 15:53:14 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v3 2/3] wifi: mt76: mt7915: enable .sta_set_txpwr support
Date: Tue, 22 Nov 2022 15:53:11 +0800
Message-ID: <6b42ee7f6a179dc8ced3670a3fe3e9170f406046.1669097067.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <b8a621999a1b5171e031c2a207965976fbc793f0.1669097067.git.ryder.lee@mediatek.com>
References: <b8a621999a1b5171e031c2a207965976fbc793f0.1669097067.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_002354_708606_088F9F53 
X-CRM114-Status: GOOD (  20.41  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds support for adjusting the Txpower level while pushing
traffic to an associated station. The allowed range is from 0 to
the maximum power of channel.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v3 - subtract nss_delta from txpower setting
change since v2 - release lock when return erro
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  3 +
 .../net/wireless/mediatek/mt76/mt7915/main.c  | 34 +++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 94 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  8 ++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +
 5 files changed, 137 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index b48c2ba9273d..79bd7bf93f33 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -355,6 +355,9 @@ mt7915_init_wiphy(struct ieee80211_hw *hw)
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_FILS_DISCOVERY);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
 
+	if (!is_mt7915(&dev->mt76))
+		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
+
 	if (!mdev->dev->of_node ||
 	    !of_property_read_bool(mdev->dev->of_node,
 				   "mediatek,disable-radar-background"))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index a29cbdb47801..cf48fcc8f170 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1126,6 +1126,39 @@ static void mt7915_sta_set_decap_offload(struct ieee80211_hw *hw,
 	mt76_connac_mcu_wtbl_update_hdr_trans(&dev->mt76, vif, sta);
 }
 
+static int mt7915_sta_set_txpwr(struct ieee80211_hw *hw,
+				struct ieee80211_vif *vif,
+				struct ieee80211_sta *sta)
+{
+	struct mt7915_phy *phy = mt7915_hw_phy(hw);
+	struct mt7915_dev *dev = mt7915_hw_dev(hw);
+	s16 txpower = sta->deflink.txpwr.power;
+	int ret;
+
+	if (sta->deflink.txpwr.type == NL80211_TX_POWER_AUTOMATIC)
+		txpower = 0;
+
+	mutex_lock(&dev->mt76.mutex);
+
+	/* NOTE: temporarily use 0 as minimum limit, which is a
+	 * global setting and will be applied to all stations.
+	 */
+	ret = mt7915_mcu_set_txpower_frame_min(phy, 0);
+	if (ret)
+		goto out;
+
+	/* This only applies to data frames while pushing traffic,
+	 * whereas the management frames or other packets that are
+	 * using fixed rate can be configured via TxD.
+	 */
+	ret = mt7915_mcu_set_txpower_frame(phy, vif, sta, txpower);
+
+out:
+	mutex_unlock(&dev->mt76.mutex);
+
+	return ret;
+}
+
 static const char mt7915_gstrings_stats[][ETH_GSTRING_LEN] = {
 	"tx_ampdu_cnt",
 	"tx_stop_q_empty_cnt",
@@ -1491,6 +1524,7 @@ const struct ieee80211_ops mt7915_ops = {
 	.set_bitrate_mask = mt7915_set_bitrate_mask,
 	.set_coverage_class = mt7915_set_coverage_class,
 	.sta_statistics = mt7915_sta_statistics,
+	.sta_set_txpwr = mt7915_sta_set_txpwr,
 	.sta_set_4addr = mt7915_sta_set_4addr,
 	.sta_set_decap_offload = mt7915_sta_set_decap_offload,
 	.add_twt_setup = mt7915_mac_add_twt_setup,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 3a0d97dad96f..b04cfe4c4e6d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3083,6 +3083,88 @@ int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
 				 &req, sizeof(req), false);
 }
 
+int mt7915_mcu_set_txpower_frame_min(struct mt7915_phy *phy, s8 txpower)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct {
+		u8 format_id;
+		u8 rsv;
+		u8 band_idx;
+		s8 txpower_min;
+	} __packed req = {
+		.format_id = TX_POWER_LIMIT_FRAME_MIN,
+		.band_idx = phy->band_idx,
+		.txpower_min = txpower * 2, /* 0.5db */
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76,
+				 MCU_EXT_CMD(TX_POWER_FEATURE_CTRL), &req,
+				 sizeof(req), true);
+}
+
+int mt7915_mcu_set_txpower_frame(struct mt7915_phy *phy,
+				 struct ieee80211_vif *vif,
+				 struct ieee80211_sta *sta, s8 txpower)
+{
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct mt7915_dev *dev = phy->dev;
+	struct mt76_phy *mphy = phy->mt76;
+	struct {
+		u8 format_id;
+		u8 rsv[3];
+		u8 band_idx;
+		s8 txpower_max;
+		__le16 wcid;
+		s8 txpower_offs[48];
+	} __packed req = {
+		.format_id = TX_POWER_LIMIT_FRAME,
+		.band_idx = phy->band_idx,
+		.txpower_max = DIV_ROUND_UP(mphy->txpower_cur, 2),
+		.wcid = cpu_to_le16(msta->wcid.idx),
+	};
+	int ret, n_chains = hweight8(mphy->antenna_mask);
+	s8 txpower_sku[MT7915_SKU_RATE_NUM];
+
+	ret = mt7915_mcu_get_txpower_sku(phy, txpower_sku, sizeof(txpower_sku));
+	if (ret)
+		return ret;
+
+	txpower = txpower * 2 - mt76_tx_power_nss_delta(n_chains);
+	if (txpower > mphy->txpower_cur || txpower < 0)
+		return -EINVAL;
+
+	if (txpower) {
+		u32 offs, len, i;
+
+		if (sta->deflink.ht_cap.ht_supported) {
+			const u8 *sku_len = mt7915_sku_group_len;
+
+			offs = sku_len[SKU_CCK] + sku_len[SKU_OFDM];
+			len = sku_len[SKU_HT_BW20] + sku_len[SKU_HT_BW40];
+
+			if (sta->deflink.vht_cap.vht_supported) {
+				offs += len;
+				len = sku_len[SKU_VHT_BW20] * 4;
+
+				if (sta->deflink.he_cap.has_he) {
+					offs += len + sku_len[SKU_HE_RU26] * 3;
+					len = sku_len[SKU_HE_RU242] * 4;
+				}
+			}
+		} else {
+			return -EINVAL;
+		}
+
+		for (i = 0; i < len; i++, offs++)
+			req.txpower_offs[i] =
+				DIV_ROUND_UP(txpower - txpower_sku[offs], 2);
+	}
+
+	return mt76_mcu_send_msg(&dev->mt76,
+				 MCU_EXT_CMD(TX_POWER_FEATURE_CTRL), &req,
+				 sizeof(req), true);
+}
+
 int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy)
 {
 	struct mt7915_dev *dev = phy->dev;
@@ -3094,7 +3176,7 @@ int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy)
 		u8 dbdc_idx;
 		s8 val[MT7915_SKU_RATE_NUM];
 	} __packed req = {
-		.format_id = 4,
+		.format_id = TX_POWER_LIMIT_TABLE,
 		.dbdc_idx = phy != &dev->phy,
 	};
 	struct mt76_power_limits limits_array;
@@ -3144,11 +3226,11 @@ int mt7915_mcu_get_txpower_sku(struct mt7915_phy *phy, s8 *txpower, int len)
 		u8 band;
 		u8 _rsv;
 	} __packed req = {
-		.format_id = 7,
+		.format_id = TX_POWER_LIMIT_INFO,
 		.category = RATE_POWER_INFO,
 		.band = phy != &dev->phy,
 	};
-	s8 res[MT7915_SKU_RATE_NUM][2];
+	s8 txpower_sku[MT7915_SKU_RATE_NUM][2];
 	struct sk_buff *skb;
 	int ret, i;
 
@@ -3158,9 +3240,9 @@ int mt7915_mcu_get_txpower_sku(struct mt7915_phy *phy, s8 *txpower, int len)
 	if (ret)
 		return ret;
 
-	memcpy(res, skb->data + 4, sizeof(res));
+	memcpy(txpower_sku, skb->data + 4, sizeof(txpower_sku));
 	for (i = 0; i < len; i++)
-		txpower[i] = res[i][req.band];
+		txpower[i] = txpower_sku[i][req.band_idx];
 
 	dev_kfree_skb(skb);
 
@@ -3198,7 +3280,7 @@ int mt7915_mcu_set_sku_en(struct mt7915_phy *phy, bool enable)
 		u8 dbdc_idx;
 		u8 rsv;
 	} __packed req = {
-		.format_id = 0,
+		.format_id = TX_POWER_LIMIT_ENABLE,
 		.dbdc_idx = phy != &dev->phy,
 		.sku_enable = enable,
 	};
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 2fc09fd53777..46c517e50ae4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -419,6 +419,14 @@ enum {
 #define RATE_CFG_PHY_TYPE		GENMASK(27, 24)
 #define RATE_CFG_HE_LTF			GENMASK(31, 28)
 
+enum {
+	TX_POWER_LIMIT_ENABLE,
+	TX_POWER_LIMIT_TABLE = 0x4,
+	TX_POWER_LIMIT_INFO = 0x7,
+	TX_POWER_LIMIT_FRAME = 0x11,
+	TX_POWER_LIMIT_FRAME_MIN = 0x12,
+};
+
 enum {
 	SPR_ENABLE = 0x1,
 	SPR_ENABLE_SD = 0x3,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 0bad78cf32c7..015c7190d79f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -526,6 +526,10 @@ int mt7915_mcu_set_ser(struct mt7915_dev *dev, u8 action, u8 set, u8 band);
 int mt7915_mcu_set_sku_en(struct mt7915_phy *phy, bool enable);
 int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy);
 int mt7915_mcu_get_txpower_sku(struct mt7915_phy *phy, s8 *txpower, int len);
+int mt7915_mcu_set_txpower_frame_min(struct mt7915_phy *phy, s8 txpower);
+int mt7915_mcu_set_txpower_frame(struct mt7915_phy *phy,
+				 struct ieee80211_vif *vif,
+				 struct ieee80211_sta *sta, s8 txpower);
 int mt7915_mcu_set_txbf(struct mt7915_dev *dev, u8 action);
 int mt7915_mcu_set_fcc5_lpn(struct mt7915_dev *dev, int val);
 int mt7915_mcu_set_pulse_th(struct mt7915_dev *dev,
-- 
2.36.1



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5620BE7D0AD
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 21:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEmBur8IrWF7H3eaG1P6OqGIJv6H+pdRVpteKFJh99M=; b=19moYlQdpMynUvzL966Tl0349B
	euZnJquOeBMQyVa2Rjot0t1bK2BcSE7leJCkKX8yY9MvotB65RfcreAAp/NSm4N4cvPyio0uNApUl
	Mz4seKw7pLQAp0H8+lfcSCevCCyVepRiMARuB3/Gkn92pRJcR7GFpdAFzGaUFBwIb0yhBu+Iy0P5S
	oE5CB0cIf/GjyaERmCgc2OY2e7ec33ceQAvb0x2HaZbbWGbk5sMt5F3+ztNiCg0HAu6e1WvjNSlMi
	ae47/0g44gB5d04i3hvkDD9asD7x4BClq9dRpgJbhkVtDte2lijUHp+k2BUKfsi7Rv/vHLanrHHU+
	mXHD699w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQqd-0079R6-2P;
	Thu, 21 Sep 2023 21:04:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQqb-0079P5-0g
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 21:04:30 +0000
X-UUID: 703a9e7458c211ee86758d4a7c00f3a0-20230921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JEmBur8IrWF7H3eaG1P6OqGIJv6H+pdRVpteKFJh99M=;
	b=oyfGmZc3r46lg+EoUC3HFxW2FtNuG/+Oc8Onr21k+0oTFM25VFbstNWfo6JGzuItashSpAO0HxzsDOrR/aE0p9hakO65S/kbSJV0QQ4YBtl3My1rH1aH1WRxEgMtdewpdEd0BND8shH1I90N8RF0vRoJ/cOJhaf6axQqVi6UN1M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:da456d0b-67b6-4541-861d-83c4efd8b5e8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:5cbefaef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 703a9e7458c211ee86758d4a7c00f3a0-20230921
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yi-chia.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 722872601; Thu, 21 Sep 2023 14:04:22 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 05:04:19 +0800
Received: from mussdccf250.mussds.eus.mediatek.inc (10.73.250.250) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 05:04:17 +0800
From: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>, Money Wang
	<Money.Wang@mediatek.com>
Subject: [PATCH v3 2/4] wifi: mt76: mt7996: Add mcu commands for getting sta tx statistic
Date: Thu, 21 Sep 2023 14:04:01 -0700
Message-ID: <058e5e4daa9c89c52ce119825343ac3bd7b70a15.1695329286.git.yi-chia.hsieh@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <d698600dc16fc3880e75dd24e2338ac21d51a45a.1695329286.git.yi-chia.hsieh@mediatek.com>
References: <d698600dc16fc3880e75dd24e2338ac21d51a45a.1695329286.git.yi-chia.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_140429_253999_164AF961 
X-CRM114-Status: GOOD (  15.80  )
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

Per peer Tx/Rx statistic can only be obtained by querying WM when WED is
on. This patch switches to periodic event reporting in the case of WED
being enabled.

Signed-off-by: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Signed-off-by: Money Wang <Money.Wang@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2: split series
---
v3: rebase and fix "build error: flexible array member in union"
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 15 ++++
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |  5 ++
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 15 ++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 68 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   | 26 +++++++
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  1 +
 6 files changed, 130 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 9bc97a35fc1d..e97adaf9976c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1022,6 +1022,8 @@ enum {
 	MCU_UNI_EVENT_ROC = 0x27,
 	MCU_UNI_EVENT_TX_DONE = 0x2d,
 	MCU_UNI_EVENT_NIC_CAPAB = 0x43,
+	MCU_UNI_EVENT_PER_STA_INFO = 0x6d,
+	MCU_UNI_EVENT_ALL_STA_INFO = 0x6e,
 };
 
 #define MCU_UNI_CMD_EVENT			BIT(1)
@@ -1240,6 +1242,8 @@ enum {
 	MCU_UNI_CMD_VOW = 0x37,
 	MCU_UNI_CMD_RRO = 0x57,
 	MCU_UNI_CMD_OFFCH_SCAN_CTRL = 0x58,
+	MCU_UNI_CMD_PER_STA_INFO = 0x6d,
+	MCU_UNI_CMD_ALL_STA_INFO = 0x6e,
 	MCU_UNI_CMD_ASSERT_DUMP = 0x6f,
 };
 
@@ -1320,6 +1324,17 @@ enum {
 	UNI_OFFLOAD_OFFLOAD_BMC_RPY_DETECT,
 };
 
+enum UNI_ALL_STA_INFO_TAG {
+	UNI_ALL_STA_TX_RATE,
+	UNI_ALL_STA_TX_STAT,
+	UNI_ALL_STA_TXRX_ADM_STAT,
+	UNI_ALL_STA_TXRX_AIR_TIME,
+	UNI_ALL_STA_DATA_TX_RETRY_COUNT,
+	UNI_ALL_STA_GI_MODE,
+	UNI_ALL_STA_TXRX_MSDU_COUNT,
+	UNI_ALL_STA_MAX_NUM
+};
+
 enum {
 	MT_NIC_CAP_TX_RESOURCE,
 	MT_NIC_CAP_TX_EFUSE_ADDR,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index d442746c8d96..c792b5e0f6f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2202,6 +2202,11 @@ void mt7996_mac_work(struct work_struct *work)
 		mphy->mac_work_count = 0;
 
 		mt7996_mac_update_stats(phy);
+
+		if (mtk_wed_device_active(&phy->dev->mt76.mmio.wed)) {
+			mt7996_mcu_get_all_sta_info(phy, UNI_ALL_STA_TXRX_ADM_STAT);
+			mt7996_mcu_get_all_sta_info(phy, UNI_ALL_STA_TXRX_MSDU_COUNT);
+		}
 	}
 
 	mutex_unlock(&mphy->dev->mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 0072809ae617..ce16637b45ce 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -969,6 +969,7 @@ static void mt7996_sta_statistics(struct ieee80211_hw *hw,
 				  struct ieee80211_sta *sta,
 				  struct station_info *sinfo)
 {
+	struct mt7996_phy *phy = mt7996_hw_phy(hw);
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
 	struct rate_info *txrate = &msta->wcid.rate;
 
@@ -1000,6 +1001,20 @@ static void mt7996_sta_statistics(struct ieee80211_hw *hw,
 
 	sinfo->avg_ack_signal = -(s8)ewma_avg_signal_read(&msta->avg_ack_signal);
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL_AVG);
+
+	if (mtk_wed_device_active(&phy->dev->mt76.mmio.wed)) {
+		sinfo->tx_bytes = msta->wcid.stats.tx_bytes;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BYTES64);
+
+		sinfo->rx_bytes = msta->wcid.stats.rx_bytes;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_BYTES64);
+
+		sinfo->tx_packets = msta->wcid.stats.tx_packets;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_PACKETS);
+
+		sinfo->rx_packets = msta->wcid.stats.rx_packets;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_PACKETS);
+	}
 }
 
 static void mt7996_sta_rc_work(void *data, struct ieee80211_sta *sta)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 12bf4e5038b5..bf917beb9439 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -449,6 +449,54 @@ mt7996_mcu_ie_countdown(struct mt7996_dev *dev, struct sk_buff *skb)
 	}
 }
 
+static void
+mt7996_mcu_rx_all_sta_info_event(struct mt7996_dev *dev, struct sk_buff *skb)
+{
+	struct mt7996_mcu_all_sta_info_event *res;
+	u16 i;
+
+	skb_pull(skb, sizeof(struct mt7996_mcu_rxd));
+
+	res = (struct mt7996_mcu_all_sta_info_event *)skb->data;
+
+	for (i = 0; i < le16_to_cpu(res->sta_num); i++) {
+		u8 ac;
+		u16 wlan_idx;
+		struct mt76_wcid *wcid;
+
+		switch (le16_to_cpu(res->tag)) {
+		case UNI_ALL_STA_TXRX_ADM_STAT:
+			wlan_idx = le16_to_cpu(res->adm_stat[i].wlan_idx);
+			wcid = rcu_dereference(dev->mt76.wcid[wlan_idx]);
+
+			if (!wcid)
+				break;
+
+			for (ac = 0; ac < IEEE80211_NUM_ACS; ac++) {
+				wcid->stats.tx_bytes +=
+					le32_to_cpu(res->adm_stat[i].tx_bytes[ac]);
+				wcid->stats.rx_bytes +=
+					le32_to_cpu(res->adm_stat[i].rx_bytes[ac]);
+			}
+			break;
+		case UNI_ALL_STA_TXRX_MSDU_COUNT:
+			wlan_idx = le16_to_cpu(res->msdu_cnt[i].wlan_idx);
+			wcid = rcu_dereference(dev->mt76.wcid[wlan_idx]);
+
+			if (!wcid)
+				break;
+
+			wcid->stats.tx_packets +=
+				le32_to_cpu(res->msdu_cnt[i].tx_msdu_cnt);
+			wcid->stats.rx_packets +=
+				le32_to_cpu(res->msdu_cnt[i].rx_msdu_cnt);
+			break;
+		default:
+			break;
+		}
+	}
+}
+
 static void
 mt7996_mcu_rx_ext_event(struct mt7996_dev *dev, struct sk_buff *skb)
 {
@@ -493,6 +541,9 @@ mt7996_mcu_uni_rx_unsolicited_event(struct mt7996_dev *dev, struct sk_buff *skb)
 	case MCU_UNI_EVENT_RDD_REPORT:
 		mt7996_mcu_rx_radar_detected(dev, skb);
 		break;
+	case MCU_UNI_EVENT_ALL_STA_INFO:
+		mt7996_mcu_rx_all_sta_info_event(dev, skb);
+		break;
 	default:
 		break;
 	}
@@ -4013,3 +4064,20 @@ int mt7996_mcu_set_rro(struct mt7996_dev *dev, u16 tag, u8 val)
 	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(RRO), &req,
 				 sizeof(req), true);
 }
+
+int mt7996_mcu_get_all_sta_info(struct mt7996_phy *phy, u16 tag)
+{
+	struct mt7996_dev *dev = phy->dev;
+	struct {
+		u8 _rsv[4];
+
+		__le16 tag;
+		__le16 len;
+	} __packed req = {
+		.tag = cpu_to_le16(tag),
+		.len = cpu_to_le16(sizeof(req) - 4),
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(ALL_STA_INFO),
+				 &req, sizeof(req), false);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index e4b31228ba0d..a88f6af323da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -153,6 +153,32 @@ struct mt7996_mcu_mib {
 	__le64 data;
 } __packed;
 
+struct mt7996_mcu_all_sta_info_event {
+	u8 rsv[4];
+	__le16 tag;
+	__le16 len;
+	u8 more;
+	u8 rsv2;
+	__le16 sta_num;
+	u8 rsv3[2];
+
+	union {
+		struct {
+			__le16 wlan_idx;
+			u8 rsv[2];
+			__le32 tx_bytes[IEEE80211_NUM_ACS];
+			__le32 rx_bytes[IEEE80211_NUM_ACS];
+		} adm_stat[0];
+
+		struct {
+			__le16 wlan_idx;
+			u8 rsv[2];
+			__le32 tx_msdu_cnt;
+			__le32 rx_msdu_cnt;
+		} msdu_cnt[0];
+	};
+} __packed;
+
 enum mt7996_chan_mib_offs {
 	UNI_MIB_OBSS_AIRTIME = 26,
 	UNI_MIB_NON_WIFI_TIME = 27,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 7354e5cf8e67..cb67a2d4c6d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -402,6 +402,7 @@ int mt7996_mcu_fw_dbg_ctrl(struct mt7996_dev *dev, u32 module, u8 level);
 int mt7996_mcu_trigger_assert(struct mt7996_dev *dev);
 void mt7996_mcu_rx_event(struct mt7996_dev *dev, struct sk_buff *skb);
 void mt7996_mcu_exit(struct mt7996_dev *dev);
+int mt7996_mcu_get_all_sta_info(struct mt7996_phy *phy, u16 tag);
 
 static inline u8 mt7996_max_interface_num(struct mt7996_dev *dev)
 {
-- 
2.39.0



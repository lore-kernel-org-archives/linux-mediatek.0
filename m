Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA59C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 20:39:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62E7A613E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 20:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62E7A613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AgkuXeDz1f2XEkijQUSPanq9IyClFqeuA8hBrPJjVi8=; b=S7n9oG+0wgAPzB
	x6a2OGxOYSE/starduFMAGNpj9Z7ta41uxGBap9jeol9iWxFwvvqLZHTKViHlfeV0HOUDH+4Ji9MN
	HckfCFTdHEHqEhEt9Ln+wXH8LSL0FxDjJY6u/mWLnp60/vMPGwgT1Z/T1k1otRZZFR7YI4CjpkXr7
	753tjbaihN6j2YpBTWR2jvO1LaPhX8ogzHy8Nq7RkOOrFq86bZgsQ8WtlY2ndHAhO8sYEc06Cy12b
	A/MHoacx5DfTFxFLbF0AcCn+V9Ic+mWUTJLWEdPX35iyVCy8yP+ru0UwYIU1agsh8VJDINsmWxyNj
	Q/ZpvDixQQgYmfm7Xmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltynJ-00BkbN-7S; Thu, 17 Jun 2021 20:39:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltynF-00BkaB-Rw
 for linux-mediatek@lists.infradead.org; Thu, 17 Jun 2021 20:39:20 +0000
X-UUID: d9c2409ecff04c2aaf338e438e1b56e3-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iOKQ6wFY5Von+pe/TmPDMOuj4gJNVBDk09v5QModvM4=; 
 b=CmMT27bu1T3B2iy/lfyQKVB3a7MGbI2BSy23wGG148TAIAX10U9yAjzIrxVLWpCUebYoAqThfO8gdcWKV+xMV13NwrX4MQ5fGvj4lofANHe4NJ/0aLm/up+R7Sgsux6NL1wOKs3kD9FRCjKESckErFu+vtGVN4XS6hQZBDjXlf4=;
X-UUID: d9c2409ecff04c2aaf338e438e1b56e3-20210617
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 906849008; Thu, 17 Jun 2021 13:39:06 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 13:39:04 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 04:39:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Jun 2021 04:39:03 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2 3/3] mt76: mt7615: add 802.11 encap offload support
Date: Fri, 18 Jun 2021 04:39:01 +0800
Message-ID: <abacfa39ce92e5b1853183b178e1d829b2d8860d.1623961575.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <177785418cf407808bf3a44760302d0647076990.1623961575.git.ryder.lee@mediatek.com>
References: <177785418cf407808bf3a44760302d0647076990.1623961575.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_133917_974987_96DEE7C7 
X-CRM114-Status: GOOD (  17.28  )
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

It is currently limited to AP interfaces. 3-address mode STA interface
can either work by adding IEEE80211_OFFLOAD_ENCAP_ENABLED back into
vif->offload_flags, but just note that this breaks 4-address mode.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2 - add a note for station mode limitation
---
 .../net/wireless/mediatek/mt76/mt7615/init.c  |   1 +
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 189 ++++++++++++------
 .../net/wireless/mediatek/mt76/mt7615/mac.h   |   1 +
 .../net/wireless/mediatek/mt76/mt7615/main.c  |   3 +
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |   4 +-
 .../wireless/mediatek/mt76/mt7615/pci_mac.c   |   6 +-
 .../wireless/mediatek/mt76/mt7615/usb_sdio.c  |   3 +
 7 files changed, 141 insertions(+), 66 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 36c9e527bb9a..5cff7a748470 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -398,6 +398,7 @@ mt7615_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, TX_STATUS_NO_AMPDU_LEN);
 	ieee80211_hw_set(hw, WANT_MONITOR_VIF);
 	ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
+	ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
 
 	if (is_mt7615(&phy->dev->mt76))
 		hw->max_tx_fragments = MT_TXP_MAX_BUF_NUM;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index f43df43512a8..9123a5611b5e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -607,24 +607,128 @@ mt7615_mac_tx_rate_val(struct mt7615_dev *dev,
 	return rateval;
 }
 
+static void
+mt7615_mac_write_txwi_8023(struct mt7615_dev *dev, __le32 *txwi,
+			   struct sk_buff *skb, struct mt76_wcid *wcid)
+{
+
+	bool is_mmio = mt76_is_mmio(&dev->mt76);
+	u8 fc_type, fc_stype;
+	bool wmm = false;
+	u32 val;
+
+	if (wcid->sta) {
+		struct ieee80211_sta *sta;
+
+		sta = container_of((void *)wcid, struct ieee80211_sta, drv_priv);
+		wmm = sta->wme;
+	}
+
+	val = FIELD_PREP(MT_TXD1_HDR_FORMAT, MT_HDR_FORMAT_802_3);
+	if (be16_to_cpu(skb->protocol) >= ETH_P_802_3_MIN)
+		val |= MT_TXD1_ETH_802_3;
+
+	txwi[1] |= cpu_to_le32(val);
+
+	fc_type = IEEE80211_FTYPE_DATA >> 2;
+	fc_stype = wmm ? IEEE80211_STYPE_QOS_DATA >> 4 : 0;
+
+	val = FIELD_PREP(MT_TXD2_FRAME_TYPE, fc_type) |
+	      FIELD_PREP(MT_TXD2_SUB_TYPE, fc_stype);
+	txwi[2] |= cpu_to_le32(val);
+
+	val = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
+	      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
+	txwi[7] |= cpu_to_le32(val);
+
+	if (!is_mmio) {
+		val = FIELD_PREP(MT_TXD8_L_TYPE, fc_type) |
+		      FIELD_PREP(MT_TXD8_L_SUB_TYPE, fc_stype);
+		txwi[8] |= cpu_to_le32(val);
+	}
+}
+
+static void
+mt7615_mac_write_txwi_80211(struct mt7615_dev *dev, __le32 *txwi,
+			    struct sk_buff *skb, struct ieee80211_key_conf *key)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	bool multicast = is_multicast_ether_addr(hdr->addr1);
+	bool is_mmio = mt76_is_mmio(&dev->mt76);
+	__le16 fc = hdr->frame_control;
+	u8 fc_type, fc_stype;
+	u32 val;
+
+	val = FIELD_PREP(MT_TXD1_HDR_FORMAT, MT_HDR_FORMAT_802_11) |
+	      FIELD_PREP(MT_TXD1_HDR_INFO,
+			 ieee80211_get_hdrlen_from_skb(skb) / 2);
+	txwi[1] |= cpu_to_le32(val);
+
+	fc_type = (le16_to_cpu(fc) & IEEE80211_FCTL_FTYPE) >> 2;
+	fc_stype = (le16_to_cpu(fc) & IEEE80211_FCTL_STYPE) >> 4;
+
+	val = FIELD_PREP(MT_TXD2_FRAME_TYPE, fc_type) |
+	      FIELD_PREP(MT_TXD2_SUB_TYPE, fc_stype) |
+	      FIELD_PREP(MT_TXD2_MULTICAST, multicast);
+
+	if (key && multicast && ieee80211_is_robust_mgmt_frame(skb) &&
+	    key->cipher == WLAN_CIPHER_SUITE_AES_CMAC) {
+		val |= MT_TXD2_BIP;
+		txwi[3] &= ~cpu_to_le32(MT_TXD3_PROTECT_FRAME);
+	}
+
+	txwi[2] |= cpu_to_le32(val);
+
+	if (ieee80211_is_beacon(fc)) {
+		val = MT_TXD5_TX_STATUS_HOST | MT_TXD5_SW_POWER_MGMT |
+		      MT_TXD5_PID;
+		txwi[5] &= ~cpu_to_le32(val);
+		txwi[3] |= cpu_to_le32(MT_TXD3_REM_TX_COUNT);
+	}
+
+	if (info->flags & IEEE80211_TX_CTL_INJECTED) {
+		u16 seqno = le16_to_cpu(hdr->seq_ctrl);
+
+		if (ieee80211_is_back_req(hdr->frame_control)) {
+			struct ieee80211_bar *bar;
+
+			bar = (struct ieee80211_bar *)skb->data;
+			seqno = le16_to_cpu(bar->start_seq_num);
+		}
+
+		val = MT_TXD3_SN_VALID |
+		      FIELD_PREP(MT_TXD3_SEQ, IEEE80211_SEQ_TO_SN(seqno));
+		txwi[3] |= cpu_to_le32(val);
+	}
+
+	val = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
+	      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
+	txwi[7] |= cpu_to_le32(val);
+
+	if (!is_mmio) {
+		val = FIELD_PREP(MT_TXD8_L_TYPE, fc_type) |
+		      FIELD_PREP(MT_TXD8_L_SUB_TYPE, fc_stype);
+		txwi[8] |= cpu_to_le32(val);
+	}
+}
+
 int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 			  struct sk_buff *skb, struct mt76_wcid *wcid,
 			  struct ieee80211_sta *sta, int pid,
 			  struct ieee80211_key_conf *key, bool beacon)
 {
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
-	u8 fc_type, fc_stype, p_fmt, q_idx, omac_idx = 0, wmm_idx = 0;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_tx_rate *rate = &info->control.rates[0];
+	struct ieee80211_hw *hw = mt76_hw(dev);
 	bool ext_phy = info->hw_queue & MT_TX_HW_QUEUE_EXT_PHY;
-	bool multicast = is_multicast_ether_addr(hdr->addr1);
 	struct ieee80211_vif *vif = info->control.vif;
+	bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
 	bool is_mmio = mt76_is_mmio(&dev->mt76);
 	u32 val, sz_txd = is_mmio ? MT_TXD_SIZE : MT_USB_TXD_SIZE;
+	u8 p_fmt, q_idx, omac_idx = 0, wmm_idx = 0;
 	struct mt76_phy *mphy = &dev->mphy;
-	__le16 fc = hdr->frame_control;
 	int tx_count = 8;
-	u16 seqno = 0;
 
 	if (vif) {
 		struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
@@ -642,9 +746,6 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 	if (ext_phy && dev->mt76.phy2)
 		mphy = dev->mt76.phy2;
 
-	fc_type = (le16_to_cpu(fc) & IEEE80211_FCTL_FTYPE) >> 2;
-	fc_stype = (le16_to_cpu(fc) & IEEE80211_FCTL_STYPE) >> 4;
-
 	if (beacon) {
 		p_fmt = MT_TX_TYPE_FW;
 		q_idx = ext_phy ? MT_LMAC_BCN1 : MT_LMAC_BCN0;
@@ -664,37 +765,20 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 
 	val = MT_TXD1_LONG_FORMAT |
 	      FIELD_PREP(MT_TXD1_WLAN_IDX, wcid->idx) |
-	      FIELD_PREP(MT_TXD1_HDR_FORMAT, MT_HDR_FORMAT_802_11) |
-	      FIELD_PREP(MT_TXD1_HDR_INFO,
-			 ieee80211_get_hdrlen_from_skb(skb) / 2) |
 	      FIELD_PREP(MT_TXD1_TID,
 			 skb->priority & IEEE80211_QOS_CTL_TID_MASK) |
 	      FIELD_PREP(MT_TXD1_PKT_FMT, p_fmt) |
 	      FIELD_PREP(MT_TXD1_OWN_MAC, omac_idx);
 	txwi[1] = cpu_to_le32(val);
 
-	val = FIELD_PREP(MT_TXD2_FRAME_TYPE, fc_type) |
-	      FIELD_PREP(MT_TXD2_SUB_TYPE, fc_stype) |
-	      FIELD_PREP(MT_TXD2_MULTICAST, multicast);
-	if (key) {
-		if (multicast && ieee80211_is_robust_mgmt_frame(skb) &&
-		    key->cipher == WLAN_CIPHER_SUITE_AES_CMAC) {
-			val |= MT_TXD2_BIP;
-			txwi[3] = 0;
-		} else {
-			txwi[3] = cpu_to_le32(MT_TXD3_PROTECT_FRAME);
-		}
-	} else {
-		txwi[3] = 0;
-	}
-	txwi[2] = cpu_to_le32(val);
+	txwi[2] = 0;
+	txwi[4] = 0;
+	txwi[6] = 0;
+	txwi[7] = cpu_to_le32(FIELD_PREP(MT_TXD7_SPE_IDX, 0x18));
 
 	if (!(info->flags & IEEE80211_TX_CTL_AMPDU))
 		txwi[2] |= cpu_to_le32(MT_TXD2_BA_DISABLE);
 
-	txwi[4] = 0;
-	txwi[6] = 0;
-
 	if (rate->idx >= 0 && rate->count &&
 	    !(info->flags & IEEE80211_TX_CTL_RATE_CTRL_PROBE)) {
 		bool stbc = info->flags & IEEE80211_TX_CTL_STBC;
@@ -722,45 +806,24 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 		tx_count = rate->count;
 	}
 
-	if (!ieee80211_is_beacon(fc)) {
-		struct ieee80211_hw *hw = mt76_hw(dev);
-
-		val = MT_TXD5_TX_STATUS_HOST | FIELD_PREP(MT_TXD5_PID, pid);
-		if (!ieee80211_hw_check(hw, SUPPORTS_PS))
-			val |= MT_TXD5_SW_POWER_MGMT;
-		txwi[5] = cpu_to_le32(val);
-	} else {
-		txwi[5] = 0;
-		/* use maximum tx count for beacons */
-		tx_count = 0x1f;
-	}
-
 	val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, tx_count);
-	if (info->flags & IEEE80211_TX_CTL_INJECTED) {
-		seqno = le16_to_cpu(hdr->seq_ctrl);
+	if (key)
+		val |= MT_TXD3_PROTECT_FRAME;
+	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
+		val |= MT_TXD3_NO_ACK;
 
-		if (ieee80211_is_back_req(hdr->frame_control)) {
-			struct ieee80211_bar *bar;
+	txwi[3] = cpu_to_le32(val);
 
-			bar = (struct ieee80211_bar *)skb->data;
-			seqno = le16_to_cpu(bar->start_seq_num);
-		}
-
-		val |= MT_TXD3_SN_VALID |
-		       FIELD_PREP(MT_TXD3_SEQ, IEEE80211_SEQ_TO_SN(seqno));
-	}
+	val = MT_TXD5_TX_STATUS_HOST | FIELD_PREP(MT_TXD5_PID, pid);
+	if (!ieee80211_hw_check(hw, SUPPORTS_PS))
+		val |= MT_TXD5_SW_POWER_MGMT;
 
-	txwi[3] |= cpu_to_le32(val);
+	txwi[5] = cpu_to_le32(val);
 
-	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
-		txwi[3] |= cpu_to_le32(MT_TXD3_NO_ACK);
-
-	txwi[7] = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
-		  FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype) |
-		  FIELD_PREP(MT_TXD7_SPE_IDX, 0x18);
-	if (!is_mmio)
-		txwi[8] = FIELD_PREP(MT_TXD8_L_TYPE, fc_type) |
-			  FIELD_PREP(MT_TXD8_L_SUB_TYPE, fc_stype);
+	if (is_8023)
+		mt7615_mac_write_txwi_8023(dev, txwi, skb, wcid);
+	else
+		mt7615_mac_write_txwi_80211(dev, txwi, skb, key);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index 46f283eb8d0f..0b6d0b41ad83 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -186,6 +186,7 @@ enum tx_phy_bandwidth {
 #define MT_TXD1_LONG_FORMAT		BIT(15)
 #define MT_TXD1_HDR_FORMAT		GENMASK(14, 13)
 #define MT_TXD1_HDR_INFO		GENMASK(12, 8)
+#define MT_TXD1_ETH_802_3		BIT(12)
 #define MT_TXD1_WLAN_IDX		GENMASK(7, 0)
 
 #define MT_TXD2_FIX_RATE		BIT(31)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 7c9a55c57578..30e9c189edb1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -240,6 +240,9 @@ static int mt7615_add_interface(struct ieee80211_hw *hw,
 	}
 
 	ret = mt7615_mcu_add_dev_info(phy, vif, true);
+
+	if (vif->type != NL80211_IFTYPE_AP)
+		vif->offload_flags = 0;
 out:
 	mt7615_mutex_release(dev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index cf4a4f2637d5..6cf2ed680097 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1041,11 +1041,11 @@ mt7615_mcu_wtbl_sta_add(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	if (enable) {
 		mt76_connac_mcu_wtbl_generic_tlv(&dev->mt76, wskb, vif, sta,
 						 NULL, wtbl_hdr);
+		mt76_connac_mcu_wtbl_hdr_trans_tlv(wskb, vif, &msta->wcid,
+						   NULL, wtbl_hdr);
 		if (sta)
 			mt76_connac_mcu_wtbl_ht_tlv(&dev->mt76, wskb, sta,
 						    NULL, wtbl_hdr);
-		mt76_connac_mcu_wtbl_hdr_trans_tlv(wskb, vif, &msta->wcid,
-						   NULL, wtbl_hdr);
 	}
 
 	cmd = enable ? MCU_EXT_CMD_WTBL_UPDATE : MCU_EXT_CMD_STA_REC_UPDATE;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
index cc278d8cb888..f8cc3561dd0a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
@@ -112,7 +112,8 @@ mt7615_write_fw_txp(struct mt7615_dev *dev, struct mt76_tx_info *tx_info,
 	if (!key)
 		txp->flags |= cpu_to_le16(MT_CT_INFO_NONE_CIPHER_FRAME);
 
-	if (ieee80211_is_mgmt(hdr->frame_control))
+	if (!(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
+	    ieee80211_is_mgmt(hdr->frame_control))
 		txp->flags |= cpu_to_le16(MT_CT_INFO_MGMT_FRAME);
 
 	if (vif) {
@@ -139,6 +140,9 @@ int mt7615_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	struct mt7615_sta *msta;
 	void *txp;
 
+	if (unlikely(tx_info->skb->len <= ETH_HLEN))
+		return -EINVAL;
+
 	msta = wcid ? container_of(wcid, struct mt7615_sta, wcid) : NULL;
 	if (!wcid)
 		wcid = &dev->mt76.global_wcid;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
index 996d48cca18a..fcbaee21bd4c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
@@ -197,6 +197,9 @@ int mt7663_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	struct mt7615_sta *msta;
 	int pad;
 
+	if (unlikely(skb->len <= ETH_HLEN))
+		return -EINVAL;
+
 	msta = wcid ? container_of(wcid, struct mt7615_sta, wcid) : NULL;
 	if ((info->flags & IEEE80211_TX_CTL_RATE_CTRL_PROBE) &&
 	    msta && !msta->rate_probe) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

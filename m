Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B903CC2BB55
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 23:02:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0F820801
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 23:02:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UDVSoW82";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Mv6jXkad"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0F820801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mc6qwWF+xlFwpBuik9W0IXXPRk16e5W5u5NWXcUnsJs=; b=UDVSoW82VraEHd
	8OV4jJMtu681lNO11BqLxMQ+n3lDTEx6v4jE55/3aRkDOa8DoEfMWd0rkSFTBlj/AE33YqYl8vjKm
	DMj5mhn9EhuXksPrEgBRSaRqM31wFDRAhC0Qb5/fnMHmd8iFLtdPGT3F52l1flv5915UjQ2Na5SYT
	nUusGQPfo46bPjll85zSBbmzPaGGYVf+KXFCf0VtqxbbhwCrp427PUi2DXGiyenz48MG3Z/xnE7Pm
	NSSCNhWNrc+tK2vWtCQHBpu1nBuxXnx1q66mmzWQQVgin3PKDUHiW5tcmz7V02Ql4zAFMC7kBoDYX
	hHuM/UJILUk2iM7jmP/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jN2ev-0000FL-K1; Fri, 10 Apr 2020 23:02:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jN2er-0000Ct-O5
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 23:01:59 +0000
X-UUID: 311bd1e6f9944c63a350033f2a6b5803-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Z6Bpp5SVYV+ddPa8Yo94mc210XVNOnKgn+kCbsx0Eio=; 
 b=Mv6jXkadAEhPXt59nbliogW/RcNPVc6ePh6FTO19bsNgzxXmbxBL7gxHjACyjQ6WDuUAkp3IfWHRVY1E5gIrdIIS1fcoogJvADqa+hCUOm7CHoH2scbVaXXfBfBKCrU204meBa1/bM7VF9Bke99pinLzGh2xqzYK6UkLeHHG1Ok=;
X-UUID: 311bd1e6f9944c63a350033f2a6b5803-20200410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1069044363; Fri, 10 Apr 2020 15:01:56 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:51:53 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Apr 2020 06:51:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Apr 2020 06:51:47 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 09/16] mt76: mt7915: register HE capabilities for each
 interface
Date: Sat, 11 Apr 2020 06:51:24 +0800
Message-ID: <831a63bd7cd79cf3574209e520d97e65a3b47769.1586558901.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586558901.git.ryder.lee@mediatek.com>
References: <cover.1586558901.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_160157_792151_BACFF3F9 
X-CRM114-Status: GOOD (  12.17  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The capabilities for the HE interfaces are generated from the capabilities
reported by the firmware.

This should move to common file once we have other HE devices support.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 194 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   1 +
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |   9 +
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |   3 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   2 +
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  13 ++
 6 files changed, 222 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 649ba9d55d99..67ad48625905 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -242,6 +242,198 @@ mt7915_init_wiphy(struct ieee80211_hw *hw)
 		hw->max_tx_fragments = 4;
 }
 
+static void
+mt7915_gen_ppe_thresh(struct mt7915_dev *dev, u8 *he_ppet)
+{
+	int ru, nss, max_nss = 1, max_ru = 3;
+	u8 bit = 7, ru_bit_mask = 0x7;
+	u8 ppet16_ppet8_ru3_ru0[] = {0x1c, 0xc7, 0x71};
+
+	he_ppet[0] = max_nss & IEEE80211_PPE_THRES_NSS_MASK;
+	he_ppet[0] |= (ru_bit_mask <<
+		       IEEE80211_PPE_THRES_RU_INDEX_BITMASK_POS) &
+			IEEE80211_PPE_THRES_RU_INDEX_BITMASK_MASK;
+
+	for (nss = 0; nss <= max_nss; nss++) {
+		for (ru = 0; ru < max_ru; ru++) {
+			u8 val;
+			int i;
+
+			if (!(ru_bit_mask & BIT(ru)))
+				continue;
+
+			val = (ppet16_ppet8_ru3_ru0[nss] >> (ru * 6)) &
+			       0x3f;
+			val = ((val >> 3) & 0x7) | ((val & 0x7) << 3);
+			for (i = 5; i >= 0; i--) {
+				he_ppet[bit / 8] |=
+					((val >> i) & 0x1) << ((bit % 8));
+				bit++;
+			}
+		}
+	}
+}
+
+static int
+mt7915_init_he_caps(struct mt7915_dev *dev, enum nl80211_band band,
+		    struct ieee80211_sband_iftype_data *data)
+{
+	int i, idx = 0;
+	int nss = hweight8(dev->phy.chainmask);
+	u16 mcs_map = 0;
+
+	for (i = 0; i < 8; i++) {
+		if (i < nss)
+			mcs_map |= (IEEE80211_HE_MCS_SUPPORT_0_11 << (i * 2));
+		else
+			mcs_map |= (IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2));
+	}
+
+	for (i = 0; i < NUM_NL80211_IFTYPES; i++) {
+		struct ieee80211_sta_he_cap *he_cap = &data[idx].he_cap;
+		struct ieee80211_he_cap_elem *he_cap_elem =
+				&he_cap->he_cap_elem;
+		struct ieee80211_he_mcs_nss_supp *he_mcs =
+				&he_cap->he_mcs_nss_supp;
+
+		switch (i) {
+		case NL80211_IFTYPE_STATION:
+		case NL80211_IFTYPE_AP:
+#ifdef CONFIG_MAC80211_MESH
+		case NL80211_IFTYPE_MESH_POINT:
+#endif
+			break;
+		default:
+			continue;
+		}
+
+		data[idx].types_mask = BIT(i);
+		he_cap->has_he = true;
+
+		he_cap_elem->mac_cap_info[0] =
+			IEEE80211_HE_MAC_CAP0_HTC_HE;
+		he_cap_elem->mac_cap_info[1] =
+			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_0US |
+			IEEE80211_HE_MAC_CAP1_MULTI_TID_AGG_RX_QOS_1;
+		he_cap_elem->mac_cap_info[2] =
+			IEEE80211_HE_MAC_CAP2_BSR;
+		he_cap_elem->mac_cap_info[3] =
+			IEEE80211_HE_MAC_CAP3_OMI_CONTROL |
+			IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_RESERVED;
+		he_cap_elem->mac_cap_info[4] =
+			IEEE80211_HE_MAC_CAP4_AMDSU_IN_AMPDU;
+
+		if (band == NL80211_BAND_2GHZ)
+			he_cap_elem->phy_cap_info[0] =
+				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G;
+		else if (band == NL80211_BAND_5GHZ)
+			he_cap_elem->phy_cap_info[0] =
+				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
+				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G |
+				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
+
+		he_cap_elem->phy_cap_info[1] =
+			IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
+		he_cap_elem->phy_cap_info[2] =
+			IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US |
+			IEEE80211_HE_PHY_CAP2_STBC_TX_UNDER_80MHZ |
+			IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ;
+
+		/* TODO: TxBF & MU & MESH */
+
+		switch (i) {
+		case NL80211_IFTYPE_AP:
+			he_cap_elem->mac_cap_info[0] |=
+				IEEE80211_HE_MAC_CAP0_TWT_RES;
+			he_cap_elem->mac_cap_info[4] |=
+				IEEE80211_HE_MAC_CAP4_BQR;
+			he_cap_elem->phy_cap_info[3] |=
+				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
+				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_QPSK;
+			he_cap_elem->phy_cap_info[6] |=
+				IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
+			he_cap_elem->phy_cap_info[9] |=
+				IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU;
+			break;
+		case NL80211_IFTYPE_STATION:
+			he_cap_elem->mac_cap_info[0] |=
+				IEEE80211_HE_MAC_CAP0_TWT_REQ;
+			he_cap_elem->mac_cap_info[3] |=
+				IEEE80211_HE_MAC_CAP3_FLEX_TWT_SCHED;
+
+			if (band == NL80211_BAND_2GHZ)
+				he_cap_elem->phy_cap_info[0] |=
+					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_RU_MAPPING_IN_2G;
+			else if (band == NL80211_BAND_5GHZ)
+				he_cap_elem->phy_cap_info[0] |=
+					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_RU_MAPPING_IN_5G;
+
+			he_cap_elem->phy_cap_info[1] |=
+				IEEE80211_HE_PHY_CAP1_DEVICE_CLASS_A;
+			he_cap_elem->phy_cap_info[8] |=
+				IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G |
+				IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
+				IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU;
+			he_cap_elem->phy_cap_info[9] |=
+				IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU;
+			break;
+#ifdef CONFIG_MAC80211_MESH
+		case NL80211_IFTYPE_MESH_POINT:
+			break;
+#endif
+		}
+
+		he_mcs->rx_mcs_80 = cpu_to_le16(mcs_map);
+		he_mcs->tx_mcs_80 = cpu_to_le16(mcs_map);
+
+		/* DBDC mode */
+		if (dev->chainmask != dev->phy.chainmask)
+			mcs_map = GENMASK(15, 0);
+
+		he_mcs->rx_mcs_160 = cpu_to_le16(mcs_map);
+		he_mcs->tx_mcs_160 = cpu_to_le16(mcs_map);
+		he_mcs->rx_mcs_80p80 = cpu_to_le16(mcs_map);
+		he_mcs->tx_mcs_80p80 = cpu_to_le16(mcs_map);
+
+		if (he_cap_elem->phy_cap_info[6] &
+		    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT) {
+			mt7915_gen_ppe_thresh(dev, he_cap->ppe_thres);
+		} else {
+			he_cap_elem->phy_cap_info[9] |=
+				IEEE80211_HE_PHY_CAP9_NOMIMAL_PKT_PADDING_16US;
+		}
+		idx++;
+	}
+
+	return idx;
+}
+
+void mt7915_set_stream_he_caps(struct mt7915_dev *dev)
+{
+	struct ieee80211_sband_iftype_data *data;
+	struct ieee80211_supported_band *band;
+	struct mt76_dev *mdev = &dev->mt76;
+	int n;
+
+	if (mdev->cap.has_2ghz) {
+		data = dev->iftype[NL80211_BAND_2GHZ];
+		n = mt7915_init_he_caps(dev, NL80211_BAND_2GHZ, data);
+
+		band = &mdev->phy.sband_2g.sband;
+		band->iftype_data = data;
+		band->n_iftype_data = n;
+	}
+
+	if (mdev->cap.has_5ghz) {
+		data = dev->iftype[NL80211_BAND_5GHZ];
+		n = mt7915_init_he_caps(dev, NL80211_BAND_5GHZ, data);
+
+		band = &mdev->phy.sband_5g.sband;
+		band->iftype_data = data;
+		band->n_iftype_data = n;
+	}
+}
+
 static void
 mt7915_cap_dbdc_enable(struct mt7915_dev *dev)
 {
@@ -259,6 +451,7 @@ mt7915_cap_dbdc_enable(struct mt7915_dev *dev)
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->phy.chainmask;
 
 	mt76_set_stream_caps(&dev->mt76, true);
+	mt7915_set_stream_he_caps(dev);
 }
 
 static void
@@ -274,6 +467,7 @@ mt7915_cap_dbdc_disable(struct mt7915_dev *dev)
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->chainmask;
 
 	mt76_set_stream_caps(&dev->mt76, true);
+	mt7915_set_stream_he_caps(dev);
 }
 
 int mt7915_register_ext_phy(struct mt7915_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 7bf99e148d02..78e792ad782e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -693,6 +693,7 @@ mt7915_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 	phy->chainmask = tx_ant;
 
 	mt76_set_stream_caps(&dev->mt76, true);
+	mt7915_set_stream_he_caps(dev);
 
 	mutex_unlock(&dev->mt76.mutex);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index a6b9d1a95f04..89cdf8dca3b0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -139,11 +139,13 @@ mt7915_get_phy_mode(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 {
 	struct ieee80211_sta_ht_cap *ht_cap;
 	struct ieee80211_sta_vht_cap *vht_cap;
+	const struct ieee80211_sta_he_cap *he_cap;
 	u8 mode = 0;
 
 	if (sta) {
 		ht_cap = &sta->ht_cap;
 		vht_cap = &sta->vht_cap;
+		he_cap = &sta->he_cap;
 	} else {
 		struct ieee80211_supported_band *sband;
 
@@ -154,6 +156,7 @@ mt7915_get_phy_mode(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 
 		ht_cap = &sband->ht_cap;
 		vht_cap = &sband->vht_cap;
+		he_cap = ieee80211_get_he_iftype_cap(sband, vif->type);
 	}
 
 	if (band == NL80211_BAND_2GHZ) {
@@ -161,6 +164,9 @@ mt7915_get_phy_mode(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 
 		if (ht_cap->ht_supported)
 			mode |= PHY_MODE_GN;
+
+		if (he_cap->has_he)
+			mode |= PHY_MODE_AX_24G;
 	} else if (band == NL80211_BAND_5GHZ) {
 		mode |= PHY_MODE_A;
 
@@ -169,6 +175,9 @@ mt7915_get_phy_mode(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 
 		if (vht_cap->vht_supported)
 			mode |= PHY_MODE_AC;
+
+		if (he_cap->has_he)
+			mode |= PHY_MODE_AX_5G;
 	}
 
 	return mode;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 867cab7cf145..0563e9321175 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -835,6 +835,9 @@ enum {
 #define PHY_MODE_GN			BIT(3)
 #define PHY_MODE_AN			BIT(4)
 #define PHY_MODE_AC			BIT(5)
+#define PHY_MODE_AX_24G			BIT(6)
+#define PHY_MODE_AX_5G			BIT(7)
+#define PHY_MODE_AX_6G			BIT(8)
 
 #define MODE_CCK			BIT(0)
 #define MODE_OFDM			BIT(1)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 7f569a7a0c9b..694519836014 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -163,6 +163,7 @@ struct mt7915_dev {
 	spinlock_t token_lock;
 	struct idr token;
 
+	struct ieee80211_sband_iftype_data **iftype;
 	s8 **rate_power; /* TODO: use mt76_rate_power */
 
 	u8 mac_work_count;
@@ -443,6 +444,7 @@ void mt7915_txp_skb_unmap(struct mt76_dev *dev,
 			  struct mt76_txwi_cache *txwi);
 int mt76_dfs_start_rdd(struct mt7915_dev *dev, bool force);
 int mt7915_dfs_init_radar_detector(struct mt7915_phy *phy);
+void mt7915_set_stream_he_caps(struct mt7915_dev *dev);
 void mt7915_update_channel(struct mt76_dev *mdev);
 int mt7915_init_debugfs(struct mt7915_dev *dev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index a98e91163971..3b528b1577aa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -83,6 +83,7 @@ static int
 mt7915_alloc_device(struct pci_dev *pdev, struct mt7915_dev *dev)
 {
 #define NUM_BANDS	2
+	struct ieee80211_sband_iftype_data **iftype;
 	int i;
 	s8 **sku;
 
@@ -98,6 +99,18 @@ mt7915_alloc_device(struct pci_dev *pdev, struct mt7915_dev *dev)
 	}
 	dev->rate_power = sku;
 
+	iftype = devm_kzalloc(&pdev->dev, NUM_BANDS * sizeof(*iftype),
+			      GFP_KERNEL);
+	if (!iftype)
+		return -ENOMEM;
+
+	for (i = 0; i < NUM_BANDS; i++) {
+		iftype[i] = devm_kzalloc(&pdev->dev, NUM_NL80211_IFTYPES *
+					 sizeof(**iftype), GFP_KERNEL);
+		if (!iftype[i])
+			return -ENOMEM;
+	}
+	dev->iftype = iftype;
 
 	return 0;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

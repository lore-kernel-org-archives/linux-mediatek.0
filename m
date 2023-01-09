Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE25C61DB3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 16:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcZrp6p93W/l9bpUulNq2/5fVebjH2RobnuR+0OEDxs=; b=iqC2fIoAPM6F3iYO+nEVYTRXty
	bn+ZexeDRIIAuN1a8mOBBSB6giaPu2HpLeKBD0pG5Amchs40ApVpmvfx45Ro1lVFJx3xIZc+gFk9K
	n+bAlUbouBzd8c8eMP+wPkjap+M+Tgb7wQkNBTZ4oPWiYaoASL3NIIKVjM9wV9qFuI/1SpUI7/rbR
	KGwRy2gd/GmbPvHStSilaaLjACh5Y5wlHkTnuHGj0/9/1CbXxoFf5bMu5D1eRD3CQDvddsjWrVEbI
	8D7BRIkPWpM50WzOsQGU0f2F+zVFhTgsTXU5WMyUESrVbFt5Bm6KYmI+EEVy8oFNxszCvSuP/SPpQ
	k0dwpmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvU9-002juS-FM; Mon, 09 Jan 2023 16:58:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvU5-002jqg-E1
	for linux-mediatek@bombadil.infradead.org; Mon, 09 Jan 2023 16:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wcZrp6p93W/l9bpUulNq2/5fVebjH2RobnuR+0OEDxs=; b=f1nIR0AngM/5YRrvK5PJ2HTrcu
	K9OVrTXzmg/wMjtKa5AQSpprdf59MKGfK+E6mpDVUuvitPFIdLCu/F+Yz+pfmWsp9Zdv9+gtArwUr
	yAyNfHjHky/3VevNshlHe00uoFItVN44we4SvfPMMQp5ZjJpRmMe9h7X0WCJgpH1plifYLt7TAbdY
	YGltZnAJ1XmA+GDu8omnnJFdFgCgQ+p8eq2IFvq9W88Ei/0yibB5bjZk+YGkwKbTbW3A9SVxLNfCW
	spoX9dQU8UkwvMMhhL+W95ldZOoS1XEo57WtransJcNX4U4jjfTwUm4wqr7BbltKLqrVxjsbQrvdJ
	BNbQxJtw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEvTu-002mn6-1h
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Jan 2023 16:58:44 +0000
X-UUID: c9789391114040d18810e3b27103eadb-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wcZrp6p93W/l9bpUulNq2/5fVebjH2RobnuR+0OEDxs=;
	b=UfGqE1jWt+TpCoo36jtnQWT5auoXnlqrZRJSeFyRTwRfZ7T2qW3qIgJrwjxFyDiNWWVyBWI+u7vCZnWpcUkOm1/F2zrUeKPPcE45thusE5r8noE6l/ar5r6Mw+rMBxZse+XkC+PdKywK8mV8tgm6pM7wrnwbtFZWNBCa7f9EOFc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:6e0f5f0f-840d-46d2-8e75-ccf7e23c44bf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:aaca4af5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: c9789391114040d18810e3b27103eadb-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2078344503; Mon, 09 Jan 2023 09:58:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 00:58:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 00:58:05 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 09/13] wifi: mt76: mt7996: rework capability init
Date: Tue, 10 Jan 2023 00:57:27 +0800
Message-ID: <20230109165731.682-10-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109165731.682-1-shayne.chen@mediatek.com>
References: <20230109165731.682-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_165842_865749_8AC98DE7 
X-CRM114-Status: GOOD (  15.79  )
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

Rework and extract common code of capability init for the preparation of
adding EHT capability.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 296 ++++++++----------
 1 file changed, 139 insertions(+), 157 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 6bcf2649d8df..73bee7df468d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -37,8 +37,7 @@ static const struct ieee80211_iface_combination if_comb[] = {
 				       BIT(NL80211_CHAN_WIDTH_20) |
 				       BIT(NL80211_CHAN_WIDTH_40) |
 				       BIT(NL80211_CHAN_WIDTH_80) |
-				       BIT(NL80211_CHAN_WIDTH_160) |
-				       BIT(NL80211_CHAN_WIDTH_80P80),
+				       BIT(NL80211_CHAN_WIDTH_160),
 	}
 };
 
@@ -572,11 +571,15 @@ mt7996_gen_ppe_thresh(u8 *he_ppet, int nss)
 			 (0xff >> (8 - (ppet_bits - 1) % 8));
 }
 
-static int
+static void
 mt7996_init_he_caps(struct mt7996_phy *phy, enum nl80211_band band,
-		    struct ieee80211_sband_iftype_data *data)
+		    struct ieee80211_sband_iftype_data *data,
+		    enum nl80211_iftype iftype)
 {
-	int i, idx = 0, nss = hweight8(phy->mt76->antenna_mask);
+	struct ieee80211_sta_he_cap *he_cap = &data->he_cap;
+	struct ieee80211_he_cap_elem *he_cap_elem = &he_cap->he_cap_elem;
+	struct ieee80211_he_mcs_nss_supp *he_mcs = &he_cap->he_mcs_nss_supp;
+	int i, nss = hweight8(phy->mt76->antenna_mask);
 	u16 mcs_map = 0;
 
 	for (i = 0; i < 8; i++) {
@@ -586,179 +589,158 @@ mt7996_init_he_caps(struct mt7996_phy *phy, enum nl80211_band band,
 			mcs_map |= (IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2));
 	}
 
-	for (i = 0; i < NUM_NL80211_IFTYPES; i++) {
-		struct ieee80211_sta_he_cap *he_cap = &data[idx].he_cap;
-		struct ieee80211_he_cap_elem *he_cap_elem =
-				&he_cap->he_cap_elem;
-		struct ieee80211_he_mcs_nss_supp *he_mcs =
-				&he_cap->he_mcs_nss_supp;
-
-		switch (i) {
-		case NL80211_IFTYPE_STATION:
-		case NL80211_IFTYPE_AP:
-#ifdef CONFIG_MAC80211_MESH
-		case NL80211_IFTYPE_MESH_POINT:
-#endif
-			break;
-		default:
-			continue;
-		}
+	he_cap->has_he = true;
 
-		data[idx].types_mask = BIT(i);
-		he_cap->has_he = true;
+	he_cap_elem->mac_cap_info[0] = IEEE80211_HE_MAC_CAP0_HTC_HE;
+	he_cap_elem->mac_cap_info[3] = IEEE80211_HE_MAC_CAP3_OMI_CONTROL |
+				       IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_EXT_3;
+	he_cap_elem->mac_cap_info[4] = IEEE80211_HE_MAC_CAP4_AMSDU_IN_AMPDU;
 
-		he_cap_elem->mac_cap_info[0] =
-			IEEE80211_HE_MAC_CAP0_HTC_HE;
-		he_cap_elem->mac_cap_info[3] =
-			IEEE80211_HE_MAC_CAP3_OMI_CONTROL |
-			IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_EXT_3;
-		he_cap_elem->mac_cap_info[4] =
-			IEEE80211_HE_MAC_CAP4_AMSDU_IN_AMPDU;
+	if (band == NL80211_BAND_2GHZ)
+		he_cap_elem->phy_cap_info[0] =
+			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G;
+	else
+		he_cap_elem->phy_cap_info[0] =
+			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
+			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
+
+	he_cap_elem->phy_cap_info[1] = IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
+	he_cap_elem->phy_cap_info[2] = IEEE80211_HE_PHY_CAP2_STBC_TX_UNDER_80MHZ |
+				       IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ;
+
+	switch (iftype) {
+	case NL80211_IFTYPE_AP:
+		he_cap_elem->mac_cap_info[0] |= IEEE80211_HE_MAC_CAP0_TWT_RES;
+		he_cap_elem->mac_cap_info[2] |= IEEE80211_HE_MAC_CAP2_BSR;
+		he_cap_elem->mac_cap_info[4] |= IEEE80211_HE_MAC_CAP4_BQR;
+		he_cap_elem->mac_cap_info[5] |=
+			IEEE80211_HE_MAC_CAP5_OM_CTRL_UL_MU_DATA_DIS_RX;
+		he_cap_elem->phy_cap_info[3] |=
+			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
+			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_QPSK;
+		he_cap_elem->phy_cap_info[6] |=
+			IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
+			IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
+		he_cap_elem->phy_cap_info[9] |=
+			IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
+			IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU;
+		break;
+	case NL80211_IFTYPE_STATION:
+		he_cap_elem->mac_cap_info[1] |=
+			IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_16US;
 
 		if (band == NL80211_BAND_2GHZ)
-			he_cap_elem->phy_cap_info[0] =
-				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G;
+			he_cap_elem->phy_cap_info[0] |=
+			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_RU_MAPPING_IN_2G;
 		else
-			he_cap_elem->phy_cap_info[0] =
-				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
-				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G |
-				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
+			he_cap_elem->phy_cap_info[0] |=
+			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_RU_MAPPING_IN_5G;
+
+		he_cap_elem->phy_cap_info[1] |=
+			IEEE80211_HE_PHY_CAP1_DEVICE_CLASS_A |
+			IEEE80211_HE_PHY_CAP1_HE_LTF_AND_GI_FOR_HE_PPDUS_0_8US;
+		he_cap_elem->phy_cap_info[3] |=
+			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
+			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_QPSK;
+		he_cap_elem->phy_cap_info[6] |=
+			IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
+			IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
+			IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
+		he_cap_elem->phy_cap_info[7] |=
+			IEEE80211_HE_PHY_CAP7_POWER_BOOST_FACTOR_SUPP |
+			IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI;
+		he_cap_elem->phy_cap_info[8] |=
+			IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G |
+			IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
+			IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU |
+			IEEE80211_HE_PHY_CAP8_DCM_MAX_RU_484;
+		he_cap_elem->phy_cap_info[9] |=
+			IEEE80211_HE_PHY_CAP9_LONGER_THAN_16_SIGB_OFDM_SYM |
+			IEEE80211_HE_PHY_CAP9_NON_TRIGGERED_CQI_FEEDBACK |
+			IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
+			IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU |
+			IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB |
+			IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_SIGB;
+		break;
+	default:
+		break;
+	}
 
-		he_cap_elem->phy_cap_info[1] =
-			IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
-		he_cap_elem->phy_cap_info[2] =
-			IEEE80211_HE_PHY_CAP2_STBC_TX_UNDER_80MHZ |
-			IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ;
+	he_mcs->rx_mcs_80 = cpu_to_le16(mcs_map);
+	he_mcs->tx_mcs_80 = cpu_to_le16(mcs_map);
+	he_mcs->rx_mcs_160 = cpu_to_le16(mcs_map);
+	he_mcs->tx_mcs_160 = cpu_to_le16(mcs_map);
+
+	mt7996_set_stream_he_txbf_caps(phy, he_cap, iftype);
+
+	memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
+	if (he_cap_elem->phy_cap_info[6] &
+	    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT) {
+		mt7996_gen_ppe_thresh(he_cap->ppe_thres, nss);
+	} else {
+		he_cap_elem->phy_cap_info[9] |=
+			u8_encode_bits(IEEE80211_HE_PHY_CAP9_NOMINAL_PKT_PADDING_16US,
+				       IEEE80211_HE_PHY_CAP9_NOMINAL_PKT_PADDING_MASK);
+	}
 
-		switch (i) {
-		case NL80211_IFTYPE_AP:
-			he_cap_elem->mac_cap_info[0] |=
-				IEEE80211_HE_MAC_CAP0_TWT_RES;
-			he_cap_elem->mac_cap_info[2] |=
-				IEEE80211_HE_MAC_CAP2_BSR;
-			he_cap_elem->mac_cap_info[4] |=
-				IEEE80211_HE_MAC_CAP4_BQR;
-			he_cap_elem->mac_cap_info[5] |=
-				IEEE80211_HE_MAC_CAP5_OM_CTRL_UL_MU_DATA_DIS_RX;
-			he_cap_elem->phy_cap_info[3] |=
-				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
-				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_QPSK;
-			he_cap_elem->phy_cap_info[6] |=
-				IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
-				IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
-			he_cap_elem->phy_cap_info[9] |=
-				IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
-				IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU;
-			break;
-		case NL80211_IFTYPE_STATION:
-			he_cap_elem->mac_cap_info[1] |=
-				IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_16US;
-
-			if (band == NL80211_BAND_2GHZ)
-				he_cap_elem->phy_cap_info[0] |=
-					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_RU_MAPPING_IN_2G;
-			else
-				he_cap_elem->phy_cap_info[0] |=
-					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_RU_MAPPING_IN_5G;
-
-			he_cap_elem->phy_cap_info[1] |=
-				IEEE80211_HE_PHY_CAP1_DEVICE_CLASS_A |
-				IEEE80211_HE_PHY_CAP1_HE_LTF_AND_GI_FOR_HE_PPDUS_0_8US;
-			he_cap_elem->phy_cap_info[3] |=
-				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
-				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_QPSK;
-			he_cap_elem->phy_cap_info[6] |=
-				IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
-				IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
-				IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
-			he_cap_elem->phy_cap_info[7] |=
-				IEEE80211_HE_PHY_CAP7_POWER_BOOST_FACTOR_SUPP |
-				IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI;
-			he_cap_elem->phy_cap_info[8] |=
-				IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G |
-				IEEE80211_HE_PHY_CAP8_20MHZ_IN_160MHZ_HE_PPDU |
-				IEEE80211_HE_PHY_CAP8_80MHZ_IN_160MHZ_HE_PPDU |
-				IEEE80211_HE_PHY_CAP8_DCM_MAX_RU_484;
-			he_cap_elem->phy_cap_info[9] |=
-				IEEE80211_HE_PHY_CAP9_LONGER_THAN_16_SIGB_OFDM_SYM |
-				IEEE80211_HE_PHY_CAP9_NON_TRIGGERED_CQI_FEEDBACK |
-				IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
-				IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU |
-				IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB |
-				IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_SIGB;
-			break;
-		}
+	if (band == NL80211_BAND_6GHZ) {
+		u16 cap = IEEE80211_HE_6GHZ_CAP_TX_ANTPAT_CONS |
+			  IEEE80211_HE_6GHZ_CAP_RX_ANTPAT_CONS;
 
-		he_mcs->rx_mcs_80 = cpu_to_le16(mcs_map);
-		he_mcs->tx_mcs_80 = cpu_to_le16(mcs_map);
-		he_mcs->rx_mcs_160 = cpu_to_le16(mcs_map);
-		he_mcs->tx_mcs_160 = cpu_to_le16(mcs_map);
-		he_mcs->rx_mcs_80p80 = cpu_to_le16(mcs_map);
-		he_mcs->tx_mcs_80p80 = cpu_to_le16(mcs_map);
-
-		mt7996_set_stream_he_txbf_caps(phy, he_cap, i);
-
-		memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
-		if (he_cap_elem->phy_cap_info[6] &
-		    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT) {
-			mt7996_gen_ppe_thresh(he_cap->ppe_thres, nss);
-		} else {
-			he_cap_elem->phy_cap_info[9] |=
-				IEEE80211_HE_PHY_CAP9_NOMINAL_PKT_PADDING_16US;
-		}
+		cap |= u16_encode_bits(IEEE80211_HT_MPDU_DENSITY_2,
+				       IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START) |
+		       u16_encode_bits(IEEE80211_VHT_MAX_AMPDU_1024K,
+				       IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP) |
+		       u16_encode_bits(IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454,
+				       IEEE80211_HE_6GHZ_CAP_MAX_MPDU_LEN);
 
-		if (band == NL80211_BAND_6GHZ) {
-			u16 cap = IEEE80211_HE_6GHZ_CAP_TX_ANTPAT_CONS |
-				  IEEE80211_HE_6GHZ_CAP_RX_ANTPAT_CONS;
+		data->he_6ghz_capa.capa = cpu_to_le16(cap);
+	}
+}
 
-			cap |= u16_encode_bits(IEEE80211_HT_MPDU_DENSITY_2,
-					       IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START) |
-			       u16_encode_bits(IEEE80211_VHT_MAX_AMPDU_1024K,
-					       IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP) |
-			       u16_encode_bits(IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454,
-					       IEEE80211_HE_6GHZ_CAP_MAX_MPDU_LEN);
+static void
+__mt7996_set_stream_he_caps(struct mt7996_phy *phy,
+			    struct ieee80211_supported_band *sband,
+			    enum nl80211_band band)
+{
+	struct ieee80211_sband_iftype_data *data = phy->iftype[band];
+	int i, n = 0;
 
-			data[idx].he_6ghz_capa.capa = cpu_to_le16(cap);
+	for (i = 0; i < NUM_NL80211_IFTYPES; i++) {
+		switch (i) {
+		case NL80211_IFTYPE_STATION:
+		case NL80211_IFTYPE_AP:
+#ifdef CONFIG_MAC80211_MESH
+		case NL80211_IFTYPE_MESH_POINT:
+#endif
+			break;
+		default:
+			continue;
 		}
 
-		idx++;
+		data[n].types_mask = BIT(i);
+		mt7996_init_he_caps(phy, band, &data[n], i);
+
+		n++;
 	}
 
-	return idx;
+	sband->iftype_data = data;
+	sband->n_iftype_data = n;
 }
 
 void mt7996_set_stream_he_caps(struct mt7996_phy *phy)
 {
-	struct ieee80211_sband_iftype_data *data;
-	struct ieee80211_supported_band *band;
-	int n;
-
-	if (phy->mt76->cap.has_2ghz) {
-		data = phy->iftype[NL80211_BAND_2GHZ];
-		n = mt7996_init_he_caps(phy, NL80211_BAND_2GHZ, data);
-
-		band = &phy->mt76->sband_2g.sband;
-		band->iftype_data = data;
-		band->n_iftype_data = n;
-	}
-
-	if (phy->mt76->cap.has_5ghz) {
-		data = phy->iftype[NL80211_BAND_5GHZ];
-		n = mt7996_init_he_caps(phy, NL80211_BAND_5GHZ, data);
-
-		band = &phy->mt76->sband_5g.sband;
-		band->iftype_data = data;
-		band->n_iftype_data = n;
-	}
+	if (phy->mt76->cap.has_2ghz)
+		__mt7996_set_stream_he_caps(phy, &phy->mt76->sband_2g.sband,
+					    NL80211_BAND_2GHZ);
 
-	if (phy->mt76->cap.has_6ghz) {
-		data = phy->iftype[NL80211_BAND_6GHZ];
-		n = mt7996_init_he_caps(phy, NL80211_BAND_6GHZ, data);
+	if (phy->mt76->cap.has_5ghz)
+		__mt7996_set_stream_he_caps(phy, &phy->mt76->sband_5g.sband,
+					    NL80211_BAND_5GHZ);
 
-		band = &phy->mt76->sband_6g.sband;
-		band->iftype_data = data;
-		band->n_iftype_data = n;
-	}
+	if (phy->mt76->cap.has_6ghz)
+		__mt7996_set_stream_he_caps(phy, &phy->mt76->sband_6g.sband,
+					    NL80211_BAND_6GHZ);
 }
 
 int mt7996_register_device(struct mt7996_dev *dev)
-- 
2.25.1



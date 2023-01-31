Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53BBC38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcZrp6p93W/l9bpUulNq2/5fVebjH2RobnuR+0OEDxs=; b=qpZN1Px09L/9UgW9FqCZp/Kd+i
	c1jxdXvAxiIGw9MZwQqMpE32TZPNXtzoq+3Ionk9lEYqWEg3ndr1OsrmImBDeKelb/8EJF+j29yt5
	y49Api8UhHpp+N6QGTTm+BrZO6bJriyBvvNu4yRr6IJLvYcSPUP+HGXMCG+hOMgfvuMR/JVdHN9PT
	k7MKW3nTdYXGXF+RgfSvtUQ3GkR7XJZmDvilpgv6kiLojWyjekJM+mEEgzRd/L6pDB0wnA+7oTDU/
	bhIDtWm1JLPyZHyBCKPoGk2r2keZh7pP44onD+NkDyjNtzT8dUircNpWBhVZX5rWUi1TxoVbLkK8P
	B+iHkWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMny7-007Ry9-V5; Tue, 31 Jan 2023 10:34:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnNV-007Boo-5n
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 09:56:39 +0000
X-UUID: 8ab3d3cea14d11eda08d4d6090ec5a5c-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wcZrp6p93W/l9bpUulNq2/5fVebjH2RobnuR+0OEDxs=;
	b=C7eCnE85VdjLUhWyE+4MNAGuSGLMy9uBXI4LCQxwYPjUtZ1X7lCkvKNVrPqotvcLPyhNE/KaAZY3eH4nUuKfO5ZeRtQs3XBz0kKkCyubG//hsHud3YuSn9yilrwlGPO4BGJnuasc3EmMbsaxOc2IFLYXh6fmD4T28QeBM94LJuQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:68bd428b-8f9f-4991-b07f-06137d15e108,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:cdb2758d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 8ab3d3cea14d11eda08d4d6090ec5a5c-20230131
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2053786407; Tue, 31 Jan 2023 02:56:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 31 Jan 2023 17:36:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 17:36:29 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 09/13] wifi: mt76: mt7996: rework capability init
Date: Tue, 31 Jan 2023 17:36:07 +0800
Message-ID: <20230131093611.30914-10-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230131093611.30914-1-shayne.chen@mediatek.com>
References: <20230131093611.30914-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_015637_259598_EFE8026A 
X-CRM114-Status: GOOD (  16.62  )
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



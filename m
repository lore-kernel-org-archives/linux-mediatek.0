Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC4EC2BB85
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 08:55:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A84520787
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 08:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kdS+ZaE/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="o5OYu88G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A84520787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1bo2sSNeP8C9BswHFNv48pyuIzS2V2ZgezNNLLG+gU=; b=kdS+ZaE/CoM8SR
	mh0ab5OYdy+nsW27RsyYrXNM5b0He1heL5yyuJ8aPjmW09E9k3qQdu2bAuS5TnuAXTXoaFCH21vr5
	al+J+AVqNTkGC/9Cxb0dgfeRu9shgosFZm8KsN2Czit4IZajaYg8X5hqY34zKF83ZICcs25FJz+ZU
	cxdfVKDse7k5Rvcj4etmuyXEPGz66AIl4tooxFYoBdxTa1qGwXvzjrfQJQD3hbdiAzrL/kTSLBp1L
	qWReNZ2NuvMO8i8BwgrbfuFWharD/v/EHgQI/74TQPB+Inhxz0UPbQQvA8++hjrPpMunURONVRmsd
	8BfYDmrkMHcQV++IsWcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMpRY-0007pN-FW; Fri, 10 Apr 2020 08:55:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMpRR-00077m-Dx
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 08:55:16 +0000
X-UUID: c4a8cbfa81ba46eea47265c70abc7e10-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4uXn+os1/IcW03uHBuxYiBPsoa/Ch+N0VfEfejS8090=; 
 b=o5OYu88GXbJcVuUgam78jSUKoFJ5n+dQj5tekXXw8dBQXNdvLrpk7Q7paT7p/v5PjWsOgi3NP8FKGidFVFYP/SJWYEzX4KNRtWPhLnZua7UvvQAdBhdL8WK2m+dEUkwdmGCodE58LW9RMPp3X84VSppUWDEy0zzMrzfE1OXJsMc=;
X-UUID: c4a8cbfa81ba46eea47265c70abc7e10-20200410
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1011659490; Fri, 10 Apr 2020 00:55:05 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 01:55:03 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 16:55:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Apr 2020 16:55:01 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 11/16] mt76: mt7915: add HE capabilities support for peers
Date: Fri, 10 Apr 2020 16:54:48 +0800
Message-ID: <6406514bcda2d5b892b0f60b7c9a5364167a4cca.1586507878.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586507878.git.ryder.lee@mediatek.com>
References: <cover.1586507878.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2C357B4ACA4AF42FC0BC0DD59C1E43BA17A869FF4AB368983E3E51F40BADF0612000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_015513_516694_BF0C7ACA 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

Set peer's bsic HE capabilities through starec.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Tested-by: Shayne Chen <shayne.chen@mediatek.com>
Tested-by: Chih-Min Chen <chih-min.chen@mediatek.com>
Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Acked-by: Yiwei Chung <yiwei.chung@mediatek.com>
Acked-by: YF Luo <yf.luo@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 196 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 100 +++++++++
 2 files changed, 296 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 549e1460b184..74ca69ec3034 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -85,6 +85,8 @@ struct mt7915_fw_region {
 #define to_wcid_lo(id)			FIELD_GET(GENMASK(7, 0), (u16)id)
 #define to_wcid_hi(id)			FIELD_GET(GENMASK(9, 8), (u16)id)
 
+#define HE_PHY(p, c)			u8_get_bits(c, IEEE80211_HE_PHY_##p)
+#define HE_MAC(m, c)			u8_get_bits(c, IEEE80211_HE_MAC_##m)
 #define HW_TX_AMSDU_MAX_NUM		8
 
 static enum mt7915_cipher_type
@@ -1250,6 +1252,187 @@ mt7915_mcu_sta_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	basic->qos = sta->wme;
 }
 
+static void
+mt7915_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
+{
+	struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
+	struct ieee80211_he_cap_elem *elem = &he_cap->he_cap_elem;
+	struct sta_rec_he *he;
+	struct tlv *tlv;
+	u32 cap = 0;
+
+	tlv = mt7915_mcu_add_tlv(skb, STA_REC_HE, sizeof(*he));
+
+	he = (struct sta_rec_he *)tlv;
+
+	if (elem->mac_cap_info[0] & IEEE80211_HE_MAC_CAP0_HTC_HE)
+		cap |= STA_REC_HE_CAP_HTC;
+
+	if (elem->mac_cap_info[2] & IEEE80211_HE_MAC_CAP2_BSR)
+		cap |= STA_REC_HE_CAP_BSR;
+
+	if (elem->mac_cap_info[3] & IEEE80211_HE_MAC_CAP3_OMI_CONTROL)
+		cap |= STA_REC_HE_CAP_OM;
+
+	if (elem->mac_cap_info[4] & IEEE80211_HE_MAC_CAP4_AMDSU_IN_AMPDU)
+		cap |= STA_REC_HE_CAP_AMSDU_IN_AMPDU;
+
+	if (elem->mac_cap_info[4] & IEEE80211_HE_MAC_CAP4_BQR)
+		cap |= STA_REC_HE_CAP_BQR;
+
+	if (elem->phy_cap_info[0] &
+	    (IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_RU_MAPPING_IN_2G |
+	     IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_RU_MAPPING_IN_5G))
+		cap |= STA_REC_HE_CAP_BW20_RU242_SUPPORT;
+
+	if (elem->phy_cap_info[1] &
+	    IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD)
+		cap |= STA_REC_HE_CAP_LDPC;
+
+	if (elem->phy_cap_info[1] &
+	    IEEE80211_HE_PHY_CAP1_HE_LTF_AND_GI_FOR_HE_PPDUS_0_8US)
+		cap |= STA_REC_HE_CAP_SU_PPDU_1LTF_8US_GI;
+
+	if (elem->phy_cap_info[2] &
+	    IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US)
+		cap |= STA_REC_HE_CAP_NDP_4LTF_3DOT2MS_GI;
+
+	if (elem->phy_cap_info[2] &
+	    IEEE80211_HE_PHY_CAP2_STBC_TX_UNDER_80MHZ)
+		cap |= STA_REC_HE_CAP_LE_EQ_80M_TX_STBC;
+
+	if (elem->phy_cap_info[2] &
+	    IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ)
+		cap |= STA_REC_HE_CAP_LE_EQ_80M_RX_STBC;
+
+	if (elem->phy_cap_info[6] &
+	    IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE)
+		cap |= STA_REC_HE_CAP_PARTIAL_BW_EXT_RANGE;
+
+	if (elem->phy_cap_info[7] &
+	    IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI)
+		cap |= STA_REC_HE_CAP_SU_MU_PPDU_4LTF_8US_GI;
+
+	if (elem->phy_cap_info[7] &
+	    IEEE80211_HE_PHY_CAP7_STBC_TX_ABOVE_80MHZ)
+		cap |= STA_REC_HE_CAP_GT_80M_TX_STBC;
+
+	if (elem->phy_cap_info[7] &
+	    IEEE80211_HE_PHY_CAP7_STBC_RX_ABOVE_80MHZ)
+		cap |= STA_REC_HE_CAP_GT_80M_RX_STBC;
+
+	if (elem->phy_cap_info[8] &
+	    IEEE80211_HE_PHY_CAP8_HE_ER_SU_PPDU_4XLTF_AND_08_US_GI)
+		cap |= STA_REC_HE_CAP_ER_SU_PPDU_4LTF_8US_GI;
+
+	if (elem->phy_cap_info[8] &
+	    IEEE80211_HE_PHY_CAP8_HE_ER_SU_1XLTF_AND_08_US_GI)
+		cap |= STA_REC_HE_CAP_ER_SU_PPDU_1LTF_8US_GI;
+
+	if (elem->phy_cap_info[9] &
+	    IEEE80211_HE_PHY_CAP9_NON_TRIGGERED_CQI_FEEDBACK)
+		cap |= STA_REC_HE_CAP_TRIG_CQI_FK;
+
+	if (elem->phy_cap_info[9] &
+	    IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU)
+		cap |= STA_REC_HE_CAP_TX_1024QAM_UNDER_RU242;
+
+	if (elem->phy_cap_info[9] &
+	    IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU)
+		cap |= STA_REC_HE_CAP_RX_1024QAM_UNDER_RU242;
+
+	he->he_cap = cpu_to_le32(cap);
+
+	switch (sta->bandwidth) {
+	case IEEE80211_STA_RX_BW_160:
+		if (elem->phy_cap_info[0] &
+		    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G)
+			he->max_nss_mcs[CMD_HE_MCS_BW8080] =
+				he_cap->he_mcs_nss_supp.rx_mcs_80p80;
+
+		he->max_nss_mcs[CMD_HE_MCS_BW160] =
+				he_cap->he_mcs_nss_supp.rx_mcs_160;
+		/* fall through */
+	default:
+		he->max_nss_mcs[CMD_HE_MCS_BW80] =
+				he_cap->he_mcs_nss_supp.rx_mcs_80;
+		break;
+	}
+
+	he->t_frame_dur =
+		HE_MAC(CAP1_TF_MAC_PAD_DUR_MASK, elem->mac_cap_info[1]);
+	he->max_ampdu_exp =
+		HE_MAC(CAP3_MAX_AMPDU_LEN_EXP_MASK, elem->mac_cap_info[3]);
+
+	he->bw_set =
+		HE_PHY(CAP0_CHANNEL_WIDTH_SET_MASK, elem->phy_cap_info[0]);
+	he->device_class =
+		HE_PHY(CAP1_DEVICE_CLASS_A, elem->phy_cap_info[1]);
+	he->punc_pream_rx =
+		HE_PHY(CAP1_PREAMBLE_PUNC_RX_MASK, elem->phy_cap_info[1]);
+
+	he->dcm_tx_mode =
+		HE_PHY(CAP3_DCM_MAX_CONST_TX_MASK, elem->phy_cap_info[3]);
+	he->dcm_tx_max_nss =
+		HE_PHY(CAP3_DCM_MAX_TX_NSS_2, elem->phy_cap_info[3]);
+	he->dcm_rx_mode =
+		HE_PHY(CAP3_DCM_MAX_CONST_RX_MASK, elem->phy_cap_info[3]);
+	he->dcm_rx_max_nss =
+		HE_PHY(CAP3_DCM_MAX_RX_NSS_2, elem->phy_cap_info[3]);
+	he->dcm_rx_max_nss =
+		HE_PHY(CAP8_DCM_MAX_RU_MASK, elem->phy_cap_info[8]);
+
+	he->pkt_ext = 2;
+}
+
+static void
+mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
+{
+	struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
+	struct ieee80211_he_cap_elem *elem = &he_cap->he_cap_elem;
+	struct sta_rec_muru *muru;
+	struct tlv *tlv;
+
+	tlv = mt7915_mcu_add_tlv(skb, STA_REC_MURU, sizeof(*muru));
+
+	muru = (struct sta_rec_muru *)tlv;
+	muru->cfg.ofdma_dl_en = true;
+	muru->cfg.ofdma_ul_en = true;
+	muru->cfg.mimo_dl_en = true;
+	muru->cfg.mimo_ul_en = true;
+
+	muru->ofdma_dl.punc_pream_rx =
+		HE_PHY(CAP1_PREAMBLE_PUNC_RX_MASK, elem->phy_cap_info[1]);
+	muru->ofdma_dl.he_20m_in_40m_2g =
+		HE_PHY(CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G, elem->phy_cap_info[8]);
+	muru->ofdma_dl.he_20m_in_160m =
+		HE_PHY(CAP8_20MHZ_IN_160MHZ_HE_PPDU, elem->phy_cap_info[8]);
+	muru->ofdma_dl.he_80m_in_160m =
+		HE_PHY(CAP8_80MHZ_IN_160MHZ_HE_PPDU, elem->phy_cap_info[8]);
+	muru->ofdma_dl.lt16_sigb = 0;
+	muru->ofdma_dl.rx_su_comp_sigb = 0;
+	muru->ofdma_dl.rx_su_non_comp_sigb = 0;
+
+	muru->ofdma_ul.t_frame_dur =
+		HE_MAC(CAP1_TF_MAC_PAD_DUR_MASK, elem->mac_cap_info[1]);
+	muru->ofdma_ul.mu_cascading =
+		HE_MAC(CAP2_MU_CASCADING, elem->mac_cap_info[2]);
+	muru->ofdma_ul.uo_ra =
+		HE_MAC(CAP3_OFDMA_RA, elem->mac_cap_info[3]);
+	muru->ofdma_ul.he_2x996_tone = 0;
+	muru->ofdma_ul.rx_t_frame_11ac = 0;
+
+	muru->mimo_dl.vht_mu_bfee =
+		!!(sta->vht_cap.cap & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE);
+	muru->mimo_dl.partial_bw_dl_mimo =
+		HE_PHY(CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO, elem->phy_cap_info[6]);
+
+	muru->mimo_ul.full_ul_mimo =
+		HE_PHY(CAP2_UL_MU_FULL_MU_MIMO, elem->phy_cap_info[2]);
+	muru->mimo_ul.partial_ul_mimo =
+		HE_PHY(CAP2_UL_MU_PARTIAL_MU_MIMO, elem->phy_cap_info[2]);
+}
+
 static void
 mt7915_mcu_sta_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 		   struct ieee80211_sta *sta)
@@ -1293,6 +1476,14 @@ mt7915_mcu_sta_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 		vht->vht_rx_mcs_map = sta->vht_cap.vht_mcs.rx_mcs_map;
 		vht->vht_tx_mcs_map = sta->vht_cap.vht_mcs.tx_mcs_map;
 	}
+
+	/* starec he */
+	if (sta->he_cap.has_he)
+		mt7915_mcu_sta_he_tlv(skb, sta);
+
+	/* starec muru */
+	if (sta->he_cap.has_he || sta->vht_cap.vht_supported)
+		mt7915_mcu_sta_muru_tlv(skb, sta);
 }
 
 static void
@@ -1494,6 +1685,11 @@ mt7915_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb, struct mt7915_dev *dev,
 		}
 	}
 
+	if (sta->he_cap.has_he) {
+		ra->supp_mode |= MODE_HE;
+		cap |= STA_CAP_HE;
+	}
+
 	ra->sta_status = cpu_to_le32(cap);
 
 	switch (BIT(fls(ra->supp_mode) - 1)) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index b2f37b87117c..52b420210908 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -669,6 +669,75 @@ struct sta_rec_vht {
 	u8 rsv[3];
 } __packed;
 
+struct sta_rec_muru {
+	__le16 tag;
+	__le16 len;
+
+	struct {
+		bool ofdma_dl_en;
+		bool ofdma_ul_en;
+		bool mimo_dl_en;
+		bool mimo_ul_en;
+		bool rsv[4];
+	} cfg;
+
+	struct {
+		u8 punc_pream_rx;
+		bool he_20m_in_40m_2g;
+		bool he_20m_in_160m;
+		bool he_80m_in_160m;
+		bool lt16_sigb;
+		bool rx_su_comp_sigb;
+		bool rx_su_non_comp_sigb;
+		bool rsv;
+	} ofdma_dl;
+
+	struct {
+		u8 t_frame_dur;
+		u8 mu_cascading;
+		u8 uo_ra;
+		u8 he_2x996_tone;
+		u8 rx_t_frame_11ac;
+		u8 rsv[3];
+	} ofdma_ul;
+
+	struct {
+		bool vht_mu_bfee;
+		bool partial_bw_dl_mimo;
+		u8 rsv[2];
+	} mimo_dl;
+
+	struct {
+		bool full_ul_mimo;
+		bool partial_ul_mimo;
+		u8 rsv[2];
+	} mimo_ul;
+} __packed;
+
+struct sta_rec_he {
+	__le16 tag;
+	__le16 len;
+
+	__le32 he_cap;
+
+	u8 t_frame_dur;
+	u8 max_ampdu_exp;
+	u8 bw_set;
+	u8 device_class;
+	u8 dcm_tx_mode;
+	u8 dcm_tx_max_nss;
+	u8 dcm_rx_mode;
+	u8 dcm_rx_max_nss;
+	u8 dcm_max_ru;
+	u8 punc_pream_rx;
+	u8 pkt_ext;
+	u8 rsv1;
+
+	__le16 max_nss_mcs[CMD_HE_MCS_BW_NUM];
+
+	u8 rsv2[2];
+} __packed;
+
 struct sta_rec_ba {
 	__le16 tag;
 	__le16 len;
@@ -823,10 +892,12 @@ enum {
 #define MT7915_STA_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +	\
 					 sizeof(struct sta_rec_basic) +	\
 					 sizeof(struct sta_rec_ht) +	\
+					 sizeof(struct sta_rec_he) +	\
 					 sizeof(struct sta_rec_ba) +	\
 					 sizeof(struct sta_rec_vht) +	\
 					 sizeof(struct tlv) +		\
 					 sizeof(struct sta_rec_amsdu) +	\
+					 sizeof(struct sta_rec_muru) +	\
 					 sizeof(struct sta_rec_sec) +	\
 					 sizeof(struct sta_rec_ra) +	\
 					 MT7915_WTBL_UPDATE_MAX_SIZE)
@@ -854,6 +925,7 @@ enum {
 #define MODE_OFDM			BIT(1)
 #define MODE_HT				BIT(2)
 #define MODE_VHT			BIT(3)
+#define MODE_HE				BIT(4)
 
 #define STA_CAP_WMM			BIT(0)
 #define STA_CAP_SGI_20			BIT(4)
@@ -868,5 +940,33 @@ enum {
 #define STA_CAP_LDPC			BIT(24)
 #define STA_CAP_HT			BIT(26)
 #define STA_CAP_VHT			BIT(27)
+#define STA_CAP_HE			BIT(28)
+
+/* HE MAC */
+#define STA_REC_HE_CAP_HTC			BIT(0)
+#define STA_REC_HE_CAP_BQR			BIT(1)
+#define STA_REC_HE_CAP_BSR			BIT(2)
+#define STA_REC_HE_CAP_OM			BIT(3)
+#define STA_REC_HE_CAP_AMSDU_IN_AMPDU		BIT(4)
+/* HE PHY */
+#define STA_REC_HE_CAP_DUAL_BAND		BIT(5)
+#define STA_REC_HE_CAP_LDPC			BIT(6)
+#define STA_REC_HE_CAP_TRIG_CQI_FK		BIT(7)
+#define STA_REC_HE_CAP_PARTIAL_BW_EXT_RANGE	BIT(8)
+/* STBC */
+#define STA_REC_HE_CAP_LE_EQ_80M_TX_STBC	BIT(9)
+#define STA_REC_HE_CAP_LE_EQ_80M_RX_STBC	BIT(10)
+#define STA_REC_HE_CAP_GT_80M_TX_STBC		BIT(11)
+#define STA_REC_HE_CAP_GT_80M_RX_STBC		BIT(12)
+/* GI */
+#define STA_REC_HE_CAP_SU_PPDU_1LTF_8US_GI	BIT(13)
+#define STA_REC_HE_CAP_SU_MU_PPDU_4LTF_8US_GI	BIT(14)
+#define STA_REC_HE_CAP_ER_SU_PPDU_1LTF_8US_GI	BIT(15)
+#define STA_REC_HE_CAP_ER_SU_PPDU_4LTF_8US_GI	BIT(16)
+#define STA_REC_HE_CAP_NDP_4LTF_3DOT2MS_GI	BIT(17)
+/* 242 TONE */
+#define STA_REC_HE_CAP_BW20_RU242_SUPPORT	BIT(18)
+#define STA_REC_HE_CAP_TX_1024QAM_UNDER_RU242	BIT(19)
+#define STA_REC_HE_CAP_RX_1024QAM_UNDER_RU242	BIT(20)
 
 #endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFADDC7EE24
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQw3tj6Sxrj75MWr1uIcOoFYLt64m76Khs1O013gQGQ=; b=LS6prMjc9ppwnkcW6o7lwkI0qN
	KOVSHP9XaoyzYPPGoLp+lv63Ybo/5MPLyJW+MBA/t6zRPB8RZDuTDpG/aGSorhEz9f335WYK56QeL
	A7UVRibQezOmYAG1MvhEmFQNXP643FXroDlBfwW2tpf8KkiAA0+60DWZ2jWrTlWE7PpZruEyrCDBY
	PoQ6PFLjyM+RLA0QpPLy6KwUQuP7ssz6bT5WjOdStkfHAF/qNhVTcT+B52EBK4atTJKvtJUXdQw33
	O580MMMAp+nWqKlbF+Py7vuG8cLUUqGqR5NRixapr4Df4TSR22HftnKqB3SYyJSbgrLXIKrC0l9rh
	+E01WIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q56m2-007Gnk-2R;
	Fri, 02 Jun 2023 15:33:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q56lz-007GmZ-2t
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 15:33:05 +0000
X-UUID: c0770af4015a11ee83ed1395ce914268-20230602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NQw3tj6Sxrj75MWr1uIcOoFYLt64m76Khs1O013gQGQ=;
	b=WU/z+qXbCb8PHGU7o3XxfrcvyxHl2AzdAackOQBUKebWeMSuYDKs4xJLZsIG9OCVdnUahgHeX/wWxIamnlc1SODC9rPoF+S2hj73P1U6HmHN3PPVJa8Y4wNpAXAhvM3HT8X2wloiCkjUdUTA3wOblUH6QXv4vH0lM9hS8XKE7tY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:a164b429-02a0-44d9-8123-b6d8f1bfd41a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:481a673d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: c0770af4015a11ee83ed1395ce914268-20230602
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 602937233; Fri, 02 Jun 2023 08:32:58 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 2 Jun 2023 23:21:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 2 Jun 2023 23:21:52 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, MeiChia Chiu
	<MeiChia.Chiu@mediatek.com>, MeiChia Chiu <meichia.chiu@mediatek.com>, Shayne
 Chen <shayne.chen@mediatek.com>
Subject: [PATCH 11/12] wifi: mt76: mt7996: add muru support
Date: Fri, 2 Jun 2023 23:21:07 +0800
Message-ID: <20230602152108.26860-11-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230602152108.26860-1-shayne.chen@mediatek.com>
References: <20230602152108.26860-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_083303_943512_D1835997 
X-CRM114-Status: GOOD (  12.89  )
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

From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>

Add sta_rec_muru() fw command to support MU-MIMO and OFDMA features.

Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  3 +-
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 56 ++++++++++++++++++-
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 3790d68525e5..48bced4e2e5d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -519,7 +519,8 @@ struct sta_rec_muru {
 		u8 uo_ra;
 		u8 he_2x996_tone;
 		u8 rx_t_frame_11ac;
-		u8 rsv[3];
+		u8 rx_ctrl_frame_to_mbss;
+		u8 rsv[2];
 	} ofdma_ul;
 
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 48782b53f5d4..c50dcce21315 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1102,6 +1102,59 @@ mt7996_mcu_sta_amsdu_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 	}
 }
 
+static void
+mt7996_mcu_sta_muru_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
+			struct ieee80211_vif *vif, struct ieee80211_sta *sta)
+{
+	struct ieee80211_he_cap_elem *elem = &sta->deflink.he_cap.he_cap_elem;
+	struct sta_rec_muru *muru;
+	struct tlv *tlv;
+
+	if (vif->type != NL80211_IFTYPE_STATION &&
+	    vif->type != NL80211_IFTYPE_AP)
+		return;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_MURU, sizeof(*muru));
+
+	muru = (struct sta_rec_muru *)tlv;
+	muru->cfg.mimo_dl_en = vif->bss_conf.eht_mu_beamformer ||
+			       vif->bss_conf.he_mu_beamformer ||
+			       vif->bss_conf.vht_mu_beamformer ||
+			       vif->bss_conf.vht_mu_beamformee;
+	muru->cfg.ofdma_dl_en = true;
+
+	if (sta->deflink.vht_cap.vht_supported)
+		muru->mimo_dl.vht_mu_bfee =
+			!!(sta->deflink.vht_cap.cap & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE);
+
+	if (!sta->deflink.he_cap.has_he)
+		return;
+
+	muru->mimo_dl.partial_bw_dl_mimo =
+		HE_PHY(CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO, elem->phy_cap_info[6]);
+
+	muru->mimo_ul.full_ul_mimo =
+		HE_PHY(CAP2_UL_MU_FULL_MU_MIMO, elem->phy_cap_info[2]);
+	muru->mimo_ul.partial_ul_mimo =
+		HE_PHY(CAP2_UL_MU_PARTIAL_MU_MIMO, elem->phy_cap_info[2]);
+
+	muru->ofdma_dl.punc_pream_rx =
+		HE_PHY(CAP1_PREAMBLE_PUNC_RX_MASK, elem->phy_cap_info[1]);
+	muru->ofdma_dl.he_20m_in_40m_2g =
+		HE_PHY(CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G, elem->phy_cap_info[8]);
+	muru->ofdma_dl.he_20m_in_160m =
+		HE_PHY(CAP8_20MHZ_IN_160MHZ_HE_PPDU, elem->phy_cap_info[8]);
+	muru->ofdma_dl.he_80m_in_160m =
+		HE_PHY(CAP8_80MHZ_IN_160MHZ_HE_PPDU, elem->phy_cap_info[8]);
+
+	muru->ofdma_ul.t_frame_dur =
+		HE_MAC(CAP1_TF_MAC_PAD_DUR_MASK, elem->mac_cap_info[1]);
+	muru->ofdma_ul.mu_cascading =
+		HE_MAC(CAP2_MU_CASCADING, elem->mac_cap_info[2]);
+	muru->ofdma_ul.uo_ra =
+		HE_MAC(CAP3_OFDMA_RA, elem->mac_cap_info[3]);
+}
+
 static inline bool
 mt7996_is_ebf_supported(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 			struct ieee80211_sta *sta, bool bfee)
@@ -1779,7 +1832,8 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 		mt7996_mcu_sta_he_6g_tlv(skb, sta);
 		/* starec eht */
 		mt7996_mcu_sta_eht_tlv(skb, sta);
-		/* TODO: starec muru */
+		/* starec muru */
+		mt7996_mcu_sta_muru_tlv(dev, skb, vif, sta);
 		/* starec bfee */
 		mt7996_mcu_sta_bfee_tlv(dev, skb, vif, sta);
 		/* starec hdr trans */
-- 
2.39.2



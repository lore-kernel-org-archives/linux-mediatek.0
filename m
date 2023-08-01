Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D146C001DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VS8gSsVuMwZr/o3K+zhlxl36PX/Dz5r/CuPxCYPVdQ=; b=Nw809jPzH7jqpjudFAbz5N45XN
	T4bYvQ3ARHR12r5/hfTzp9lWzndaf+tgwPEkjgTHt4Kvsm0RrlI9UkizX7qEyCGmIJtecvYnp7Ghx
	NNtvqO4qbEkl5KoYsXbkiQ9hvkoWcDMJSzIlSbLlOQ4VNt6IWjw6VEsFpnJxbjpY8qjt4lSoZ51Aq
	k5mrYm6rIjwj2BMnf74SGeRwbxOnp8zmmG3onuSuYCuzX2Aet8Oh06tOElK0osVYNDMQf4xY/Vl4k
	hQFdxHtS96GIVzhX0IpMhg7VkRjiPgBJAAjncjUxdxpswB/xPNPDiCBfop3xoDgZfiphc3orpIUGb
	ZhtoCBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRo-002bbn-1S;
	Tue, 01 Aug 2023 14:34:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRl-002bYU-2O
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 14:34:03 +0000
X-UUID: 70fd9982307811ee912e1518a6540028-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0VS8gSsVuMwZr/o3K+zhlxl36PX/Dz5r/CuPxCYPVdQ=;
	b=NB93qlTKbId5CTaQVrrC/UY/yhb+fBCoIHAFpubjJMB1B+vs8yfmjmKIoh0U81YylX4JBcvc3SCYLOEIvj4sIc836yZUFCDDU1b/oqYhFl6TU/kx7oJ8tL5ssj7tRiIWVG+LqWFr7poypvNzMau9/dHFlpcZu5fJnRz6BT7DBdU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:29db034d-5a12-4fe1-8a94-b291664626ec,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.30,REQID:29db034d-5a12-4fe1-8a94-b291664626ec,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8,CLOUDID:6b8c91d2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:2308012233533W5STOB3,BulkQuantity:1,Recheck:0,SF:28|17|19|48|38|29,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: 70fd9982307811ee912e1518a6540028-20230801
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1462038503; Tue, 01 Aug 2023 07:33:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 22:33:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 22:33:51 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 4/8] wifi: mt76: connac: add eht support for phy mode config
Date: Tue, 1 Aug 2023 22:30:28 +0800
Message-ID: <fb4d362a45a3989b725191ab98a43a6593e37280.1690863143.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1690863143.git.deren.wu@mediatek.com>
References: <cover.1690863143.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_073401_787597_C41D6A6B 
X-CRM114-Status: GOOD (  13.79  )
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

Add eht configuration support in existing function
mt76_connac_get_phy_mode_v2() and export it for mt7925.

This is a preliminary patch to support mt7925 driver.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 12 +++++++++++-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h |  4 ++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index dfbe31ae4b14..c0f129dd8aef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -780,19 +780,21 @@ mt76_connac_mcu_sta_he_tlv_v2(struct sk_buff *skb, struct ieee80211_sta *sta)
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_sta_he_tlv_v2);
 
-static u8
+u8
 mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 			    enum nl80211_band band, struct ieee80211_sta *sta)
 {
 	struct ieee80211_sta_ht_cap *ht_cap;
 	struct ieee80211_sta_vht_cap *vht_cap;
 	const struct ieee80211_sta_he_cap *he_cap;
+	const struct ieee80211_sta_eht_cap *eht_cap;
 	u8 mode = 0;
 
 	if (sta) {
 		ht_cap = &sta->deflink.ht_cap;
 		vht_cap = &sta->deflink.vht_cap;
 		he_cap = &sta->deflink.he_cap;
+		eht_cap = &sta->deflink.eht_cap;
 	} else {
 		struct ieee80211_supported_band *sband;
 
@@ -800,6 +802,7 @@ mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 		ht_cap = &sband->ht_cap;
 		vht_cap = &sband->vht_cap;
 		he_cap = ieee80211_get_he_iftype_cap(sband, vif->type);
+		eht_cap = ieee80211_get_eht_iftype_cap(sband, vif->type);
 	}
 
 	if (band == NL80211_BAND_2GHZ) {
@@ -810,6 +813,9 @@ mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 		if (he_cap && he_cap->has_he)
 			mode |= PHY_TYPE_BIT_HE;
+
+		if (eht_cap && eht_cap->has_eht)
+			mode |= PHY_TYPE_BIT_BE;
 	} else if (band == NL80211_BAND_5GHZ || band == NL80211_BAND_6GHZ) {
 		mode |= PHY_TYPE_BIT_OFDM;
 
@@ -821,10 +827,14 @@ mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 		if (he_cap && he_cap->has_he)
 			mode |= PHY_TYPE_BIT_HE;
+
+		if (eht_cap && eht_cap->has_eht)
+			mode |= PHY_TYPE_BIT_BE;
 	}
 
 	return mode;
 }
+EXPORT_SYMBOL_GPL(mt76_connac_get_phy_mode_v2);
 
 void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 			     struct ieee80211_sta *sta,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 879a66564c54..4b64426d371d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -919,6 +919,7 @@ enum {
 	PHY_TYPE_HT_INDEX,
 	PHY_TYPE_VHT_INDEX,
 	PHY_TYPE_HE_INDEX,
+	PHY_TYPE_BE_INDEX,
 	PHY_TYPE_INDEX_NUM
 };
 
@@ -928,6 +929,7 @@ enum {
 #define PHY_TYPE_BIT_HT				BIT(PHY_TYPE_HT_INDEX)
 #define PHY_TYPE_BIT_VHT			BIT(PHY_TYPE_VHT_INDEX)
 #define PHY_TYPE_BIT_HE				BIT(PHY_TYPE_HE_INDEX)
+#define PHY_TYPE_BIT_BE				BIT(PHY_TYPE_BE_INDEX)
 
 #define MT_WTBL_RATE_TX_MODE			GENMASK(9, 6)
 #define MT_WTBL_RATE_MCS			GENMASK(5, 0)
@@ -1808,6 +1810,8 @@ int mt76_connac_mcu_sta_update_hdr_trans(struct mt76_dev *dev,
 					 struct ieee80211_vif *vif,
 					 struct mt76_wcid *wcid, int cmd);
 void mt76_connac_mcu_sta_he_tlv_v2(struct sk_buff *skb, struct ieee80211_sta *sta);
+u8 mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, struct ieee80211_vif *vif,
+			       enum nl80211_band band, struct ieee80211_sta *sta);
 int mt76_connac_mcu_wtbl_update_hdr_trans(struct mt76_dev *dev,
 					  struct ieee80211_vif *vif,
 					  struct ieee80211_sta *sta);
-- 
2.18.0



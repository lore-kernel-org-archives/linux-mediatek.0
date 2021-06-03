Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C166C47096
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 23:58:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251F6613B3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 23:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251F6613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TF8K6NmiNy9U+WNk2KfXfBKrZrMo1VuinGvt16IzwdI=; b=0jKU6+YUj6IB2D
	besELLimU4HybyAa97nDPiyPnmYekU//U0Nzht5Ym9Ww+NymybG+ieMJIMVGNOuYESUmuCywxLGK5
	1mdI0xG0nwMofgtHdsWBK4fPrfQDpvw8voJrQhjWC/0cqsrqxPPOonFUTs+SSrDpxidDFCiyos5W/
	D3+8Q9LTT+duXUa/IeNtIkH1mQsDdn3m7uQE+gExWLcrFDXi/RksSL2pMHiJkAc4tjUcmDbSlZce+
	KISccJcsuCwGvNy/oP2Z+gdJjAUT2z+zCMcNxH1nRtf4J3Bswo6j/FfUR8lZykNdrY9KfU5BSpPqD
	5Hke/1yApT0y9jIYtyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loxES-00AzgK-10; Thu, 03 Jun 2021 23:58:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loxEN-00Azf7-Av
 for linux-mediatek@lists.infradead.org; Thu, 03 Jun 2021 23:58:34 +0000
X-UUID: 4d628360950147608a10e0d6f500bf52-20210603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CfIyPvVM4jeOlmbEX0wi2UUgeRWZPwpQ4OmZWnb+sq4=; 
 b=Kg96f1U2GtILfdVfvfb1nuXutmfwSnUeYCRCyPEMEamfAfKMn9I3zGmE9lkVE2QiV/wK1ylshaBUWqXszW9wdJVyLLHDwYwbgZxeEb1dfMONuY84Z1CmzAvZgN/n1mf6WU9svmseg2R6cIenUVa6FV6U3RJ+m7h2ZgxUlhhUunc=;
X-UUID: 4d628360950147608a10e0d6f500bf52-20210603
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 705709674; Thu, 03 Jun 2021 16:58:23 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 16:58:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Jun 2021 07:58:07 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Jun 2021 07:58:07 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v4] mt76: mt7921: fix sta_state incorrect implementation
Date: Fri, 4 Jun 2021 07:58:07 +0800
Message-ID: <5ead84b2d377f3763f0dc6fd9cb04d158212e3ea.1622764570.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_165832_833740_A7E56616 
X-CRM114-Status: GOOD (  18.33  )
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

From: Sean Wang <sean.wang@mediatek.com>

When .sta_state is implemented, mac80211 assumes that the station entry is
usable after the NOTEXIST->NONE transition.

So we should create the sta entry as early as possible in order that
mac80211 pass assoc/auth frames to mt76 with the newly created sta entry,
and add .sta_assoc to mt76 core to refresh the sta entry again when sta is
being associated.

Fixes: 8aa5a9b7361c ("mt76: mt7921: enable deep sleep at runtime")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  8 ++-
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 20 +++---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 17 ++++--
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 61 +++++++++----------
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  9 ++-
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  7 ++-
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  1 +
 7 files changed, 69 insertions(+), 54 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index ea1f23e99ca1..f8a09692d3e4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1028,9 +1028,10 @@ mt7615_mcu_wtbl_sta_add(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	if (IS_ERR(sskb))
 		return PTR_ERR(sskb);
 
-	mt76_connac_mcu_sta_basic_tlv(sskb, vif, sta, enable);
+	mt76_connac_mcu_sta_basic_tlv(sskb, vif, sta, enable, true);
 	if (enable && sta)
-		mt76_connac_mcu_sta_tlv(phy->mt76, sskb, sta, vif, 0);
+		mt76_connac_mcu_sta_tlv(phy->mt76, sskb, sta, vif, 0,
+					MT76_STA_INFO_STATE_ASSOC);
 
 	wtbl_hdr = mt76_connac_mcu_alloc_wtbl_req(&dev->mt76, &msta->wcid,
 						  WTBL_RESET_AND_SET, NULL,
@@ -1157,11 +1158,12 @@ __mt7615_mcu_add_sta(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		.vif = vif,
 		.offload_fw = offload_fw,
 		.enable = enable,
+		.newly = true,
 		.cmd = cmd,
 	};
 
 	info.wcid = sta ? (struct mt76_wcid *)sta->drv_priv : &mvif->sta.wcid;
-	return mt76_connac_mcu_add_sta_cmd(phy, &info);
+	return mt76_connac_mcu_sta_cmd(phy, &info);
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 7b036c700b28..5786041caf41 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -304,7 +304,7 @@ EXPORT_SYMBOL_GPL(mt76_connac_mcu_alloc_wtbl_req);
 void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *skb,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
-				   bool enable)
+				   bool enable, bool newly)
 {
 	struct sta_rec_basic *basic;
 	struct tlv *tlv;
@@ -316,7 +316,8 @@ void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *skb,
 	basic->extra_info = cpu_to_le16(EXTRA_INFO_VER);
 
 	if (enable) {
-		basic->extra_info |= cpu_to_le16(EXTRA_INFO_NEW);
+		if (newly)
+			basic->extra_info |= cpu_to_le16(EXTRA_INFO_NEW);
 		basic->conn_state = CONN_STATE_PORT_SECURE;
 	} else {
 		basic->conn_state = CONN_STATE_DISCONNECT;
@@ -709,7 +710,7 @@ mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 			     struct ieee80211_sta *sta,
 			     struct ieee80211_vif *vif,
-			     u8 rcpi)
+			     u8 rcpi, u8 sta_state)
 {
 	struct cfg80211_chan_def *chandef = &mphy->chandef;
 	enum nl80211_band band = chandef->chan->band;
@@ -770,7 +771,7 @@ void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_STATE, sizeof(*state));
 	state = (struct sta_rec_state *)tlv;
-	state->state = 2;
+	state->state = sta_state;
 
 	if (sta->vht_cap.vht_supported) {
 		state->vht_opmode = sta->bandwidth;
@@ -862,8 +863,8 @@ void mt76_connac_mcu_wtbl_ht_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_wtbl_ht_tlv);
 
-int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
-				struct mt76_sta_cmd_info *info)
+int mt76_connac_mcu_sta_cmd(struct mt76_phy *phy,
+			    struct mt76_sta_cmd_info *info)
 {
 	struct mt76_vif *mvif = (struct mt76_vif *)info->vif->drv_priv;
 	struct mt76_dev *dev = phy->dev;
@@ -877,10 +878,11 @@ int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
 
 	if (info->sta || !info->offload_fw)
 		mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta,
-					      info->enable);
+					      info->enable, info->newly);
 	if (info->sta && info->enable)
 		mt76_connac_mcu_sta_tlv(phy, skb, info->sta,
-					info->vif, info->rcpi);
+					info->vif, info->rcpi,
+					info->state);
 
 	sta_wtbl = mt76_connac_mcu_add_tlv(skb, STA_REC_WTBL,
 					   sizeof(struct tlv));
@@ -904,7 +906,7 @@ int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
 
 	return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
 }
-EXPORT_SYMBOL_GPL(mt76_connac_mcu_add_sta_cmd);
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_sta_cmd);
 
 void mt76_connac_mcu_wtbl_ba_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				 struct ieee80211_ampdu_params *params,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 258b262c7c23..2c1c93122c2d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -904,6 +904,12 @@ struct mt76_connac_suspend_tlv {
 	u8 pad[5];
 } __packed;
 
+enum mt76_sta_info_state {
+	MT76_STA_INFO_STATE_NONE,
+	MT76_STA_INFO_STATE_AUTH,
+	MT76_STA_INFO_STATE_ASSOC
+};
+
 struct mt76_sta_cmd_info {
 	struct ieee80211_sta *sta;
 	struct mt76_wcid *wcid;
@@ -912,8 +918,10 @@ struct mt76_sta_cmd_info {
 
 	bool offload_fw;
 	bool enable;
+	bool newly;
 	int cmd;
 	u8 rcpi;
+	u8 state;
 };
 
 #define MT_SKU_POWER_LIMIT	161
@@ -983,7 +991,8 @@ int mt76_connac_mcu_set_channel_domain(struct mt76_phy *phy);
 int mt76_connac_mcu_set_vif_ps(struct mt76_dev *dev, struct ieee80211_vif *vif);
 void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *skb,
 				   struct ieee80211_vif *vif,
-				   struct ieee80211_sta *sta, bool enable);
+				   struct ieee80211_sta *sta, bool enable,
+				   bool newly);
 void mt76_connac_mcu_wtbl_generic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				      struct ieee80211_vif *vif,
 				      struct ieee80211_sta *sta, void *sta_wtbl,
@@ -998,7 +1007,7 @@ int mt76_connac_mcu_sta_update_hdr_trans(struct mt76_dev *dev,
 void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 			     struct ieee80211_sta *sta,
 			     struct ieee80211_vif *vif,
-			     u8 rcpi);
+			     u8 rcpi, u8 state);
 void mt76_connac_mcu_wtbl_ht_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				 struct ieee80211_sta *sta, void *sta_wtbl,
 				 void *wtbl_tlv);
@@ -1020,8 +1029,8 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 				struct ieee80211_vif *vif,
 				struct mt76_wcid *wcid,
 				bool enable);
-int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
-				struct mt76_sta_cmd_info *info);
+int mt76_connac_mcu_sta_cmd(struct mt76_phy *phy,
+			    struct mt76_sta_cmd_info *info);
 void mt76_connac_mcu_beacon_loss_iter(void *priv, u8 *mac,
 				      struct ieee80211_vif *vif);
 int mt76_connac_mcu_set_rts_thresh(struct mt76_dev *dev, u32 val, u8 band);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 84930ad5ebc7..724763b3844f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -578,7 +578,8 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
 		mt7921_mcu_uni_bss_ps(dev, vif);
 
 	if (changed & BSS_CHANGED_ASSOC) {
-		mt7921_mcu_sta_add(dev, NULL, vif, true);
+		mt7921_mcu_sta_update(dev, NULL, vif, true,
+				      MT76_STA_INFO_STATE_ASSOC);
 		mt7921_bss_bcnft_apply(dev, vif, info->assoc);
 	}
 
@@ -617,17 +618,14 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	if (ret)
 		return ret;
 
-	if (vif->type == NL80211_IFTYPE_STATION) {
+	if (vif->type == NL80211_IFTYPE_STATION)
 		mvif->wep_sta = msta;
-		if (!sta->tdls)
-			mt76_connac_mcu_uni_add_bss(&dev->mphy, vif,
-						    &mvif->sta.wcid, true);
-	}
 
 	mt7921_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	ret = mt7921_mcu_sta_add(dev, sta, vif, true);
+	ret = mt7921_mcu_sta_update(dev, sta, vif, true,
+				    MT76_STA_INFO_STATE_NONE);
 	if (ret)
 		return ret;
 
@@ -636,6 +634,27 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	return 0;
 }
 
+void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+			  struct ieee80211_sta *sta)
+{
+	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
+	struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+
+	mt7921_mutex_acquire(dev);
+
+	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
+		mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
+					    true);
+
+	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
+			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+
+	mt7921_mcu_sta_update(dev, sta, vif, true, MT76_STA_INFO_STATE_ASSOC);
+
+	mt7921_mutex_release(dev);
+}
+
 void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta)
 {
@@ -645,7 +664,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &msta->wcid);
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 
-	mt7921_mcu_sta_add(dev, sta, vif, false);
+	mt7921_mcu_sta_update(dev, sta, vif, false, MT76_STA_INFO_STATE_NONE);
 	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
@@ -791,22 +810,6 @@ mt7921_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return ret;
 }
 
-static int
-mt7921_sta_add(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-	       struct ieee80211_sta *sta)
-{
-	return mt76_sta_state(hw, vif, sta, IEEE80211_STA_NOTEXIST,
-			      IEEE80211_STA_NONE);
-}
-
-static int
-mt7921_sta_remove(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-		  struct ieee80211_sta *sta)
-{
-	return mt76_sta_state(hw, vif, sta, IEEE80211_STA_NONE,
-			      IEEE80211_STA_NOTEXIST);
-}
-
 static int mt7921_sta_state(struct ieee80211_hw *hw,
 			    struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta,
@@ -821,15 +824,7 @@ static int mt7921_sta_state(struct ieee80211_hw *hw,
 		mt7921_mutex_release(dev);
 	}
 
-	if (old_state == IEEE80211_STA_AUTH &&
-	    new_state == IEEE80211_STA_ASSOC) {
-		return mt7921_sta_add(hw, vif, sta);
-	} else if (old_state == IEEE80211_STA_ASSOC &&
-		   new_state == IEEE80211_STA_AUTH) {
-		return mt7921_sta_remove(hw, vif, sta);
-	}
-
-	return 0;
+	return mt76_sta_state(hw, vif, sta, old_state, new_state);
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index bd94d1244975..c95d71583cc1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1267,8 +1267,9 @@ int mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 				 sizeof(req), false);
 }
 
-int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta,
-		       struct ieee80211_vif *vif, bool enable)
+int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *sta,
+			  struct ieee80211_vif *vif, bool enable,
+			  enum mt76_sta_info_state state)
 {
 	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
 	int rssi = -ewma_rssi_read(&mvif->rssi);
@@ -1277,6 +1278,7 @@ int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta,
 		.vif = vif,
 		.enable = enable,
 		.cmd = MCU_UNI_CMD_STA_REC_UPDATE,
+		.state = state,
 		.offload_fw = true,
 		.rcpi = to_rcpi(rssi),
 	};
@@ -1284,8 +1286,9 @@ int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta,
 
 	msta = sta ? (struct mt7921_sta *)sta->drv_priv : NULL;
 	info.wcid = msta ? &msta->wcid : &mvif->sta.wcid;
+	info.newly = msta ? state != MT76_STA_INFO_STATE_ASSOC : true;
 
-	return mt76_connac_mcu_add_sta_cmd(&dev->mphy, &info);
+	return mt76_connac_mcu_sta_cmd(&dev->mphy, &info);
 }
 
 int __mt7921_mcu_drv_pmctrl(struct mt7921_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 8aa8d2ecdffa..71cf1d1a2e02 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -262,8 +262,9 @@ int mt7921_mcu_add_key(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 		       struct mt7921_sta *msta, struct ieee80211_key_conf *key,
 		       enum set_key_cmd cmd);
 int mt7921_set_channel(struct mt7921_phy *phy);
-int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta,
-		       struct ieee80211_vif *vif, bool enable);
+int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *sta,
+			  struct ieee80211_vif *vif, bool enable,
+			  enum mt76_sta_info_state state);
 int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd);
 int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif);
 int mt7921_mcu_set_eeprom(struct mt7921_dev *dev);
@@ -335,6 +336,8 @@ void mt7921_mac_fill_rx_vector(struct mt7921_dev *dev, struct sk_buff *skb);
 void mt7921_mac_tx_free(struct mt7921_dev *dev, struct sk_buff *skb);
 int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta);
+void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+			  struct ieee80211_sta *sta);
 void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta);
 void mt7921_mac_work(struct work_struct *work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 13263f50dc00..27906b2cd912 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -106,6 +106,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 		.rx_poll_complete = mt7921_rx_poll_complete,
 		.sta_ps = mt7921_sta_ps,
 		.sta_add = mt7921_mac_sta_add,
+		.sta_assoc = mt7921_mac_sta_assoc,
 		.sta_remove = mt7921_mac_sta_remove,
 		.update_survey = mt7921_update_channel,
 	};
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

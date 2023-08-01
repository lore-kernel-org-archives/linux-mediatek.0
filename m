Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B766C04FE1
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eH9OWPWAjU+s3RPRgiIIkH34EZX+7q2g7h8oWEofK0g=; b=IDdH8wtHiX5AzGunZoOXHWF2GL
	nQt50dunew1BYhoXpJtTCL4Zk/v3NipVXKT9MuptUkXqk0Tnxm7Fbsc0cqbR5tCpFNAbCtpZDG4Ck
	YgzO4M4PGC6TvVMDUQuXAj052IufqDFbz/rV81yM6scj8Zam8F1N9dN/fE3Sj3NeWh4gIz+9dbcXX
	Ll9YvBxPh7vITtYz3wxdb6ym2UHL5JdTf6ZOKpd6urDrxdzmS510GT1CDusftuZUHz63z3dd6gZne
	B6mPAZef+K3GWDQa13aiUOOak8tl0vCHuzJaut8IojWsUHhJbo6ODXYgTEisHj4dn4WsLjc74Pf1k
	NYVg7Mng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRt-002bfw-1Y;
	Tue, 01 Aug 2023 14:34:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRm-002bXe-17
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 14:34:06 +0000
X-UUID: 70ae90da307811ee912e1518a6540028-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eH9OWPWAjU+s3RPRgiIIkH34EZX+7q2g7h8oWEofK0g=;
	b=uFyQtVWyQhagB5w8TAuwobehmpwSPwozllDvcyHJrC7aSLUkjVgKTBqMmMVZhUkpepxD4Q6xDdDo9EKXuguh7rPnKLp+bmgJZxTiLbvIBsjyqoLF1C2HXe18rRzYR0bpRNLLicz4+jLoXf6cAlgdT0TGqNBX08oB8mhuMfIEtTA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:5c7bf4a5-bc76-4dcb-9a1c-244554192579,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.30,REQID:5c7bf4a5-bc76-4dcb-9a1c-244554192579,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8,CLOUDID:27fbc5a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:230801223353OG07GVHK,BulkQuantity:1,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 70ae90da307811ee912e1518a6540028-20230801
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 721204917; Tue, 01 Aug 2023 07:33:53 -0700
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
Subject: [PATCH 3/8] wifi: mt76: connac: export functions for mt7925
Date: Tue, 1 Aug 2023 22:30:27 +0800
Message-ID: <5cf4d8dcdd43892474ffc02a07859475c81bf367.1690863143.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1690863143.git.deren.wu@mediatek.com>
References: <cover.1690863143.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_073402_389533_A2D95742 
X-CRM114-Status: GOOD (  11.26  )
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

mt7925 rely on the similar functionalities in connac layer.
Export them for mt7925 reuse.

This is a preliminary patch to support mt7925 driver.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 19 ++++++++++++-------
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 12 ++++++++++++
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 21456692e790..dfbe31ae4b14 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -746,7 +746,7 @@ mt76_connac_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 	he->pkt_ext = 2;
 }
 
-static void
+void
 mt76_connac_mcu_sta_he_tlv_v2(struct sk_buff *skb, struct ieee80211_sta *sta)
 {
 	struct ieee80211_sta_he_cap *he_cap = &sta->deflink.he_cap;
@@ -778,6 +778,7 @@ mt76_connac_mcu_sta_he_tlv_v2(struct sk_buff *skb, struct ieee80211_sta *sta)
 
 	he->pkt_ext = IEEE80211_HE_PHY_CAP9_NOMINAL_PKT_PADDING_16US;
 }
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_sta_he_tlv_v2);
 
 static u8
 mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, struct ieee80211_vif *vif,
@@ -2088,9 +2089,9 @@ mt76_connac_mcu_build_sku(struct mt76_dev *dev, s8 *sku,
 	}
 }
 
-static s8 mt76_connac_get_ch_power(struct mt76_phy *phy,
-				   struct ieee80211_channel *chan,
-				   s8 target_power)
+s8 mt76_connac_get_ch_power(struct mt76_phy *phy,
+			    struct ieee80211_channel *chan,
+			    s8 target_power)
 {
 	struct mt76_dev *dev = phy->dev;
 	struct ieee80211_supported_band *sband;
@@ -2127,6 +2128,7 @@ static s8 mt76_connac_get_ch_power(struct mt76_phy *phy,
 
 	return target_power;
 }
+EXPORT_SYMBOL_GPL(mt76_connac_get_ch_power);
 
 static int
 mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
@@ -2458,7 +2460,7 @@ mt76_connac_mcu_set_arp_filter(struct mt76_dev *dev, struct ieee80211_vif *vif,
 				 sizeof(req), true);
 }
 
-static int
+int
 mt76_connac_mcu_set_gtk_rekey(struct mt76_dev *dev, struct ieee80211_vif *vif,
 			      bool suspend)
 {
@@ -2483,8 +2485,9 @@ mt76_connac_mcu_set_gtk_rekey(struct mt76_dev *dev, struct ieee80211_vif *vif,
 	return mt76_mcu_send_msg(dev, MCU_UNI_CMD(OFFLOAD), &req,
 				 sizeof(req), true);
 }
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_gtk_rekey);
 
-static int
+int
 mt76_connac_mcu_set_suspend_mode(struct mt76_dev *dev,
 				 struct ieee80211_vif *vif,
 				 bool enable, u8 mdtim,
@@ -2513,6 +2516,7 @@ mt76_connac_mcu_set_suspend_mode(struct mt76_dev *dev,
 	return mt76_mcu_send_msg(dev, MCU_UNI_CMD(SUSPEND), &req,
 				 sizeof(req), true);
 }
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_suspend_mode);
 
 static int
 mt76_connac_mcu_set_wow_pattern(struct mt76_dev *dev,
@@ -2548,7 +2552,7 @@ mt76_connac_mcu_set_wow_pattern(struct mt76_dev *dev,
 	return mt76_mcu_skb_send_msg(dev, skb, MCU_UNI_CMD(SUSPEND), true);
 }
 
-static int
+int
 mt76_connac_mcu_set_wow_ctrl(struct mt76_phy *phy, struct ieee80211_vif *vif,
 			     bool suspend, struct cfg80211_wowlan *wowlan)
 {
@@ -2600,6 +2604,7 @@ mt76_connac_mcu_set_wow_ctrl(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	return mt76_mcu_send_msg(dev, MCU_UNI_CMD(SUSPEND), &req,
 				 sizeof(req), true);
 }
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_wow_ctrl);
 
 int mt76_connac_mcu_set_hif_suspend(struct mt76_dev *dev, bool suspend)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 19be8556cd3c..879a66564c54 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1807,6 +1807,7 @@ void mt76_connac_mcu_wtbl_hdr_trans_tlv(struct sk_buff *skb,
 int mt76_connac_mcu_sta_update_hdr_trans(struct mt76_dev *dev,
 					 struct ieee80211_vif *vif,
 					 struct mt76_wcid *wcid, int cmd);
+void mt76_connac_mcu_sta_he_tlv_v2(struct sk_buff *skb, struct ieee80211_sta *sta);
 int mt76_connac_mcu_wtbl_update_hdr_trans(struct mt76_dev *dev,
 					  struct ieee80211_vif *vif,
 					  struct ieee80211_sta *sta);
@@ -1866,9 +1867,17 @@ int mt76_connac_mcu_sched_scan_enable(struct mt76_phy *phy,
 int mt76_connac_mcu_update_arp_filter(struct mt76_dev *dev,
 				      struct mt76_vif *vif,
 				      struct ieee80211_bss_conf *info);
+int mt76_connac_mcu_set_gtk_rekey(struct mt76_dev *dev, struct ieee80211_vif *vif,
+				  bool suspend);
+int mt76_connac_mcu_set_wow_ctrl(struct mt76_phy *phy, struct ieee80211_vif *vif,
+				 bool suspend, struct cfg80211_wowlan *wowlan);
 int mt76_connac_mcu_update_gtk_rekey(struct ieee80211_hw *hw,
 				     struct ieee80211_vif *vif,
 				     struct cfg80211_gtk_rekey_data *key);
+int mt76_connac_mcu_set_suspend_mode(struct mt76_dev *dev,
+				     struct ieee80211_vif *vif,
+				     bool enable, u8 mdtim,
+				     bool wow_suspend);
 int mt76_connac_mcu_set_hif_suspend(struct mt76_dev *dev, bool suspend);
 void mt76_connac_mcu_set_suspend_iter(void *priv, u8 *mac,
 				      struct ieee80211_vif *vif);
@@ -1879,6 +1888,9 @@ int mt76_connac_mcu_chip_config(struct mt76_dev *dev);
 int mt76_connac_mcu_set_deep_sleep(struct mt76_dev *dev, bool enable);
 void mt76_connac_mcu_coredump_event(struct mt76_dev *dev, struct sk_buff *skb,
 				    struct mt76_connac_coredump *coredump);
+s8 mt76_connac_get_ch_power(struct mt76_phy *phy,
+			    struct ieee80211_channel *chan,
+			    s8 target_power);
 int mt76_connac_mcu_set_rate_txpower(struct mt76_phy *phy);
 int mt76_connac_mcu_set_p2p_oppps(struct ieee80211_hw *hw,
 				  struct ieee80211_vif *vif);
-- 
2.18.0



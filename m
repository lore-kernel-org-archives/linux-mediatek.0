Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B394C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4RmRPQOxTja+Dc054BF6i570PC+NgnM2JTTvi1wznRw=; b=kR8jgH3wVSwPlL/+9Lc4lP4wOL
	jgK8ORrswiMfuRQ+TzRaLrETG7IUjf2rDzjhaPb4iKKqToLq2DYeEHeAJHVN6X4Fj2awpTZcuZ6m7
	fnzSX5rlu2IHiHswYWLsyUU04x4izGO3zmP1xox+qtmD0PD7mHfEajHinnRmA98SAYle0SgS7bzbo
	4N7jJTFIaMF7TR2mId8Gi5/eWcQkJbKc/xCqYkZWza4M287bstjNf8q0o0PK/kmVOZPYtN/MKzI3k
	kMxXVWyQIPx8hoLVNKiTEkLvK8EdchmTxr0+oP7mKDPo/Iae0FhtrnjJxhuqUzygH1HGulofIKVAw
	r5MIYnFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtp9-0000000Gtis-1Ipd;
	Wed, 20 Mar 2024 11:09:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtp6-0000000GtgT-0457
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 11:09:33 +0000
X-UUID: 5003fb16e6aa11eeacdb61a41848c7d2-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4RmRPQOxTja+Dc054BF6i570PC+NgnM2JTTvi1wznRw=;
	b=e8PGsVVao0WWpAjbsK0aBZrh8e4/F7LNyaxRK9YNfH56oH8F2woVQ7YLdY023xPSufdIpgCkU2Tcl2NuYnOdibDNYLEbrk/88iv0UwNet5daBZMr0h4fBGg/XYDsjTX9Loav7ZRatDcWBieBWAYwkqP8Ryy2fd6cLa1LduL4Kjo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:47f282e3-1a49-4dcd-8bce-1526842833f3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:e7d9b881-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5003fb16e6aa11eeacdb61a41848c7d2-20240320
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1669972219; Wed, 20 Mar 2024 04:09:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 19:09:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 19:09:23 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 01/10] wifi: mt76: connac: use peer address for station BMC entry
Date: Wed, 20 Mar 2024 19:09:09 +0800
Message-ID: <20240320110918.3488-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_040932_085106_E48DEAF4 
X-CRM114-Status: GOOD (  15.54  )
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

Set peer address and aid for the BMC wtbl of station interface. For some
functions such as parsing MU_EDCA parameters from beacon, firmware will
need the peer address to do correct parsing.
Without this patch, MU uplink traffic would get suffered.

Reported-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c  |  9 ++++++++-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c  | 15 ++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c   |  6 +++---
 .../net/wireless/mediatek/mt76/mt7996/mt7996.h    |  2 +-
 4 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index af0c2b2aacb0..e6cc3a68954b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -392,7 +392,14 @@ void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 
 	if (!sta) {
 		basic->conn_type = cpu_to_le32(CONNECTION_INFRA_BC);
-		eth_broadcast_addr(basic->peer_addr);
+
+		if (is_mt799x(dev) && vif->type == NL80211_IFTYPE_STATION &&
+		    !is_zero_ether_addr(vif->bss_conf.bssid)) {
+			memcpy(basic->peer_addr, vif->bss_conf.bssid, ETH_ALEN);
+			basic->aid = cpu_to_le16(vif->cfg.aid);
+		} else {
+			eth_broadcast_addr(basic->peer_addr);
+		}
 		return;
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index f7da8d6dd903..995c265442df 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -238,7 +238,11 @@ static int mt7996_add_interface(struct ieee80211_hw *hw,
 	mt7996_init_bitrate_mask(vif);
 
 	mt7996_mcu_add_bss_info(phy, vif, true);
-	mt7996_mcu_add_sta(dev, vif, NULL, true);
+	/* defer the first STA_REC of BMC entry to BSS_CHANGED_BSSID for STA
+	 * interface, since firmware only records BSSID when the entry is new
+	 */
+	if (vif->type != NL80211_IFTYPE_STATION)
+		mt7996_mcu_add_sta(dev, vif, NULL, true, true);
 	rcu_assign_pointer(dev->mt76.wcid[idx], &mvif->sta.wcid);
 
 out:
@@ -256,7 +260,7 @@ static void mt7996_remove_interface(struct ieee80211_hw *hw,
 	struct mt7996_phy *phy = mt7996_hw_phy(hw);
 	int idx = msta->wcid.idx;
 
-	mt7996_mcu_add_sta(dev, vif, NULL, false);
+	mt7996_mcu_add_sta(dev, vif, NULL, false, false);
 	mt7996_mcu_add_bss_info(phy, vif, false);
 
 	if (vif == phy->monitor_vif)
@@ -599,7 +603,8 @@ static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 	    (changed & BSS_CHANGED_ASSOC && vif->cfg.assoc) ||
 	    (changed & BSS_CHANGED_BEACON_ENABLED && info->enable_beacon)) {
 		mt7996_mcu_add_bss_info(phy, vif, true);
-		mt7996_mcu_add_sta(dev, vif, NULL, true);
+		mt7996_mcu_add_sta(dev, vif, NULL, true,
+				   !!(changed & BSS_CHANGED_BSSID));
 	}
 
 	if (changed & BSS_CHANGED_ERP_CTS_PROT)
@@ -688,7 +693,7 @@ int mt7996_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	mt7996_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	ret = mt7996_mcu_add_sta(dev, vif, sta, true);
+	ret = mt7996_mcu_add_sta(dev, vif, sta, true, true);
 	if (ret)
 		return ret;
 
@@ -702,7 +707,7 @@ void mt7996_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
 	int i;
 
-	mt7996_mcu_add_sta(dev, vif, sta, false);
+	mt7996_mcu_add_sta(dev, vif, sta, false, false);
 
 	mt7996_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index b44abe2acc81..df6be2091615 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2133,7 +2133,7 @@ mt7996_mcu_add_group(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 }
 
 int mt7996_mcu_add_sta(struct mt7996_dev *dev, struct ieee80211_vif *vif,
-		       struct ieee80211_sta *sta, bool enable)
+		       struct ieee80211_sta *sta, bool enable, bool newly)
 {
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_sta *msta;
@@ -2149,8 +2149,8 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 		return PTR_ERR(skb);
 
 	/* starec basic */
-	mt76_connac_mcu_sta_basic_tlv(&dev->mt76, skb, vif, sta, enable,
-				      !rcu_access_pointer(dev->mt76.wcid[msta->wcid.idx]));
+	mt76_connac_mcu_sta_basic_tlv(&dev->mt76, skb, vif, sta, enable, newly);
+
 	if (!enable)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 36d1f247d55a..c30d133d9a71 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -450,7 +450,7 @@ int mt7996_mcu_add_dev_info(struct mt7996_phy *phy,
 int mt7996_mcu_add_bss_info(struct mt7996_phy *phy,
 			    struct ieee80211_vif *vif, int enable);
 int mt7996_mcu_add_sta(struct mt7996_dev *dev, struct ieee80211_vif *vif,
-		       struct ieee80211_sta *sta, bool enable);
+		       struct ieee80211_sta *sta, bool enable, bool newly);
 int mt7996_mcu_add_tx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
 			 bool add);
-- 
2.39.2



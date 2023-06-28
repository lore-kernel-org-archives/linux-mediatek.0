Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C61EB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 07:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PDqreba8OPai+PIacZji7W6uuUKmIkJ+VvFQSiME2A=; b=Leq0Xc5oLv13SJeSsfsr/lkoJa
	WCGthfNt7e+BugpYZ3telDNwY1HlJeLAoEfPXTz61XqgLZR08ufJNwtoytF9Vhzlnwd6yVEYPFYO/
	feNfwcTaDOJd5j+KpqGiaggl8vxkgUWuXgn17sSplW6fEaJkzBgXMuG7IkmSXlnBkTGskStKa6Y1s
	Fzg1Brg+UQXL2yqvpM/Ys6fJCat4NF0qN5U8+C8nADCaUJ34RxOf1CFpIYw48yzF/UQ8for8kQxhD
	/9S398dt3EyZEv0UH/1oYdLcBVS//WM12dBY2eeeGIC/dRu4nRdGKDaH/LR352JXi8jij+FtEnU+N
	iqxKnjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPH1-00F1HX-2M;
	Wed, 28 Jun 2023 07:07:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPGy-00F1EE-03
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 07:07:30 +0000
X-UUID: 6a3f6884158211ee912e1518a6540028-20230628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6PDqreba8OPai+PIacZji7W6uuUKmIkJ+VvFQSiME2A=;
	b=G1cYTcOcUAARSE1Ff+rvkgQLjiMFpK31lhuH3iPsy7+fdubNKwLPhkRr9YlWCq5Cl8LUz2h11rKeCok4ikDH39cHs25jHy3Q84pqn2ZNt5XN3U4okU2/ZiDFARZyCb1Nvg6f/w3F/nGlTaDA8k2zoq9yn/wgkpBeHjG+yUeT2IY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:8417a212-db7b-4671-a4bf-d5adda08b2b9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.27,REQID:8417a212-db7b-4671-a4bf-d5adda08b2b9,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:01c9525,CLOUDID:da7b9b0d-c22b-45ab-8a43-3004e9216b56,B
	ulkID:230628150716YS40BVMD,BulkQuantity:1,Recheck:0,SF:17|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: 6a3f6884158211ee912e1518a6540028-20230628
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 952057335; Wed, 28 Jun 2023 00:07:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Jun 2023 15:07:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Jun 2023 15:07:14 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 04/16] wifi: mt76: mt7921: rename mt7921_sta in mt792x_sta
Date: Wed, 28 Jun 2023 15:05:50 +0800
Message-ID: <cf4a3db00340bcc1ae447b1a0eb2d50ed341a1b1.1687919628.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1687919628.git.deren.wu@mediatek.com>
References: <cover.1687919628.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_000728_061031_3B684990 
X-CRM114-Status: GOOD (  16.49  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

This is a preliminary patch to introduce WiFi7 chipset support

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 22 +++++++++----------
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 22 +++++++++----------
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  8 +++----
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  8 +++----
 .../wireless/mediatek/mt76/mt7921/pci_mac.c   |  2 +-
 6 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index f2a6fd61863b..df32f4f1b636 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -140,7 +140,7 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 
 	phy->slottime = 9;
 
-	hw->sta_data_size = sizeof(struct mt7921_sta);
+	hw->sta_data_size = sizeof(struct mt792x_sta);
 	hw->vif_data_size = sizeof(struct mt792x_vif);
 
 	if (dev->fw_features & MT7921_FW_CAP_CNM) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 44b0122073f8..d4cf2ff18102 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -23,7 +23,7 @@ static u32 mt7921_mac_wtbl_lmac_addr(int idx, u8 offset)
 static struct mt76_wcid *mt7921_rx_get_wcid(struct mt7921_dev *dev,
 					    u16 idx, bool unicast)
 {
-	struct mt7921_sta *sta;
+	struct mt792x_sta *sta;
 	struct mt76_wcid *wcid;
 
 	if (idx >= ARRAY_SIZE(dev->mt76.wcid))
@@ -36,7 +36,7 @@ static struct mt76_wcid *mt7921_rx_get_wcid(struct mt7921_dev *dev,
 	if (!wcid->sta)
 		return NULL;
 
-	sta = container_of(wcid, struct mt7921_sta, wcid);
+	sta = container_of(wcid, struct mt792x_sta, wcid);
 	if (!sta->vif)
 		return NULL;
 
@@ -61,7 +61,7 @@ static void mt7921_mac_sta_poll(struct mt7921_dev *dev)
 		[IEEE80211_AC_VO] = 6
 	};
 	struct ieee80211_sta *sta;
-	struct mt7921_sta *msta;
+	struct mt792x_sta *msta;
 	u32 tx_time[IEEE80211_NUM_ACS], rx_time[IEEE80211_NUM_ACS];
 	LIST_HEAD(sta_poll_list);
 	struct rate_info *rate;
@@ -84,7 +84,7 @@ static void mt7921_mac_sta_poll(struct mt7921_dev *dev)
 			break;
 		}
 		msta = list_first_entry(&sta_poll_list,
-					struct mt7921_sta, wcid.poll_list);
+					struct mt792x_sta, wcid.poll_list);
 		list_del_init(&msta->wcid.poll_list);
 		spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
@@ -248,7 +248,7 @@ mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 	u32 rxd2 = le32_to_cpu(rxd[2]);
 	u32 rxd3 = le32_to_cpu(rxd[3]);
 	u32 rxd4 = le32_to_cpu(rxd[4]);
-	struct mt7921_sta *msta = NULL;
+	struct mt792x_sta *msta = NULL;
 	u16 seq_ctrl = 0;
 	__le16 fc = 0;
 	u8 mode = 0;
@@ -279,7 +279,7 @@ mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 	status->wcid = mt7921_rx_get_wcid(dev, idx, unicast);
 
 	if (status->wcid) {
-		msta = container_of(status->wcid, struct mt7921_sta, wcid);
+		msta = container_of(status->wcid, struct mt792x_sta, wcid);
 		spin_lock_bh(&dev->mt76.sta_poll_lock);
 		if (list_empty(&msta->wcid.poll_list))
 			list_add_tail(&msta->wcid.poll_list,
@@ -513,7 +513,7 @@ mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 
 void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data)
 {
-	struct mt7921_sta *msta = NULL;
+	struct mt792x_sta *msta = NULL;
 	struct mt76_wcid *wcid;
 	__le32 *txs_data = data;
 	u16 wcidx;
@@ -537,7 +537,7 @@ void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data)
 	if (!wcid)
 		goto out;
 
-	msta = container_of(wcid, struct mt7921_sta, wcid);
+	msta = container_of(wcid, struct mt792x_sta, wcid);
 
 	mt76_connac2_mac_add_txs_skb(&dev->mt76, wcid, pid, txs_data);
 	if (!wcid->sta)
@@ -582,7 +582,7 @@ static void mt7921_mac_tx_free(struct mt7921_dev *dev, void *data, int len)
 		 * 1'b0: msdu_id with the same 'wcid pair' as above.
 		 */
 		if (info & MT_TX_FREE_PAIR) {
-			struct mt7921_sta *msta;
+			struct mt792x_sta *msta;
 			u16 idx;
 
 			count++;
@@ -592,7 +592,7 @@ static void mt7921_mac_tx_free(struct mt7921_dev *dev, void *data, int len)
 			if (!sta)
 				continue;
 
-			msta = container_of(wcid, struct mt7921_sta, wcid);
+			msta = container_of(wcid, struct mt792x_sta, wcid);
 			spin_lock_bh(&mdev->sta_poll_lock);
 			if (list_empty(&msta->wcid.poll_list))
 				list_add_tail(&msta->wcid.poll_list,
@@ -1140,7 +1140,7 @@ int mt7921_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		wcid = &dev->mt76.global_wcid;
 
 	if (sta) {
-		struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+		struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 
 		if (time_after(jiffies, msta->last_txs + HZ / 4)) {
 			info->flags |= IEEE80211_TX_CTL_REQ_TX_STATUS;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index de8c3a02cf4b..bd449423e5b3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -342,7 +342,7 @@ static void mt7921_remove_interface(struct ieee80211_hw *hw,
 				    struct ieee80211_vif *vif)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt7921_sta *msta = &mvif->sta;
+	struct mt792x_sta *msta = &mvif->sta;
 	struct mt7921_dev *dev = mt7921_hw_dev(hw);
 	struct mt7921_phy *phy = mt7921_hw_phy(hw);
 	int idx = msta->wcid.idx;
@@ -508,7 +508,7 @@ static int mt7921_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 {
 	struct mt7921_dev *dev = mt7921_hw_dev(hw);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt7921_sta *msta = sta ? (struct mt7921_sta *)sta->drv_priv :
+	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
 				  &mvif->sta;
 	struct mt76_wcid *wcid = &msta->wcid;
 	u8 *wcid_keyidx = &wcid->hw_key_idx;
@@ -756,7 +756,7 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta)
 {
 	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
-	struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	int ret, idx;
 
@@ -797,7 +797,7 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			  struct ieee80211_sta *sta)
 {
 	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
-	struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 
 	mt7921_mutex_acquire(dev);
@@ -822,7 +822,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta)
 {
 	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
-	struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &msta->wcid);
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
@@ -877,9 +877,9 @@ static void mt7921_tx(struct ieee80211_hw *hw,
 	int qid;
 
 	if (control->sta) {
-		struct mt7921_sta *sta;
+		struct mt792x_sta *sta;
 
-		sta = (struct mt7921_sta *)control->sta->drv_priv;
+		sta = (struct mt792x_sta *)control->sta->drv_priv;
 		wcid = &sta->wcid;
 	}
 
@@ -924,7 +924,7 @@ mt7921_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct mt7921_dev *dev = mt7921_hw_dev(hw);
 	struct ieee80211_sta *sta = params->sta;
 	struct ieee80211_txq *txq = sta->txq[params->tid];
-	struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	u16 tid = params->tid;
 	u16 ssn = params->ssn;
 	struct mt76_txq *mtxq;
@@ -1120,7 +1120,7 @@ mt7921_get_et_sset_count(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 static void
 mt7921_ethtool_worker(void *wi_data, struct ieee80211_sta *sta)
 {
-	struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	struct mt76_ethtool_worker_info *wi = wi_data;
 
 	if (msta->vif->mt76.idx != wi->idx)
@@ -1387,7 +1387,7 @@ static void mt7921_sta_statistics(struct ieee80211_hw *hw,
 				  struct ieee80211_sta *sta,
 				  struct station_info *sinfo)
 {
-	struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	struct rate_info *txrate = &msta->wcid.rate;
 
 	if (!txrate->legacy && !txrate->flags)
@@ -1500,7 +1500,7 @@ static void mt7921_sta_set_decap_offload(struct ieee80211_hw *hw,
 					 struct ieee80211_sta *sta,
 					 bool enabled)
 {
-	struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	struct mt7921_dev *dev = mt7921_hw_dev(hw);
 
 	mt7921_mutex_acquire(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 4d8b4c802739..1d1e8ee5bd3d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -343,7 +343,7 @@ int mt7921_mcu_uni_tx_ba(struct mt7921_dev *dev,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable)
 {
-	struct mt7921_sta *msta = (struct mt7921_sta *)params->sta->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
 
 	if (enable && !params->amsdu)
 		msta->wcid.amsdu = false;
@@ -357,7 +357,7 @@ int mt7921_mcu_uni_rx_ba(struct mt7921_dev *dev,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable)
 {
-	struct mt7921_sta *msta = (struct mt7921_sta *)params->sta->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
 
 	return mt76_connac_mcu_sta_ba(&dev->mt76, &msta->vif->mt76, params,
 				      MCU_UNI_CMD(STA_REC_UPDATE),
@@ -933,9 +933,9 @@ int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *sta,
 		.offload_fw = true,
 		.rcpi = to_rcpi(rssi),
 	};
-	struct mt7921_sta *msta;
+	struct mt792x_sta *msta;
 
-	msta = sta ? (struct mt7921_sta *)sta->drv_priv : NULL;
+	msta = sta ? (struct mt792x_sta *)sta->drv_priv : NULL;
 	info.wcid = msta ? &msta->wcid : &mvif->sta.wcid;
 	info.newly = msta ? state != MT76_STA_INFO_STATE_ASSOC : true;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 6ec5b19f3c25..4d409ba3fc21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -128,7 +128,7 @@ struct mt7921_sdio_intr {
 #define to_rcpi(rssi)			(2 * (rssi) + 220)
 
 struct mt792x_vif;
-struct mt7921_sta;
+struct mt792x_sta;
 
 enum mt7921_txq_id {
 	MT7921_TXQ_BAND0,
@@ -145,7 +145,7 @@ enum mt7921_rxq_id {
 
 DECLARE_EWMA(avg_signal, 10, 8)
 
-struct mt7921_sta {
+struct mt792x_sta {
 	struct mt76_wcid wcid; /* must be first */
 
 	struct mt792x_vif *vif;
@@ -165,8 +165,8 @@ DECLARE_EWMA(rssi, 10, 8);
 struct mt792x_vif {
 	struct mt76_vif mt76; /* must be first */
 
-	struct mt7921_sta sta;
-	struct mt7921_sta *wep_sta;
+	struct mt792x_sta sta;
+	struct mt792x_sta *wep_sta;
 
 	struct mt7921_phy *phy;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
index 978c90a034cf..32bba86727a5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
@@ -32,7 +32,7 @@ int mt7921e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		return id;
 
 	if (sta) {
-		struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+		struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 
 		if (time_after(jiffies, msta->last_txs + HZ / 4)) {
 			info->flags |= IEEE80211_TX_CTL_REQ_TX_STATUS;
-- 
2.18.0



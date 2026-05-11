Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A341BCD4840
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=euveLJGxSvPWJZ9qF7eSEYwUYjl8arjj3nB8s2YoTmk=; b=i3eHkbht/aG4Z4BjbqWd+Xeu6/
	RsiluCMTm+2aa+obq5EuAhHe9KeKZ30K51IifHuXGyLAYrJZHOBj4CfA6O7hjopspi1lSFGBiU7Tl
	LEsoTrcAqR39gRiPqExktGg+LdtayOzR1FUHTSmVBy0Vc8z7HkM8A5xCKc9vAhnQ9o62FRDNicJSf
	idhP9pqgdeUx0qRXIeiJIcY1nYrwDjQ68s8gRCRVuYTQrskjEqe0LhRs6YYoobGKSPkjd8daKXT79
	+QQZG44HLwLJR4A+iMbEkiUM0xg/JaWI6DzEKMcA3/uHmWdQn/JrgFdGS3Ufl1Hdq2sK5E2Nrkd48
	k/gpX75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVQS-0000000EWLX-2eGq;
	Mon, 11 May 2026 18:32:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVQQ-0000000EWKU-2JAv
	for linux-mediatek@lists.infradead.org;
	Mon, 11 May 2026 18:32:19 +0000
X-UUID: b8eef4024d6711f19f231fa534c5cac8-20260511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=euveLJGxSvPWJZ9qF7eSEYwUYjl8arjj3nB8s2YoTmk=;
	b=jlTNHED6xHfLdzPUt2j+xAZu67e+ISIgwpA6aHj+k0/C1+kpR3eF98ubEH1nrwiQAfqTWTdv2DSCG/IAlAXRbnpNBXKDs4HPXwvCkwmcx8avNfwZ+AVDZqOH4TtumjT2ChGVwVIgnBREBKZZ44OhYsoc1Kvov9qkHzpWOqBN1js=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:783e07e3-8365-44d7-93d9-cd44c92f1014,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:e06c4771-3b7f-4b26-b2f9-40f0deecb36d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8eef4024d6711f19f231fa534c5cac8-20260511
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1537564451; Mon, 11 May 2026 11:32:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 12 May 2026 02:32:08 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 12 May 2026 02:32:07 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: <linux-mediatek@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	Shayne Chen <shayne.chen@mediatek.com>, Roy Luo <roy-ch.luo@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7996: avoid memset overwriting tx_info->control.flags
Date: Mon, 11 May 2026 11:32:04 -0700
Message-ID: <5ecac6a9b7d29526e8438dea105b58f5487c93aa.1778521232.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_113218_603589_A45AEF09 
X-CRM114-Status: GOOD (  10.14  )
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

mt76_tx_status_skb_add uses memset on status.status_driver_data, which
overwrite  info->control.flags in ieee80211_tx_info. Copy tx_info before
calling mt76_tx_status_skb_add to ensure control fields are preserved
and remain valid for later processing.

Reported-By: Roy Luo <roy-ch.luo@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 17 +++++++++--------
 .../net/wireless/mediatek/mt76/mt7996/mt7996.h  |  2 +-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index e2a83da3a09c..a59c14c8f2af 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -855,11 +855,12 @@ mt7996_mac_write_txwi_80211(struct mt7996_dev *dev, __le32 *txwi,
 
 void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid,
-			   struct ieee80211_key_conf *key, int pid,
+			   struct ieee80211_tx_info *tx_info, int pid,
 			   enum mt76_txq_id qid, u32 changed)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
-	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct ieee80211_key_conf *key = tx_info ? tx_info->control.hw_key : NULL;
+	struct ieee80211_tx_info *info = tx_info ? tx_info : IEEE80211_SKB_CB(skb);
 	struct ieee80211_vif *vif = info->control.vif;
 	u8 band_idx = (info->hw_queue & MT_TX_HW_QUEUE_PHY) >> 2;
 	u8 p_fmt, q_idx, omac_idx = 0, wmm_idx = 0;
@@ -1006,15 +1007,15 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)tx_info->skb->data;
 	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
-	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
-	struct ieee80211_key_conf *key = info->control.hw_key;
-	struct ieee80211_vif *vif = info->control.vif;
+	struct ieee80211_tx_info info = *IEEE80211_SKB_CB(tx_info->skb);
+	struct ieee80211_key_conf *key = info.control.hw_key;
+	struct ieee80211_vif *vif = info.control.vif;
 	struct mt7996_vif *mvif = vif ? (struct mt7996_vif *)vif->drv_priv : NULL;
 	struct mt7996_sta *msta = sta ? (struct mt7996_sta *)sta->drv_priv : NULL;
 	struct mt76_vif_link *mlink = NULL;
 	struct mt76_txwi_cache *t;
 	int id, i, pid, nbuf = tx_info->nbuf - 1;
-	bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
+	bool is_8023 = info.flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
 	__le32 *ptr = (__le32 *)txwi_ptr;
 	u8 *txwi = (u8 *)txwi_ptr;
 	u8 link_id;
@@ -1031,7 +1032,7 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 
 		link_id = (tid % 2) ? msta->seclink_id : msta->deflink_id;
 	} else {
-		link_id = u32_get_bits(info->control.flags,
+		link_id = u32_get_bits(info.control.flags,
 				       IEEE80211_TX_CTRL_MLO_LINK);
 	}
 
@@ -1095,7 +1096,7 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	memset(txwi_ptr, 0, MT_TXD_SIZE);
 	/* Transmit non qos data by 802.11 header and need to fill txd by host*/
 	if (!is_8023 || pid >= MT_PACKET_ID_FIRST)
-		mt7996_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, key,
+		mt7996_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, &info,
 				      pid, qid, 0);
 
 	/* MT7996 and MT7992 require driver to provide the MAC TXP for AddBA
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index bdcf72457954..319fcc4fb469 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -854,7 +854,7 @@ void mt7996_mac_cca_stats_reset(struct mt7996_phy *phy);
 void mt7996_mac_enable_nf(struct mt7996_dev *dev, u8 band);
 void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid,
-			   struct ieee80211_key_conf *key, int pid,
+			   struct ieee80211_tx_info *tx_info, int pid,
 			   enum mt76_txq_id qid, u32 changed);
 void mt7996_mac_update_beacons(struct mt7996_phy *phy);
 void mt7996_mac_set_coverage_class(struct mt7996_phy *phy);
-- 
2.45.2



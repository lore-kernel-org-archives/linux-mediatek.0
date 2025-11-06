Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73FACCF9F8
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 06:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mdp68LsVXcdL6AhsDnyHQIde7VeFEL1Xvb5EZddNYyo=; b=zxIZOhoGMUDLEkaZb03FTzVgg2
	efH0zYtW3OdlbRIkPWlYq87aK0jBHH65wjZYnBCmD5rh5Kmf+QjcDMVstHzhq9XZ3FT3QWnY+0MLw
	BA1c09K3a5P3cOJqBx23Leb0pBfThNUyXS2B7OTr5OtqQddltw13BP4chS7HdWSHr0TtYO8U/u3/S
	jdtgmoqICIwEi8qmRWwNwmh6TtSNkUzTHZPgLpDx/c766G5tH8FOeCOtTc2diWt5iNB0O3tippI0P
	y/aGWr7ZO/1Ai/Z7EDm4TZCQmzKVnR9+SIv/0qLsmdAi4zWWG8h5o/W6BLwvb06XRT+pTF0B7juJo
	2zmzzN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtiC-0000000ExXA-2ed3;
	Thu, 06 Nov 2025 06:43:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGti9-0000000ExTl-2ayb
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 06:43:11 +0000
X-UUID: d83adef8badb11f0a52f393f94899d25-20251105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Mdp68LsVXcdL6AhsDnyHQIde7VeFEL1Xvb5EZddNYyo=;
	b=aoHd6CI82/lqIoUNh3tRGtudCj3zz7OsDagkALdPcN3AZ/5+B1YlyFfbNufKTHQS5g//t80CoYe6CiFWH8Pkh/n45G57l4LJr++8phDY4FViwdX1O8bFUPP8qVM1laAsmTqv8OROTocutkekdgBXfTPAZ4C8aVtP3GVD8F0oQH4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:395cf233-9ade-4340-ab2b-d4d516bd325a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:046e31e0-3890-4bb9-a90e-2a6a4ecf6c66,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d83adef8badb11f0a52f393f94899d25-20251105
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1175097769; Wed, 05 Nov 2025 23:43:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 6 Nov 2025 14:43:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 6 Nov 2025 14:43:00 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 v2 08/12] wifi: mt76: mt7996: use correct link_id when filling TXD and TXP
Date: Thu, 6 Nov 2025 14:41:59 +0800
Message-ID: <20251106064203.1000505-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251106064203.1000505-1-shayne.chen@mediatek.com>
References: <20251106064203.1000505-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_224309_663343_A3205ADF 
X-CRM114-Status: GOOD (  19.65  )
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

Obtain the correct link ID and, if needed, switch to the corresponding
wcid before populating the TX descriptor and TX payload.

Rules for link id:
- For QoS data of MLD peers (excluding EAPOL), select the primary or
  secondary wcid based on whether the TID is odd or even to meet FW/HW
  requirements
- For other packets, use IEEE80211_TX_CTRL_MLO_LINK if specified
  (such as multicast and broadcast packets)

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
v2:
  - remove unnecessary brackets around BIT()
  - handle seclink_id when link is removed
---
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 34 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  9 +++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   |  4 +--
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  1 +
 4 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 7d5f9d9b3b62..579084cbb30f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1035,15 +1035,20 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 			  struct ieee80211_sta *sta,
 			  struct mt76_tx_info *tx_info)
 {
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)tx_info->skb->data;
 	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
 	struct ieee80211_key_conf *key = info->control.hw_key;
 	struct ieee80211_vif *vif = info->control.vif;
+	struct mt7996_vif *mvif = vif ? (struct mt7996_vif *)vif->drv_priv : NULL;
+	struct mt7996_sta *msta = sta ? (struct mt7996_sta *)sta->drv_priv : NULL;
+	struct mt76_vif_link *mlink = NULL;
 	struct mt76_txwi_cache *t;
 	int id, i, pid, nbuf = tx_info->nbuf - 1;
 	bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
 	__le32 *ptr = (__le32 *)txwi_ptr;
 	u8 *txwi = (u8 *)txwi_ptr;
+	u8 link_id;
 
 	if (unlikely(tx_info->skb->len <= ETH_HLEN))
 		return -EINVAL;
@@ -1051,6 +1056,30 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	if (!wcid)
 		wcid = &dev->mt76.global_wcid;
 
+	if ((is_8023 || ieee80211_is_data_qos(hdr->frame_control)) && sta->mlo &&
+	    likely(tx_info->skb->protocol != cpu_to_be16(ETH_P_PAE))) {
+		u8 tid = tx_info->skb->priority & IEEE80211_QOS_CTL_TID_MASK;
+
+		link_id = (tid % 2) ? msta->seclink_id : msta->deflink_id;
+	} else {
+		link_id = u32_get_bits(info->control.flags,
+				       IEEE80211_TX_CTRL_MLO_LINK);
+	}
+
+	if (link_id != wcid->link_id && link_id != IEEE80211_LINK_UNSPECIFIED) {
+		if (msta) {
+			struct mt7996_sta_link *msta_link =
+				rcu_dereference(msta->link[link_id]);
+
+			if (msta_link)
+				wcid = &msta_link->wcid;
+		} else if (mvif) {
+			mlink = rcu_dereference(mvif->mt76.link[link_id]);
+			if (mlink && mlink->wcid)
+				wcid = mlink->wcid;
+		}
+	}
+
 	t = (struct mt76_txwi_cache *)(txwi + mdev->drv->txwi_size);
 	t->skb = tx_info->skb;
 
@@ -1155,10 +1184,7 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		if (!is_8023 && mt7996_tx_use_mgmt(dev, tx_info->skb))
 			txp->fw.flags |= cpu_to_le16(MT_CT_INFO_MGMT_FRAME);
 
-		if (vif) {
-			struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-			struct mt76_vif_link *mlink = NULL;
-
+		if (mvif) {
 			if (wcid->offchannel)
 				mlink = rcu_dereference(mvif->mt76.offchannel_link);
 			if (!mlink)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index c26f8f49ce44..ef605e81cba9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -963,6 +963,7 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 
 		msta_link = &msta->deflink;
 		msta->deflink_id = link_id;
+		msta->seclink_id = msta->deflink_id;
 
 		for (i = 0; i < ARRAY_SIZE(sta->txq); i++) {
 			struct mt76_txq *mtxq;
@@ -977,6 +978,11 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 		msta_link = kzalloc(sizeof(*msta_link), GFP_KERNEL);
 		if (!msta_link)
 			return -ENOMEM;
+
+		if (msta->seclink_id == msta->deflink_id &&
+		    (sta->valid_links & ~BIT(msta->deflink_id)))
+			msta->seclink_id = __ffs(sta->valid_links &
+						 ~BIT(msta->deflink_id));
 	}
 
 	INIT_LIST_HEAD(&msta_link->rc_list);
@@ -1051,6 +1057,8 @@ mt7996_mac_sta_remove_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 		if (msta->deflink_id == link_id) {
 			msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 			continue;
+		} else if (msta->seclink_id == link_id) {
+			msta->seclink_id = IEEE80211_LINK_UNSPECIFIED;
 		}
 
 		kfree_rcu(msta_link, rcu_head);
@@ -1146,6 +1154,7 @@ mt7996_mac_sta_add(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 	mutex_lock(&dev->mt76.mutex);
 
 	msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+	msta->seclink_id = IEEE80211_LINK_UNSPECIFIED;
 	msta->vif = mvif;
 	err = mt7996_mac_sta_add_links(dev, vif, sta, links);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index f1892aaf6a91..2bb98df317a6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2394,8 +2394,8 @@ mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 	mld_setup->primary_id = cpu_to_le16(msta_link->wcid.idx);
 
 	if (nlinks > 1) {
-		link_id = __ffs(sta->valid_links & ~BIT(msta->deflink_id));
-		msta_link = mt76_dereference(msta->link[link_id], &dev->mt76);
+		msta_link = mt76_dereference(msta->link[msta->seclink_id],
+					     &dev->mt76);
 		if (!msta_link)
 			return;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 65eeb37ab8c7..c47820699ec8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -243,6 +243,7 @@ struct mt7996_sta {
 	struct mt7996_sta_link deflink; /* must be first */
 	struct mt7996_sta_link __rcu *link[IEEE80211_MLD_MAX_NUM_LINKS];
 	u8 deflink_id;
+	u8 seclink_id;
 
 	struct mt7996_vif *vif;
 };
-- 
2.51.0



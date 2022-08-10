Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6E5C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Aug 2022 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZeK40Ft+5R9q5wipXEInTBvncIlqpyvU0zkDu9KKEBM=; b=xZXvMeTowT71mt08fZhyiyveqM
	EqyMjEzOQ5DGx3QLEfYuaMTgF2KT8dxCBWllseYtXLf6Hu3FYOXERHxr4Xn2n6XKC5yruxIgHupjy
	iTb+fZWnTTY1jJXBMxlPk7tM+ezXdA1LTs28Mt8NYEdJrl1ZoxwVK05hl6pmTw+BO6t4vcJfKI1zj
	EWGQe4tlVuNaJSPQ+VrpfNb1f+IdPkhFCKXptBvmNwa9DH3F57uAz4Fvqzr79aeWHrIgwqD63VUo+
	H9rIFDbtHQPZZvGSUTXkTO5Gel90tmWR1iyZmgC0oV08UN6ACa7mROhvcdZkzv0mesRSCtT53oVT4
	LZapmhHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLpEU-00DD7X-Ss; Wed, 10 Aug 2022 17:11:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLpEN-00DD1p-Oi
	for linux-mediatek@lists.infradead.org; Wed, 10 Aug 2022 17:11:01 +0000
X-UUID: 369cdf6606fb40d0b26e30366cd7f44e-20220810
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:11fb6a02-38c6-42d0-8a62-347247622bec,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:c3f84c9c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 369cdf6606fb40d0b26e30366cd7f44e-20220810
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1088243171; Wed, 10 Aug 2022 10:10:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 11 Aug 2022 00:40:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 11 Aug 2022 00:40:45 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] mt76: move move mt76_sta_stats to mt76_wcid
Date: Thu, 11 Aug 2022 00:40:43 +0800
Message-ID: <a9ded159fd293b25c745dea966e5b00a2601e56d.1660092593.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_101055_985606_0532603B 
X-CRM114-Status: GOOD (  13.18  )
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
Message-ID: <20220810164043.JMCT0FFxzoHYSiiaJ9Zo6IISXYUHgCy3zs5MrO7xsAo@z>

This is a preliminary patch for WED's TxS support.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     | 42 ++++++++++---------
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  3 +-
 .../wireless/mediatek/mt76/mt76_connac_mac.c  |  4 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  3 +-
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  2 +-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 -
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  3 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  2 +-
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  1 -
 9 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 4da77d47b0a6..a45dd038b967 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -252,6 +252,26 @@ struct mt76_queue_ops {
 	void (*reset_q)(struct mt76_dev *dev, struct mt76_queue *q);
 };
 
+enum mt76_phy_type {
+	MT_PHY_TYPE_CCK,
+	MT_PHY_TYPE_OFDM,
+	MT_PHY_TYPE_HT,
+	MT_PHY_TYPE_HT_GF,
+	MT_PHY_TYPE_VHT,
+	MT_PHY_TYPE_HE_SU = 8,
+	MT_PHY_TYPE_HE_EXT_SU,
+	MT_PHY_TYPE_HE_TB,
+	MT_PHY_TYPE_HE_MU,
+	__MT_PHY_TYPE_HE_MAX,
+};
+
+struct mt76_sta_stats {
+	u64 tx_mode[__MT_PHY_TYPE_HE_MAX];
+	u64 tx_bw[4];		/* 20, 40, 80, 160 */
+	u64 tx_nss[4];		/* 1, 2, 3, 4 */
+	u64 tx_mcs[16];		/* mcs idx */
+};
+
 enum mt76_wcid_flags {
 	MT_WCID_FLAG_CHECK_PS,
 	MT_WCID_FLAG_PS,
@@ -299,6 +319,8 @@ struct mt76_wcid {
 
 	struct list_head list;
 	struct idr pktid;
+
+	struct mt76_sta_stats stats;
 };
 
 struct mt76_txq {
@@ -815,26 +837,6 @@ struct mt76_power_limits {
 	s8 ru[7][12];
 };
 
-enum mt76_phy_type {
-	MT_PHY_TYPE_CCK,
-	MT_PHY_TYPE_OFDM,
-	MT_PHY_TYPE_HT,
-	MT_PHY_TYPE_HT_GF,
-	MT_PHY_TYPE_VHT,
-	MT_PHY_TYPE_HE_SU = 8,
-	MT_PHY_TYPE_HE_EXT_SU,
-	MT_PHY_TYPE_HE_TB,
-	MT_PHY_TYPE_HE_MU,
-	__MT_PHY_TYPE_HE_MAX,
-};
-
-struct mt76_sta_stats {
-	u64 tx_mode[__MT_PHY_TYPE_HE_MAX];
-	u64 tx_bw[4];		/* 20, 40, 80, 160 */
-	u64 tx_nss[4];		/* 1, 2, 3, 4 */
-	u64 tx_mcs[16];		/* mcs idx */
-};
-
 struct mt76_ethtool_worker_info {
 	u64 *data;
 	int idx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index d03365530ac1..851874f782c5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -355,8 +355,7 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 				 struct ieee80211_key_conf *key, int pid,
 				 enum mt76_txq_id qid, u32 changed);
 bool mt76_connac2_mac_add_txs_skb(struct mt76_dev *dev, struct mt76_wcid *wcid,
-				  int pid, __le32 *txs_data,
-				  struct mt76_sta_stats *stats);
+				  int pid, __le32 *txs_data);
 void mt76_connac2_mac_decode_he_radiotap(struct mt76_dev *dev,
 					 struct sk_buff *skb,
 					 __le32 *rxv, u32 mode);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 18dea8e1fb20..d0a94cb6d08b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -551,9 +551,9 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 EXPORT_SYMBOL_GPL(mt76_connac2_mac_write_txwi);
 
 bool mt76_connac2_mac_add_txs_skb(struct mt76_dev *dev, struct mt76_wcid *wcid,
-				  int pid, __le32 *txs_data,
-				  struct mt76_sta_stats *stats)
+				  int pid, __le32 *txs_data)
 {
+	struct mt76_sta_stats *stats = &wcid->stats;
 	struct ieee80211_supported_band *sband;
 	struct mt76_phy *mphy;
 	struct ieee80211_tx_info *info;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 60ae834d95a6..3ae5f1359483 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1015,8 +1015,7 @@ static void mt7915_mac_add_txs(struct mt7915_dev *dev, void *data)
 
 	msta = container_of(wcid, struct mt7915_sta, wcid);
 
-	mt76_connac2_mac_add_txs_skb(&dev->mt76, wcid, pid, txs_data,
-				     &msta->stats);
+	mt76_connac2_mac_add_txs_skb(&dev->mt76, wcid, pid, txs_data);
 	if (!wcid->sta)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index bd3386bf0f8a..090c52803052 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1224,7 +1224,7 @@ static void mt7915_ethtool_worker(void *wi_data, struct ieee80211_sta *sta)
 	if (msta->vif->mt76.idx != wi->idx)
 		return;
 
-	mt76_ethtool_worker(wi, &msta->stats);
+	mt76_ethtool_worker(wi, &msta->wcid.stats);
 }
 
 static
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 54ef2a12a443..1eb11617a625 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -127,8 +127,6 @@ struct mt7915_sta {
 	unsigned long jiffies;
 	unsigned long ampdu_state;
 
-	struct mt76_sta_stats stats;
-
 	struct mt76_connac_sta_key_conf bip;
 
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 47f0aa81ab02..71596024d61d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -539,8 +539,7 @@ void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data)
 
 	msta = container_of(wcid, struct mt7921_sta, wcid);
 
-	mt76_connac2_mac_add_txs_skb(&dev->mt76, wcid, pid, txs_data,
-				     &msta->stats);
+	mt76_connac2_mac_add_txs_skb(&dev->mt76, wcid, pid, txs_data);
 	if (!wcid->sta)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 1438a9f8d1fd..e451280d9214 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1045,7 +1045,7 @@ mt7921_ethtool_worker(void *wi_data, struct ieee80211_sta *sta)
 	if (msta->vif->mt76.idx != wi->idx)
 		return;
 
-	mt76_ethtool_worker(wi, &msta->stats);
+	mt76_ethtool_worker(wi, &msta->wcid.stats);
 }
 
 static
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index c161031ac62a..ff109427b94c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -100,7 +100,6 @@ struct mt7921_sta {
 
 	unsigned long last_txs;
 	unsigned long ampdu_state;
-	struct mt76_sta_stats stats;
 
 	struct mt76_connac_sta_key_conf bip;
 };
-- 
2.36.1



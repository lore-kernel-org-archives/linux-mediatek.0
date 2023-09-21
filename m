Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4474BE7D0A2
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 21:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vwyy3Yxmaicnbmda91e2YwqDKMMX0W2HPT33lkRcdI8=; b=2ObGhHlUn2Nj44Yn4KMY48BWBT
	kti9Ak0tIT7IkSoO0VPO+Cp0bD85d4mTK4Ksy2rG+9JSlAKGon2OHZwxqcZ8PJAr4H8q+d3yxDWya
	G0CoFKh+eLRBPo5Ugr2qSgFECA95kWMdu5+nFEWFRN+fCt61YfW2f/ah3sltwLmoz7TLl7gw9hQos
	l3Xqes4AsGSO3exPMfho6S2G5dRSpEBkgke3eNlrOZf+dmRiagOpTIEo7gsGzRwBQU4vdKPxg5oNJ
	1Wpy9s7RxPYnWOIiEAEp7avUpOsYxKtYao0yMyagmmFvsMWYi0rwaBIRq2rHbM6r6VUjRC81OL+mm
	kJMqlmag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQqc-0079QY-02;
	Thu, 21 Sep 2023 21:04:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQqY-0079Od-1b
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 21:04:28 +0000
X-UUID: 6f28b91c58c211ee9b7791016c24628a-20230921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Vwyy3Yxmaicnbmda91e2YwqDKMMX0W2HPT33lkRcdI8=;
	b=aS/5Vfzh6d+zWWnyi1Mz+a/Vcdlh7VOzaDjK4D85Yd5MtYMC6jAE6piMYYkKcenxlYm0EwG0nPxFlnOJA6XYWGn9NA9aqYlYuX6gCC0Cg9QcWg3Gqzo+5sBRjlekc3Ci8pjTVyfN5OdhLVw+Hkc0IGoFWPfBoCNq1Yrm87w1+wA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:ec959602-7ddd-4c4b-97c7-b9242a87b98a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:11324fc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6f28b91c58c211ee9b7791016c24628a-20230921
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yi-chia.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 811199375; Thu, 21 Sep 2023 14:04:20 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 05:04:17 +0800
Received: from mussdccf250.mussds.eus.mediatek.inc (10.73.250.250) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 05:04:14 +0800
From: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>, Money Wang
	<Money.Wang@mediatek.com>
Subject: [PATCH v3 1/4] wifi: mt76: mt7996: get tx_retries and tx_failed from txfree
Date: Thu, 21 Sep 2023 14:04:00 -0700
Message-ID: <d698600dc16fc3880e75dd24e2338ac21d51a45a.1695329286.git.yi-chia.hsieh@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.436100-8.000000
X-TMASE-MatchedRID: hBPcN6g5NxXi9mOUjCQGLxUuRQtxMyQBUK80YYUAl4sXdhT0BAdFznf6
	Lj8RU1GvgfONumQ1QfdfxhAzc2dPJhLmJd2F/yFu9UVHiwLx0/JPn74Ug5EKECz+5QCTrE/svkE
	SpfBKzZSd+hadbvZSHMh3ymsKdHdu0ywZEqbRuQSiAZ3zAhQYglmLvTysL4PPTUobVis5Bb91V+
	LIUmKTyHmd/bhGlF1I3m2M6A2xWxxPXYdz0WFWNeKXavbHY/C1zjhG4bTm6hKbKItl61J/yZ+in
	TK0bC9eKrauXd3MZDX371moSn0VOIS0P2RhP4PyO4AtpkPwvvzVg50E4H/jkQtPWsP8JaiDzxJp
	yqZmdl9b4ZZQJ/B3fGcbgAb+RLrnXprqe3vYrk55HCv4Lr/VGRdGg+ZY7eN6THB2Q+oKru8MTI3
	4nyF36MJL1aANdU8Knqg/VrSZEiM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.436100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 58813013783525298B8935956AF9C4D1A45164F07018A8C25A34BB870F6FA4B22000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_140426_548783_9645B2A0 
X-CRM114-Status: GOOD (  12.33  )
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

Retrieve tx retries/failed counts from 'txfree done' events and report
them via mt7996_sta_statistics().

Signed-off-by: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Signed-off-by: Money Wang <Money.Wang@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2: split series
---
v3: rebase and update Signed-off-by
---
 .../wireless/mediatek/mt76/mt76_connac3_mac.h |  4 ++--
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 21 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  6 ++++++
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
index 87bfa441a937..d49fe24851be 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
@@ -271,11 +271,11 @@ enum tx_mgnt_type {
 #define MT_TXFREE0_MSDU_CNT		GENMASK(25, 16)
 #define MT_TXFREE0_RX_BYTE		GENMASK(15, 0)
 
-#define MT_TXFREE1_VER			GENMASK(18, 16)
+#define MT_TXFREE1_VER			GENMASK(19, 16)
 
 #define MT_TXFREE_INFO_PAIR		BIT(31)
 #define MT_TXFREE_INFO_HEADER		BIT(30)
-#define MT_TXFREE_INFO_WLAN_ID		GENMASK(23, 12)
+#define MT_TXFREE_INFO_MLD_ID		GENMASK(23, 12)
 #define MT_TXFREE_INFO_MSDU_ID		GENMASK(14, 0)
 #define MT_TXFREE_INFO_COUNT		GENMASK(27, 24)
 #define MT_TXFREE_INFO_STAT		GENMASK(29, 28)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index c43839a20508..d442746c8d96 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1070,6 +1070,7 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
 	struct mt76_phy *phy3 = mdev->phys[MT_BAND2];
 	struct mt76_txwi_cache *txwi;
 	struct ieee80211_sta *sta = NULL;
+	struct mt76_wcid *wcid;
 	LIST_HEAD(free_list);
 	struct sk_buff *skb, *tmp;
 	void *end = data + len;
@@ -1088,7 +1089,7 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
 		mt76_queue_tx_cleanup(dev, phy3->q_tx[MT_TXQ_BE], false);
 	}
 
-	if (WARN_ON_ONCE(le32_get_bits(tx_free[1], MT_TXFREE1_VER) < 4))
+	if (WARN_ON_ONCE(le32_get_bits(tx_free[1], MT_TXFREE1_VER) < 5))
 		return;
 
 	total = le32_get_bits(tx_free[0], MT_TXFREE0_MSDU_CNT);
@@ -1104,10 +1105,9 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
 		info = le32_to_cpu(*cur_info);
 		if (info & MT_TXFREE_INFO_PAIR) {
 			struct mt7996_sta *msta;
-			struct mt76_wcid *wcid;
 			u16 idx;
 
-			idx = FIELD_GET(MT_TXFREE_INFO_WLAN_ID, info);
+			idx = FIELD_GET(MT_TXFREE_INFO_MLD_ID, info);
 			wcid = rcu_dereference(dev->mt76.wcid[idx]);
 			sta = wcid_to_sta(wcid);
 			if (!sta)
@@ -1120,10 +1120,21 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
 					      &mdev->sta_poll_list);
 			spin_unlock_bh(&mdev->sta_poll_lock);
 			continue;
-		}
+		} else if (info & MT_TXFREE_INFO_HEADER) {
+			u32 tx_retries = 0, tx_failed = 0;
+
+			if (!wcid)
+				continue;
+
+			tx_retries =
+				FIELD_GET(MT_TXFREE_INFO_COUNT, info) - 1;
+			tx_failed = tx_retries +
+				!!FIELD_GET(MT_TXFREE_INFO_STAT, info);
 
-		if (info & MT_TXFREE_INFO_HEADER)
+			wcid->stats.tx_retries += tx_retries;
+			wcid->stats.tx_failed += tx_failed;
 			continue;
+		}
 
 		for (i = 0; i < 2; i++) {
 			msdu = (info >> (15 * i)) & MT_TXFREE_INFO_MSDU_ID;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index a2ab668a3b0f..0072809ae617 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -989,6 +989,12 @@ static void mt7996_sta_statistics(struct ieee80211_hw *hw,
 	sinfo->txrate.flags = txrate->flags;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
 
+	sinfo->tx_failed = msta->wcid.stats.tx_failed;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
+
+	sinfo->tx_retries = msta->wcid.stats.tx_retries;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
+
 	sinfo->ack_signal = (s8)msta->ack_signal;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL);
 
-- 
2.39.0



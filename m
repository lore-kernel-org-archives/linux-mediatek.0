Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CE1E7D0AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 21:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P0k2mEz6t9FYg1LBmxvu4t0PXlfcW4oJPKCQILk24hs=; b=a0xBACfIXlChLQg6AhE71goifs
	FUSQ+Me0YixEg4N5O162MwhEHYT19mHUnZxDSDXyhuUh+wQP9LyS3a0MGJQth+C5lQFoiabylgPSw
	OidtXND4jG8JgvxWSOQjoIf4L5tZGM7mcsb++kfsz/aLxGCs5Q0WoRJSOnwD/05z3M+IiNoEB+kng
	eaJYEi7B/3zNCvmZi3t61SVnwGYebSlDCrLmMY58q83HRi0WFXoxvEivd6DmMRv5VBViWaMTXuxgq
	em3SMVqhOPw6Lg49fAQCN5wH9p+a0K2E1l5bDsJJVQW0mwByRu4DQIxC8GoG8jdhjVBv/Z5hMwyxi
	KxNA8rRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQrt-0079iE-1F;
	Thu, 21 Sep 2023 21:05:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQrq-0079g5-0I
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 21:05:47 +0000
X-UUID: 9fd2299a58c211ee9b7791016c24628a-20230921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=P0k2mEz6t9FYg1LBmxvu4t0PXlfcW4oJPKCQILk24hs=;
	b=WzhjLVdfS4FLJfKZSnmXYaUTDpuWXoGLgw+j0P7q49rs8+rBkGKCrTcCfTTwRQIl4JFnXdbLrbHdfMJfo+ujIE5zZeI0jvfqebeRM2IRp27Fvo/PAWjtAvjt7t+lGNzIq2iIkzOwKUQ/etFPIsi4VycYgDCUzZbB7G8wLrBrI48=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:638c9b41-5c3f-44e9-ac8e-66c6e119ef65,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:55903814-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9fd2299a58c211ee9b7791016c24628a-20230921
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yi-chia.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1866521450; Thu, 21 Sep 2023 14:05:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 05:05:39 +0800
Received: from mussdccf250.mussds.eus.mediatek.inc (10.73.250.250) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 05:05:37 +0800
From: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>, Money Wang
	<Money.Wang@mediatek.com>
Subject: [PATCH v3] wifi: mt76: connac: report per-phy tx and rx byte to tpt_led
Date: Thu, 21 Sep 2023 14:05:35 -0700
Message-ID: <2614f84d8216414692296570d2fd6ac50c3409cf.1695329294.git.yi-chia.hsieh@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_140546_136139_5112CBF6 
X-CRM114-Status: GOOD (  13.30  )
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

Fix the issue where the tx and rx byte count is not reported to mac80211
when H/W path is binded.

Signed-off-by: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Signed-off-by: Money Wang <Money.Wang@mediatek.com>
Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2: split series
---
This patch is based on "wifi: mac80211: add exported tpt_led_trig function for softmac driver"
v3: rebase and update Signed-off-by
---
 .../net/wireless/mediatek/mt76/mt76_connac_mac.c  | 10 ++++++----
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c  |  5 +++++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c   | 15 +++++++++++----
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 93402d2c2538..158df5340d59 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -594,9 +594,15 @@ bool mt76_connac2_mac_fill_txs(struct mt76_dev *dev, struct mt76_wcid *wcid,
 
 	txs = le32_to_cpu(txs_data[0]);
 
+	mphy = mt76_dev_phy(dev, wcid->phy_idx);
+
 	/* PPDU based reporting */
 	if (mtk_wed_device_active(&dev->mmio.wed) &&
 	    FIELD_GET(MT_TXS0_TXS_FORMAT, txs) > 1) {
+		__ieee80211_tpt_led_trig_trx(mphy->hw,
+			le32_get_bits(txs_data[5], MT_TXS5_MPDU_TX_BYTE) -
+			le32_get_bits(txs_data[7], MT_TXS7_MPDU_RETRY_BYTE), 0);
+
 		stats->tx_bytes +=
 			le32_get_bits(txs_data[5], MT_TXS5_MPDU_TX_BYTE) -
 			le32_get_bits(txs_data[7], MT_TXS7_MPDU_RETRY_BYTE);
@@ -637,10 +643,6 @@ bool mt76_connac2_mac_fill_txs(struct mt76_dev *dev, struct mt76_wcid *wcid,
 		cck = true;
 		fallthrough;
 	case MT_PHY_TYPE_OFDM:
-		mphy = &dev->phy;
-		if (wcid->phy_idx == MT_BAND1 && dev->phys[MT_BAND1])
-			mphy = dev->phys[MT_BAND1];
-
 		if (mphy->chandef.chan->band == NL80211_BAND_5GHZ)
 			sband = &mphy->sband_5g.sband;
 		else if (mphy->chandef.chan->band == NL80211_BAND_6GHZ)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index fc7ace638ce8..acb71c4293ea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -657,6 +657,11 @@ static void mt7915_mmio_wed_update_rx_stats(struct mtk_wed_device *wed,
 
 	wcid = rcu_dereference(dev->mt76.wcid[idx]);
 	if (wcid) {
+		struct mt76_phy *mphy = mt76_dev_phy(&dev->mt76, wcid->phy_idx);
+
+		__ieee80211_tpt_led_trig_trx(mphy->hw, 0
+					     le32_to_cpu(stats->rx_byte_cnt));
+
 		wcid->stats.rx_bytes += le32_to_cpu(stats->rx_byte_cnt);
 		wcid->stats.rx_packets += le32_to_cpu(stats->rx_pkt_cnt);
 		wcid->stats.rx_errors += le32_to_cpu(stats->rx_err_cnt);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index bf917beb9439..974795dae1bd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -463,6 +463,8 @@ mt7996_mcu_rx_all_sta_info_event(struct mt7996_dev *dev, struct sk_buff *skb)
 		u8 ac;
 		u16 wlan_idx;
 		struct mt76_wcid *wcid;
+		struct mt76_phy *mphy;
+		u32 tx_bytes, rx_bytes;
 
 		switch (le16_to_cpu(res->tag)) {
 		case UNI_ALL_STA_TXRX_ADM_STAT:
@@ -472,11 +474,16 @@ mt7996_mcu_rx_all_sta_info_event(struct mt7996_dev *dev, struct sk_buff *skb)
 			if (!wcid)
 				break;
 
+			mphy = mt76_dev_phy(&dev->mt76, wcid->phy_idx);
 			for (ac = 0; ac < IEEE80211_NUM_ACS; ac++) {
-				wcid->stats.tx_bytes +=
-					le32_to_cpu(res->adm_stat[i].tx_bytes[ac]);
-				wcid->stats.rx_bytes +=
-					le32_to_cpu(res->adm_stat[i].rx_bytes[ac]);
+				tx_bytes = le32_to_cpu(res->adm_stat[i].tx_bytes[ac]);
+				rx_bytes = le32_to_cpu(res->adm_stat[i].rx_bytes[ac]);
+
+				wcid->stats.tx_bytes += tx_bytes;
+				wcid->stats.rx_bytes += rx_bytes;
+
+				__ieee80211_tpt_led_trig_trx(mphy->hw,
+							     tx_bytes, rx_bytes);
 			}
 			break;
 		case UNI_ALL_STA_TXRX_MSDU_COUNT:
-- 
2.39.0



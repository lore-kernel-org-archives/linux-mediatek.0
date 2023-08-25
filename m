Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C782C6787B
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 17:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0S1E7xlsWymcxOZrInyHy703KhMNzR3Qwo0utAtB1Xc=; b=OV1a31Dk6YkjVYcArFFPwVXZYx
	n1OB60p9SA9LrZ+6ninwcrnToAI/YcP0xkhKsRAWl7TTNGpjlIlWkUJ4FD2r6eD+TPXZjCQ1Www6R
	m1x+z7U8E395Op3gxQy+nGXRYuh8YGZkDLxTQZzqDKkK3ScQceAKoR9KR9gLz6pKR2xeGcwYfjq5e
	wvbXkn7XD6d5JQVv8GXlyJHOJh53ymYURNQt/+60zfGP3mHaG6MT+aLJHuojmM9kQhtDwbH2XyuN7
	FDzW146UBFV//FIumf4JnymtbjKsOiRX4j8by8PlUCqIaF0UPZYpAU5PITl6dv4r3FXy2xYiww86n
	+hoXfa4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZauM-005oWH-0Q;
	Fri, 25 Aug 2023 17:47:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZauI-005oUz-1j
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Aug 2023 17:47:39 +0000
X-UUID: 7a05c87e436f11ee83ed1395ce914268-20230825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0S1E7xlsWymcxOZrInyHy703KhMNzR3Qwo0utAtB1Xc=;
	b=dP79w3rYN76UXoExoUYAamWU2KsmCI3q3U6aF6CMu6MxBm3g9IaMeQzNHaCIJ2wnfsFf0+w3uGVQa3upzbp1p8hZia9Gs00YvRs7+cHWvuLgd00DP/AWM/sDjFebscS9nfLXTISemEfGuaTN22ZLkxepi8+skNfDxXCbOeDg+tI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:6b2bfbd9-6f2b-4228-b8d6-79d37319e6a0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:c2f83113-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7a05c87e436f11ee83ed1395ce914268-20230825
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yi-chia.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 469959970; Fri, 25 Aug 2023 10:47:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 26 Aug 2023 01:47:33 +0800
Received: from mussdccf250.mussds.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 26 Aug 2023 01:47:31 +0800
From: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Subject: [PATCH 6/6] wifi: mt76: report per-phy tx and rx byte to tpt_led
Date: Fri, 25 Aug 2023 10:47:09 -0700
Message-ID: <2f35b3920391a747069588717ecbadac82c1caa5.1692983967.git.yi-chia.hsieh@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <09f0cb7f314a08eddb77298411d965ad30a847bb.1692983967.git.yi-chia.hsieh@mediatek.com>
References: <09f0cb7f314a08eddb77298411d965ad30a847bb.1692983967.git.yi-chia.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_104738_575225_FE788DFB 
X-CRM114-Status: GOOD (  12.76  )
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
---
 .../net/wireless/mediatek/mt76/mt76_connac_mac.c  | 10 ++++++----
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c  |  5 +++++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c   | 15 +++++++++++----
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index ee5177fd6dde..ff3cefadaa7c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -608,9 +608,15 @@ bool mt76_connac2_mac_fill_txs(struct mt76_dev *dev, struct mt76_wcid *wcid,
 
 	txs = le32_to_cpu(txs_data[0]);
 
+	mphy = mt76_dev_phy(dev, wcid->phy_idx);
+
 	/* PPDU based reporting */
 	if (mtk_wed_device_active(&dev->mmio.wed) &&
 	    FIELD_GET(MT_TXS0_TXS_FORMAT, txs) > 1) {
+		ieee80211_tpt_led_trig_tx(mphy->hw,
+			le32_get_bits(txs_data[5], MT_TXS5_MPDU_TX_BYTE) -
+			le32_get_bits(txs_data[7], MT_TXS7_MPDU_RETRY_BYTE));
+
 		stats->tx_bytes +=
 			le32_get_bits(txs_data[5], MT_TXS5_MPDU_TX_BYTE) -
 			le32_get_bits(txs_data[7], MT_TXS7_MPDU_RETRY_BYTE);
@@ -651,10 +657,6 @@ bool mt76_connac2_mac_fill_txs(struct mt76_dev *dev, struct mt76_wcid *wcid,
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
index fc7ace638ce8..c1ed6aa5cc3b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -657,6 +657,11 @@ static void mt7915_mmio_wed_update_rx_stats(struct mtk_wed_device *wed,
 
 	wcid = rcu_dereference(dev->mt76.wcid[idx]);
 	if (wcid) {
+		struct mt76_phy *mphy = mt76_dev_phy(&dev->mt76, wcid->phy_idx);
+
+		ieee80211_tpt_led_trig_rx(mphy->hw,
+					  le32_to_cpu(stats->rx_byte_cnt));
+
 		wcid->stats.rx_bytes += le32_to_cpu(stats->rx_byte_cnt);
 		wcid->stats.rx_packets += le32_to_cpu(stats->rx_pkt_cnt);
 		wcid->stats.rx_errors += le32_to_cpu(stats->rx_err_cnt);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 923e6f006cee..4222343de2f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -461,6 +461,8 @@ mt7996_mcu_rx_all_sta_info_event(struct mt7996_dev *dev, struct sk_buff *skb)
 		u8 ac;
 		u16 wlan_idx;
 		struct mt76_wcid *wcid;
+		struct mt76_phy *mphy;
+		u32 tx_bytes, rx_bytes;
 
 		switch (le16_to_cpu(res->tag)) {
 		case UNI_ALL_STA_TXRX_ADM_STAT:
@@ -470,11 +472,16 @@ mt7996_mcu_rx_all_sta_info_event(struct mt7996_dev *dev, struct sk_buff *skb)
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
+				ieee80211_tpt_led_trig_tx(mphy->hw, tx_bytes);
+				ieee80211_tpt_led_trig_rx(mphy->hw, rx_bytes);
 			}
 			break;
 		case UNI_ALL_STA_TXRX_MSDU_COUNT:
-- 
2.39.0



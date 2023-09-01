Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364E6CA0FE1
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 06:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BhnDfWDXa6DYCcjXesBaYeNhRORD2rVc7+FtCEOQ2F8=; b=3hKLMClTMX0oFfBno1JgX3iFPU
	xV70XUSlgN9ReRTP5S/VmyNsAqyHtVhRe+LEC0w/GZEG6ha7W/qRPMVxb48JsOCeePsskPGr2DWHj
	rNt+ikKS38s6XwlKF8HcOBD/Z29xy4I3g5wHtZfZBy2XKzOdTGJlAJ9xzO3zsOgAEChTjjuP6dKu5
	GAGyZ9EjwwesfPnw1/0W5TgKxmLI/1Kds4IcnOJBalcMyC+GO8RtuUCGESx3WX0SLelqvRJJOQzYd
	7hiJjh3NrEGI6Mp2W68dNN9PhbmOijSsc+1JpZaMSe2VkVG0FfviaMSQGPasARoUcDbKroXsrXKJ8
	2sjdLXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qby48-00GZS0-2Q;
	Fri, 01 Sep 2023 06:55:36 +0000
Received: from mailgw02.mediatek.com ([66.171.122.166])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qby45-00GZRh-1f
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Sep 2023 06:55:34 +0000
X-UUID: 86f50ef8489411ee86758d4a7c00f3a0-20230831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BhnDfWDXa6DYCcjXesBaYeNhRORD2rVc7+FtCEOQ2F8=;
	b=qRdM6xIOdMioPwqrFkIa04RDBpFCFGF2nEb0Kg/jGn3Iia3IiKlyYA110bjnjK6CIER5PuEld/uvvN7JDZiNEQWMZzxb9ve7TbPoU96b7SueeVqXbfYMKZQ6VI4MHncjp76EGNCi17Lw3v49Scru8kDoCXQOuJveSjdsByG4qaY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:75a552bd-09b6-450b-ab72-a101bf4d3046,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:0ad78a4,CLOUDID:ca210020-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:N
	O,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 86f50ef8489411ee86758d4a7c00f3a0-20230831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yi-chia.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 860568678; Thu, 31 Aug 2023 23:55:25 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Sep 2023 14:34:49 +0800
Received: from mussdccf250.mussds.eus.mediatek.inc (10.73.250.250) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Sep 2023 14:34:41 +0800
From: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Subject: [PATCH v2] wifi: mt76: connac: report per-phy tx and rx byte to tpt_led
Date: Thu, 31 Aug 2023 23:34:38 -0700
Message-ID: <f6871dc0ed3c39064501a635ab56b57e5c440b0b.1693549283.git.yi-chia.hsieh@mediatek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_235533_591220_9226D5AC 
X-CRM114-Status: GOOD (  13.12  )
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
This patch is based on "wifi: mac80211: export ieee80211_tpt_led_trig_tx/rx for driver".
v2: split series
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



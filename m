Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA17C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 01:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t/3cMdplP6bvfk49doZdF/4hC0mH6rLs2Pb0c5MFHbc=; b=IsFjMUgvR7OvsjTY18dqvyhHpo
	x2nQv1Xv5HJEWwjXfgNPZm1oHPXpt4jBk3Fp3YJO2ZpxPnhDLmN0i35CiexVQgrfchAafCZxsbJQK
	A0+kDfGqerZln/3HdmOPnSS5rOeTpsB2amZlqyimGEkBGA7RW6lDHdsmMlTO5GQjDStA06gD8Amng
	WXFApP1TBMb5YQKVCmrx+ZATmV7uTa7mmU8UdY+ymcsSJC6p1RBXpAlZsEVp+aDxA1orxhLfErZC3
	7I+k2O33EGMazDtogiUKWrSARjbeVBUr0JlsEQGQgW2UEmC6z+YdhXbU/920dIuryTOfJ4oplY4tI
	mSou0W8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oswpR-001knE-IH; Thu, 10 Nov 2022 01:58:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oswpO-001km3-Eo
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 01:58:03 +0000
X-UUID: 378bde726ec54955afaa7e119086e51b-20221109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=t/3cMdplP6bvfk49doZdF/4hC0mH6rLs2Pb0c5MFHbc=;
	b=KdYJbhI/zKdVnDf7M5MufOE5fZmVgkME6R77/qIGGKR+n1mV5Ys3zKoOc11U32m7Pp8mk1ndFiGBBHwLdeJBaxBLehjSY9vPWj9fUIk8yb/kG3iUdGmgiyS5vaqmAe/c3Ekwel8G0aAVijP5vT62NwDa08GUEyEsYhK5jOZEUos=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:f0ac956a-d76f-43ee-9dac-dcc8aa0a77ad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:4eeb1d5d-100c-4555-952b-a62c895efded,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 378bde726ec54955afaa7e119086e51b-20221109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1607981468; Wed, 09 Nov 2022 18:57:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 10 Nov 2022 09:37:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 10 Nov 2022 09:37:12 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: fix incorrect tx path number configuration
Date: Thu, 10 Nov 2022 09:37:01 +0800
Message-ID: <20221110013701.14790-1-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_175802_521168_BEA27967 
X-CRM114-Status: GOOD (  12.94  )
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

For a variant of mt7916, it supports up to 3 tx/rx paths but only 2
spatial streams. This implies that it has one more path to support
beamform. The correct tx/rx path number shall be configured to make sure
beamform works properly.

Fixes: 66065073177b ("wifi: mt76: mt7915: deal with special variant of mt7916")
Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>

---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c |  8 ++++----
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  | 16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 6de49b93387e..0ebaed174d5d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -953,7 +953,7 @@ mt7915_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 	struct mt7915_dev *dev = mt7915_hw_dev(hw);
 	struct mt7915_phy *phy = mt7915_hw_phy(hw);
 	int max_nss = hweight8(hw->wiphy->available_antennas_tx);
-	bool ext_phy = phy != &dev->phy;
+	u8 chainshift = dev->chainshift;
 
 	if (!tx_ant || tx_ant != rx_ant || ffs(tx_ant) > max_nss)
 		return -EINVAL;
@@ -963,10 +963,10 @@ mt7915_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 	phy->mt76->antenna_mask = tx_ant;
 
 	/* handle a variant of mt7916 which has 3T3R but nss2 on 5 GHz band */
-	if (is_mt7916(&dev->mt76) && ext_phy && hweight8(tx_ant) == max_nss)
-		phy->mt76->chainmask = dev->chainmask >> dev->chainshift;
+	if (is_mt7916(&dev->mt76) && phy->band_idx && hweight8(tx_ant) == max_nss)
+		phy->mt76->chainmask = (dev->chainmask >> chainshift) << chainshift;
 	else
-		phy->mt76->chainmask = tx_ant << (dev->chainshift * ext_phy);
+		phy->mt76->chainmask = tx_ant << (chainshift * phy->band_idx);
 
 	mt76_set_stream_caps(phy->mt76, true);
 	mt7915_set_stream_vht_txbf_caps(phy);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 65ae959859e7..790d690fabc3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2632,8 +2632,8 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 		u8 control_ch;
 		u8 center_ch;
 		u8 bw;
-		u8 tx_streams_num;
-		u8 rx_streams;	/* mask or num */
+		u8 tx_path_num;
+		u8 rx_path;	/* mask or num */
 		u8 switch_reason;
 		u8 band_idx;
 		u8 center_ch2;	/* for 80+80 only */
@@ -2649,8 +2649,8 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 		.control_ch = chandef->chan->hw_value,
 		.center_ch = ieee80211_frequency_to_channel(freq1),
 		.bw = mt76_connac_chan_bw(chandef),
-		.tx_streams_num = hweight8(phy->mt76->antenna_mask),
-		.rx_streams = phy->mt76->antenna_mask,
+		.tx_path_num = hweight16(phy->mt76->chainmask),
+		.rx_path = phy->mt76->chainmask >> (dev->chainshift * phy->band_idx),
 		.band_idx = phy->band_idx,
 		.channel_band = ch_band[chandef->chan->band],
 	};
@@ -2658,13 +2658,13 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 #ifdef CONFIG_NL80211_TESTMODE
 	if (phy->mt76->test.tx_antenna_mask &&
 	    mt76_testmode_enabled(phy->mt76)) {
-		req.tx_streams_num = fls(phy->mt76->test.tx_antenna_mask);
-		req.rx_streams = phy->mt76->test.tx_antenna_mask;
+		req.tx_path_num = fls(phy->mt76->test.tx_antenna_mask);
+		req.rx_path = phy->mt76->test.tx_antenna_mask;
 	}
 #endif
 
 	if (mt76_connac_spe_idx(phy->mt76->antenna_mask))
-		req.tx_streams_num = fls(phy->mt76->antenna_mask);
+		req.tx_path_num = fls(phy->mt76->antenna_mask);
 
 	if (cmd == MCU_EXT_CMD(SET_RX_PATH) ||
 	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
@@ -2678,7 +2678,7 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 		req.switch_reason = CH_SWITCH_NORMAL;
 
 	if (cmd == MCU_EXT_CMD(CHANNEL_SWITCH))
-		req.rx_streams = hweight8(req.rx_streams);
+		req.rx_path = hweight8(req.rx_path);
 
 	if (chandef->width == NL80211_CHAN_WIDTH_80P80) {
 		int freq2 = chandef->center_freq2;
-- 
2.18.0



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED404C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 08:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HiV/XwbEQ2TsUgzJlSXfhQA2dWy8EkVjQlqp2OV1acA=; b=vE95C/jwY5zxtU
	uIi975G1waH4cw7FodvrQ4qOylIVytXIxSDmjb+wzn8/O777dWKk03TdsSjU2RwVOiy25dWTfccOH
	XZB2D3eWqsvbXDtsQZBxlMxCgnTGep6mCBo1LcdqgLvnjx18EpA/NkuP/2UtLDEJDyyuM1PZonhd1
	SXFkugOhVpsO8W17Fblh2VxP4B9BpgSWtEpOAzyv4QOJB9bpY2QpGWvbUHAV2WZc0kNqXV+WFXYu/
	Ft6Wmd5ankSZ9fXYQsnVqT5TBBBbmZ52f+12GBppW2tAEq3s3ywrTyrPAOTP7mJ7R3hxIP5oRbsZ8
	tUhz9zHDTqzWHj9Qh/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ2t5-008tjC-DE; Fri, 04 Mar 2022 08:02:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ2t2-008th6-CR
 for linux-mediatek@lists.infradead.org; Fri, 04 Mar 2022 08:02:05 +0000
X-UUID: ba11db7fbd3941fc93d34ab2752a59c9-20220304
X-UUID: ba11db7fbd3941fc93d34ab2752a59c9-20220304
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <meichia.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 453774926; Fri, 04 Mar 2022 01:02:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 00:02:00 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 4 Mar 2022 16:01:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Mar 2022 16:01:59 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee
 <ryder.lee@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, MeiChia Chiu
 <MeiChia.Chiu@mediatek.com>
Subject: [PATCH 4/4] mt76: mt7915: add txpower init for 6GHz
Date: Fri, 4 Mar 2022 16:01:20 +0800
Message-ID: <20220304080120.3907-4-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220304080120.3907-1-MeiChia.Chiu@mediatek.com>
References: <20220304080120.3907-1-MeiChia.Chiu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_000204_479067_9B018441 
X-CRM114-Status: GOOD (  15.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Shayne Chen <shayne.chen@mediatek.com>

Add support to init txpower values of 6GHz band.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/eeprom.c    | 15 +++++++++++----
 .../net/wireless/mediatek/mt76/mt7915/eeprom.h    | 13 ++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7915/init.c  |  2 ++
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 317c3bc2db44..5b133bcdab17 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -282,8 +282,8 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 			if (!tssi_on)
 				target_power += eeprom[index + 1];
 		}
-	} else {
-		int group = mt7915_get_channel_group(chan->hw_value, is_7976);
+	} else if (chan->band == NL80211_BAND_5GHZ) {
+		int group = mt7915_get_channel_group_5g(chan->hw_value, is_7976);
 
 		if (is_7976) {
 			index = MT_EE_TX0_POWER_5G_V2 + chain_idx * 5;
@@ -295,6 +295,11 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 			if (!tssi_on)
 				target_power += eeprom[index + 8];
 		}
+	} else {
+		int group = mt7915_get_channel_group_6g(chan->hw_value);
+
+		index = MT_EE_TX0_POWER_6G_V2 + chain_idx * 8;
+		target_power = is_7976 ? eeprom[index + group] : 0;
 	}
 
 	return target_power;
@@ -309,12 +314,14 @@ s8 mt7915_eeprom_get_power_delta(struct mt7915_dev *dev, int band)
 
 	if (band == NL80211_BAND_2GHZ)
 		offs = is_7976 ? MT_EE_RATE_DELTA_2G_V2 : MT_EE_RATE_DELTA_2G;
-	else
+	else if (band == NL80211_BAND_5GHZ)
 		offs = is_7976 ? MT_EE_RATE_DELTA_5G_V2 : MT_EE_RATE_DELTA_5G;
+	else
+		offs = is_7976 ? MT_EE_RATE_DELTA_6G_V2 : 0;
 
 	val = eeprom[offs];
 
-	if (!(val & MT_EE_RATE_DELTA_EN))
+	if (!offs || !(val & MT_EE_RATE_DELTA_EN))
 		return 0;
 
 	delta = FIELD_GET(MT_EE_RATE_DELTA_MASK, val);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index 45760917c54d..7578ac6d0be6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -25,8 +25,10 @@ enum mt7915_eeprom_field {
 	MT_EE_TX0_POWER_5G =	0x34b,
 	MT_EE_RATE_DELTA_2G_V2 = 0x7d3,
 	MT_EE_RATE_DELTA_5G_V2 = 0x81e,
+	MT_EE_RATE_DELTA_6G_V2 = 0x884, /* 6g fields only appear in eeprom v2 */
 	MT_EE_TX0_POWER_2G_V2 =	0x441,
 	MT_EE_TX0_POWER_5G_V2 =	0x445,
+	MT_EE_TX0_POWER_6G_V2 =	0x465,
 	MT_EE_ADIE_FT_VERSION =	0x9a0,
 
 	__MT_EE_MAX =		0xe00,
@@ -103,7 +105,7 @@ enum mt7915_sku_rate_group {
 };
 
 static inline int
-mt7915_get_channel_group(int channel, bool is_7976)
+mt7915_get_channel_group_5g(int channel, bool is_7976)
 {
 	if (is_7976) {
 		if (channel <= 64)
@@ -134,6 +136,15 @@ mt7915_get_channel_group(int channel, bool is_7976)
 	return 7;
 }
 
+static inline int
+mt7915_get_channel_group_6g(int channel)
+{
+	if (channel <= 29)
+		return 0;
+
+	return DIV_ROUND_UP(channel - 29, 32);
+}
+
 static inline bool
 mt7915_tssi_enabled(struct mt7915_dev *dev, enum nl80211_band band)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 3f3ddde0415d..03739f019e76 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -312,6 +312,7 @@ mt7915_regd_notifier(struct wiphy *wiphy,
 
 	mt7915_init_txpower(dev, &mphy->sband_2g.sband);
 	mt7915_init_txpower(dev, &mphy->sband_5g.sband);
+	mt7915_init_txpower(dev, &mphy->sband_6g.sband);
 
 	mphy->dfs_state = MT_DFS_STATE_UNKNOWN;
 	mt7915_dfs_init_radar_detector(phy);
@@ -558,6 +559,7 @@ static void mt7915_init_work(struct work_struct *work)
 	mt7915_mac_init(dev);
 	mt7915_init_txpower(dev, &dev->mphy.sband_2g.sband);
 	mt7915_init_txpower(dev, &dev->mphy.sband_5g.sband);
+	mt7915_init_txpower(dev, &dev->mphy.sband_6g.sband);
 	mt7915_txbf_init(dev);
 }
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

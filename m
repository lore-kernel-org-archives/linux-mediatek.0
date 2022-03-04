Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D9EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 08:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVU+HpW879FeYfio35wFB9dMOxvsZ4aRIM7P1ZwhYhk=; b=wCe5haqbij5VMv
	iPZ5Y2xBDdSecji2fVK2RrainmKz7LfhXWlug0sSHJuClbmkq8ryi9WP1u71wJpEmAZgxPpzZVF5+
	IoO2SmTgaHdiFthqWnR96P091yHT5aeDtRkff9MnSTLvyNijbxlItdbVHpfpYwvntu9k/wxPjW0Cq
	WakLL7R8/TgP5QFGYDL5igXYvBhDRYKVQQuzpiqaXsUgZxKGtWqeiQBaasg+Wr9W+l+FNpfH1uecs
	xyprRIrdezPa90kGsqmfJ5EyR9wKY1Xggr9pBPwd1R6Lq3BcZYEe9Jct48I07OynYqRg0GE0kAsu0
	/rhbxnniu20Q0Zf/ZQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ2t6-008tjv-MO; Fri, 04 Mar 2022 08:02:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ2t3-008thq-Ft
 for linux-mediatek@lists.infradead.org; Fri, 04 Mar 2022 08:02:07 +0000
X-UUID: 801eab117de1496183d57697ad7919da-20220304
X-UUID: 801eab117de1496183d57697ad7919da-20220304
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <meichia.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1178017774; Fri, 04 Mar 2022 01:01:59 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 00:01:58 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 16:01:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Mar 2022 16:01:56 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee
 <ryder.lee@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, MeiChia Chiu
 <MeiChia.Chiu@mediatek.com>
Subject: [PATCH 3/4] mt76: mt7915: fix eeprom fields of txpower init values
Date: Fri, 4 Mar 2022 16:01:19 +0800
Message-ID: <20220304080120.3907-3-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220304080120.3907-1-MeiChia.Chiu@mediatek.com>
References: <20220304080120.3907-1-MeiChia.Chiu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_000205_578860_9F7FC2DE 
X-CRM114-Status: GOOD (  14.26  )
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

A-die 7976 has different offset and uses different channel group
definition on txpower init values.

Fixes: 99ad32a4ca3a ("mt76: mt7915: add support for MT7986")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/eeprom.c    | 52 ++++++++++---------
 .../wireless/mediatek/mt76/mt7915/eeprom.h    | 14 ++++-
 2 files changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 136a6adab3df..317c3bc2db44 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -263,32 +263,38 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 {
 	u8 *eeprom = dev->mt76.eeprom.data;
 	int index, target_power;
-	bool tssi_on;
+	bool tssi_on, is_7976;
 
 	if (chain_idx > 3)
 		return -EINVAL;
 
 	tssi_on = mt7915_tssi_enabled(dev, chan->band);
+	is_7976 = mt7915_check_adie(dev, false) || is_mt7916(&dev->mt76);
 
 	if (chan->band == NL80211_BAND_2GHZ) {
-		u32 power = is_mt7915(&dev->mt76) ?
-			    MT_EE_TX0_POWER_2G : MT_EE_TX0_POWER_2G_V2;
-
-		index = power + chain_idx * 3;
-		target_power = eeprom[index];
+		if (is_7976) {
+			index = MT_EE_TX0_POWER_2G_V2 + chain_idx;
+			target_power = eeprom[index];
+		} else {
+			index = MT_EE_TX0_POWER_2G + chain_idx * 3;
+			target_power = eeprom[index];
 
-		if (!tssi_on)
-			target_power += eeprom[index + 1];
+			if (!tssi_on)
+				target_power += eeprom[index + 1];
+		}
 	} else {
-		int group = mt7915_get_channel_group(chan->hw_value);
-		u32 power = is_mt7915(&dev->mt76) ?
-			    MT_EE_TX0_POWER_5G : MT_EE_TX0_POWER_5G_V2;
+		int group = mt7915_get_channel_group(chan->hw_value, is_7976);
 
-		index = power + chain_idx * 12;
-		target_power = eeprom[index + group];
+		if (is_7976) {
+			index = MT_EE_TX0_POWER_5G_V2 + chain_idx * 5;
+			target_power = eeprom[index + group];
+		} else {
+			index = MT_EE_TX0_POWER_5G + chain_idx * 12;
+			target_power = eeprom[index + group];
 
-		if (!tssi_on)
-			target_power += eeprom[index + 8];
+			if (!tssi_on)
+				target_power += eeprom[index + 8];
+		}
 	}
 
 	return target_power;
@@ -297,20 +303,16 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 s8 mt7915_eeprom_get_power_delta(struct mt7915_dev *dev, int band)
 {
 	u8 *eeprom = dev->mt76.eeprom.data;
-	u32 val;
+	u32 val, offs;
 	s8 delta;
-	u32 rate_2g, rate_5g;
-
-	rate_2g = is_mt7915(&dev->mt76) ?
-		  MT_EE_RATE_DELTA_2G : MT_EE_RATE_DELTA_2G_V2;
-
-	rate_5g = is_mt7915(&dev->mt76) ?
-		  MT_EE_RATE_DELTA_5G : MT_EE_RATE_DELTA_5G_V2;
+	bool is_7976 = mt7915_check_adie(dev, false) || is_mt7916(&dev->mt76);
 
 	if (band == NL80211_BAND_2GHZ)
-		val = eeprom[rate_2g];
+		offs = is_7976 ? MT_EE_RATE_DELTA_2G_V2 : MT_EE_RATE_DELTA_2G;
 	else
-		val = eeprom[rate_5g];
+		offs = is_7976 ? MT_EE_RATE_DELTA_5G_V2 : MT_EE_RATE_DELTA_5G;
+
+	val = eeprom[offs];
 
 	if (!(val & MT_EE_RATE_DELTA_EN))
 		return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index 5dad5b0b5ac6..45760917c54d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -103,8 +103,20 @@ enum mt7915_sku_rate_group {
 };
 
 static inline int
-mt7915_get_channel_group(int channel)
+mt7915_get_channel_group(int channel, bool is_7976)
 {
+	if (is_7976) {
+		if (channel <= 64)
+			return 0;
+		if (channel <= 96)
+			return 1;
+		if (channel <= 128)
+			return 2;
+		if (channel <= 144)
+			return 3;
+		return 4;
+	}
+
 	if (channel >= 184 && channel <= 196)
 		return 0;
 	if (channel <= 48)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C02EC36013
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Mar 2025 05:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcpZ0NAZA8cTF+XSio1AuvxxcEEqepGgX0shaqdGr8E=; b=a5qaPFeeNdOLRDebOHv2uhs06f
	zDAj5VP5+dvpYov2s8lUTkPRJ8vTOm4xCAZ+9w/32CXgdGi/hD+uuzkVqXT1Il4L0nUbGx9Xr/otg
	7cBexZpZ3j0v/MSxCOaDIjUfOlTZm+HRZ7znwMfcZWlTW70xYmGXFlk5gkfJ8Af8Qro2sMHWYcbWN
	9ZbGQy233cD1NfGHvMGszWcwSBVGnMuNjtSvUu8c574C+CYXIx/Zx9l6j80n6xZj6ejCMrWx1BBif
	n2ENlZwh9jrCMTplGVFF64QlKCBTMxWxWj0Ca5gzWTI8/72PBpKe/96fvEQCfh3bZQpZpXLrxOmPx
	eXvXpkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2fS-0000000CgCh-0wqN;
	Fri, 28 Mar 2025 05:54:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2fN-0000000Cg8W-1X4p
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Mar 2025 05:54:06 +0000
X-UUID: 0baa7bce0b9911f083f2a1c9db70dae0-20250327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DcpZ0NAZA8cTF+XSio1AuvxxcEEqepGgX0shaqdGr8E=;
	b=KtuU6AHKXDG91MLE4/TvJV32/qyjbI6F8A0R1sl8OZCGLPVfOH1X/n62vutSqpWd2EPErijgvKCzZGwuYp/Znht3RslU4NDxjauFiTD1fQGzqNez9SICKT186cFWzHlbBjLHwnGDk/rx5yqqqmfWBKYvWglYo2RQyEPGwoYvG7U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:2b08e80e-72bd-440a-9abb-800386f1a64f,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:7258ef8c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0baa7bce0b9911f083f2a1c9db70dae0-20250327
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1957881969; Thu, 27 Mar 2025 22:54:00 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 28 Mar 2025 13:53:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 28 Mar 2025 13:53:58 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 09/10] wifi: mt76: mt7996: rework background radar check for mt7990
Date: Fri, 28 Mar 2025 13:50:57 +0800
Message-ID: <20250328055058.1648755-10-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328055058.1648755-1-shayne.chen@mediatek.com>
References: <20250328055058.1648755-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_225405_406021_D09D2118 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

The mt7990 comes in 2T2R+1R and 3T3R variants on 5 GHz band, with only
the former supporting background radar.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7996/eeprom.c    | 27 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/init.c  |  2 +-
 .../wireless/mediatek/mt76/mt7996/mt7996.h    | 20 +-------------
 3 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index 6f3eb053ef02..ca67a2c4b6a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -376,3 +376,30 @@ s8 mt7996_eeprom_get_power_delta(struct mt7996_dev *dev, int band)
 
 	return val & MT_EE_RATE_DELTA_SIGN ? delta : -delta;
 }
+
+bool mt7996_eeprom_has_background_radar(struct mt7996_dev *dev)
+{
+	switch (mt76_chip(&dev->mt76)) {
+	case MT7996_DEVICE_ID:
+		if (dev->var.type == MT7996_VAR_TYPE_233)
+			return false;
+		break;
+	case MT7992_DEVICE_ID:
+		if (dev->var.type == MT7992_VAR_TYPE_23)
+			return false;
+		break;
+	case MT7990_DEVICE_ID: {
+		u8 path, rx_path, nss, *eeprom = dev->mt76.eeprom.data;
+
+		mt7996_eeprom_parse_stream(eeprom, MT_BAND1, &path, &rx_path, &nss);
+		/* Disable background radar capability in 3T3R */
+		if (path == 3 || rx_path == 3)
+			return false;
+		break;
+	}
+	default:
+		return false;
+	}
+
+	return true;
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 9192fbdbc7da..3bbf6041c96d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -475,7 +475,7 @@ mt7996_init_wiphy(struct ieee80211_hw *hw, struct mtk_wed_device *wed)
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_MU_MIMO_AIR_SNIFFER);
 
-	if (mt7996_has_background_radar(dev) &&
+	if (mt7996_eeprom_has_background_radar(dev) &&
 	    (!mdev->dev->of_node ||
 	     !of_property_read_bool(mdev->dev->of_node,
 				    "mediatek,disable-radar-background")))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 92b01ed82e7e..a45cd3ff61a0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -488,25 +488,6 @@ mt7996_band_valid(struct mt7996_dev *dev, u8 band)
 	return band <= MT_BAND2;
 }
 
-static inline bool
-mt7996_has_background_radar(struct mt7996_dev *dev)
-{
-	switch (mt76_chip(&dev->mt76)) {
-	case MT7996_DEVICE_ID:
-		if (dev->var.type == MT7996_VAR_TYPE_233)
-			return false;
-		break;
-	case MT7992_DEVICE_ID:
-		if (dev->var.type == MT7992_VAR_TYPE_23)
-			return false;
-		break;
-	default:
-		return false;
-	}
-
-	return true;
-}
-
 static inline struct mt7996_phy *
 mt7996_band_phy(struct mt7996_dev *dev, enum nl80211_band band)
 {
@@ -570,6 +551,7 @@ int mt7996_eeprom_parse_hw_cap(struct mt7996_dev *dev, struct mt7996_phy *phy);
 int mt7996_eeprom_get_target_power(struct mt7996_dev *dev,
 				   struct ieee80211_channel *chan);
 s8 mt7996_eeprom_get_power_delta(struct mt7996_dev *dev, int band);
+bool mt7996_eeprom_has_background_radar(struct mt7996_dev *dev);
 int mt7996_dma_init(struct mt7996_dev *dev);
 void mt7996_dma_reset(struct mt7996_dev *dev, bool force);
 void mt7996_dma_prefetch(struct mt7996_dev *dev);
-- 
2.39.2



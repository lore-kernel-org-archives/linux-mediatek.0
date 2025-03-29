Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6CFC3601A
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Mar 2025 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJqPSvW3legVf68IBGMYdGpGWIoSCQ6yJDaCy+vwc3w=; b=r/JQjBPTt065n2DrL22CFcGcEN
	UjZ1DhWFv06oW+ZFDeWOeCV6kX9SS6Prd5xGbaMJrjBUZwkJHi8QaxIACz8J6RMtZHaWxkv8v1s7R
	XcOzddKszgGAgKSzEqXA8YhAkCP4l6Gp6HDQOPhfsXfFA36ATowZgFONcfknzwcp5m335l0pWUqUR
	fLAwinDkj0FjlUqBRmvDEB+kw0zBupFmtzfcJkCwTyb9BqvZNMUcpWzF7TvyI3Lcq4o9KQIM1yzTi
	l7B0F9npYLyVw4Yhxwux4f/ll1pz7HT3ipWz536jj4lvqrcZuJah1V1qwhCnIvFYQ/1lw0s0OBg10
	pIRf9IQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyYPX-0000000FHk2-3xdr;
	Sat, 29 Mar 2025 15:47:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyYPT-0000000FHfK-2ixJ
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Mar 2025 15:47:49 +0000
X-UUID: 25bbfc5a0cb511f0a1e849db4cc18d44-20250329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HJqPSvW3legVf68IBGMYdGpGWIoSCQ6yJDaCy+vwc3w=;
	b=fyLmYUg8yzt045fZJsALrn7egsVM4EodW/BVSW9Cyq8/nysRJJ1eHl2UufB4yDQLMBNX2vqrCrHx77YDtnFrkP7HLP16p9K9vos0KEQfgi/qPlrGHTcFxO1goBZr39HKJiyz8nUf6BqpMlueVcX2kndlNKRpc/IBebzJP4V6sKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7c1d9bf7-2197-4425-afb5-6dadeb75cf70,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:e2f9b64a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 25bbfc5a0cb511f0a1e849db4cc18d44-20250329
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1268422964; Sat, 29 Mar 2025 08:47:41 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 29 Mar 2025 23:47:38 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 29 Mar 2025 23:47:38 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76-next v2 09/10] wifi: mt76: mt7996: rework background radar check for mt7990
Date: Sat, 29 Mar 2025 23:47:29 +0800
Message-ID: <20250329154731.2113551-10-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250329154731.2113551-1-shayne.chen@mediatek.com>
References: <20250329154731.2113551-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_084747_730123_077C3131 
X-CRM114-Status: GOOD (  10.68  )
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
index 9a8b10c50f72..e26451add9a3 100644
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



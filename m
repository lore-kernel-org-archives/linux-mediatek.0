Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26077C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 15:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fir2BhM41H223iYDuYp4wdkC6rgz1IKz8jiDYFGDqjw=; b=ipwNhfpNLAmcDqYDU60ZWoWAgj
	cXvM4pCJW1KDlycEYmCHWc76sfbsClQ1ac+qCMLOePRubOojwtKCinXW1s5OdvL2cAmpqy6cVSFgc
	4/jScYH3IMBZVBHLwa+IfeoVvI06J5aFuQBvqBGjvwA8MRc/YCwXfgGx13jDtfHzV7umsgJjwuLvL
	iOC+A+QYEMRkR9BpXWQRbOmCYz7S8JWGar4iQqrqFzrEjvPYDMXsbsjfS7XD0ceA8oqksI7Xyayb+
	ts5bJ9WAscmHHCYFzM15SLM/ZxjV7Za6BDZtXPKBUCT/bkaKHISAFxxgm/BrV2xcgJkIDVKqI/3Zp
	VgQAoFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHjF-00A5pS-NY; Fri, 30 Sep 2022 15:15:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHiP-00A5N4-O6
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 15:14:16 +0000
X-UUID: a6aebb9ec3c34ba5811d0a090a17eb0d-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Fir2BhM41H223iYDuYp4wdkC6rgz1IKz8jiDYFGDqjw=;
	b=isCfbG/fGbKG2TK7Yzrz7urysIPzyulz1NVMU4Dijg3aBVr9llb8J/eJtGeou0W9xiyMuEaKAAJO6ySyIq7BM8hMuWUy4phYHubG3kBvPZia92A9VxTYgxTmM/N2yVveGOaJ+8kQiXnZ+K7JKMNBVXb3lcEoG1oJX0L650uO6bw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:687102c1-0bad-4be5-b3a7-66cd710f548c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:1251cde4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a6aebb9ec3c34ba5811d0a090a17eb0d-20220930
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1586496798; Fri, 30 Sep 2022 08:14:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 30 Sep 2022 23:13:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 23:13:32 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 1/6] wifi: mt76: mt7915: rework eeprom tx paths and streams init
Date: Fri, 30 Sep 2022 23:13:10 +0800
Message-ID: <20220930151315.19012-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_081413_855195_A93487B0 
X-CRM114-Status: GOOD (  12.97  )
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

Rework tx paths and streams init part to improve readability, and make
sure that the available tx streams should be smaller than or equal to
the available tx paths.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/eeprom.c    | 55 +++++++------------
 .../wireless/mediatek/mt76/mt7915/eeprom.h    |  5 --
 2 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 4b1a9811646f..e2482c65d639 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -173,60 +173,47 @@ static void mt7915_eeprom_parse_band_config(struct mt7915_phy *phy)
 void mt7915_eeprom_parse_hw_cap(struct mt7915_dev *dev,
 				struct mt7915_phy *phy)
 {
-	u8 nss, nss_band, nss_band_max, *eeprom = dev->mt76.eeprom.data;
+	u8 path, nss, nss_max = 4, *eeprom = dev->mt76.eeprom.data;
 	struct mt76_phy *mphy = phy->mt76;
-	bool ext_phy = phy != &dev->phy;
 
 	mt7915_eeprom_parse_band_config(phy);
 
-	/* read tx/rx mask from eeprom */
+	/* read tx/rx path from eeprom */
 	if (is_mt7915(&dev->mt76)) {
-		nss = FIELD_GET(MT_EE_WIFI_CONF0_TX_PATH,
-				eeprom[MT_EE_WIFI_CONF]);
+		path = FIELD_GET(MT_EE_WIFI_CONF0_TX_PATH,
+				 eeprom[MT_EE_WIFI_CONF]);
 	} else {
-		nss = FIELD_GET(MT_EE_WIFI_CONF0_TX_PATH,
-				eeprom[MT_EE_WIFI_CONF + phy->band_idx]);
+		path = FIELD_GET(MT_EE_WIFI_CONF0_TX_PATH,
+				 eeprom[MT_EE_WIFI_CONF + phy->band_idx]);
 	}
 
-	if (!nss || nss > 4)
-		nss = 4;
+	if (!path || path > 4)
+		path = 4;
 
 	/* read tx/rx stream */
-	nss_band = nss;
-
+	nss = path;
 	if (dev->dbdc_support) {
 		if (is_mt7915(&dev->mt76)) {
-			nss_band = FIELD_GET(MT_EE_WIFI_CONF3_TX_PATH_B0,
-					     eeprom[MT_EE_WIFI_CONF + 3]);
+			nss = FIELD_GET(MT_EE_WIFI_CONF3_TX_PATH_B0,
+					eeprom[MT_EE_WIFI_CONF + 3]);
 			if (phy->band_idx)
-				nss_band = FIELD_GET(MT_EE_WIFI_CONF3_TX_PATH_B1,
-						     eeprom[MT_EE_WIFI_CONF + 3]);
+				nss = FIELD_GET(MT_EE_WIFI_CONF3_TX_PATH_B1,
+						eeprom[MT_EE_WIFI_CONF + 3]);
 		} else {
-			nss_band = FIELD_GET(MT_EE_WIFI_CONF_STREAM_NUM,
-					     eeprom[MT_EE_WIFI_CONF + 2 + phy->band_idx]);
+			nss = FIELD_GET(MT_EE_WIFI_CONF_STREAM_NUM,
+					eeprom[MT_EE_WIFI_CONF + 2 + phy->band_idx]);
 		}
 
-		nss_band_max = is_mt7986(&dev->mt76) ?
-			       MT_EE_NSS_MAX_DBDC_MA7986 : MT_EE_NSS_MAX_DBDC_MA7915;
-	} else {
-		nss_band_max = is_mt7986(&dev->mt76) ?
-			       MT_EE_NSS_MAX_MA7986 : MT_EE_NSS_MAX_MA7915;
+		if (!is_mt7986(&dev->mt76))
+			nss_max = 2;
 	}
 
-	if (!nss_band || nss_band > nss_band_max)
-		nss_band = nss_band_max;
-
-	if (nss_band > nss) {
-		dev_warn(dev->mt76.dev,
-			 "nss mismatch, nss(%d) nss_band(%d) band(%d) ext_phy(%d)\n",
-			 nss, nss_band, phy->band_idx, ext_phy);
-		nss = nss_band;
-	}
+	nss = min_t(u8, min_t(u8, nss_max, nss), path);
 
-	mphy->chainmask = BIT(nss) - 1;
-	if (ext_phy)
+	mphy->chainmask = BIT(path) - 1;
+	if (phy->band_idx)
 		mphy->chainmask <<= dev->chainshift;
-	mphy->antenna_mask = BIT(nss_band) - 1;
+	mphy->antenna_mask = BIT(nss) - 1;
 	dev->chainmask |= mphy->chainmask;
 	dev->chainshift = hweight8(dev->mphy.chainmask);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index 7578ac6d0be6..f3e56817d36e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -58,11 +58,6 @@ enum mt7915_eeprom_field {
 #define MT_EE_RATE_DELTA_SIGN			BIT(6)
 #define MT_EE_RATE_DELTA_EN			BIT(7)
 
-#define MT_EE_NSS_MAX_MA7915			4
-#define MT_EE_NSS_MAX_DBDC_MA7915		2
-#define MT_EE_NSS_MAX_MA7986			4
-#define MT_EE_NSS_MAX_DBDC_MA7986		4
-
 enum mt7915_adie_sku {
 	MT7976_ONE_ADIE_DBDC = 0x7,
 	MT7975_ONE_ADIE	= 0x8,
-- 
2.25.1



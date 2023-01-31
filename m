Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F88C636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkO5aTZN1uf1h2I1D8925XdCyN6nmzdlQkdnQhsjLpU=; b=F7oXyxQGLPrHez5gc0LN3IhaHs
	STcIpifRXQO5bY2BBtQtiP7aNnfcfTyOk3v8ECHwiAQnPCsNT1lOtnYFUGlqOyxxDAncBqZcCRi9D
	dqGyw0U+KLz8dME4icjX/7uGdInThDYbccV88EbbcB78d23zYeuv6L/0kYpiWvdgYT2fdTMwaNvvx
	wYEJj2P0KnpwoILF2xKMuSaeQILnz4B2DeTPmOx58qfIRK1pduP/a3cnNJIqko2UywrJipKPkksRo
	UWly6U92GFYaF/7bcGoSZWc02tCFvHdN/tk5NvGbY3nfpRLxz+DSAJ99KUCgz4WjdC7PL0Cu6v8yq
	UbWWO3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnsR-007PF8-LY; Tue, 31 Jan 2023 10:28:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnDp-0077Wg-8w
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 09:46:40 +0000
X-UUID: 244961b8a14c11edbbe3f76fe852e059-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vkO5aTZN1uf1h2I1D8925XdCyN6nmzdlQkdnQhsjLpU=;
	b=Z5DUmPcbvmcVSL3GUf6w+YjtjYI16lz1sNE5z9lJ0FoAOECFkafa9JFpgibCTA6XQdMaXD4HfCtiACiIZuQHeemMk42f0EPeQ5sD0sEjBYB9+pZggEWNd18EvDAMBBpdw6ic5ARIEBi1boViGzlhP/yCl/+8XQYKyt0We3FtSK0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:846eca25-a8ff-4d64-bdcc-f6c48fcdb65a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:6075758d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 244961b8a14c11edbbe3f76fe852e059-20230131
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1692751654; Tue, 31 Jan 2023 02:46:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 31 Jan 2023 17:36:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 17:36:29 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 03/13] wifi: mt76: connac: add helpers for EHT capability
Date: Tue, 31 Jan 2023 17:36:01 +0800
Message-ID: <20230131093611.30914-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230131093611.30914-1-shayne.chen@mediatek.com>
References: <20230131093611.30914-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_014637_389338_EF2FFD19 
X-CRM114-Status: GOOD (  12.65  )
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

Add helpers to get eht cap and phymode on different bands and vifs.
This is the preliminary patch to add EHT support for mt7996.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 46 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  4 ++
 2 files changed, 50 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 5a047e630860..efb9bfaa187f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1329,6 +1329,40 @@ u8 mt76_connac_get_phy_mode(struct mt76_phy *phy, struct ieee80211_vif *vif,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_get_phy_mode);
 
+u8 mt76_connac_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
+				enum nl80211_band band)
+{
+	const struct ieee80211_sta_eht_cap *eht_cap;
+	struct ieee80211_supported_band *sband;
+	u8 mode = 0;
+
+	if (band == NL80211_BAND_6GHZ)
+		mode |= PHY_MODE_AX_6G;
+
+	sband = phy->hw->wiphy->bands[band];
+	eht_cap = ieee80211_get_eht_iftype_cap(sband, vif->type);
+
+	if (!eht_cap || !eht_cap->has_eht)
+		return mode;
+
+	switch (band) {
+	case NL80211_BAND_6GHZ:
+		mode |= PHY_MODE_BE_6G;
+		break;
+	case NL80211_BAND_5GHZ:
+		mode |= PHY_MODE_BE_5G;
+		break;
+	case NL80211_BAND_2GHZ:
+		mode |= PHY_MODE_BE_24G;
+		break;
+	default:
+		break;
+	}
+
+	return mode;
+}
+EXPORT_SYMBOL_GPL(mt76_connac_get_phy_mode_ext);
+
 const struct ieee80211_sta_he_cap *
 mt76_connac_get_he_phy_cap(struct mt76_phy *phy, struct ieee80211_vif *vif)
 {
@@ -1341,6 +1375,18 @@ mt76_connac_get_he_phy_cap(struct mt76_phy *phy, struct ieee80211_vif *vif)
 }
 EXPORT_SYMBOL_GPL(mt76_connac_get_he_phy_cap);
 
+const struct ieee80211_sta_eht_cap *
+mt76_connac_get_eht_phy_cap(struct mt76_phy *phy, struct ieee80211_vif *vif)
+{
+	enum nl80211_band band = phy->chandef.chan->band;
+	struct ieee80211_supported_band *sband;
+
+	sband = phy->hw->wiphy->bands[band];
+
+	return ieee80211_get_eht_iftype_cap(sband, vif->type);
+}
+EXPORT_SYMBOL_GPL(mt76_connac_get_eht_phy_cap);
+
 #define DEFAULT_HE_PE_DURATION		4
 #define DEFAULT_HE_DURATION_RTS_THRES	1023
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index ebd64bec9f68..2c22f60cc56d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1872,8 +1872,12 @@ void mt76_connac_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32 val);
 
 const struct ieee80211_sta_he_cap *
 mt76_connac_get_he_phy_cap(struct mt76_phy *phy, struct ieee80211_vif *vif);
+const struct ieee80211_sta_eht_cap *
+mt76_connac_get_eht_phy_cap(struct mt76_phy *phy, struct ieee80211_vif *vif);
 u8 mt76_connac_get_phy_mode(struct mt76_phy *phy, struct ieee80211_vif *vif,
 			    enum nl80211_band band, struct ieee80211_sta *sta);
+u8 mt76_connac_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
+				enum nl80211_band band);
 
 int mt76_connac_mcu_add_key(struct mt76_dev *dev, struct ieee80211_vif *vif,
 			    struct mt76_connac_sta_key_conf *sta_key_conf,
-- 
2.25.1



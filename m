Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F3DC5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM0NwOGFlLu9vFSEUrdZRsSrF/f4poIqUeaQPkLxJi8=; b=r8U1lVgjj7HK9vBCtjaPiyEzLP
	QdOikqJAIXkkijBcA6T/Y3E1Fg1UIY3yZQSAf59G6UxEtaS+iawuIwECToleSyOr/B7uKRRxWlP6x
	TkWp9dzvy8s+/d1e53UwkvLxz1d4zAfVIgTBvW7Ybsri2+jMw6pDus/4Qhat24IkBpnXyYQnMAjuo
	ot9lmIfcAOjnndnS/8QUP3sjEaAel0bRIv9KFzwgnrj3lkj01qIN8O+4bT/7A5/y5373frp6DOCPO
	MJrcoCoiu7b04PxTnctIjH6KHtZ86p2nFfUwUPbXroe419rMLDuTVMNZCXM5kHxvzmQlB+w7qCgD1
	GBOtu5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvdC-002nEb-19; Mon, 09 Jan 2023 17:08:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvd9-002nCz-1o
	for linux-mediatek@lists.infradead.org; Mon, 09 Jan 2023 17:08:16 +0000
X-UUID: 32dba99e41a449aea7fb94c0f43ed7de-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eM0NwOGFlLu9vFSEUrdZRsSrF/f4poIqUeaQPkLxJi8=;
	b=PJBZ8okeiXrOD6YX040Hb+T2Xg0ipE0ozKgU56Rlz5XwBHn6+jguWn1rCdVxdVU+3Dx2lROnDvyqQkFDRzd7qgvSonOxtOLIF6CzH4Le2CTgg7gGEctnouzxyqO7LcEbOs6ukpKuEAslbfE75x978BTxnLGEz1Jfggcr48aRhYo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:5e227838-132d-4277-b9e4-0e3fa6603f22,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:ec2f2154-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 32dba99e41a449aea7fb94c0f43ed7de-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 281044690; Mon, 09 Jan 2023 10:08:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 00:58:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 00:58:04 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 03/13] wifi: mt76: connac: add helpers for EHT capability
Date: Tue, 10 Jan 2023 00:57:21 +0800
Message-ID: <20230109165731.682-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109165731.682-1-shayne.chen@mediatek.com>
References: <20230109165731.682-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_090815_140245_F0E09332 
X-CRM114-Status: GOOD (  12.52  )
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
index 947b0900daec..efba24bd3c6b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1870,8 +1870,12 @@ void mt76_connac_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32 val);
 
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



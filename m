Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A85C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D0XND4IqUDrMYvtjEGFEdGFtiy9DYjSDrg5ZgTztJ7M=; b=cVTZkbj0qdaNmdnIWSVJfwS5jO
	6g5g3HJLauI6SKoSKaSf0I9ZOFc8pwMkwSfvSLlgJHTwZZlMthTqR/zs3RlCJ/3GA3XsPily9kyJI
	9jpgKmecUEzOB4QFJIJTln5cG/jbzxQLvdOTVWz22pr178jo537ZtX4gW/YXHmpCbQp/dU/Lot9y5
	86H4U5r0dpiZU8hmPEppuedty8iP0bFHrQ3XXJPlNlq4ooLSDuW6hVMYja8KfUay37XCWL7VXFfVz
	ZskSubagJGL/mr21BABpEbladMPHupW8JuUJIJhyexMkW8n2iG/HkVnEZDq7gPyQkPrfv5GvLlmCV
	3tzl3nkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qux4j-007idi-1l;
	Mon, 23 Oct 2023 15:42:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qux4f-007icJ-1M
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 15:42:38 +0000
X-UUID: c837bbe671ba11ee86758d4a7c00f3a0-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=D0XND4IqUDrMYvtjEGFEdGFtiy9DYjSDrg5ZgTztJ7M=;
	b=IMXXNZRPEWTHYg0NntxqYIUhrrsRJdx7ABldlZHp5Qa83vEC3K0WcgW0PN0di75vpsbx/vATEEIbr5hACGaRRqWSCxADjHOwjuAdTMJ59giyUQKtr9zBogLe8SZRIf0rV3HQba2jVIQoyeXmaLpF19TRrgoTdIGafwyl3giR8tw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:fa12d40a-c4bf-4dc9-8f2b-e1343eace51b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:9d96abfb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: c837bbe671ba11ee86758d4a7c00f3a0-20231023
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 290228663; Mon, 23 Oct 2023 08:42:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 23:41:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 23:41:58 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Subject: [PATCH 01/11] wifi: mt76: mt7996: add support for variants with auxiliary RX path
Date: Mon, 23 Oct 2023 23:38:44 +0800
Message-ID: <20231023153854.10708-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_084237_462790_3E2499A8 
X-CRM114-Status: GOOD (  16.01  )
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

Add support to correctly configure the rx chainmask of variants that
have additional auxiliary RX path. e.g., 4T5R.
The auxiliary RX path is transparent to driver, but driver needs to
correctly configure it in the set channel fw command.

Co-developed-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7996/eeprom.c    | 21 +++++++++++++++----
 .../wireless/mediatek/mt76/mt7996/eeprom.h    |  3 +++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   |  2 +-
 .../wireless/mediatek/mt76/mt7996/mt7996.h    | 14 +++++++++++++
 4 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index 544b6c6f1ea3..9db7e531076d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -148,36 +148,49 @@ static int mt7996_eeprom_parse_band_config(struct mt7996_phy *phy)
 
 int mt7996_eeprom_parse_hw_cap(struct mt7996_dev *dev, struct mt7996_phy *phy)
 {
-	u8 path, nss, band_idx = phy->mt76->band_idx;
+	u8 path, rx_path, nss, band_idx = phy->mt76->band_idx;
 	u8 *eeprom = dev->mt76.eeprom.data;
 	struct mt76_phy *mphy = phy->mt76;
+	int max_path = 5, max_nss = 4;
 	int ret;
 
 	switch (band_idx) {
 	case MT_BAND1:
 		path = FIELD_GET(MT_EE_WIFI_CONF2_TX_PATH_BAND1,
 				 eeprom[MT_EE_WIFI_CONF + 2]);
+		rx_path = FIELD_GET(MT_EE_WIFI_CONF3_RX_PATH_BAND1,
+				    eeprom[MT_EE_WIFI_CONF + 3]);
 		nss = FIELD_GET(MT_EE_WIFI_CONF5_STREAM_NUM_BAND1,
 				eeprom[MT_EE_WIFI_CONF + 5]);
 		break;
 	case MT_BAND2:
 		path = FIELD_GET(MT_EE_WIFI_CONF2_TX_PATH_BAND2,
 				 eeprom[MT_EE_WIFI_CONF + 2]);
+		rx_path = FIELD_GET(MT_EE_WIFI_CONF4_RX_PATH_BAND2,
+				    eeprom[MT_EE_WIFI_CONF + 4]);
 		nss = FIELD_GET(MT_EE_WIFI_CONF5_STREAM_NUM_BAND2,
 				eeprom[MT_EE_WIFI_CONF + 5]);
 		break;
 	default:
 		path = FIELD_GET(MT_EE_WIFI_CONF1_TX_PATH_BAND0,
 				 eeprom[MT_EE_WIFI_CONF + 1]);
+		rx_path = FIELD_GET(MT_EE_WIFI_CONF3_RX_PATH_BAND0,
+				    eeprom[MT_EE_WIFI_CONF + 3]);
 		nss = FIELD_GET(MT_EE_WIFI_CONF4_STREAM_NUM_BAND0,
 				eeprom[MT_EE_WIFI_CONF + 4]);
 		break;
 	}
 
-	if (!path || path > 4)
-		path = 4;
+	if (!path || path > max_path)
+		path = max_path;
 
-	nss = min_t(u8, min_t(u8, 4, nss), path);
+	if (!nss || nss > max_nss)
+		nss = max_nss;
+
+	nss = min_t(u8, nss, path);
+
+	if (path != rx_path)
+		phy->has_aux_rx = true;
 
 	mphy->antenna_mask = BIT(nss) - 1;
 	mphy->chainmask = (BIT(path) - 1) << dev->chainshift[band_idx];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
index 0c749774f6b1..412d6e2f8014 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
@@ -33,6 +33,9 @@ enum mt7996_eeprom_field {
 #define MT_EE_WIFI_CONF1_TX_PATH_BAND0		GENMASK(5, 3)
 #define MT_EE_WIFI_CONF2_TX_PATH_BAND1		GENMASK(2, 0)
 #define MT_EE_WIFI_CONF2_TX_PATH_BAND2		GENMASK(5, 3)
+#define MT_EE_WIFI_CONF3_RX_PATH_BAND0		GENMASK(2, 0)
+#define MT_EE_WIFI_CONF3_RX_PATH_BAND1		GENMASK(5, 3)
+#define MT_EE_WIFI_CONF4_RX_PATH_BAND2		GENMASK(2, 0)
 #define MT_EE_WIFI_CONF4_STREAM_NUM_BAND0	GENMASK(5, 3)
 #define MT_EE_WIFI_CONF5_STREAM_NUM_BAND1	GENMASK(2, 0)
 #define MT_EE_WIFI_CONF5_STREAM_NUM_BAND2	GENMASK(5, 3)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 61de5e041627..e379ac4cc5d3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3299,7 +3299,7 @@ int mt7996_mcu_set_chan_info(struct mt7996_phy *phy, u16 tag)
 		.center_ch = ieee80211_frequency_to_channel(freq1),
 		.bw = mt76_connac_chan_bw(chandef),
 		.tx_path_num = hweight16(phy->mt76->chainmask),
-		.rx_path = phy->mt76->chainmask >> dev->chainshift[band_idx],
+		.rx_path = mt7996_rx_chainmask(phy) >> dev->chainshift[band_idx],
 		.band_idx = band_idx,
 		.channel_band = ch_band[chandef->chan->band],
 	};
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index e7818b2b253f..6acc0ae286fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -210,6 +210,8 @@ struct mt7996_phy {
 
 	struct mt76_mib_stats mib;
 	struct mt76_channel_state state_ts;
+
+	bool has_aux_rx;
 };
 
 struct mt7996_dev {
@@ -501,6 +503,18 @@ static inline void mt7996_irq_disable(struct mt7996_dev *dev, u32 mask)
 void mt7996_memcpy_fromio(struct mt7996_dev *dev, void *buf, u32 offset,
 			  size_t len);
 
+static inline u16 mt7996_rx_chainmask(struct mt7996_phy *phy)
+{
+	int max_nss = hweight8(phy->mt76->hw->wiphy->available_antennas_tx);
+	int cur_nss = hweight8(phy->mt76->antenna_mask);
+	u16 tx_chainmask = phy->mt76->chainmask;
+
+	if (cur_nss != max_nss)
+		return tx_chainmask;
+
+	return tx_chainmask | (BIT(fls(tx_chainmask)) * phy->has_aux_rx);
+}
+
 void mt7996_mac_init(struct mt7996_dev *dev);
 u32 mt7996_mac_wtbl_lmac_addr(struct mt7996_dev *dev, u16 wcid, u8 dw);
 bool mt7996_mac_wtbl_update(struct mt7996_dev *dev, int idx, u32 mask);
-- 
2.39.2



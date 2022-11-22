Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F152C43219
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cz2hRvwAA222Ko9eUmi+gmUgEpr2uwtHyTfISsqXX3o=; b=GmvKk1l1pCzaG90J1ef599uyQE
	SkJIDuCX6/JB+8em2cSNbd8SdethlDDoD0jbLEb6Fvw1pVxYn27hfDeR2lbtfQgqXv31MMJZVxDPB
	HUigkY8s5Z7SPfhLRc1eZ8OHm+LlYtOpdapinUv7tR1yY85CTxPxwfMGFnyGHwiM6/6XY+KoQaHtz
	cQ/gDP/N/SNK9QVbADqmcRSZxrEwo6klmU/wdMN1fCI0dQI2Icg29PxNvTztjc/ziL3Zlzq76WyTe
	qi/7o9u1tBVl0RMqz9aQ/QyWoUaHUhdV4pOZsD5p6yLiQuHBXflTdDdcCFAVCBy/G4vo8ik9wyz40
	6g+DbwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxP1F-006bcy-Fa; Tue, 22 Nov 2022 08:52:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxP1A-006baK-VF
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 08:52:40 +0000
X-UUID: 20ddc3df29ac4c738ada0553b44184f6-20221122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cz2hRvwAA222Ko9eUmi+gmUgEpr2uwtHyTfISsqXX3o=;
	b=G3K0YVsLTsCgDBhNPYmNFwS/eJ6UWYbtzLvXt0sYQvQ0uKkUss6krd1AgIuP83GJbbo/1IlCMpXEHk9lQz8aieHbcyRAol4VfHjXmKMVFCv39MsR37p49ujr2AKlhXoOsPW+bQix71BenSFlN4nWjXkS7RlTXqdtYA7fYKG20AA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:ea6af8df-f04a-4716-b908-b5d9d1672ef3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:8ee4e5db-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 20ddc3df29ac4c738ada0553b44184f6-20221122
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 437135726; Tue, 22 Nov 2022 01:52:25 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 22 Nov 2022 16:51:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 22 Nov 2022 16:51:58 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 4/9] wifi: mt76: mt7996: add EEPROM support
Date: Tue, 22 Nov 2022 16:45:49 +0800
Message-ID: <20221122084554.9494-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221122084554.9494-1-shayne.chen@mediatek.com>
References: <20221122084554.9494-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_005237_031684_71E286D0 
X-CRM114-Status: GOOD (  19.82  )
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

(Split the big patch into smaller intermediate patches by functionality
for easier review. Refer to the cover letter for more info.)

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7996/eeprom.c    | 229 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7996/eeprom.h    |  75 ++++++
 2 files changed, 304 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
new file mode 100644
index 000000000000..b9f62bedbc48
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Copyright (C) 2022 MediaTek Inc.
+ */
+
+#include <linux/firmware.h>
+#include "mt7996.h"
+#include "eeprom.h"
+
+static int mt7996_check_eeprom(struct mt7996_dev *dev)
+{
+	u8 *eeprom = dev->mt76.eeprom.data;
+	u16 val = get_unaligned_le16(eeprom);
+
+	switch (val) {
+	case 0x7990:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static char *mt7996_eeprom_name(struct mt7996_dev *dev)
+{
+	/* reserve for future variants */
+	return MT7996_EEPROM_DEFAULT;
+}
+
+static int
+mt7996_eeprom_load_default(struct mt7996_dev *dev)
+{
+	u8 *eeprom = dev->mt76.eeprom.data;
+	const struct firmware *fw = NULL;
+	int ret;
+
+	ret = request_firmware(&fw, mt7996_eeprom_name(dev), dev->mt76.dev);
+	if (ret)
+		return ret;
+
+	if (!fw || !fw->data) {
+		dev_err(dev->mt76.dev, "Invalid default bin\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	memcpy(eeprom, fw->data, MT7996_EEPROM_SIZE);
+	dev->flash_mode = true;
+
+out:
+	release_firmware(fw);
+
+	return ret;
+}
+
+static int mt7996_eeprom_load(struct mt7996_dev *dev)
+{
+	int ret;
+
+	ret = mt76_eeprom_init(&dev->mt76, MT7996_EEPROM_SIZE);
+	if (ret < 0)
+		return ret;
+
+	if (ret) {
+		dev->flash_mode = true;
+	} else {
+		u8 free_block_num;
+		u32 block_num, i;
+
+		/* TODO: check free block event */
+		mt7996_mcu_get_eeprom_free_block(dev, &free_block_num);
+		/* efuse info not enough */
+		if (free_block_num >= 59)
+			return -EINVAL;
+
+		/* read eeprom data from efuse */
+		block_num = DIV_ROUND_UP(MT7996_EEPROM_SIZE, MT7996_EEPROM_BLOCK_SIZE);
+		for (i = 0; i < block_num; i++)
+			mt7996_mcu_get_eeprom(dev, i * MT7996_EEPROM_BLOCK_SIZE);
+	}
+
+	return mt7996_check_eeprom(dev);
+}
+
+static int mt7996_eeprom_parse_band_config(struct mt7996_phy *phy)
+{
+	u8 *eeprom = phy->dev->mt76.eeprom.data;
+	u32 val = eeprom[MT_EE_WIFI_CONF];
+	int ret = 0;
+
+	switch (phy->mt76->band_idx) {
+	case MT_BAND1:
+		val = FIELD_GET(MT_EE_WIFI_CONF1_BAND_SEL, val);
+		break;
+	case MT_BAND2:
+		val = eeprom[MT_EE_WIFI_CONF + 1];
+		val = FIELD_GET(MT_EE_WIFI_CONF2_BAND_SEL, val);
+		break;
+	default:
+		val = FIELD_GET(MT_EE_WIFI_CONF0_BAND_SEL, val);
+		break;
+	}
+
+	switch (val) {
+	case MT_EE_BAND_SEL_2GHZ:
+		phy->mt76->cap.has_2ghz = true;
+		break;
+	case MT_EE_BAND_SEL_5GHZ:
+		phy->mt76->cap.has_5ghz = true;
+		break;
+	case MT_EE_BAND_SEL_6GHZ:
+		phy->mt76->cap.has_6ghz = true;
+		break;
+	case MT_EE_BAND_SEL_5GHZ_6GHZ:
+		phy->mt76->cap.has_5ghz = true;
+		phy->mt76->cap.has_6ghz = true;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+int mt7996_eeprom_parse_hw_cap(struct mt7996_dev *dev, struct mt7996_phy *phy)
+{
+	u8 path, nss, band_idx = phy->mt76->band_idx;
+	u8 *eeprom = dev->mt76.eeprom.data;
+	struct mt76_phy *mphy = phy->mt76;
+
+	switch (band_idx) {
+	case MT_BAND1:
+		path = FIELD_GET(MT_EE_WIFI_CONF2_TX_PATH_BAND1,
+				 eeprom[MT_EE_WIFI_CONF + 2]);
+		nss = FIELD_GET(MT_EE_WIFI_CONF5_STREAM_NUM_BAND1,
+				eeprom[MT_EE_WIFI_CONF + 5]);
+		break;
+	case MT_BAND2:
+		path = FIELD_GET(MT_EE_WIFI_CONF2_TX_PATH_BAND2,
+				 eeprom[MT_EE_WIFI_CONF + 2]);
+		nss = FIELD_GET(MT_EE_WIFI_CONF5_STREAM_NUM_BAND2,
+				eeprom[MT_EE_WIFI_CONF + 5]);
+		break;
+	default:
+		path = FIELD_GET(MT_EE_WIFI_CONF1_TX_PATH_BAND0,
+				 eeprom[MT_EE_WIFI_CONF + 1]);
+		nss = FIELD_GET(MT_EE_WIFI_CONF4_STREAM_NUM_BAND0,
+				eeprom[MT_EE_WIFI_CONF + 4]);
+		break;
+	}
+
+	if (!path || path > 4)
+		path = 4;
+
+	nss = min_t(u8, min_t(u8, 4, nss), path);
+
+	mphy->antenna_mask = BIT(nss) - 1;
+	mphy->chainmask = (BIT(path) - 1) << dev->chainshift[band_idx];
+	dev->chainmask |= mphy->chainmask;
+	if (band_idx < MT_BAND2)
+		dev->chainshift[band_idx + 1] = dev->chainshift[band_idx] +
+						hweight16(mphy->chainmask);
+
+	return mt7996_eeprom_parse_band_config(phy);
+}
+
+int mt7996_eeprom_init(struct mt7996_dev *dev)
+{
+	int ret;
+
+	ret = mt7996_eeprom_load(dev);
+	if (ret < 0) {
+		if (ret != -EINVAL)
+			return ret;
+
+		dev_warn(dev->mt76.dev, "eeprom load fail, use default bin\n");
+		ret = mt7996_eeprom_load_default(dev);
+		if (ret)
+			return ret;
+	}
+
+	ret = mt7996_eeprom_parse_hw_cap(dev, &dev->phy);
+	if (ret < 0)
+		return ret;
+
+	memcpy(dev->mphy.macaddr, dev->mt76.eeprom.data + MT_EE_MAC_ADDR, ETH_ALEN);
+	mt76_eeprom_override(&dev->mphy);
+
+	return 0;
+}
+
+int mt7996_eeprom_get_target_power(struct mt7996_dev *dev,
+				   struct ieee80211_channel *chan)
+{
+	u8 *eeprom = dev->mt76.eeprom.data;
+	int target_power;
+
+	if (chan->band == NL80211_BAND_5GHZ)
+		target_power = eeprom[MT_EE_TX0_POWER_5G +
+				      mt7996_get_channel_group_5g(chan->hw_value)];
+	else if (chan->band == NL80211_BAND_6GHZ)
+		target_power = eeprom[MT_EE_TX0_POWER_6G +
+				      mt7996_get_channel_group_6g(chan->hw_value)];
+	else
+		target_power = eeprom[MT_EE_TX0_POWER_2G];
+
+	return target_power;
+}
+
+s8 mt7996_eeprom_get_power_delta(struct mt7996_dev *dev, int band)
+{
+	u8 *eeprom = dev->mt76.eeprom.data;
+	u32 val;
+	s8 delta;
+
+	if (band == NL80211_BAND_5GHZ)
+		val = eeprom[MT_EE_RATE_DELTA_5G];
+	else if (band == NL80211_BAND_6GHZ)
+		val = eeprom[MT_EE_RATE_DELTA_6G];
+	else
+		val = eeprom[MT_EE_RATE_DELTA_2G];
+
+	if (!(val & MT_EE_RATE_DELTA_EN))
+		return 0;
+
+	delta = FIELD_GET(MT_EE_RATE_DELTA_MASK, val);
+
+	return val & MT_EE_RATE_DELTA_SIGN ? delta : -delta;
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
new file mode 100644
index 000000000000..8da599e0abea
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (C) 2022 MediaTek Inc.
+ */
+
+#ifndef __MT7996_EEPROM_H
+#define __MT7996_EEPROM_H
+
+#include "mt7996.h"
+
+enum mt7996_eeprom_field {
+	MT_EE_CHIP_ID =		0x000,
+	MT_EE_VERSION =		0x002,
+	MT_EE_MAC_ADDR =	0x004,
+	MT_EE_MAC_ADDR2 =	0x00a,
+	MT_EE_WIFI_CONF =	0x190,
+	MT_EE_MAC_ADDR3 =	0x2c0,
+	MT_EE_RATE_DELTA_2G =	0x1400,
+	MT_EE_RATE_DELTA_5G =	0x147d,
+	MT_EE_RATE_DELTA_6G =	0x154a,
+	MT_EE_TX0_POWER_2G =	0x1300,
+	MT_EE_TX0_POWER_5G =	0x1301,
+	MT_EE_TX0_POWER_6G =	0x1310,
+
+	__MT_EE_MAX =	0x1dff,
+};
+
+#define MT_EE_WIFI_CONF0_TX_PATH		GENMASK(2, 0)
+#define MT_EE_WIFI_CONF0_BAND_SEL		GENMASK(2, 0)
+#define MT_EE_WIFI_CONF1_BAND_SEL		GENMASK(5, 3)
+#define MT_EE_WIFI_CONF2_BAND_SEL		GENMASK(2, 0)
+
+#define MT_EE_WIFI_CONF1_TX_PATH_BAND0		GENMASK(5, 3)
+#define MT_EE_WIFI_CONF2_TX_PATH_BAND1		GENMASK(5, 3)
+#define MT_EE_WIFI_CONF2_TX_PATH_BAND2		GENMASK(2, 0)
+#define MT_EE_WIFI_CONF4_STREAM_NUM_BAND0	GENMASK(5, 3)
+#define MT_EE_WIFI_CONF5_STREAM_NUM_BAND1	GENMASK(5, 3)
+#define MT_EE_WIFI_CONF5_STREAM_NUM_BAND2	GENMASK(2, 0)
+
+#define MT_EE_RATE_DELTA_MASK			GENMASK(5, 0)
+#define MT_EE_RATE_DELTA_SIGN			BIT(6)
+#define MT_EE_RATE_DELTA_EN			BIT(7)
+
+enum mt7996_eeprom_band {
+	MT_EE_BAND_SEL_DEFAULT,
+	MT_EE_BAND_SEL_2GHZ,
+	MT_EE_BAND_SEL_5GHZ,
+	MT_EE_BAND_SEL_6GHZ,
+	MT_EE_BAND_SEL_5GHZ_6GHZ,
+};
+
+static inline int
+mt7996_get_channel_group_5g(int channel)
+{
+	if (channel <= 64)
+		return 0;
+	if (channel <= 96)
+		return 1;
+	if (channel <= 128)
+		return 2;
+	if (channel <= 144)
+		return 3;
+	return 4;
+}
+
+static inline int
+mt7996_get_channel_group_6g(int channel)
+{
+	if (channel <= 29)
+		return 0;
+
+	return DIV_ROUND_UP(channel - 29, 32);
+}
+
+#endif
-- 
2.25.1



Return-Path: <SRS0=GPQD=KY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBD4C4708E
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 May 2021 11:12:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EEFB61284
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 May 2021 11:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EEFB61284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O7CMhmqf35GECD9mTS+/sTrCCG9a3uEKSzzZlWqVRnw=; b=i1hReG2frq72Sg
	HaPL0gcXa06vNSI0XTU/aYv3hiMpgUgrSV+aAeLEitN+Qj8sPioiU3rT/dyNwqlPJaTpUH06Fc/Dx
	pFa+aG9NGu/VeENekQDxIwqbvAfUDJvE0aM863BO1Xn7SxThfHVkuOSDRI5oiJ2zKCmUBluYohm2e
	SYqd/qX3BXCWH6dWJVbFZJyzFDQL/Rzjpike5UVVqZh+WXNwNtmaBFkjiflHs3DJDRmlUSp08KSNW
	ylxDOu57H1QcHZ6+CZD00r/MLUz4dny1ts+yK2Pejy9B4s+e8LVGjrq+FeCzGhrN/Eee7ysILniFT
	erg9K4xvlI1DD1ocS1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmwsr-0056I6-TR; Sat, 29 May 2021 11:12:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmwso-0056Gn-MG
 for linux-mediatek@lists.infradead.org; Sat, 29 May 2021 11:12:00 +0000
X-UUID: 88aff45202dc4bd792728dc8430d6922-20210529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Pbe5xtStRQrelT93oW3xNxWK/Uwa2ETU479JADDr/gY=; 
 b=OY9wtcwc62HDKew6PY9KozXXX2F1GbaQzwhaJ0egz6Q208qZibaC/WaxajAuMSe8QTOilt0alq+qv7coTdew0X4tPZKUrkxvTqT8TeUrRuzk8JIDdYGctFkRu6GW9lHxJR72R2dnZG+BL8AKS96b/kGimOldvNYmr4uxUHL/N3M=;
X-UUID: 88aff45202dc4bd792728dc8430d6922-20210529
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 935965296; Sat, 29 May 2021 04:11:56 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 29 May 2021 04:11:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 29 May 2021 19:11:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 29 May 2021 19:11:53 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
 <shayne.chen@mediatek.com>
Subject: [PATCH] mt76: mt7915: read all eeprom fields from fw in efuse mode
Date: Sat, 29 May 2021 19:11:50 +0800
Message-ID: <20210529111150.21611-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_041158_763563_E1E1D810 
X-CRM114-Status: GOOD (  14.74  )
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

If efuse mode is used, read all values from fw during eeprom init,
which makes it more convinient to check if rf values in efuse are
properly burned.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/eeprom.c    | 44 +++++++++----------
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  5 ++-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 8ededf2..ee3d644 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -4,22 +4,12 @@
 #include "mt7915.h"
 #include "eeprom.h"
 
-static u32 mt7915_eeprom_read(struct mt7915_dev *dev, u32 offset)
-{
-	u8 *data = dev->mt76.eeprom.data;
-
-	if (data[offset] == 0xff && !dev->flash_mode)
-		mt7915_mcu_get_eeprom(dev, offset);
-
-	return data[offset];
-}
-
 static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
 {
 	struct mt76_dev *mdev = &dev->mt76;
-	u32 val;
+	u8 *eeprom = mdev->eeprom.data;
+	u32 val = eeprom[MT_EE_DO_PRE_CAL];
 
-	val = mt7915_eeprom_read(dev, MT_EE_DO_PRE_CAL);
 	if (val != (MT_EE_WIFI_CAL_DPD | MT_EE_WIFI_CAL_GROUP))
 		return 0;
 
@@ -43,7 +33,13 @@ static int mt7915_eeprom_load(struct mt7915_dev *dev)
 		dev->flash_mode = true;
 		ret = mt7915_eeprom_load_precal(dev);
 	} else {
-		memset(dev->mt76.eeprom.data, -1, MT7915_EEPROM_SIZE);
+		u32 block_num, i;
+
+		block_num = DIV_ROUND_UP(MT7915_EEPROM_SIZE,
+					 MT7915_EEPROM_BLOCK_SIZE);
+		for (i = 0; i < block_num; i++)
+			mt7915_mcu_get_eeprom(dev,
+					      i * MT7915_EEPROM_BLOCK_SIZE);
 	}
 
 	return ret;
@@ -52,10 +48,7 @@ static int mt7915_eeprom_load(struct mt7915_dev *dev)
 static int mt7915_check_eeprom(struct mt7915_dev *dev)
 {
 	u8 *eeprom = dev->mt76.eeprom.data;
-	u16 val;
-
-	mt7915_eeprom_read(dev, MT_EE_CHIP_ID);
-	val = get_unaligned_le16(eeprom);
+	u16 val = get_unaligned_le16(eeprom);
 
 	switch (val) {
 	case 0x7915:
@@ -69,9 +62,10 @@ void mt7915_eeprom_parse_band_config(struct mt7915_phy *phy)
 {
 	struct mt7915_dev *dev = phy->dev;
 	bool ext_phy = phy != &dev->phy;
+	u8 *eeprom = dev->mt76.eeprom.data;
 	u32 val;
 
-	val = mt7915_eeprom_read(dev, MT_EE_WIFI_CONF + ext_phy);
+	val = eeprom[MT_EE_WIFI_CONF + ext_phy];
 	val = FIELD_GET(MT_EE_WIFI_CONF0_BAND_SEL, val);
 	if (val == MT_EE_BAND_SEL_DEFAULT && dev->dbdc_support)
 		val = ext_phy ? MT_EE_BAND_SEL_5GHZ : MT_EE_BAND_SEL_2GHZ;
@@ -143,6 +137,7 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 				   struct ieee80211_channel *chan,
 				   u8 chain_idx)
 {
+	u8 *eeprom = dev->mt76.eeprom.data;
 	int index, target_power;
 	bool tssi_on;
 
@@ -153,18 +148,18 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 
 	if (chan->band == NL80211_BAND_2GHZ) {
 		index = MT_EE_TX0_POWER_2G + chain_idx * 3;
-		target_power = mt7915_eeprom_read(dev, index);
+		target_power = eeprom[index];
 
 		if (!tssi_on)
-			target_power += mt7915_eeprom_read(dev, index + 1);
+			target_power += eeprom[index + 1];
 	} else {
 		int group = mt7915_get_channel_group(chan->hw_value);
 
 		index = MT_EE_TX0_POWER_5G + chain_idx * 12;
-		target_power = mt7915_eeprom_read(dev, index + group);
+		target_power = eeprom[index + group];
 
 		if (!tssi_on)
-			target_power += mt7915_eeprom_read(dev, index + 8);
+			target_power += eeprom[index + 8];
 	}
 
 	return target_power;
@@ -172,13 +167,14 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 
 s8 mt7915_eeprom_get_power_delta(struct mt7915_dev *dev, int band)
 {
+	u8 *eeprom = dev->mt76.eeprom.data;
 	u32 val;
 	s8 delta;
 
 	if (band == NL80211_BAND_2GHZ)
-		val = mt7915_eeprom_read(dev, MT_EE_RATE_DELTA_2G);
+		val = eeprom[MT_EE_RATE_DELTA_2G];
 	else
-		val = mt7915_eeprom_read(dev, MT_EE_RATE_DELTA_5G);
+		val = eeprom[MT_EE_RATE_DELTA_5G];
 
 	if (!(val & MT_EE_RATE_DELTA_EN))
 		return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index dcf2d4d..e716feb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3316,7 +3316,8 @@ int mt7915_mcu_set_eeprom(struct mt7915_dev *dev)
 int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset)
 {
 	struct mt7915_mcu_eeprom_info req = {
-		.addr = cpu_to_le32(round_down(offset, 16)),
+		.addr = cpu_to_le32(round_down(offset,
+				    MT7915_EEPROM_BLOCK_SIZE)),
 	};
 	struct mt7915_mcu_eeprom_info *res;
 	struct sk_buff *skb;
@@ -3330,7 +3331,7 @@ int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset)
 
 	res = (struct mt7915_mcu_eeprom_info *)skb->data;
 	buf = dev->mt76.eeprom.data + le32_to_cpu(res->addr);
-	memcpy(buf, res->data, 16);
+	memcpy(buf, res->data, MT7915_EEPROM_BLOCK_SIZE);
 	dev_kfree_skb(skb);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index c4bf8ed..4a79a10 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -31,6 +31,7 @@
 #define MT7915_ROM_PATCH		"mediatek/mt7915_rom_patch.bin"
 
 #define MT7915_EEPROM_SIZE		3584
+#define MT7915_EEPROM_BLOCK_SIZE	16
 #define MT7915_TOKEN_SIZE		8192
 
 #define MT7915_CFEND_RATE_DEFAULT	0x49	/* OFDM 24M */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

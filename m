Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E95BEB48EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Feb 2026 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjTmETYJMhUFu0ND6fypPajx5WjMpMrsjrQAH65vI54=; b=H3JBnYNBongEBkaedzviD30WoL
	muY6mneH0V5qHr/dU45WiEnbUAS4Zighgue3ZUg8WB7fL4dh6NQvvObNUPySFG37ZbYp9Ykb/fBwy
	eBToHaPcDMPWKIPQLtz++bOJtO0jn6kPiJkFEYzH8HNRpUkl8Zby6CNYmaOhiI7qtC7uhfeFAvbGm
	TurXccI1DR2hmcxc6F7tWNe7pIrpD3q9Wnq7Q6XbmVN33MjXJZ+9l4dqM1o9gKouS1txX8LV1T+bX
	GumGHwVdxT8JFGzTYBTyK9VRNxROARVq53Tfxw6D6zuNigKoPa14oGmbtw2K+BnVydgz7tlTQq/Go
	htLRfLrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSdk-00000001oGD-1iKP;
	Thu, 12 Feb 2026 09:05:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSdg-00000001oET-18v9
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Feb 2026 09:05:33 +0000
X-UUID: f8b37a1a07f111f1a16f0188aa809bee-20260212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KjTmETYJMhUFu0ND6fypPajx5WjMpMrsjrQAH65vI54=;
	b=B0iipJlQgWUM93xXm8EsRad1i385QlFkxKFG3+QDbJa6ocVuhErmPnjG22mRjfAw8n+p+fpsuu5wW7GyC3D7vi7fOxheDALpL/jvf1xm0NfNtoI1yH9FvBW+H0DUPmD5Cyqrlei5Lhm6gncx/kVJOST4uTX+BAu51CKK87uO4Kw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:b826b8e7-6ef7-4bbb-bf74-2ef583b18a5e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:537be17a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f8b37a1a07f111f1a16f0188aa809bee-20260212
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1415227926; Thu, 12 Feb 2026 02:05:26 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Feb 2026 17:05:24 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Feb 2026 17:05:24 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 3/3] wifi: mt76: mt7996: apply calibration-free data from OTP
Date: Thu, 12 Feb 2026 17:03:10 +0800
Message-ID: <20260212090310.3335392-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260212090310.3335392-1-shayne.chen@mediatek.com>
References: <20260212090310.3335392-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_010532_314169_1A4ADC20 
X-CRM114-Status: GOOD (  18.43  )
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

Before sending the current EEPROM data to the firmware, read the
calibration-free data (FT data) from the efuse and merge it with
the existing EEPROM data.

Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 171 ++++++++++++++++--
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |   5 +
 2 files changed, 157 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 98db3bcf76f0..4cac1f7dd597 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3948,7 +3948,152 @@ int mt7996_mcu_set_chan_info(struct mt7996_phy *phy, u16 tag)
 				 &req, sizeof(req), true);
 }
 
-static int mt7996_mcu_set_eeprom_flash(struct mt7996_dev *dev)
+static int
+mt7996_mcu_get_cal_free_data(struct mt7996_dev *dev)
+{
+#define MT_EE_7977BN_OFFSET	(0x1200 - 0x500)
+	struct cal_free_data {
+		u16 adie_offs;
+		u16 eep_offs;
+	};
+	static const struct cal_free_data cal_7975[] = {
+		{ 0x5cd, 0x451 }, { 0x5cf, 0x453 }, { 0x5d1, 0x455 },
+		{ 0x5d3, 0x457 }, { 0x6c0, 0x44c }, { 0x6c1, 0x44d },
+		{ 0x6c2, 0x44e }, { 0x6c3, 0x44f }, { 0x7a1, 0xba1 },
+		{ 0x7a6, 0xba6 }, { 0x7a8, 0xba8 }, { 0x7aa, 0xbaa },
+	};
+	static const struct cal_free_data cal_7976[] = {
+		{  0x4c, 0x44c }, {  0x4d, 0x44d }, {  0x4e, 0x44e },
+		{  0x4f, 0x44f }, {  0x50, 0x450 }, {  0x51, 0x451 },
+		{  0x53, 0x453 }, {  0x55, 0x455 }, {  0x57, 0x457 },
+		{  0x59, 0x459 }, {  0x70, 0x470 }, {  0x71, 0x471 },
+		{ 0x790, 0xb90 }, { 0x791, 0xb91 }, { 0x794, 0xb94 },
+		{ 0x795, 0xb95 }, { 0x7a6, 0xba6 }, { 0x7a8, 0xba8 },
+		{ 0x7aa, 0xbaa },
+	};
+	static const struct cal_free_data cal_7977[] = {
+		{ 0x4c, 0x124c }, { 0x4d, 0x124d }, { 0x4e, 0x124e },
+		{ 0x4f, 0x124f }, { 0x50, 0x1250 }, { 0x51, 0x1251 },
+		{ 0x53, 0x1253 }, { 0x55, 0x1255 }, { 0x57, 0x1257 },
+		{ 0x59, 0x1259 }, { 0x69, 0x1269 }, { 0x6a, 0x126a },
+		{ 0x7a, 0x127a }, { 0x7b, 0x127b }, { 0x7c, 0x127c },
+		{ 0x7d, 0x127d }, { 0x7e, 0x127e },
+	};
+	static const struct cal_free_data cal_7978[] = {
+		{  0x91, 0xb91 }, {  0x95, 0xb95 }, { 0x100, 0x480 },
+		{ 0x102, 0x482 }, { 0x104, 0x484 }, { 0x106, 0x486 },
+		{ 0x107, 0x487 }, { 0x108, 0x488 }, { 0x109, 0x489 },
+		{ 0x10a, 0x48a }, { 0x10b, 0x48b }, { 0x10c, 0x48c },
+		{ 0x10e, 0x48e }, { 0x110, 0x490 },
+	};
+	static const struct cal_free_data cal_7979[] = {
+		{ 0x4c, 0x124c }, { 0x4d, 0x124d }, { 0x4e, 0x124e },
+		{ 0x4f, 0x124f }, { 0x50, 0x1250 }, { 0x51, 0x1251 },
+		{ 0x53, 0x1253 }, { 0x55, 0x1255 }, { 0x57, 0x1257 },
+		{ 0x59, 0x1259 }, { 0x69, 0x1269 }, { 0x6a, 0x126a },
+		{ 0x7a, 0x127a }, { 0x7b, 0x127b }, { 0x7c, 0x127c },
+		{ 0x7e, 0x127e }, { 0x80, 0x1280 },
+	};
+	const struct cal_free_data *cal_arr[__MT_MAX_BAND];
+	u16 cal_arr_len[__MT_MAX_BAND] = {};
+	u8 *eeprom = (u8 *)dev->mt76.eeprom.data;
+	int band, i, ret;
+
+#define CAL_ARR(_band, _adie) do {				\
+		cal_arr[_band] = cal_##_adie;			\
+		cal_arr_len[_band] = ARRAY_SIZE(cal_##_adie);	\
+	} while (0)
+
+	switch (mt76_chip(&dev->mt76)) {
+	case MT7996_DEVICE_ID:
+		/* adie 0 */
+		if (dev->var.fem == MT7996_FEM_INT &&
+		    dev->var.type != MT7996_VAR_TYPE_233)
+			CAL_ARR(0, 7975);
+		else
+			CAL_ARR(0, 7976);
+
+		/* adie 1 */
+		if (dev->var.type == MT7996_VAR_TYPE_444)
+			CAL_ARR(1, 7977);
+
+		/* adie 2 */
+		CAL_ARR(2, 7977);
+		break;
+	case MT7992_DEVICE_ID:
+		/* adie 0 */
+		if (dev->var.type == MT7992_VAR_TYPE_44 &&
+		    dev->var.fem != MT7996_FEM_EXT)
+			CAL_ARR(0, 7975);
+		else if (dev->var.type == MT7992_VAR_TYPE_24)
+			CAL_ARR(0, 7978);
+		else
+			CAL_ARR(0, 7976);
+
+		/* adie 1 */
+		if (dev->var.type == MT7992_VAR_TYPE_44 &&
+		    dev->var.fem != MT7996_FEM_INT)
+			CAL_ARR(1, 7977);
+		else if (dev->var.type != MT7992_VAR_TYPE_23)
+			CAL_ARR(1, 7979);
+		break;
+	case MT7990_DEVICE_ID:
+		/* adie 0 */
+		CAL_ARR(0, 7976);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	for (band = 0; band < __MT_MAX_BAND; band++) {
+		const struct cal_free_data *cal;
+		u16 prev_block_idx = -1;
+		u16 adie_base;
+
+		if (!cal_arr_len[band])
+			continue;
+
+		if (band == MT_BAND0)
+			adie_base = MT7996_EFUSE_BASE_OFFS_ADIE0;
+		else if (band == MT_BAND1 && is_mt7992(&dev->mt76))
+			adie_base = MT7992_EFUSE_BASE_OFFS_ADIE1;
+		else if (band == MT_BAND1)
+			adie_base = MT7996_EFUSE_BASE_OFFS_ADIE1;
+		else
+			adie_base = MT7996_EFUSE_BASE_OFFS_ADIE2;
+
+		cal = cal_arr[band];
+		for (i = 0; i < cal_arr_len[band]; i++) {
+			u16 adie_offset = cal[i].adie_offs + adie_base;
+			u16 eep_offset = cal[i].eep_offs;
+			u16 block_idx = adie_offset / MT7996_EEPROM_BLOCK_SIZE;
+			u16 offset = adie_offset % MT7996_EEPROM_BLOCK_SIZE;
+			u8 buf[MT7996_EEPROM_BLOCK_SIZE];
+
+			if (is_mt7996(&dev->mt76) && band == MT_BAND1 &&
+			    dev->var.type == MT7996_VAR_TYPE_444)
+				eep_offset -= MT_EE_7977BN_OFFSET;
+
+			if (prev_block_idx != block_idx) {
+				ret = mt7996_mcu_get_eeprom(dev, adie_offset, buf,
+							    MT7996_EEPROM_BLOCK_SIZE,
+							    EEPROM_MODE_EFUSE);
+				if (ret) {
+					if (ret != -EINVAL)
+						return ret;
+					prev_block_idx = -1;
+					continue;
+				}
+			}
+			eeprom[eep_offset] = buf[offset];
+			prev_block_idx = block_idx;
+		}
+	}
+
+	return 0;
+}
+
+int mt7996_mcu_set_eeprom(struct mt7996_dev *dev)
 {
 #define MAX_PAGE_IDX_MASK	GENMASK(7, 5)
 #define PAGE_IDX_MASK		GENMASK(4, 2)
@@ -3960,11 +4105,15 @@ static int mt7996_mcu_set_eeprom_flash(struct mt7996_dev *dev)
 	u16 eeprom_size = MT7996_EEPROM_SIZE;
 	u8 total = DIV_ROUND_UP(eeprom_size, PER_PAGE_SIZE);
 	u8 *eep = (u8 *)dev->mt76.eeprom.data;
-	int eep_len, i;
+	int ret, eep_len, i;
+
+	ret = mt7996_mcu_get_cal_free_data(dev);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < total; i++, eep += eep_len) {
 		struct sk_buff *skb;
-		int ret, msg_len;
+		int msg_len;
 
 		if (i == total - 1 && !!(eeprom_size % PER_PAGE_SIZE))
 			eep_len = eeprom_size % PER_PAGE_SIZE;
@@ -3993,22 +4142,6 @@ static int mt7996_mcu_set_eeprom_flash(struct mt7996_dev *dev)
 	return 0;
 }
 
-int mt7996_mcu_set_eeprom(struct mt7996_dev *dev)
-{
-	struct mt7996_mcu_eeprom_update req = {
-		.tag = cpu_to_le16(UNI_EFUSE_BUFFER_MODE),
-		.len = cpu_to_le16(sizeof(req) - 4),
-		.buffer_mode = EE_MODE_EFUSE,
-		.format = EE_FORMAT_WHOLE
-	};
-
-	if (dev->eeprom_mode != EEPROM_MODE_EFUSE)
-		return mt7996_mcu_set_eeprom_flash(dev);
-
-	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(EFUSE_CTRL),
-				 &req, sizeof(req), true);
-}
-
 int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset, u8 *buf, u32 buf_len,
 			  enum mt7996_eeprom_mode mode)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index d36fb5396141..5f574ebe81cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -184,6 +184,11 @@ enum mt7996_eeprom_mode {
 	EEPROM_MODE_EXT,
 };
 
+#define MT7996_EFUSE_BASE_OFFS_ADIE0	0x400
+#define MT7996_EFUSE_BASE_OFFS_ADIE1	0x1e00
+#define MT7996_EFUSE_BASE_OFFS_ADIE2	0x1200
+#define MT7992_EFUSE_BASE_OFFS_ADIE1	0x1200
+
 enum mt7996_txq_id {
 	MT7996_TXQ_FWDL = 16,
 	MT7996_TXQ_MCU_WM,
-- 
2.51.0



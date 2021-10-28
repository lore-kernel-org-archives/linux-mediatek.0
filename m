Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7068EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 10:41:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD19610D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 10:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FD19610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dc0hOXnH8f4fe6R018yQ0ybBIOtZGdvasW4/70hDnyQ=; b=h/MU1XMO6suSuQ
	7TomYoGqo6SUwBf9ZZiUFzMFKwddLi7QSqTl+0ClIUNQMuaMi8P4xVDI3a7GfKUJmUl+porMFXh90
	ARPT3R2FAtxrMKfRKIRB+ykrDxdRAnK9jzVEqfFbzMMWrxfU0Gt0c/lDzR6f9WOypMtdaonMvw/Zz
	iNblAkovcO8l0zBxKSefnHIii1UHv2hueWVDHl/2E2p4jBBc56IyReraK8dKIRd7jeFNh9QSOkgOb
	v1mnrB04FykqRRUI6bmNUIxHU8TssiIP2z6ugrFHE9i910E0Dn9sSbN2r9tzVdOwdubiIS9e6773E
	AVRysmVINKcsJRf20Hlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg2qp-007ZLp-7x; Thu, 28 Oct 2021 10:41:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg2qm-007ZKn-6D
 for linux-mediatek@lists.infradead.org; Thu, 28 Oct 2021 10:41:37 +0000
X-UUID: dd4c7d182d954b679cb92ab858ce6932-20211028
X-UUID: dd4c7d182d954b679cb92ab858ce6932-20211028
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1595871839; Thu, 28 Oct 2021 03:41:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 03:41:30 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 28 Oct 2021 18:41:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Oct 2021 18:41:29 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v2] mt76: mt7915: add default calibrated data support
Date: Thu, 28 Oct 2021 18:41:24 +0800
Message-ID: <20211028104124.4872-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_034136_262354_943ACC51 
X-CRM114-Status: GOOD (  16.93  )
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

Load the default eeprom data when the content of flash/efuse is invalid.
This could help to eliminate some issues due to incorrect or
insufficient rf values.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2: drop unnecessary goto and return
---
 .../wireless/mediatek/mt76/mt7915/eeprom.c    | 81 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 24 ++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +
 4 files changed, 96 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index ee3d644..a21a6fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: ISC
 /* Copyright (C) 2020 MediaTek Inc. */
 
+#include <linux/firmware.h>
 #include "mt7915.h"
 #include "eeprom.h"
 
@@ -10,6 +11,9 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
 	u8 *eeprom = mdev->eeprom.data;
 	u32 val = eeprom[MT_EE_DO_PRE_CAL];
 
+	if (!dev->flash_mode)
+		return 0;
+
 	if (val != (MT_EE_WIFI_CAL_DPD | MT_EE_WIFI_CAL_GROUP))
 		return 0;
 
@@ -21,6 +25,49 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
 	return mt76_get_of_eeprom(mdev, dev->cal, MT_EE_PRECAL, val);
 }
 
+static int mt7915_check_eeprom(struct mt7915_dev *dev)
+{
+	u8 *eeprom = dev->mt76.eeprom.data;
+	u16 val = get_unaligned_le16(eeprom);
+
+	switch (val) {
+	case 0x7915:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int
+mt7915_eeprom_load_default(struct mt7915_dev *dev)
+{
+	char *default_bin = MT7915_EEPROM_DEFAULT;
+	u8 *eeprom = dev->mt76.eeprom.data;
+	const struct firmware *fw = NULL;
+	int ret;
+
+	if (dev->dbdc_support)
+		default_bin = MT7915_EEPROM_DEFAULT_DBDC;
+
+	ret = request_firmware(&fw, default_bin, dev->mt76.dev);
+	if (ret)
+		return ret;
+
+	if (!fw || !fw->data) {
+		dev_err(dev->mt76.dev, "Invalid default bin\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	memcpy(eeprom, fw->data, MT7915_EEPROM_SIZE);
+	dev->flash_mode = true;
+
+out:
+	release_firmware(fw);
+
+	return ret;
+}
+
 static int mt7915_eeprom_load(struct mt7915_dev *dev)
 {
 	int ret;
@@ -31,8 +78,8 @@ static int mt7915_eeprom_load(struct mt7915_dev *dev)
 
 	if (ret) {
 		dev->flash_mode = true;
-		ret = mt7915_eeprom_load_precal(dev);
 	} else {
+		/* read eeprom data from efuse */
 		u32 block_num, i;
 
 		block_num = DIV_ROUND_UP(MT7915_EEPROM_SIZE,
@@ -42,20 +89,26 @@ static int mt7915_eeprom_load(struct mt7915_dev *dev)
 					      i * MT7915_EEPROM_BLOCK_SIZE);
 	}
 
-	return ret;
-}
-
-static int mt7915_check_eeprom(struct mt7915_dev *dev)
-{
-	u8 *eeprom = dev->mt76.eeprom.data;
-	u16 val = get_unaligned_le16(eeprom);
+	if (!dev->flash_mode) {
+		u8 free_block_num;
+
+		mt7915_mcu_get_eeprom_free_block(dev, &free_block_num);
+		if (free_block_num >= 29) {
+			dev_warn(dev->mt76.dev,
+				 "efuse info not enough, use default bin\n");
+			ret = mt7915_eeprom_load_default(dev);
+			if (ret)
+				return ret;
+		}
+	}
 
-	switch (val) {
-	case 0x7915:
-		return 0;
-	default:
-		return -EINVAL;
+	ret = mt7915_check_eeprom(dev);
+	if (ret) {
+		dev_warn(dev->mt76.dev, "eeprom check fail, use default bin\n");
+		ret = mt7915_eeprom_load_default(dev);
 	}
+
+	return ret;
 }
 
 void mt7915_eeprom_parse_band_config(struct mt7915_phy *phy)
@@ -120,7 +173,7 @@ int mt7915_eeprom_init(struct mt7915_dev *dev)
 	if (ret < 0)
 		return ret;
 
-	ret = mt7915_check_eeprom(dev);
+	ret = mt7915_eeprom_load_precal(dev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index b054663..ee9952d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3580,6 +3580,30 @@ int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset)
 	return 0;
 }
 
+int mt7915_mcu_get_eeprom_free_block(struct mt7915_dev *dev, u8 *block_num)
+{
+	struct {
+		u8 _rsv;
+		u8 version;
+		u8 die_idx;
+		u8 _rsv2;
+	} __packed req = {
+		.version = 1,
+	};
+	struct sk_buff *skb;
+	int ret;
+
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_QUERY(EFUSE_FREE_BLOCK), &req,
+					sizeof(req), true, &skb);
+	if (ret)
+		return ret;
+
+	*block_num = *(u8 *)skb->data;
+	dev_kfree_skb(skb);
+
+	return 0;
+}
+
 static int mt7915_mcu_set_pre_cal(struct mt7915_dev *dev, u8 idx,
 				  u8 *data, u32 len, int cmd)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index b563e7c..e9f39ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -278,6 +278,7 @@ enum {
 	MCU_EXT_CMD_MUAR_UPDATE = 0x48,
 	MCU_EXT_CMD_RX_AIRTIME_CTRL = 0x4a,
 	MCU_EXT_CMD_SET_RX_PATH = 0x4e,
+	MCU_EXT_CMD_EFUSE_FREE_BLOCK = 0x4f,
 	MCU_EXT_CMD_TX_POWER_FEATURE_CTRL = 0x58,
 	MCU_EXT_CMD_GET_MIB_INFO = 0x5a,
 	MCU_EXT_CMD_MWDS_SUPPORT = 0x80,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index e69b4c8..c6c846d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -30,6 +30,9 @@
 #define MT7915_FIRMWARE_WM		"mediatek/mt7915_wm.bin"
 #define MT7915_ROM_PATCH		"mediatek/mt7915_rom_patch.bin"
 
+#define MT7915_EEPROM_DEFAULT		"mediatek/mt7915_eeprom.bin"
+#define MT7915_EEPROM_DEFAULT_DBDC	"mediatek/mt7915_eeprom_dbdc.bin"
+
 #define MT7915_EEPROM_SIZE		3584
 #define MT7915_EEPROM_BLOCK_SIZE	16
 #define MT7915_TOKEN_SIZE		8192
@@ -423,6 +426,7 @@ int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 				   void *data, u32 field);
 int mt7915_mcu_set_eeprom(struct mt7915_dev *dev);
 int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset);
+int mt7915_mcu_get_eeprom_free_block(struct mt7915_dev *dev, u8 *block_num);
 int mt7915_mcu_set_mac(struct mt7915_dev *dev, int band, bool enable,
 		       bool hdr_trans);
 int mt7915_mcu_set_test_param(struct mt7915_dev *dev, u8 param, bool test_mode,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

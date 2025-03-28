Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC45EC28B20
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Mar 2025 05:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=futY6c2uLQgzM+VulOPiiPRtQi0w6EpsM/OE547Rw+U=; b=Lno2HBk9ZIhwZuFMFUm7k7GdQ8
	hmB3TXBhUfWh35Isvr1saXlxdSG3D9COJWYmHDCOsyIn0tX1fcojoPn2R3zRW/BoiUl0MGdMmNLTI
	gkJ9Nq72ce8wc+Jl6t1oLXOdnTGVuuKjg9iFMRqh7WY13cgtZ+dLbFQv0cpAuIvXCB9dVJc3cbqv0
	t0YLTpSdxcsLHML0IHMmjqHnuvu1mvq6p7mXvxPtTxvCQEagjWW09F2BYnxrvPyI6UclJX0vMVLAk
	zUfY+1WaHV/z4h57AQgM457m9QbEPeWy9nwju6HrxZ+TvzaITPaypNmK26P79JhMdmwX+Uke2wQqO
	ttw1GDEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2fO-0000000Cg9c-2Xgr;
	Fri, 28 Mar 2025 05:54:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2fM-0000000Cg82-1uSH
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Mar 2025 05:54:05 +0000
X-UUID: 0b35f65a0b9911f083f2a1c9db70dae0-20250327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=futY6c2uLQgzM+VulOPiiPRtQi0w6EpsM/OE547Rw+U=;
	b=b7j//DAiMTly972RPoc0KzO6F8FQrO+jYo3xgVNfGJJ+a1xEDTBCU+ztzXnGDzR8/4u/gEi3RXYtzM9WSaV7M/ZZRVBgwtV6hMosut503f7v9LAC7WRPeWqKmJzXe8+0Jh5cIK2yGQFvAPIs3skCnMcsIeopVVCa9sZzCrmmiss=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:728713e5-2e50-4cb4-9e60-de233be3755a,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:ef64ab4a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0b35f65a0b9911f083f2a1c9db70dae0-20250327
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1761925226; Thu, 27 Mar 2025 22:53:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 28 Mar 2025 13:53:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 28 Mar 2025 13:53:57 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 02/10] wifi: mt76: connac: add support to load firmware for mt7990
Date: Fri, 28 Mar 2025 13:50:50 +0800
Message-ID: <20250328055058.1648755-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328055058.1648755-1-shayne.chen@mediatek.com>
References: <20250328055058.1648755-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_225404_506568_DE2A192D 
X-CRM114-Status: GOOD (  15.77  )
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

Add firmware download support. Note that mt7990 does not have WA and DSP
firmwares. This is a preliminary patch to support mt7990 chipset.

Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  7 +++++-
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  3 +--
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 23 ++++++++++++-------
 .../wireless/mediatek/mt76/mt7996/mt7996.h    | 12 ++++++++++
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |  2 ++
 5 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 455979476d11..192dcc374a64 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -232,9 +232,14 @@ static inline bool is_mt7992(struct mt76_dev *dev)
 	return mt76_chip(dev) == 0x7992;
 }
 
+static inline bool is_mt7990(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7993;
+}
+
 static inline bool is_mt799x(struct mt76_dev *dev)
 {
-	return is_mt7996(dev) || is_mt7992(dev);
+	return is_mt7996(dev) || is_mt7992(dev) || is_mt7990(dev);
 }
 
 static inline bool is_mt7622(struct mt76_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index bafcf5a279e2..185ba57d416d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -67,8 +67,7 @@ int mt76_connac_mcu_init_download(struct mt76_dev *dev, u32 addr, u32 len,
 	if ((!is_connac_v1(dev) && addr == MCU_PATCH_ADDRESS) ||
 	    (is_mt7921(dev) && addr == 0x900000) ||
 	    (is_mt7925(dev) && (addr == 0x900000 || addr == 0xe0002800)) ||
-	    (is_mt7996(dev) && addr == 0x900000) ||
-	    (is_mt7992(dev) && addr == 0x900000))
+	    (is_mt799x(dev) && addr == 0x900000))
 		cmd = MCU_CMD(PATCH_START_REQ);
 	else
 		cmd = MCU_CMD(TARGET_ADDRESS_LEN_REQ);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 81cc50ae55b0..1d12ccbacbcf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -22,6 +22,9 @@
 			_fw = MT7992_##name;			\
 		}						\
 		break;						\
+	case MT7990_DEVICE_ID:					\
+		_fw = MT7990_##name;				\
+		break;						\
 	case MT7996_DEVICE_ID:						\
 	default:						\
 		switch ((_dev)->var.type) {			\
@@ -265,7 +268,7 @@ mt7996_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 
 	txd_len = cmd & __MCU_CMD_FIELD_UNI ? sizeof(*uni_txd) : sizeof(*mcu_txd);
 	txd = (__le32 *)skb_push(skb, txd_len);
-	if (test_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state))
+	if (test_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state) && mt7996_has_wa(dev))
 		qid = MT_MCUQ_WA;
 	else
 		qid = MT_MCUQ_WM;
@@ -3011,6 +3014,9 @@ static int mt7996_load_ram(struct mt7996_dev *dev)
 	if (ret)
 		return ret;
 
+	if (!mt7996_has_wa(dev))
+		return 0;
+
 	ret = __mt7996_load_ram(dev, "DSP", fw_name(dev, FIRMWARE_DSP),
 				MT7996_RAM_TYPE_DSP);
 	if (ret)
@@ -3021,10 +3027,9 @@ static int mt7996_load_ram(struct mt7996_dev *dev)
 }
 
 static int
-mt7996_firmware_state(struct mt7996_dev *dev, bool wa)
+mt7996_firmware_state(struct mt7996_dev *dev, u8 fw_state)
 {
-	u32 state = FIELD_PREP(MT_TOP_MISC_FW_STATE,
-			       wa ? FW_STATE_RDY : FW_STATE_FW_DOWNLOAD);
+	u32 state = FIELD_PREP(MT_TOP_MISC_FW_STATE, fw_state);
 
 	if (!mt76_poll_msec(dev, MT_TOP_MISC, MT_TOP_MISC_FW_STATE,
 			    state, 1000)) {
@@ -3056,13 +3061,14 @@ mt7996_mcu_restart(struct mt76_dev *dev)
 
 static int mt7996_load_firmware(struct mt7996_dev *dev)
 {
+	u8 fw_state;
 	int ret;
 
 	/* make sure fw is download state */
-	if (mt7996_firmware_state(dev, false)) {
+	if (mt7996_firmware_state(dev, FW_STATE_FW_DOWNLOAD)) {
 		/* restart firmware once */
 		mt7996_mcu_restart(&dev->mt76);
-		ret = mt7996_firmware_state(dev, false);
+		ret = mt7996_firmware_state(dev, FW_STATE_FW_DOWNLOAD);
 		if (ret) {
 			dev_err(dev->mt76.dev,
 				"Firmware is not ready for download\n");
@@ -3078,7 +3084,8 @@ static int mt7996_load_firmware(struct mt7996_dev *dev)
 	if (ret)
 		return ret;
 
-	ret = mt7996_firmware_state(dev, true);
+	fw_state = mt7996_has_wa(dev) ? FW_STATE_RDY : FW_STATE_NORMAL_TRX;
+	ret = mt7996_firmware_state(dev, fw_state);
 	if (ret)
 		return ret;
 
@@ -3248,7 +3255,7 @@ int mt7996_mcu_init(struct mt7996_dev *dev)
 void mt7996_mcu_exit(struct mt7996_dev *dev)
 {
 	mt7996_mcu_restart(&dev->mt76);
-	if (mt7996_firmware_state(dev, false)) {
+	if (mt7996_firmware_state(dev, FW_STATE_FW_DOWNLOAD)) {
 		dev_err(dev->mt76.dev, "Failed to exit mcu\n");
 		goto out;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index bc22c3e12d94..c03747ed6c70 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -34,6 +34,8 @@
 #define MT7996_DEVICE_ID_2		0x7991
 #define MT7992_DEVICE_ID		0x7992
 #define MT7992_DEVICE_ID_2		0x799a
+#define MT7990_DEVICE_ID		0x7993
+#define MT7990_DEVICE_ID_2		0x799b
 
 #define MT7996_FIRMWARE_WA		"mediatek/mt7996/mt7996_wa.bin"
 #define MT7996_FIRMWARE_WM		"mediatek/mt7996/mt7996_wm.bin"
@@ -55,6 +57,11 @@
 #define MT7992_FIRMWARE_DSP_23		"mediatek/mt7996/mt7992_dsp_23.bin"
 #define MT7992_ROM_PATCH_23		"mediatek/mt7996/mt7992_rom_patch_23.bin"
 
+#define MT7990_FIRMWARE_WA		""
+#define MT7990_FIRMWARE_WM		"mediatek/mt7996/mt7990_wm.bin"
+#define MT7990_FIRMWARE_DSP		""
+#define MT7990_ROM_PATCH		"mediatek/mt7996/mt7990_rom_patch.bin"
+
 #define MT7996_EEPROM_DEFAULT		"mediatek/mt7996/mt7996_eeprom.bin"
 #define MT7996_EEPROM_DEFAULT_INT	"mediatek/mt7996/mt7996_eeprom_2i5i6i.bin"
 #define MT7996_EEPROM_DEFAULT_233	"mediatek/mt7996/mt7996_eeprom_233.bin"
@@ -709,6 +716,11 @@ static inline u16 mt7996_rx_chainmask(struct mt7996_phy *phy)
 	return tx_chainmask | (BIT(fls(tx_chainmask)) * phy->has_aux_rx);
 }
 
+static inline bool mt7996_has_wa(struct mt7996_dev *dev)
+{
+	return !is_mt7990(&dev->mt76);
+}
+
 void mt7996_mac_init(struct mt7996_dev *dev);
 u32 mt7996_mac_wtbl_lmac_addr(struct mt7996_dev *dev, u16 wcid, u8 dw);
 bool mt7996_mac_wtbl_update(struct mt7996_dev *dev, int idx, u32 mask);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
index a4338367aaa1..05248339a17b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
@@ -257,3 +257,5 @@ MODULE_FIRMWARE(MT7992_FIRMWARE_WA);
 MODULE_FIRMWARE(MT7992_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7992_FIRMWARE_DSP);
 MODULE_FIRMWARE(MT7992_ROM_PATCH);
+MODULE_FIRMWARE(MT7990_FIRMWARE_WM);
+MODULE_FIRMWARE(MT7990_ROM_PATCH);
-- 
2.39.2



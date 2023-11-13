Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC222C4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 07:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOuswpbEwubvPqY+qvHqmihHLe1IZ5lOF2x0v0TqQd8=; b=z39rTEaxvvLDLCD59zd5s9aFL2
	mtyK7GShozsT0xQlomXyc6/KZ3gPwiM7qa7Qex4EBywzXgTihJdR/e9JOO4WF98PBYWn17xaBXOV0
	JT5bOYuRqRKrWTZ9NAoNa6D0pxLA/ABu94tlpDsWTtTDGP883RcQqerWeHU8mMMPLSiiGfZ3fCpvq
	I7EFP9ur7VQePGBse2tcBl6unieeraXjRTPet8VWw8NgTSwzDfBvubgnUDDXcfco1xFJkwR9e0kAC
	Ahu1GtaYNbYrDZ4tzjyOOMGgAKO3noOBzvLGmg1Y6yHTsRylfrqZ7KglFvdZdcwtymyQIsqlkvqGR
	b6qIyqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2R2l-00DPok-1r;
	Mon, 13 Nov 2023 07:07:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2R2i-00DPn7-1x
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Nov 2023 07:07:34 +0000
X-UUID: 4accfe5281f311ee9b7791016c24628a-20231113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MOuswpbEwubvPqY+qvHqmihHLe1IZ5lOF2x0v0TqQd8=;
	b=KA9gLOW5adSRMXbim3wiGmCoP4r58li6wjhJv2saMkwCtFNpVsk10gEPCm795HGgIk/qmmO+hDG+ZdAZvUmDNTbVliZNFwLelWdU6J7PooEyML0gLUtCdN/uJafLxjvYxh3WUewk5XvCxLiqxG8bzoUYyWL4XzOvGHo2+lm7MIg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:3625095b-3d09-4a8b-81e8-ab1aade776c2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:364b77b,CLOUDID:21d45295-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 4accfe5281f311ee9b7791016c24628a-20231113
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 93245388; Mon, 13 Nov 2023 00:07:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 13 Nov 2023 15:07:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 13 Nov 2023 15:07:20 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 2/8] wifi: mt76: connac: add firmware support for mt7992
Date: Mon, 13 Nov 2023 15:06:13 +0800
Message-ID: <20231113070619.19964-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231113070619.19964-1-shayne.chen@mediatek.com>
References: <20231113070619.19964-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_230732_654690_A35743E1 
X-CRM114-Status: GOOD (  14.39  )
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

Support firmware download and enable related AFE PLL for mt7992 chipsets.
This is a preliminary patch for mt7992 chipsets support.

Co-developed-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  5 +++++
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  3 ++-
 .../net/wireless/mediatek/mt76/mt7996/init.c  |  4 ++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 22 +++++++++++++++----
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  5 +++++
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |  4 ++++
 .../net/wireless/mediatek/mt76/mt7996/regs.h  |  7 ++++++
 7 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index e5ebde19af8f..fdde3d70b300 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -222,6 +222,11 @@ static inline bool is_mt7996(struct mt76_dev *dev)
 	return mt76_chip(dev) == 0x7990;
 }
 
+static inline bool is_mt7992(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7992;
+}
+
 static inline bool is_mt7622(struct mt76_dev *dev)
 {
 	if (!IS_ENABLED(CONFIG_MT7622_WMAC))
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index b475555097ff..96494ba2fdf7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -67,7 +67,8 @@ int mt76_connac_mcu_init_download(struct mt76_dev *dev, u32 addr, u32 len,
 	if ((!is_connac_v1(dev) && addr == MCU_PATCH_ADDRESS) ||
 	    (is_mt7921(dev) && addr == 0x900000) ||
 	    (is_mt7925(dev) && addr == 0x900000) ||
-	    (is_mt7996(dev) && addr == 0x900000))
+	    (is_mt7996(dev) && addr == 0x900000) ||
+	    (is_mt7992(dev) && addr == 0x900000))
 		cmd = MCU_CMD(PATCH_START_REQ);
 	else
 		cmd = MCU_CMD(TARGET_ADDRESS_LEN_REQ);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 64fa2f28c8c2..2a7c367afae1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -888,6 +888,10 @@ static int mt7996_init_hardware(struct mt7996_dev *dev)
 	int ret, idx;
 
 	mt76_wr(dev, MT_INT_SOURCE_CSR, ~0);
+	if (is_mt7992(&dev->mt76)) {
+		mt76_rmw(dev, MT_AFE_CTL_BAND_PLL_03(MT_BAND0), MT_AFE_CTL_BAND_PLL_03_MSB_EN, 0);
+		mt76_rmw(dev, MT_AFE_CTL_BAND_PLL_03(MT_BAND1), MT_AFE_CTL_BAND_PLL_03_MSB_EN, 0);
+	}
 
 	INIT_WORK(&dev->init_work, mt7996_init_work);
 	INIT_WORK(&dev->wed_rro.work, mt7996_wed_rro_work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index d56e63cb11ff..5e7bb97fd4fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -10,6 +10,20 @@
 #include "mac.h"
 #include "eeprom.h"
 
+#define fw_name(_dev, name, ...)	({			\
+	char *_fw;						\
+	switch (mt76_chip(&(_dev)->mt76)) {			\
+	case 0x7992:						\
+		_fw = MT7992_##name;				\
+		break;						\
+	case 0x7990:						\
+	default:						\
+		_fw = MT7996_##name;				\
+		break;						\
+	}							\
+	_fw;							\
+})
+
 struct mt7996_patch_hdr {
 	char build_date[16];
 	char platform[4];
@@ -2639,7 +2653,7 @@ static int mt7996_load_patch(struct mt7996_dev *dev)
 		return -EAGAIN;
 	}
 
-	ret = request_firmware(&fw, MT7996_ROM_PATCH, dev->mt76.dev);
+	ret = request_firmware(&fw, fw_name(dev, ROM_PATCH), dev->mt76.dev);
 	if (ret)
 		goto out;
 
@@ -2802,17 +2816,17 @@ static int mt7996_load_ram(struct mt7996_dev *dev)
 {
 	int ret;
 
-	ret = __mt7996_load_ram(dev, "WM", MT7996_FIRMWARE_WM,
+	ret = __mt7996_load_ram(dev, "WM", fw_name(dev, FIRMWARE_WM),
 				MT7996_RAM_TYPE_WM);
 	if (ret)
 		return ret;
 
-	ret = __mt7996_load_ram(dev, "DSP", MT7996_FIRMWARE_DSP,
+	ret = __mt7996_load_ram(dev, "DSP", fw_name(dev, FIRMWARE_DSP),
 				MT7996_RAM_TYPE_DSP);
 	if (ret)
 		return ret;
 
-	return __mt7996_load_ram(dev, "WA", MT7996_FIRMWARE_WA,
+	return __mt7996_load_ram(dev, "WA", fw_name(dev, FIRMWARE_WA),
 				 MT7996_RAM_TYPE_WA);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index aefd09c7d6e6..1a36ef50f6e1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -33,6 +33,11 @@
 #define MT7996_FIRMWARE_DSP		"mediatek/mt7996/mt7996_dsp.bin"
 #define MT7996_ROM_PATCH		"mediatek/mt7996/mt7996_rom_patch.bin"
 
+#define MT7992_FIRMWARE_WA		"mediatek/mt7996/mt7992_wa.bin"
+#define MT7992_FIRMWARE_WM		"mediatek/mt7996/mt7992_wm.bin"
+#define MT7992_FIRMWARE_DSP		"mediatek/mt7996/mt7992_dsp.bin"
+#define MT7992_ROM_PATCH		"mediatek/mt7996/mt7992_rom_patch.bin"
+
 #define MT7996_EEPROM_DEFAULT		"mediatek/mt7996/mt7996_eeprom.bin"
 #define MT7996_EEPROM_SIZE		7680
 #define MT7996_EEPROM_BLOCK_SIZE	16
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
index 93ecc9a8dde0..baa5fb97a121 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
@@ -244,3 +244,7 @@ MODULE_FIRMWARE(MT7996_FIRMWARE_WA);
 MODULE_FIRMWARE(MT7996_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7996_FIRMWARE_DSP);
 MODULE_FIRMWARE(MT7996_ROM_PATCH);
+MODULE_FIRMWARE(MT7992_FIRMWARE_WA);
+MODULE_FIRMWARE(MT7992_FIRMWARE_WM);
+MODULE_FIRMWARE(MT7992_FIRMWARE_DSP);
+MODULE_FIRMWARE(MT7992_ROM_PATCH);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
index d8904cbc2856..aee577d90ddb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
@@ -683,4 +683,11 @@ enum base_rev {
 #define MT_MCU_WM_EXCP_LR_CTRL			MT_MCU_WM_EXCP(0x200)
 #define MT_MCU_WM_EXCP_LR_LOG			MT_MCU_WM_EXCP(0x204)
 
+/* CONN AFE CTL CON */
+#define MT_AFE_CTL_BASE				0x18043000
+#define MT_AFE_CTL_BAND(_band, ofs)		(MT_AFE_CTL_BASE + \
+						 ((_band) * 0x1000) + (ofs))
+#define MT_AFE_CTL_BAND_PLL_03(_band)		MT_AFE_CTL_BAND(_band, 0x2c)
+#define MT_AFE_CTL_BAND_PLL_03_MSB_EN		BIT(1)
+
 #endif
-- 
2.39.2



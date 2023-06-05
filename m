Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0590C7EE24
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 15:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uj4E9IezUXEGMnvbFy8tTh1YNvJ1lTSrEvkGyIi3SDw=; b=HPSeTGmHXgGe+Yiahvx8iTYADS
	kh5jmPTHmeKiaRXK3B1lQlyYTRGpCiSLsD73c87+tOZaufID13mpZsrogfVmLGtHdPhuJNDoGucoK
	T7q/lDw/HE5GVVqjlalxXhR/2pZDOj8yItW1olhqsg4p/NUXXWpS24tU8YuoqQGaUC8oLTBHuBinG
	OEGp4MQ2AsPZqJCbtMup5bfXcM+xNaV8o04vB1K+8Gz2gcu63R+NEp6oz+mFCk5ggtWyePjoXYSAP
	gdaK6rmvBgaUs3ryh6vQAk+2V2qSnoAwL8zQCMrpECJWFmNtDgho3oGw+o3j/r+zd6JLEPNNTLlym
	48xJ86NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CBb-00FxYv-0u;
	Mon, 05 Jun 2023 15:31:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CBX-00FxXr-2S
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 15:31:57 +0000
X-UUID: 18c6065803b611ee912e1518a6540028-20230605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uj4E9IezUXEGMnvbFy8tTh1YNvJ1lTSrEvkGyIi3SDw=;
	b=c2TGKkHUjZknr1SZyc4J0GhZroaxJyj7bo7tsEXkOk7DOn1mT4r+X8bAuWW+Qc3Uhoc9HvEs//czg1d0mtknymHLQG8v2+542A59aO09OEqLo46W7N1XDGt7U3bumYVyFccBSMAzHO3WhnnTg5dqlyIX1CuDNGcPZ5mj97X+AMM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:3a4be827-c508-472a-b927-54d793b6074f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:6237a23d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 18c6065803b611ee912e1518a6540028-20230605
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 589004542; Mon, 05 Jun 2023 08:31:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 5 Jun 2023 23:21:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Jun 2023 23:21:50 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v3 02/10] wifi: mt76: connac: add support for dsp firmware download
Date: Mon, 5 Jun 2023 23:21:33 +0800
Message-ID: <20230605152141.17434-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230605152141.17434-1-shayne.chen@mediatek.com>
References: <20230605152141.17434-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_083155_808348_C145BC1E 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Add FW_START_WORKING_PDA_DSP for the indication of starting DSP
firmware download, which is for phy-related control.
The firmware is transparent to the driver, but it's necessary for the
firmware download process.

Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2:
  - merge two commits
  - move main load ram code to a regular function
v3:
  - remove all macros to directly call __mt7996_load_ram()
  - add back missing code which records fw_version to wiphy
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 67 +++++++++----------
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  7 ++
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |  1 +
 4 files changed, 42 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index ca1ce97a6d2f..4a21c237ea6e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -22,6 +22,7 @@
 
 #define FW_START_OVERRIDE		BIT(0)
 #define FW_START_WORKING_PDA_CR4	BIT(2)
+#define FW_START_WORKING_PDA_DSP	BIT(3)
 
 #define PATCH_SEC_NOT_SUPPORT		GENMASK(31, 0)
 #define PATCH_SEC_TYPE_MASK		GENMASK(15, 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 88e2f9d0e513..545cc98749ac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2155,7 +2155,7 @@ static int mt7996_load_patch(struct mt7996_dev *dev)
 static int
 mt7996_mcu_send_ram_firmware(struct mt7996_dev *dev,
 			     const struct mt7996_fw_trailer *hdr,
-			     const u8 *data, bool is_wa)
+			     const u8 *data, enum mt7996_ram_type type)
 {
 	int i, offset = 0;
 	u32 override = 0, option = 0;
@@ -2167,8 +2167,10 @@ mt7996_mcu_send_ram_firmware(struct mt7996_dev *dev,
 
 		region = (const struct mt7996_fw_region *)((const u8 *)hdr -
 			 (hdr->n_region - i) * sizeof(*region));
+		/* DSP and WA use same mode */
 		mode = mt76_connac_mcu_gen_dl_mode(&dev->mt76,
-						   region->feature_set, is_wa);
+						   region->feature_set,
+						   type != MT7996_RAM_TYPE_WM);
 		len = le32_to_cpu(region->len);
 		addr = le32_to_cpu(region->addr);
 
@@ -2195,19 +2197,22 @@ mt7996_mcu_send_ram_firmware(struct mt7996_dev *dev,
 	if (override)
 		option |= FW_START_OVERRIDE;
 
-	if (is_wa)
+	if (type == MT7996_RAM_TYPE_WA)
 		option |= FW_START_WORKING_PDA_CR4;
+	else if (type == MT7996_RAM_TYPE_DSP)
+		option |= FW_START_WORKING_PDA_DSP;
 
 	return mt76_connac_mcu_start_firmware(&dev->mt76, override, option);
 }
 
-static int mt7996_load_ram(struct mt7996_dev *dev)
+static int __mt7996_load_ram(struct mt7996_dev *dev, const char *fw_type,
+			     const char *fw_file, enum mt7996_ram_type ram_type)
 {
 	const struct mt7996_fw_trailer *hdr;
 	const struct firmware *fw;
 	int ret;
 
-	ret = request_firmware(&fw, MT7996_FIRMWARE_WM, dev->mt76.dev);
+	ret = request_firmware(&fw, fw_file, dev->mt76.dev);
 	if (ret)
 		return ret;
 
@@ -2217,37 +2222,13 @@ static int mt7996_load_ram(struct mt7996_dev *dev)
 		goto out;
 	}
 
-	hdr = (const struct mt7996_fw_trailer *)(fw->data + fw->size - sizeof(*hdr));
-
-	dev_info(dev->mt76.dev, "WM Firmware Version: %.10s, Build Time: %.15s\n",
-		 hdr->fw_ver, hdr->build_date);
+	hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
+	dev_info(dev->mt76.dev, "%s Firmware Version: %.10s, Build Time: %.15s\n",
+		 fw_type, hdr->fw_ver, hdr->build_date);
 
-	ret = mt7996_mcu_send_ram_firmware(dev, hdr, fw->data, false);
+	ret = mt7996_mcu_send_ram_firmware(dev, hdr, fw->data, ram_type);
 	if (ret) {
-		dev_err(dev->mt76.dev, "Failed to start WM firmware\n");
-		goto out;
-	}
-
-	release_firmware(fw);
-
-	ret = request_firmware(&fw, MT7996_FIRMWARE_WA, dev->mt76.dev);
-	if (ret)
-		return ret;
-
-	if (!fw || !fw->data || fw->size < sizeof(*hdr)) {
-		dev_err(dev->mt76.dev, "Invalid firmware\n");
-		ret = -EINVAL;
-		goto out;
-	}
-
-	hdr = (const struct mt7996_fw_trailer *)(fw->data + fw->size - sizeof(*hdr));
-
-	dev_info(dev->mt76.dev, "WA Firmware Version: %.10s, Build Time: %.15s\n",
-		 hdr->fw_ver, hdr->build_date);
-
-	ret = mt7996_mcu_send_ram_firmware(dev, hdr, fw->data, true);
-	if (ret) {
-		dev_err(dev->mt76.dev, "Failed to start WA firmware\n");
+		dev_err(dev->mt76.dev, "Failed to start %s firmware\n", fw_type);
 		goto out;
 	}
 
@@ -2261,6 +2242,24 @@ static int mt7996_load_ram(struct mt7996_dev *dev)
 	return ret;
 }
 
+static int mt7996_load_ram(struct mt7996_dev *dev)
+{
+	int ret;
+
+	ret = __mt7996_load_ram(dev, "WM", MT7996_FIRMWARE_WM,
+				MT7996_RAM_TYPE_WM);
+	if (ret)
+		return ret;
+
+	ret = __mt7996_load_ram(dev, "DSP", MT7996_FIRMWARE_DSP,
+				MT7996_RAM_TYPE_DSP);
+	if (ret)
+		return ret;
+
+	return __mt7996_load_ram(dev, "WA", MT7996_FIRMWARE_WA,
+				 MT7996_RAM_TYPE_WA);
+}
+
 static int
 mt7996_firmware_state(struct mt7996_dev *dev, bool wa)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 4d7dcb95a620..7dfdc7384056 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -29,6 +29,7 @@
 
 #define MT7996_FIRMWARE_WA		"mediatek/mt7996/mt7996_wa.bin"
 #define MT7996_FIRMWARE_WM		"mediatek/mt7996/mt7996_wm.bin"
+#define MT7996_FIRMWARE_DSP		"mediatek/mt7996/mt7996_dsp.bin"
 #define MT7996_ROM_PATCH		"mediatek/mt7996/mt7996_rom_patch.bin"
 
 #define MT7996_EEPROM_DEFAULT		"mediatek/mt7996/mt7996_eeprom.bin"
@@ -52,6 +53,12 @@ struct mt7996_sta;
 struct mt7996_dfs_pulse;
 struct mt7996_dfs_pattern;
 
+enum mt7996_ram_type {
+	MT7996_RAM_TYPE_WM,
+	MT7996_RAM_TYPE_WA,
+	MT7996_RAM_TYPE_DSP,
+};
+
 enum mt7996_txq_id {
 	MT7996_TXQ_FWDL = 16,
 	MT7996_TXQ_MCU_WM,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
index 64aee3fb5445..c5301050ff8b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
@@ -219,4 +219,5 @@ MODULE_DEVICE_TABLE(pci, mt7996_pci_device_table);
 MODULE_DEVICE_TABLE(pci, mt7996_hif_device_table);
 MODULE_FIRMWARE(MT7996_FIRMWARE_WA);
 MODULE_FIRMWARE(MT7996_FIRMWARE_WM);
+MODULE_FIRMWARE(MT7996_FIRMWARE_DSP);
 MODULE_FIRMWARE(MT7996_ROM_PATCH);
-- 
2.39.2



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FDAC7EE37
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 08:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kM4DvW56gdx7k7BnfdcO2YltDOzNHaXWA9ZdUCoRao=; b=B7ccEYjom17YQkyT9ner2znR7C
	2VOSXwNo9zvCe9eFuYPbP4NsxXgRDPgsZIXazWU1tkQ/menUfkhqIVqzHq9Z7rRFCQ79j4QE8TfwA
	wfW1Cy6pK4ZP+OfvQbN8Oy4taFIzWu3jveSTx7msSYZX95RdTC7rjJQQDOOrIIHvOVz3PVeWrn1Wy
	h+20EP6O7CFaeeLXZVm3EqwKGl/VswNJhuvyBSnQWaqKcBM+Mq/rn3xovER0Ni+0uuv82DQyjO9tb
	15u6rXBua+7CphIFeentXHUnjCK+vODn5D+RYC+7u39kJkV9ynwy9sGw735lFVnQGj8Y57+Tk6AE6
	rsz6w6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q65SO-00Eh0G-1w;
	Mon, 05 Jun 2023 08:20:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q65SL-00EgyB-1J
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 08:20:51 +0000
X-UUID: dd2301b4037911ee912e1518a6540028-20230605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+kM4DvW56gdx7k7BnfdcO2YltDOzNHaXWA9ZdUCoRao=;
	b=fp2mEmQJkq0kQXTiWDB1wJ6CBsF4SXjIDallP0J4eeUMN1tzP50VK05VWoUBdGsZ8d0ujwhXS6ds7toFnIYxkXIBN/jMqNwLA47WbgSbpnyvXMHUm/M7B570cku2kwWR6HKo9FPBhiAuXKtG6oMspa5kkdGJvkAWeilgMqiAN64=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:d2eb0726-4f19-4260-8e96-30a691a5a875,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.25,REQID:d2eb0726-4f19-4260-8e96-30a691a5a875,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:d5b0ae3,CLOUDID:de0f0c6e-2f20-4998-991c-3b78627e4938,B
	ulkID:2306051620456YKF1209,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: dd2301b4037911ee912e1518a6540028-20230605
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1959761962; Mon, 05 Jun 2023 01:20:43 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 5 Jun 2023 16:20:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Jun 2023 16:20:40 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 02/10] wifi: mt76: connac: add support for dsp firmware download
Date: Mon, 5 Jun 2023 16:19:39 +0800
Message-ID: <20230605081947.12804-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230605081947.12804-1-shayne.chen@mediatek.com>
References: <20230605081947.12804-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_012049_450987_07C58071 
X-CRM114-Status: GOOD (  18.14  )
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
  - merge two commits:
    - wifi: mt76: connac: add a setting bit for dsp firmware
    - wifi: mt76: mt7996: add dsp firmware download
  - move main code for loading ram to a regular function
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 70 +++++++++----------
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  7 ++
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |  1 +
 4 files changed, 43 insertions(+), 36 deletions(-)

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
index 88e2f9d0e513..28930693a75a 100644
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
 
@@ -2217,48 +2222,41 @@ static int mt7996_load_ram(struct mt7996_dev *dev)
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
+		dev_err(dev->mt76.dev, "Failed to start %s firmware\n", fw_type);
 		goto out;
 	}
 
+out:
 	release_firmware(fw);
 
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
+	return ret;
+}
 
-	ret = mt7996_mcu_send_ram_firmware(dev, hdr, fw->data, true);
-	if (ret) {
-		dev_err(dev->mt76.dev, "Failed to start WA firmware\n");
-		goto out;
-	}
+static int mt7996_load_ram(struct mt7996_dev *dev)
+{
+	int ret;
 
-	snprintf(dev->mt76.hw->wiphy->fw_version,
-		 sizeof(dev->mt76.hw->wiphy->fw_version),
-		 "%.10s-%.15s", hdr->fw_ver, hdr->build_date);
+#define LOAD_RAM(_type) \
+	do {								\
+		ret = __mt7996_load_ram(dev, #_type,			\
+					MT7996_FIRMWARE_##_type,	\
+					MT7996_RAM_TYPE_##_type);	\
+		if (ret)						\
+			return ret;					\
+	} while (0)
 
-out:
-	release_firmware(fw);
+	LOAD_RAM(WM);
+	LOAD_RAM(DSP);
+	LOAD_RAM(WA);
+#undef LOAD_RAM
 
-	return ret;
+	return 0;
 }
 
 static int
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



Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E64FC636C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:34:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FDD9611AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FDD9611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ye6nbDjdjUE6qcHEcvWNcH96vx26uvCcWt4l1Pitio=; b=tA+jCnOrqVgzN6
	msDyPhpzb+ZaR8S/6qx3Gp3iovCA6m2iTIDn5sYRLrI6XSM1dgYQnbT4zayfY2fR0i0kFONn1t7rg
	aq83fdS6pHFLyO9JXKTGVH1bBVGIT8QiljAw24vdh3ZFRfbUdJuMjeiLNAkjx0WV3Ku66jDeTAGuo
	D7PgUfPWUGf4lhToWKRdB/pSh6FajjVTPkyOeSgHbYchsFgowFQwEviDym2oZ4ZcLBrA/E6HVKYyM
	k1c0x4kaicWK7dLXsnXFmOBRY/n2BgAtuKdbv6WnA7y0roGgWEM5fxRE0zENnwmIhJfQhaYQhLCJC
	UCI45nfOTFAQoLOwmu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m45Fw-001m07-3v; Thu, 15 Jul 2021 17:34:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m45Fs-001lxj-2C
 for linux-mediatek@lists.infradead.org; Thu, 15 Jul 2021 17:34:38 +0000
X-UUID: 6f44f730c347401bbd46d9ba44dad508-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ewas8bPpDWRb4j//jQIJJ8XPO4gpV/ZMW/tpa2RX1aM=; 
 b=J26/aM91P26jna1y1TCPGxDMHx0sfrDG2E7q8QP5o56d1OcKJAa2X9xMstwoy4kKO4WG/Vp31OL+Mc+RaSAjjwpBeziSDzysgZAlou5y68LF1rEkWeRK3qY3NJGGhnfoBTn/ADq7DLHqtiLFghxKTqx/tRzRIBM+pfiWavNdSgY=;
X-UUID: 6f44f730c347401bbd46d9ba44dad508-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1650288112; Thu, 15 Jul 2021 10:34:31 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:34:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 01:34:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Jul 2021 01:34:22 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, Jimmy Hu
 <Jimmy.Hu@mediatek.com>, <jemele@google.com>, <yenlinlai@google.com>,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: mt7921: Add mt7922 support
Date: Fri, 16 Jul 2021 01:34:19 +0800
Message-ID: <27e39fd3c6d70837772e56f85bf9b01e8beeca47.1626370282.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_103436_162839_F81B1409 
X-CRM114-Status: GOOD (  17.34  )
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

From: Deren Wu <deren.wu@mediatek.com>

Add new chip mt7922 in mt7921 module with following items
1. new chip ID / fw bin name
2. is_mt7922()
	check chip type for different fw files
3. mt7921_get_data_mode()
	check security type of fw (backward compatible)

Co-developed-by: Jimmy Hu <Jimmy.Hu@mediatek.com>
Signed-off-by: Jimmy Hu <Jimmy.Hu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  7 +-
 .../wireless/mediatek/mt76/mt7921/eeprom.c    |  1 +
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 71 +++++++++++++++++--
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  3 +
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  3 +
 5 files changed, 80 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index f49d97d0a1c5..e7f01c2978a2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -85,9 +85,14 @@ struct mt76_connac_coredump {
 
 extern const struct wiphy_wowlan_support mt76_connac_wowlan_support;
 
+static inline bool is_mt7922(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7922;
+}
+
 static inline bool is_mt7921(struct mt76_dev *dev)
 {
-	return mt76_chip(dev) == 0x7961;
+	return mt76_chip(dev) == 0x7961 || is_mt7922(dev);
 }
 
 static inline bool is_mt7663(struct mt76_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c
index 691d14a1a7bf..4d0a4aeac6bf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c
@@ -36,6 +36,7 @@ static int mt7921_check_eeprom(struct mt7921_dev *dev)
 	val = get_unaligned_le16(eeprom);
 
 	switch (val) {
+	case 0x7922:
 	case 0x7961:
 		return 0;
 	default:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 35d57d94dadd..5672198a94e6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -82,9 +82,17 @@ struct mt7921_fw_region {
 #define FW_START_OVERRIDE		BIT(0)
 #define FW_START_WORKING_PDA_CR4	BIT(2)
 
+#define PATCH_SEC_NOT_SUPPORT		GENMASK(31, 0)
 #define PATCH_SEC_TYPE_MASK		GENMASK(15, 0)
 #define PATCH_SEC_TYPE_INFO		0x2
 
+#define PATCH_SEC_ENC_TYPE_MASK		GENMASK(31, 24)
+#define PATCH_SEC_ENC_TYPE_PLAIN		0x00
+#define PATCH_SEC_ENC_TYPE_AES			0x01
+#define PATCH_SEC_ENC_TYPE_SCRAMBLE		0x02
+#define PATCH_SEC_ENC_SCRAMBLE_INFO_MASK	GENMASK(15, 0)
+#define PATCH_SEC_ENC_AES_KEY_MASK		GENMASK(7, 0)
+
 #define to_wcid_lo(id)			FIELD_GET(GENMASK(7, 0), (u16)id)
 #define to_wcid_hi(id)			FIELD_GET(GENMASK(9, 8), (u16)id)
 
@@ -738,6 +746,46 @@ static int mt7921_driver_own(struct mt7921_dev *dev)
 	return 0;
 }
 
+static u32 mt7921_get_data_mode(struct mt7921_dev *dev, u32 info)
+{
+	u32 mode = DL_MODE_NEED_RSP;
+
+	if (info == PATCH_SEC_NOT_SUPPORT)
+		return mode;
+
+	switch (FIELD_GET(PATCH_SEC_ENC_TYPE_MASK, info)) {
+	case PATCH_SEC_ENC_TYPE_PLAIN:
+		break;
+	case PATCH_SEC_ENC_TYPE_AES:
+		mode |= DL_MODE_ENCRYPT;
+		mode |= FIELD_PREP(DL_MODE_KEY_IDX,
+				(info & PATCH_SEC_ENC_AES_KEY_MASK)) & DL_MODE_KEY_IDX;
+		mode |= DL_MODE_RESET_SEC_IV;
+		break;
+	case PATCH_SEC_ENC_TYPE_SCRAMBLE:
+		mode |= DL_MODE_ENCRYPT;
+		mode |= DL_CONFIG_ENCRY_MODE_SEL;
+		mode |= DL_MODE_RESET_SEC_IV;
+		break;
+	default:
+		dev_err(dev->mt76.dev, "Encryption type not support!\n");
+	}
+
+	return mode;
+}
+
+static char *mt7921_patch_name(struct mt7921_dev *dev)
+{
+	char *ret;
+
+	if (is_mt7922(&dev->mt76))
+		ret = MT7922_ROM_PATCH;
+	else
+		ret = MT7921_ROM_PATCH;
+
+	return ret;
+}
+
 static int mt7921_load_patch(struct mt7921_dev *dev)
 {
 	const struct mt7921_patch_hdr *hdr;
@@ -755,7 +803,7 @@ static int mt7921_load_patch(struct mt7921_dev *dev)
 		return -EAGAIN;
 	}
 
-	ret = request_firmware(&fw, MT7921_ROM_PATCH, dev->mt76.dev);
+	ret = request_firmware(&fw, mt7921_patch_name(dev), dev->mt76.dev);
 	if (ret)
 		goto out;
 
@@ -773,7 +821,8 @@ static int mt7921_load_patch(struct mt7921_dev *dev)
 	for (i = 0; i < be32_to_cpu(hdr->desc.n_region); i++) {
 		struct mt7921_patch_sec *sec;
 		const u8 *dl;
-		u32 len, addr;
+		u32 len, addr, mode;
+		u32 sec_info = 0;
 
 		sec = (struct mt7921_patch_sec *)(fw->data + sizeof(*hdr) +
 						  i * sizeof(*sec));
@@ -786,9 +835,11 @@ static int mt7921_load_patch(struct mt7921_dev *dev)
 		addr = be32_to_cpu(sec->info.addr);
 		len = be32_to_cpu(sec->info.len);
 		dl = fw->data + be32_to_cpu(sec->offs);
+		sec_info = be32_to_cpu(sec->info.sec_key_idx);
+		mode = mt7921_get_data_mode(dev, sec_info);
 
 		ret = mt76_connac_mcu_init_download(&dev->mt76, addr, len,
-						    DL_MODE_NEED_RSP);
+						    mode);
 		if (ret) {
 			dev_err(dev->mt76.dev, "Download request failed\n");
 			goto out;
@@ -885,13 +936,25 @@ mt7921_mcu_send_ram_firmware(struct mt7921_dev *dev,
 	return mt76_connac_mcu_start_firmware(&dev->mt76, override, option);
 }
 
+static char *mt7921_ram_name(struct mt7921_dev *dev)
+{
+	char *ret;
+
+	if (is_mt7922(&dev->mt76))
+		ret = MT7922_FIRMWARE_WM;
+	else
+		ret = MT7921_FIRMWARE_WM;
+
+	return ret;
+}
+
 static int mt7921_load_ram(struct mt7921_dev *dev)
 {
 	const struct mt7921_fw_trailer *hdr;
 	const struct firmware *fw;
 	int ret;
 
-	ret = request_firmware(&fw, MT7921_FIRMWARE_WM, dev->mt76.dev);
+	ret = request_firmware(&fw, mt7921_ram_name(dev), dev->mt76.dev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 6e9e4dfb3928..51bcaa599268 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -33,6 +33,9 @@
 #define MT7921_FIRMWARE_WM		"mediatek/WIFI_RAM_CODE_MT7961_1.bin"
 #define MT7921_ROM_PATCH		"mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin"
 
+#define MT7922_FIRMWARE_WM		"mediatek/WIFI_RAM_CODE_MT7922_1.bin"
+#define MT7922_ROM_PATCH		"mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin"
+
 #define MT7921_EEPROM_SIZE		3584
 #define MT7921_TOKEN_SIZE		8192
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 33782e1ee312..97ca8290881f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -14,6 +14,7 @@
 
 static const struct pci_device_id mt7921_pci_device_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7961) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7922) },
 	{ },
 };
 
@@ -336,6 +337,8 @@ module_pci_driver(mt7921_pci_driver);
 MODULE_DEVICE_TABLE(pci, mt7921_pci_device_table);
 MODULE_FIRMWARE(MT7921_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7921_ROM_PATCH);
+MODULE_FIRMWARE(MT7922_FIRMWARE_WM);
+MODULE_FIRMWARE(MT7922_ROM_PATCH);
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

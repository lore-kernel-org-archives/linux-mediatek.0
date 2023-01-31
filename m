Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A8EC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgDElVLFzeIMwfiqwbieYy0WXZwGSrTdGNBTEzGbxrU=; b=yXAmMyWTN4zvWmHsjyiuLrx0Yq
	Bj/WMLPacGrxztV+PGUFoKi/c09fxtsT/3MOfprupM/Wcx8jytb1o1exQGiasff+WKA7eCAvWs+NB
	M4mLiRT14AGccsuk19N4x5lF0dnVSpiPyeeA8sWwq76rxbcK18/xSoGHbc8VSsfYa5tDDDExBd56q
	jRTEAa+aySehzriZAm4+SdxEANtUuVGHZIm7srmxk0jDDyj6+3fEY52JroG5Ts9fWWV/fzuB+if5J
	IWVUQrW862wBpTgZSIM515Ii4Eaji/6WMwfbMSO6s/SfMSMgMvhomtaN4GRSkikHKSXVwbmvcobFD
	NpnGGEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMn4b-0073Cz-Ex; Tue, 31 Jan 2023 09:37:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMn4C-0072zB-Fk
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 09:36:43 +0000
X-UUID: beabfb28a14a11edbbe3f76fe852e059-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SgDElVLFzeIMwfiqwbieYy0WXZwGSrTdGNBTEzGbxrU=;
	b=eGhLtWaFghvEb/kV71CY682P43hWW2blw7uwhku7CPkcxTDcTPiR2Vz/+95bUy7+C+QGvQ7OojyYDOnwlRSh/t2oXYcYgasQPZZkvMt2ch3gO4F82ZqfWaJsZbw1igGBcQwVjAfGmDWUfToiw4pdC+3pxR6afzOYFtbo5hrqJyc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:79246e27-21dd-499e-b377-6feb2d73a34e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:382c04f7-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: beabfb28a14a11edbbe3f76fe852e059-20230131
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 519081824; Tue, 31 Jan 2023 02:36:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 31 Jan 2023 17:36:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 17:36:29 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 07/13] wifi: mt76: mt7996: add variants support
Date: Tue, 31 Jan 2023 17:36:05 +0800
Message-ID: <20230131093611.30914-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230131093611.30914-1-shayne.chen@mediatek.com>
References: <20230131093611.30914-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_013640_573549_381D4DF2 
X-CRM114-Status: GOOD (  15.83  )
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

There are variants of mt7996 which are different from eht supported and
wtbl size limit. Get the hw caps with CHIP_CONFIG command.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7996/eeprom.c    | 27 +++++++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 46 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  4 ++
 3 files changed, 77 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index 5d8e0353627e..2e48c5a40f81 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -87,6 +87,28 @@ static int mt7996_eeprom_load(struct mt7996_dev *dev)
 	return mt7996_check_eeprom(dev);
 }
 
+static int mt7996_eeprom_parse_efuse_hw_cap(struct mt7996_dev *dev)
+{
+#define MODE_HE_ONLY		BIT(0)
+#define WTBL_SIZE_GROUP		GENMASK(31, 28)
+	u32 cap = 0;
+	int ret;
+
+	ret = mt7996_mcu_get_chip_config(dev, &cap);
+	if (ret)
+		return ret;
+
+	if (cap) {
+		dev->has_eht = !(cap & MODE_HE_ONLY);
+		dev->wtbl_size_group = u32_get_bits(cap, WTBL_SIZE_GROUP);
+	}
+
+	if (dev->wtbl_size_group < 2 || dev->wtbl_size_group > 4)
+		dev->wtbl_size_group = 2; /* set default */
+
+	return 0;
+}
+
 static int mt7996_eeprom_parse_band_config(struct mt7996_phy *phy)
 {
 	u8 *eeprom = phy->dev->mt76.eeprom.data;
@@ -133,6 +155,7 @@ int mt7996_eeprom_parse_hw_cap(struct mt7996_dev *dev, struct mt7996_phy *phy)
 	u8 path, nss, band_idx = phy->mt76->band_idx;
 	u8 *eeprom = dev->mt76.eeprom.data;
 	struct mt76_phy *mphy = phy->mt76;
+	int ret;
 
 	switch (band_idx) {
 	case MT_BAND1:
@@ -167,6 +190,10 @@ int mt7996_eeprom_parse_hw_cap(struct mt7996_dev *dev, struct mt7996_phy *phy)
 		dev->chainshift[band_idx + 1] = dev->chainshift[band_idx] +
 						hweight16(mphy->chainmask);
 
+	ret = mt7996_eeprom_parse_efuse_hw_cap(dev);
+	if (ret)
+		return ret;
+
 	return mt7996_eeprom_parse_band_config(phy);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index d593ed9e3f73..f42f18f00a26 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2978,6 +2978,52 @@ int mt7996_mcu_get_eeprom_free_block(struct mt7996_dev *dev, u8 *block_num)
 	return 0;
 }
 
+int mt7996_mcu_get_chip_config(struct mt7996_dev *dev, u32 *cap)
+{
+#define NIC_CAP	3
+#define UNI_EVENT_CHIP_CONFIG_EFUSE_VERSION	0x21
+	struct {
+		u8 _rsv[4];
+
+		__le16 tag;
+		__le16 len;
+	} __packed req = {
+		.tag = cpu_to_le16(NIC_CAP),
+		.len = cpu_to_le16(sizeof(req) - 4),
+	};
+	struct sk_buff *skb;
+	u8 *buf;
+	int ret;
+
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
+					MCU_WM_UNI_CMD_QUERY(CHIP_CONFIG), &req,
+					sizeof(req), true, &skb);
+	if (ret)
+		return ret;
+
+	/* fixed field */
+	skb_pull(skb, 4);
+
+	buf = skb->data;
+	while (buf - skb->data < skb->len) {
+		struct tlv *tlv = (struct tlv *)buf;
+
+		switch (le16_to_cpu(tlv->tag)) {
+		case UNI_EVENT_CHIP_CONFIG_EFUSE_VERSION:
+			*cap = le32_to_cpu(*(__le32 *)(buf + sizeof(*tlv)));
+			break;
+		default:
+			break;
+		};
+
+		buf += le16_to_cpu(tlv->len);
+	}
+
+	dev_kfree_skb(skb);
+
+	return 0;
+}
+
 int mt7996_mcu_get_chan_mib_info(struct mt7996_phy *phy, bool chan_switch)
 {
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 725344791b4c..00f3beda74cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -264,6 +264,7 @@ struct mt7996_dev {
 	bool dbdc_support:1;
 	bool tbtc_support:1;
 	bool flash_mode:1;
+	bool has_eht:1;
 
 	bool ibf;
 	u8 fw_debug_wm;
@@ -281,6 +282,8 @@ struct mt7996_dev {
 
 	u32 reg_l1_backup;
 	u32 reg_l2_backup;
+
+	u8 wtbl_size_group;
 };
 
 enum {
@@ -419,6 +422,7 @@ int mt7996_mcu_set_fixed_rate_ctrl(struct mt7996_dev *dev,
 int mt7996_mcu_set_eeprom(struct mt7996_dev *dev);
 int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset);
 int mt7996_mcu_get_eeprom_free_block(struct mt7996_dev *dev, u8 *block_num);
+int mt7996_mcu_get_chip_config(struct mt7996_dev *dev, u32 *cap);
 int mt7996_mcu_set_ser(struct mt7996_dev *dev, u8 action, u8 set, u8 band);
 int mt7996_mcu_set_txbf(struct mt7996_dev *dev, u8 action);
 int mt7996_mcu_set_fcc5_lpn(struct mt7996_dev *dev, int val);
-- 
2.25.1



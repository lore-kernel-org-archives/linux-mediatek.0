Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165EEC001DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdD3lbzW0D/9oomxCN16eTleOOdC7vYYUe/kJlTfSxY=; b=ftVXqZ6mjxlbN9vZgt2b2NF1Ho
	Z35NjV2NFsnrX+Nz/i+PzqYGvk1Q/+vi3aXSNJIyQa5LFMXva731ZvEB4Mw5VwOHx+sr41R7fhxCz
	BLoaExj/zs5UY8BYG0L1fR7A46qQToAeOaKDAUC7mLVW8SE1hxGxUF+vQhOH5vtLswmeWHD3eNiy9
	+XuqYXh/RyJ8L+UFhC9c0IUQ6uHFUHyLxrO80FAhz6JtgKunmpzH1y2D7f63GqdFsCEeU0oNbR9Uk
	KnqfQXpukOTDwK8QmhJKIRiM+PnAFAptA/jR7NMaF+sdaWg4eGENozbslrY3eRIldREtEMMR/H/Lf
	DY9nFZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRr-002beR-2v;
	Tue, 01 Aug 2023 14:34:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRl-002bYY-2Z
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 14:34:04 +0000
X-UUID: 70a96876307811ee83ed1395ce914268-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xdD3lbzW0D/9oomxCN16eTleOOdC7vYYUe/kJlTfSxY=;
	b=Gj8T4TX2a17Np+0b6ft2C5JFdCZ8zTSbG1LDINoVFJaY6i1EoHEmVZQ9IW6BwUkrbmMR8bhXOqsne+PkZG3KBmTYOiYQTBGsvz6RVm7Lg1F0R3rxWFOHmaw4+2/YxufnTZbdyZZ9jFydRNKIKPAVLCLGi6dYjLZU/DXeGa7gbqQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:e9d78abb-f8db-422c-bf12-6cd0bbd2466d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.30,REQID:e9d78abb-f8db-422c-bf12-6cd0bbd2466d,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:1fcc6f8,CLOUDID:648c91d2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:2308012233551XCO2NYU,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48|38,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 70a96876307811ee83ed1395ce914268-20230801
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1455375552; Tue, 01 Aug 2023 07:33:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 22:33:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 22:33:51 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 1/8] wifi: mt76: connac: introduce helper for mt7925 chipset
Date: Tue, 1 Aug 2023 22:30:25 +0800
Message-ID: <c5d2d448026513fec03855382dda9e33e63c1fe8.1690863143.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1690863143.git.deren.wu@mediatek.com>
References: <cover.1690863143.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_073401_901413_0867C44E 
X-CRM114-Status: GOOD (  14.00  )
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

Introduce is_mt7925() helper for new chipset. mt7925 runs the same
firmware download and mmio map flow as mt7921.

This is a preliminary patch to support mt7925 driver.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h     | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 +-
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 22878f088804..1f29d8cd900c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -172,6 +172,11 @@ struct mt76_connac_tx_free {
 
 extern const struct wiphy_wowlan_support mt76_connac_wowlan_support;
 
+static inline bool is_mt7925(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7925;
+}
+
 static inline bool is_mt7922(struct mt76_dev *dev)
 {
 	return mt76_chip(dev) == 0x7922;
@@ -245,6 +250,7 @@ static inline bool is_mt76_fw_txp(struct mt76_dev *dev)
 	switch (mt76_chip(dev)) {
 	case 0x7961:
 	case 0x7922:
+	case 0x7925:
 	case 0x7663:
 	case 0x7622:
 		return false;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index ee5177fd6dde..4e74861ee197 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -187,7 +187,7 @@ void mt76_connac_write_hw_txp(struct mt76_dev *dev,
 
 	txp->msdu_id[0] = cpu_to_le16(id | MT_MSDU_ID_VALID);
 
-	if (is_mt7663(dev) || is_mt7921(dev))
+	if (is_mt7663(dev) || is_mt7921(dev) || is_mt7925(dev))
 		last_mask = MT_TXD_LEN_LAST;
 	else
 		last_mask = MT_TXD_LEN_AMSDU_LAST |
@@ -231,7 +231,7 @@ mt76_connac_txp_skb_unmap_hw(struct mt76_dev *dev,
 	u32 last_mask;
 	int i;
 
-	if (is_mt7663(dev) || is_mt7921(dev))
+	if (is_mt7663(dev) || is_mt7921(dev) || is_mt7925(dev))
 		last_mask = MT_TXD_LEN_LAST;
 	else
 		last_mask = MT_TXD_LEN_MSDU_LAST;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 0f0a519f956f..21456692e790 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -66,6 +66,7 @@ int mt76_connac_mcu_init_download(struct mt76_dev *dev, u32 addr, u32 len,
 
 	if ((!is_connac_v1(dev) && addr == MCU_PATCH_ADDRESS) ||
 	    (is_mt7921(dev) && addr == 0x900000) ||
+	    (is_mt7925(dev) && addr == 0x900000) ||
 	    (is_mt7996(dev) && addr == 0x900000))
 		cmd = MCU_CMD(PATCH_START_REQ);
 	else
@@ -3064,7 +3065,7 @@ static u32 mt76_connac2_get_data_mode(struct mt76_dev *dev, u32 info)
 {
 	u32 mode = DL_MODE_NEED_RSP;
 
-	if (!is_mt7921(dev) || info == PATCH_SEC_NOT_SUPPORT)
+	if ((!is_mt7921(dev) && !is_mt7925(dev)) || info == PATCH_SEC_NOT_SUPPORT)
 		return mode;
 
 	switch (FIELD_GET(PATCH_SEC_ENC_TYPE_MASK, info)) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 4543e5bf0482..19be8556cd3c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1739,7 +1739,7 @@ mt76_connac_mcu_gen_dl_mode(struct mt76_dev *dev, u8 feature_set, bool is_wa)
 
 	ret |= feature_set & FW_FEATURE_SET_ENCRYPT ?
 	       DL_MODE_ENCRYPT | DL_MODE_RESET_SEC_IV : 0;
-	if (is_mt7921(dev))
+	if (is_mt7921(dev) || is_mt7925(dev))
 		ret |= feature_set & FW_FEATURE_ENCRY_MODE ?
 		       DL_CONFIG_ENCRY_MODE_SEL : 0;
 	ret |= FIELD_PREP(DL_MODE_KEY_IDX,
-- 
2.18.0



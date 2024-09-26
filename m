Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47443CCFA10
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 03:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f5Ww+D3KjJJW2p5PdPMma5bfl6+8GsD3wuro3SWJOSU=; b=PbdjFUGlevx8TxZToOdeTgjTjh
	Q3fBPk+f5VOQFaDOBHlhaWMZ1/jHnogcdseHIPuhqAA8YjPd/WXbdMAo/Y0lgJlLagvlkqba5ZR+Y
	uLFElLZqy1RG2SzW2h67E3KRjZVz5iWzNJeY7nHnqUk5P2EqPC4KjbgNo3cpYAUGboIDekipRDJZh
	3LO5lczyOnIGvk8AQSKe8xcHCzJQAWx1OdIfZNHupFMl3DY8+SYOqMQSLoaVXFrf42waivfhBu2LE
	uUjSjRUGSB5J8t6R+q3yaxQIQE0oBr84TM1sS/Ko/aHjk8bHWML9XhEU0jTC1W9XEjbTjjeaXzG9S
	fwacnFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stfBD-0000000753C-3y02;
	Thu, 26 Sep 2024 03:28:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stf8u-000000074mL-442f
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Sep 2024 03:26:14 +0000
X-UUID: 11a903967bb711efba0aef63c0775dbf-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=f5Ww+D3KjJJW2p5PdPMma5bfl6+8GsD3wuro3SWJOSU=;
	b=fou+s5NxvZTuGSv5PzP0cVSKfHZYoQeLqs5iPpPcE9LcepG+iwF8qOA6sJLx2CNOI+GvQCrEcuO9LTmJmVMpY8ff2ID5ndF0Oqzd2zx40iyqImsHjapks54p+lzKPW7CcyD+1dCfjdrsArr+rg1W9XoMg8I35Tv/G35llaC5n4A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:40b28b67-93c2-44d3-b99a-3ab7e37040a4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:3c42949e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 11a903967bb711efba0aef63c0775dbf-20240925
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1695333175; Wed, 25 Sep 2024 20:26:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Sep 2024 11:26:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Sep 2024 11:26:05 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Daniel Golle <daniel@makrotopia.org>,
	Shayne Chen <shayne.chen@mediatek.com>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>
Subject: [PATCH 1/3] wifi: mt76: mt7996: extend flexibility of mt7996_mcu_get_eeprom()
Date: Thu, 26 Sep 2024 11:24:38 +0800
Message-ID: <20240926032440.15978-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_202613_069568_93FA83F3 
X-CRM114-Status: GOOD (  15.09  )
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

Support passing customized buffer pointer and length to
mt7996_mcu_get_eeprom().

This is the preparation for adding more variants support which needs to
prefetch FEM module from efuse, and also fixes potential OOB issue when
reading the last efuse block.

Co-developed-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c |  9 +++++++--
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 14 ++++++++++----
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  2 +-
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index 4a8237118287..861aba68a725 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -86,8 +86,13 @@ static int mt7996_eeprom_load(struct mt7996_dev *dev)
 		/* read eeprom data from efuse */
 		block_num = DIV_ROUND_UP(MT7996_EEPROM_SIZE, eeprom_blk_size);
 		for (i = 0; i < block_num; i++) {
-			ret = mt7996_mcu_get_eeprom(dev, i * eeprom_blk_size);
-			if (ret < 0)
+			u32 len = eeprom_blk_size;
+
+			if (i == block_num - 1)
+				len = MT7996_EEPROM_SIZE % eeprom_blk_size;
+			ret = mt7996_mcu_get_eeprom(dev, i * eeprom_blk_size,
+						    NULL, len);
+			if (ret && ret != -EINVAL)
 				return ret;
 		}
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 327337b31279..fa7832f625d7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3548,7 +3548,7 @@ int mt7996_mcu_set_eeprom(struct mt7996_dev *dev)
 				 &req, sizeof(req), true);
 }
 
-int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset)
+int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset, u8 *buf, u32 buf_len)
 {
 	struct {
 		u8 _rsv[4];
@@ -3577,15 +3577,21 @@ int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset)
 	valid = le32_to_cpu(*(__le32 *)(skb->data + 16));
 	if (valid) {
 		u32 addr = le32_to_cpu(*(__le32 *)(skb->data + 12));
-		u8 *buf = (u8 *)dev->mt76.eeprom.data + addr;
+
+		if (!buf)
+			buf = (u8 *)dev->mt76.eeprom.data + addr;
+		if (!buf_len || buf_len > MT7996_EEPROM_BLOCK_SIZE)
+			buf_len = MT7996_EEPROM_BLOCK_SIZE;
 
 		skb_pull(skb, 48);
-		memcpy(buf, skb->data, MT7996_EEPROM_BLOCK_SIZE);
+		memcpy(buf, skb->data, buf_len);
+	} else {
+		ret = -EINVAL;
 	}
 
 	dev_kfree_skb(skb);
 
-	return 0;
+	return ret;
 }
 
 int mt7996_mcu_get_eeprom_free_block(struct mt7996_dev *dev, u8 *block_num)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index ab8c9070630b..55aa5f6ab77d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -476,7 +476,7 @@ int mt7996_mcu_set_fixed_rate_ctrl(struct mt7996_dev *dev,
 int mt7996_mcu_set_fixed_field(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 			       struct ieee80211_sta *sta, void *data, u32 field);
 int mt7996_mcu_set_eeprom(struct mt7996_dev *dev);
-int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset);
+int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset, u8 *buf, u32 buf_len);
 int mt7996_mcu_get_eeprom_free_block(struct mt7996_dev *dev, u8 *block_num);
 int mt7996_mcu_get_chip_config(struct mt7996_dev *dev, u32 *cap);
 int mt7996_mcu_set_ser(struct mt7996_dev *dev, u8 action, u8 set, u8 band);
-- 
2.39.2



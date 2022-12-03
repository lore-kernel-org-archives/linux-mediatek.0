Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A38C47088
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 21:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUsLt8JG8kdXNrYQeg2np4Pi1+grwPio4guJ7dit6UU=; b=rtZXRhynLvLEsbjDCnhDPeGoRZ
	Qwhmp2qTZaflp45vZox2nyl/aUKskKM714KGkV1VeRJBZLmY1v1MtxGT/7DEtDb0rQV2yiqJTVy6g
	gMw53HM17aP3PMkSDteGxH41A+btf+xUdJpauyGrXf/ZhOVbI4mjiK8MFADBVuKyB1S0tq2EPRYpD
	lLoXFmRhjdyKxyNuNJDPW2PksBT2DOsGd6bphQCEiQniEN4aV40+9DCUzOCrqjjKF9UPkOqZVe6Ui
	sId9drZTM3D3gP/LhUUdDiyi1j//95kC216nxSnRupWtmZHYcEO0cZGEUWxEzHvUr7io1A/MACS45
	h7X798uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1a9B-005Mk6-5S; Sat, 03 Dec 2022 21:34:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1a96-005MdX-J5
	for linux-mediatek@lists.infradead.org; Sat, 03 Dec 2022 21:34:07 +0000
X-UUID: 827dbc745e404c49ae0a672747b5edea-20221203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pUsLt8JG8kdXNrYQeg2np4Pi1+grwPio4guJ7dit6UU=;
	b=PBe7Vjf1p/XVArlv3B52Kgmo+w01yvAe6q12s09KNuHUpljlPNmE52rTvANtMy/l2IvQWOx0dE1tuXensbPgjjTwugLPFxVbLY3LdSfcS/jQchu4zN5RrqmKHKoa1y5b4x/dJqCwuUojf0HFrLK/ycpkG31nBTC/NVOJAlQNJkQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:604125c8-e925-4dd1-85e7-f52be8bdea82,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:89f69330-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 827dbc745e404c49ae0a672747b5edea-20221203
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 959479030; Sat, 03 Dec 2022 14:33:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sun, 4 Dec 2022 05:33:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 4 Dec 2022 05:33:21 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/3] wifi: mt76: mt7996: check return value before accessing free_block_num
Date: Sun, 4 Dec 2022 05:33:18 +0800
Message-ID: <9ccf148192bb47462468ec286c8b3657051ddb02.1670102099.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <3fec8b8c618a78d1197f4060f89fa8bdd836b425.1670102099.git.ryder.lee@mediatek.com>
References: <3fec8b8c618a78d1197f4060f89fa8bdd836b425.1670102099.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_133404_678011_5C331671 
X-CRM114-Status: GOOD (  13.09  )
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

Check return value of mt7996_mcu_get_eeprom_free_block() first before
accessing free_block_num.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2 - check return value of mt7996_mcu_get_eeprom as well.
---
 .../net/wireless/mediatek/mt76/mt7996/eeprom.c | 18 ++++++++++++------
 .../net/wireless/mediatek/mt76/mt7996/mcu.c    |  5 +++--
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index b9f62bedbc48..5d8e0353627e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -65,17 +65,23 @@ static int mt7996_eeprom_load(struct mt7996_dev *dev)
 	} else {
 		u8 free_block_num;
 		u32 block_num, i;
+		u32 eeprom_blk_size = MT7996_EEPROM_BLOCK_SIZE;
 
-		/* TODO: check free block event */
-		mt7996_mcu_get_eeprom_free_block(dev, &free_block_num);
-		/* efuse info not enough */
+		ret = mt7996_mcu_get_eeprom_free_block(dev, &free_block_num);
+		if (ret < 0)
+			return ret;
+
+		/* efuse info isn't enough */
 		if (free_block_num >= 59)
 			return -EINVAL;
 
 		/* read eeprom data from efuse */
-		block_num = DIV_ROUND_UP(MT7996_EEPROM_SIZE, MT7996_EEPROM_BLOCK_SIZE);
-		for (i = 0; i < block_num; i++)
-			mt7996_mcu_get_eeprom(dev, i * MT7996_EEPROM_BLOCK_SIZE);
+		block_num = DIV_ROUND_UP(MT7996_EEPROM_SIZE, eeprom_blk_size);
+		for (i = 0; i < block_num; i++) {
+			ret = mt7996_mcu_get_eeprom(dev, i * eeprom_blk_size);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	return mt7996_check_eeprom(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index efb245c8ac84..da72684e4308 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2927,8 +2927,9 @@ int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset)
 	bool valid;
 	int ret;
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_WM_UNI_CMD_QUERY(EFUSE_CTRL), &req,
-					sizeof(req), true, &skb);
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
+					MCU_WM_UNI_CMD_QUERY(EFUSE_CTRL),
+					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
 
-- 
2.18.0



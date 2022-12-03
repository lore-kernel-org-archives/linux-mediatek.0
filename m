Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF85C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 22:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CWwG02TSaInKtmUV+WNqTAMV/tocxbg7bIfdefA8Tso=; b=kXuGriVBkxd2VFiu68vMhLf1N+
	W//3bJBnbAARe4kmeqJxVGijtHGH7I2LApG6wMmaXb1PtZSlEOg/B9MxgeIohSDij9IOw++bpjsMI
	iFAFifjPYUQx/Vcm79j9myyOVTBMdluny06HvIN1JjOoU3WLytgGZEpcPh6IK9OR1DEeQLO2whLsG
	LiMq7Zjp5en4VVwBXPV9+wDogk5MvdGG3xzNHn7OJNYO9p/WoSw5EePflSzGXboe9uigGGNSrZR8J
	l85Kxz5wdNJBCbdtx+E3eTjhVHYLXIqRdkiG/ZGTbKf7ZhF3YVa7p1otS/R/BBPjTudUzTuViIGry
	jW9IYnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1abd-005Vzh-St; Sat, 03 Dec 2022 22:03:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1abb-005Vz1-4W
	for linux-mediatek@lists.infradead.org; Sat, 03 Dec 2022 22:03:32 +0000
X-UUID: 8700db704ba74199aca6df658de6b172-20221203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CWwG02TSaInKtmUV+WNqTAMV/tocxbg7bIfdefA8Tso=;
	b=Gs0+MCCH1uX7Gb6HzSSg12LsyxSNpmKfM6TPYhv06b63E8UUkqjIa1beYkengrJwPv8nwONbujGwsgIzN6ekI2H891hhMkkPzo5WtAl10mCN6M7n3q2jsXjfHmovYyjmq4lImw9sg9tKs3gwuas6g4BETZbaQfVYfDGUQh+Llmw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:dc61b639-45ff-4469-90fa-8835aa816968,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:c206776c-41fe-47b6-8eb4-ec192dedaf7d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8700db704ba74199aca6df658de6b172-20221203
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 48592399; Sat, 03 Dec 2022 15:03:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sun, 4 Dec 2022 05:33:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 4 Dec 2022 05:33:20 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 1/3] wifi: mt76: mt7915: check return value before accessing free_block_num
Date: Sun, 4 Dec 2022 05:33:17 +0800
Message-ID: <3fec8b8c618a78d1197f4060f89fa8bdd836b425.1670102099.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_140331_209015_1225E5B4 
X-CRM114-Status: GOOD (  12.04  )
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

Check return value of mt7915_mcu_get_eeprom_free_block() first before
accessing free_block_num.

Fixes: bbc1d4154ec1 ("mt76: mt7915: add default calibrated data support")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2 - check return value of mt7915_mcu_get_eeprom() as well.
---
 .../wireless/mediatek/mt76/mt7915/eeprom.c    | 19 ++++++++++++-------
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 10 ++++++----
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 59069fb86414..24efa280dd86 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -110,18 +110,23 @@ static int mt7915_eeprom_load(struct mt7915_dev *dev)
 	} else {
 		u8 free_block_num;
 		u32 block_num, i;
+		u32 eeprom_blk_size = MT7915_EEPROM_BLOCK_SIZE;
 
-		mt7915_mcu_get_eeprom_free_block(dev, &free_block_num);
-		/* efuse info not enough */
+		ret = mt7915_mcu_get_eeprom_free_block(dev, &free_block_num);
+		if (ret < 0)
+			return ret;
+
+		/* efuse info isn't enough */
 		if (free_block_num >= 29)
 			return -EINVAL;
 
 		/* read eeprom data from efuse */
-		block_num = DIV_ROUND_UP(eeprom_size,
-					 MT7915_EEPROM_BLOCK_SIZE);
-		for (i = 0; i < block_num; i++)
-			mt7915_mcu_get_eeprom(dev,
-					      i * MT7915_EEPROM_BLOCK_SIZE);
+		block_num = DIV_ROUND_UP(eeprom_size, eeprom_blk_size);
+		for (i = 0; i < block_num; i++) {
+			ret = mt7915_mcu_get_eeprom(dev, i * eeprom_blk_size);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	return mt7915_check_eeprom(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index ca315af3905b..86ec767266cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2792,8 +2792,9 @@ int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset)
 	int ret;
 	u8 *buf;
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_QUERY(EFUSE_ACCESS), &req,
-				sizeof(req), true, &skb);
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
+					MCU_EXT_QUERY(EFUSE_ACCESS),
+					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
 
@@ -2818,8 +2819,9 @@ int mt7915_mcu_get_eeprom_free_block(struct mt7915_dev *dev, u8 *block_num)
 	struct sk_buff *skb;
 	int ret;
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_QUERY(EFUSE_FREE_BLOCK), &req,
-					sizeof(req), true, &skb);
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
+					MCU_EXT_QUERY(EFUSE_FREE_BLOCK),
+					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
 
-- 
2.18.0



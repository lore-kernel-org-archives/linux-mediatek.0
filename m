Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842EBC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o+e5JgFVSzaFAhjErXARpJtvL274Xm1EIt7wWw/9bjQ=; b=GrHvNErqhYcKlFtWUZytNl2sPT
	CS+edX8dGi6rdiboaMo7eys/dQRBke75DxknHVLLWFts2TuLNpS41TFcMbORbPP+PP96F36ZXqsCg
	kv+66gqDu3NkR75PAG7Jajaajh4Auo5n7UVU7sVvCVEymFnPcrLXQS5+2mGBxCZOnN9rWqOEzZCpC
	ETZyCd0hJwwrys1lEzCUUJPbUZRGdlTMiauux6kCRWPSJ8H+aUTvlEZWjPk6Vpw9/zYnPxJxdRlH2
	XNKGMBzV3g4pNPjtnuWErPIeHnhfyFLQXAsgUCX6Jb2p6JENeMxW86Tv2u2CbL31Qgl9ADudxI/rc
	uDjleV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1YfZ-0052ln-Aw; Sat, 03 Dec 2022 19:59:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1YfX-0052k6-6e
	for linux-mediatek@lists.infradead.org; Sat, 03 Dec 2022 19:59:28 +0000
X-UUID: e3afa9326ef345eab35aa3c3d885dd98-20221203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=o+e5JgFVSzaFAhjErXARpJtvL274Xm1EIt7wWw/9bjQ=;
	b=iB0OjpiRrEzt+9Hq6FFRoNZlzhF1FgvsyTQwQjgM3WkXEOGBVpNv6zws+6RX5SDA1ZWQD5ccDu3jdVxOr9+kz7gouxPJ8rh5AQUsiIYjvi0pyu7tZHHXmOZ/c7rEaiFGVBTRjJd4njnzWDvPN8h3MdY8gzIlD14X4H+fXbi/0Vc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:780306aa-33e0-402d-aef3-834457a33758,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:e3d90e1f-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e3afa9326ef345eab35aa3c3d885dd98-20221203
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 748407568; Sat, 03 Dec 2022 12:59:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sun, 4 Dec 2022 03:29:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 4 Dec 2022 03:29:20 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/3] wifi: mt76: mt7996: check return value before accessing free_block_num
Date: Sun, 4 Dec 2022 03:29:17 +0800
Message-ID: <ba197e342d4d99d2e1be2e731ae989f57f5cf8a9.1670095617.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_115927_278136_4D8F8CDA 
X-CRM114-Status: GOOD (  10.75  )
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
 drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c | 8 +++++---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
index b9f62bedbc48..b61d12dafc9f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
@@ -66,9 +66,11 @@ static int mt7996_eeprom_load(struct mt7996_dev *dev)
 		u8 free_block_num;
 		u32 block_num, i;
 
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
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index efb245c8ac84..e4ec395426a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2927,8 +2927,8 @@ int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset)
 	bool valid;
 	int ret;
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_WM_UNI_CMD_QUERY(EFUSE_CTRL), &req,
-					sizeof(req), true, &skb);
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_WM_UNI_CMD_QUERY(EFUSE_CTRL),
+					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
 
-- 
2.18.0



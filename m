Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD325C04FE0
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqQuTZnPRepKySlsm/5AT+DtqpKpFiTkpfZPeUVqMs4=; b=XztNqA1ZzcQjzTNNNkzlR1cK3Q
	2bfIlyhjSEmPjX8X1e2YUzAI3+dzK8Q1wW77+gOab020PdGwTLlMrZKNEFrXOEVD2LrFgadNQ6Xnu
	BJ4DMPR0udRKsg4mEOos1N10MOIetktBTbE4IoM/Z6VD6VJr4OIs0QoS/4CMcOuPLZhK3qBmx0Wg9
	sza/IhUmQjYlHL/w/8bANdJOvS2tE/xeMU3m+xcrXs973eFyLBPrZvY+HrSaYA41/SAXiS3vzln3j
	WIQFLWekayHNGtAtVUYJRX5olMvHv7WIgWRTF2Vu61TTNuP5r7fgocLPOP9251pPhyvNwfjvG+Ayp
	0b+q43bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRs-002bfD-2Y;
	Tue, 01 Aug 2023 14:34:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRl-002bYi-2Z
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 14:34:06 +0000
X-UUID: 708d3642307811ee83ed1395ce914268-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JqQuTZnPRepKySlsm/5AT+DtqpKpFiTkpfZPeUVqMs4=;
	b=M7CbqelMEvzrQg0nN6xQKXFwHwvY2oFy9lF90E78Zf1I+3Gn5QFKvpLjfFydwbJ+XJSjVtvDmsT9Ot/KfsMYIplD64FzA9qx+xF5AR9qfg3XU2QDkJCWo/DchXy5E1DC0NBS8Ev7ZIxGzNZw0gDrdL4tzaQWsQZ+Zokupn80Uw8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:aa0038a0-dbae-4ebd-9028-a2b2a9577b54,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:1fcc6f8,CLOUDID:31fbc5a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 708d3642307811ee83ed1395ce914268-20230801
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1744745568; Tue, 01 Aug 2023 07:33:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
Subject: [PATCH 2/8] wifi: mt76: mt792x: support mt7925 chip init
Date: Tue, 1 Aug 2023 22:30:26 +0800
Message-ID: <e9c79ed21d0893964a8a7ec2fc5d2a3d416b4a86.1690863143.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1690863143.git.deren.wu@mediatek.com>
References: <cover.1690863143.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_073401_906092_A02EDF6D 
X-CRM114-Status: GOOD (  12.78  )
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

add firmware download and dma init support for mt7925.

This is a preliminary patch to support mt7925 driver.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  6 +++
 .../net/wireless/mediatek/mt76/mt792x_dma.c   | 49 +++++++++++++------
 2 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 5d5ab8630041..39cbd1397457 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -36,9 +36,11 @@
 
 #define MT7921_FIRMWARE_WM	"mediatek/WIFI_RAM_CODE_MT7961_1.bin"
 #define MT7922_FIRMWARE_WM	"mediatek/WIFI_RAM_CODE_MT7922_1.bin"
+#define MT7925_FIRMWARE_WM	"mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin"
 
 #define MT7921_ROM_PATCH	"mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin"
 #define MT7922_ROM_PATCH	"mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin"
+#define MT7925_ROM_PATCH	"mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin"
 
 struct mt792x_vif;
 struct mt792x_sta;
@@ -308,6 +310,8 @@ static inline char *mt792x_ram_name(struct mt792x_dev *dev)
 	switch (mt76_chip(&dev->mt76)) {
 	case 0x7922:
 		return MT7922_FIRMWARE_WM;
+	case 0x7925:
+		return MT7925_FIRMWARE_WM;
 	default:
 		return MT7921_FIRMWARE_WM;
 	}
@@ -318,6 +322,8 @@ static inline char *mt792x_patch_name(struct mt792x_dev *dev)
 	switch (mt76_chip(&dev->mt76)) {
 	case 0x7922:
 		return MT7922_ROM_PATCH;
+	case 0x7925:
+		return MT7925_ROM_PATCH;
 	default:
 		return MT7921_ROM_PATCH;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index a3dbd3865b2f..488326ce5ed4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -88,25 +88,44 @@ EXPORT_SYMBOL_GPL(mt792x_rx_poll_complete);
 #define PREFETCH(base, depth)	((base) << 16 | (depth))
 static void mt792x_dma_prefetch(struct mt792x_dev *dev)
 {
-	mt76_wr(dev, MT_WFDMA0_RX_RING0_EXT_CTRL, PREFETCH(0x0, 0x4));
-	mt76_wr(dev, MT_WFDMA0_RX_RING2_EXT_CTRL, PREFETCH(0x40, 0x4));
-	mt76_wr(dev, MT_WFDMA0_RX_RING3_EXT_CTRL, PREFETCH(0x80, 0x4));
-	mt76_wr(dev, MT_WFDMA0_RX_RING4_EXT_CTRL, PREFETCH(0xc0, 0x4));
-	mt76_wr(dev, MT_WFDMA0_RX_RING5_EXT_CTRL, PREFETCH(0x100, 0x4));
-
-	mt76_wr(dev, MT_WFDMA0_TX_RING0_EXT_CTRL, PREFETCH(0x140, 0x4));
-	mt76_wr(dev, MT_WFDMA0_TX_RING1_EXT_CTRL, PREFETCH(0x180, 0x4));
-	mt76_wr(dev, MT_WFDMA0_TX_RING2_EXT_CTRL, PREFETCH(0x1c0, 0x4));
-	mt76_wr(dev, MT_WFDMA0_TX_RING3_EXT_CTRL, PREFETCH(0x200, 0x4));
-	mt76_wr(dev, MT_WFDMA0_TX_RING4_EXT_CTRL, PREFETCH(0x240, 0x4));
-	mt76_wr(dev, MT_WFDMA0_TX_RING5_EXT_CTRL, PREFETCH(0x280, 0x4));
-	mt76_wr(dev, MT_WFDMA0_TX_RING6_EXT_CTRL, PREFETCH(0x2c0, 0x4));
-	mt76_wr(dev, MT_WFDMA0_TX_RING16_EXT_CTRL, PREFETCH(0x340, 0x4));
-	mt76_wr(dev, MT_WFDMA0_TX_RING17_EXT_CTRL, PREFETCH(0x380, 0x4));
+	if (is_mt7925(&dev->mt76)) {
+		/* rx ring */
+		mt76_wr(dev, MT_WFDMA0_RX_RING0_EXT_CTRL, PREFETCH(0x0000, 0x4));
+		mt76_wr(dev, MT_WFDMA0_RX_RING1_EXT_CTRL, PREFETCH(0x0040, 0x4));
+		mt76_wr(dev, MT_WFDMA0_RX_RING2_EXT_CTRL, PREFETCH(0x0080, 0x4));
+		mt76_wr(dev, MT_WFDMA0_RX_RING3_EXT_CTRL, PREFETCH(0x00c0, 0x4));
+		/* tx ring */
+		mt76_wr(dev, MT_WFDMA0_TX_RING0_EXT_CTRL, PREFETCH(0x0100, 0x10));
+		mt76_wr(dev, MT_WFDMA0_TX_RING1_EXT_CTRL, PREFETCH(0x0200, 0x10));
+		mt76_wr(dev, MT_WFDMA0_TX_RING2_EXT_CTRL, PREFETCH(0x0300, 0x10));
+		mt76_wr(dev, MT_WFDMA0_TX_RING3_EXT_CTRL, PREFETCH(0x0400, 0x10));
+		mt76_wr(dev, MT_WFDMA0_TX_RING15_EXT_CTRL, PREFETCH(0x0500, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING16_EXT_CTRL, PREFETCH(0x0540, 0x4));
+	} else {
+		/* rx ring */
+		mt76_wr(dev, MT_WFDMA0_RX_RING0_EXT_CTRL, PREFETCH(0x0, 0x4));
+		mt76_wr(dev, MT_WFDMA0_RX_RING2_EXT_CTRL, PREFETCH(0x40, 0x4));
+		mt76_wr(dev, MT_WFDMA0_RX_RING3_EXT_CTRL, PREFETCH(0x80, 0x4));
+		mt76_wr(dev, MT_WFDMA0_RX_RING4_EXT_CTRL, PREFETCH(0xc0, 0x4));
+		mt76_wr(dev, MT_WFDMA0_RX_RING5_EXT_CTRL, PREFETCH(0x100, 0x4));
+		/* tx ring */
+		mt76_wr(dev, MT_WFDMA0_TX_RING0_EXT_CTRL, PREFETCH(0x140, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING1_EXT_CTRL, PREFETCH(0x180, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING2_EXT_CTRL, PREFETCH(0x1c0, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING3_EXT_CTRL, PREFETCH(0x200, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING4_EXT_CTRL, PREFETCH(0x240, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING5_EXT_CTRL, PREFETCH(0x280, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING6_EXT_CTRL, PREFETCH(0x2c0, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING16_EXT_CTRL, PREFETCH(0x340, 0x4));
+		mt76_wr(dev, MT_WFDMA0_TX_RING17_EXT_CTRL, PREFETCH(0x380, 0x4));
+	}
 }
 
 int mt792x_dma_enable(struct mt792x_dev *dev)
 {
+	if (is_mt7925(&dev->mt76))
+		mt76_rmw(dev, MT_UWFDMA0_GLO_CFG_EXT1, BIT(28), BIT(28));
+
 	/* configure perfetch settings */
 	mt792x_dma_prefetch(dev);
 
-- 
2.18.0



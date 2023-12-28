Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A599FC4706F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 09:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixki3DqzAq4cmzEmI1gi4aPq+TJbnvD0XOxbDCZxy9M=; b=DBXjbkCCxPCghJuVca5zZ/fdZX
	oii8IpkIlWTuIDfHZ7P2yJ2s9eUtAKhvgBIdGDOVWv2Yl2yaGg07I8HNzlN5NVkZ75g6jVD4wDB6i
	WOJTwJ2uYxD7SP0S9BK5oa5PBpIk7EtMGvSmF28N9VVJdnDZD7yy0RT18c7YvBXDRW5Fhad+eNGyZ
	laXcS7mtDCkLQgGtV4P1HTP+KnaSN2WwgPeQK9lRrui9T7WZjSD3oCzkaebSE4n2t8DyncKKBKH6O
	2kRtQQb8jj0/G7DjM1lOCtyddDzJsURtMxLygRqJNqBUvuSqFARft2GE7UhMyEOCAcFWiSKD8MrS8
	o9K5ztIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rImMz-00GSdi-2C;
	Thu, 28 Dec 2023 09:08:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rImMw-00GSb9-32
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Dec 2023 09:08:00 +0000
X-UUID: 960d837ea56011eeafd70d0b34820190-20231228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ixki3DqzAq4cmzEmI1gi4aPq+TJbnvD0XOxbDCZxy9M=;
	b=FqhuLZ98J3P7OaLBei41NcWbOO3DPdLk+BpklEPAXlVRg5z/JTvZ819HuXlCOXKzbhQrecgBTwSfsGjIkQUUgT+XOk8McfNoXGfEKWVm0cBbknLsJOs7b8UB2ProgTF8ps/X2nfSo4nmDTVmZbUeCbecH5S9TkWEZpGwMCh3pnE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:1fb254c7-2355-4c9e-bbaa-e8ee85826e8f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:19954282-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 960d837ea56011eeafd70d0b34820190-20231228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 855314648; Thu, 28 Dec 2023 02:07:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Dec 2023 17:07:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Dec 2023 17:07:52 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 10/10] wifi: mt76: mt7925: update PCIe DMA settings
Date: Thu, 28 Dec 2023 17:07:49 +0800
Message-ID: <20231228090749.15191-11-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231228090749.15191-1-mingyen.hsieh@mediatek.com>
References: <20231228090749.15191-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_010758_990542_D04F0BE4 
X-CRM114-Status: GOOD (  10.09  )
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

From: Deren Wu <deren.wu@mediatek.com>

Fix the wrong WFDMA settings to improve TX performance.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c  | 13 ++++++++++---
 drivers/net/wireless/mediatek/mt76/mt792x_regs.h |  5 +++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 488326ce5ed4..8fa36b59e738 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -123,14 +123,13 @@ static void mt792x_dma_prefetch(struct mt792x_dev *dev)
 
 int mt792x_dma_enable(struct mt792x_dev *dev)
 {
-	if (is_mt7925(&dev->mt76))
-		mt76_rmw(dev, MT_UWFDMA0_GLO_CFG_EXT1, BIT(28), BIT(28));
-
 	/* configure perfetch settings */
 	mt792x_dma_prefetch(dev);
 
 	/* reset dma idx */
 	mt76_wr(dev, MT_WFDMA0_RST_DTX_PTR, ~0);
+	if (is_mt7925(&dev->mt76))
+		mt76_wr(dev, MT_WFDMA0_RST_DRX_PTR, ~0);
 
 	/* configure delay interrupt */
 	mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG0, 0);
@@ -140,12 +139,20 @@ int mt792x_dma_enable(struct mt792x_dev *dev)
 		 MT_WFDMA0_GLO_CFG_FIFO_LITTLE_ENDIAN |
 		 MT_WFDMA0_GLO_CFG_CLK_GAT_DIS |
 		 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+		 FIELD_PREP(MT_WFDMA0_GLO_CFG_DMA_SIZE, 3) |
+		 MT_WFDMA0_GLO_CFG_FIFO_DIS_CHECK |
+		 MT_WFDMA0_GLO_CFG_RX_WB_DDONE |
 		 MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN |
 		 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
 
 	mt76_set(dev, MT_WFDMA0_GLO_CFG,
 		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
 
+	if (is_mt7925(&dev->mt76)) {
+		mt76_rmw(dev, MT_UWFDMA0_GLO_CFG_EXT1, BIT(28), BIT(28));
+		mt76_set(dev, MT_WFDMA0_INT_RX_PRI, 0x0F00);
+		mt76_set(dev, MT_WFDMA0_INT_TX_PRI, 0x7F00);
+	}
 	mt76_set(dev, MT_WFDMA_DUMMY_CR, MT_WFDMA_NEED_REINIT);
 
 	/* enable interrupts for TX/RX rings */
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
index d7f9b24cd665..458cfd0260b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
@@ -292,9 +292,12 @@
 #define MT_WFDMA0_GLO_CFG_TX_DMA_BUSY	BIT(1)
 #define MT_WFDMA0_GLO_CFG_RX_DMA_EN	BIT(2)
 #define MT_WFDMA0_GLO_CFG_RX_DMA_BUSY	BIT(3)
+#define MT_WFDMA0_GLO_CFG_DMA_SIZE	GENMASK(5, 4)
 #define MT_WFDMA0_GLO_CFG_TX_WB_DDONE	BIT(6)
 #define MT_WFDMA0_GLO_CFG_FW_DWLD_BYPASS_DMASHDL BIT(9)
+#define MT_WFDMA0_GLO_CFG_FIFO_DIS_CHECK	BIT(11)
 #define MT_WFDMA0_GLO_CFG_FIFO_LITTLE_ENDIAN	BIT(12)
+#define MT_WFDMA0_GLO_CFG_RX_WB_DDONE	BIT(13)
 #define MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN BIT(15)
 #define MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2	BIT(21)
 #define MT_WFDMA0_GLO_CFG_OMIT_RX_INFO	BIT(27)
@@ -322,6 +325,8 @@
 
 #define MT_WFDMA0_RST_DTX_PTR		MT_WFDMA0(0x20c)
 #define MT_WFDMA0_RST_DRX_PTR		MT_WFDMA0(0x280)
+#define MT_WFDMA0_INT_RX_PRI		MT_WFDMA0(0x298)
+#define MT_WFDMA0_INT_TX_PRI		MT_WFDMA0(0x29c)
 #define MT_WFDMA0_GLO_CFG_EXT0		MT_WFDMA0(0x2b0)
 #define MT_WFDMA0_CSR_TX_DMASHDL_ENABLE	BIT(6)
 #define MT_WFDMA0_PRI_DLY_INT_CFG0	MT_WFDMA0(0x2f0)
-- 
2.18.0



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB596C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 20:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uZhvCrRiMi2aBYLOV+LTIHtca+9+6S37UZOnpSic+js=; b=cCMBO36eRvl55OHvELNH0vloQu
	gDGUvVRzNurGU8VdaPI5kF5YoUEM6LMd8C53IKNgVspq26r4KfIXsxe4A2DAquDXl/laIvlXwBp8e
	nfOPk66JZhXN5yQ5lTITlWp6goG2FyM1LHWPx7CuM6K8v8UtcKaqkgZHLosKsHYsbXb7rBNHwgPNg
	TCZRxn9Hv5eLalVlSmvfLpjsi9lJxFgkhEgT7jizn2UuJJ8xuevvd9xLWrdQQU8zrWDgcY8gyOkew
	H7VkraogvhD6HnlZuNV1GOjh8o6uKpXWcCTUXwam6Xjp1KrgzhNiTZVxLkjeCufDnh/1mk734pcmE
	2qkUiikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osroV-00H2mG-8A; Wed, 09 Nov 2022 20:36:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osroR-00H2jl-Ay
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 20:36:46 +0000
X-UUID: 19c085241381439086325b24607bf92c-20221109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uZhvCrRiMi2aBYLOV+LTIHtca+9+6S37UZOnpSic+js=;
	b=IoYmy7NGsiZIP4H0lFa6cSrfrmWRBmhxnSkF3/ahXJzP9AFewusFyD1LGxXTObcm7mLCdTtFaK3yc3OcLFcvXa4dI0dMx7qxzdCvVsLPIEnwuRgysOOyb6ndMdsLjwR2nNiV+wl6tyG67mTBG/1IpyTA0ABRDJiZMJnk9+9GkqI=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:f978fdc4-f5d5-4aa2-ba06-e51e3cfd01b6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.12,REQID:f978fdc4-f5d5-4aa2-ba06-e51e3cfd01b6,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:62cd327,CLOUDID:1c1a185d-100c-4555-952b-a62c895efded,B
	ulkID:221110043638Q50SBOVF,BulkQuantity:0,Recheck:0,SF:38|28|16|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 19c085241381439086325b24607bf92c-20221109
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1278067681; Wed, 09 Nov 2022 13:36:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 10 Nov 2022 04:36:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 10 Nov 2022 04:36:35 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Bo Jiao <bo.jiao@mediatek.com>, Ryder
 Lee <ryder.lee@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v3 1/4] wifi: mt76: mt7915: rework mt7915_dma_reset()
Date: Thu, 10 Nov 2022 04:36:31 +0800
Message-ID: <3e6ef9fb1d2e09d415b4c489cc9c62134a05b3c1.1668024217.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_123643_429744_066913DE 
X-CRM114-Status: GOOD (  14.39  )
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

From: Bo Jiao <bo.jiao@mediatek.com>

Reuse mt7915_dma_disable() to reduce duplicated code.
This is a preliminary patch to enable full system reset.

Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
change since v3 - fix indentation
---
 .../net/wireless/mediatek/mt76/mt7915/dma.c   | 110 ++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  69 +----------
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   1 +
 3 files changed, 91 insertions(+), 89 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index e4fa240834d8..38360f940747 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -50,23 +50,37 @@ static void mt7915_dma_config(struct mt7915_dev *dev)
 #define TXQ_CONFIG(q, wfdma, int, id)	Q_CONFIG(__TXQ(q), (wfdma), (int), (id))
 
 	if (is_mt7915(&dev->mt76)) {
-		RXQ_CONFIG(MT_RXQ_MAIN, WFDMA0, MT_INT_RX_DONE_BAND0, MT7915_RXQ_BAND0);
-		RXQ_CONFIG(MT_RXQ_MCU, WFDMA1, MT_INT_RX_DONE_WM, MT7915_RXQ_MCU_WM);
-		RXQ_CONFIG(MT_RXQ_MCU_WA, WFDMA1, MT_INT_RX_DONE_WA, MT7915_RXQ_MCU_WA);
-		RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0, MT_INT_RX_DONE_BAND1, MT7915_RXQ_BAND1);
-		RXQ_CONFIG(MT_RXQ_BAND1_WA, WFDMA1, MT_INT_RX_DONE_WA_EXT, MT7915_RXQ_MCU_WA_EXT);
-		RXQ_CONFIG(MT_RXQ_MAIN_WA, WFDMA1, MT_INT_RX_DONE_WA_MAIN, MT7915_RXQ_MCU_WA);
+		RXQ_CONFIG(MT_RXQ_MAIN, WFDMA0, MT_INT_RX_DONE_BAND0,
+			   MT7915_RXQ_BAND0);
+		RXQ_CONFIG(MT_RXQ_MCU, WFDMA1, MT_INT_RX_DONE_WM,
+			   MT7915_RXQ_MCU_WM);
+		RXQ_CONFIG(MT_RXQ_MCU_WA, WFDMA1, MT_INT_RX_DONE_WA,
+			   MT7915_RXQ_MCU_WA);
+		RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0, MT_INT_RX_DONE_BAND1,
+			   MT7915_RXQ_BAND1);
+		RXQ_CONFIG(MT_RXQ_BAND1_WA, WFDMA1, MT_INT_RX_DONE_WA_EXT,
+			   MT7915_RXQ_MCU_WA_EXT);
+		RXQ_CONFIG(MT_RXQ_MAIN_WA, WFDMA1, MT_INT_RX_DONE_WA_MAIN,
+			   MT7915_RXQ_MCU_WA);
 		TXQ_CONFIG(0, WFDMA1, MT_INT_TX_DONE_BAND0, MT7915_TXQ_BAND0);
 		TXQ_CONFIG(1, WFDMA1, MT_INT_TX_DONE_BAND1, MT7915_TXQ_BAND1);
-		MCUQ_CONFIG(MT_MCUQ_WM, WFDMA1, MT_INT_TX_DONE_MCU_WM, MT7915_TXQ_MCU_WM);
-		MCUQ_CONFIG(MT_MCUQ_WA, WFDMA1, MT_INT_TX_DONE_MCU_WA, MT7915_TXQ_MCU_WA);
-		MCUQ_CONFIG(MT_MCUQ_FWDL, WFDMA1, MT_INT_TX_DONE_FWDL, MT7915_TXQ_FWDL);
+		MCUQ_CONFIG(MT_MCUQ_WM, WFDMA1, MT_INT_TX_DONE_MCU_WM,
+			    MT7915_TXQ_MCU_WM);
+		MCUQ_CONFIG(MT_MCUQ_WA, WFDMA1, MT_INT_TX_DONE_MCU_WA,
+			    MT7915_TXQ_MCU_WA);
+		MCUQ_CONFIG(MT_MCUQ_FWDL, WFDMA1, MT_INT_TX_DONE_FWDL,
+			    MT7915_TXQ_FWDL);
 	} else {
-		RXQ_CONFIG(MT_RXQ_MCU, WFDMA0, MT_INT_RX_DONE_WM, MT7916_RXQ_MCU_WM);
-		RXQ_CONFIG(MT_RXQ_BAND1_WA, WFDMA0, MT_INT_RX_DONE_WA_EXT_MT7916, MT7916_RXQ_MCU_WA_EXT);
-		MCUQ_CONFIG(MT_MCUQ_WM, WFDMA0, MT_INT_TX_DONE_MCU_WM, MT7915_TXQ_MCU_WM);
-		MCUQ_CONFIG(MT_MCUQ_WA, WFDMA0, MT_INT_TX_DONE_MCU_WA_MT7916, MT7915_TXQ_MCU_WA);
-		MCUQ_CONFIG(MT_MCUQ_FWDL, WFDMA0, MT_INT_TX_DONE_FWDL, MT7915_TXQ_FWDL);
+		RXQ_CONFIG(MT_RXQ_MCU, WFDMA0, MT_INT_RX_DONE_WM,
+			   MT7916_RXQ_MCU_WM);
+		RXQ_CONFIG(MT_RXQ_BAND1_WA, WFDMA0, MT_INT_RX_DONE_WA_EXT_MT7916,
+			   MT7916_RXQ_MCU_WA_EXT);
+		MCUQ_CONFIG(MT_MCUQ_WM, WFDMA0, MT_INT_TX_DONE_MCU_WM,
+			    MT7915_TXQ_MCU_WM);
+		MCUQ_CONFIG(MT_MCUQ_WA, WFDMA0, MT_INT_TX_DONE_MCU_WA_MT7916,
+			    MT7915_TXQ_MCU_WA);
+		MCUQ_CONFIG(MT_MCUQ_FWDL, WFDMA0, MT_INT_TX_DONE_FWDL,
+			    MT7915_TXQ_FWDL);
 
 		if (is_mt7916(&dev->mt76) && mtk_wed_device_active(&dev->mt76.mmio.wed)) {
 			RXQ_CONFIG(MT_RXQ_MAIN, WFDMA0, MT_INT_WED_RX_DONE_BAND0_MT7916,
@@ -77,16 +91,23 @@ static void mt7915_dma_config(struct mt7915_dev *dev)
 				   MT7916_RXQ_BAND1);
 			RXQ_CONFIG(MT_RXQ_MAIN_WA, WFDMA0, MT_INT_WED_RX_DONE_WA_MAIN_MT7916,
 				   MT7916_RXQ_MCU_WA_MAIN);
-			TXQ_CONFIG(0, WFDMA0, MT_INT_WED_TX_DONE_BAND0, MT7915_TXQ_BAND0);
-			TXQ_CONFIG(1, WFDMA0, MT_INT_WED_TX_DONE_BAND1, MT7915_TXQ_BAND1);
+			TXQ_CONFIG(0, WFDMA0, MT_INT_WED_TX_DONE_BAND0,
+				   MT7915_TXQ_BAND0);
+			TXQ_CONFIG(1, WFDMA0, MT_INT_WED_TX_DONE_BAND1,
+				   MT7915_TXQ_BAND1);
 		} else {
-			RXQ_CONFIG(MT_RXQ_MAIN, WFDMA0, MT_INT_RX_DONE_BAND0_MT7916, MT7916_RXQ_BAND0);
-			RXQ_CONFIG(MT_RXQ_MCU_WA, WFDMA0, MT_INT_RX_DONE_WA, MT7916_RXQ_MCU_WA);
-			RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0, MT_INT_RX_DONE_BAND1_MT7916, MT7916_RXQ_BAND1);
+			RXQ_CONFIG(MT_RXQ_MAIN, WFDMA0, MT_INT_RX_DONE_BAND0_MT7916,
+				   MT7916_RXQ_BAND0);
+			RXQ_CONFIG(MT_RXQ_MCU_WA, WFDMA0, MT_INT_RX_DONE_WA,
+				   MT7916_RXQ_MCU_WA);
+			RXQ_CONFIG(MT_RXQ_BAND1, WFDMA0, MT_INT_RX_DONE_BAND1_MT7916,
+				   MT7916_RXQ_BAND1);
 			RXQ_CONFIG(MT_RXQ_MAIN_WA, WFDMA0, MT_INT_RX_DONE_WA_MAIN_MT7916,
 				   MT7916_RXQ_MCU_WA_MAIN);
-			TXQ_CONFIG(0, WFDMA0, MT_INT_TX_DONE_BAND0, MT7915_TXQ_BAND0);
-			TXQ_CONFIG(1, WFDMA0, MT_INT_TX_DONE_BAND1, MT7915_TXQ_BAND1);
+			TXQ_CONFIG(0, WFDMA0, MT_INT_TX_DONE_BAND0,
+				   MT7915_TXQ_BAND0);
+			TXQ_CONFIG(1, WFDMA0, MT_INT_TX_DONE_BAND1,
+				   MT7915_TXQ_BAND1);
 		}
 	}
 }
@@ -514,6 +535,53 @@ int mt7915_dma_init(struct mt7915_dev *dev, struct mt7915_phy *phy2)
 	return 0;
 }
 
+int mt7915_dma_reset(struct mt7915_dev *dev, bool force)
+{
+	struct mt76_phy *mphy_ext = dev->mt76.phys[MT_BAND1];
+	int i;
+
+	/* clean up hw queues */
+	for (i = 0; i < ARRAY_SIZE(dev->mt76.phy.q_tx); i++) {
+		mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[i], true);
+		if (mphy_ext)
+			mt76_queue_tx_cleanup(dev, mphy_ext->q_tx[i], true);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(dev->mt76.q_mcu); i++)
+		mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[i], true);
+
+	mt76_for_each_q_rx(&dev->mt76, i)
+		mt76_queue_rx_cleanup(dev, &dev->mt76.q_rx[i]);
+
+	/* reset wfsys */
+	if (force)
+		mt7915_wfsys_reset(dev);
+
+	mt7915_dma_disable(dev, force);
+
+	/* reset hw queues */
+	for (i = 0; i < __MT_TXQ_MAX; i++) {
+		mt76_queue_reset(dev, dev->mphy.q_tx[i]);
+		if (mphy_ext)
+			mt76_queue_reset(dev, mphy_ext->q_tx[i]);
+	}
+
+	for (i = 0; i < __MT_MCUQ_MAX; i++)
+		mt76_queue_reset(dev, dev->mt76.q_mcu[i]);
+
+	mt76_for_each_q_rx(&dev->mt76, i)
+		mt76_queue_reset(dev, &dev->mt76.q_rx[i]);
+
+	mt76_tx_status_check(&dev->mt76, true);
+
+	mt7915_dma_enable(dev);
+
+	mt76_for_each_q_rx(&dev->mt76, i)
+		mt76_queue_rx_reset(dev, i);
+
+	return 0;
+}
+
 void mt7915_dma_cleanup(struct mt7915_dev *dev)
 {
 	mt7915_dma_disable(dev, true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 324f0f58572b..3b1259f14de6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1306,73 +1306,6 @@ mt7915_update_beacons(struct mt7915_dev *dev)
 		mt7915_update_vif_beacon, mphy_ext->hw);
 }
 
-static void
-mt7915_dma_reset(struct mt7915_dev *dev)
-{
-	struct mt76_phy *mphy_ext = dev->mt76.phys[MT_BAND1];
-	u32 hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
-	int i;
-
-	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
-		   MT_WFDMA0_GLO_CFG_TX_DMA_EN |
-		   MT_WFDMA0_GLO_CFG_RX_DMA_EN);
-
-	if (is_mt7915(&dev->mt76))
-		mt76_clear(dev, MT_WFDMA1_GLO_CFG,
-			   MT_WFDMA1_GLO_CFG_TX_DMA_EN |
-			   MT_WFDMA1_GLO_CFG_RX_DMA_EN);
-	if (dev->hif2) {
-		mt76_clear(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
-			   MT_WFDMA0_GLO_CFG_TX_DMA_EN |
-			   MT_WFDMA0_GLO_CFG_RX_DMA_EN);
-
-		if (is_mt7915(&dev->mt76))
-			mt76_clear(dev, MT_WFDMA1_GLO_CFG + hif1_ofs,
-				   MT_WFDMA1_GLO_CFG_TX_DMA_EN |
-				   MT_WFDMA1_GLO_CFG_RX_DMA_EN);
-	}
-
-	usleep_range(1000, 2000);
-
-	for (i = 0; i < __MT_TXQ_MAX; i++) {
-		mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[i], true);
-		if (mphy_ext)
-			mt76_queue_tx_cleanup(dev, mphy_ext->q_tx[i], true);
-	}
-
-	for (i = 0; i < __MT_MCUQ_MAX; i++)
-		mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[i], true);
-
-	mt76_for_each_q_rx(&dev->mt76, i)
-		mt76_queue_rx_reset(dev, i);
-
-	mt76_tx_status_check(&dev->mt76, true);
-
-	/* re-init prefetch settings after reset */
-	mt7915_dma_prefetch(dev);
-
-	mt76_set(dev, MT_WFDMA0_GLO_CFG,
-		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
-	if (is_mt7915(&dev->mt76))
-		mt76_set(dev, MT_WFDMA1_GLO_CFG,
-			 MT_WFDMA1_GLO_CFG_TX_DMA_EN |
-			 MT_WFDMA1_GLO_CFG_RX_DMA_EN |
-			 MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
-			 MT_WFDMA1_GLO_CFG_OMIT_RX_INFO);
-	if (dev->hif2) {
-		mt76_set(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
-			 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
-			 MT_WFDMA0_GLO_CFG_RX_DMA_EN);
-
-		if (is_mt7915(&dev->mt76))
-			mt76_set(dev, MT_WFDMA1_GLO_CFG + hif1_ofs,
-				 MT_WFDMA1_GLO_CFG_TX_DMA_EN |
-				 MT_WFDMA1_GLO_CFG_RX_DMA_EN |
-				 MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
-				 MT_WFDMA1_GLO_CFG_OMIT_RX_INFO);
-	}
-}
-
 void mt7915_tx_token_put(struct mt7915_dev *dev)
 {
 	struct mt76_txwi_cache *txwi;
@@ -1424,7 +1357,7 @@ void mt7915_mac_reset_work(struct work_struct *work)
 	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_DMA_STOPPED);
 
 	if (mt7915_wait_reset_state(dev, MT_MCU_CMD_RESET_DONE)) {
-		mt7915_dma_reset(dev);
+		mt7915_dma_reset(dev, false);
 
 		mt7915_tx_token_put(dev);
 		idr_init(&dev->mt76.token);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index fe6a6d3b0a32..5af26e60e902 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -443,6 +443,7 @@ s8 mt7915_eeprom_get_power_delta(struct mt7915_dev *dev, int band);
 int mt7915_dma_init(struct mt7915_dev *dev, struct mt7915_phy *phy2);
 void mt7915_dma_prefetch(struct mt7915_dev *dev);
 void mt7915_dma_cleanup(struct mt7915_dev *dev);
+int mt7915_dma_reset(struct mt7915_dev *dev, bool force);
 int mt7915_mcu_init(struct mt7915_dev *dev);
 int mt7915_mcu_twt_agrt_update(struct mt7915_dev *dev,
 			       struct mt7915_vif *mvif,
-- 
2.36.1



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A54C7EE26
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 04:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B2JYAt6b56E6tng36F26y8kB4LeTHtjorV6uuYt+HEo=; b=j2o41y+C5CtvFDF2asTe+x6o+q
	VDszPGkllS4iZiBvL1TBAj8THhA1kOM+kzIaIy9x+8R3c4xg3Emtxi6TxtRmsnqotRbXvOpAo3ByN
	Y9K/w0ZHSF7jZaRJHfoTcNUBgOF9SVLx/Nm0QVIc9V++uBqAsL45r49+ccetw5GQhdOP7sjk8Ltvs
	TfQiiBaR3yp+mwc11jjvTHRyWExMQnwCkxoDLLWtaPjPSh8xg7E4BudJH0XFFp6ntSNGX1gy5Iuon
	WCSZFe7PsiPfGHLWGd6z39dKCkOVy9qvebUxKe6o1srEahkcok856uCUfBv4bLLRjf1AdqbLAcq4G
	KjFTpRzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxKl1-00AvtY-0I;
	Fri, 12 May 2023 04:51:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxKkx-00Avr7-2V
	for linux-mediatek@lists.infradead.org;
	Fri, 12 May 2023 04:51:53 +0000
X-UUID: b1a35536f08011ed912e1518a6540028-20230511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=B2JYAt6b56E6tng36F26y8kB4LeTHtjorV6uuYt+HEo=;
	b=JVB6Kz1LCFPqxnGYYw1j5cUQiXeSzlhlDN5xgAY5XtMzA0LcEPiyCRBsM5bmVuQfPmKIfPKPhXBFdUQWqf74AbEoB1eFL9cmveDBFC3VXvmCm4B+MD6hWCjnPtvPVL//e86dDS7RDtM63orDpjY0oGwsaYGkk4xRlKrAyhbHotw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:ffe9ff7a-053a-427c-bcce-789bb796f304,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:178d4d4,CLOUDID:f9c9936b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: b1a35536f08011ed912e1518a6540028-20230511
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1286578036; Thu, 11 May 2023 21:51:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 May 2023 12:51:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 May 2023 12:51:42 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: mt7915: disable WFDMA Tx/Rx during SER recovery
Date: Fri, 12 May 2023 12:51:40 +0800
Message-ID: <42804786054a8b724e47cb143cb669ec6b492c1c.1683853041.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_215151_823265_60DC5913 
X-CRM114-Status: GOOD (  15.11  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

Stop WFDMA transaction to avoid potential unexpected issue while doing
system recovery.

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c      |   6 +
 .../net/wireless/mediatek/mt76/mt7915/dma.c   | 148 ++++++++++--------
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |   9 +-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   1 +
 4 files changed, 95 insertions(+), 69 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 465190ebaf1c..05d9ab3ce819 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -466,6 +466,9 @@ mt76_dma_tx_queue_skb_raw(struct mt76_dev *dev, struct mt76_queue *q,
 	struct mt76_queue_buf buf = {};
 	dma_addr_t addr;
 
+	if (test_bit(MT76_MCU_RESET, &dev->phy.state))
+		goto error;
+
 	if (q->queued + 1 >= q->ndesc - 1)
 		goto error;
 
@@ -507,6 +510,9 @@ mt76_dma_tx_queue_skb(struct mt76_dev *dev, struct mt76_queue *q,
 	dma_addr_t addr;
 	u8 *txwi;
 
+	if (test_bit(MT76_RESET, &dev->phy.state))
+		goto free_skb;
+
 	t = mt76_get_txwi(dev);
 	if (!t)
 		goto free_skb;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index 43a5456d4b97..f2b410b46eea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -250,12 +250,90 @@ static void mt7915_dma_disable(struct mt7915_dev *dev, bool rst)
 	}
 }
 
-static int mt7915_dma_enable(struct mt7915_dev *dev)
+int mt7915_dma_start(struct mt7915_dev *dev, bool reset, bool wed_reset)
 {
 	struct mt76_dev *mdev = &dev->mt76;
 	u32 hif1_ofs = 0;
 	u32 irq_mask;
 
+	if (dev->hif2)
+		hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
+
+	/* enable wpdma tx/rx */
+	if (!reset) {
+		mt76_set(dev, MT_WFDMA0_GLO_CFG,
+			MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+			MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+			MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+			MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+		if (is_mt7915(mdev))
+			mt76_set(dev, MT_WFDMA1_GLO_CFG,
+				MT_WFDMA1_GLO_CFG_TX_DMA_EN |
+				MT_WFDMA1_GLO_CFG_RX_DMA_EN |
+				MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
+				MT_WFDMA1_GLO_CFG_OMIT_RX_INFO);
+
+		if (dev->hif2) {
+			mt76_set(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
+				MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+				MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+				MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+				MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+			if (is_mt7915(mdev))
+				mt76_set(dev, MT_WFDMA1_GLO_CFG + hif1_ofs,
+					MT_WFDMA1_GLO_CFG_TX_DMA_EN |
+					MT_WFDMA1_GLO_CFG_RX_DMA_EN |
+					MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
+					MT_WFDMA1_GLO_CFG_OMIT_RX_INFO);
+
+			mt76_set(dev, MT_WFDMA_HOST_CONFIG,
+				MT_WFDMA_HOST_CONFIG_PDMA_BAND);
+		}
+	}
+
+	/* enable interrupts for TX/RX rings */
+	irq_mask = MT_INT_RX_DONE_MCU |
+		   MT_INT_TX_DONE_MCU |
+		   MT_INT_MCU_CMD;
+
+	if (!dev->phy.mt76->band_idx)
+		irq_mask |= MT_INT_BAND0_RX_DONE;
+
+	if (dev->dbdc_support || dev->phy.mt76->band_idx)
+		irq_mask |= MT_INT_BAND1_RX_DONE;
+
+	if (mtk_wed_device_active(&dev->mt76.mmio.wed) && wed_reset) {
+		u32 wed_irq_mask = irq_mask;
+		int ret;
+
+		wed_irq_mask |= MT_INT_TX_DONE_BAND0 | MT_INT_TX_DONE_BAND1;
+		if (!is_mt7986(&dev->mt76))
+			mt76_wr(dev, MT_INT_WED_MASK_CSR, wed_irq_mask);
+		else
+			mt76_wr(dev, MT_INT_MASK_CSR, wed_irq_mask);
+
+		ret = mt7915_mcu_wed_enable_rx_stats(dev);
+		if (ret)
+			return ret;
+
+		mtk_wed_device_start(&dev->mt76.mmio.wed, wed_irq_mask);
+	}
+
+	irq_mask = reset ? MT_INT_MCU_CMD : irq_mask;
+
+	mt7915_irq_enable(dev, irq_mask);
+	mt7915_irq_disable(dev, 0);
+
+	return 0;
+}
+
+static int mt7915_dma_enable(struct mt7915_dev *dev, bool reset)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	u32 hif1_ofs = 0;
+
 	if (dev->hif2)
 		hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
 
@@ -322,69 +400,7 @@ static int mt7915_dma_enable(struct mt7915_dev *dev)
 	mt76_poll(dev, MT_WFDMA_EXT_CSR_HIF_MISC,
 		  MT_WFDMA_EXT_CSR_HIF_MISC_BUSY, 0, 1000);
 
-	/* set WFDMA Tx/Rx */
-	mt76_set(dev, MT_WFDMA0_GLO_CFG,
-		 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
-		 MT_WFDMA0_GLO_CFG_RX_DMA_EN |
-		 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
-		 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
-
-	if (is_mt7915(mdev))
-		mt76_set(dev, MT_WFDMA1_GLO_CFG,
-			 MT_WFDMA1_GLO_CFG_TX_DMA_EN |
-			 MT_WFDMA1_GLO_CFG_RX_DMA_EN |
-			 MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
-			 MT_WFDMA1_GLO_CFG_OMIT_RX_INFO);
-
-	if (dev->hif2) {
-		mt76_set(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
-			 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
-			 MT_WFDMA0_GLO_CFG_RX_DMA_EN |
-			 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
-			 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
-
-		if (is_mt7915(mdev))
-			mt76_set(dev, MT_WFDMA1_GLO_CFG + hif1_ofs,
-				 MT_WFDMA1_GLO_CFG_TX_DMA_EN |
-				 MT_WFDMA1_GLO_CFG_RX_DMA_EN |
-				 MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
-				 MT_WFDMA1_GLO_CFG_OMIT_RX_INFO);
-
-		mt76_set(dev, MT_WFDMA_HOST_CONFIG,
-			 MT_WFDMA_HOST_CONFIG_PDMA_BAND);
-	}
-
-	/* enable interrupts for TX/RX rings */
-	irq_mask = MT_INT_RX_DONE_MCU |
-		   MT_INT_TX_DONE_MCU |
-		   MT_INT_MCU_CMD;
-
-	if (!dev->phy.mt76->band_idx)
-		irq_mask |= MT_INT_BAND0_RX_DONE;
-
-	if (dev->dbdc_support || dev->phy.mt76->band_idx)
-		irq_mask |= MT_INT_BAND1_RX_DONE;
-
-	if (mtk_wed_device_active(&dev->mt76.mmio.wed)) {
-		u32 wed_irq_mask = irq_mask;
-		int ret;
-
-		wed_irq_mask |= MT_INT_TX_DONE_BAND0 | MT_INT_TX_DONE_BAND1;
-		if (!is_mt7986(&dev->mt76))
-			mt76_wr(dev, MT_INT_WED_MASK_CSR, wed_irq_mask);
-		else
-			mt76_wr(dev, MT_INT_MASK_CSR, wed_irq_mask);
-
-		ret = mt7915_mcu_wed_enable_rx_stats(dev);
-		if (ret)
-			return ret;
-
-		mtk_wed_device_start(&dev->mt76.mmio.wed, wed_irq_mask);
-	}
-
-	mt7915_irq_enable(dev, irq_mask);
-
-	return 0;
+	return mt7915_dma_start(dev, reset, true);
 }
 
 int mt7915_dma_init(struct mt7915_dev *dev, struct mt7915_phy *phy2)
@@ -560,7 +576,7 @@ int mt7915_dma_init(struct mt7915_dev *dev, struct mt7915_phy *phy2)
 			  mt7915_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
-	mt7915_dma_enable(dev);
+	mt7915_dma_enable(dev, false);
 
 	return 0;
 }
@@ -642,7 +658,7 @@ int mt7915_dma_reset(struct mt7915_dev *dev, bool force)
 		mt76_rmw(dev, MT_WFDMA0_EXT0_CFG, MT_WFDMA0_EXT0_RXWB_KEEP,
 			 MT_WFDMA0_EXT0_RXWB_KEEP);
 
-	mt7915_dma_enable(dev);
+	mt7915_dma_enable(dev, !force);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 9b2ccd99854e..dfe42af6dc97 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1629,6 +1629,12 @@ void mt7915_mac_reset_work(struct work_struct *work)
 		mt7915_wait_reset_state(dev, MT_MCU_CMD_RECOVERY_DONE);
 	}
 
+	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_RESET_DONE);
+	mt7915_wait_reset_state(dev, MT_MCU_CMD_NORMAL_STATE);
+
+	/* enable DMA Tx/Rx and interrupt */
+	mt7915_dma_start(dev, false, false);
+
 	clear_bit(MT76_MCU_RESET, &dev->mphy.state);
 	clear_bit(MT76_RESET, &dev->mphy.state);
 	if (phy2)
@@ -1643,9 +1649,6 @@ void mt7915_mac_reset_work(struct work_struct *work)
 
 	tasklet_schedule(&dev->mt76.irq_tasklet);
 
-	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_RESET_DONE);
-	mt7915_wait_reset_state(dev, MT_MCU_CMD_NORMAL_STATE);
-
 	mt76_worker_enable(&dev->mt76.tx_worker);
 
 	local_bh_disable();
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 3053f4abf7db..145f89a19443 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -466,6 +466,7 @@ int mt7915_dma_init(struct mt7915_dev *dev, struct mt7915_phy *phy2);
 void mt7915_dma_prefetch(struct mt7915_dev *dev);
 void mt7915_dma_cleanup(struct mt7915_dev *dev);
 int mt7915_dma_reset(struct mt7915_dev *dev, bool force);
+int mt7915_dma_start(struct mt7915_dev *dev, bool reset, bool wed_reset);
 int mt7915_txbf_init(struct mt7915_dev *dev);
 void mt7915_init_txpower(struct mt7915_dev *dev,
 			 struct ieee80211_supported_band *sband);
-- 
2.18.0



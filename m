Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85286C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 18:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ui/eBXsB+N6cxv/KxcmJhZD7+NMLHebwpbuHKUv6i7o=; b=QhvjhcslVpQevP2XJdroGUUfv0
	zEm13SgoWDvutAop0Ls+ChG5XxDuoaKdCMiZ7hLhOZgr/EnvO3+5Nw+JuZ+jtqmGiOpv2D0w+Fi8b
	9z3/wodSgTN6w5ihZCkNiGtBTnoaPvwu78xLbwECG8f7+bUS+IuZpolfxhrHBCOoilZyn/u0GFmMK
	wv0yiym4Nmbg/oyco56eSKLda6BMYb1+C/UhP2VriCetG5mnekUUmxwULz0eNHq3Ikw3bRgFIJZtX
	It2aUbdEr0WjHcYw3/on8oxpKwA+c/InO7VnFkL0dQrzpb50ZVHK1olfc4pZ9dHInu5tXVSKrb2A8
	4/CsbA6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Abj-007Zss-2h;
	Mon, 22 May 2023 18:50:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Abg-007Zqi-38
	for linux-mediatek@lists.infradead.org;
	Mon, 22 May 2023 18:50:10 +0000
X-UUID: 73109d66f8d111ed912e1518a6540028-20230522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ui/eBXsB+N6cxv/KxcmJhZD7+NMLHebwpbuHKUv6i7o=;
	b=OUAAmXmCFZlX1x7BhdGIF90vr1cv3PWWsd7zSuy3d11tlcYv2lrYcjny8erEb0Sb/wdndCh0cIRUvdc3Fj1VHuBlXSRsx3meTqdGHKEkftwFrx4t42o3nsUQFv7EMvpZgjS16j/heyQJ55YdAOurGNtoiwqRo7/MTHjOgQJjTx0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:ff9e3535-d40b-462b-8c0d-a65693ebd8c7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:c2ddaac1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 73109d66f8d111ed912e1518a6540028-20230522
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1215650830; Mon, 22 May 2023 11:49:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 May 2023 02:49:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 23 May 2023 02:49:55 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/2] wifi: mt76: mt7996: disable WFDMA Tx/Rx during SER recovery
Date: Tue, 23 May 2023 02:49:54 +0800
Message-ID: <c2f203277f63a19c4d2bf8786913732086452131.1684781217.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <eee863c057264ccc09690626cae80cc147fce3ae.1684781217.git.ryder.lee@mediatek.com>
References: <eee863c057264ccc09690626cae80cc147fce3ae.1684781217.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_115009_025387_233BC0A1 
X-CRM114-Status: GOOD (  14.88  )
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
 .../net/wireless/mediatek/mt76/mt7996/dma.c   | 81 +++++++++++--------
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |  9 ++-
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  1 +
 3 files changed, 55 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
index 534143465d9b..99b00a135711 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
@@ -128,11 +128,55 @@ static void mt7996_dma_disable(struct mt7996_dev *dev, bool reset)
 	}
 }
 
-static int mt7996_dma_enable(struct mt7996_dev *dev)
+void mt7996_dma_start(struct mt7996_dev *dev, bool reset)
 {
 	u32 hif1_ofs = 0;
 	u32 irq_mask;
 
+	if (dev->hif2)
+		hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
+
+	/* enable WFDMA Tx/Rx */
+	if (!reset) {
+		mt76_set(dev, MT_WFDMA0_GLO_CFG,
+			 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+			 MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+			 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+			 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+		if (dev->hif2)
+			mt76_set(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
+				 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+				 MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+				 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+				 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+	}
+
+	/* enable interrupts for TX/RX rings */
+	irq_mask = MT_INT_MCU_CMD;
+	if (reset)
+		goto done;
+
+	irq_mask = MT_INT_RX_DONE_MCU | MT_INT_TX_DONE_MCU;
+
+	if (!dev->mphy.band_idx)
+		irq_mask |= MT_INT_BAND0_RX_DONE;
+
+	if (dev->dbdc_support)
+		irq_mask |= MT_INT_BAND1_RX_DONE;
+
+	if (dev->tbtc_support)
+		irq_mask |= MT_INT_BAND2_RX_DONE;
+
+done:
+	mt7996_irq_enable(dev, irq_mask);
+	mt7996_irq_disable(dev, 0);
+}
+
+static void mt7996_dma_enable(struct mt7996_dev *dev, bool reset)
+{
+	u32 hif1_ofs = 0;
+
 	if (dev->hif2)
 		hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
 
@@ -170,13 +214,6 @@ static int mt7996_dma_enable(struct mt7996_dev *dev)
 	mt76_poll(dev, MT_WFDMA_EXT_CSR_HIF_MISC,
 		  MT_WFDMA_EXT_CSR_HIF_MISC_BUSY, 0, 1000);
 
-	/* set WFDMA Tx/Rx */
-	mt76_set(dev, MT_WFDMA0_GLO_CFG,
-		 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
-		 MT_WFDMA0_GLO_CFG_RX_DMA_EN |
-		 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
-		 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
-
 	/* GLO_CFG_EXT0 */
 	mt76_set(dev, WF_WFDMA0_GLO_CFG_EXT0,
 		 WF_WFDMA0_GLO_CFG_EXT0_RX_WB_RXD |
@@ -187,12 +224,6 @@ static int mt7996_dma_enable(struct mt7996_dev *dev)
 		 WF_WFDMA0_GLO_CFG_EXT1_TX_FCTRL_MODE);
 
 	if (dev->hif2) {
-		mt76_set(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
-			 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
-			 MT_WFDMA0_GLO_CFG_RX_DMA_EN |
-			 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
-			 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
-
 		/* GLO_CFG_EXT0 */
 		mt76_set(dev, WF_WFDMA0_GLO_CFG_EXT0 + hif1_ofs,
 			 WF_WFDMA0_GLO_CFG_EXT0_RX_WB_RXD |
@@ -216,23 +247,7 @@ static int mt7996_dma_enable(struct mt7996_dev *dev)
 		/* TODO: redirect rx ring6 interrupt to pcie0 for wed function */
 	}
 
-	/* enable interrupts for TX/RX rings */
-	irq_mask = MT_INT_RX_DONE_MCU |
-		   MT_INT_TX_DONE_MCU |
-		   MT_INT_MCU_CMD;
-
-	if (!dev->mphy.band_idx)
-		irq_mask |= MT_INT_BAND0_RX_DONE;
-
-	if (dev->dbdc_support)
-		irq_mask |= MT_INT_BAND1_RX_DONE;
-
-	if (dev->tbtc_support)
-		irq_mask |= MT_INT_BAND2_RX_DONE;
-
-	mt7996_irq_enable(dev, irq_mask);
-
-	return 0;
+	mt7996_dma_start(dev, reset);
 }
 
 int mt7996_dma_init(struct mt7996_dev *dev)
@@ -347,7 +362,7 @@ int mt7996_dma_init(struct mt7996_dev *dev)
 			  mt7996_poll_tx);
 	napi_enable(&dev->mt76.tx_napi);
 
-	mt7996_dma_enable(dev);
+	mt7996_dma_enable(dev, false);
 
 	return 0;
 }
@@ -413,7 +428,7 @@ void mt7996_dma_reset(struct mt7996_dev *dev, bool force)
 	mt76_for_each_q_rx(&dev->mt76, i)
 		mt76_queue_rx_reset(dev, i);
 
-	mt7996_dma_enable(dev);
+	mt7996_dma_enable(dev, !force);
 }
 
 void mt7996_dma_cleanup(struct mt7996_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 130eb7b4fd91..45080f3f82e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2041,6 +2041,12 @@ void mt7996_mac_reset_work(struct work_struct *work)
 		mt7996_wait_reset_state(dev, MT_MCU_CMD_RECOVERY_DONE);
 	}
 
+	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_RESET_DONE);
+	mt7996_wait_reset_state(dev, MT_MCU_CMD_NORMAL_STATE);
+
+	/* enable DMA Tx/Tx and interrupt */
+	mt7996_dma_start(dev, false);
+
 	clear_bit(MT76_MCU_RESET, &dev->mphy.state);
 	clear_bit(MT76_RESET, &dev->mphy.state);
 	if (phy2)
@@ -2057,9 +2063,6 @@ void mt7996_mac_reset_work(struct work_struct *work)
 
 	tasklet_schedule(&dev->mt76.irq_tasklet);
 
-	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_RESET_DONE);
-	mt7996_wait_reset_state(dev, MT_MCU_CMD_NORMAL_STATE);
-
 	mt76_worker_enable(&dev->mt76.tx_worker);
 
 	local_bh_disable();
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 4d7dcb95a620..ad39c2d73a01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -405,6 +405,7 @@ int mt7996_dma_init(struct mt7996_dev *dev);
 void mt7996_dma_reset(struct mt7996_dev *dev, bool force);
 void mt7996_dma_prefetch(struct mt7996_dev *dev);
 void mt7996_dma_cleanup(struct mt7996_dev *dev);
+void mt7996_dma_start(struct mt7996_dev *dev, bool reset);
 void mt7996_init_txpower(struct mt7996_dev *dev,
 			 struct ieee80211_supported_band *sband);
 int mt7996_txbf_init(struct mt7996_dev *dev);
-- 
2.18.0



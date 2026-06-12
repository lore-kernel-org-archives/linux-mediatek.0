Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9491CD4F2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wdbQcfqWlsPatgZkybOjuUihJQbe7/Y6dC2S+ODwe4=; b=tk10sWNSjjoOUQPwE12gBhymO8
	8H9/cg/Bz31jIRyuR5nnvRxXIz3xmFg4apJanRxCrUJI1JFKr7fehWwVaBmWFJP45g+NG6a0Nh5Rp
	ivmLK5PY9U/47AgMle+QBEwD1//JCx+9BKHO/Y2H3LLy2fH1jsu9FjExiVJwZjA5lsYjbtosFeIT4
	xFQobkOLmMwjjBCeiJqqPAmdiA57OovcwTsmkpokmNB3WiIDpOnp6vRaGUB1Nkpibpk/ki+ELdVyF
	4mkf3nSIgZdRYAfkGbG5Src14lEDMpxhwN9fCgS46EYClm2vQCQsAGrrsj5nXwHbL22kKdIncvJle
	TOoTXcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwfI-0000000AUzj-3Eos;
	Fri, 12 Jun 2026 07:50:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwfF-0000000AUwy-2ool
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:50:54 +0000
X-UUID: 6c9e9d2a663311f1afed4741b24580c9-20260612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6wdbQcfqWlsPatgZkybOjuUihJQbe7/Y6dC2S+ODwe4=;
	b=Cr1aFjYyjXPepFekFP+SOnoETrUHaFgvvRxGcQp+5U/8VSBWdNF2B2+m+st1YmjB8+mAZEcvgP/LugnvpGVyUs+sUG3X/ceIlRGMgJ2vRJMOcI1rqLJVG5wi8TWluqOUDBNvjam6izLkd/qhD8irPsoaOGHrT+pcROxvCldFJEw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:1853d45d-e1d5-4c60-8782-dcbcf9a7c8c3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:5646fda4-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6c9e9d2a663311f1afed4741b24580c9-20260612
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 763670536; Fri, 12 Jun 2026 00:50:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Jun 2026 15:50:45 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 12 Jun 2026 15:50:45 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <emery.hsin@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH 03/20] wifi: mt76: mt7925: replace shared rx irq masks with per-chip definitions
Date: Fri, 12 Jun 2026 15:50:40 +0800
Message-ID: <20260612075042.2577193-3-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260612075042.2577193-1-jb.tsai@mediatek.com>
References: <20260612075042.2577193-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005053_716595_799DDAFC 
X-CRM114-Status: GOOD (  12.36  )
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

From: Emery Hsin <emery.hsin@mediatek.com>

Replace shared MT_INT_RX_DONE_* macros with chip-specific
MT7925_INT_RX_DONE_{DATA,WM,WM2,ALL} and populate all_complete_mask
in mt7925_irq_map. Update resume and mac_reset paths accordingly.

This is a preparation patch before enabling MT7928 PCIe support.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/pci.c   | 33 ++++++++++---------
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |  4 +--
 .../net/wireless/mediatek/mt76/mt7925/regs.h  |  9 ++---
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index ea64303283ed..95a0bd615167 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -298,6 +298,20 @@ static int mt7925_dma_init(struct mt792x_dev *dev)
 	return mt792x_dma_enable(dev);
 }
 
+static const struct mt792x_irq_map mt7925_irq_map = {
+	.host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
+	.tx = {
+		.all_complete_mask = MT_INT_TX_DONE_ALL,
+		.mcu_complete_mask = MT_INT_TX_DONE_MCU,
+	},
+	.rx = {
+		.all_complete_mask = MT7925_INT_RX_DONE_ALL,
+		.data_complete_mask = MT7925_INT_RX_DONE_DATA,
+		.wm_complete_mask = MT7925_INT_RX_DONE_WM,
+		.wm2_complete_mask = MT_INT_RX_DONE_WM2,
+	},
+};
+
 static const struct mt792x_irq_map mt7927_irq_map = {
 	.host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
 	.tx = {
@@ -339,17 +353,6 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 		.drv_own = mt792xe_mcu_drv_pmctrl,
 		.fw_own = mt792xe_mcu_fw_pmctrl,
 	};
-	static const struct mt792x_irq_map irq_map = {
-		.host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
-		.tx = {
-			.all_complete_mask = MT_INT_TX_DONE_ALL,
-			.mcu_complete_mask = MT_INT_TX_DONE_MCU,
-		},
-		.rx = {
-			.data_complete_mask = HOST_RX_DONE_INT_ENA2,
-			.wm_complete_mask = HOST_RX_DONE_INT_ENA0,
-		},
-	};
 	struct ieee80211_ops *ops;
 	struct mt76_bus_ops *bus_ops;
 	struct mt792x_dev *dev;
@@ -407,7 +410,7 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	dev = container_of(mdev, struct mt792x_dev, mt76);
 	dev->fw_features = features;
 	dev->hif_ops = &mt7925_pcie_ops;
-	dev->irq_map = is_mt7927_hw ? &mt7927_irq_map : &irq_map;
+	dev->irq_map = is_mt7927_hw ? &mt7927_irq_map : &mt7925_irq_map;
 	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
 	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
 
@@ -456,7 +459,7 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_dev;
 
-	mt76_wr(dev, irq_map.host_irq_enable, 0);
+	mt76_wr(dev, dev->irq_map->host_irq_enable, 0);
 
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 
@@ -613,9 +616,7 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 	mt76_connac_irq_enable(&dev->mt76,
 			       dev->irq_map->tx.all_complete_mask |
-			       dev->irq_map->rx.data_complete_mask |
-			       dev->irq_map->rx.wm_complete_mask |
-			       dev->irq_map->rx.wm2_complete_mask |
+			       dev->irq_map->rx.all_complete_mask |
 			       MT_INT_MCU_CMD);
 	mt76_set(dev, MT_MCU2HOST_SW_INT_ENA, MT_MCU_CMD_WAKE_RX_PCIE);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 97683949a305..d288739e1307 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -119,9 +119,7 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 
 	mt76_wr(dev, dev->irq_map->host_irq_enable,
 		dev->irq_map->tx.all_complete_mask |
-		dev->irq_map->rx.data_complete_mask |
-		dev->irq_map->rx.wm_complete_mask |
-		dev->irq_map->rx.wm2_complete_mask |
+		dev->irq_map->rx.all_complete_mask |
 		MT_INT_MCU_CMD);
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
index 24985bba1b90..aed90cc82858 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
@@ -43,11 +43,12 @@
 #define HOST_TX_DONE_INT_ENA17		BIT(27)
 
 /* WFDMA interrupt */
-#define MT_INT_RX_DONE_DATA		HOST_RX_DONE_INT_ENA2
-#define MT_INT_RX_DONE_WM		HOST_RX_DONE_INT_ENA0
 #define MT_INT_RX_DONE_WM2		HOST_RX_DONE_INT_ENA1
-#define MT_INT_RX_DONE_ALL		(MT_INT_RX_DONE_DATA | \
-					 MT_INT_RX_DONE_WM | \
+
+#define MT7925_INT_RX_DONE_DATA		HOST_RX_DONE_INT_ENA2
+#define MT7925_INT_RX_DONE_WM		HOST_RX_DONE_INT_ENA0
+#define MT7925_INT_RX_DONE_ALL		(MT7925_INT_RX_DONE_DATA | \
+					 MT7925_INT_RX_DONE_WM | \
 					 MT_INT_RX_DONE_WM2)
 
 #define MT_INT_TX_DONE_MCU_WM		(HOST_TX_DONE_INT_ENA15 | \
-- 
2.45.2



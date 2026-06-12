Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850DFCD98CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tr/pocFYdumnRAiTS0oIGp7DfNRxlNOnmimYddYie18=; b=3vnTHu1rO731vzYnDTLBCUYHZy
	/+u1H889RCVAzj3G21yRSbJxzcPn35mYqBf5D4+m4OFsdRLNYcm+pyOBG9GL2ACJyNMhBy5v9bAAs
	12twVnKgLcKRZMI66u19TnrCa9dWazY7LTWRzM99SGWkcAoCAQMmMwhu8qkr8yvSwBlFSM1zh3DOf
	iCZQlyLyayoQLB5sPPU32GM4Ja96Ul8UjBqYifi8oufRniBuu+okFGdF7hi8pW70ZE9VfVDAsIQ0K
	X1PVqtg4j1ijauOtw9koe+ynvmpMbObFvyl6uRWxQFXuf+vfBwIbOKlmu3RzMRaP2LbdY9LPRpc4E
	OH3qihAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwg8-0000000AVHz-2OeV;
	Fri, 12 Jun 2026 07:51:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwg4-0000000AVFJ-2vQC
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:51:45 +0000
X-UUID: 8c41cc06663311f1afed4741b24580c9-20260612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Tr/pocFYdumnRAiTS0oIGp7DfNRxlNOnmimYddYie18=;
	b=q57fILqVThWfjc1ePfeD6bMBwi2PYtmcHG8jvHgokaAjJvC/SCZEt18whB2d0KYtJhVlSoXkqvIb5RgaKd5vSM2JLs4HY1W/FYIDaRLV4Y5PmvWz92xFcG+p93+yzISxsxfZbfj2fTA5rNP9NtWW7hAop6wrmYh4ST+9R88QGmI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:2dc8ca51-c146-4807-90e7-7c8ed44acc83,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:e974b230-7784-4a77-a538-47ed6151d81b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8c41cc06663311f1afed4741b24580c9-20260612
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 525618326; Fri, 12 Jun 2026 00:51:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Jun 2026 15:51:38 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 12 Jun 2026 15:51:38 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <emery.hsin@mediatek.com>,
	<jb.tsai@mediatek.com>, Xiong <xiong.huang@mediatek.com>
Subject: [PATCH 07/20] wifi: mt76: mt7925: add per-chip PCIe register definitions
Date: Fri, 12 Jun 2026 15:51:33 +0800
Message-ID: <20260612075136.2577553-2-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260612075136.2577553-1-jb.tsai@mediatek.com>
References: <20260612075136.2577553-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005144_764171_18135C80 
X-CRM114-Status: GOOD (  12.20  )
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

Add MT7925_PCIE_MAC_{INT_ENABLE,PM} macros and mt7925_pcie_reg
struct. Update all PCIe register accesses in pci.c, pci_mac.c, and
pci_mcu.c to use dev->pcie_reg->{imask,pm}.

This is a preparation patch before enabling MT7928 PCIe support.

Signed-off-by: Xiong <xiong.huang@mediatek.com>
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c   | 15 ++++++++++-----
 .../net/wireless/mediatek/mt76/mt7925/pci_mac.c   |  4 ++--
 .../net/wireless/mediatek/mt76/mt7925/pci_mcu.c   |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/regs.h  |  5 +++++
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 8a4fb53c718f..61349c260b12 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -298,6 +298,11 @@ static int mt7925_dma_init(struct mt792x_dev *dev)
 	return mt792x_dma_enable(dev);
 }
 
+static const struct mt792x_pcie_reg mt7925_pcie_reg = {
+	.imask = MT7925_PCIE_MAC_INT_ENABLE,
+	.pm = MT7925_PCIE_MAC_PM,
+};
+
 static const struct mt792x_irq_map mt7925_irq_map = {
 	.host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
 	.tx = {
@@ -413,6 +418,8 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	dev->fw_features = features;
 	dev->hif_ops = &mt7925_pcie_ops;
 	dev->irq_map = is_mt7927_hw ? &mt7927_irq_map : &mt7925_irq_map;
+	dev->pcie_reg = &mt7925_pcie_reg;
+
 	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
 	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
 
@@ -462,8 +469,7 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 		goto err_free_dev;
 
 	mt76_wr(dev, dev->irq_map->host_irq_enable, 0);
-
-	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
+	mt76_wr(dev, dev->pcie_reg->imask, 0xff);
 
 	ret = devm_request_irq(mdev->dev, pdev->irq, mt792x_irq_handler,
 			       IRQF_SHARED, KBUILD_MODNAME, dev);
@@ -564,8 +570,7 @@ static int mt7925_pci_suspend(struct device *device)
 
 	/* disable interrupt */
 	mt76_wr(dev, dev->irq_map->host_irq_enable, 0);
-
-	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0x0);
+	mt76_wr(dev, dev->pcie_reg->imask, 0x0);
 
 	synchronize_irq(pdev->irq);
 	tasklet_kill(&mdev->irq_tasklet);
@@ -615,7 +620,7 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 	mt792x_wpdma_reinit_cond(dev);
 
 	/* enable interrupt */
-	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
+	mt76_wr(dev, dev->pcie_reg->imask, 0xff);
 	mt76_connac_irq_enable(&dev->mt76,
 			       dev->irq_map->tx.all_complete_mask |
 			       dev->irq_map->rx.all_complete_mask |
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index d288739e1307..8477d21abc66 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -78,7 +78,7 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
 
 	mt76_wr(dev, dev->irq_map->host_irq_enable, 0);
-	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0x0);
+	mt76_wr(dev, dev->pcie_reg->imask, 0x0);
 
 	set_bit(MT76_RESET, &dev->mphy.state);
 	set_bit(MT76_MCU_RESET, &dev->mphy.state);
@@ -121,7 +121,7 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 		dev->irq_map->tx.all_complete_mask |
 		dev->irq_map->rx.all_complete_mask |
 		MT_INT_MCU_CMD);
-	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
+	mt76_wr(dev, dev->pcie_reg->imask, 0xff);
 
 	err = mt792xe_mcu_fw_pmctrl(dev);
 	if (err)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
index 6cceff88c656..72707eddc3db 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
@@ -43,7 +43,7 @@ int mt7925e_mcu_init(struct mt792x_dev *dev)
 	if (err)
 		return err;
 
-	mt76_rmw_field(dev, MT_PCIE_MAC_PM, MT_PCIE_MAC_PM_L0S_DIS, 1);
+	mt76_rmw_field(dev, dev->pcie_reg->pm, MT_PCIE_MAC_PM_L0S_DIS, 1);
 
 	err = mt7925_run_firmware(dev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
index bb5969689337..85adde2ad597 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
@@ -97,4 +97,9 @@
 #define MT_WTBL_UPDATE_WLAN_IDX		GENMASK(11, 0)
 #define MT_WTBL_UPDATE_ADM_COUNT_CLEAR	BIT(14)
 
+#define MT7925_PCIE_MAC_BASE		0x10000
+#define MT7925_PCIE_MAC(ofs)		(MT7925_PCIE_MAC_BASE + (ofs))
+#define MT7925_PCIE_MAC_INT_ENABLE	MT7925_PCIE_MAC(0x188)
+#define MT7925_PCIE_MAC_PM		MT7925_PCIE_MAC(0x194)
+
 #endif
-- 
2.45.2



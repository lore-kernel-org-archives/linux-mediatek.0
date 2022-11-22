Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27ECC43217
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 08:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRY0/X6npHU23sCc6+6ysjUEqHNuBf9oD+tzOCnltL4=; b=oFJsoOct5Iot9lb4P+nQZNqApB
	cANU3yiyIQuvt/RP7QidHuzHh+BimhkZSoJCIlHBApYqJUKOqd+4rETqY34CW/1GyA799w+Vs1HTe
	VX/pAR/iCDXuERl2XTDDiHeXTAY7ZaecVr2I1TCPNhHkNno3Twq7EzPDoaC8LkgvNlXiZPWeJr+bm
	4uVJ7re6LSQyk3h8vgq/7qFDQ8XzU8V8PM2uNgIuBEGVuzf8wy8oooMeaDna8F7g7A+SigmvvSG4L
	acBeSPxz4sY7FbhQkoV9oqdC7LGRT2lMAFA9UJtFHydrKJnkIkFuxPVJFlTJBFbdVs0TjKALp2wew
	LpXdU6VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxP1E-006bcl-OP; Tue, 22 Nov 2022 08:52:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxP1A-006bZm-LU
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 08:52:38 +0000
X-UUID: 8a23c903c6604881acf595ba61d45751-20221122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jRY0/X6npHU23sCc6+6ysjUEqHNuBf9oD+tzOCnltL4=;
	b=T6JP2GDvePArffTJU2LcHHcntuhU9l8Ec/nGm5cCaKYBveyRW80vpYNhvtB8wFeKfFAzwNwQxxO6v2Ct4u5jwHjJdS84eLJCUdARdX0HEun+MbheTy18LSVKX6/EBHKtNYCNK2ycbJxj14hOFocVsZcMCt4meZJ0W2QrBY25Cs8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:58069be8-c1c7-4752-9526-179cc9fe1c8a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:0fe4e5db-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8a23c903c6604881acf595ba61d45751-20221122
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1350260413; Tue, 22 Nov 2022 01:52:22 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 22 Nov 2022 16:51:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 22 Nov 2022 16:51:57 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 2/9] wifi: mt76: mt7996: add DMA support
Date: Tue, 22 Nov 2022 16:45:47 +0800
Message-ID: <20221122084554.9494-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221122084554.9494-1-shayne.chen@mediatek.com>
References: <20221122084554.9494-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_005236_742743_109920A5 
X-CRM114-Status: GOOD (  17.93  )
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

(Split the big patch into smaller intermediate patches by functionality
for easier review. Refer to the cover letter for more info.)

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/dma.c   | 360 ++++++++++++++++++
 1 file changed, 360 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/dma.c

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
new file mode 100644
index 000000000000..c09fe4274935
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
@@ -0,0 +1,360 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Copyright (C) 2022 MediaTek Inc.
+ */
+
+#include "mt7996.h"
+#include "../dma.h"
+#include "mac.h"
+
+static int mt7996_poll_tx(struct napi_struct *napi, int budget)
+{
+	struct mt7996_dev *dev;
+
+	dev = container_of(napi, struct mt7996_dev, mt76.tx_napi);
+
+	mt76_connac_tx_cleanup(&dev->mt76);
+	if (napi_complete_done(napi, 0))
+		mt7996_irq_enable(dev, MT_INT_TX_DONE_MCU);
+
+	return 0;
+}
+
+static void mt7996_dma_config(struct mt7996_dev *dev)
+{
+#define Q_CONFIG(q, wfdma, int, id) do {		\
+	if (wfdma)					\
+		dev->q_wfdma_mask |= (1 << (q));	\
+	dev->q_int_mask[(q)] = int;			\
+	dev->q_id[(q)] = id;				\
+} while (0)
+
+#define MCUQ_CONFIG(q, wfdma, int, id)	Q_CONFIG(q, (wfdma), (int), (id))
+#define RXQ_CONFIG(q, wfdma, int, id)	Q_CONFIG(__RXQ(q), (wfdma), (int), (id))
+#define TXQ_CONFIG(q, wfdma, int, id)	Q_CONFIG(__TXQ(q), (wfdma), (int), (id))
+
+	/* rx queue */
+	RXQ_CONFIG(MT_RXQ_MCU, WFDMA0, MT_INT_RX_DONE_WM, MT7996_RXQ_MCU_WM);
+	RXQ_CONFIG(MT_RXQ_MCU_WA, WFDMA0, MT_INT_RX_DONE_WA, MT7996_RXQ_MCU_WA);
+
+	/* band0/band1 */
+	RXQ_CONFIG(MT_RXQ_MAIN, WFDMA0, MT_INT_RX_DONE_BAND0, MT7996_RXQ_BAND0);
+	RXQ_CONFIG(MT_RXQ_MAIN_WA, WFDMA0, MT_INT_RX_DONE_WA_MAIN, MT7996_RXQ_MCU_WA_MAIN);
+
+	/* band2 */
+	RXQ_CONFIG(MT_RXQ_BAND2, WFDMA0, MT_INT_RX_DONE_BAND2, MT7996_RXQ_BAND2);
+	RXQ_CONFIG(MT_RXQ_BAND2_WA, WFDMA0, MT_INT_RX_DONE_WA_TRI, MT7996_RXQ_MCU_WA_TRI);
+
+	/* data tx queue */
+	TXQ_CONFIG(0, WFDMA0, MT_INT_TX_DONE_BAND0, MT7996_TXQ_BAND0);
+	TXQ_CONFIG(1, WFDMA0, MT_INT_TX_DONE_BAND1, MT7996_TXQ_BAND1);
+	TXQ_CONFIG(2, WFDMA0, MT_INT_TX_DONE_BAND2, MT7996_TXQ_BAND2);
+
+	/* mcu tx queue */
+	MCUQ_CONFIG(MT_MCUQ_WM, WFDMA0, MT_INT_TX_DONE_MCU_WM, MT7996_TXQ_MCU_WM);
+	MCUQ_CONFIG(MT_MCUQ_WA, WFDMA0, MT_INT_TX_DONE_MCU_WA, MT7996_TXQ_MCU_WA);
+	MCUQ_CONFIG(MT_MCUQ_FWDL, WFDMA0, MT_INT_TX_DONE_FWDL, MT7996_TXQ_FWDL);
+}
+
+static void __mt7996_dma_prefetch(struct mt7996_dev *dev, u32 ofs)
+{
+#define PREFETCH(_base, _depth)	((_base) << 16 | (_depth))
+	/* prefetch SRAM wrapping boundary for tx/rx ring. */
+	mt76_wr(dev, MT_MCUQ_EXT_CTRL(MT_MCUQ_FWDL) + ofs, PREFETCH(0x0, 0x2));
+	mt76_wr(dev, MT_MCUQ_EXT_CTRL(MT_MCUQ_WM) + ofs, PREFETCH(0x20, 0x2));
+	mt76_wr(dev, MT_TXQ_EXT_CTRL(0) + ofs, PREFETCH(0x40, 0x4));
+	mt76_wr(dev, MT_TXQ_EXT_CTRL(1) + ofs, PREFETCH(0x80, 0x4));
+	mt76_wr(dev, MT_MCUQ_EXT_CTRL(MT_MCUQ_WA) + ofs, PREFETCH(0xc0, 0x2));
+	mt76_wr(dev, MT_TXQ_EXT_CTRL(2) + ofs, PREFETCH(0xe0, 0x4));
+	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MCU) + ofs, PREFETCH(0x120, 0x2));
+	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MCU_WA) + ofs, PREFETCH(0x140, 0x2));
+	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MAIN_WA) + ofs, PREFETCH(0x160, 0x2));
+	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_BAND2_WA) + ofs, PREFETCH(0x180, 0x2));
+	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MAIN) + ofs, PREFETCH(0x1a0, 0x10));
+	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_BAND2) + ofs, PREFETCH(0x2a0, 0x10));
+
+	mt76_set(dev, WF_WFDMA0_GLO_CFG_EXT1 + ofs, WF_WFDMA0_GLO_CFG_EXT1_CALC_MODE);
+}
+
+void mt7996_dma_prefetch(struct mt7996_dev *dev)
+{
+	__mt7996_dma_prefetch(dev, 0);
+	if (dev->hif2)
+		__mt7996_dma_prefetch(dev, MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0));
+}
+
+static void mt7996_dma_disable(struct mt7996_dev *dev, bool reset)
+{
+	u32 hif1_ofs = 0;
+
+	if (dev->hif2)
+		hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
+
+	if (reset) {
+		mt76_clear(dev, MT_WFDMA0_RST,
+			   MT_WFDMA0_RST_DMASHDL_ALL_RST |
+			   MT_WFDMA0_RST_LOGIC_RST);
+
+		mt76_set(dev, MT_WFDMA0_RST,
+			 MT_WFDMA0_RST_DMASHDL_ALL_RST |
+			 MT_WFDMA0_RST_LOGIC_RST);
+
+		if (dev->hif2) {
+			mt76_clear(dev, MT_WFDMA0_RST + hif1_ofs,
+				   MT_WFDMA0_RST_DMASHDL_ALL_RST |
+				   MT_WFDMA0_RST_LOGIC_RST);
+
+			mt76_set(dev, MT_WFDMA0_RST + hif1_ofs,
+				 MT_WFDMA0_RST_DMASHDL_ALL_RST |
+				 MT_WFDMA0_RST_LOGIC_RST);
+		}
+	}
+
+	/* disable */
+	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
+		   MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+		   MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+		   MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO |
+		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+	if (dev->hif2) {
+		mt76_clear(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
+			   MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+			   MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+			   MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+			   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO |
+			   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+	}
+}
+
+static int mt7996_dma_enable(struct mt7996_dev *dev)
+{
+	u32 hif1_ofs = 0;
+	u32 irq_mask;
+
+	if (dev->hif2)
+		hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
+
+	/* reset dma idx */
+	mt76_wr(dev, MT_WFDMA0_RST_DTX_PTR, ~0);
+	if (dev->hif2)
+		mt76_wr(dev, MT_WFDMA0_RST_DTX_PTR + hif1_ofs, ~0);
+
+	/* configure delay interrupt off */
+	mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG0, 0);
+	mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG1, 0);
+	mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG2, 0);
+
+	if (dev->hif2) {
+		mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG0 + hif1_ofs, 0);
+		mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG1 + hif1_ofs, 0);
+		mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG2 + hif1_ofs, 0);
+	}
+
+	/* configure perfetch settings */
+	mt7996_dma_prefetch(dev);
+
+	/* hif wait WFDMA idle */
+	mt76_set(dev, MT_WFDMA0_BUSY_ENA,
+		 MT_WFDMA0_BUSY_ENA_TX_FIFO0 |
+		 MT_WFDMA0_BUSY_ENA_TX_FIFO1 |
+		 MT_WFDMA0_BUSY_ENA_RX_FIFO);
+
+	if (dev->hif2)
+		mt76_set(dev, MT_WFDMA0_BUSY_ENA + hif1_ofs,
+			 MT_WFDMA0_PCIE1_BUSY_ENA_TX_FIFO0 |
+			 MT_WFDMA0_PCIE1_BUSY_ENA_TX_FIFO1 |
+			 MT_WFDMA0_PCIE1_BUSY_ENA_RX_FIFO);
+
+	mt76_poll(dev, MT_WFDMA_EXT_CSR_HIF_MISC,
+		  MT_WFDMA_EXT_CSR_HIF_MISC_BUSY, 0, 1000);
+
+	/* set WFDMA Tx/Rx */
+	mt76_set(dev, MT_WFDMA0_GLO_CFG,
+		 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+		 MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+		 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+		 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+	/* GLO_CFG_EXT0 */
+	mt76_set(dev, WF_WFDMA0_GLO_CFG_EXT0,
+		 WF_WFDMA0_GLO_CFG_EXT0_RX_WB_RXD |
+		 WF_WFDMA0_GLO_CFG_EXT0_WED_MERGE_MODE);
+
+	/* GLO_CFG_EXT1 */
+	mt76_set(dev, WF_WFDMA0_GLO_CFG_EXT1,
+		 WF_WFDMA0_GLO_CFG_EXT1_TX_FCTRL_MODE);
+
+	if (dev->hif2) {
+		mt76_set(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
+			 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+			 MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+			 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+			 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+		/* GLO_CFG_EXT0 */
+		mt76_set(dev, WF_WFDMA0_GLO_CFG_EXT0 + hif1_ofs,
+			 WF_WFDMA0_GLO_CFG_EXT0_RX_WB_RXD |
+			 WF_WFDMA0_GLO_CFG_EXT0_WED_MERGE_MODE);
+
+		/* GLO_CFG_EXT1 */
+		mt76_set(dev, WF_WFDMA0_GLO_CFG_EXT1 + hif1_ofs,
+			 WF_WFDMA0_GLO_CFG_EXT1_TX_FCTRL_MODE);
+
+		mt76_set(dev, MT_WFDMA_HOST_CONFIG,
+			 MT_WFDMA_HOST_CONFIG_PDMA_BAND);
+	}
+
+	if (dev->hif2) {
+		/* fix hardware limitation, pcie1's rx ring3 is not available
+		 * so, redirect pcie0 rx ring3 interrupt to pcie1
+		 */
+		mt76_set(dev, MT_WFDMA0_RX_INT_PCIE_SEL,
+			 MT_WFDMA0_RX_INT_SEL_RING3);
+
+		/* TODO: redirect rx ring6 interrupt to pcie0 for wed function */
+	}
+
+	/* enable interrupts for TX/RX rings */
+	irq_mask = MT_INT_RX_DONE_MCU |
+		   MT_INT_TX_DONE_MCU |
+		   MT_INT_MCU_CMD;
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
+	mt7996_irq_enable(dev, irq_mask);
+
+	return 0;
+}
+
+int mt7996_dma_init(struct mt7996_dev *dev)
+{
+	u32 hif1_ofs = 0;
+	int ret;
+
+	mt7996_dma_config(dev);
+
+	mt76_dma_attach(&dev->mt76);
+
+	if (dev->hif2)
+		hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
+
+	mt7996_dma_disable(dev, true);
+
+	/* init tx queue */
+	ret = mt76_connac_init_tx_queues(dev->phy.mt76,
+					 MT_TXQ_ID(dev->mphy.band_idx),
+					 MT7996_TX_RING_SIZE,
+					 MT_TXQ_RING_BASE(0), 0);
+	if (ret)
+		return ret;
+
+	/* command to WM */
+	ret = mt76_init_mcu_queue(&dev->mt76, MT_MCUQ_WM,
+				  MT_MCUQ_ID(MT_MCUQ_WM),
+				  MT7996_TX_MCU_RING_SIZE,
+				  MT_MCUQ_RING_BASE(MT_MCUQ_WM));
+	if (ret)
+		return ret;
+
+	/* command to WA */
+	ret = mt76_init_mcu_queue(&dev->mt76, MT_MCUQ_WA,
+				  MT_MCUQ_ID(MT_MCUQ_WA),
+				  MT7996_TX_MCU_RING_SIZE,
+				  MT_MCUQ_RING_BASE(MT_MCUQ_WA));
+	if (ret)
+		return ret;
+
+	/* firmware download */
+	ret = mt76_init_mcu_queue(&dev->mt76, MT_MCUQ_FWDL,
+				  MT_MCUQ_ID(MT_MCUQ_FWDL),
+				  MT7996_TX_FWDL_RING_SIZE,
+				  MT_MCUQ_RING_BASE(MT_MCUQ_FWDL));
+	if (ret)
+		return ret;
+
+	/* event from WM */
+	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU],
+			       MT_RXQ_ID(MT_RXQ_MCU),
+			       MT7996_RX_MCU_RING_SIZE,
+			       MT_RX_BUF_SIZE,
+			       MT_RXQ_RING_BASE(MT_RXQ_MCU));
+	if (ret)
+		return ret;
+
+	/* event from WA */
+	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU_WA],
+			       MT_RXQ_ID(MT_RXQ_MCU_WA),
+			       MT7996_RX_MCU_RING_SIZE,
+			       MT_RX_BUF_SIZE,
+			       MT_RXQ_RING_BASE(MT_RXQ_MCU_WA));
+	if (ret)
+		return ret;
+
+	/* rx data queue for band0 and band1 */
+	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MAIN],
+			       MT_RXQ_ID(MT_RXQ_MAIN),
+			       MT7996_RX_RING_SIZE,
+			       MT_RX_BUF_SIZE,
+			       MT_RXQ_RING_BASE(MT_RXQ_MAIN));
+	if (ret)
+		return ret;
+
+	/* tx free notify event from WA for band0 */
+	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MAIN_WA],
+			       MT_RXQ_ID(MT_RXQ_MAIN_WA),
+			       MT7996_RX_MCU_RING_SIZE,
+			       MT_RX_BUF_SIZE,
+			       MT_RXQ_RING_BASE(MT_RXQ_MAIN_WA));
+	if (ret)
+		return ret;
+
+	if (dev->tbtc_support || dev->mphy.band_idx == MT_BAND2) {
+		/* rx data queue for band2 */
+		ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_BAND2],
+				       MT_RXQ_ID(MT_RXQ_BAND2),
+				       MT7996_RX_RING_SIZE,
+				       MT_RX_BUF_SIZE,
+				       MT_RXQ_RING_BASE(MT_RXQ_BAND2) + hif1_ofs);
+		if (ret)
+			return ret;
+
+		/* tx free notify event from WA for band2
+		 * use pcie0's rx ring3, but, redirect pcie0 rx ring3 interrupt to pcie1
+		 */
+		ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_BAND2_WA],
+				       MT_RXQ_ID(MT_RXQ_BAND2_WA),
+				       MT7996_RX_MCU_RING_SIZE,
+				       MT_RX_BUF_SIZE,
+				       MT_RXQ_RING_BASE(MT_RXQ_BAND2_WA));
+		if (ret)
+			return ret;
+	}
+
+	ret = mt76_init_queues(dev, mt76_dma_rx_poll);
+	if (ret < 0)
+		return ret;
+
+	netif_napi_add_tx(&dev->mt76.tx_napi_dev, &dev->mt76.tx_napi,
+			  mt7996_poll_tx);
+	napi_enable(&dev->mt76.tx_napi);
+
+	mt7996_dma_enable(dev);
+
+	return 0;
+}
+
+void mt7996_dma_cleanup(struct mt7996_dev *dev)
+{
+	mt7996_dma_disable(dev, true);
+
+	mt76_dma_cleanup(&dev->mt76);
+}
-- 
2.25.1



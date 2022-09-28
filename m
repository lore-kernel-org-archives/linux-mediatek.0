Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D84C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPNDLrZTbtF58Q0pzPPVmv5f6EqG/q0Mbu6yDfFQJPA=; b=ywoDS6GEMtZ9HWs9BmS9ZUYnX3
	XpodqdhSfgv1iF3Sn1goDEtEB70BnNTaM5xtAEez+XqnVjp0fvqiMGcV0DC7EXpFoUDrqIQzhNrhf
	PycSVvZNpD/VsgObQnkZtYkm/mv4gsyNuzO9eMGO3CRQW9VlkPbK176sOPQn/uLbyHU5uIvIy3oP2
	c5GFthVi+CkMntYCFt7pfpv+YViw+RzPaC1fEclwP+w7I/e/LizZf34tXO8x5VpzcTrENVYjQQzsy
	uu33T+69r+X5tg5nWkjPeqFkkVh64QDUznP7K2L96Q3mdzbVVVwbLLG5l3QPq8I3wiShMS1CRbZs1
	iaimVbFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTEf-00F9lZ-MF; Wed, 28 Sep 2022 09:20:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTEb-00F9jo-Kh
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 09:20:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 418DBB8201C;
	Wed, 28 Sep 2022 09:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CE7C433D6;
	Wed, 28 Sep 2022 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664356802;
	bh=je1ZAwIGONEH2g5CRvzWuJrFS1JA23hGg6iyAOU6upE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PEKLaIeeyD2a9ZSwKKyIaCa1rXStiWqtgoMdtNwllbEDBIiKxZjod67ryVl73Abd7
	 ugLlSI+GB8dpQ/C3daUB4c+SAFq0Q1IbeIfE6Irz8JRDXiutkcgDGiH0b97XPx8z/r
	 PUw59cfXI99p2cWDgjdfa3yOKsG9qz1uo8Cs+2pBNMEJPpifaxwt2H8lgmZkXVxjM7
	 H3xewFkB4QJrdA9PnKdGdEEBrULLCdkkm3tdTytOYC4RQTRJByHeYkRFDAqjLD7f0l
	 MYlZIPojYMeuR7L9WWOBwPqI3AIP4VkDIiaKAKqhZP4r3k+1JpYZ3GkKKJx6JYYydi
	 N/InWy2oiykQQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	daniel@makrotopia.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] wifi: mt76: mt7915: enable wed for mt7986 chipset
Date: Wed, 28 Sep 2022 11:19:42 +0200
Message-Id: <b8f2836e1121aae1b1045d8a893253d725593f01.1664356281.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1664356281.git.lorenzo@kernel.org>
References: <cover.1664356281.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_022006_006764_30C40429 
X-CRM114-Status: GOOD (  11.59  )
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

Introduce wed tx support for MT7986 chipset

Tested-by: Daniel Golle <daniel@makrotopia.org>
Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/dma.c  |  1 +
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c | 11 +++++++++++
 drivers/net/wireless/mediatek/mt76/mt7915/regs.h |  8 ++++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index 00aafc2422f3..90a89cf493a9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -324,6 +324,7 @@ static int mt7915_dma_enable(struct mt7915_dev *dev)
 
 		wed_irq_mask |= MT_INT_TX_DONE_BAND0 | MT_INT_TX_DONE_BAND1;
 		mt76_wr(dev, MT_INT_WED_MASK_CSR, wed_irq_mask);
+		mt76_wr(dev, MT_INT_MASK_CSR, wed_irq_mask);
 		mtk_wed_device_start(&dev->mt76.mmio.wed, wed_irq_mask);
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index e75f2229b6a1..5676d62933ad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -541,7 +541,18 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, struct pci_dev *pdev,
 	wed->wlan.pci_dev = pdev;
 	wed->wlan.wpdma_phys = pci_resource_start(pdev, 0) +
 			       MT_WFDMA_EXT_CSR_BASE;
+	wed->wlan.wpdma_int = pci_resource_start(pdev, 0) +
+			      MT_INT_WED_SOURCE_CSR;
+	wed->wlan.wpdma_mask = pci_resource_start(pdev, 0) +
+			       MT_INT_WED_MASK_CSR;
+	wed->wlan.wpdma_tx = pci_resource_start(pdev, 0) +
+			     MT_TXQ_WED_RING_BASE;
+	wed->wlan.wpdma_txfree = pci_resource_start(pdev, 0) +
+				 MT_RXQ_WED_RING_BASE;
 	wed->wlan.nbuf = 4096;
+	wed->wlan.tx_tbit[0] = MT_WED_TX_DONE_BAND0;
+	wed->wlan.tx_tbit[1] = MT_WED_TX_DONE_BAND1;
+	wed->wlan.txfree_tbit = MT_WED_TX_FREE_DONE;
 	wed->wlan.token_start = MT7915_TOKEN_SIZE - wed->wlan.nbuf;
 	wed->wlan.init_buf = mt7915_wed_init_buf;
 	wed->wlan.offload_enable = mt7915_mmio_wed_offload_enable;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 5920e705835a..d9642c5817e9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -596,6 +596,7 @@ enum offs_rev {
 #define MT_PCIE_RECOG_ID_MASK		GENMASK(30, 0)
 #define MT_PCIE_RECOG_ID_SEM		BIT(31)
 
+#define MT_INT_WED_SOURCE_CSR		MT_WFDMA_EXT_CSR(0x200)
 #define MT_INT_WED_MASK_CSR		MT_WFDMA_EXT_CSR(0x204)
 
 #define MT_WED_TX_RING_BASE		MT_WFDMA_EXT_CSR(0x300)
@@ -642,6 +643,13 @@ enum offs_rev {
 #define MT_TXQ_EXT_CTRL(q)		(MT_Q_BASE(__TXQ(q)) + 0x600 +	\
 					 MT_TXQ_ID(q)* 0x4)
 
+#define MT_TXQ_WED_RING_BASE		0xd7300
+#define MT_RXQ_WED_RING_BASE		0xd7410
+
+#define MT_WED_TX_DONE_BAND0		4
+#define MT_WED_TX_DONE_BAND1		5
+#define MT_WED_TX_FREE_DONE		1
+
 #define MT_INT_SOURCE_CSR		__REG(INT_SOURCE_CSR)
 #define MT_INT_MASK_CSR			__REG(INT_MASK_CSR)
 
-- 
2.37.3



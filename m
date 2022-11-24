Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C247C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9vChJp+OKrpGd/UvrAQ2NOYAaX2nw5Lnwc/3VdMP/Q=; b=xtxYQ8LR7RwM6EYEs1XSm5zGEp
	qgM6DVqrpJIZsM4/VSGZsb9rpm7fS3M//xGKlmGWjmBongEUu15m2KEv832u6wTrUyhNXbXA9p/Ba
	vH1a4x8R2Ep1oADxY8hBczEHEI04aTM8tkMcgBrC3GpN/m4PtMvL01H7oKjOKA2s8cRxatP2NXWcq
	0WucFEK7cFTXYaHB+z9RjomUBGV1mVvTNpr98PVv3rsLGjb4LPgzLyFOgHpeAS+hp6wePeyKFxtjz
	st5TsuKqjsKRHWyf+NZhIXnrI4ewPxHCpJkD1g03/lzlA/z93096yJsSYziHEMaGS/a29DEi+NTYi
	iRkgSqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyE4b-009fFo-Mk; Thu, 24 Nov 2022 15:23:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyE4V-009fA9-U1
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 15:23:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9DF5CB826FF;
	Thu, 24 Nov 2022 15:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D2BC433D6;
	Thu, 24 Nov 2022 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669303405;
	bh=xD/meMWbsV5llZFZtNrqMXecQ4aLfDz08to7GAeABv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BvarVX4p4ghak92VPFNHCv6quGlHZkl6MHsQKjAdMpW+NWSWD9gyH738UhmMT3uWC
	 b5K9YcmAMfDA1CNeIvPZFvutPHP2Rl0wFVrW/UxWdJmc2yx3Vf1Q1JAP3j6qKzuJjo
	 JY5DPKCTY9tk2jMM8gzovD2w0WRcdEm50cSQ+D/FJQKgZ1sGkJCHDCv2IYg3bjLZI8
	 JkG3krbe7ehoDcjRwShYJQhWIRRWcZNogaMUlIrOxgCIHsm0yP1lVDqfxeRP3IsSEH
	 xA6TCFY7PnD+RheRKvHE+eXP4w8jgbpyvquNEu9wmJDzcuWtpYiExO0yHK5RS8As4o
	 ljS6lRd6t6FZw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	lorenzo.bianconi@redhat.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 net-next 5/5] net: ethernet: mtk_wed: add reset to tx_ring_setup callback
Date: Thu, 24 Nov 2022 16:22:55 +0100
Message-Id: <faf761fecd0fc4bf2b13478e54f3b204870e8471.1669303154.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1669303154.git.lorenzo@kernel.org>
References: <cover.1669303154.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_072328_312212_5AFCF312 
X-CRM114-Status: GOOD (  14.45  )
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

Introduce reset parameter to mtk_wed_tx_ring_setup signature.
This is a preliminary patch to add Wireless Ethernet Dispatcher reset
support.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c  | 19 +++++++++++--------
 drivers/net/wireless/mediatek/mt76/dma.c |  2 +-
 include/linux/soc/mediatek/mtk_wed.h     |  8 ++++----
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 07261aeacc56..927a74e4f51d 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1181,7 +1181,8 @@ mtk_wed_ring_alloc(struct mtk_wed_device *dev, struct mtk_wed_ring *ring,
 }
 
 static int
-mtk_wed_wdma_rx_ring_setup(struct mtk_wed_device *dev, int idx, int size)
+mtk_wed_wdma_rx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
+			   bool reset)
 {
 	u32 desc_size = sizeof(struct mtk_wdma_desc) * dev->hw->version;
 	struct mtk_wed_ring *wdma;
@@ -1190,8 +1191,8 @@ mtk_wed_wdma_rx_ring_setup(struct mtk_wed_device *dev, int idx, int size)
 		return -EINVAL;
 
 	wdma = &dev->rx_wdma[idx];
-	if (mtk_wed_ring_alloc(dev, wdma, MTK_WED_WDMA_RING_SIZE, desc_size,
-			       true))
+	if (!reset && mtk_wed_ring_alloc(dev, wdma, MTK_WED_WDMA_RING_SIZE,
+					 desc_size, true))
 		return -ENOMEM;
 
 	wdma_w32(dev, MTK_WDMA_RING_RX(idx) + MTK_WED_RING_OFS_BASE,
@@ -1389,7 +1390,7 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
 		if (!dev->rx_wdma[i].desc)
-			mtk_wed_wdma_rx_ring_setup(dev, i, 16);
+			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
 
 	mtk_wed_hw_init(dev);
 	mtk_wed_configure_irq(dev, irq_mask);
@@ -1495,7 +1496,8 @@ mtk_wed_attach(struct mtk_wed_device *dev)
 }
 
 static int
-mtk_wed_tx_ring_setup(struct mtk_wed_device *dev, int idx, void __iomem *regs)
+mtk_wed_tx_ring_setup(struct mtk_wed_device *dev, int idx, void __iomem *regs,
+		      bool reset)
 {
 	struct mtk_wed_ring *ring = &dev->tx_ring[idx];
 
@@ -1514,11 +1516,12 @@ mtk_wed_tx_ring_setup(struct mtk_wed_device *dev, int idx, void __iomem *regs)
 	if (WARN_ON(idx >= ARRAY_SIZE(dev->tx_ring)))
 		return -EINVAL;
 
-	if (mtk_wed_ring_alloc(dev, ring, MTK_WED_TX_RING_SIZE,
-			       sizeof(*ring->desc), true))
+	if (!reset && mtk_wed_ring_alloc(dev, ring, MTK_WED_TX_RING_SIZE,
+					 sizeof(*ring->desc), true))
 		return -ENOMEM;
 
-	if (mtk_wed_wdma_rx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE))
+	if (mtk_wed_wdma_rx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE,
+				       reset))
 		return -ENOMEM;
 
 	ring->reg_base = MTK_WED_RING_TX(idx);
diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 8dca8d2447b7..3f8c0845fcca 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -632,7 +632,7 @@ mt76_dma_wed_setup(struct mt76_dev *dev, struct mt76_queue *q)
 
 	switch (type) {
 	case MT76_WED_Q_TX:
-		ret = mtk_wed_device_tx_ring_setup(wed, ring, q->regs);
+		ret = mtk_wed_device_tx_ring_setup(wed, ring, q->regs, false);
 		if (!ret)
 			q->wed_regs = wed->tx_ring[ring].reg_base;
 		break;
diff --git a/include/linux/soc/mediatek/mtk_wed.h b/include/linux/soc/mediatek/mtk_wed.h
index 0bbba50cf929..32d87c701333 100644
--- a/include/linux/soc/mediatek/mtk_wed.h
+++ b/include/linux/soc/mediatek/mtk_wed.h
@@ -155,7 +155,7 @@ struct mtk_wed_device {
 struct mtk_wed_ops {
 	int (*attach)(struct mtk_wed_device *dev);
 	int (*tx_ring_setup)(struct mtk_wed_device *dev, int ring,
-			     void __iomem *regs);
+			     void __iomem *regs, bool reset);
 	int (*rx_ring_setup)(struct mtk_wed_device *dev, int ring,
 			     void __iomem *regs);
 	int (*txfree_ring_setup)(struct mtk_wed_device *dev,
@@ -213,8 +213,8 @@ mtk_wed_get_rx_capa(struct mtk_wed_device *dev)
 #define mtk_wed_device_active(_dev) !!(_dev)->ops
 #define mtk_wed_device_detach(_dev) (_dev)->ops->detach(_dev)
 #define mtk_wed_device_start(_dev, _mask) (_dev)->ops->start(_dev, _mask)
-#define mtk_wed_device_tx_ring_setup(_dev, _ring, _regs) \
-	(_dev)->ops->tx_ring_setup(_dev, _ring, _regs)
+#define mtk_wed_device_tx_ring_setup(_dev, _ring, _regs, _reset) \
+	(_dev)->ops->tx_ring_setup(_dev, _ring, _regs, _reset)
 #define mtk_wed_device_txfree_ring_setup(_dev, _regs) \
 	(_dev)->ops->txfree_ring_setup(_dev, _regs)
 #define mtk_wed_device_reg_read(_dev, _reg) \
@@ -240,7 +240,7 @@ static inline bool mtk_wed_device_active(struct mtk_wed_device *dev)
 }
 #define mtk_wed_device_detach(_dev) do {} while (0)
 #define mtk_wed_device_start(_dev, _mask) do {} while (0)
-#define mtk_wed_device_tx_ring_setup(_dev, _ring, _regs) -ENODEV
+#define mtk_wed_device_tx_ring_setup(_dev, _ring, _regs, _reset) -ENODEV
 #define mtk_wed_device_txfree_ring_setup(_dev, _ring, _regs) -ENODEV
 #define mtk_wed_device_reg_read(_dev, _reg) 0
 #define mtk_wed_device_reg_write(_dev, _reg, _val) do {} while (0)
-- 
2.38.1



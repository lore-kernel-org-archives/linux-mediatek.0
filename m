Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0AFC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iv0fMHLXct5pEaFTyFhd0ItR7bFksh8ZpYepe2ImwLE=; b=LIMW1k6BAWrJ4Pe5L1F2j+56c9
	/DK2iX9SSFh2jREROnLScaKm2duT6wLqITb9bqQgXVBYCM4LZpM0PLlnFA2fiAeT2qSgTUa9m07I2
	/9C2WLx025KmdZuKOuesJQzeLKDWJzR5WN3D9L4hGHmFD/OTETDcACoXnCwBLOom9/WaocBvDiN7K
	eSSyZbobtIETWCccL443KZPXmmLybW69yfJxFUitxoJFf1bI1YfNXT4w/7cHPk9aeZb0aBk4taq8N
	F0LbeSB9VJApQZ1OmjLEmEeGK5i8F1Orq4tZEYnvT8PQPWnWdw5VU9ZXFGTbnXha/X3fsG27+MQ4e
	WymmirQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2fB-00BZcy-20; Mon, 21 Nov 2022 09:00:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2f7-00BZag-2D
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 09:00:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F32660F4F;
	Mon, 21 Nov 2022 09:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2EAC433D6;
	Mon, 21 Nov 2022 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669021219;
	bh=k8ICLiz2w0xbgVny2iPOeJxnRtHmN5kCsUKA64b8QEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LO5m0KMwBWioIU82zvzJSCdZu6yBtYaXb2CuwAUFyGol79GHfL4PD5ea/01DY0zlK
	 lPCshLr/O/2/ohCmkCK0GcFBzLcQWxeGt7xaMt2856oixtjBrOkHSx2CuVrtMb0l/4
	 bbsaNpY117TeEOKuDnGempeHXoRfsUAnlX43D1TzqQ52+otFeQGqSZGj5md0Y1jA19
	 rf+9illnii7JlikFM1VyJ4WsWxdI+WRY5oC2KQwGu7EiEG2VZZQHYn+XTD9fJSO0cU
	 0tgtdXx7fDWhU8gfE66NM+qA8/UnRQ4xuvMcLf1J8U7Dzb6C1oYCW6cTAZsLKvFvXM
	 IMtQ+3Uol/YFw==
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
Subject: [PATCH net-next 4/5] net: ethernet: mtk_wed: add mtk_wed_rx_reset routine
Date: Mon, 21 Nov 2022 09:59:24 +0100
Message-Id: <ba429d51cc33f4dbca19f2c2197363b11f1009a0.1669020847.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1669020847.git.lorenzo@kernel.org>
References: <cover.1669020847.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_010021_202548_FF5717D3 
X-CRM114-Status: GOOD (  17.67  )
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

Introduce mtk_wed_rx_reset routine in order to reset rx DMA for Wireless
Ethernet Dispatcher available on MT7986 SoC.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c      | 190 +++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_wed_regs.h |   9 +
 2 files changed, 162 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index f43652e72728..07261aeacc56 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -944,42 +944,130 @@ mtk_wed_ring_reset(struct mtk_wed_ring *ring, int size, bool tx)
 }
 
 static u32
-mtk_wed_check_busy(struct mtk_wed_device *dev)
+mtk_wed_check_busy(struct mtk_wed_device *dev, u32 reg, u32 mask)
 {
-	if (wed_r32(dev, MTK_WED_GLO_CFG) & MTK_WED_GLO_CFG_TX_DMA_BUSY)
-		return true;
-
-	if (wed_r32(dev, MTK_WED_WPDMA_GLO_CFG) &
-	    MTK_WED_WPDMA_GLO_CFG_TX_DRV_BUSY)
-		return true;
-
-	if (wed_r32(dev, MTK_WED_CTRL) & MTK_WED_CTRL_WDMA_INT_AGENT_BUSY)
-		return true;
-
-	if (wed_r32(dev, MTK_WED_WDMA_GLO_CFG) &
-	    MTK_WED_WDMA_GLO_CFG_RX_DRV_BUSY)
-		return true;
-
-	if (wdma_r32(dev, MTK_WDMA_GLO_CFG) &
-	    MTK_WED_WDMA_GLO_CFG_RX_DRV_BUSY)
-		return true;
-
-	if (wed_r32(dev, MTK_WED_CTRL) &
-	    (MTK_WED_CTRL_WED_TX_BM_BUSY | MTK_WED_CTRL_WED_TX_FREE_AGENT_BUSY))
-		return true;
-
-	return false;
+	return !!(wed_r32(dev, reg) & mask);
 }
 
 static int
-mtk_wed_poll_busy(struct mtk_wed_device *dev)
+mtk_wed_poll_busy(struct mtk_wed_device *dev, u32 reg, u32 mask)
 {
 	int sleep = 15000;
 	int timeout = 100 * sleep;
 	u32 val;
 
 	return read_poll_timeout(mtk_wed_check_busy, val, !val, sleep,
-				 timeout, false, dev);
+				 timeout, false, dev, reg, mask);
+}
+
+static int
+mtk_wed_rx_reset(struct mtk_wed_device *dev)
+{
+	struct mtk_wed_wo *wo = dev->hw->wed_wo;
+	u8 val = MTK_WED_WO_STATE_SER_RESET;
+	int i, ret;
+
+	ret = mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO,
+				   MTK_WED_WO_CMD_CHANGE_STATE, &val,
+				   sizeof(val), true);
+	if (ret)
+		return ret;
+
+	wed_clr(dev, MTK_WED_WPDMA_RX_D_GLO_CFG, MTK_WED_WPDMA_RX_D_RX_DRV_EN);
+	ret = mtk_wed_poll_busy(dev, MTK_WED_WPDMA_RX_D_GLO_CFG,
+				MTK_WED_WPDMA_RX_D_RX_DRV_BUSY);
+	if (ret) {
+		mtk_wed_reset(dev, MTK_WED_RESET_WPDMA_INT_AGENT);
+		mtk_wed_reset(dev, MTK_WED_RESET_WPDMA_RX_D_DRV);
+	} else {
+		wed_w32(dev, MTK_WED_WPDMA_RX_D_RST_IDX,
+			MTK_WED_WPDMA_RX_D_RST_CRX_IDX |
+			MTK_WED_WPDMA_RX_D_RST_DRV_IDX);
+
+		wed_set(dev, MTK_WED_WPDMA_RX_D_GLO_CFG,
+			MTK_WED_WPDMA_RX_D_RST_INIT_COMPLETE |
+			MTK_WED_WPDMA_RX_D_FSM_RETURN_IDLE);
+		wed_clr(dev, MTK_WED_WPDMA_RX_D_GLO_CFG,
+			MTK_WED_WPDMA_RX_D_RST_INIT_COMPLETE |
+			MTK_WED_WPDMA_RX_D_FSM_RETURN_IDLE);
+
+		wed_w32(dev, MTK_WED_WPDMA_RX_D_RST_IDX, 0);
+	}
+
+	/* reset rro qm */
+	wed_clr(dev, MTK_WED_CTRL, MTK_WED_CTRL_RX_RRO_QM_EN);
+	ret = mtk_wed_poll_busy(dev, MTK_WED_CTRL,
+				MTK_WED_CTRL_RX_RRO_QM_BUSY);
+	if (ret) {
+		mtk_wed_reset(dev, MTK_WED_RESET_RX_RRO_QM);
+	} else {
+		wed_set(dev, MTK_WED_RROQM_RST_IDX,
+			MTK_WED_RROQM_RST_IDX_MIOD |
+			MTK_WED_RROQM_RST_IDX_FDBK);
+		wed_w32(dev, MTK_WED_RROQM_RST_IDX, 0);
+	}
+
+	/* reset route qm */
+	wed_clr(dev, MTK_WED_CTRL, MTK_WED_CTRL_RX_ROUTE_QM_EN);
+	ret = mtk_wed_poll_busy(dev, MTK_WED_CTRL,
+				MTK_WED_CTRL_RX_ROUTE_QM_BUSY);
+	if (ret)
+		mtk_wed_reset(dev, MTK_WED_RESET_RX_ROUTE_QM);
+	else
+		wed_set(dev, MTK_WED_RTQM_GLO_CFG,
+			MTK_WED_RTQM_Q_RST);
+
+	/* reset tx wdma */
+	mtk_wdma_tx_reset(dev);
+
+	/* reset tx wdma drv */
+	wed_clr(dev, MTK_WED_WDMA_GLO_CFG, MTK_WED_WDMA_GLO_CFG_TX_DRV_EN);
+	mtk_wed_poll_busy(dev, MTK_WED_CTRL,
+			  MTK_WED_CTRL_WDMA_INT_AGENT_BUSY);
+	mtk_wed_reset(dev, MTK_WED_RESET_WDMA_TX_DRV);
+
+	/* reset wed rx dma */
+	ret = mtk_wed_poll_busy(dev, MTK_WED_GLO_CFG,
+				MTK_WED_GLO_CFG_RX_DMA_BUSY);
+	wed_clr(dev, MTK_WED_GLO_CFG, MTK_WED_GLO_CFG_RX_DMA_EN);
+	if (ret) {
+		mtk_wed_reset(dev, MTK_WED_RESET_WED_RX_DMA);
+	} else {
+		struct mtk_eth *eth = dev->hw->eth;
+
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
+			wed_set(dev, MTK_WED_RESET_IDX,
+				MTK_WED_RESET_IDX_RX_V2);
+		else
+			wed_set(dev, MTK_WED_RESET_IDX, MTK_WED_RESET_IDX_RX);
+		wed_w32(dev, MTK_WED_RESET_IDX, 0);
+	}
+
+	/* reset rx bm */
+	wed_clr(dev, MTK_WED_CTRL, MTK_WED_CTRL_WED_RX_BM_EN);
+	mtk_wed_poll_busy(dev, MTK_WED_CTRL,
+			  MTK_WED_CTRL_WED_RX_BM_BUSY);
+	mtk_wed_reset(dev, MTK_WED_RESET_RX_BM);
+
+	/* wo change to enable state */
+	val = MTK_WED_WO_STATE_ENABLE;
+	ret = mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO,
+				   MTK_WED_WO_CMD_CHANGE_STATE, &val,
+				   sizeof(val), true);
+	if (ret)
+		return ret;
+
+	/* wed_rx_ring_reset */
+	for (i = 0; i < ARRAY_SIZE(dev->rx_ring); i++) {
+		if (!dev->rx_ring[i].desc)
+			continue;
+
+		mtk_wed_ring_reset(&dev->rx_ring[i], MTK_WED_RX_RING_SIZE,
+				   false);
+	}
+	mtk_wed_free_rx_buffer(dev);
+
+	return 0;
 }
 
 static void
@@ -997,19 +1085,23 @@ mtk_wed_reset_dma(struct mtk_wed_device *dev)
 				   true);
 	}
 
-	if (mtk_wed_poll_busy(dev))
-		busy = mtk_wed_check_busy(dev);
-
+	/* 1. reset WED tx DMA */
+	wed_clr(dev, MTK_WED_GLO_CFG, MTK_WED_GLO_CFG_TX_DMA_EN);
+	busy = mtk_wed_poll_busy(dev, MTK_WED_GLO_CFG,
+				 MTK_WED_GLO_CFG_TX_DMA_BUSY);
 	if (busy) {
 		mtk_wed_reset(dev, MTK_WED_RESET_WED_TX_DMA);
 	} else {
-		wed_w32(dev, MTK_WED_RESET_IDX,
-			MTK_WED_RESET_IDX_TX |
-			MTK_WED_RESET_IDX_RX);
+		wed_w32(dev, MTK_WED_RESET_IDX, MTK_WED_RESET_IDX_TX);
 		wed_w32(dev, MTK_WED_RESET_IDX, 0);
 	}
 
-	mtk_wdma_rx_reset(dev);
+	/* 2. reset WDMA rx DMA */
+	busy = !!mtk_wdma_rx_reset(dev);
+	wed_clr(dev, MTK_WED_WDMA_GLO_CFG, MTK_WED_WDMA_GLO_CFG_RX_DRV_EN);
+	if (!busy)
+		busy = mtk_wed_poll_busy(dev, MTK_WED_WDMA_GLO_CFG,
+					 MTK_WED_WDMA_GLO_CFG_RX_DRV_BUSY);
 
 	if (busy) {
 		mtk_wed_reset(dev, MTK_WED_RESET_WDMA_INT_AGENT);
@@ -1026,6 +1118,9 @@ mtk_wed_reset_dma(struct mtk_wed_device *dev)
 			MTK_WED_WDMA_GLO_CFG_RST_INIT_COMPLETE);
 	}
 
+	/* 3. reset WED WPDMA tx */
+	wed_clr(dev, MTK_WED_CTRL, MTK_WED_CTRL_WED_TX_FREE_AGENT_EN);
+
 	for (i = 0; i < 100; i++) {
 		val = wed_r32(dev, MTK_WED_TX_BM_INTF);
 		if (FIELD_GET(MTK_WED_TX_BM_INTF_TKFIFO_FDEP, val) == 0x40)
@@ -1033,8 +1128,19 @@ mtk_wed_reset_dma(struct mtk_wed_device *dev)
 	}
 
 	mtk_wed_reset(dev, MTK_WED_RESET_TX_FREE_AGENT);
+	wed_clr(dev, MTK_WED_CTRL, MTK_WED_CTRL_WED_TX_BM_EN);
 	mtk_wed_reset(dev, MTK_WED_RESET_TX_BM);
 
+	/* 4. reset WED WPDMA tx */
+	busy = mtk_wed_poll_busy(dev, MTK_WED_WPDMA_GLO_CFG,
+				 MTK_WED_WPDMA_GLO_CFG_TX_DRV_BUSY);
+	wed_clr(dev, MTK_WED_WPDMA_GLO_CFG,
+		MTK_WED_WPDMA_GLO_CFG_TX_DRV_EN |
+		MTK_WED_WPDMA_GLO_CFG_RX_DRV_EN);
+	if (!busy)
+		busy = mtk_wed_poll_busy(dev, MTK_WED_WPDMA_GLO_CFG,
+					 MTK_WED_WPDMA_GLO_CFG_RX_DRV_BUSY);
+
 	if (busy) {
 		mtk_wed_reset(dev, MTK_WED_RESET_WPDMA_INT_AGENT);
 		mtk_wed_reset(dev, MTK_WED_RESET_WPDMA_TX_DRV);
@@ -1045,6 +1151,17 @@ mtk_wed_reset_dma(struct mtk_wed_device *dev)
 			MTK_WED_WPDMA_RESET_IDX_RX);
 		wed_w32(dev, MTK_WED_WPDMA_RESET_IDX, 0);
 	}
+
+	dev->init_done = false;
+	if (dev->hw->version == 1)
+		return;
+
+	if (!busy) {
+		wed_w32(dev, MTK_WED_RESET_IDX, MTK_WED_RESET_WPDMA_IDX_RX);
+		wed_w32(dev, MTK_WED_RESET_IDX, 0);
+	}
+
+	mtk_wed_rx_reset(dev);
 }
 
 static int
@@ -1267,6 +1384,9 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 {
 	int i;
 
+	if (mtk_wed_get_rx_capa(dev) && mtk_wed_rx_buffer_alloc(dev))
+		return;
+
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
 		if (!dev->rx_wdma[i].desc)
 			mtk_wed_wdma_rx_ring_setup(dev, i, 16);
@@ -1354,10 +1474,6 @@ mtk_wed_attach(struct mtk_wed_device *dev)
 		goto out;
 
 	if (mtk_wed_get_rx_capa(dev)) {
-		ret = mtk_wed_rx_buffer_alloc(dev);
-		if (ret)
-			goto out;
-
 		ret = mtk_wed_rro_alloc(dev);
 		if (ret)
 			goto out;
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_regs.h b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
index 9e39dace95eb..e3ac7b49731c 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_regs.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
@@ -22,11 +22,15 @@ struct mtk_wdma_desc {
 
 #define MTK_WED_RESET					0x008
 #define MTK_WED_RESET_TX_BM				BIT(0)
+#define MTK_WED_RESET_RX_BM				BIT(1)
 #define MTK_WED_RESET_TX_FREE_AGENT			BIT(4)
 #define MTK_WED_RESET_WPDMA_TX_DRV			BIT(8)
 #define MTK_WED_RESET_WPDMA_RX_DRV			BIT(9)
+#define MTK_WED_RESET_WPDMA_RX_D_DRV			BIT(10)
 #define MTK_WED_RESET_WPDMA_INT_AGENT			BIT(11)
 #define MTK_WED_RESET_WED_TX_DMA			BIT(12)
+#define MTK_WED_RESET_WED_RX_DMA			BIT(13)
+#define MTK_WED_RESET_WDMA_TX_DRV			BIT(16)
 #define MTK_WED_RESET_WDMA_RX_DRV			BIT(17)
 #define MTK_WED_RESET_WDMA_INT_AGENT			BIT(19)
 #define MTK_WED_RESET_RX_RRO_QM				BIT(20)
@@ -156,6 +160,8 @@ struct mtk_wdma_desc {
 #define MTK_WED_RESET_IDX				0x20c
 #define MTK_WED_RESET_IDX_TX				GENMASK(3, 0)
 #define MTK_WED_RESET_IDX_RX				GENMASK(17, 16)
+#define MTK_WED_RESET_IDX_RX_V2				GENMASK(7, 6)
+#define MTK_WED_RESET_WPDMA_IDX_RX			GENMASK(31, 30)
 
 #define MTK_WED_TX_MIB(_n)				(0x2a0 + (_n) * 4)
 #define MTK_WED_RX_MIB(_n)				(0x2e0 + (_n) * 4)
@@ -265,6 +271,9 @@ struct mtk_wdma_desc {
 
 #define MTK_WED_WPDMA_RX_D_GLO_CFG			0x75c
 #define MTK_WED_WPDMA_RX_D_RX_DRV_EN			BIT(0)
+#define MTK_WED_WPDMA_RX_D_RX_DRV_BUSY			BIT(1)
+#define MTK_WED_WPDMA_RX_D_FSM_RETURN_IDLE		BIT(3)
+#define MTK_WED_WPDMA_RX_D_RST_INIT_COMPLETE		BIT(4)
 #define MTK_WED_WPDMA_RX_D_INIT_PHASE_RXEN_SEL		GENMASK(11, 7)
 #define MTK_WED_WPDMA_RX_D_RXD_READ_LEN			GENMASK(31, 24)
 
-- 
2.38.1



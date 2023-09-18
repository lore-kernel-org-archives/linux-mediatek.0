Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859F2CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRc+KukiTZSYs7yeDqy01HDwmZw6d0jiUY7WgouJyiw=; b=bwltwQHUjaMLNZiOziMzvjJbUM
	UrVY+pNoLrAN+YS5QKkAygGSd52kSjGJDF97CplZCmR+bjgrNpC7amngEgJ7N73j8/52BLqSk14g+
	WUWEG3DCR/UFe4tgunH8Uy83t6SQHgMUuIdoUvFLSi2IooWqg8eHC/WNe68sXvDfDrnctbYxXGkTc
	lj6gjKGTXnPn++KYjmHE2qSlNaojZaJ1eOUKJ+YpIL1hZsMqMGZyGSHqR3K53cr5p4DWMxYQ2FwR7
	HIZQtqfHyevVZX0SaVMKSlMYapAQpJ6+LncrN2Q/1GebCYZfcxw5oQWuMFiWgZFCrBAxXFicP7DBZ
	+6qMrL8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWX-00F8H2-1Z;
	Mon, 18 Sep 2023 10:30:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWT-00F8Co-1m
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2D6B9B80B4E;
	Mon, 18 Sep 2023 10:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1FBC433C7;
	Mon, 18 Sep 2023 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695033031;
	bh=ffCd2VEC1GPMGZ9Vk37dImPu0FNNQi+6tk57Xkt+BoY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VDxORH2wnW/HOUPfSR+c16g4CeQqLTV+UWF7cViqG20DQd57QFrQWKqJYs2WasrmV
	 qoDIOg2lTbY8TE6XiD2C9rDnpYreJsq/0fBX9vJFuM1N1d3FTuxatvtXdxP6SYpjHS
	 If2o0vhR5Nj6dI3YdEI4aoxI3bLT2iQr/Nc411u6eUkSBWp3r2jNg7cFeBCe33H9Jd
	 V/aQOiXATwexs5vFzFmjnz3Su6Xs2bOGXPUGKFGFZvPf+WMADv2HGxVaiiu3mKpeJ1
	 6ZpZTxwS+z6Tf+7+j4/8cC5bfIlfFWqLb1SQXBQhtCzSjbBiKVq+HPo7VNkeNuZssa
	 23Oeqg+h1muvA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	horms@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 10/17] net: ethernet: mtk_wed: add mtk_wed_soc_data structure
Date: Mon, 18 Sep 2023 12:29:12 +0200
Message-ID: <8516913a28d4b2bb6092a1b60412aa44b219331d.1695032291.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033033_878459_092CB960 
X-CRM114-Status: GOOD (  14.19  )
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

Introduce mtk_wed_soc_data utility structure to contain per-SoC
definitions.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c      | 66 ++++++++++++--------
 drivers/net/ethernet/mediatek/mtk_wed.h      | 11 ++++
 drivers/net/ethernet/mediatek/mtk_wed_regs.h |  6 --
 3 files changed, 51 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 592e497984e3..c2ff2d6405f6 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -49,6 +49,26 @@ struct mtk_wed_flow_block_priv {
 	struct net_device *dev;
 };
 
+static const struct mtk_wed_soc_data mt7622_data = {
+	.regmap = {
+		.tx_bm_tkid		= 0x088,
+		.wpdma_rx_ring0		= 0x770,
+		.reset_idx_tx_mask	= GENMASK(3, 0),
+		.reset_idx_rx_mask	= GENMASK(17, 16),
+	},
+	.wdma_desc_size = sizeof(struct mtk_wdma_desc),
+};
+
+static const struct mtk_wed_soc_data mt7986_data = {
+	.regmap = {
+		.tx_bm_tkid		= 0x0c8,
+		.wpdma_rx_ring0		= 0x770,
+		.reset_idx_tx_mask	= GENMASK(1, 0),
+		.reset_idx_rx_mask	= GENMASK(7, 6),
+	},
+	.wdma_desc_size = 2 * sizeof(struct mtk_wdma_desc),
+};
+
 static void
 wed_m32(struct mtk_wed_device *dev, u32 reg, u32 mask, u32 val)
 {
@@ -747,7 +767,7 @@ mtk_wed_set_wpdma(struct mtk_wed_device *dev)
 		return;
 
 	wed_w32(dev, MTK_WED_WPDMA_RX_GLO_CFG, dev->wlan.wpdma_rx_glo);
-	wed_w32(dev, MTK_WED_WPDMA_RX_RING, dev->wlan.wpdma_rx);
+	wed_w32(dev, dev->hw->soc->regmap.wpdma_rx_ring0, dev->wlan.wpdma_rx);
 }
 
 static void
@@ -941,22 +961,10 @@ mtk_wed_hw_init(struct mtk_wed_device *dev)
 	wed_w32(dev, MTK_WED_TX_BM_BUF_LEN, MTK_WED_PKT_SIZE);
 
 	if (mtk_wed_is_v1(dev->hw)) {
-		wed_w32(dev, MTK_WED_TX_BM_TKID,
-			FIELD_PREP(MTK_WED_TX_BM_TKID_START,
-				   dev->wlan.token_start) |
-			FIELD_PREP(MTK_WED_TX_BM_TKID_END,
-				   dev->wlan.token_start +
-				   dev->wlan.nbuf - 1));
 		wed_w32(dev, MTK_WED_TX_BM_DYN_THR,
 			FIELD_PREP(MTK_WED_TX_BM_DYN_THR_LO, 1) |
 			MTK_WED_TX_BM_DYN_THR_HI);
 	} else {
-		wed_w32(dev, MTK_WED_TX_BM_TKID_V2,
-			FIELD_PREP(MTK_WED_TX_BM_TKID_START,
-				   dev->wlan.token_start) |
-			FIELD_PREP(MTK_WED_TX_BM_TKID_END,
-				   dev->wlan.token_start +
-				   dev->wlan.nbuf - 1));
 		wed_w32(dev, MTK_WED_TX_BM_DYN_THR,
 			FIELD_PREP(MTK_WED_TX_BM_DYN_THR_LO_V2, 0) |
 			MTK_WED_TX_BM_DYN_THR_HI_V2);
@@ -971,6 +979,11 @@ mtk_wed_hw_init(struct mtk_wed_device *dev)
 			MTK_WED_TX_TKID_DYN_THR_HI);
 	}
 
+	wed_w32(dev, dev->hw->soc->regmap.tx_bm_tkid,
+		FIELD_PREP(MTK_WED_TX_BM_TKID_START, dev->wlan.token_start) |
+		FIELD_PREP(MTK_WED_TX_BM_TKID_END,
+			   dev->wlan.token_start + dev->wlan.nbuf - 1));
+
 	mtk_wed_reset(dev, MTK_WED_RESET_TX_BM);
 
 	if (mtk_wed_is_v1(dev->hw)) {
@@ -1105,13 +1118,8 @@ mtk_wed_rx_reset(struct mtk_wed_device *dev)
 	if (ret) {
 		mtk_wed_reset(dev, MTK_WED_RESET_WED_RX_DMA);
 	} else {
-		struct mtk_eth *eth = dev->hw->eth;
-
-		if (mtk_is_netsys_v2_or_greater(eth))
-			wed_set(dev, MTK_WED_RESET_IDX,
-				MTK_WED_RESET_IDX_RX_V2);
-		else
-			wed_set(dev, MTK_WED_RESET_IDX, MTK_WED_RESET_IDX_RX);
+		wed_set(dev, MTK_WED_RESET_IDX,
+			dev->hw->soc->regmap.reset_idx_rx_mask);
 		wed_w32(dev, MTK_WED_RESET_IDX, 0);
 	}
 
@@ -1164,7 +1172,8 @@ mtk_wed_reset_dma(struct mtk_wed_device *dev)
 	if (busy) {
 		mtk_wed_reset(dev, MTK_WED_RESET_WED_TX_DMA);
 	} else {
-		wed_w32(dev, MTK_WED_RESET_IDX, MTK_WED_RESET_IDX_TX);
+		wed_w32(dev, MTK_WED_RESET_IDX,
+			dev->hw->soc->regmap.reset_idx_tx_mask);
 		wed_w32(dev, MTK_WED_RESET_IDX, 0);
 	}
 
@@ -1256,7 +1265,6 @@ static int
 mtk_wed_wdma_rx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 			   bool reset)
 {
-	u32 desc_size = sizeof(struct mtk_wdma_desc) * dev->hw->version;
 	struct mtk_wed_ring *wdma;
 
 	if (idx >= ARRAY_SIZE(dev->rx_wdma))
@@ -1264,7 +1272,7 @@ mtk_wed_wdma_rx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 
 	wdma = &dev->rx_wdma[idx];
 	if (!reset && mtk_wed_ring_alloc(dev, wdma, MTK_WED_WDMA_RING_SIZE,
-					 desc_size, true))
+					 dev->hw->soc->wdma_desc_size, true))
 		return -ENOMEM;
 
 	wdma_w32(dev, MTK_WDMA_RING_RX(idx) + MTK_WED_RING_OFS_BASE,
@@ -1285,7 +1293,6 @@ static int
 mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 			   bool reset)
 {
-	u32 desc_size = sizeof(struct mtk_wdma_desc) * dev->hw->version;
 	struct mtk_wed_ring *wdma;
 
 	if (idx >= ARRAY_SIZE(dev->tx_wdma))
@@ -1293,7 +1300,7 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 
 	wdma = &dev->tx_wdma[idx];
 	if (!reset && mtk_wed_ring_alloc(dev, wdma, MTK_WED_WDMA_RING_SIZE,
-					 desc_size, true))
+					 dev->hw->soc->wdma_desc_size, true))
 		return -ENOMEM;
 
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_BASE,
@@ -1932,7 +1939,12 @@ void mtk_wed_add_hw(struct device_node *np, struct mtk_eth *eth,
 	hw->irq = irq;
 	hw->version = eth->soc->version;
 
-	if (mtk_wed_is_v1(hw)) {
+	switch (hw->version) {
+	case 2:
+		hw->soc = &mt7986_data;
+		break;
+	default:
+	case 1:
 		hw->mirror = syscon_regmap_lookup_by_phandle(eth_np,
 				"mediatek,pcie-mirror");
 		hw->hifsys = syscon_regmap_lookup_by_phandle(eth_np,
@@ -1946,6 +1958,8 @@ void mtk_wed_add_hw(struct device_node *np, struct mtk_eth *eth,
 			regmap_write(hw->mirror, 0, 0);
 			regmap_write(hw->mirror, 4, 0);
 		}
+		hw->soc = &mt7622_data;
+		break;
 	}
 
 	mtk_wed_hw_add_debugfs(hw);
diff --git a/drivers/net/ethernet/mediatek/mtk_wed.h b/drivers/net/ethernet/mediatek/mtk_wed.h
index 6f5db891a6b9..afaf5a46fbb3 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed.h
@@ -12,7 +12,18 @@
 struct mtk_eth;
 struct mtk_wed_wo;
 
+struct mtk_wed_soc_data {
+	struct {
+		u32 tx_bm_tkid;
+		u32 wpdma_rx_ring0;
+		u32 reset_idx_tx_mask;
+		u32 reset_idx_rx_mask;
+	} regmap;
+	u32 wdma_desc_size;
+};
+
 struct mtk_wed_hw {
+	const struct mtk_wed_soc_data *soc;
 	struct device_node *node;
 	struct mtk_eth *eth;
 	struct regmap *regs;
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_regs.h b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
index f87ab9b8a590..2253f4eb5bc1 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_regs.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
@@ -100,8 +100,6 @@ struct mtk_wdma_desc {
 
 #define MTK_WED_TX_BM_BASE				0x084
 
-#define MTK_WED_TX_BM_TKID				0x088
-#define MTK_WED_TX_BM_TKID_V2				0x0c8
 #define MTK_WED_TX_BM_TKID_START			GENMASK(15, 0)
 #define MTK_WED_TX_BM_TKID_END				GENMASK(31, 16)
 
@@ -160,9 +158,6 @@ struct mtk_wdma_desc {
 #define MTK_WED_GLO_CFG_RX_2B_OFFSET			BIT(31)
 
 #define MTK_WED_RESET_IDX				0x20c
-#define MTK_WED_RESET_IDX_TX				GENMASK(3, 0)
-#define MTK_WED_RESET_IDX_RX				GENMASK(17, 16)
-#define MTK_WED_RESET_IDX_RX_V2				GENMASK(7, 6)
 #define MTK_WED_RESET_WPDMA_IDX_RX			GENMASK(31, 30)
 
 #define MTK_WED_TX_MIB(_n)				(0x2a0 + (_n) * 4)
@@ -286,7 +281,6 @@ struct mtk_wdma_desc {
 #define MTK_WED_WPDMA_RX_D_RST_DRV_IDX			GENMASK(25, 24)
 
 #define MTK_WED_WPDMA_RX_GLO_CFG			0x76c
-#define MTK_WED_WPDMA_RX_RING				0x770
 
 #define MTK_WED_WPDMA_RX_D_MIB(_n)			(0x774 + (_n) * 4)
 #define MTK_WED_WPDMA_RX_D_PROCESSED_MIB(_n)		(0x784 + (_n) * 4)
-- 
2.41.0



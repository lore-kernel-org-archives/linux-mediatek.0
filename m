Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E61FEE4996
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJsd8pUCjF5eWsFXdp/eCubSeiHSJN/TgKYSuI3/xsY=; b=h9K/rbIC0uoAeKBloz8agPPy+1
	7HVaduWwRmaXUtGBeAAF++owJOU8X9WlcqrhYy97c3QgBCopa6v/uZnhpxQxtWJeZfu10oj0J8foz
	QvZ3utD2D11S1jmateF2o3vVy3K/kGLQyk00Ibujjy5xsQb085s9qZr7LMC4uorBmviumdGF8xXGe
	h9au1hmoam/HE8iFBz5SAlJaDFwGbyTbo+/blV05LE3xcMMRtbAVylicR6gZNnzLJYATrwvEFM9GQ
	CnC0vmFx06W0UP93EYFNa7l2YsAj7t+cPKpJhUQ/btPoa5HwEybMsRABP2LJbjRc+F3BY+/EIkr7g
	vfof3f1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUK1-00GVDj-2b;
	Tue, 22 Aug 2023 16:33:37 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUJr-00GV8K-2m;
	Tue, 22 Aug 2023 16:33:29 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qYUJi-0000JD-2K;
	Tue, 22 Aug 2023 16:33:18 +0000
Date: Tue, 22 Aug 2023 17:33:12 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 4/4] net: ethernet: mtk_eth_soc: support 36-bit
 DMA addressing on MT7988
Message-ID: <95b919c98876c9e49761e44662e7c937479eecb8.1692721443.git.daniel@makrotopia.org>
References: <cover.1692721443.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1692721443.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_093327_904561_C98CA3BE 
X-CRM114-Status: GOOD (  16.08  )
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

Systems having 4 GiB of RAM and more require DMA addressing beyond the
current 32-bit limit. Starting from MT7988 the hardware now supports
36-bit DMA addressing, let's use that new capability in the driver to
avoid running into swiotlb on systems with 4 GiB of RAM or more.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 30 +++++++++++++++++++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 22 +++++++++++++--
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index ec6a251a0f026..6ad42e3b488f7 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1328,6 +1328,10 @@ static void mtk_tx_set_dma_desc_v2(struct net_device *dev, void *txd,
 	data = TX_DMA_PLEN0(info->size);
 	if (info->last)
 		data |= TX_DMA_LS0;
+
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
+		data |= TX_DMA_PREP_ADDR64(info->addr);
+
 	WRITE_ONCE(desc->txd3, data);
 
 	 /* set forward port */
@@ -1997,6 +2001,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 	bool xdp_flush = false;
 	int idx;
 	struct sk_buff *skb;
+	u64 addr64 = 0;
 	u8 *data, *new_data;
 	struct mtk_rx_dma_v2 *rxd, trxd;
 	int done = 0, bytes = 0;
@@ -2112,7 +2117,10 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 				goto release_desc;
 			}
 
-			dma_unmap_single(eth->dma_dev, trxd.rxd1,
+			if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
+				addr64 = RX_DMA_GET_ADDR64(trxd.rxd2);
+
+			dma_unmap_single(eth->dma_dev, ((u64)trxd.rxd1 | addr64),
 					 ring->buf_size, DMA_FROM_DEVICE);
 
 			skb = build_skb(data, ring->frag_size);
@@ -2178,6 +2186,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		else
 			rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size);
 
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
+			rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
+
 		ring->calc_idx = idx;
 		done++;
 	}
@@ -2670,6 +2681,9 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 		else
 			rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size);
 
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
+			rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
+
 		rxd->rxd3 = 0;
 		rxd->rxd4 = 0;
 		if (mtk_is_netsys_v2_or_greater(eth)) {
@@ -2716,6 +2730,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 
 static void mtk_rx_clean(struct mtk_eth *eth, struct mtk_rx_ring *ring, bool in_sram)
 {
+	u64 addr64 = 0;
 	int i;
 
 	if (ring->data && ring->dma) {
@@ -2729,7 +2744,10 @@ static void mtk_rx_clean(struct mtk_eth *eth, struct mtk_rx_ring *ring, bool in_
 			if (!rxd->rxd1)
 				continue;
 
-			dma_unmap_single(eth->dma_dev, rxd->rxd1,
+			if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
+				addr64 = RX_DMA_GET_ADDR64(rxd->rxd2);
+
+			dma_unmap_single(eth->dma_dev, ((u64)rxd->rxd1 | addr64),
 					 ring->buf_size, DMA_FROM_DEVICE);
 			mtk_rx_put_buff(ring, ring->data[i], false);
 		}
@@ -4734,6 +4752,14 @@ static int mtk_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
+		err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
+		if (err) {
+			dev_err(&pdev->dev, "Wrong DMA config\n");
+			return -EINVAL;
+		}
+	}
+
 	spin_lock_init(&eth->page_lock);
 	spin_lock_init(&eth->tx_irq_lock);
 	spin_lock_init(&eth->rx_irq_lock);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 7e961fff94f35..403219d987eff 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -331,6 +331,14 @@
 #define TX_DMA_PLEN1(x)		((x) & eth->soc->txrx.dma_max_len)
 #define TX_DMA_SWC		BIT(14)
 #define TX_DMA_PQID		GENMASK(3, 0)
+#define TX_DMA_ADDR64_MASK	GENMASK(3, 0)
+#if IS_ENABLED(CONFIG_64BIT)
+# define TX_DMA_GET_ADDR64(x)	(((u64)FIELD_GET(TX_DMA_ADDR64_MASK, (x))) << 32)
+# define TX_DMA_PREP_ADDR64(x)	FIELD_PREP(TX_DMA_ADDR64_MASK, ((x) >> 32))
+#else
+# define TX_DMA_GET_ADDR64(x)	(0)
+# define TX_DMA_PREP_ADDR64(x)	(0)
+#endif
 
 /* PDMA on MT7628 */
 #define TX_DMA_DONE		BIT(31)
@@ -343,6 +351,14 @@
 #define RX_DMA_PREP_PLEN0(x)	(((x) & eth->soc->txrx.dma_max_len) << eth->soc->txrx.dma_len_offset)
 #define RX_DMA_GET_PLEN0(x)	(((x) >> eth->soc->txrx.dma_len_offset) & eth->soc->txrx.dma_max_len)
 #define RX_DMA_VTAG		BIT(15)
+#define RX_DMA_ADDR64_MASK	GENMASK(3, 0)
+#if IS_ENABLED(CONFIG_64BIT)
+# define RX_DMA_GET_ADDR64(x)	(((u64)FIELD_GET(RX_DMA_ADDR64_MASK, (x))) << 32)
+# define RX_DMA_PREP_ADDR64(x)	FIELD_PREP(RX_DMA_ADDR64_MASK, ((x) >> 32))
+#else
+# define RX_DMA_GET_ADDR64(x)	(0)
+# define RX_DMA_PREP_ADDR64(x)	(0)
+#endif
 
 /* QDMA descriptor rxd3 */
 #define RX_DMA_VID(x)		((x) & VLAN_VID_MASK)
@@ -942,6 +958,7 @@ enum mkt_eth_capabilities {
 	MTK_RSTCTRL_PPE2_BIT,
 	MTK_U3_COPHY_V2_BIT,
 	MTK_SRAM_BIT,
+	MTK_36BIT_DMA_BIT,
 
 	/* MUX BITS*/
 	MTK_ETH_MUX_GDM1_TO_GMAC1_ESW_BIT,
@@ -978,6 +995,7 @@ enum mkt_eth_capabilities {
 #define MTK_RSTCTRL_PPE2	BIT_ULL(MTK_RSTCTRL_PPE2_BIT)
 #define MTK_U3_COPHY_V2		BIT_ULL(MTK_U3_COPHY_V2_BIT)
 #define MTK_SRAM		BIT_ULL(MTK_SRAM_BIT)
+#define MTK_36BIT_DMA	BIT_ULL(MTK_36BIT_DMA_BIT)
 
 #define MTK_ETH_MUX_GDM1_TO_GMAC1_ESW		\
 	BIT_ULL(MTK_ETH_MUX_GDM1_TO_GMAC1_ESW_BIT)
@@ -1059,8 +1077,8 @@ enum mkt_eth_capabilities {
 		      MTK_MUX_GMAC12_TO_GEPHY_SGMII | MTK_QDMA | \
 		      MTK_RSTCTRL_PPE1 | MTK_SRAM)
 
-#define MT7988_CAPS  (MTK_GDM1_ESW | MTK_QDMA | MTK_RSTCTRL_PPE1 | \
-		      MTK_RSTCTRL_PPE2 | MTK_SRAM)
+#define MT7988_CAPS  (MTK_36BIT_DMA | MTK_GDM1_ESW | MTK_QDMA | \
+		      MTK_RSTCTRL_PPE1 | MTK_RSTCTRL_PPE2 | MTK_SRAM)
 
 struct mtk_tx_dma_desc_info {
 	dma_addr_t	addr;
-- 
2.41.0


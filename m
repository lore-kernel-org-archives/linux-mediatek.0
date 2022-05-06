Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EF0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saaOaOKpIVB+Uu4DLOaqV2jO8+e25DWKEPFM5hLKAfY=; b=ioVF11jS+OAyQy
	D+zIkVSNh2NKJX2O5h8qEqKvCYrmN01DmrgW8ju1RbwyVUqv0/9RqtrUnK3VaRz3/WDgb0A/38CDH
	zT0gMYvGTf92CCe8rUoH9SYcaqP9Hwpbxm70Y+DNXIcsKbwonhVeJmvfsNgiAksuTYl8Dz4MSsHG+
	DjUpL50682FgoDLtiwJq8Nc0E1vIMQ3e68ztSiJP3ZyMUW8zvgVDmEowUlxebwD7X4v1gXkUmBncb
	FsnVHfPj2w22QVBltTOIs1CjGaGToK1O0yqVB3O/vOvDrNfunNG0VUhSwPzJpmq62P65lfwLpn5EF
	V2uWBO7lk68e0zSFuO8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmx7b-003BYA-2N; Fri, 06 May 2022 12:31:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmx7Y-003BVA-Jh
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 12:31:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1207C61F80;
 Fri,  6 May 2022 12:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCC3C385AA;
 Fri,  6 May 2022 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651840303;
 bh=39XwBj5Nfy2SdjZkpvZt8V0B6JaWYoGl8H9nrQ1zXjU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PmMPjVy/a9QjFQ9FQxMhl4z1ew6xD9CA0o1HeDLWqSj9gKbjgrOFkfCSBJ2vu+F8X
 48qI9jtaHYcKKWL5GNl46Hgo0i5pRnT0ghbZLhspjDuGZo2FyWvoWjRCGpWgNcC3S+
 F6j20oPBSJnAwHkKG/f4idyiHyXtOF86NjZEEajpw/h3jUUL4ZKW/RYZEwXCrpYmg3
 O/QX7cD+do/CuwlxUK8YwzS5yUuQGX0uLbvrbIpapHP5crJ0BGt323SEseCfhWo1Nh
 DkCaMyFECwb+LKKNYXPZMRSvTrwv2OFkr2U/k96Af+Bhue2EOQ9d7foDU69azacLSn
 5EeDR1/sT8YuA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
Subject: [PATCH net-next 11/14] net: ethernet: mtk_eth_soc: add SRAM soc
 capability
Date: Fri,  6 May 2022 14:30:28 +0200
Message-Id: <97298a5aeaa7498893a46103de929d0a7df26e8a.1651839494.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651839494.git.lorenzo@kernel.org>
References: <cover.1651839494.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_053144_768219_89DA1D85 
X-CRM114-Status: GOOD (  18.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce SRAM capability for devices that relies on SRAM memory
for DMA descriptors.
This is a preliminary patch to add mt7986 ethernet support.

Tested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 71 +++++++++++++++------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  5 ++
 2 files changed, 57 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 1e2fddc2bdcb..68ef9b8d30ce 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -790,10 +790,13 @@ static int mtk_init_fq_dma(struct mtk_eth *eth)
 	dma_addr_t dma_addr;
 	int i;
 
-	eth->scratch_ring = dma_alloc_coherent(eth->dma_dev,
-					       cnt * soc->txrx.txd_size,
-					       &eth->phy_scratch_ring,
-					       GFP_ATOMIC);
+	if (MTK_HAS_CAPS(soc->caps, MTK_SRAM))
+		eth->scratch_ring = eth->base + MTK_ETH_SRAM_OFFSET;
+	else
+		eth->scratch_ring = dma_alloc_coherent(eth->dma_dev,
+						       cnt * soc->txrx.txd_size,
+						       &eth->phy_scratch_ring,
+						       GFP_ATOMIC);
 	if (unlikely(!eth->scratch_ring))
 		return -ENOMEM;
 
@@ -1588,9 +1591,16 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 	if (!ring->buf)
 		goto no_tx_mem;
 
-	ring->dma = dma_alloc_coherent(eth->dma_dev,
-				       MTK_DMA_SIZE * soc->txrx.txd_size,
-				       &ring->phys, GFP_ATOMIC);
+	if (MTK_HAS_CAPS(soc->caps, MTK_SRAM)) {
+		ring->dma =  (void *)eth->scratch_ring +
+			     MTK_DMA_SIZE * soc->txrx.txd_size;
+		ring->phys = eth->phy_scratch_ring +
+			     MTK_DMA_SIZE * soc->txrx.txd_size;
+	} else {
+		ring->dma = dma_alloc_coherent(eth->dma_dev,
+				MTK_DMA_SIZE * soc->txrx.txd_size,
+				&ring->phys, GFP_ATOMIC);
+	}
 	if (!ring->dma)
 		goto no_tx_mem;
 
@@ -1669,7 +1679,7 @@ static void mtk_tx_clean(struct mtk_eth *eth)
 		ring->buf = NULL;
 	}
 
-	if (ring->dma) {
+	if (!MTK_HAS_CAPS(soc->caps, MTK_SRAM) && ring->dma) {
 		dma_free_coherent(eth->dma_dev,
 				  MTK_DMA_SIZE * soc->txrx.txd_size,
 				  ring->dma, ring->phys);
@@ -1686,6 +1696,7 @@ static void mtk_tx_clean(struct mtk_eth *eth)
 
 static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 {
+	const struct mtk_soc_data *soc = eth->soc;
 	struct mtk_rx_ring *ring;
 	int rx_data_len, rx_dma_size;
 	int i;
@@ -1721,9 +1732,20 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 			return -ENOMEM;
 	}
 
-	ring->dma = dma_alloc_coherent(eth->dma_dev,
-				       rx_dma_size * eth->soc->txrx.rxd_size,
-				       &ring->phys, GFP_ATOMIC);
+	if (MTK_HAS_CAPS(soc->caps, MTK_SRAM) &&
+	    rx_flag == MTK_RX_FLAGS_NORMAL) {
+		struct mtk_tx_ring *tx_ring = &eth->tx_ring;
+
+		ring->dma = (void *)tx_ring->dma +
+			    MTK_DMA_SIZE * (ring_no + 1) * soc->txrx.txd_size;
+		ring->phys = tx_ring->phys +
+			     MTK_DMA_SIZE * soc->txrx.txd_size * (ring_no + 1);
+	} else {
+		ring->dma = dma_alloc_coherent(eth->dma_dev,
+					       rx_dma_size * soc->txrx.rxd_size,
+					       &ring->phys, GFP_ATOMIC);
+	}
+
 	if (!ring->dma)
 		return -ENOMEM;
 
@@ -1737,10 +1759,10 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 		if (unlikely(dma_mapping_error(eth->dma_dev, dma_addr)))
 			return -ENOMEM;
 
-		rxd = (void *)ring->dma + i * eth->soc->txrx.rxd_size;
+		rxd = (void *)ring->dma + i * soc->txrx.rxd_size;
 		rxd->rxd1 = (unsigned int)dma_addr;
 
-		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
+		if (MTK_HAS_CAPS(soc->caps, MTK_SOC_MT7628))
 			rxd->rxd2 = RX_DMA_LSO;
 		else
 			rxd->rxd2 = RX_DMA_PLEN0(ring->buf_size);
@@ -1765,7 +1787,8 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 	return 0;
 }
 
-static void mtk_rx_clean(struct mtk_eth *eth, struct mtk_rx_ring *ring)
+static void mtk_rx_clean(struct mtk_eth *eth, struct mtk_rx_ring *ring,
+			 bool sram)
 {
 	int i;
 
@@ -1788,7 +1811,7 @@ static void mtk_rx_clean(struct mtk_eth *eth, struct mtk_rx_ring *ring)
 		ring->data = NULL;
 	}
 
-	if (ring->dma) {
+	if (ring->dma && !sram) {
 		dma_free_coherent(eth->dma_dev,
 				  ring->dma_size * eth->soc->txrx.rxd_size,
 				  ring->dma, ring->phys);
@@ -2141,7 +2164,7 @@ static void mtk_dma_free(struct mtk_eth *eth)
 	for (i = 0; i < MTK_MAC_COUNT; i++)
 		if (eth->netdev[i])
 			netdev_reset_queue(eth->netdev[i]);
-	if (eth->scratch_ring) {
+	if (!MTK_HAS_CAPS(soc->caps, MTK_SRAM) && eth->scratch_ring) {
 		dma_free_coherent(eth->dma_dev,
 				  MTK_DMA_SIZE * soc->txrx.txd_size,
 				  eth->scratch_ring, eth->phy_scratch_ring);
@@ -2149,13 +2172,13 @@ static void mtk_dma_free(struct mtk_eth *eth)
 		eth->phy_scratch_ring = 0;
 	}
 	mtk_tx_clean(eth);
-	mtk_rx_clean(eth, &eth->rx_ring[0]);
-	mtk_rx_clean(eth, &eth->rx_ring_qdma);
+	mtk_rx_clean(eth, &eth->rx_ring[0], true);
+	mtk_rx_clean(eth, &eth->rx_ring_qdma, false);
 
 	if (eth->hwlro) {
 		mtk_hwlro_rx_uninit(eth);
 		for (i = 1; i < MTK_MAX_RX_RING_NUM; i++)
-			mtk_rx_clean(eth, &eth->rx_ring[i]);
+			mtk_rx_clean(eth, &eth->rx_ring[i], false);
 	}
 
 	kfree(eth->scratch_head);
@@ -3135,6 +3158,16 @@ static int mtk_probe(struct platform_device *pdev)
 	if (IS_ERR(eth->base))
 		return PTR_ERR(eth->base);
 
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SRAM)) {
+		struct resource *res;
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!res)
+			return -EINVAL;
+
+		eth->phy_scratch_ring = res->start + MTK_ETH_SRAM_OFFSET;
+	}
+
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
 		eth->tx_int_mask_reg = MTK_QDMA_INT_MASK;
 		eth->tx_int_status_reg = MTK_QDMA_INT_STATUS;
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 150d692633fa..1919e6db9275 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -99,6 +99,9 @@
 /* Unicast Filter MAC Address Register - High */
 #define MTK_GDMA_MAC_ADRH(x)	(0x50C + (x * 0x1000))
 
+/* Internal SRAM offset */
+#define MTK_ETH_SRAM_OFFSET	0x40000
+
 /* PDMA RX Base Pointer Register */
 #define MTK_PRX_BASE_PTR0	0x900
 #define MTK_PRX_BASE_PTR_CFG(x)	(MTK_PRX_BASE_PTR0 + (x * 0x10))
@@ -739,6 +742,7 @@ enum mkt_eth_capabilities {
 	MTK_SHARED_INT_BIT,
 	MTK_TRGMII_MT7621_CLK_BIT,
 	MTK_QDMA_BIT,
+	MTK_SRAM_BIT,
 	MTK_SOC_MT7628_BIT,
 
 	/* MUX BITS*/
@@ -771,6 +775,7 @@ enum mkt_eth_capabilities {
 #define MTK_SHARED_INT		BIT(MTK_SHARED_INT_BIT)
 #define MTK_TRGMII_MT7621_CLK	BIT(MTK_TRGMII_MT7621_CLK_BIT)
 #define MTK_QDMA		BIT(MTK_QDMA_BIT)
+#define MTK_SRAM		BIT(MTK_SRAM_BIT)
 #define MTK_SOC_MT7628		BIT(MTK_SOC_MT7628_BIT)
 
 #define MTK_ETH_MUX_GDM1_TO_GMAC1_ESW		\
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

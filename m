Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E77C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 12:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gL6JNkOZTwritZShkbUj63kvgm6y21qiMdNMKRGHdmc=; b=CgzzBYh9KGOTlR
	Cl9MnqtSzOO21XAdmWET4IL1hQlpKq6Zi6OPiQUV2FpxLmAr48Oiz4QYQ6Ka7iZdW//3ciJz2cv2n
	c+GUat1SSUoE2xImVrDe3JPS4s+oz7fDXeMi7ax2/fp9B+7gjf+EaVah1PYkIPH4OK4l87fdG1rGE
	MAFYusgiceMpUW5UwsEuRLwpmZpcTio+C4iTsAtdnfrTUNrqIRfllPt8UvA2GnW9JVJsf0E1mSaQP
	wdk7rOgIdoVHv6XpkxW8WmzmmzarlbtUxKh9tD0FX5WnRnvOvvWtCJ4HHtv3z48J9AUCnhaYnJ3XS
	N9BgPGoZfNM0eQfc+wfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmx7J-003BFk-Nh; Fri, 06 May 2022 12:31:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmx7G-003BCH-MX
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 12:31:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08B39B835AA;
 Fri,  6 May 2022 12:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A95EC385B0;
 Fri,  6 May 2022 12:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651840284;
 bh=RQ2pKyhqP4+cvFQTD1olLB4CtveOrAiVBuGvfLCvOzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c6nqKl7HugR6VpqMv6a0ipr3QmA+JlazWwMxF6nHl/FBlqFWGcGTfkUAxlh1a0YT8
 nAUTsrbbruCQcytzJzKtgtKd6hEA74qtDNIwJeZimMtvx9EkDVee5kxWZtoF3CjFQ7
 8wyk2A8aWpU1PkEDjjRMZ7k/RmwHIWJqJR7vWC1H7FsovhRGd1auqpWDUtiDabZdge
 wIJ9VPAofh+t9AZWD1HfmXXiG3LXRpGGp8fCUhGt0gNqxVEI4I6+FhrBq349z1zH1x
 MyuPq6N0vVovG0HqmqP2aiRvRSidrlTZ/Ig+c0iQpIelfqkHCX2qsFfNMPIaUVTICK
 AdUhLg6ZEjBPw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
Subject: [PATCH net-next 05/14] net: ethernet: mtk_eth_soc: rely on txd_size
 in mtk_tx_alloc/mtk_tx_clean
Date: Fri,  6 May 2022 14:30:22 +0200
Message-Id: <90867cfe15acb6580fc44bccb0f8aed0f3423ca9.1651839494.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651839494.git.lorenzo@kernel.org>
References: <cover.1651839494.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_053127_051643_F85DF5F7 
X-CRM114-Status: GOOD (  14.26  )
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

This is a preliminary patch to add mt7986 ethernet support.

Tested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 39 ++++++++++++---------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index cde66463bf98..a48e93792db1 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1568,25 +1568,30 @@ static int mtk_napi_rx(struct napi_struct *napi, int budget)
 
 static int mtk_tx_alloc(struct mtk_eth *eth)
 {
+	const struct mtk_soc_data *soc = eth->soc;
 	struct mtk_tx_ring *ring = &eth->tx_ring;
-	int i, sz = sizeof(*ring->dma);
+	struct mtk_tx_dma *txd;
+	int i;
 
 	ring->buf = kcalloc(MTK_DMA_SIZE, sizeof(*ring->buf),
 			       GFP_KERNEL);
 	if (!ring->buf)
 		goto no_tx_mem;
 
-	ring->dma = dma_alloc_coherent(eth->dma_dev, MTK_DMA_SIZE * sz,
+	ring->dma = dma_alloc_coherent(eth->dma_dev,
+				       MTK_DMA_SIZE * soc->txrx.txd_size,
 				       &ring->phys, GFP_ATOMIC);
 	if (!ring->dma)
 		goto no_tx_mem;
 
 	for (i = 0; i < MTK_DMA_SIZE; i++) {
 		int next = (i + 1) % MTK_DMA_SIZE;
-		u32 next_ptr = ring->phys + next * sz;
+		u32 next_ptr = ring->phys + next * soc->txrx.txd_size;
 
-		ring->dma[i].txd2 = next_ptr;
-		ring->dma[i].txd3 = TX_DMA_LS0 | TX_DMA_OWNER_CPU;
+		txd = (void *)ring->dma + i * soc->txrx.txd_size;
+		txd->txd2 = next_ptr;
+		txd->txd3 = TX_DMA_LS0 | TX_DMA_OWNER_CPU;
+		txd->txd4 = 0;
 	}
 
 	/* On MT7688 (PDMA only) this driver uses the ring->dma structs
@@ -1594,9 +1599,9 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 	 * descriptors in ring->dma_pdma.
 	 */
 	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
-		ring->dma_pdma = dma_alloc_coherent(eth->dma_dev, MTK_DMA_SIZE * sz,
-						    &ring->phys_pdma,
-						    GFP_ATOMIC);
+		ring->dma_pdma = dma_alloc_coherent(eth->dma_dev,
+				MTK_DMA_SIZE * soc->txrx.txd_size,
+				&ring->phys_pdma, GFP_ATOMIC);
 		if (!ring->dma_pdma)
 			goto no_tx_mem;
 
@@ -1609,8 +1614,9 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 	ring->dma_size = MTK_DMA_SIZE;
 	atomic_set(&ring->free_count, MTK_DMA_SIZE - 2);
 	ring->next_free = &ring->dma[0];
-	ring->last_free = &ring->dma[MTK_DMA_SIZE - 1];
-	ring->last_free_ptr = (u32)(ring->phys + ((MTK_DMA_SIZE - 1) * sz));
+	ring->last_free = (void *)txd;
+	ring->last_free_ptr = (u32)(ring->phys +
+				    (MTK_DMA_SIZE - 1) * soc->txrx.txd_size);
 	ring->thresh = MAX_SKB_FRAGS;
 
 	/* make sure that all changes to the dma ring are flushed before we
@@ -1622,7 +1628,7 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 		mtk_w32(eth, ring->phys, MTK_QTX_CTX_PTR);
 		mtk_w32(eth, ring->phys, MTK_QTX_DTX_PTR);
 		mtk_w32(eth,
-			ring->phys + ((MTK_DMA_SIZE - 1) * sz),
+			ring->phys + (MTK_DMA_SIZE - 1) * soc->txrx.txd_size,
 			MTK_QTX_CRX_PTR);
 		mtk_w32(eth, ring->last_free_ptr, MTK_QTX_DRX_PTR);
 		mtk_w32(eth, (QDMA_RES_THRES << 8) | QDMA_RES_THRES,
@@ -1642,6 +1648,7 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 
 static void mtk_tx_clean(struct mtk_eth *eth)
 {
+	const struct mtk_soc_data *soc = eth->soc;
 	struct mtk_tx_ring *ring = &eth->tx_ring;
 	int i;
 
@@ -1654,17 +1661,15 @@ static void mtk_tx_clean(struct mtk_eth *eth)
 
 	if (ring->dma) {
 		dma_free_coherent(eth->dma_dev,
-				  MTK_DMA_SIZE * sizeof(*ring->dma),
-				  ring->dma,
-				  ring->phys);
+				  MTK_DMA_SIZE * soc->txrx.txd_size,
+				  ring->dma, ring->phys);
 		ring->dma = NULL;
 	}
 
 	if (ring->dma_pdma) {
 		dma_free_coherent(eth->dma_dev,
-				  MTK_DMA_SIZE * sizeof(*ring->dma_pdma),
-				  ring->dma_pdma,
-				  ring->phys_pdma);
+				  MTK_DMA_SIZE * soc->txrx.txd_size,
+				  ring->dma_pdma, ring->phys_pdma);
 		ring->dma_pdma = NULL;
 	}
 }
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

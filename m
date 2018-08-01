From: zhong jiang <zhongjiang@huawei.com>
Subject: [PATCH] drivers/staging/mt7621-eth: Use dma_zalloc_coherent to replace dma_alloc_coherent+memset
Date: Wed, 1 Aug 2018 22:10:15 +0800
Message-ID: <1533132615-53808-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, matthias.bgg@gmail.com
Cc: kamalheib1@gmail.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

we prefer to use dma_zalloc_coherent rather than dam_alloc_coherent+memset

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/staging/mt7621-eth/mtk_eth_soc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-eth/mtk_eth_soc.c b/drivers/staging/mt7621-eth/mtk_eth_soc.c
index f9b593ca..7135075 100644
--- a/drivers/staging/mt7621-eth/mtk_eth_soc.c
+++ b/drivers/staging/mt7621-eth/mtk_eth_soc.c
@@ -1396,14 +1396,13 @@ static int mtk_qdma_tx_alloc_tx(struct mtk_eth *eth)
 	if (!ring->tx_buf)
 		goto no_tx_mem;
 
-	ring->tx_dma = dma_alloc_coherent(eth->dev,
+	ring->tx_dma = dma_zalloc_coherent(eth->dev,
 					  ring->tx_ring_size * sz,
 					  &ring->tx_phys,
 					  GFP_ATOMIC | __GFP_ZERO);
 	if (!ring->tx_dma)
 		goto no_tx_mem;
 
-	memset(ring->tx_dma, 0, ring->tx_ring_size * sz);
 	for (i = 0; i < ring->tx_ring_size; i++) {
 		int next = (i + 1) % ring->tx_ring_size;
 		u32 next_ptr = ring->tx_phys + next * sz;
-- 
1.7.12.4

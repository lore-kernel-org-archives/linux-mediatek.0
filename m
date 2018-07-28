From: <sean.wang@mediatek.com>
Subject: [PATCH net-next 1/2] net-next: mediatek: improve more with using dma_zalloc_coherent
Date: Sat, 28 Jul 2018 13:35:55 +0800
Message-ID: <658dfd485c035cdae5452bc5d572125076b47a48.1532755541.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Improve more in the existing code by reusing dma_zalloc_coherent instead
of dma_alloc_coherent with __GFP_ZERO or superfluous zeroing buffer.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index c30aea2..8c85a4b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -605,10 +605,10 @@ static int mtk_init_fq_dma(struct mtk_eth *eth)
 	dma_addr_t dma_addr;
 	int i;
 
-	eth->scratch_ring = dma_alloc_coherent(eth->dev,
-					       cnt * sizeof(struct mtk_tx_dma),
-					       &eth->phy_scratch_ring,
-					       GFP_ATOMIC | __GFP_ZERO);
+	eth->scratch_ring = dma_zalloc_coherent(eth->dev,
+						cnt * sizeof(struct mtk_tx_dma),
+						&eth->phy_scratch_ring,
+						GFP_ATOMIC);
 	if (unlikely(!eth->scratch_ring))
 		return -ENOMEM;
 
@@ -623,7 +623,6 @@ static int mtk_init_fq_dma(struct mtk_eth *eth)
 	if (unlikely(dma_mapping_error(eth->dev, dma_addr)))
 		return -ENOMEM;
 
-	memset(eth->scratch_ring, 0x0, sizeof(struct mtk_tx_dma) * cnt);
 	phy_ring_tail = eth->phy_scratch_ring +
 			(sizeof(struct mtk_tx_dma) * (cnt - 1));
 
@@ -1318,10 +1317,9 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 			return -ENOMEM;
 	}
 
-	ring->dma = dma_alloc_coherent(eth->dev,
-				       rx_dma_size * sizeof(*ring->dma),
-				       &ring->phys,
-				       GFP_ATOMIC | __GFP_ZERO);
+	ring->dma = dma_zalloc_coherent(eth->dev,
+					rx_dma_size * sizeof(*ring->dma),
+					&ring->phys, GFP_ATOMIC);
 	if (!ring->dma)
 		return -ENOMEM;
 
-- 
2.7.4

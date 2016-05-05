From: John Crispin <john@phrozen.org>
Subject: [PATCH 10/12] net-next: mediatek: fix off by one in the TX ring allocation
Date: Thu,  5 May 2016 11:26:23 +0200
Message-ID: <1462440385-51939-11-git-send-email-john@phrozen.org>
References: <1462440385-51939-1-git-send-email-john@phrozen.org>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1462440385-51939-1-git-send-email-john@phrozen.org>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>
Cc: nbd@nbd.name, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, John Crispin <john@phrozen.org>
List-Id: linux-mediatek@lists.infradead.org

The TX ring setup has an off by one error causing it to not utilise all
descriptors. This has the side effect that we need to reset the next
pointer at runtime to make it work. Fix the off by one and remove the
code fixing the ring at runtime.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 12e9f1a..81155a1 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -919,7 +919,6 @@ static int mtk_poll_tx(struct mtk_eth *eth, int budget, bool *tx_again)
 		}
 		mtk_tx_unmap(eth->dev, tx_buf);
 
-		ring->last_free->txd2 = next_cpu;
 		ring->last_free = desc;
 		atomic_inc(&ring->free_count);
 
@@ -1027,7 +1026,7 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 
 	atomic_set(&ring->free_count, MTK_DMA_SIZE - 2);
 	ring->next_free = &ring->dma[0];
-	ring->last_free = &ring->dma[MTK_DMA_SIZE - 2];
+	ring->last_free = &ring->dma[MTK_DMA_SIZE - 1];
 	ring->thresh = MAX_SKB_FRAGS;
 
 	/* make sure that all changes to the dma ring are flushed before we
-- 
1.7.10.4

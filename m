From: Stefan Roese <sr@denx.de>
Subject: [PATCH net-next 3/4 v3] net: ethernet: mediatek: Rename NEXT_RX_DESP_IDX to NEXT_DESP_IDX
Date: Fri, 16 Aug 2019 15:23:24 +0200
Message-ID: <20190816132325.28426-3-sr@denx.de>
References: <20190816132325.28426-1-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190816132325.28426-1-sr@denx.de>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>, Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>
List-Id: linux-mediatek@lists.infradead.org

Rename the NEXT_RX_DESP_IDX macro to NEXT_DESP_IDX, so that it better
can be used for TX ops as well. This will be used in the upcoming
MT7628/88 support (same functionality for RX and TX in this macro).

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: René van Dorst <opensource@vdorst.com>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: John Crispin <john@phrozen.org>
---
v3:
- No change

v2:
- New patch

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index bee2cdca66e7..d9978174b96a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -903,7 +903,7 @@ static struct mtk_rx_ring *mtk_get_rx_ring(struct mtk_eth *eth)
 
 	for (i = 0; i < MTK_MAX_RX_RING_NUM; i++) {
 		ring = &eth->rx_ring[i];
-		idx = NEXT_RX_DESP_IDX(ring->calc_idx, ring->dma_size);
+		idx = NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
 		if (ring->dma[idx].rxd2 & RX_DMA_DONE) {
 			ring->calc_idx_update = true;
 			return ring;
@@ -952,7 +952,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		if (unlikely(!ring))
 			goto rx_done;
 
-		idx = NEXT_RX_DESP_IDX(ring->calc_idx, ring->dma_size);
+		idx = NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
 		rxd = &ring->dma[idx];
 		data = ring->data[idx];
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 088e2bc621f7..556644f28eae 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -39,7 +39,7 @@
 				 NETIF_F_SG | NETIF_F_TSO | \
 				 NETIF_F_TSO6 | \
 				 NETIF_F_IPV6_CSUM)
-#define NEXT_RX_DESP_IDX(X, Y)	(((X) + 1) & ((Y) - 1))
+#define NEXT_DESP_IDX(X, Y)	(((X) + 1) & ((Y) - 1))
 
 #define MTK_MAX_RX_RING_NUM	4
 #define MTK_HW_LRO_DMA_SIZE	8
-- 
2.22.1

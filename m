From: Nelson Chang <nelson.chang@mediatek.com>
Subject: [PATCH net-next v4 2/2] net: ethernet: mediatek: modify GDM to send packets to the PDMA for RX
Date: Fri, 26 Aug 2016 01:09:43 +0800
Message-ID: <1472144983-5048-3-git-send-email-nelson.chang@mediatek.com>
References: <1472144983-5048-1-git-send-email-nelson.chang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1472144983-5048-1-git-send-email-nelson.chang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, nelsonch.tw@gmail.com, Nelson Chang <nelson.chang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Because we change to use the PDMA as the Ethernet RX DMA engine,
the patch modifies to set GDM to send packets to PDMA for RX.

Acked-by: John Crispin <john@phrozen.org>
Signed-off-by: Nelson Chang <nelson.chang@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index cbeb793..0fd9fc8 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1473,9 +1473,8 @@ static int __init mtk_hw_init(struct mtk_eth *eth)
 	for (i = 0; i < 2; i++) {
 		u32 val = mtk_r32(eth, MTK_GDMA_FWD_CFG(i));
 
-		/* setup the forward port to send frame to QDMA */
+		/* setup the forward port to send frame to PDMA */
 		val &= ~0xffff;
-		val |= 0x5555;
 
 		/* Enable RX checksum */
 		val |= MTK_GDMA_ICS_EN | MTK_GDMA_TCS_EN | MTK_GDMA_UCS_EN;
-- 
1.9.1

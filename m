From: <sean.wang@mediatek.com>
Subject: [PATCH net] net: mediatek: setup proper state for disabled GMAC on the default
Date: Mon, 18 Dec 2017 17:00:17 +0800
Message-ID: <1ce99b9e64c6212eac501b98ee982b2e37fd7962.1513587298.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

The current solution would setup fixed and force link of 1Gbps to the both
GMAC on the default. However, The GMAC should always be put to link down
state when the GMAC is disabled on certain target boards. Otherwise,
the driver possibly receives unexpected data from the floating hardware
connection through the unused GMAC. Although the driver had been added
certain protection in RX path to get rid of such kind of unexpected data
sent to the upper stack.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 54adfd9..fc67e35 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1961,11 +1961,12 @@ static int mtk_hw_init(struct mtk_eth *eth)
 	/* set GE2 TUNE */
 	regmap_write(eth->pctl, GPIO_BIAS_CTRL, 0x0);
 
-	/* GE1, Force 1000M/FD, FC ON */
-	mtk_w32(eth, MAC_MCR_FIXED_LINK, MTK_MAC_MCR(0));
-
-	/* GE2, Force 1000M/FD, FC ON */
-	mtk_w32(eth, MAC_MCR_FIXED_LINK, MTK_MAC_MCR(1));
+	/* Set linkdown as the default for each GMAC. Its own MCR would be set
+	 * up with the more appropriate value when mtk_phy_link_adjust call is
+	 * being invoked.
+	 */
+	for (i = 0; i < MTK_MAC_COUNT; i++)
+		mtk_w32(eth, 0, MTK_MAC_MCR(i));
 
 	/* Indicates CDM to parse the MTK special tag from CPU
 	 * which also is working out for untag packets.
-- 
2.7.4

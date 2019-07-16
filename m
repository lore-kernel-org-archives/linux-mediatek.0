From: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] net: ethernet: mediatek: mtk_eth_soc: Add of_node_put() before goto
Date: Tue, 16 Jul 2019 11:25:04 +0530
Message-ID: <20190716055504.3113-1-nishkadg.linux@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: nbd@openwrt.org, john@phrozen.org, sean.wang@mediatek.com, davem@davemloft.net, netdev@vger.kernel.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a goto from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the goto.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b20b3a5a1ebb..c39d7f4ab1d4 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2548,8 +2548,10 @@ static int mtk_probe(struct platform_device *pdev)
 			continue;
 
 		err = mtk_add_mac(eth, mac_np);
-		if (err)
+		if (err) {
+			of_node_put(mac_np);
 			goto err_deinit_hw;
+		}
 	}
 
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
-- 
2.19.1

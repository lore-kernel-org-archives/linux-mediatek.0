From: Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/2] net: ethernet: mediatek: fixed that initializing u64_stats_sync is missing
Date: Sat, 13 Aug 2016 19:16:18 +0800
Message-ID: <1471086979-23032-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, keyhaede@gmail.com, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

To fix runtime warning with lockdep is enabled due that u64_stats_sync
is not initialized well, so add it.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 3a4726e..f5d2745 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1748,6 +1748,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 		goto free_netdev;
 	}
 	spin_lock_init(&mac->hw_stats->stats_lock);
+	u64_stats_init(&mac->hw_stats->syncp);
 	mac->hw_stats->reg_offset = id * MTK_STAT_OFFSET;
 
 	SET_NETDEV_DEV(eth->netdev[id], eth->dev);
-- 
1.7.9.5

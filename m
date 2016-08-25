From: Sean Wang <sean.wang@mediatek.com>
Subject: [RESEND PATCH net 08/10] net: ethernet: mediatek: fix the missing of_node_put() after node is used done inside mtk_mdio_init
Date: Thu, 25 Aug 2016 18:44:59 +0800
Message-ID: <1472121901-15629-9-git-send-email-sean.wang@mediatek.com>
References: <1472121901-15629-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1472121901-15629-1-git-send-email-sean.wang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, keyhaede@gmail.com, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

This patch adds the missing of_node_put() after finishing the usage
of of_get_child_by_name.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index c573475..e3baa63 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -320,6 +320,7 @@ static int mtk_mdio_init(struct mtk_eth *eth)
 	err = of_mdiobus_register(eth->mii_bus, mii_np);
 	if (err)
 		goto err_free_bus;
+	of_node_put(mii_np);
 
 	return 0;
 
-- 
1.9.1

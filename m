From: Sean Wang <sean.wang@mediatek.com>
Subject: [RESEND PATCH net 10/10] net: ethernet: mediatek: fix error handling inside mtk_mdio_init
Date: Thu, 25 Aug 2016 18:45:01 +0800
Message-ID: <1472121901-15629-11-git-send-email-sean.wang@mediatek.com>
References: <1472121901-15629-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1472121901-15629-1-git-send-email-sean.wang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, keyhaede@gmail.com, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

return -ENODEV if no child is found in MDIO bus.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 05d85da..2d547c2 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -300,7 +300,7 @@ static int mtk_mdio_init(struct mtk_eth *eth)
 	}
 
 	if (!of_device_is_available(mii_np)) {
-		err = 0;
+		err = -ENODEV;
 		goto err_put_node;
 	}
 
-- 
1.9.1

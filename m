From: <sean.wang@mediatek.com>
Subject: [PATCH net] net: ethernet: mediatek: fix module loading automatically based on MODULE_DEVICE_TABLE
Date: Wed, 14 Sep 2016 21:29:34 +0800
Message-ID: <1473859774-6327-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, keyhaede@gmail.com, objelf@gmail.com, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

The device table is required to load modules based on
modaliases. After adding MODULE_DEVICE_TABLE, below entries
for example will be added to modules.alias:
alias of:N*T*Cmediatek,mt7623-ethC* mtk_eth_soc

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index a6a9a2f..b44ff3c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2053,6 +2053,7 @@ const struct of_device_id of_mtk_match[] = {
 	{ .compatible = "mediatek,mt7623-eth" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, of_mtk_match);
 
 static struct platform_driver mtk_driver = {
 	.probe = mtk_probe,
-- 
1.9.1

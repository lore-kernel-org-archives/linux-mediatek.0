From: <sean.wang@mediatek.com>
Subject: [PATCH net v1] net: ethernet: mediatek: Fixed several errors caused by undefined symbols
Date: Wed, 5 Jun 2019 05:22:27 +0800
Message-ID: <1559683347-5752-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Fixed several errors caused by undefined symbols catched by kbuild test
robot.

ERROR: "mtk_sgmii_init" [drivers/net/ethernet/mediatek/mtk_eth_soc.ko] undefined!
ERROR: "mtk_setup_hw_path" [drivers/net/ethernet/mediatek/mtk_eth_soc.ko] undefined!
ERROR: "mtk_sgmii_setup_mode_force" [drivers/net/ethernet/mediatek/mtk_eth_path.ko] undefined!
ERROR: "mtk_sgmii_setup_mode_an" [drivers/net/ethernet/mediatek/mtk_eth_path.ko] undefined!
ERROR: "mtk_w32" [drivers/net/ethernet/mediatek/mtk_eth_path.ko] undefined!
ERROR: "mtk_r32" [drivers/net/ethernet/mediatek/mtk_eth_path.ko] undefined!

Fixes: 	7093f9d80c7c ("net: ethernet: mediatek: Integrate hardware path from GMAC to PHY variants")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/ethernet/mediatek/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/Makefile b/drivers/net/ethernet/mediatek/Makefile
index 212c86f9982f..d92adef15603 100644
--- a/drivers/net/ethernet/mediatek/Makefile
+++ b/drivers/net/ethernet/mediatek/Makefile
@@ -3,5 +3,6 @@
 # Makefile for the Mediatek SoCs built-in ethernet macs
 #
 
-obj-$(CONFIG_NET_MEDIATEK_SOC)                 += mtk_eth_soc.o mtk_sgmii.o \
-						  mtk_eth_path.o
+obj-$(CONFIG_NET_MEDIATEK_SOC) := mtk_eth.o
+
+mtk_eth-y := mtk_eth_soc.o mtk_sgmii.o mtk_eth_path.o
-- 
2.17.1

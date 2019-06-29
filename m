From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH] net: ethernet: mediatek: Fix overlapping capability bits.
Date: Sat, 29 Jun 2019 14:24:19 +0200
Message-ID: <20190629122419.19026-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com
Cc: frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org

Both MTK_TRGMII_MT7621_CLK and MTK_PATH_BIT are defined as bit 10.

This causes issues on non-MT7621 devices which has the
MTK_PATH_BIT(MTK_ETH_PATH_GMAC1_RGMII) capability set.
The wrong TRGMII setup code is executed.

Moving the MTK_PATH_BIT to bit 11 fixes the issue.

Fixes: 8efaa653a8a5 ("net: ethernet: mediatek: Add MT7621 TRGMII mode
support")
Signed-off-by: René van Dorst <opensource@vdorst.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 876ce6798709..2cb8a915731c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -626,7 +626,7 @@ enum mtk_eth_path {
 #define MTK_TRGMII_MT7621_CLK		BIT(10)
 
 /* Supported path present on SoCs */
-#define MTK_PATH_BIT(x)         BIT((x) + 10)
+#define MTK_PATH_BIT(x)         BIT((x) + 11)
 
 #define MTK_GMAC1_RGMII \
 	(MTK_PATH_BIT(MTK_ETH_PATH_GMAC1_RGMII) | MTK_RGMII)
-- 
2.20.1

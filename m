From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH] net: ethernet: mediatek: Allow non TRGMII mode with MT7621 DDR2 devices
Date: Sat, 29 Jun 2019 14:24:51 +0200
Message-ID: <20190629122451.19578-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com
Cc: frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org

No reason to error out on a MT7621 device with DDR2 memory when non
TRGMII mode is selected.
Only MT7621 DDR2 clock setup is not supported for TRGMII mode.
But non TRGMII mode doesn't need any special clock setup.

Signed-off-by: René van Dorst <opensource@vdorst.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 066712f2e985..b20b3a5a1ebb 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -139,9 +139,12 @@ static int mt7621_gmac0_rgmii_adjust(struct mtk_eth *eth,
 {
 	u32 val;
 
-	/* Check DDR memory type. Currently DDR2 is not supported. */
+	/* Check DDR memory type.
+	 * Currently TRGMII mode with DDR2 memory is not supported.
+	 */
 	regmap_read(eth->ethsys, ETHSYS_SYSCFG, &val);
-	if (val & SYSCFG_DRAM_TYPE_DDR2) {
+	if (interface == PHY_INTERFACE_MODE_TRGMII &&
+	    val & SYSCFG_DRAM_TYPE_DDR2) {
 		dev_err(eth->dev,
 			"TRGMII mode with DDR2 memory is not supported!\n");
 		return -EOPNOTSUPP;
-- 
2.20.1

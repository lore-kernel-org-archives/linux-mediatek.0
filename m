From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH v2 net-next 1/2] net: ethernet: mediatek: Add MT7621 TRGMII mode support
Date: Thu, 20 Jun 2019 14:21:54 +0200
Message-ID: <20190620122155.32078-2-opensource@vdorst.com>
References: <20190620122155.32078-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190620122155.32078-1-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com
Cc: netdev@vger.kernel.org, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org

MT7621 SOC also supports TRGMII.
TRGMII speed is 1200MBit.

Signed-off-by: René van Dorst <opensource@vdorst.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 38 ++++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 11 ++++++
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index f27efe4110cc..066712f2e985 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -134,6 +134,28 @@ static int mtk_mdio_read(struct mii_bus *bus, int phy_addr, int phy_reg)
 	return _mtk_mdio_read(eth, phy_addr, phy_reg);
 }
 
+static int mt7621_gmac0_rgmii_adjust(struct mtk_eth *eth,
+				     phy_interface_t interface)
+{
+	u32 val;
+
+	/* Check DDR memory type. Currently DDR2 is not supported. */
+	regmap_read(eth->ethsys, ETHSYS_SYSCFG, &val);
+	if (val & SYSCFG_DRAM_TYPE_DDR2) {
+		dev_err(eth->dev,
+			"TRGMII mode with DDR2 memory is not supported!\n");
+		return -EOPNOTSUPP;
+	}
+
+	val = (interface == PHY_INTERFACE_MODE_TRGMII) ?
+		ETHSYS_TRGMII_MT7621_DDR_PLL : 0;
+
+	regmap_update_bits(eth->ethsys, ETHSYS_CLKCFG0,
+			   ETHSYS_TRGMII_MT7621_MASK, val);
+
+	return 0;
+}
+
 static void mtk_gmac0_rgmii_adjust(struct mtk_eth *eth, int speed)
 {
 	u32 val;
@@ -183,9 +205,17 @@ static void mtk_phy_link_adjust(struct net_device *dev)
 		break;
 	}
 
-	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_GMAC1_TRGMII) &&
-	    !mac->id && !mac->trgmii)
-		mtk_gmac0_rgmii_adjust(mac->hw, dev->phydev->speed);
+	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_GMAC1_TRGMII) && !mac->id) {
+		if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_TRGMII_MT7621_CLK)) {
+			if (mt7621_gmac0_rgmii_adjust(mac->hw,
+						      dev->phydev->interface))
+				return;
+		} else {
+			if (!mac->trgmii)
+				mtk_gmac0_rgmii_adjust(mac->hw,
+						       dev->phydev->speed);
+		}
+	}
 
 	if (dev->phydev->link)
 		mcr |= MAC_MCR_FORCE_LINK;
@@ -2607,7 +2637,7 @@ static const struct mtk_soc_data mt2701_data = {
 };
 
 static const struct mtk_soc_data mt7621_data = {
-	.caps = MTK_SHARED_INT,
+	.caps = MT7621_CAPS,
 	.required_clks = MT7621_CLKS_BITMAP,
 	.required_pctl = false,
 };
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 85e3144f1af5..876ce6798709 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -363,6 +363,10 @@
 #define MT7622_ETH		7622
 #define MT7621_ETH		7621
 
+/* ethernet system control register */
+#define ETHSYS_SYSCFG		0x10
+#define SYSCFG_DRAM_TYPE_DDR2	BIT(4)
+
 /* ethernet subsystem config register */
 #define ETHSYS_SYSCFG0		0x14
 #define SYSCFG0_GE_MASK		0x3
@@ -377,6 +381,9 @@
 /* ethernet subsystem clock register */
 #define ETHSYS_CLKCFG0		0x2c
 #define ETHSYS_TRGMII_CLK_SEL362_5	BIT(11)
+#define ETHSYS_TRGMII_MT7621_MASK	(BIT(5) | BIT(6))
+#define ETHSYS_TRGMII_MT7621_APLL	BIT(6)
+#define ETHSYS_TRGMII_MT7621_DDR_PLL	BIT(5)
 
 /* ethernet reset control register */
 #define ETHSYS_RSTCTRL		0x34
@@ -616,6 +623,7 @@ enum mtk_eth_path {
 #define MTK_SHARED_SGMII		BIT(7)
 #define MTK_HWLRO			BIT(8)
 #define MTK_SHARED_INT			BIT(9)
+#define MTK_TRGMII_MT7621_CLK		BIT(10)
 
 /* Supported path present on SoCs */
 #define MTK_PATH_BIT(x)         BIT((x) + 10)
@@ -667,6 +675,9 @@ enum mtk_eth_path {
 
 #define MTK_HAS_CAPS(caps, _x)		(((caps) & (_x)) == (_x))
 
+#define MT7621_CAPS  (MTK_GMAC1_RGMII | MTK_GMAC1_TRGMII | \
+		      MTK_GMAC2_RGMII | MTK_SHARED_INT | MTK_TRGMII_MT7621_CLK)
+
 #define MT7622_CAPS  (MTK_GMAC1_RGMII | MTK_GMAC1_SGMII | MTK_GMAC2_RGMII | \
 		      MTK_GMAC2_SGMII | MTK_GDM1_ESW | \
 		      MTK_MUX_GDM1_TO_GMAC1_ESW | \
-- 
2.20.1

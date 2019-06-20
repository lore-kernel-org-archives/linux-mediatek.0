From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH v2 net-next 2/2] net: dsa: mt7530: Add MT7621 TRGMII mode support
Date: Thu, 20 Jun 2019 14:21:55 +0200
Message-ID: <20190620122155.32078-3-opensource@vdorst.com>
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

This patch add support TRGMII mode for MT7621 internal MT7530 switch.
MT7621 TRGMII has only one fix speed mode of 1200MBit.

Also adding support for mt7530 25MHz and 40MHz crystal clocksource.
Values are based on Banana Pi R2 bsp [1].

Don't change MT7623 registers on a MT7621 device.

[1] https://github.com/BPI-SINOVOIP/BPI-R2-bsp/blob/master/linux-mt/drivers/net/ethernet/mediatek/gsw_mt7623.c#L769

Signed-off-by: René van Dorst <opensource@vdorst.com>
---
 drivers/net/dsa/mt7530.c | 46 +++++++++++++++++++++++++++++++---------
 drivers/net/dsa/mt7530.h |  4 ++++
 2 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c7d352da5448..3181e95586d6 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -428,24 +428,48 @@ static int
 mt7530_pad_clk_setup(struct dsa_switch *ds, int mode)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, trgint, i;
+	u32 ncpo1, ssc_delta, trgint, i, xtal;
+
+	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
+
+	if (xtal == HWTRAP_XTAL_20MHZ) {
+		dev_err(priv->dev,
+			"%s: MT7530 with a 20MHz XTAL is not supported!\n",
+			__func__);
+		return -EINVAL;
+	}
 
 	switch (mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 		trgint = 0;
+		/* PLL frequency: 125MHz */
 		ncpo1 = 0x0c80;
-		ssc_delta = 0x87;
 		break;
 	case PHY_INTERFACE_MODE_TRGMII:
 		trgint = 1;
-		ncpo1 = 0x1400;
-		ssc_delta = 0x57;
+		if (priv->id == ID_MT7621) {
+			/* PLL frequency: 150MHz: 1.2GBit */
+			if (xtal == HWTRAP_XTAL_40MHZ)
+				ncpo1 = 0x0780;
+			if (xtal == HWTRAP_XTAL_25MHZ)
+				ncpo1 = 0x0a00;
+		} else { /* PLL frequency: 250MHz: 2.0Gbit */
+			if (xtal == HWTRAP_XTAL_40MHZ)
+				ncpo1 = 0x0c80;
+			if (xtal == HWTRAP_XTAL_25MHZ)
+				ncpo1 = 0x1400;
+		}
 		break;
 	default:
 		dev_err(priv->dev, "xMII mode %d not supported\n", mode);
 		return -EINVAL;
 	}
 
+	if (xtal == HWTRAP_XTAL_25MHZ)
+		ssc_delta = 0x57;
+	else
+		ssc_delta = 0x87;
+
 	mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
 		   P6_INTF_MODE(trgint));
 
@@ -507,7 +531,9 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, int mode)
 			mt7530_rmw(priv, MT7530_TRGMII_RD(i),
 				   RD_TAP_MASK, RD_TAP(16));
 	else
-		mt7623_trgmii_set(priv, GSW_INTF_MODE, INTF_MODE_TRGMII);
+		if (priv->id != ID_MT7621)
+			mt7623_trgmii_set(priv, GSW_INTF_MODE,
+					  INTF_MODE_TRGMII);
 
 	return 0;
 }
@@ -613,13 +639,13 @@ static void mt7530_adjust_link(struct dsa_switch *ds, int port,
 	struct mt7530_priv *priv = ds->priv;
 
 	if (phy_is_pseudo_fixed_link(phydev)) {
-		if (priv->id == ID_MT7530) {
-			dev_dbg(priv->dev, "phy-mode for master device = %x\n",
-				phydev->interface);
+		dev_dbg(priv->dev, "phy-mode for master device = %x\n",
+			phydev->interface);
 
-			/* Setup TX circuit incluing relevant PAD and driving */
-			mt7530_pad_clk_setup(ds, phydev->interface);
+		/* Setup TX circuit incluing relevant PAD and driving */
+		mt7530_pad_clk_setup(ds, phydev->interface);
 
+		if (priv->id == ID_MT7530) {
 			/* Setup RX circuit, relevant PAD and driving on the
 			 * host which must be placed after the setup on the
 			 * device side is all finished.
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 4331429969fa..bfac90f48102 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -244,6 +244,10 @@ enum mt7530_vlan_port_attr {
 
 /* Register for hw trap status */
 #define MT7530_HWTRAP			0x7800
+#define  HWTRAP_XTAL_MASK		(BIT(10) | BIT(9))
+#define  HWTRAP_XTAL_25MHZ		(BIT(10) | BIT(9))
+#define  HWTRAP_XTAL_40MHZ		(BIT(10))
+#define  HWTRAP_XTAL_20MHZ		(BIT(9))
 
 /* Register for hw trap modification */
 #define MT7530_MHWTRAP			0x7804
-- 
2.20.1

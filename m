From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH v2 3/5] phy: ocelot-serdes: convert to use eth phy mode and
 submode
Date: Fri, 9 Nov 2018 17:47:53 -0600
Message-ID: <20181109234755.21687-4-grygorii.strashko@ti.com>
References: <20181109234755.21687-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181109234755.21687-1-grygorii.strashko@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "David S. Miller" <davem@davemloft.net>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Quentin Schulz <quentin.schulz@bootlin.com>, Manu Gautam <mgautam@codeaurora.org>, Tony Lindgren <tony@atomide.com>, netdev@vger.kernel.org, Antoine Tenart <antoine.tenart@free-electrons.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Convert ocelot-serdes PHY driver to use recently introduced
PHY_MODE_ETHERNET and phy_set_mode_ext().

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/net/ethernet/mscc/ocelot.c   |  9 ++-------
 drivers/phy/mscc/phy-ocelot-serdes.c | 14 ++++++++++----
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot.c b/drivers/net/ethernet/mscc/ocelot.c
index 3238b9e..3edb608 100644
--- a/drivers/net/ethernet/mscc/ocelot.c
+++ b/drivers/net/ethernet/mscc/ocelot.c
@@ -472,7 +472,6 @@ static int ocelot_port_open(struct net_device *dev)
 {
 	struct ocelot_port *port = netdev_priv(dev);
 	struct ocelot *ocelot = port->ocelot;
-	enum phy_mode phy_mode;
 	int err;
 
 	/* Enable receiving frames on the port, and activate auto-learning of
@@ -484,12 +483,8 @@ static int ocelot_port_open(struct net_device *dev)
 			 ANA_PORT_PORT_CFG, port->chip_port);
 
 	if (port->serdes) {
-		if (port->phy_mode == PHY_INTERFACE_MODE_SGMII)
-			phy_mode = PHY_MODE_SGMII;
-		else
-			phy_mode = PHY_MODE_QSGMII;
-
-		err = phy_set_mode(port->serdes, phy_mode);
+		err = phy_set_mode_ext(port->serdes, PHY_MODE_ETHERNET,
+				       port->phy_mode);
 		if (err) {
 			netdev_err(dev, "Could not set mode of SerDes\n");
 			return err;
diff --git a/drivers/phy/mscc/phy-ocelot-serdes.c b/drivers/phy/mscc/phy-ocelot-serdes.c
index c61a9890..f525a21 100644
--- a/drivers/phy/mscc/phy-ocelot-serdes.c
+++ b/drivers/phy/mscc/phy-ocelot-serdes.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/phy.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -116,8 +117,10 @@ struct serdes_mux {
 	.mux = _mux,						\
 }
 
-#define SERDES_MUX_SGMII(i, p, m, c) SERDES_MUX(i, p, PHY_MODE_SGMII, m, c)
-#define SERDES_MUX_QSGMII(i, p, m, c) SERDES_MUX(i, p, PHY_MODE_QSGMII, m, c)
+#define SERDES_MUX_SGMII(i, p, m, c) \
+	SERDES_MUX(i, p, PHY_INTERFACE_MODE_SGMII, m, c)
+#define SERDES_MUX_QSGMII(i, p, m, c) \
+	SERDES_MUX(i, p, PHY_INTERFACE_MODE_QSGMII, m, c)
 
 static const struct serdes_mux ocelot_serdes_muxes[] = {
 	SERDES_MUX_SGMII(SERDES1G(0), 0, 0, 0),
@@ -164,12 +167,15 @@ static int serdes_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 	unsigned int i;
 	int ret;
 
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
 	for (i = 0; i < ARRAY_SIZE(ocelot_serdes_muxes); i++) {
 		if (macro->idx != ocelot_serdes_muxes[i].idx ||
-		    mode != ocelot_serdes_muxes[i].mode)
+		    submode != ocelot_serdes_muxes[i].mode)
 			continue;
 
-		if (mode != PHY_MODE_QSGMII &&
+		if (submode != PHY_INTERFACE_MODE_QSGMII &&
 		    macro->port != ocelot_serdes_muxes[i].port)
 			continue;
 
-- 
2.10.5

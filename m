From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 5/7] [DSA] dsa multi cpu (mt7530.c)
Date: Tue, 11 Dec 2018 20:33:12 +0100
Message-ID: <20181211193314.10695-5-frank-w@public-files.de>
References: <20181211193314.10695-1-frank-w@public-files.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211193314.10695-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: linux-mediatek@lists.infradead.org

based on
https://github.com/openwrt/openwrt/blob/master/target/linux/mediatek/patches-4.14/0033-dsa-multi-cpu.patch

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/dsa/mt7530.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a6a15a063e3e..441320d4d779 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -674,6 +674,9 @@ static int
 mt7530_cpu_port_enable(struct mt7530_priv *priv,
 		       int port)
 {
+	u8 port_mask = 0;
+	int i;
+
 	/* Enable Mediatek header mode on the cpu port */
 	mt7530_write(priv, MT7530_PVC_P(port),
 		     PORT_SPEC_TAG);
@@ -690,8 +693,14 @@ mt7530_cpu_port_enable(struct mt7530_priv *priv,
 	/* CPU port gets connected to all user ports of
 	 * the switch
 	 */
+
+	for (i = 0; i < MT7530_NUM_PORTS; i++)
+		if ((priv->ds->ports[port].type == DSA_PORT_TYPE_USER) &&
+		    (dsa_port_upstream_port(priv->ds, i) == port))
+			port_mask |= BIT(i);
+
 	mt7530_write(priv, MT7530_PCR_P(port),
-		     PCR_MATRIX(dsa_user_ports(priv->ds)));
+		     PCR_MATRIX(port_mask));
 
 	return 0;
 }
@@ -701,6 +710,7 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
 		   struct phy_device *phy)
 {
 	struct mt7530_priv *priv = ds->priv;
+	u8 upstream = dsa_port_upstream_port(ds, port);
 
 	mutex_lock(&priv->reg_mutex);
 
@@ -711,7 +721,7 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
 	 * restore the port matrix if the port is the member of a certain
 	 * bridge.
 	 */
-	priv->ports[port].pm |= PCR_MATRIX(BIT(MT7530_CPU_PORT));
+	priv->ports[port].pm |= PCR_MATRIX(BIT(upstream));
 	priv->ports[port].enable = true;
 	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_MATRIX_MASK,
 		   priv->ports[port].pm);
@@ -774,7 +784,8 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
 			struct net_device *bridge)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 port_bitmap = BIT(MT7530_CPU_PORT);
+	u8 upstream = dsa_port_upstream_port(ds, port);
+	u32 port_bitmap = BIT(upstream);
 	int i;
 
 	mutex_lock(&priv->reg_mutex);
@@ -875,6 +886,7 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 			 struct net_device *bridge)
 {
 	struct mt7530_priv *priv = ds->priv;
+	u8 upstream = dsa_port_upstream_port(ds, port);
 	int i;
 
 	mutex_lock(&priv->reg_mutex);
@@ -902,8 +914,8 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 	 */
 	if (priv->ports[port].enable)
 		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_MATRIX_MASK,
-			   PCR_MATRIX(BIT(MT7530_CPU_PORT)));
-	priv->ports[port].pm = PCR_MATRIX(BIT(MT7530_CPU_PORT));
+			   PCR_MATRIX(BIT(upstream)));
+	priv->ports[port].pm = PCR_MATRIX(BIT(upstream));
 
 	mt7530_port_set_vlan_unaware(ds, port);
 
@@ -1194,15 +1206,7 @@ mt7530_port_vlan_del(struct dsa_switch *ds, int port,
 static enum dsa_tag_protocol
 mtk_get_tag_protocol(struct dsa_switch *ds, int port)
 {
-	struct mt7530_priv *priv = ds->priv;
-
-	if (port != MT7530_CPU_PORT) {
-		dev_warn(priv->dev,
-			 "port not matched with tagging CPU port\n");
-		return DSA_TAG_PROTO_NONE;
-	} else {
-		return DSA_TAG_PROTO_MTK;
-	}
+	return DSA_TAG_PROTO_MTK;
 }
 
 static int
@@ -1275,7 +1279,7 @@ mt7530_setup(struct dsa_switch *ds)
 
 	/* Enable Port 6 only; P5 as GMAC5 which currently is not supported */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
-	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
+	val &= ~MHWTRAP_P5_DIS & ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
 	val |= MHWTRAP_MANUAL;
 	if (!dsa_is_cpu_port(ds, 5)) {
 		val |= MHWTRAP_P5_DIS;
-- 
2.17.1

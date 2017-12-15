From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 net-next 1/3] net: dsa: mediatek: add VLAN support for
 MT7530
Date: Fri, 15 Dec 2017 12:47:00 +0800
Message-ID: <6d30a71d913896fd21745ec88cb49298ae8aa225.1513312600.git.sean.wang@mediatek.com>
References: <cover.1513312600.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1513312600.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

MT7530 can treat each port as either VLAN-unaware port or VLAN-aware port
through the implementation of port matrix mode or port security mode on
the ingress port, respectively. On one hand, Each port has been acting as
the VLAN-unaware one whenever the device is created in the initial or
certain port joins or leaves into/from the bridge at the runtime. On the
other hand, the patch just filling the required callbacks for VLAN
operations is achieved via extending the port to be into port security
mode when the port is configured as VLAN-aware port. Which mode can make
the port be able to recognize VID from incoming packets and look up VLAN
table to validate and judge which port it should be going to. And the
range for VID from 1 to 4094 is valid for the hardware.

Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
---
 drivers/net/dsa/mt7530.c | 288 ++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/net/dsa/mt7530.h |  83 +++++++++++++-
 2 files changed, 364 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2820d69..8a0bb00 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -805,6 +805,69 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
 }
 
 static void
+mt7530_port_set_vlan_unaware(struct dsa_switch *ds, int port)
+{
+	struct mt7530_priv *priv = ds->priv;
+	bool all_user_ports_removed = true;
+	int i;
+
+	/* When a port is removed from the bridge, the port would be set up
+	 * back to the default as is at initial boot which is a VLAN-unaware
+	 * port.
+	 */
+	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
+		   MT7530_PORT_MATRIX_MODE);
+	mt7530_rmw(priv, MT7530_PVC_P(port), VLAN_ATTR_MASK,
+		   VLAN_ATTR(MT7530_VLAN_TRANSPARENT));
+
+	priv->ports[port].vlan_filtering = false;
+
+	for (i = 0; i < MT7530_NUM_PORTS; i++) {
+		if (dsa_is_user_port(ds, i) &&
+		    priv->ports[i].vlan_filtering) {
+			all_user_ports_removed = false;
+			break;
+		}
+	}
+
+	/* CPU port also does the same thing until all user ports belonging to
+	 * the CPU port get out of VLAN filtering mode.
+	 */
+	if (all_user_ports_removed) {
+		mt7530_write(priv, MT7530_PCR_P(MT7530_CPU_PORT),
+			     PCR_MATRIX(dsa_user_ports(priv->ds)));
+		mt7530_write(priv, MT7530_PVC_P(MT7530_CPU_PORT),
+			     PORT_SPEC_TAG);
+	}
+}
+
+static void
+mt7530_port_set_vlan_aware(struct dsa_switch *ds, int port)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	/* The real fabric path would be decided on the membership in the
+	 * entry of VLAN table. PCR_MATRIX set up here with ALL_MEMBERS
+	 * means potential VLAN can be consisting of certain subset of all
+	 * ports.
+	 */
+	mt7530_rmw(priv, MT7530_PCR_P(port),
+		   PCR_MATRIX_MASK, PCR_MATRIX(MT7530_ALL_MEMBERS));
+
+	/* Trapped into security mode allows packet forwarding through VLAN
+	 * table lookup.
+	 */
+	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
+		   MT7530_PORT_SECURITY_MODE);
+
+	/* Set the port as a user port which is to be able to recognize VID
+	 * from incoming packets before fetching entry within the VLAN table.
+	 */
+	mt7530_rmw(priv, MT7530_PVC_P(port), VLAN_ATTR_MASK,
+		   VLAN_ATTR(MT7530_VLAN_USER));
+}
+
+static void
 mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 			 struct net_device *bridge)
 {
@@ -817,8 +880,11 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 		/* Remove this port from the port matrix of the other ports
 		 * in the same bridge. If the port is disabled, port matrix
 		 * is kept and not being setup until the port becomes enabled.
+		 * And the other port's port matrix cannot be broken when the
+		 * other port is still a VLAN-aware port.
 		 */
-		if (dsa_is_user_port(ds, i) && i != port) {
+		if (!priv->ports[i].vlan_filtering &&
+		    dsa_is_user_port(ds, i) && i != port) {
 			if (dsa_to_port(ds, i)->bridge_dev != bridge)
 				continue;
 			if (priv->ports[i].enable)
@@ -836,6 +902,8 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 			   PCR_MATRIX(BIT(MT7530_CPU_PORT)));
 	priv->ports[port].pm = PCR_MATRIX(BIT(MT7530_CPU_PORT));
 
+	mt7530_port_set_vlan_unaware(ds, port);
+
 	mutex_unlock(&priv->reg_mutex);
 }
 
@@ -906,6 +974,220 @@ mt7530_port_fdb_dump(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static int
+mt7530_vlan_cmd(struct mt7530_priv *priv, enum mt7530_vlan_cmd cmd, u16 vid)
+{
+	struct mt7530_dummy_poll p;
+	u32 val;
+	int ret;
+
+	val = VTCR_BUSY | VTCR_FUNC(cmd) | vid;
+	mt7530_write(priv, MT7530_VTCR, val);
+
+	INIT_MT7530_DUMMY_POLL(&p, priv, MT7530_VTCR);
+	ret = readx_poll_timeout(_mt7530_read, &p, val,
+				 !(val & VTCR_BUSY), 20, 20000);
+	if (ret < 0) {
+		dev_err(priv->dev, "poll timeout\n");
+		return ret;
+	}
+
+	val = mt7530_read(priv, MT7530_VTCR);
+	if (val & VTCR_INVALID) {
+		dev_err(priv->dev, "read VTCR invalid\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+mt7530_port_vlan_filtering(struct dsa_switch *ds, int port,
+			   bool vlan_filtering)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	priv->ports[port].vlan_filtering = vlan_filtering;
+
+	if (vlan_filtering) {
+		/* The port is being kept as VLAN-unaware port when bridge is
+		 * set up with vlan_filtering not being set, Otherwise, the
+		 * port and the corresponding CPU port is required the setup
+		 * for becoming a VLAN-aware port.
+		 */
+		mt7530_port_set_vlan_aware(ds, port);
+		mt7530_port_set_vlan_aware(ds, MT7530_CPU_PORT);
+	}
+
+	return 0;
+}
+
+static int
+mt7530_port_vlan_prepare(struct dsa_switch *ds, int port,
+			 const struct switchdev_obj_port_vlan *vlan)
+{
+	/* nothing needed */
+
+	return 0;
+}
+
+static void
+mt7530_hw_vlan_add(struct mt7530_priv *priv,
+		   struct mt7530_hw_vlan_entry *entry)
+{
+	u8 new_members;
+	u32 val;
+
+	new_members = entry->old_members | BIT(entry->port) |
+		      BIT(MT7530_CPU_PORT);
+
+	/* Validate the entry with independent learning, create egress tag per
+	 * VLAN and joining the port as one of the port members.
+	 */
+	val = IVL_MAC | VTAG_EN | PORT_MEM(new_members) | VLAN_VALID;
+	mt7530_write(priv, MT7530_VAWD1, val);
+
+	/* Decide whether adding tag or not for those outgoing packets from the
+	 * port inside the VLAN.
+	 */
+	val = entry->untagged ? MT7530_VLAN_EGRESS_UNTAG :
+				MT7530_VLAN_EGRESS_TAG;
+	mt7530_rmw(priv, MT7530_VAWD2,
+		   ETAG_CTRL_P_MASK(entry->port),
+		   ETAG_CTRL_P(entry->port, val));
+
+	/* CPU port is always taken as a tagged port for serving more than one
+	 * VLANs across and also being applied with egress type stack mode for
+	 * that VLAN tags would be appended after hardware special tag used as
+	 * DSA tag.
+	 */
+	mt7530_rmw(priv, MT7530_VAWD2,
+		   ETAG_CTRL_P_MASK(MT7530_CPU_PORT),
+		   ETAG_CTRL_P(MT7530_CPU_PORT,
+			       MT7530_VLAN_EGRESS_STACK));
+}
+
+static void
+mt7530_hw_vlan_del(struct mt7530_priv *priv,
+		   struct mt7530_hw_vlan_entry *entry)
+{
+	u8 new_members;
+	u32 val;
+
+	new_members = entry->old_members & ~BIT(entry->port);
+
+	val = mt7530_read(priv, MT7530_VAWD1);
+	if (!(val & VLAN_VALID)) {
+		dev_err(priv->dev,
+			"Cannot be deleted due to invalid entry\n");
+		return;
+	}
+
+	/* If certain member apart from CPU port is still alive in the VLAN,
+	 * the entry would be kept valid. Otherwise, the entry is got to be
+	 * disabled.
+	 */
+	if (new_members && new_members != BIT(MT7530_CPU_PORT)) {
+		val = IVL_MAC | VTAG_EN | PORT_MEM(new_members) |
+		      VLAN_VALID;
+		mt7530_write(priv, MT7530_VAWD1, val);
+	} else {
+		mt7530_write(priv, MT7530_VAWD1, 0);
+		mt7530_write(priv, MT7530_VAWD2, 0);
+	}
+}
+
+static void
+mt7530_hw_vlan_update(struct mt7530_priv *priv, u16 vid,
+		      struct mt7530_hw_vlan_entry *entry,
+		      mt7530_vlan_op vlan_op)
+{
+	u32 val;
+
+	/* Fetch entry */
+	mt7530_vlan_cmd(priv, MT7530_VTCR_RD_VID, vid);
+
+	val = mt7530_read(priv, MT7530_VAWD1);
+
+	entry->old_members = (val >> PORT_MEM_SHFT) & PORT_MEM_MASK;
+
+	/* Manipulate entry */
+	vlan_op(priv, entry);
+
+	/* Flush result to hardware */
+	mt7530_vlan_cmd(priv, MT7530_VTCR_WR_VID, vid);
+}
+
+static void
+mt7530_port_vlan_add(struct dsa_switch *ds, int port,
+		     const struct switchdev_obj_port_vlan *vlan)
+{
+	bool untagged = vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED;
+	bool pvid = vlan->flags & BRIDGE_VLAN_INFO_PVID;
+	struct mt7530_hw_vlan_entry new_entry;
+	struct mt7530_priv *priv = ds->priv;
+	u16 vid;
+
+	/* The port is kept as VLAN-unaware if bridge with vlan_filtering not
+	 * being set.
+	 */
+	if (!priv->ports[port].vlan_filtering)
+		return;
+
+	mutex_lock(&priv->reg_mutex);
+
+	for (vid = vlan->vid_begin; vid <= vlan->vid_end; ++vid) {
+		mt7530_hw_vlan_entry_init(&new_entry, port, untagged);
+		mt7530_hw_vlan_update(priv, vid, &new_entry,
+				      mt7530_hw_vlan_add);
+	}
+
+	if (pvid) {
+		mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
+			   G0_PORT_VID(vlan->vid_end));
+		priv->ports[port].pvid = vlan->vid_end;
+	}
+
+	mutex_unlock(&priv->reg_mutex);
+}
+
+static int
+mt7530_port_vlan_del(struct dsa_switch *ds, int port,
+		     const struct switchdev_obj_port_vlan *vlan)
+{
+	struct mt7530_hw_vlan_entry target_entry;
+	struct mt7530_priv *priv = ds->priv;
+	u16 vid, pvid;
+
+	/* The port is kept as VLAN-unaware if bridge with vlan_filtering not
+	 * being set.
+	 */
+	if (!priv->ports[port].vlan_filtering)
+		return 0;
+
+	mutex_lock(&priv->reg_mutex);
+
+	pvid = priv->ports[port].pvid;
+	for (vid = vlan->vid_begin; vid <= vlan->vid_end; ++vid) {
+		mt7530_hw_vlan_entry_init(&target_entry, port, 0);
+		mt7530_hw_vlan_update(priv, vid, &target_entry,
+				      mt7530_hw_vlan_del);
+
+		/* PVID is being restored to the default whenever the PVID port
+		 * is being removed from the VLAN.
+		 */
+		if (pvid == vid)
+			pvid = G0_PORT_VID_DEF;
+	}
+
+	mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK, pvid);
+	priv->ports[port].pvid = pvid;
+
+	mutex_unlock(&priv->reg_mutex);
+
+	return 0;
+}
+
 static enum dsa_tag_protocol
 mtk_get_tag_protocol(struct dsa_switch *ds, int port)
 {
@@ -1035,6 +1317,10 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.port_fdb_add		= mt7530_port_fdb_add,
 	.port_fdb_del		= mt7530_port_fdb_del,
 	.port_fdb_dump		= mt7530_port_fdb_dump,
+	.port_vlan_filtering	= mt7530_port_vlan_filtering,
+	.port_vlan_prepare	= mt7530_port_vlan_prepare,
+	.port_vlan_add		= mt7530_port_vlan_add,
+	.port_vlan_del		= mt7530_port_vlan_del,
 };
 
 static int
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 74db982..d9b407a 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -17,6 +17,7 @@
 #define MT7530_NUM_PORTS		7
 #define MT7530_CPU_PORT			6
 #define MT7530_NUM_FDB_RECORDS		2048
+#define MT7530_ALL_MEMBERS		0xff
 
 #define	NUM_TRGMII_CTRL			5
 
@@ -88,21 +89,42 @@ enum mt7530_fdb_cmd {
 /* Register for vlan table control */
 #define MT7530_VTCR			0x90
 #define  VTCR_BUSY			BIT(31)
-#define  VTCR_FUNC			(((x) & 0xf) << 12)
-#define  VTCR_FUNC_RD_VID		0x1
-#define  VTCR_FUNC_WR_VID		0x2
-#define  VTCR_FUNC_INV_VID		0x3
-#define  VTCR_FUNC_VAL_VID		0x4
+#define  VTCR_INVALID			BIT(16)
+#define  VTCR_FUNC(x)			(((x) & 0xf) << 12)
 #define  VTCR_VID			((x) & 0xfff)
 
+enum mt7530_vlan_cmd {
+	/* Read/Write the specified VID entry from VAWD register based
+	 * on VID.
+	 */
+	MT7530_VTCR_RD_VID = 0,
+	MT7530_VTCR_WR_VID = 1,
+};
+
 /* Register for setup vlan and acl write data */
 #define MT7530_VAWD1			0x94
 #define  PORT_STAG			BIT(31)
+/* Independent VLAN Learning */
 #define  IVL_MAC			BIT(30)
+/* Per VLAN Egress Tag Control */
+#define  VTAG_EN			BIT(28)
+/* VLAN Member Control */
 #define  PORT_MEM(x)			(((x) & 0xff) << 16)
-#define  VALID				BIT(1)
+/* VLAN Entry Valid */
+#define  VLAN_VALID			BIT(0)
+#define  PORT_MEM_SHFT			16
+#define  PORT_MEM_MASK			0xff
 
 #define MT7530_VAWD2			0x98
+/* Egress Tag Control */
+#define  ETAG_CTRL_P(p, x)		(((x) & 0x3) << ((p) << 1))
+#define  ETAG_CTRL_P_MASK(p)		ETAG_CTRL_P(p, 3)
+
+enum mt7530_vlan_egress_attr {
+	MT7530_VLAN_EGRESS_UNTAG = 0,
+	MT7530_VLAN_EGRESS_TAG = 2,
+	MT7530_VLAN_EGRESS_STACK = 3,
+};
 
 /* Register for port STP state control */
 #define MT7530_SSP_P(x)			(0x2000 + ((x) * 0x100))
@@ -120,11 +142,23 @@ enum mt7530_stp_state {
 /* Register for port control */
 #define MT7530_PCR_P(x)			(0x2004 + ((x) * 0x100))
 #define  PORT_VLAN(x)			((x) & 0x3)
+
+enum mt7530_port_mode {
+	/* Port Matrix Mode: Frames are forwarded by the PCR_MATRIX members. */
+	MT7530_PORT_MATRIX_MODE = PORT_VLAN(0),
+
+	/* Security Mode: Discard any frame due to ingress membership
+	 * violation or VID missed on the VLAN table.
+	 */
+	MT7530_PORT_SECURITY_MODE = PORT_VLAN(3),
+};
+
 #define  PCR_MATRIX(x)			(((x) & 0xff) << 16)
 #define  PORT_PRI(x)			(((x) & 0x7) << 24)
 #define  EG_TAG(x)			(((x) & 0x3) << 28)
 #define  PCR_MATRIX_MASK		PCR_MATRIX(0xff)
 #define  PCR_MATRIX_CLR			PCR_MATRIX(0)
+#define  PCR_PORT_VLAN_MASK		PORT_VLAN(3)
 
 /* Register for port security control */
 #define MT7530_PSC_P(x)			(0x200c + ((x) * 0x100))
@@ -134,10 +168,20 @@ enum mt7530_stp_state {
 #define MT7530_PVC_P(x)			(0x2010 + ((x) * 0x100))
 #define  PORT_SPEC_TAG			BIT(5)
 #define  VLAN_ATTR(x)			(((x) & 0x3) << 6)
+#define  VLAN_ATTR_MASK			VLAN_ATTR(3)
+
+enum mt7530_vlan_port_attr {
+	MT7530_VLAN_USER = 0,
+	MT7530_VLAN_TRANSPARENT = 3,
+};
+
 #define  STAG_VPID			(((x) & 0xffff) << 16)
 
 /* Register for port port-and-protocol based vlan 1 control */
 #define MT7530_PPBV1_P(x)		(0x2014 + ((x) * 0x100))
+#define  G0_PORT_VID(x)			(((x) & 0xfff) << 0)
+#define  G0_PORT_VID_MASK		G0_PORT_VID(0xfff)
+#define  G0_PORT_VID_DEF		G0_PORT_VID(1)
 
 /* Register for port MAC control register */
 #define MT7530_PMCR_P(x)		(0x3000 + ((x) * 0x100))
@@ -345,9 +389,20 @@ struct mt7530_fdb {
 	bool noarp;
 };
 
+/* struct mt7530_port -	This is the main data structure for holding the state
+ *			of the port.
+ * @enable:	The status used for show port is enabled or not.
+ * @pm:		The matrix used to show all connections with the port.
+ * @pvid:	The VLAN specified is to be considered a PVID at ingress.  Any
+ *		untagged frames will be assigned to the related VLAN.
+ * @vlan_filtering: The flags indicating whether the port that can recognize
+ *		    VLAN-tagged frames.
+ */
 struct mt7530_port {
 	bool enable;
 	u32 pm;
+	u16 pvid;
+	bool vlan_filtering;
 };
 
 /* struct mt7530_priv -	This is the main data structure for holding the state
@@ -382,6 +437,22 @@ struct mt7530_priv {
 	struct mutex reg_mutex;
 };
 
+struct mt7530_hw_vlan_entry {
+	int port;
+	u8  old_members;
+	bool untagged;
+};
+
+static inline void mt7530_hw_vlan_entry_init(struct mt7530_hw_vlan_entry *e,
+					     int port, bool untagged)
+{
+	e->port = port;
+	e->untagged = untagged;
+}
+
+typedef void (*mt7530_vlan_op)(struct mt7530_priv *,
+			       struct mt7530_hw_vlan_entry *);
+
 struct mt7530_hw_stats {
 	const char	*string;
 	u16		reg;
-- 
2.7.4

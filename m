Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF87C41513
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZYZis2XMVwVPPVMMMc8/iJ2Rd0WJw/FwEKDW3OP/a1A=; b=v3NGrY12LROC/idQOHfmpQx75G
	0su6OM8QRnyIjr0Shhad0gnYdDP1BtcZe771SYqJ/4HhtJSLIna05vrYocQbJZMNPF3LioVdjoC4i
	/r0U/Q57P9tIFshU0CCZnA5PWwoqxwuUl4a7q4rwaJ0i380gOY8TQDppoXjeZlB9KRDFAv5Hz5NX4
	Hzp7jXP4tYrRuIiyVhhJIUtJa004OtYVFktVPdqY0sGLEMlN8wliuWJUVmH+Luy9bCJ+eSUVhXA/i
	EDqSAcIYfAgBzRagjGoj9s8ot67SSZs6pI4aNlZHk8nCuk9KvL/FZ7DXYAN5GFLtBz1158pyYTutW
	zNiFb+sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIFJe-000000049Sg-3lRn;
	Fri, 14 Jun 2024 22:22:38 +0000
Received: from orthanc.universe-factory.net ([104.238.176.138])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIFJa-000000049RE-1Rg3;
	Fri, 14 Jun 2024 22:22:35 +0000
Received: from avalon.fritz.box (unknown [IPv6:2001:19f0:6c01:100::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by orthanc.universe-factory.net (Postfix) with ESMTPSA id AF1C71F401;
	Sat, 15 Jun 2024 00:22:27 +0200 (CEST)
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Schiffer <mschiffer@universe-factory.net>
Subject: [PATCH net-next 1/2] net: dsa: mt7530: factor out bridge join/leave logic
Date: Sat, 15 Jun 2024 00:21:53 +0200
Message-ID: <378bc964b49f9e9954336e99009932ac22bfe172.1718400508.git.mschiffer@universe-factory.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_152234_554116_CCF13D48 
X-CRM114-Status: GOOD (  20.58  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As preparation for implementing bridge port isolation, move the logic to
add and remove bits in the port matrix into a new helper
mt7530_update_port_member(), which is called from
mt7530_port_bridge_join() and mt7530_port_bridge_leave().

No functional change intended.

Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---
 drivers/net/dsa/mt7530.c | 103 +++++++++++++++++----------------------
 1 file changed, 46 insertions(+), 57 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 598434d8d6e4..ecacaefdd694 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1302,6 +1302,50 @@ mt7530_stp_state_set(struct dsa_switch *ds, int port, u8 state)
 		   FID_PST(FID_BRIDGED, stp_state));
 }
 
+static void mt7530_update_port_member(struct mt7530_priv *priv, int port,
+				      const struct net_device *bridge_dev, bool join)
+	__must_hold(&priv->reg_mutex)
+{
+	struct dsa_port *dp = dsa_to_port(priv->ds, port), *other_dp;
+	struct mt7530_port *p = &priv->ports[port], *other_p;
+	struct dsa_port *cpu_dp = dp->cpu_dp;
+	u32 port_bitmap = BIT(cpu_dp->index);
+	int other_port;
+
+	dsa_switch_for_each_user_port(other_dp, priv->ds) {
+		other_port = other_dp->index;
+		other_p = &priv->ports[other_port];
+
+		if (dp == other_dp)
+			continue;
+
+		/* Add/remove this port to/from the port matrix of the other
+		 * ports in the same bridge. If the port is disabled, port
+		 * matrix is kept and not being setup until the port becomes
+		 * enabled.
+		 */
+		if (!dsa_port_offloads_bridge_dev(other_dp, bridge_dev))
+			continue;
+
+		if (join) {
+			other_p->pm |= PCR_MATRIX(BIT(port));
+			port_bitmap |= BIT(other_port);
+		} else {
+			other_p->pm &= ~PCR_MATRIX(BIT(port));
+		}
+
+		if (other_p->enable)
+			mt7530_rmw(priv, MT7530_PCR_P(other_port),
+				   PCR_MATRIX_MASK, other_p->pm);
+	}
+
+	/* Add/remove the all other ports to this port matrix. */
+	p->pm = PCR_MATRIX(port_bitmap);
+	if (priv->ports[port].enable)
+		mt7530_rmw(priv, MT7530_PCR_P(port),
+			   PCR_MATRIX_MASK, p->pm);
+}
+
 static int
 mt7530_port_pre_bridge_flags(struct dsa_switch *ds, int port,
 			     struct switchdev_brport_flags flags,
@@ -1345,39 +1389,11 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
 			struct dsa_bridge bridge, bool *tx_fwd_offload,
 			struct netlink_ext_ack *extack)
 {
-	struct dsa_port *dp = dsa_to_port(ds, port), *other_dp;
-	struct dsa_port *cpu_dp = dp->cpu_dp;
-	u32 port_bitmap = BIT(cpu_dp->index);
 	struct mt7530_priv *priv = ds->priv;
 
 	mutex_lock(&priv->reg_mutex);
 
-	dsa_switch_for_each_user_port(other_dp, ds) {
-		int other_port = other_dp->index;
-
-		if (dp == other_dp)
-			continue;
-
-		/* Add this port to the port matrix of the other ports in the
-		 * same bridge. If the port is disabled, port matrix is kept
-		 * and not being setup until the port becomes enabled.
-		 */
-		if (!dsa_port_offloads_bridge(other_dp, &bridge))
-			continue;
-
-		if (priv->ports[other_port].enable)
-			mt7530_set(priv, MT7530_PCR_P(other_port),
-				   PCR_MATRIX(BIT(port)));
-		priv->ports[other_port].pm |= PCR_MATRIX(BIT(port));
-
-		port_bitmap |= BIT(other_port);
-	}
-
-	/* Add the all other ports to this port matrix. */
-	if (priv->ports[port].enable)
-		mt7530_rmw(priv, MT7530_PCR_P(port),
-			   PCR_MATRIX_MASK, PCR_MATRIX(port_bitmap));
-	priv->ports[port].pm |= PCR_MATRIX(port_bitmap);
+	mt7530_update_port_member(priv, port, bridge.dev, true);
 
 	/* Set to fallback mode for independent VLAN learning */
 	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
@@ -1478,38 +1494,11 @@ static void
 mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 			 struct dsa_bridge bridge)
 {
-	struct dsa_port *dp = dsa_to_port(ds, port), *other_dp;
-	struct dsa_port *cpu_dp = dp->cpu_dp;
 	struct mt7530_priv *priv = ds->priv;
 
 	mutex_lock(&priv->reg_mutex);
 
-	dsa_switch_for_each_user_port(other_dp, ds) {
-		int other_port = other_dp->index;
-
-		if (dp == other_dp)
-			continue;
-
-		/* Remove this port from the port matrix of the other ports
-		 * in the same bridge. If the port is disabled, port matrix
-		 * is kept and not being setup until the port becomes enabled.
-		 */
-		if (!dsa_port_offloads_bridge(other_dp, &bridge))
-			continue;
-
-		if (priv->ports[other_port].enable)
-			mt7530_clear(priv, MT7530_PCR_P(other_port),
-				     PCR_MATRIX(BIT(port)));
-		priv->ports[other_port].pm &= ~PCR_MATRIX(BIT(port));
-	}
-
-	/* Set the cpu port to be the only one in the port matrix of
-	 * this port.
-	 */
-	if (priv->ports[port].enable)
-		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_MATRIX_MASK,
-			   PCR_MATRIX(BIT(cpu_dp->index)));
-	priv->ports[port].pm = PCR_MATRIX(BIT(cpu_dp->index));
+	mt7530_update_port_member(priv, port, bridge.dev, false);
 
 	/* When a port is removed from the bridge, the port would be set up
 	 * back to the default as is at initial boot which is a VLAN-unaware
-- 
2.45.2



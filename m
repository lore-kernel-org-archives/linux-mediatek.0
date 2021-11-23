Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92348C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bJIA0/yuzey1lG3ZQdBBkrR0cB1Cnfm+u9ajdbgeKA=; b=YOnoApZ8lqLB8i
	rGWAy9FVbmbVCi7iXitQfhR5PHFwDFatlwEBzY0A5noRD9FHWW1bQRR2t7fCu7vPqbCODYdQ76jrp
	SfhC45HZMj60RqXwjH4NOUcw3ibMhLgNmZ44QpPddzivooINIYndZlBIgcIn8vDWShIKQAkp/tMjS
	BW74MDv8Ywjs9Wt0XqeVA8PjSKkD7k3MhxhvZhYbY7W1rrmTvIWX95RMwWWX63I7d43U/K4ZxweRP
	j/t/nUM8rpSuDX8RMEjYIcKgOEsDNjP0mZZ++aF0IUpVi011WnhM5SOPcksIfj2JphXcyfXJB39XM
	cSOj2JB0S5WiO9PA+jIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpSdh-001bzO-I6; Tue, 23 Nov 2021 10:03:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpSd3-001anJ-K1; Tue, 23 Nov 2021 10:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=duXHLomEjDNg78y+Mdk92Vi4EmOn6BUlBnGXhSw1tg4=; b=xQF9OB60AtLiQArSuJ/UXVLd3S
 8HjB630S8dHL3e1iQ/Jscga+KObWLqy4D9+HL/3oQresDkBm1uX09HMf8VnIXJcZFLjWoRowtDQEV
 3u9DSiCa/DndDWxml5S9roVffTizvr+OUEZJyaxsiZSXl0Jfot8tDtqvmxdyY/0IKN2tjuzMcaDRJ
 NnjBxAJzd6tag/OKl6yUwGFT2sZ8V8OQg/F7hs0hwmc1tKVy55W7mHBAbSXCTfxxU+sTH9PvMcuq3
 vmCfeBK+3YsobU8AiaQihC9YmPUde03omi7I/A80PiN2f8aqd7RvHBBeReYOK5bGbLM7y1n8Cqja6
 90OxPBzg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36034 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mpSb1-0007hW-EQ; Tue, 23 Nov 2021 10:00:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mpSb0-00BXoP-Dr; Tue, 23 Nov 2021 10:00:14 +0000
In-Reply-To: <YZy59OTNCpKoPZT/@shell.armlinux.org.uk>
References: <YZy59OTNCpKoPZT/@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>,
 John Crispin <john@phrozen.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,"David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>,Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: [PATCH RFC net-next 1/8] net: dsa: consolidate phylink creation
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mpSb0-00BXoP-Dr@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Nov 2021 10:00:14 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_020221_700621_F227423A 
X-CRM114-Status: GOOD (  13.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The code in port.c and slave.c creating the phylink instance is very
similar - let's consolidate this into a single function.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 net/dsa/dsa_priv.h |  2 +-
 net/dsa/port.c     | 44 ++++++++++++++++++++++++++++----------------
 net/dsa/slave.c    | 19 +++----------------
 3 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/net/dsa/dsa_priv.h b/net/dsa/dsa_priv.h
index a5c9bc7b66c6..3fb2c37c9b88 100644
--- a/net/dsa/dsa_priv.h
+++ b/net/dsa/dsa_priv.h
@@ -258,13 +258,13 @@ int dsa_port_mrp_add_ring_role(const struct dsa_port *dp,
 			       const struct switchdev_obj_ring_role_mrp *mrp);
 int dsa_port_mrp_del_ring_role(const struct dsa_port *dp,
 			       const struct switchdev_obj_ring_role_mrp *mrp);
+int dsa_port_phylink_create(struct dsa_port *dp);
 int dsa_port_link_register_of(struct dsa_port *dp);
 void dsa_port_link_unregister_of(struct dsa_port *dp);
 int dsa_port_hsr_join(struct dsa_port *dp, struct net_device *hsr);
 void dsa_port_hsr_leave(struct dsa_port *dp, struct net_device *hsr);
 int dsa_port_tag_8021q_vlan_add(struct dsa_port *dp, u16 vid, bool broadcast);
 void dsa_port_tag_8021q_vlan_del(struct dsa_port *dp, u16 vid, bool broadcast);
-extern const struct phylink_mac_ops dsa_port_phylink_mac_ops;
 
 static inline bool dsa_port_offloads_bridge_port(struct dsa_port *dp,
 						 const struct net_device *dev)
diff --git a/net/dsa/port.c b/net/dsa/port.c
index f6f12ad2b525..eaa66114924b 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -1072,7 +1072,7 @@ static void dsa_port_phylink_mac_link_up(struct phylink_config *config,
 				     speed, duplex, tx_pause, rx_pause);
 }
 
-const struct phylink_mac_ops dsa_port_phylink_mac_ops = {
+static const struct phylink_mac_ops dsa_port_phylink_mac_ops = {
 	.validate = dsa_port_phylink_validate,
 	.mac_pcs_get_state = dsa_port_phylink_mac_pcs_get_state,
 	.mac_config = dsa_port_phylink_mac_config,
@@ -1081,6 +1081,30 @@ const struct phylink_mac_ops dsa_port_phylink_mac_ops = {
 	.mac_link_up = dsa_port_phylink_mac_link_up,
 };
 
+int dsa_port_phylink_create(struct dsa_port *dp)
+{
+	struct dsa_switch *ds = dp->ds;
+	phy_interface_t mode;
+	int err;
+
+	err = of_get_phy_mode(dp->dn, &mode);
+	if (err)
+		mode = PHY_INTERFACE_MODE_NA;
+
+	if (ds->ops->phylink_get_interfaces)
+		ds->ops->phylink_get_interfaces(ds, dp->index,
+					dp->pl_config.supported_interfaces);
+
+	dp->pl = phylink_create(&dp->pl_config, of_fwnode_handle(dp->dn),
+				mode, &dsa_port_phylink_mac_ops);
+	if (IS_ERR(dp->pl)) {
+		pr_err("error creating PHYLINK: %ld\n", PTR_ERR(dp->pl));
+		return PTR_ERR(dp->pl);
+	}
+
+	return 0;
+}
+
 static int dsa_port_setup_phy_of(struct dsa_port *dp, bool enable)
 {
 	struct dsa_switch *ds = dp->ds;
@@ -1157,27 +1181,15 @@ static int dsa_port_phylink_register(struct dsa_port *dp)
 {
 	struct dsa_switch *ds = dp->ds;
 	struct device_node *port_dn = dp->dn;
-	phy_interface_t mode;
 	int err;
 
-	err = of_get_phy_mode(port_dn, &mode);
-	if (err)
-		mode = PHY_INTERFACE_MODE_NA;
-
 	dp->pl_config.dev = ds->dev;
 	dp->pl_config.type = PHYLINK_DEV;
 	dp->pl_config.pcs_poll = ds->pcs_poll;
 
-	if (ds->ops->phylink_get_interfaces)
-		ds->ops->phylink_get_interfaces(ds, dp->index,
-					dp->pl_config.supported_interfaces);
-
-	dp->pl = phylink_create(&dp->pl_config, of_fwnode_handle(port_dn),
-				mode, &dsa_port_phylink_mac_ops);
-	if (IS_ERR(dp->pl)) {
-		pr_err("error creating PHYLINK: %ld\n", PTR_ERR(dp->pl));
-		return PTR_ERR(dp->pl);
-	}
+	err = dsa_port_phylink_create(dp);
+	if (err)
+		return err;
 
 	err = phylink_of_phy_connect(dp->pl, port_dn, 0);
 	if (err && err != -ENODEV) {
diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index ad61f6bc8886..33b54eadc641 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -1851,14 +1851,9 @@ static int dsa_slave_phy_setup(struct net_device *slave_dev)
 	struct dsa_port *dp = dsa_slave_to_port(slave_dev);
 	struct device_node *port_dn = dp->dn;
 	struct dsa_switch *ds = dp->ds;
-	phy_interface_t mode;
 	u32 phy_flags = 0;
 	int ret;
 
-	ret = of_get_phy_mode(port_dn, &mode);
-	if (ret)
-		mode = PHY_INTERFACE_MODE_NA;
-
 	dp->pl_config.dev = &slave_dev->dev;
 	dp->pl_config.type = PHYLINK_NETDEV;
 
@@ -1871,17 +1866,9 @@ static int dsa_slave_phy_setup(struct net_device *slave_dev)
 		dp->pl_config.poll_fixed_state = true;
 	}
 
-	if (ds->ops->phylink_get_interfaces)
-		ds->ops->phylink_get_interfaces(ds, dp->index,
-					dp->pl_config.supported_interfaces);
-
-	dp->pl = phylink_create(&dp->pl_config, of_fwnode_handle(port_dn), mode,
-				&dsa_port_phylink_mac_ops);
-	if (IS_ERR(dp->pl)) {
-		netdev_err(slave_dev,
-			   "error creating PHYLINK: %ld\n", PTR_ERR(dp->pl));
-		return PTR_ERR(dp->pl);
-	}
+	ret = dsa_port_phylink_create(dp);
+	if (ret)
+		return ret;
 
 	if (ds->ops->get_phy_flags)
 		phy_flags = ds->ops->get_phy_flags(ds, dp->index);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 3/7] [DSA] adding handling of second CPU-Port
Date: Tue, 11 Dec 2018 20:33:10 +0100
Message-ID: <20181211193314.10695-3-frank-w@public-files.de>
References: <20181211193314.10695-1-frank-w@public-files.de>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181211193314.10695-1-frank-w@public-files.de>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: linux-mediatek@lists.infradead.org

based on
https://github.com/openwrt/openwrt/blob/master/target/linux/mediatek/patches-4.14/0033-dsa-multi-cpu.patch

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 net/dsa/dsa2.c  | 18 ++++++++++++++++++
 net/dsa/slave.c |  3 ++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
index 77420675e9ed..4a6ebfe647f0 100644
--- a/net/dsa/dsa2.c
+++ b/net/dsa/dsa2.c
@@ -303,6 +303,8 @@ static int dsa_port_setup(struct dsa_port *dp)
 				ds->index, dp->index);
 			return err;
 		}
+		if (dp->master)
+			dp->master->dsa_ptr = dp;
 		break;
 	case DSA_PORT_TYPE_DSA:
 		/* dp->index is used now as port_number. However
@@ -323,12 +325,17 @@ static int dsa_port_setup(struct dsa_port *dp)
 		devlink_port_attrs_set(&dp->devlink_port,
 				       DEVLINK_PORT_FLAVOUR_PHYSICAL,
 				       dp->index, false, 0);
+		err = dsa_user_parse(dp, dp->index, ds);
+		if (err)
+			return err;
+
 		err = dsa_slave_create(dp);
 		if (err)
 			dev_err(ds->dev, "failed to create slave for port %d.%d\n",
 				ds->index, dp->index);
 		else
 			devlink_port_type_eth_set(&dp->devlink_port, dp->slave);
+
 		break;
 	}
 
@@ -344,6 +351,14 @@ static void dsa_port_teardown(struct dsa_port *dp)
 	case DSA_PORT_TYPE_UNUSED:
 		break;
 	case DSA_PORT_TYPE_CPU:
+		dsa_port_link_unregister_of(dp);
+		if (dp->master)
+			dp->master->dsa_ptr = NULL;
+		if (dp->ethernet) {
+			dev_put(dp->ethernet);
+			dp->ethernet = NULL;
+		}
+		break;
 	case DSA_PORT_TYPE_DSA:
 		dsa_port_link_unregister_of(dp);
 		break;
@@ -598,6 +613,9 @@ static int dsa_port_parse_cpu(struct dsa_port *dp, struct net_device *master)
 	dp->master = master;
 	dp->dst = dst;
 
+	dev_hold(master);
+	ds->ports[dp->index].ethernet = master;
+
 	return 0;
 }
 
diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index 7d0c19e7edcf..f0fdb9e5d05f 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -1312,11 +1312,11 @@ static void dsa_slave_notify(struct net_device *dev, unsigned long val)
 int dsa_slave_create(struct dsa_port *port)
 {
 	const struct dsa_port *cpu_dp = port->cpu_dp;
-	struct net_device *master = cpu_dp->master;
 	struct dsa_switch *ds = port->ds;
 	const char *name = port->name;
 	struct net_device *slave_dev;
 	struct dsa_slave_priv *p;
+	struct net_device *master = ds->ports[port->upstream].ethernet;
 	int ret;
 
 	if (!ds->num_tx_queues)
@@ -1355,6 +1355,7 @@ int dsa_slave_create(struct dsa_port *port)
 	p->dp = port;
 	INIT_LIST_HEAD(&p->mall_tc_list);
 	p->xmit = cpu_dp->tag_ops->xmit;
+	p->master = master;
 	port->slave = slave_dev;
 
 	netif_carrier_off(slave_dev);
-- 
2.17.1

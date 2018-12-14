From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 1/8] net: dsa: adding fields for holding information about upstream-port
Date: Fri, 14 Dec 2018 17:48:40 +0100
Message-ID: <20181214164847.4851-2-frank-w@public-files.de>
References: <20181214164847.4851-1-frank-w@public-files.de>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181214164847.4851-1-frank-w@public-files.de>
Sender: netdev-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: linux-mediatek@lists.infradead.org

for multiple cpu-Ports aech port needs storing the the cpu-port to be used
this Patch adds the needed fields for this

based on
https://github.com/openwrt/openwrt/blob/master/target/linux/mediatek/patches-4.14/0033-dsa-multi-cpu.patch

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 include/net/dsa.h  | 4 ++++
 net/dsa/dsa_priv.h | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 23690c44e167..3efa81e08993 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -203,6 +203,10 @@ struct dsa_port {
 	struct net_device	*bridge_dev;
 	struct devlink_port	devlink_port;
 	struct phylink		*pl;
+
+	struct net_device	*ethernet;
+	int			upstream;
+
 	/*
 	 * Original copy of the master netdev ethtool_ops
 	 */
diff --git a/net/dsa/dsa_priv.h b/net/dsa/dsa_priv.h
index 9e4fd04ab53c..cc0cd7675117 100644
--- a/net/dsa/dsa_priv.h
+++ b/net/dsa/dsa_priv.h
@@ -81,6 +81,8 @@ struct dsa_slave_priv {
 
 	/* TC context */
 	struct list_head	mall_tc_list;
+
+	struct net_device       *master;
 };
 
 /* dsa.c */
@@ -188,7 +190,10 @@ static inline struct net_device *
 dsa_slave_to_master(const struct net_device *dev)
 {
 	struct dsa_port *dp = dsa_slave_to_port(dev);
+	struct dsa_slave_priv *p = netdev_priv(dev);
 
+	if (p->master)
+		return p->master;
 	return dp->cpu_dp->master;
 }
 
-- 
2.17.1

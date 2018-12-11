From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 1/7] [DSA] adding fields for holding information about upstream-port
Date: Tue, 11 Dec 2018 20:33:08 +0100
Message-ID: <20181211193314.10695-1-frank-w@public-files.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: linux-mediatek@lists.infradead.org

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

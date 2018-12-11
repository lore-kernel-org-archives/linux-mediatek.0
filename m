From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 2/7] [DSA] add helper functions
Date: Tue, 11 Dec 2018 20:33:09 +0100
Message-ID: <20181211193314.10695-2-frank-w@public-files.de>
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
 include/net/dsa.h | 18 ++++++++++++++++++
 net/dsa/dsa2.c    | 18 ++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 3efa81e08993..612942ac56de 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -319,6 +319,12 @@ static inline unsigned int dsa_towards_port(struct dsa_switch *ds, int device,
 		return ds->rtable[device];
 }
 
+
+static inline bool dsa_is_upstream_port(struct dsa_switch *ds, int p)
+{
+	return dsa_is_cpu_port(ds, p) || dsa_is_dsa_port(ds, p);
+}
+
 /* Return the local port used to reach the dedicated CPU port */
 static inline unsigned int dsa_upstream_port(struct dsa_switch *ds, int port)
 {
@@ -331,6 +337,18 @@ static inline unsigned int dsa_upstream_port(struct dsa_switch *ds, int port)
 	return dsa_towards_port(ds, cpu_dp->ds->index, cpu_dp->index);
 }
 
+static inline u8 dsa_port_upstream_port(struct dsa_switch *ds, int port)
+{
+	/*
+	 * If this port has a specific upstream cpu port, use it,
+	 * otherwise use the switch default.
+	 */
+	if (ds->ports[port].upstream)
+		return ds->ports[port].upstream;
+	else
+		return dsa_upstream_port(ds, port);
+}
+
 typedef int dsa_fdb_dump_cb_t(const unsigned char *addr, u16 vid,
 			      bool is_static, void *data);
 struct dsa_switch_ops {
diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
index a1917025e155..77420675e9ed 100644
--- a/net/dsa/dsa2.c
+++ b/net/dsa/dsa2.c
@@ -255,6 +255,24 @@ static void dsa_tree_teardown_default_cpu(struct dsa_switch_tree *dst)
 	dst->cpu_dp = NULL;
 }
 
+static int dsa_user_parse(struct dsa_port *port, u32 index,
+			  struct dsa_switch *ds)
+{
+	struct device_node *cpu_port;
+	const unsigned int *cpu_port_reg;
+	int cpu_port_index;
+
+	cpu_port = of_parse_phandle(port->dn, "cpu", 0);
+	if (cpu_port) {
+		cpu_port_reg = of_get_property(cpu_port, "reg", NULL);
+		if (!cpu_port_reg)
+			return -EINVAL;
+		cpu_port_index = be32_to_cpup(cpu_port_reg);
+		ds->ports[index].upstream = cpu_port_index;
+	}
+	return 0;
+}
+
 static int dsa_port_setup(struct dsa_port *dp)
 {
 	struct dsa_switch *ds = dp->ds;
-- 
2.17.1

From: Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH 5/5] net: dsa: fix a leaked reference by adding missing of_node_put
Date: Fri, 22 Feb 2019 15:15:42 +0800
Message-ID: <1550819742-32155-5-git-send-email-wen.yang99@zte.com.cn>
References: <1550819742-32155-1-git-send-email-wen.yang99@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550819742-32155-1-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com, UNGLinuxDriver@microchip.com, nbd@nbd.name, lorenzo.bianconi83@gmail.com, kvalo@codeaurora.org, matthias.bgg@gmail.com, linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, anirudh@xilinx.com, John.Linn@xilinx.com, michal.simek@xilinx.com, wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>
List-Id: linux-mediatek@lists.infradead.org

The call to of_parse_phandle returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./net/dsa/port.c:294:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 284, but without a corresponding object release within this function.
./net/dsa/dsa2.c:627:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 618, but without a corresponding object release within this function.
./net/dsa/dsa2.c:630:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 618, but without a corresponding object release within this function.
./net/dsa/dsa2.c:636:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 618, but without a corresponding object release within this function.
./net/dsa/dsa2.c:639:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 618, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Vivien Didelot <vivien.didelot@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 net/dsa/dsa2.c | 16 ++++++++++------
 net/dsa/port.c |  1 +
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
index 8c431e0..89823f0 100644
--- a/net/dsa/dsa2.c
+++ b/net/dsa/dsa2.c
@@ -613,7 +613,7 @@ static int dsa_switch_parse_ports_of(struct dsa_switch *ds,
 	struct device_node *ports, *port;
 	struct dsa_port *dp;
 	u32 reg;
-	int err;
+	int err = 0;
 
 	ports = of_get_child_by_name(dn, "ports");
 	if (!ports) {
@@ -624,19 +624,23 @@ static int dsa_switch_parse_ports_of(struct dsa_switch *ds,
 	for_each_available_child_of_node(ports, port) {
 		err = of_property_read_u32(port, "reg", &reg);
 		if (err)
-			return err;
+			goto out_put_node;
 
-		if (reg >= ds->num_ports)
-			return -EINVAL;
+		if (reg >= ds->num_ports) {
+			err = -EINVAL;
+			goto out_put_node;
+		}
 
 		dp = &ds->ports[reg];
 
 		err = dsa_port_parse_of(dp, port);
 		if (err)
-			return err;
+			goto out_put_node;
 	}
 
-	return 0;
+out_put_node:
+	of_node_put(ports);
+	return err;
 }
 
 static int dsa_switch_parse_member_of(struct dsa_switch *ds,
diff --git a/net/dsa/port.c b/net/dsa/port.c
index 2d7e01b..a6d9a04 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -291,6 +291,7 @@ static struct phy_device *dsa_port_get_phy_device(struct dsa_port *dp)
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
+	of_node_put(phy_dn);
 	return phydev;
 }
 
-- 
2.9.5

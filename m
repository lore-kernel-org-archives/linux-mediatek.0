From: Wen Yang <wen.yang99-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>
Subject: [PATCH 2/5] net: mscc: ocelot: fix a leaked reference by adding a missing of_node_put
Date: Fri, 22 Feb 2019 15:15:39 +0800
Message-ID: <1550819742-32155-2-git-send-email-wen.yang99@zte.com.cn>
References: <1550819742-32155-1-git-send-email-wen.yang99@zte.com.cn>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1550819742-32155-1-git-send-email-wen.yang99-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: andrew-g2DYL2Zd6BY@public.gmane.org, vivien.didelot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, UNGLinuxDriver-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org, lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, wang.yi59-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, Wen Yang <wen.yang99-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

The call to of_parse_phandle returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./drivers/net/ethernet/mscc/ocelot_board.c:293:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 249, but without a corresponding object release within this function.
./drivers/net/ethernet/mscc/ocelot_board.c:312:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 249, but without a corresponding object release within this function.
./drivers/net/ethernet/mscc/ocelot_board.c:336:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 249, but without a corresponding object release within this function.
./drivers/net/ethernet/mscc/ocelot_board.c:339:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 249, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Microchip Linux Driver Support <UNGLinuxDriver-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/net/ethernet/mscc/ocelot_board.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot_board.c b/drivers/net/ethernet/mscc/ocelot_board.c
index ca3ea2f..f1485a6 100644
--- a/drivers/net/ethernet/mscc/ocelot_board.c
+++ b/drivers/net/ethernet/mscc/ocelot_board.c
@@ -290,7 +290,7 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 
 		err = ocelot_probe_port(ocelot, port, regs, phy);
 		if (err)
-			return err;
+			goto err_probe_ports;
 
 		err = of_get_phy_mode(portnp);
 		if (err < 0)
@@ -309,7 +309,8 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 			dev_err(ocelot->dev,
 				"invalid phy mode for port%d, (Q)SGMII only\n",
 				port);
-			return -EINVAL;
+			err = -EINVAL;
+			goto err_probe_ports;
 		}
 
 		serdes = devm_of_phy_get(ocelot->dev, portnp, NULL);
@@ -328,6 +329,7 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 		ocelot->ports[port]->serdes = serdes;
 	}
 
+	of_node_put(ports);
 	register_netdevice_notifier(&ocelot_netdevice_nb);
 	register_switchdev_blocking_notifier(&ocelot_switchdev_blocking_nb);
 
@@ -336,6 +338,7 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 	return 0;
 
 err_probe_ports:
+	of_node_put(ports);
 	return err;
 }
 
-- 
2.9.5

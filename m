From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 7/7] [DSA] mt7530 add linking to mdio
Date: Tue, 11 Dec 2018 20:33:14 +0100
Message-ID: <20181211193314.10695-7-frank-w@public-files.de>
References: <20181211193314.10695-1-frank-w@public-files.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211193314.10695-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: linux-mediatek@lists.infradead.org

based on
https://github.com/openwrt/openwrt/blob/master/target/linux/mediatek/patches-4.14/0045-net-dsa-mediatek-turn-into-platform-driver.patch

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/dsa/mt7530.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 83669f53cb36..e529bc334459 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1345,7 +1345,7 @@ static int
 mt7530_probe(struct mdio_device *mdiodev)
 {
 	struct mt7530_priv *priv;
-	struct device_node *dn;
+	struct device_node *dn, *mdio;
 
 	dn = mdiodev->dev.of_node;
 
@@ -1392,8 +1392,14 @@ mt7530_probe(struct mdio_device *mdiodev)
 			return PTR_ERR(priv->reset);
 		}
 	}
+	mdio = of_get_parent(dn);
+	if (!mdio)
+		return -EINVAL;
+
+	priv->bus = of_mdio_find_bus(mdio);
+	if (!priv->bus)
+		return -EPROBE_DEFER;
 
-	priv->bus = mdiodev->bus;
 	priv->dev = &mdiodev->dev;
 	priv->ds->priv = priv;
 	priv->ds->ops = &mt7530_switch_ops;
-- 
2.17.1

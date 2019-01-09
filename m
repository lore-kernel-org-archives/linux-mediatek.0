From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v2] net: ethernet: mediatek: fix warning in phy_start_aneg
Date: Wed,  9 Jan 2019 08:20:28 +0100
Message-ID: <20190109072028.30513-1-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Felix Fietkau <nbd@openwrt.org>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@kernel.org>, Nelson Chang <nelson.chang@mediatek.com>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

From: Heiner Kallweit <hkallweit1@gmail.com>

linux 5.0-rc1 shows following warning on bpi-r2/mt7623 bootup:

[ 5.170597] WARNING: CPU: 3 PID: 1 at drivers/net/phy/phy.c:548 phy_start_aneg+0x110/0x144
[ 5.178826] called from state READY
....
[ 5.264111] [<c0629fd4>] (phy_start_aneg) from [<c0e3e720>] (mtk_init+0x414/0x47c)
[ 5.271630] r7:df5f5eec r6:c0f08c48 r5:00000000 r4:dea67800
[ 5.277256] [<c0e3e30c>] (mtk_init) from [<c07dabbc>] (register_netdevice+0x98/0x51c)
[ 5.285035] r8:00000000 r7:00000000 r6:c0f97080 r5:c0f08c48 r4:dea67800
[ 5.291693] [<c07dab24>] (register_netdevice) from [<c07db06c>] (register_netdev+0x2c/0x44)
[ 5.299989] r8:00000000 r7:dea2e608 r6:deacea00 r5:dea2e604 r4:dea67800
[ 5.306646] [<c07db040>] (register_netdev) from [<c06326d8>] (mtk_probe+0x668/0x7ac)
[ 5.314336] r5:dea2e604 r4:dea2e040
[ 5.317890] [<c0632070>] (mtk_probe) from [<c05a78fc>] (platform_drv_probe+0x58/0xa8)
[ 5.325670] r10:c0f86bac r9:00000000 r8:c0fbe578 r7:00000000 r6:c0f86bac r5:00000000
[ 5.333445] r4:deacea10
[ 5.335963] [<c05a78a4>] (platform_drv_probe) from [<c05a5248>] (really_probe+0x2d8/0x424)

maybe other boards using this generic driver are affected

v2:
optimization:

- phy_set_max_speed() is only needed if you want to reduce the
  max speed, typically if the PHY supports 1Gbps but the MAC
  supports 100Mbps only.

- The pause parameters are autonegotiated. Except you have a specific
  need you normally don't need to manually fiddle with this.

- phy_start_aneg() is called implicitly by the phylib state machine,
  you shouldn't call it manually except you have a good excuse.

- netif_carrier_on/netif_carrier_off in mtk_phy_link_adjust() isn't
  needed. It's done by phy_link_change() in phylib.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 399f565dd85a..2968d29a992f 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -258,11 +258,6 @@ static void mtk_phy_link_adjust(struct net_device *dev)
 
 	mtk_w32(mac->hw, mcr, MTK_MAC_MCR(mac->id));
 
-	if (dev->phydev->link)
-		netif_carrier_on(dev);
-	else
-		netif_carrier_off(dev);
-
 	if (!of_phy_is_fixed_link(mac->of_node))
 		phy_print_status(dev->phydev);
 }
@@ -347,17 +342,6 @@ static int mtk_phy_connect(struct net_device *dev)
 	if (mtk_phy_connect_node(eth, mac, np))
 		goto err_phy;
 
-	dev->phydev->autoneg = AUTONEG_ENABLE;
-	dev->phydev->speed = 0;
-	dev->phydev->duplex = 0;
-
-	phy_set_max_speed(dev->phydev, SPEED_1000);
-	phy_support_asym_pause(dev->phydev);
-	linkmode_copy(dev->phydev->advertising, dev->phydev->supported);
-	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
-			 dev->phydev->advertising);
-	phy_start_aneg(dev->phydev);
-
 	of_node_put(np);
 
 	return 0;
-- 
2.17.1

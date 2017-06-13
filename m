From: Yuval Shaia <yuval.shaia-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3] net: phy: Make phy_ethtool_ksettings_get return void
Date: Tue, 13 Jun 2017 10:09:46 +0300
Message-ID: <20170613070946.3605-1-yuval.shaia__39364.1232084066$1497337914$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: isubramanian-qTEPVZfXA3Y@public.gmane.org, kchudgar-qTEPVZfXA3Y@public.gmane.org, qnguyen-qTEPVZfXA3Y@public.gmane.org, michael.chan-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, siva.kallam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, prashant-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, madalin.bucur-3arQi8VN3Tc@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, salil.mehta-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, peppe.cavallaro-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, w-kwok2-l0cyMroinI0@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, woojung.huh-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, UNGLinuxDriver-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, yuval.shaia-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, jarod-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, yankejian-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, lipeng321-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, huangdaode@hisilicon.
List-Id: linux-mediatek@lists.infradead.org

Make return value void since function never return meaningfull value

Signed-off-by: Yuval Shaia <yuval.shaia-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Acked-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
---
v0 ->v1:
	* These files were missing in v0
		* drivers/net/ethernet/renesas/ravb_main.c
		* drivers/net/ethernet/renesas/sh_eth.c
		* drivers/net/ethernet/ti/netcp_ethss.c
	* Add Acked-by: Sergei Shtylyov

v1 -> v2:
	* Adjust to net-next tree

v2 -> v3:
	* These files were missing in v1
		* drivers/net/ethernet/apm/xgene-v2/ethtool.c
		* drivers/net/ethernet/apm/xgene/xgene_enet_ethtool.c
		* drivers/net/ethernet/broadcom/b44.c
		* drivers/net/ethernet/broadcom/bcm63xx_enet.c
		* drivers/net/ethernet/hisilicon/hns/hns_ethtool.c
		* drivers/net/ethernet/mediatek/mtk_eth_soc.c
		* drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
		* drivers/net/ethernet/ti/cpsw.c
		* drivers/staging/netlogic/xlr_net.c
---
 drivers/net/ethernet/apm/xgene-v2/ethtool.c          |  4 +++-
 drivers/net/ethernet/apm/xgene/xgene_enet_ethtool.c  |  8 ++++++--
 drivers/net/ethernet/broadcom/b44.c                  |  4 +++-
 drivers/net/ethernet/broadcom/bcm63xx_enet.c         |  5 ++++-
 drivers/net/ethernet/broadcom/genet/bcmgenet.c       |  4 +++-
 drivers/net/ethernet/broadcom/tg3.c                  |  4 +++-
 drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c   |  6 ++----
 drivers/net/ethernet/freescale/ucc_geth_ethtool.c    |  4 +++-
 drivers/net/ethernet/hisilicon/hns/hns_ethtool.c     |  2 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c           |  5 ++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c          |  4 +++-
 drivers/net/ethernet/renesas/ravb_main.c             | 14 +++++++-------
 drivers/net/ethernet/renesas/sh_eth.c                |  5 ++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c |  5 ++---
 drivers/net/ethernet/ti/cpsw.c                       |  8 ++++----
 drivers/net/ethernet/ti/netcp_ethss.c                |  8 +++-----
 drivers/net/phy/phy.c                                | 10 +++++-----
 drivers/net/usb/lan78xx.c                            |  2 +-
 drivers/staging/netlogic/xlr_net.c                   |  5 ++++-
 include/linux/phy.h                                  |  4 ++--
 net/dsa/slave.c                                      |  9 +++++----
 21 files changed, 68 insertions(+), 52 deletions(-)

diff --git a/drivers/net/ethernet/apm/xgene-v2/ethtool.c b/drivers/net/ethernet/apm/xgene-v2/ethtool.c
index b6666e4..d31ad82 100644
--- a/drivers/net/ethernet/apm/xgene-v2/ethtool.c
+++ b/drivers/net/ethernet/apm/xgene-v2/ethtool.c
@@ -157,7 +157,9 @@ static int xge_get_link_ksettings(struct net_device *ndev,
 	if (!phydev)
 		return -ENODEV;
 
-	return phy_ethtool_ksettings_get(phydev, cmd);
+	phy_ethtool_ksettings_get(phydev, cmd);
+
+	return 0;
 }
 
 static int xge_set_link_ksettings(struct net_device *ndev,
diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_ethtool.c b/drivers/net/ethernet/apm/xgene/xgene_enet_ethtool.c
index 559963b..4f50f11 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_ethtool.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_ethtool.c
@@ -131,13 +131,17 @@ static int xgene_get_link_ksettings(struct net_device *ndev,
 		if (phydev == NULL)
 			return -ENODEV;
 
-		return phy_ethtool_ksettings_get(phydev, cmd);
+		phy_ethtool_ksettings_get(phydev, cmd);
+
+		return 0;
 	} else if (pdata->phy_mode == PHY_INTERFACE_MODE_SGMII) {
 		if (pdata->mdio_driver) {
 			if (!phydev)
 				return -ENODEV;
 
-			return phy_ethtool_ksettings_get(phydev, cmd);
+			phy_ethtool_ksettings_get(phydev, cmd);
+
+			return 0;
 		}
 
 		supported = SUPPORTED_1000baseT_Full | SUPPORTED_Autoneg |
diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broadcom/b44.c
index 5b95bb4..f411936 100644
--- a/drivers/net/ethernet/broadcom/b44.c
+++ b/drivers/net/ethernet/broadcom/b44.c
@@ -1836,7 +1836,9 @@ static int b44_get_link_ksettings(struct net_device *dev,
 
 	if (bp->flags & B44_FLAG_EXTERNAL_PHY) {
 		BUG_ON(!dev->phydev);
-		return phy_ethtool_ksettings_get(dev->phydev, cmd);
+		phy_ethtool_ksettings_get(dev->phydev, cmd);
+
+		return 0;
 	}
 
 	supported = (SUPPORTED_Autoneg);
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 50d88d3..ea3c906 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -1453,7 +1453,10 @@ static int bcm_enet_get_link_ksettings(struct net_device *dev,
 	if (priv->has_phy) {
 		if (!dev->phydev)
 			return -ENODEV;
-		return phy_ethtool_ksettings_get(dev->phydev, cmd);
+
+		phy_ethtool_ksettings_get(dev->phydev, cmd);
+
+		return 0;
 	} else {
 		cmd->base.autoneg = 0;
 		cmd->base.speed = (priv->force_speed_100) ?
diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index a205a9f..daca1c9 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -477,7 +477,9 @@ static int bcmgenet_get_link_ksettings(struct net_device *dev,
 	if (!priv->phydev)
 		return -ENODEV;
 
-	return phy_ethtool_ksettings_get(priv->phydev, cmd);
+	phy_ethtool_ksettings_get(priv->phydev, cmd);
+
+	return 0;
 }
 
 static int bcmgenet_set_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 537d571..d600c41 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -12097,7 +12097,9 @@ static int tg3_get_link_ksettings(struct net_device *dev,
 		if (!(tp->phy_flags & TG3_PHYFLG_IS_CONNECTED))
 			return -EAGAIN;
 		phydev = mdiobus_get_phy(tp->mdio_bus, tp->phy_addr);
-		return phy_ethtool_ksettings_get(phydev, cmd);
+		phy_ethtool_ksettings_get(phydev, cmd);
+
+		return 0;
 	}
 
 	supported = (SUPPORTED_Autoneg);
diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
index 15571e2..aad825088 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
@@ -75,16 +75,14 @@ static char dpaa_stats_global[][ETH_GSTRING_LEN] = {
 static int dpaa_get_link_ksettings(struct net_device *net_dev,
 				   struct ethtool_link_ksettings *cmd)
 {
-	int err;
-
 	if (!net_dev->phydev) {
 		netdev_dbg(net_dev, "phy device not initialized\n");
 		return 0;
 	}
 
-	err = phy_ethtool_ksettings_get(net_dev->phydev, cmd);
+	phy_ethtool_ksettings_get(net_dev->phydev, cmd);
 
-	return err;
+	return 0;
 }
 
 static int dpaa_set_link_ksettings(struct net_device *net_dev,
diff --git a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
index b642990..4df282e 100644
--- a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
+++ b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
@@ -113,7 +113,9 @@ uec_get_ksettings(struct net_device *netdev, struct ethtool_link_ksettings *cmd)
 	if (!phydev)
 		return -ENODEV;
 
-	return phy_ethtool_ksettings_get(phydev, cmd);
+	phy_ethtool_ksettings_get(phydev, cmd);
+
+	return 0;
 }
 
 static int
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_ethtool.c b/drivers/net/ethernet/hisilicon/hns/hns_ethtool.c
index b8fab14..af1b15c 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_ethtool.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_ethtool.c
@@ -150,7 +150,7 @@ static int hns_nic_get_link_ksettings(struct net_device *net_dev,
 	cmd->base.duplex = duplex;
 
 	if (net_dev->phydev)
-		(void)phy_ethtool_ksettings_get(net_dev->phydev, cmd);
+		phy_ethtool_ksettings_get(net_dev->phydev, cmd);
 
 	link_stat = hns_nic_get_link(net_dev);
 	if (!link_stat) {
diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 25642de..5794d98 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -1501,10 +1501,9 @@ mv643xx_eth_get_link_ksettings_phy(struct mv643xx_eth_private *mp,
 				   struct ethtool_link_ksettings *cmd)
 {
 	struct net_device *dev = mp->dev;
-	int err;
 	u32 supported, advertising;
 
-	err = phy_ethtool_ksettings_get(dev->phydev, cmd);
+	phy_ethtool_ksettings_get(dev->phydev, cmd);
 
 	/*
 	 * The MAC does not support 1000baseT_Half.
@@ -1520,7 +1519,7 @@ mv643xx_eth_get_link_ksettings_phy(struct mv643xx_eth_private *mp,
 	ethtool_convert_legacy_u32_to_link_mode(cmd->link_modes.advertising,
 						advertising);
 
-	return err;
+	return 0;
 }
 
 static int
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 16f9755..962975d 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2056,7 +2056,9 @@ static int mtk_get_link_ksettings(struct net_device *ndev,
 	if (unlikely(test_bit(MTK_RESETTING, &mac->hw->state)))
 		return -EBUSY;
 
-	return phy_ethtool_ksettings_get(ndev->phydev, cmd);
+	phy_ethtool_ksettings_get(ndev->phydev, cmd);
+
+	return 0;
 }
 
 static int mtk_set_link_ksettings(struct net_device *ndev,
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 784782d..5931e85 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1076,16 +1076,16 @@ static int ravb_get_link_ksettings(struct net_device *ndev,
 				   struct ethtool_link_ksettings *cmd)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
-	int error = -ENODEV;
 	unsigned long flags;
 
-	if (ndev->phydev) {
-		spin_lock_irqsave(&priv->lock, flags);
-		error = phy_ethtool_ksettings_get(ndev->phydev, cmd);
-		spin_unlock_irqrestore(&priv->lock, flags);
-	}
+	if (!ndev->phydev)
+		return -ENODEV;
 
-	return error;
+	spin_lock_irqsave(&priv->lock, flags);
+	phy_ethtool_ksettings_get(ndev->phydev, cmd);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
 }
 
 static int ravb_set_link_ksettings(struct net_device *ndev,
diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 2d686cc..b2f0cea 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -1915,16 +1915,15 @@ static int sh_eth_get_link_ksettings(struct net_device *ndev,
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
 	unsigned long flags;
-	int ret;
 
 	if (!ndev->phydev)
 		return -ENODEV;
 
 	spin_lock_irqsave(&mdp->lock, flags);
-	ret = phy_ethtool_ksettings_get(ndev->phydev, cmd);
+	phy_ethtool_ksettings_get(ndev->phydev, cmd);
 	spin_unlock_irqrestore(&mdp->lock, flags);
 
-	return ret;
+	return 0;
 }
 
 static int sh_eth_set_link_ksettings(struct net_device *ndev,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 16808e4..743170d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -273,7 +273,6 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	struct phy_device *phy = dev->phydev;
-	int rc;
 
 	if (priv->hw->pcs & STMMAC_PCS_RGMII ||
 	    priv->hw->pcs & STMMAC_PCS_SGMII) {
@@ -364,8 +363,8 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
 		"link speed / duplex setting\n", dev->name);
 		return -EBUSY;
 	}
-	rc = phy_ethtool_ksettings_get(phy, cmd);
-	return rc;
+	phy_ethtool_ksettings_get(phy, cmd);
+	return 0;
 }
 
 static int
diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index b6a0d92..b7a0f5e 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -2170,11 +2170,11 @@ static int cpsw_get_link_ksettings(struct net_device *ndev,
 	struct cpsw_common *cpsw = priv->cpsw;
 	int slave_no = cpsw_slave_index(cpsw, priv);
 
-	if (cpsw->slaves[slave_no].phy)
-		return phy_ethtool_ksettings_get(cpsw->slaves[slave_no].phy,
-						 ecmd);
-	else
+	if (!cpsw->slaves[slave_no].phy)
 		return -EOPNOTSUPP;
+
+	phy_ethtool_ksettings_get(cpsw->slaves[slave_no].phy, ecmd);
+	return 0;
 }
 
 static int cpsw_set_link_ksettings(struct net_device *ndev,
diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
index dd92950..0847a8f 100644
--- a/drivers/net/ethernet/ti/netcp_ethss.c
+++ b/drivers/net/ethernet/ti/netcp_ethss.c
@@ -1927,7 +1927,6 @@ static int keystone_get_link_ksettings(struct net_device *ndev,
 	struct netcp_intf *netcp = netdev_priv(ndev);
 	struct phy_device *phy = ndev->phydev;
 	struct gbe_intf *gbe_intf;
-	int ret;
 
 	if (!phy)
 		return -EINVAL;
@@ -1939,11 +1938,10 @@ static int keystone_get_link_ksettings(struct net_device *ndev,
 	if (!gbe_intf->slave)
 		return -EINVAL;
 
-	ret = phy_ethtool_ksettings_get(phy, cmd);
-	if (!ret)
-		cmd->base.port = gbe_intf->slave->phy_port_t;
+	phy_ethtool_ksettings_get(phy, cmd);
+	cmd->base.port = gbe_intf->slave->phy_port_t;
 
-	return ret;
+	return 0;
 }
 
 static int keystone_set_link_ksettings(struct net_device *ndev,
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 14fc5bc..edcdf0d 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -509,8 +509,8 @@ int phy_ethtool_ksettings_set(struct phy_device *phydev,
 }
 EXPORT_SYMBOL(phy_ethtool_ksettings_set);
 
-int phy_ethtool_ksettings_get(struct phy_device *phydev,
-			      struct ethtool_link_ksettings *cmd)
+void phy_ethtool_ksettings_get(struct phy_device *phydev,
+			       struct ethtool_link_ksettings *cmd)
 {
 	ethtool_convert_legacy_u32_to_link_mode(cmd->link_modes.supported,
 						phydev->supported);
@@ -532,8 +532,6 @@ int phy_ethtool_ksettings_get(struct phy_device *phydev,
 	cmd->base.autoneg = phydev->autoneg;
 	cmd->base.eth_tp_mdix_ctrl = phydev->mdix_ctrl;
 	cmd->base.eth_tp_mdix = phydev->mdix;
-
-	return 0;
 }
 EXPORT_SYMBOL(phy_ethtool_ksettings_get);
 
@@ -1449,7 +1447,9 @@ int phy_ethtool_get_link_ksettings(struct net_device *ndev,
 	if (!phydev)
 		return -ENODEV;
 
-	return phy_ethtool_ksettings_get(phydev, cmd);
+	phy_ethtool_ksettings_get(phydev, cmd);
+
+	return 0;
 }
 EXPORT_SYMBOL(phy_ethtool_get_link_ksettings);
 
diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 9eff97a..5833f7e 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1490,7 +1490,7 @@ static int lan78xx_get_link_ksettings(struct net_device *net,
 	if (ret < 0)
 		return ret;
 
-	ret = phy_ethtool_ksettings_get(phydev, cmd);
+	phy_ethtool_ksettings_get(phydev, cmd);
 
 	usb_autopm_put_interface(dev->intf);
 
diff --git a/drivers/staging/netlogic/xlr_net.c b/drivers/staging/netlogic/xlr_net.c
index 781ef62..e05ae46 100644
--- a/drivers/staging/netlogic/xlr_net.c
+++ b/drivers/staging/netlogic/xlr_net.c
@@ -179,7 +179,10 @@ static int xlr_get_link_ksettings(struct net_device *ndev,
 
 	if (!phydev)
 		return -ENODEV;
-	return phy_ethtool_ksettings_get(phydev, ecmd);
+
+	phy_ethtool_ksettings_get(phydev, ecmd);
+
+	return 0;
 }
 
 static int xlr_set_link_ksettings(struct net_device *ndev,
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 4142422..e70360a 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -874,8 +874,8 @@ void phy_start_machine(struct phy_device *phydev);
 void phy_stop_machine(struct phy_device *phydev);
 void phy_trigger_machine(struct phy_device *phydev, bool sync);
 int phy_ethtool_sset(struct phy_device *phydev, struct ethtool_cmd *cmd);
-int phy_ethtool_ksettings_get(struct phy_device *phydev,
-			      struct ethtool_link_ksettings *cmd);
+void phy_ethtool_ksettings_get(struct phy_device *phydev,
+			       struct ethtool_link_ksettings *cmd);
 int phy_ethtool_ksettings_set(struct phy_device *phydev,
 			      const struct ethtool_link_ksettings *cmd);
 int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd);
diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index 5f3caee..5e45ae5 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -387,12 +387,13 @@ dsa_slave_get_link_ksettings(struct net_device *dev,
 			     struct ethtool_link_ksettings *cmd)
 {
 	struct dsa_slave_priv *p = netdev_priv(dev);
-	int err = -EOPNOTSUPP;
 
-	if (p->phy != NULL)
-		err = phy_ethtool_ksettings_get(p->phy, cmd);
+	if (!p->phy)
+		return -EOPNOTSUPP;
 
-	return err;
+	phy_ethtool_ksettings_get(p->phy, cmd);
+
+	return 0;
 }
 
 static int
-- 
2.9.4

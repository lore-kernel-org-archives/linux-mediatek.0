From: Maxim Zhukov <mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] staging, mt7621-eth: fix api for linkmode bitmap
Date: Sat,  9 Mar 2019 12:53:59 +0300
Message-ID: <20190309095400.26930-2-mussitantesmortem@gmail.com>
References: <20190309095400.26930-1-mussitantesmortem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190309095400.26930-1-mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Maxim Zhukov <mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Start using new api for linkmode bitmap

Fixed build after 3c1bcc8614db ("net: ethernet: Convert phydev advertize and supported from u32 to link mode")

Signed-off-by: Maxim Zhukov <mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/mt7621-eth/mdio.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/mt7621-eth/mdio.c b/drivers/staging/mt7621-eth/mdio.c
index 5fea6a447eed..142d7a082dd3 100644
--- a/drivers/staging/mt7621-eth/mdio.c
+++ b/drivers/staging/mt7621-eth/mdio.c
@@ -89,8 +89,12 @@ int mtk_connect_phy_node(struct mtk_eth *eth, struct mtk_mac *mac,
 		return -ENODEV;
 	}
 
-	phydev->supported &= PHY_1000BT_FEATURES;
-	phydev->advertising = phydev->supported;
+	linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
+			 phydev->supported);
+	linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
+			 phydev->supported);
+
+	linkmode_copy(phydev->advertising, phydev->supported);
 
 	dev_info(eth->dev,
 		 "connected port %d to PHY at %s [uid=%08x, driver=%s]\n",
@@ -113,7 +117,9 @@ static void phy_init(struct mtk_eth *eth, struct mtk_mac *mac,
 	phy->speed = 0;
 	phy->duplex = 0;
 	phy_set_max_speed(phy, SPEED_100);
-	phy->advertising = phy->supported | ADVERTISED_Autoneg;
+	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
+			 phy->advertising);
+
 
 	phy_start_aneg(phy);
 }
-- 
2.21.0

From: <sean.wang@mediatek.com>
Subject: [PATCH net-next 2/2] net-next: mediatek: cleanup unnecessary get chip id and its user
Date: Sat, 28 Jul 2018 13:35:56 +0800
Message-ID: <d4fa77f13190aefa5cf3f609a3ae555aeef38259.1532755541.git.sean.wang@mediatek.com>
References: <658dfd485c035cdae5452bc5d572125076b47a48.1532755541.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <658dfd485c035cdae5452bc5d572125076b47a48.1532755541.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Since driver is devicetree-based, all device type and charateristic can be
determined by the compatible string and its data. It's unnecessary to
create another dependent function to check chip ID and then decide whether
the specific funciton is being supported on a certain device. It can be
totally replaced by the existing flag, so a cleanup is made by removing
the function and the only user, HWLRO.

MT2701 also have a missing HWLRO support in old code, so add it the same
patch.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 48 +++--------------------------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  2 +-
 2 files changed, 5 insertions(+), 45 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 8c85a4b..6e6abdc 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2458,42 +2458,6 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	return err;
 }
 
-static int mtk_get_chip_id(struct mtk_eth *eth, u32 *chip_id)
-{
-	u32 val[2], id[4];
-
-	regmap_read(eth->ethsys, ETHSYS_CHIPID0_3, &val[0]);
-	regmap_read(eth->ethsys, ETHSYS_CHIPID4_7, &val[1]);
-
-	id[3] = ((val[0] >> 16) & 0xff) - '0';
-	id[2] = ((val[0] >> 24) & 0xff) - '0';
-	id[1] = (val[1] & 0xff) - '0';
-	id[0] = ((val[1] >> 8) & 0xff) - '0';
-
-	*chip_id = (id[3] * 1000) + (id[2] * 100) +
-		   (id[1] * 10) + id[0];
-
-	if (!(*chip_id)) {
-		dev_err(eth->dev, "failed to get chip id\n");
-		return -ENODEV;
-	}
-
-	dev_info(eth->dev, "chip id = %d\n", *chip_id);
-
-	return 0;
-}
-
-static bool mtk_is_hwlro_supported(struct mtk_eth *eth)
-{
-	switch (eth->chip_id) {
-	case MT7622_ETH:
-	case MT7623_ETH:
-		return true;
-	}
-
-	return false;
-}
-
 static int mtk_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -2572,11 +2536,7 @@ static int mtk_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtk_get_chip_id(eth, &eth->chip_id);
-	if (err)
-		return err;
-
-	eth->hwlro = mtk_is_hwlro_supported(eth);
+	eth->hwlro = MTK_HAS_CAPS(eth->soc->caps, MTK_HWLRO);
 
 	for_each_child_of_node(pdev->dev.of_node, mac_np) {
 		if (!of_device_is_compatible(mac_np,
@@ -2665,19 +2625,19 @@ static int mtk_remove(struct platform_device *pdev)
 }
 
 static const struct mtk_soc_data mt2701_data = {
-	.caps = MTK_GMAC1_TRGMII,
+	.caps = MTK_GMAC1_TRGMII | MTK_HWLRO,
 	.required_clks = MT7623_CLKS_BITMAP,
 	.required_pctl = true,
 };
 
 static const struct mtk_soc_data mt7622_data = {
-	.caps = MTK_DUAL_GMAC_SHARED_SGMII | MTK_GMAC1_ESW,
+	.caps = MTK_DUAL_GMAC_SHARED_SGMII | MTK_GMAC1_ESW | MTK_HWLRO,
 	.required_clks = MT7622_CLKS_BITMAP,
 	.required_pctl = false,
 };
 
 static const struct mtk_soc_data mt7623_data = {
-	.caps = MTK_GMAC1_TRGMII,
+	.caps = MTK_GMAC1_TRGMII | MTK_HWLRO,
 	.required_clks = MT7623_CLKS_BITMAP,
 	.required_pctl = true,
 };
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 672b8c3..4681929 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -566,6 +566,7 @@ struct mtk_rx_ring {
 #define MTK_GMAC2_SGMII			(BIT(10) | MTK_SGMII)
 #define MTK_DUAL_GMAC_SHARED_SGMII	(BIT(11) | MTK_GMAC1_SGMII | \
 					 MTK_GMAC2_SGMII)
+#define MTK_HWLRO			BIT(12)
 #define MTK_HAS_CAPS(caps, _x)		(((caps) & (_x)) == (_x))
 
 /* struct mtk_eth_data -	This is the structure holding all differences
@@ -635,7 +636,6 @@ struct mtk_eth {
 	struct regmap			*ethsys;
 	struct regmap			*sgmiisys;
 	struct regmap			*pctl;
-	u32				chip_id;
 	bool				hwlro;
 	refcount_t			dma_refcnt;
 	struct mtk_tx_ring		tx_ring;
-- 
2.7.4

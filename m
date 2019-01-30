From: gerg@kernel.org
Subject: [PATCHv4 1/3] net: ethernet: mediatek: support MT7621 SoC ethernet hardware
Date: Wed, 30 Jan 2019 11:24:04 +1000
Message-ID: <20190130012406.28271-2-gerg@kernel.org>
References: <20190130012406.28271-1-gerg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190130012406.28271-1-gerg@kernel.org>
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com, linux-mediatek@lists.infradead.org, bjorn@mork.no, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, netdev@vger.kernel.org
Cc: rene@vdorst.com, john@phrozen.org, neil@brown.name, Greg Ungerer <gerg@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

From: Bjørn Mork <bjorn@mork.no>

The Mediatek MT7621 SoC contains the same ethernet hardware module as
used on a number of other MediaTek SoC parts. There are some minor
differences to deal with but we can use the same driver to support
them all.

This patch is based on work by Bjørn Mork <bjorn@mork.no>, and his
original patch is at:

https://github.com/bmork/LEDE/commit/3293bc63f5461ca1eb0bbc4ed90145335e7e3404

There is an additional compatible devicetree type added, and the primary
change to the code required is to support a single interrupt (for both
RX and TX interrupts).

Signed-off-by: Bjørn Mork <bjorn@mork.no>
[gerg@kernel.org: rebase to mainline and irq handler fix]
Signed-off-by: Greg Ungerer <gerg@kernel.org>
---
 drivers/net/ethernet/mediatek/Kconfig       |  2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 48 ++++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++
 3 files changed, 46 insertions(+), 8 deletions(-)

v2: first in series for this change
v3: rebase onto 5.0-rc3
v4: rebase onto 5.0-rc4

diff --git a/drivers/net/ethernet/mediatek/Kconfig b/drivers/net/ethernet/mediatek/Kconfig
index f9149d2a4694..43656f961891 100644
--- a/drivers/net/ethernet/mediatek/Kconfig
+++ b/drivers/net/ethernet/mediatek/Kconfig
@@ -1,6 +1,6 @@
 config NET_VENDOR_MEDIATEK
 	bool "MediaTek ethernet driver"
-	depends on ARCH_MEDIATEK
+	depends on ARCH_MEDIATEK || SOC_MT7621
 	---help---
 	  If you have a Mediatek SoC with ethernet, say Y.
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 49f926b7a91c..94d4663e3933 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1745,6 +1745,22 @@ static irqreturn_t mtk_handle_irq_tx(int irq, void *_eth)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t mtk_handle_irq(int irq, void *_eth)
+{
+	struct mtk_eth *eth = _eth;
+
+	if (mtk_r32(eth, MTK_PDMA_INT_MASK) & MTK_RX_DONE_INT) {
+		if (mtk_r32(eth, MTK_PDMA_INT_STATUS) & MTK_RX_DONE_INT)
+			mtk_handle_irq_rx(irq, _eth);
+	}
+	if (mtk_r32(eth, MTK_QDMA_INT_MASK) & MTK_TX_DONE_INT) {
+		if (mtk_r32(eth, MTK_QMTK_INT_STATUS) & MTK_TX_DONE_INT)
+			mtk_handle_irq_tx(irq, _eth);
+	}
+
+	return IRQ_HANDLED;
+}
+
 #ifdef CONFIG_NET_POLL_CONTROLLER
 static void mtk_poll_controller(struct net_device *dev)
 {
@@ -2485,7 +2501,10 @@ static int mtk_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < 3; i++) {
-		eth->irq[i] = platform_get_irq(pdev, i);
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
+			eth->irq[i] = eth->irq[0];
+		else
+			eth->irq[i] = platform_get_irq(pdev, i);
 		if (eth->irq[i] < 0) {
 			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
 			return -ENXIO;
@@ -2528,13 +2547,21 @@ static int mtk_probe(struct platform_device *pdev)
 			goto err_deinit_hw;
 	}
 
-	err = devm_request_irq(eth->dev, eth->irq[1], mtk_handle_irq_tx, 0,
-			       dev_name(eth->dev), eth);
-	if (err)
-		goto err_free_dev;
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
+		err = devm_request_irq(eth->dev, eth->irq[0],
+				       mtk_handle_irq, 0,
+				       dev_name(eth->dev), eth);
+	} else {
+		err = devm_request_irq(eth->dev, eth->irq[1],
+				       mtk_handle_irq_tx, 0,
+				       dev_name(eth->dev), eth);
+		if (err)
+			goto err_free_dev;
 
-	err = devm_request_irq(eth->dev, eth->irq[2], mtk_handle_irq_rx, 0,
-			       dev_name(eth->dev), eth);
+		err = devm_request_irq(eth->dev, eth->irq[2],
+				       mtk_handle_irq_rx, 0,
+				       dev_name(eth->dev), eth);
+	}
 	if (err)
 		goto err_free_dev;
 
@@ -2607,6 +2634,12 @@ static const struct mtk_soc_data mt2701_data = {
 	.required_pctl = true,
 };
 
+static const struct mtk_soc_data mt7621_data = {
+	.caps = MTK_SHARED_INT,
+	.required_clks = MT7621_CLKS_BITMAP,
+	.required_pctl = false,
+};
+
 static const struct mtk_soc_data mt7622_data = {
 	.caps = MTK_DUAL_GMAC_SHARED_SGMII | MTK_GMAC1_ESW | MTK_HWLRO,
 	.required_clks = MT7622_CLKS_BITMAP,
@@ -2621,6 +2654,7 @@ static const struct mtk_soc_data mt7623_data = {
 
 const struct of_device_id of_mtk_match[] = {
 	{ .compatible = "mediatek,mt2701-eth", .data = &mt2701_data},
+	{ .compatible = "mediatek,mt7621-eth", .data = &mt7621_data},
 	{ .compatible = "mediatek,mt7622-eth", .data = &mt7622_data},
 	{ .compatible = "mediatek,mt7623-eth", .data = &mt7623_data},
 	{},
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 46819297fc3e..f7501997cea0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -363,6 +363,7 @@
 #define ETHSYS_CHIPID4_7	0x4
 #define MT7623_ETH		7623
 #define MT7622_ETH		7622
+#define MT7621_ETH		7621
 
 /* ethernet subsystem config register */
 #define ETHSYS_SYSCFG0		0x14
@@ -488,6 +489,8 @@ enum mtk_clks_map {
 				 BIT(MTK_CLK_SGMII_CDR_FB) | \
 				 BIT(MTK_CLK_SGMII_CK) | \
 				 BIT(MTK_CLK_ETH2PLL))
+#define MT7621_CLKS_BITMAP	(0)
+
 enum mtk_dev_state {
 	MTK_HW_INIT,
 	MTK_RESETTING
@@ -567,6 +570,7 @@ struct mtk_rx_ring {
 #define MTK_DUAL_GMAC_SHARED_SGMII	(BIT(11) | MTK_GMAC1_SGMII | \
 					 MTK_GMAC2_SGMII)
 #define MTK_HWLRO			BIT(12)
+#define MTK_SHARED_INT			BIT(13)
 #define MTK_HAS_CAPS(caps, _x)		(((caps) & (_x)) == (_x))
 
 /* struct mtk_eth_data -	This is the structure holding all differences
-- 
2.17.1

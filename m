Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D113C636D7
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 07:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buWvl0nM4+Ek458f99mWjomGEBfiwj9MZRDvr/v6WKI=; b=z4YYE4jZbMJzhNf+/tCcImCAUN
	2hY0KO0C4nfG7ajLCsvvW9kR899l7x0CiGzVrHGuG12/p7C/Lr93TGuq/cxCjXFj587Ttve4SRhCt
	tlDgk4yhuD3iRSXI9odYiQtmTGc2CFYhSCoPU/d1Ij+afbPjz517eU5oq6DySFL6L3agP2L/PAhqc
	GHmQ1cfubbmbS1+5/hO6Lnd7XZU30fnN6XgN3rPEhoyfyND8x0EHKN05O1PLhRGpJ0nZLAfSvlZO7
	CsQNfe3IToGJoktoHCPQI14OaAfNow9HqWTpnJdgxIKNP+X/cTPagINQrrDNH8Rplp8i21s2QRgsf
	0Hq/nwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNq5I-000evr-D7; Fri, 03 Feb 2023 07:02:08 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNq5F-000euZ-NY; Fri, 03 Feb 2023 07:02:07 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pNq5C-0000nM-0x;
	Fri, 03 Feb 2023 08:02:02 +0100
Date: Fri, 3 Feb 2023 07:00:21 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: [PATCH 1/9] net: ethernet: mtk_eth_soc: add support for MT7981 SoC
Message-ID: <301fa3e888d686283090d58a060579d8c2a5bebb.1675407169.git.daniel@makrotopia.org>
References: <cover.1675407169.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675407169.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_230205_937625_52E571F1 
X-CRM114-Status: GOOD (  17.64  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MediaTek MT7981 SoC comes two 1G/2.5G SGMII, just like MT7986.

In addition MT7981 comes with a built-in 1000Base-T PHY which can be
used with GMAC1.

As many MT7981 boards make use of swapping SGMII phase and neutral, add
new device-tree attribute 'mediatek,pn_swap' to support them.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_path.c | 14 +++++++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.c  | 21 +++++++++++++
 drivers/net/ethernet/mediatek/mtk_eth_soc.h  | 31 ++++++++++++++++++++
 drivers/net/ethernet/mediatek/mtk_sgmii.c    | 10 +++++++
 4 files changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_path.c b/drivers/net/ethernet/mediatek/mtk_eth_path.c
index 72648535a14d..317e447f4991 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_path.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_path.c
@@ -96,12 +96,20 @@ static int set_mux_gmac2_gmac0_to_gephy(struct mtk_eth *eth, int path)
 
 static int set_mux_u3_gmac2_to_qphy(struct mtk_eth *eth, int path)
 {
-	unsigned int val = 0;
+	unsigned int val = 0, mask = 0, reg = 0;
 	bool updated = true;
 
 	switch (path) {
 	case MTK_ETH_PATH_GMAC2_SGMII:
-		val = CO_QPHY_SEL;
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_U3_COPHY_V2)) {
+			reg = USB_PHY_SWITCH_REG;
+			val = SGMII_QPHY_SEL;
+			mask = QPHY_SEL_MASK;
+		} else {
+			reg = INFRA_MISC2;
+			val = CO_QPHY_SEL;
+			mask = val;
+		}
 		break;
 	default:
 		updated = false;
@@ -109,7 +117,7 @@ static int set_mux_u3_gmac2_to_qphy(struct mtk_eth *eth, int path)
 	}
 
 	if (updated)
-		regmap_update_bits(eth->infra, INFRA_MISC2, CO_QPHY_SEL, val);
+		regmap_update_bits(eth->infra, reg, mask, val);
 
 	dev_dbg(eth->dev, "path %s in %s updated = %d\n",
 		mtk_eth_path_name(path), __func__, updated);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index f1cb1efc94cf..a44ffff48c7b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4852,6 +4852,26 @@ static const struct mtk_soc_data mt7629_data = {
 	},
 };
 
+static const struct mtk_soc_data mt7981_data = {
+	.reg_map = &mt7986_reg_map,
+	.ana_rgc3 = 0x128,
+	.caps = MT7981_CAPS,
+	.hw_features = MTK_HW_FEATURES,
+	.required_clks = MT7981_CLKS_BITMAP,
+	.required_pctl = false,
+	.offload_version = 2,
+	.hash_offset = 4,
+	.foe_entry_size = sizeof(struct mtk_foe_entry),
+	.txrx = {
+		.txd_size = sizeof(struct mtk_tx_dma_v2),
+		.rxd_size = sizeof(struct mtk_rx_dma_v2),
+		.rx_irq_done_mask = MTK_RX_DONE_INT_V2,
+		.rx_dma_l4_valid = RX_DMA_L4_VALID_V2,
+		.dma_max_len = MTK_TX_DMA_BUF_LEN_V2,
+		.dma_len_offset = 8,
+	},
+};
+
 static const struct mtk_soc_data mt7986_data = {
 	.reg_map = &mt7986_reg_map,
 	.ana_rgc3 = 0x128,
@@ -4894,6 +4914,7 @@ const struct of_device_id of_mtk_match[] = {
 	{ .compatible = "mediatek,mt7622-eth", .data = &mt7622_data},
 	{ .compatible = "mediatek,mt7623-eth", .data = &mt7623_data},
 	{ .compatible = "mediatek,mt7629-eth", .data = &mt7629_data},
+	{ .compatible = "mediatek,mt7981-eth", .data = &mt7981_data},
 	{ .compatible = "mediatek,mt7986-eth", .data = &mt7986_data},
 	{ .compatible = "ralink,rt5350-eth", .data = &rt5350_data},
 	{},
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index afc9d52e79bf..7230dcb29315 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -551,11 +551,22 @@
 #define SGMSYS_QPHY_PWR_STATE_CTRL 0xe8
 #define	SGMII_PHYA_PWD		BIT(4)
 
+/* Register to QPHY wrapper control */
+#define SGMSYS_QPHY_WRAP_CTRL	0xec
+#define SGMII_PN_SWAP_MASK	GENMASK(1, 0)
+#define SGMII_PN_SWAP_TX_RX	(BIT(0) | BIT(1))
+#define MTK_SGMII_FLAG_PN_SWAP	BIT(0)
+
 /* Infrasys subsystem config registers */
 #define INFRA_MISC2            0x70c
 #define CO_QPHY_SEL            BIT(0)
 #define GEPHY_MAC_SEL          BIT(1)
 
+/* Top misc registers */
+#define USB_PHY_SWITCH_REG	0x218
+#define QPHY_SEL_MASK		GENMASK(1, 0)
+#define SGMII_QPHY_SEL		0x2
+
 /* MT7628/88 specific stuff */
 #define MT7628_PDMA_OFFSET	0x0800
 #define MT7628_SDM_OFFSET	0x0c00
@@ -736,6 +747,17 @@ enum mtk_clks_map {
 				 BIT(MTK_CLK_SGMII2_CDR_FB) | \
 				 BIT(MTK_CLK_SGMII_CK) | \
 				 BIT(MTK_CLK_ETH2PLL) | BIT(MTK_CLK_SGMIITOP))
+#define MT7981_CLKS_BITMAP	(BIT(MTK_CLK_FE) | BIT(MTK_CLK_GP2) | BIT(MTK_CLK_GP1) | \
+				 BIT(MTK_CLK_WOCPU0) | \
+				 BIT(MTK_CLK_SGMII_TX_250M) | \
+				 BIT(MTK_CLK_SGMII_RX_250M) | \
+				 BIT(MTK_CLK_SGMII_CDR_REF) | \
+				 BIT(MTK_CLK_SGMII_CDR_FB) | \
+				 BIT(MTK_CLK_SGMII2_TX_250M) | \
+				 BIT(MTK_CLK_SGMII2_RX_250M) | \
+				 BIT(MTK_CLK_SGMII2_CDR_REF) | \
+				 BIT(MTK_CLK_SGMII2_CDR_FB) | \
+				 BIT(MTK_CLK_SGMII_CK))
 #define MT7986_CLKS_BITMAP	(BIT(MTK_CLK_FE) | BIT(MTK_CLK_GP2) | BIT(MTK_CLK_GP1) | \
 				 BIT(MTK_CLK_WOCPU1) | BIT(MTK_CLK_WOCPU0) | \
 				 BIT(MTK_CLK_SGMII_TX_250M) | \
@@ -849,6 +871,7 @@ enum mkt_eth_capabilities {
 	MTK_NETSYS_V2_BIT,
 	MTK_SOC_MT7628_BIT,
 	MTK_RSTCTRL_PPE1_BIT,
+	MTK_U3_COPHY_V2_BIT,
 
 	/* MUX BITS*/
 	MTK_ETH_MUX_GDM1_TO_GMAC1_ESW_BIT,
@@ -883,6 +906,7 @@ enum mkt_eth_capabilities {
 #define MTK_NETSYS_V2		BIT(MTK_NETSYS_V2_BIT)
 #define MTK_SOC_MT7628		BIT(MTK_SOC_MT7628_BIT)
 #define MTK_RSTCTRL_PPE1	BIT(MTK_RSTCTRL_PPE1_BIT)
+#define MTK_U3_COPHY_V2		BIT(MTK_U3_COPHY_V2_BIT)
 
 #define MTK_ETH_MUX_GDM1_TO_GMAC1_ESW		\
 	BIT(MTK_ETH_MUX_GDM1_TO_GMAC1_ESW_BIT)
@@ -955,6 +979,11 @@ enum mkt_eth_capabilities {
 		      MTK_MUX_U3_GMAC2_TO_QPHY | \
 		      MTK_MUX_GMAC12_TO_GEPHY_SGMII | MTK_QDMA)
 
+#define MT7981_CAPS  (MTK_GMAC1_SGMII | MTK_GMAC2_SGMII | MTK_GMAC2_GEPHY | \
+		      MTK_MUX_GMAC12_TO_GEPHY_SGMII | MTK_QDMA | \
+		      MTK_MUX_U3_GMAC2_TO_QPHY | MTK_U3_COPHY_V2 | \
+		      MTK_NETSYS_V2 | MTK_RSTCTRL_PPE1)
+
 #define MT7986_CAPS  (MTK_GMAC1_SGMII | MTK_GMAC2_SGMII | \
 		      MTK_MUX_GMAC12_TO_GEPHY_SGMII | MTK_QDMA | \
 		      MTK_NETSYS_V2 | MTK_RSTCTRL_PPE1)
@@ -1068,12 +1097,14 @@ struct mtk_soc_data {
  * @ana_rgc3:          The offset refers to register ANA_RGC3 related to regmap
  * @interface:         Currently configured interface mode
  * @pcs:               Phylink PCS structure
+ * @flags:             Flags indicating hardware properties
  */
 struct mtk_pcs {
 	struct regmap	*regmap;
 	u32             ana_rgc3;
 	phy_interface_t	interface;
 	struct phylink_pcs pcs;
+	u32		flags;
 };
 
 /* struct mtk_sgmii -  This is the structure holding sgmii regmap and its
diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index bb00de1003ac..0fe403db23c9 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -88,6 +88,11 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 		regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
 				   SGMII_PHYA_PWD, SGMII_PHYA_PWD);
 
+		if (mpcs->flags & MTK_SGMII_FLAG_PN_SWAP)
+			regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_WRAP_CTRL,
+					   SGMII_PN_SWAP_MASK,
+					   SGMII_PN_SWAP_TX_RX);
+
 		if (interface == PHY_INTERFACE_MODE_2500BASEX)
 			rgc3 = RG_PHY_SPEED_3_125G;
 		else
@@ -182,6 +187,11 @@ int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *r, u32 ana_rgc3)
 
 		ss->pcs[i].ana_rgc3 = ana_rgc3;
 		ss->pcs[i].regmap = syscon_node_to_regmap(np);
+
+		ss->pcs[i].flags = 0;
+		if (of_property_read_bool(np, "mediatek,pn_swap"))
+			ss->pcs[i].flags |= MTK_SGMII_FLAG_PN_SWAP;
+
 		of_node_put(np);
 		if (IS_ERR(ss->pcs[i].regmap))
 			return PTR_ERR(ss->pcs[i].regmap);
-- 
2.39.1



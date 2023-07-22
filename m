Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36268C001B0
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jul 2023 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yk0ur+hpEiQbBV8GfOTsAFqllReyk886VNMTZSfoAc=; b=b6+E+52oKBu7K/UZC7W5Tr1sGm
	/xMRgR+xGO536Ts6xyY24uGNwZb6qKRJa2i2A8e7yaoDztGzat7Qmbb2V+lmdtBCR48Hl0rI9D4VI
	fvg/2BkzuGZzzvWu4032Jt4CZEeJ2z0bkVbrPSXvv/LuxsOAa15XSoenXLQIHgL8jSQQxN/2U0QmQ
	BBsM+BI0jJzLHfOsqMd091eXW7hHk7M+PuQaPBP4htxua/ilVwd1Bu99m8GeGIpQsTtfiPtPQuXhc
	TUKmp0LYibq5eBecr7jYxPY+7hzzHL3OIeynGjPzo21tIEpaPDwftS1GDBbKmI93q2gKdSivqztF8
	figuHCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNJGw-00HG3A-0q;
	Sat, 22 Jul 2023 20:32:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNJGq-00HG1V-2z;
	Sat, 22 Jul 2023 20:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7yk0ur+hpEiQbBV8GfOTsAFqllReyk886VNMTZSfoAc=; b=PptJ7fgMp1Rf0NDavhT/bJWlQc
	aZM41rghTeKO/oNp7OBm3RNweS7o/Ih/DlztlxoxIUoubnmalJqL7ShV7161kWlGQwSIT6sBIMWsy
	eG2rRgH59E1/dyKthIXBw1N0io0YCyPZBlXX4ARfARHcZqQjHlG9i0d3FLjGORckUez+OgbTZBAHO
	AoRnmSfh4Uy2xusraBByhnkgaFPE4VqTsBUBrhNzxRfV3/J+XKgkFfO+ReszG1Picxjn5s+MFggQe
	+TRQm4+cHBGoghEWCr7ItCt/L2ywjT9qdkLyIgH4Kj5Ra2TozDlxlKnQutGZgeySUCz0HWeexOksI
	jFS4WA0w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47438 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qNJGk-00064t-2z;
	Sat, 22 Jul 2023 21:32:02 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qNJGk-000kAS-UG; Sat, 22 Jul 2023 21:32:02 +0100
In-Reply-To: <ZLptIKEb7qLY5LmS@shell.armlinux.org.uk>
References: <ZLptIKEb7qLY5LmS@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	 =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	 Frank Wunderlich <frank-w@public-files.de>,
	 David Woodhouse <dwmw@amazon.co.uk>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Felix Fietkau <nbd@nbd.name>,
	Jakub Kicinski <kuba@kernel.org>,
	John Crispin <john@phrozen.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH net-next 1/4] net: ethernet: mtk_eth_soc: remove incorrect PLL
 configuration
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qNJGk-000kAS-UG@rmk-PC.armlinux.org.uk>
Date: Sat, 22 Jul 2023 21:32:02 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_133209_121507_0E97739B 
X-CRM114-Status: GOOD (  20.69  )
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

MT7623 GMAC0 attempts to configure the system clocking according to the
required speed in the .mac_config callback for non-SGMII, non-baseX and
non-TRGMII modes.

state->speed setting has never been reliable in the .mac_config
callback - there are cases where this is not the link speed,
particularly via ethtool paths, so this has always been unreliable (as
detailed in phylink's documentation.)

There is the additional issue that mtk_gmac0_rgmii_adjust() will only
be called if state->interface changes, which means it only configures
the system clocking on the very first .mac_config call, which will be
made when the network device is first brought up before any link is
established.

Essentially, this code is incredibly buggy, and probably never worked.

Moreover, checking the in-kernel DT files, it seems no platform makes
use of this code path.

Therefore, let's remove it, and disable interface modes for port 0 that
are not SGMII, 1000base-X, 2500base-X or TRGMII on the MT7623.

Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 59 ++++++---------------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  1 +
 2 files changed, 17 insertions(+), 43 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 18a8aca7944d..fe8b7e38decc 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -385,10 +385,8 @@ static int mt7621_gmac0_rgmii_adjust(struct mtk_eth *eth,
 }
 
 static void mtk_gmac0_rgmii_adjust(struct mtk_eth *eth,
-				   phy_interface_t interface, int speed)
+				   phy_interface_t interface)
 {
-	unsigned long rate;
-	u32 tck, rck, intf;
 	int ret;
 
 	if (interface == PHY_INTERFACE_MODE_TRGMII) {
@@ -399,30 +397,7 @@ static void mtk_gmac0_rgmii_adjust(struct mtk_eth *eth,
 		return;
 	}
 
-	if (speed == SPEED_1000) {
-		intf = INTF_MODE_RGMII_1000;
-		rate = 250000000;
-		rck = RCK_CTRL_RGMII_1000;
-		tck = TCK_CTRL_RGMII_1000;
-	} else {
-		intf = INTF_MODE_RGMII_10_100;
-		rate = 500000000;
-		rck = RCK_CTRL_RGMII_10_100;
-		tck = TCK_CTRL_RGMII_10_100;
-	}
-
-	mtk_w32(eth, intf, INTF_MODE);
-
-	regmap_update_bits(eth->ethsys, ETHSYS_CLKCFG0,
-			   ETHSYS_TRGMII_CLK_SEL362_5,
-			   ETHSYS_TRGMII_CLK_SEL362_5);
-
-	ret = clk_set_rate(eth->clks[MTK_CLK_TRGPLL], rate);
-	if (ret)
-		dev_err(eth->dev, "Failed to set trgmii pll: %d\n", ret);
-
-	mtk_w32(eth, rck, TRGMII_RCK_CTRL);
-	mtk_w32(eth, tck, TRGMII_TCK_CTRL);
+	dev_err(eth->dev, "Missing PLL configuration, ethernet may not work\n");
 }
 
 static struct phylink_pcs *mtk_mac_select_pcs(struct phylink_config *config,
@@ -498,17 +473,8 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 							      state->interface))
 					goto err_phy;
 			} else {
-				/* FIXME: this is incorrect. Not only does it
-				 * use state->speed (which is not guaranteed
-				 * to be correct) but it also makes use of it
-				 * in a code path that will only be reachable
-				 * when the PHY interface mode changes, not
-				 * when the speed changes. Consequently, RGMII
-				 * is probably broken.
-				 */
 				mtk_gmac0_rgmii_adjust(mac->hw,
-						       state->interface,
-						       state->speed);
+						       state->interface);
 
 				/* mt7623_pad_clk_setup */
 				for (i = 0 ; i < NUM_TRGMII_CTRL; i++)
@@ -4366,13 +4332,19 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
 
-	__set_bit(PHY_INTERFACE_MODE_MII,
-		  mac->phylink_config.supported_interfaces);
-	__set_bit(PHY_INTERFACE_MODE_GMII,
-		  mac->phylink_config.supported_interfaces);
+	/* MT7623 gmac0 is now missing its speed-specific PLL configuration
+	 * in its .mac_config method (since state->speed is not valid there.
+	 * Disable support for MII, GMII and RGMII.
+	 */
+	if (!mac->hw->soc->disable_pll_modes || mac->id != 0) {
+		__set_bit(PHY_INTERFACE_MODE_MII,
+			  mac->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_GMII,
+			  mac->phylink_config.supported_interfaces);
 
-	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_RGMII))
-		phy_interface_set_rgmii(mac->phylink_config.supported_interfaces);
+		if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_RGMII))
+			phy_interface_set_rgmii(mac->phylink_config.supported_interfaces);
+	}
 
 	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_TRGMII) && !mac->id)
 		__set_bit(PHY_INTERFACE_MODE_TRGMII,
@@ -4845,6 +4817,7 @@ static const struct mtk_soc_data mt7623_data = {
 	.offload_version = 1,
 	.hash_offset = 2,
 	.foe_entry_size = MTK_FOE_ENTRY_V1_SIZE,
+	.disable_pll_modes = true,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
 		.rxd_size = sizeof(struct mtk_rx_dma),
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 707445f6bcb1..28adda0c90c0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1030,6 +1030,7 @@ struct mtk_soc_data {
 	u16		foe_entry_size;
 	netdev_features_t hw_features;
 	bool		has_accounting;
+	bool		disable_pll_modes;
 	struct {
 		u32	txd_size;
 		u32	rxd_size;
-- 
2.30.2



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C3BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 11:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ky7Q61/hOw3ziBfkZxfzkCo0xeCb5I3gw0imb8meTEg=; b=w0XRUx1Pgyiad6
	Yh4m42q7TH0fY0KBrsxzgmIyS/dQmElwJb5eudBlIuWUp5V9C/oyB3++ev/Ppuq6kTWQ8NKRBK6wk
	FVyOM36OupuGBTFY/RPWKq1UU3Qq7ex/V2/0SDW8poF9jmy/+DQ050IoDiFfYZMRTZZwG0Y0+Zz9+
	q/EJafl7DvRvL5TuETYjvbWUZzJuUKLjD/lEBiVrbnH9t8QR3fl6p2vHW6O/VM8SM77Unii5U/1VI
	UM1z0COCt92k0n2qsv9eRpezRyvgVRDHHwm3PIeowUYtplSTRkDIdFYx/ebTZy2RvvbRkbi2tF98b
	00X5+yLB29uGzL9lkNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMpyW-00Dv8n-Cw; Wed, 23 Feb 2022 11:38:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMpun-00Dtes-H7; Wed, 23 Feb 2022 11:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=69zjPS8zVx+wOU33Gmxl3KXZk3l8n7Ooit565xJj+1s=; b=WajR2idb0BZPOMJRjEG4DWhAUD
 2l62QQVtPhKiKUcIe4SF7XOw+cYH6+zmH3CtyzwRupTpgZFVSr+TkD4lizXpz8homVhtX4S5jI2BZ
 BwPe7bs5kqsyLJf+Fedqa4NGaRviWPx+i7t5vjaepWPaIb3GN0DM6l9yOHfuaZYLx2y+W6gExTpoJ
 6ZCIvae86jIhnKAOVoBYQQBdxNdFcTz74kDP1AXUDhspCc7s0SwPjFjs5hOzNs4cNLELNSpilwWSx
 gqs6iBJemr/o3Y5gjmYwBH0b1YUW1hYWTXr+OSl2dscWBoWgV03dSs39Utvxyp+L31EziZoRzrb5n
 EvFRfCJg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57380 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nMpuj-0002jo-CK; Wed, 23 Feb 2022 11:34:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nMpui-00AJoo-P5; Wed, 23 Feb 2022 11:34:32 +0000
In-Reply-To: <YhYbpNsFROcSe4z+@shell.armlinux.org.uk>
References: <YhYbpNsFROcSe4z+@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next v2 04/10] net: dsa: mt7530: remove interface
 checks
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nMpui-00AJoo-P5@rmk-PC.armlinux.org.uk>
Date: Wed, 23 Feb 2022 11:34:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_033437_812468_1B6695D3 
X-CRM114-Status: GOOD (  13.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As phylink checks the interface mode against the supported_interfaces
bitmap, we no longer need to validate the interface mode, nor handle
PHY_INTERFACE_MODE_NA in the validation function. Remove these to
simplify the implementation.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mt7530.c | 82 ----------------------------------------
 drivers/net/dsa/mt7530.h |  2 -
 2 files changed, 84 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index b07fc7f4c723..9579cd9aaa18 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2410,37 +2410,6 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
 	}
 }
 
-static bool
-mt7530_phy_mode_supported(struct dsa_switch *ds, int port,
-			  const struct phylink_link_state *state)
-{
-	struct mt7530_priv *priv = ds->priv;
-
-	switch (port) {
-	case 0 ... 4: /* Internal phy */
-		if (state->interface != PHY_INTERFACE_MODE_GMII)
-			return false;
-		break;
-	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
-		if (!phy_interface_mode_is_rgmii(state->interface) &&
-		    state->interface != PHY_INTERFACE_MODE_MII &&
-		    state->interface != PHY_INTERFACE_MODE_GMII)
-			return false;
-		break;
-	case 6: /* 1st cpu port */
-		if (state->interface != PHY_INTERFACE_MODE_RGMII &&
-		    state->interface != PHY_INTERFACE_MODE_TRGMII)
-			return false;
-		break;
-	default:
-		dev_err(priv->dev, "%s: unsupported port: %i\n", __func__,
-			port);
-		return false;
-	}
-
-	return true;
-}
-
 static bool mt7531_is_rgmii_port(struct mt7530_priv *priv, u32 port)
 {
 	return (port == 5) && (priv->p5_intf_sel != P5_INTF_SEL_GMAC5_SGMII);
@@ -2477,44 +2446,6 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 	}
 }
 
-static bool
-mt7531_phy_mode_supported(struct dsa_switch *ds, int port,
-			  const struct phylink_link_state *state)
-{
-	struct mt7530_priv *priv = ds->priv;
-
-	switch (port) {
-	case 0 ... 4: /* Internal phy */
-		if (state->interface != PHY_INTERFACE_MODE_GMII)
-			return false;
-		break;
-	case 5: /* 2nd cpu port supports either rgmii or sgmii/8023z */
-		if (mt7531_is_rgmii_port(priv, port))
-			return phy_interface_mode_is_rgmii(state->interface);
-		fallthrough;
-	case 6: /* 1st cpu port supports sgmii/8023z only */
-		if (state->interface != PHY_INTERFACE_MODE_SGMII &&
-		    !phy_interface_mode_is_8023z(state->interface))
-			return false;
-		break;
-	default:
-		dev_err(priv->dev, "%s: unsupported port: %i\n", __func__,
-			port);
-		return false;
-	}
-
-	return true;
-}
-
-static bool
-mt753x_phy_mode_supported(struct dsa_switch *ds, int port,
-			  const struct phylink_link_state *state)
-{
-	struct mt7530_priv *priv = ds->priv;
-
-	return priv->info->phy_mode_supported(ds, port, state);
-}
-
 static int
 mt753x_pad_setup(struct dsa_switch *ds, const struct phylink_link_state *state)
 {
@@ -2770,9 +2701,6 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 	struct mt7530_priv *priv = ds->priv;
 	u32 mcr_cur, mcr_new;
 
-	if (!mt753x_phy_mode_supported(ds, port, state))
-		goto unsupported;
-
 	switch (port) {
 	case 0 ... 4: /* Internal phy */
 		if (state->interface != PHY_INTERFACE_MODE_GMII)
@@ -2990,12 +2918,6 @@ mt753x_phylink_validate(struct dsa_switch *ds, int port,
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
 	struct mt7530_priv *priv = ds->priv;
 
-	if (state->interface != PHY_INTERFACE_MODE_NA &&
-	    !mt753x_phy_mode_supported(ds, port, state)) {
-		linkmode_zero(supported);
-		return;
-	}
-
 	phylink_set_port_modes(mask);
 
 	if (state->interface != PHY_INTERFACE_MODE_TRGMII &&
@@ -3222,7 +3144,6 @@ static const struct mt753x_info mt753x_table[] = {
 		.phy_write = mt7530_phy_write,
 		.pad_setup = mt7530_pad_clk_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
-		.phy_mode_supported = mt7530_phy_mode_supported,
 		.mac_port_validate = mt7530_mac_port_validate,
 		.mac_port_get_state = mt7530_phylink_mac_link_state,
 		.mac_port_config = mt7530_mac_config,
@@ -3234,7 +3155,6 @@ static const struct mt753x_info mt753x_table[] = {
 		.phy_write = mt7530_phy_write,
 		.pad_setup = mt7530_pad_clk_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
-		.phy_mode_supported = mt7530_phy_mode_supported,
 		.mac_port_validate = mt7530_mac_port_validate,
 		.mac_port_get_state = mt7530_phylink_mac_link_state,
 		.mac_port_config = mt7530_mac_config,
@@ -3247,7 +3167,6 @@ static const struct mt753x_info mt753x_table[] = {
 		.pad_setup = mt7531_pad_setup,
 		.cpu_port_config = mt7531_cpu_port_config,
 		.mac_port_get_caps = mt7531_mac_port_get_caps,
-		.phy_mode_supported = mt7531_phy_mode_supported,
 		.mac_port_validate = mt7531_mac_port_validate,
 		.mac_port_get_state = mt7531_phylink_mac_link_state,
 		.mac_port_config = mt7531_mac_config,
@@ -3310,7 +3229,6 @@ mt7530_probe(struct mdio_device *mdiodev)
 	if (!priv->info->sw_setup || !priv->info->pad_setup ||
 	    !priv->info->phy_read || !priv->info->phy_write ||
 	    !priv->info->mac_port_get_caps ||
-	    !priv->info->phy_mode_supported ||
 	    !priv->info->mac_port_validate ||
 	    !priv->info->mac_port_get_state || !priv->info->mac_port_config)
 		return -EINVAL;
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index e285b68ba354..cbebbcc76509 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -771,8 +771,6 @@ struct mt753x_info {
 	int (*cpu_port_config)(struct dsa_switch *ds, int port);
 	void (*mac_port_get_caps)(struct dsa_switch *ds, int port,
 				  struct phylink_config *config);
-	bool (*phy_mode_supported)(struct dsa_switch *ds, int port,
-				   const struct phylink_link_state *state);
 	void (*mac_port_validate)(struct dsa_switch *ds, int port,
 				  unsigned long *supported);
 	int (*mac_port_get_state)(struct dsa_switch *ds, int port,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

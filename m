Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4775C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qczsf+9cUdeQkoyMgqSk/AzhsxmUc4vvgIrh7xh93KQ=; b=wM6Wk5/D9nUSV+
	FZpIOKdAQ+QIpt5Vv3zsJob1cnse7C04Q9LxKhzA56iTLtnywH8M2U8etO+r4ciFfBQUah5K/sTu7
	ZDbrfKnIdZaLFlvWOXpPO/pHkbDgKrs+18TlyeXH+7gPGr9MMKWhIoy3+lfWuCy9VVTfkx8K6Ff9j
	1kBlwa2S/YOaQ711vTeISNyhHFRTVoLUhsZUW4Mg1OwhWLtKX5C8z0/1V16e/oOYMiAuheTt3xzdj
	doPtCjLQBfqUIetIpwVQC25q51Spk097mgIR8brWgTIuPo7w6YA/qpVnycEwB8W6FCtnrXB9CCqz0
	6jGmZxKOiFG3x6RyAJuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc3E5-005WoA-At; Wed, 06 Apr 2022 10:49:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc3DZ-005WXj-PN; Wed, 06 Apr 2022 10:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LkbEOT26kL2uwNuA+wYdLbVPQ0Szq1nnQ/rAESdhQwQ=; b=p59vcAPMEWP6auL+iXL3X4e00M
 PvfOhqhfJt7cjW8Duhkbbm5y6gEmLEV4Rbm5vpuustJf+rY0SZJkQWK2F//CroZBuips93X0AACnF
 v9MLykMBm3TC8CcJUWR/cTA52kWJLNain3/wNOgON3zWUVxxIr3u+CRvmB0J0DBOh6P9AGkTxPlC1
 sMKQrJNVuHLI7KUh7Ju796KRZwHK1nYiw1+2N1oH7kI824M8Iyu8l2/BBPUnMPIQNDdMnza0BMEiL
 oqaPpaDEcY/wlMSOyiqL5GDDh+1mPVi+C7+x4L1mTh8XLkbUAkMwwUM7+Jrc2r3ISZlmzrjuFVY7o
 UoADWfIA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59984 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc3DU-0002ZQ-5R; Wed, 06 Apr 2022 11:48:47 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc3DT-004hpv-5d; Wed, 06 Apr 2022 11:48:47 +0100
In-Reply-To: <Yk1iHCy4fqvxsvu0@shell.armlinux.org.uk>
References: <Yk1iHCy4fqvxsvu0@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Marek Beh__n <kabel@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 3/9] net: dsa: mt7530: remove interface checks
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc3DT-004hpv-5d@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 11:48:47 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_034854_039424_61650854 
X-CRM114-Status: GOOD (  13.16  )
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
index 954d738c75f2..60264836da49 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2415,37 +2415,6 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
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
@@ -2482,44 +2451,6 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
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
@@ -2775,9 +2706,6 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 	struct mt7530_priv *priv = ds->priv;
 	u32 mcr_cur, mcr_new;
 
-	if (!mt753x_phy_mode_supported(ds, port, state))
-		goto unsupported;
-
 	switch (port) {
 	case 0 ... 4: /* Internal phy */
 		if (state->interface != PHY_INTERFACE_MODE_GMII)
@@ -2995,12 +2923,6 @@ mt753x_phylink_validate(struct dsa_switch *ds, int port,
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
@@ -3227,7 +3149,6 @@ static const struct mt753x_info mt753x_table[] = {
 		.phy_write = mt7530_phy_write,
 		.pad_setup = mt7530_pad_clk_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
-		.phy_mode_supported = mt7530_phy_mode_supported,
 		.mac_port_validate = mt7530_mac_port_validate,
 		.mac_port_get_state = mt7530_phylink_mac_link_state,
 		.mac_port_config = mt7530_mac_config,
@@ -3239,7 +3160,6 @@ static const struct mt753x_info mt753x_table[] = {
 		.phy_write = mt7530_phy_write,
 		.pad_setup = mt7530_pad_clk_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
-		.phy_mode_supported = mt7530_phy_mode_supported,
 		.mac_port_validate = mt7530_mac_port_validate,
 		.mac_port_get_state = mt7530_phylink_mac_link_state,
 		.mac_port_config = mt7530_mac_config,
@@ -3252,7 +3172,6 @@ static const struct mt753x_info mt753x_table[] = {
 		.pad_setup = mt7531_pad_setup,
 		.cpu_port_config = mt7531_cpu_port_config,
 		.mac_port_get_caps = mt7531_mac_port_get_caps,
-		.phy_mode_supported = mt7531_phy_mode_supported,
 		.mac_port_validate = mt7531_mac_port_validate,
 		.mac_port_get_state = mt7531_phylink_mac_link_state,
 		.mac_port_config = mt7531_mac_config,
@@ -3315,7 +3234,6 @@ mt7530_probe(struct mdio_device *mdiodev)
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

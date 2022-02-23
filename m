Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF6CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOoVGYYVLRrPUA6U7Dp0TqI2wVPKNygD8fvetw60cE4=; b=Ic2153ErkMz0ip
	GyR+kfu34qDjHU1Df6nmw+dI+u2WXRlTQnzavBkWwoc+TPTMV7RXVlCG36W5qzzhA/edSQAtd0LuL
	qaI+Hin2i9mKfSHjd/cwVNLwxCD65xj6o4EJ3/MK/ykfhTLgWM5uYZ4mLFCgFZGXehk2ZsxeEQdIO
	HwT3opF+I5+Gxu+XExKMUfKLT4IPt18rk27+OpNfrk+Of9KQ9qhEP41Jfxi7SZIVHOvZhCUmkeNOx
	JkzcBlrQgQWfHzmTGd7LUvpEI10uatAYpJ08xkxnt4tjgKhaZ54MWdAwbdRfRkQ319VsjG8n4Zaud
	hMfD/f6kzT7PiHYfA0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMq3X-00Dwy8-FX; Wed, 23 Feb 2022 11:43:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMpv2-00Dtmm-Qa; Wed, 23 Feb 2022 11:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rx1j11AzCBRyRfycGOlPR8D02DXsIdS/CJYgaoAIxR4=; b=j3HGJlEaW8nxReIrVVaguehgFV
 ml4zk3iBbZe0hIK/Kni43XzpwdSDqyHSPCT6T17cRdfjKNNeB9JX3l0Xb/8la3Z442uxpW16CoRko
 KNdfcsGmVApu0YS9XuNI6rSMDxkOeYR9Y3Y8Ku9v+lRE+u1n/YLGz5TVNdY6fakjf0G740FwwFMX5
 XfhTtu1nFWT+aJBdyj6s8Yh4Jnhy5SwTF/og+zHivQ6las6fXg9xgLhw54ln4Mks65vn4HtM+DUQN
 IVwM08LsmM6LOTqm8lt2vIvqIjKD3sKnJqLbmElUNhjJGsGW8JuZzZ6UqHXJV89X3bJggiUY6moYh
 /FoG+M7g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57386 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nMpuz-0002kR-19; Wed, 23 Feb 2022 11:34:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nMpuy-00AJp6-3m; Wed, 23 Feb 2022 11:34:48 +0000
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
Subject: [PATCH RFC net-next v2 07/10] net: dsa: mt7530: switch to use
 phylink_get_linkmodes()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nMpuy-00AJp6-3m@rmk-PC.armlinux.org.uk>
Date: Wed, 23 Feb 2022 11:34:48 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_033452_960933_DDFE30BD 
X-CRM114-Status: GOOD (  13.22  )
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

Switch mt7530 to use phylink_get_linkmodes() to generate the ethtool
linkmodes that can be supported. We are unable to use the generic
helper for this as pause modes are dependent on the interface as
the Autoneg bit depends on the interface mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mt7530.c | 58 ++++------------------------------------
 1 file changed, 5 insertions(+), 53 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index db1d13718ff1..8e96bcd44cbb 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2516,20 +2516,6 @@ static int mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
 	return 0;
 }
 
-static void mt7531_sgmii_validate(struct mt7530_priv *priv, int port,
-				  phy_interface_t interface,
-				  unsigned long *supported)
-{
-	/* Port5 supports ethier RGMII or SGMII.
-	 * Port6 supports SGMII only.
-	 */
-	if ((port == 5 || port == 6) &&
-	    interface == PHY_INTERFACE_MODE_2500BASEX) {
-		phylink_set(supported, 2500baseX_Full);
-		phylink_set(supported, 2500baseT_Full);
-	}
-}
-
 static void
 mt7531_sgmii_link_up_force(struct dsa_switch *ds, int port,
 			   unsigned int mode, phy_interface_t interface,
@@ -2897,52 +2883,22 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 	priv->info->mac_port_get_caps(ds, port, config);
 }
 
-static void
-mt7530_mac_port_validate(struct dsa_switch *ds, int port,
-			 phy_interface_t interface,
-			 unsigned long *supported)
-{
-}
-
-static void mt7531_mac_port_validate(struct dsa_switch *ds, int port,
-				     phy_interface_t interface,
-				     unsigned long *supported)
-{
-	struct mt7530_priv *priv = ds->priv;
-
-	mt7531_sgmii_validate(priv, port, interface, supported);
-}
-
 static void
 mt753x_phylink_validate(struct dsa_switch *ds, int port,
 			unsigned long *supported,
 			struct phylink_link_state *state)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
-	struct mt7530_priv *priv = ds->priv;
+	u32 caps;
+
+	caps = dsa_to_port(ds, port)->pl_config.mac_capabilities;
 
 	phylink_set_port_modes(mask);
+	phylink_get_linkmodes(mask, state->interface, caps);
 
 	if (state->interface != PHY_INTERFACE_MODE_TRGMII &&
-	    !phy_interface_mode_is_8023z(state->interface)) {
-		phylink_set(mask, 10baseT_Half);
-		phylink_set(mask, 10baseT_Full);
-		phylink_set(mask, 100baseT_Half);
-		phylink_set(mask, 100baseT_Full);
+	    !phy_interface_mode_is_8023z(state->interface))
 		phylink_set(mask, Autoneg);
-	}
-
-	/* This switch only supports 1G full-duplex. */
-	if (state->interface != PHY_INTERFACE_MODE_MII &&
-	    state->interface != PHY_INTERFACE_MODE_2500BASEX)
-		phylink_set(mask, 1000baseT_Full);
-		phylink_set(mask, 1000baseX_Full);
-	}
-
-	priv->info->mac_port_validate(ds, port, state->interface, mask);
-
-	phylink_set(mask, Pause);
-	phylink_set(mask, Asym_Pause);
 
 	linkmode_and(supported, supported, mask);
 	linkmode_and(state->advertising, state->advertising, mask);
@@ -3143,7 +3099,6 @@ static const struct mt753x_info mt753x_table[] = {
 		.phy_write = mt7530_phy_write,
 		.pad_setup = mt7530_pad_clk_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
-		.mac_port_validate = mt7530_mac_port_validate,
 		.mac_port_get_state = mt7530_phylink_mac_link_state,
 		.mac_port_config = mt7530_mac_config,
 	},
@@ -3154,7 +3109,6 @@ static const struct mt753x_info mt753x_table[] = {
 		.phy_write = mt7530_phy_write,
 		.pad_setup = mt7530_pad_clk_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
-		.mac_port_validate = mt7530_mac_port_validate,
 		.mac_port_get_state = mt7530_phylink_mac_link_state,
 		.mac_port_config = mt7530_mac_config,
 	},
@@ -3166,7 +3120,6 @@ static const struct mt753x_info mt753x_table[] = {
 		.pad_setup = mt7531_pad_setup,
 		.cpu_port_config = mt7531_cpu_port_config,
 		.mac_port_get_caps = mt7531_mac_port_get_caps,
-		.mac_port_validate = mt7531_mac_port_validate,
 		.mac_port_get_state = mt7531_phylink_mac_link_state,
 		.mac_port_config = mt7531_mac_config,
 		.mac_pcs_an_restart = mt7531_sgmii_restart_an,
@@ -3228,7 +3181,6 @@ mt7530_probe(struct mdio_device *mdiodev)
 	if (!priv->info->sw_setup || !priv->info->pad_setup ||
 	    !priv->info->phy_read || !priv->info->phy_write ||
 	    !priv->info->mac_port_get_caps ||
-	    !priv->info->mac_port_validate ||
 	    !priv->info->mac_port_get_state || !priv->info->mac_port_config)
 		return -EINVAL;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

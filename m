Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117DFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zK6LQI9P0VnEK8i7J+b4aOUCczUj1R7HNK+JHJXx7wQ=; b=Dw24EqFWIoNYJt
	EZj0kcq3pxOFTXRMHsln5r+ylG0cd/iIuIgwBiz5PDdDyaT4fMk7s2o6iU/u0HE5IvxvW0vxw17Jc
	/lQlAdmvchysPLzllfL2W8Wp0QGd3t3ZpoDr2jPFJe/hnLt22KCfh77mKmcVrtdPteqXGte/GhHBu
	G5iLkIL4oOgc0Sv5zK+hWGXVShpeWT0GrcWX5n6krniAvzFmkWu1R0iR97bEgwtW96Ii6HTbZBf8O
	jNlzEgNy9nP3gdYwu/+Qdl3gQ4aouQ70O20eIPYhfmNhGn1pkzZ1TpQukTNi1y4+2CUlV+op3DS5d
	/CyUh5TrhXzXDwNGgNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc3Fd-005XoM-D4; Wed, 06 Apr 2022 10:51:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc3Do-005Weh-2c; Wed, 06 Apr 2022 10:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FgNxrs7xD4YWLqymaCqiDEJMpwJw8X6XmRKxRXVW9vM=; b=GUOyiDcdmE3CohcywOvljYZpWM
 HRt//OIigL0z/4bWUZg3wqBnosZTV06O4qCMChzizGgKGLpBNxPexaWkjYcIUJcOrtHVOAmDoQJYL
 lzPt+OBE7HM8choT7l4atSW8LqoA3HKSRE8m802x+7JhxmcCJdtdfX9xbZ8dC5Js9AiutKM/ljeTs
 +y31zQsFLZW6iIBL05bYWwI/TTE38jt2op3eY1bqfbcnCSncyfLrK1QzU/PkqFeqLLZNIVtbE29Hr
 JxWcZGDF4eFxcmLM+79gMyrGI+r57yAk6AHIYaYSjI1zqp/EBxWqQamGjvONQcxOW6TMS53Jq+SOY
 JvLUXl4Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59990 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc3Dj-0002aC-DT; Wed, 06 Apr 2022 11:49:03 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc3Di-004hqE-Gi; Wed, 06 Apr 2022 11:49:02 +0100
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
Subject: [PATCH net-next 6/9] net: dsa: mt7530: switch to use
 phylink_get_linkmodes()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc3Di-004hqE-Gi@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 11:49:02 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_034908_173693_C9446408 
X-CRM114-Status: GOOD (  13.29  )
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
index 0c30d8586062..aa7f21683a07 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2521,20 +2521,6 @@ static int mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
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
@@ -2902,52 +2888,22 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
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
@@ -3148,7 +3104,6 @@ static const struct mt753x_info mt753x_table[] = {
 		.phy_write = mt7530_phy_write,
 		.pad_setup = mt7530_pad_clk_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
-		.mac_port_validate = mt7530_mac_port_validate,
 		.mac_port_get_state = mt7530_phylink_mac_link_state,
 		.mac_port_config = mt7530_mac_config,
 	},
@@ -3159,7 +3114,6 @@ static const struct mt753x_info mt753x_table[] = {
 		.phy_write = mt7530_phy_write,
 		.pad_setup = mt7530_pad_clk_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
-		.mac_port_validate = mt7530_mac_port_validate,
 		.mac_port_get_state = mt7530_phylink_mac_link_state,
 		.mac_port_config = mt7530_mac_config,
 	},
@@ -3171,7 +3125,6 @@ static const struct mt753x_info mt753x_table[] = {
 		.pad_setup = mt7531_pad_setup,
 		.cpu_port_config = mt7531_cpu_port_config,
 		.mac_port_get_caps = mt7531_mac_port_get_caps,
-		.mac_port_validate = mt7531_mac_port_validate,
 		.mac_port_get_state = mt7531_phylink_mac_link_state,
 		.mac_port_config = mt7531_mac_config,
 		.mac_pcs_an_restart = mt7531_sgmii_restart_an,
@@ -3233,7 +3186,6 @@ mt7530_probe(struct mdio_device *mdiodev)
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

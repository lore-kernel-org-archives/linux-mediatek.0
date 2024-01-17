Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BE6C47422
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 10:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s42xCN4sziGeSF5PdhySW+qmlDav4JggC7p+qPK+ekE=; b=zXSYq1oWs3jLpOYorFEOAx+XCn
	/8nbCQUUk/Cydptv4txjLeQ5j04HCctVvIdp2mVGaPpWljn/HzpRX+4ROkM+EI91/oJ65LAvXew8N
	wNe26tUt7BJWNW4C47uut1Roeo2rfeRlQKo7BJI0qTY0xlLA8ZOX5Uu8sKm3YMIJnuWy0Z5/uQFHw
	DSr38CYyrZJbKXTc8QHh973O+muBFgBJCaHiJoXGTvVp6vprq5RF1kcWQA9YgN6ohq2y0w+57WMFK
	lKvE81u7FFWN01V4MBr/ZxlUN/Klr98Vwe2hPGrIkODWDQ2k2FYz+9+JOTcHRJm+AZMNb0/xWn8UA
	mzxdBVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ3AY-00FGsq-1O;
	Wed, 17 Jan 2024 10:29:14 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ3AU-00FGp7-0v;
	Wed, 17 Jan 2024 10:29:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E7244000E;
	Wed, 17 Jan 2024 10:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705487348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s42xCN4sziGeSF5PdhySW+qmlDav4JggC7p+qPK+ekE=;
	b=YLWiTAOnF7tmtx7vbew9V/I0jZugfs97bjHPncmGJ5WiEYfIX9PocZg9l0Z3XMposbpf5B
	fthbfurxaMhBudKmFio+0c8+6bzeHaLubv99w7iGE0Fu8IX7u9/COl46+2wZENfTwUhlBS
	NhbOYQbcpeWdm0X8LB+Twgdm5Nv4zbIx3tGOSqHfByt3JihHRBQanPjX1Ym0WU163w+/72
	X18qd/y3opM5VjMkIPjJVIk5+9Q+g5nFwaa/+HvmaRfdlB0TZbOsFimkUwX1PIhphBmkF0
	8AOzPYX/SGKzzEGsGD8NqEhj+txIRN9F55YjYLBwiixGbU1VGbBssGWfTtxBhQ==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH net-next 4/8] net: dsa: mt7530: get rid of useless error returns on phylink code path
Date: Wed, 17 Jan 2024 13:28:34 +0300
Message-Id: <20240117102838.57445-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240117102838.57445-1-arinc.unal@arinc9.com>
References: <20240117102838.57445-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_022910_630226_2C80F637 
X-CRM114-Status: GOOD (  18.66  )
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

Remove error returns on the cases where they are already handled with the
function the mac_port_get_caps member in mt753x_table points to.

mt7531_mac_config() is also called from mt7531_cpu_port_config() outside of
phylink but the port and interface modes are already handled there.

Change the functions and the mac_port_config function pointer to void now
that there're no error returns anymore.

Remove mt753x_is_mac_port() that used to help the said error returns.

On mt7531_mac_config(), switch to if statements to simplify the code.

Remove internal phy cases from mt753x_phylink_mac_config(), there is no
need to check the interface mode as that's already handled with the
function the mac_port_get_caps member in mt753x_table points to.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 81 ++++++++--------------------------------
 drivers/net/dsa/mt7530.h |  2 +-
 2 files changed, 17 insertions(+), 66 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a43178b62817..32db5e14a606 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2570,7 +2570,7 @@ static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 	}
 }
 
-static int
+static void
 mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
 {
@@ -2580,22 +2580,14 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		mt7530_setup_port5(priv->ds, interface);
 	else if (port == 6)
 		mt7530_setup_port6(priv->ds, interface);
-
-	return 0;
 }
 
-static int mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
-			      phy_interface_t interface,
-			      struct phy_device *phydev)
+static void mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
+			       phy_interface_t interface,
+			       struct phy_device *phydev)
 {
 	u32 val;
 
-	if (priv->p5_sgmii) {
-		dev_err(priv->dev, "RGMII mode is not available for port %d\n",
-			port);
-		return -EINVAL;
-	}
-
 	val = mt7530_read(priv, MT7531_CLKGEN_CTRL);
 	val |= GP_CLK_EN;
 	val &= ~GP_MODE_MASK;
@@ -2623,20 +2615,14 @@ static int mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
 		case PHY_INTERFACE_MODE_RGMII_ID:
 			break;
 		default:
-			return -EINVAL;
+			break;
 		}
 	}
-	mt7530_write(priv, MT7531_CLKGEN_CTRL, val);
-
-	return 0;
-}
 
-static bool mt753x_is_mac_port(u32 port)
-{
-	return (port == 5 || port == 6);
+	mt7530_write(priv, MT7531_CLKGEN_CTRL, val);
 }
 
-static int
+static void
 mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
 {
@@ -2644,42 +2630,21 @@ mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 	struct phy_device *phydev;
 	struct dsa_port *dp;
 
-	if (!mt753x_is_mac_port(port)) {
-		dev_err(priv->dev, "port %d is not a MAC port\n", port);
-		return -EINVAL;
-	}
-
-	switch (interface) {
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
+	if (phy_interface_mode_is_rgmii(interface)) {
 		dp = dsa_to_port(ds, port);
 		phydev = dp->user->phydev;
-		return mt7531_rgmii_setup(priv, port, interface, phydev);
-	case PHY_INTERFACE_MODE_SGMII:
-	case PHY_INTERFACE_MODE_NA:
-	case PHY_INTERFACE_MODE_1000BASEX:
-	case PHY_INTERFACE_MODE_2500BASEX:
-		/* handled in SGMII PCS driver */
-		return 0;
-	default:
-		return -EINVAL;
+		mt7531_rgmii_setup(priv, port, interface, phydev);
 	}
-
-	return -EINVAL;
 }
 
-static int
+static void
 mt753x_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  const struct phylink_link_state *state)
 {
 	struct mt7530_priv *priv = ds->priv;
 
-	if (!priv->info->mac_port_config)
-		return 0;
-
-	return priv->info->mac_port_config(ds, port, mode, state->interface);
+	if (priv->info->mac_port_config)
+		priv->info->mac_port_config(ds, port, mode, state->interface);
 }
 
 static struct phylink_pcs *
@@ -2708,17 +2673,11 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 	u32 mcr_cur, mcr_new;
 
 	switch (port) {
-	case 0 ... 4:
-		if (state->interface != PHY_INTERFACE_MODE_GMII &&
-		    state->interface != PHY_INTERFACE_MODE_INTERNAL)
-			goto unsupported;
-		break;
 	case 5:
 		if (priv->p5_interface == state->interface)
 			break;
 
-		if (mt753x_mac_config(ds, port, mode, state) < 0)
-			goto unsupported;
+		mt753x_mac_config(ds, port, mode, state);
 
 		if (priv->p5_intf_sel != P5_DISABLED)
 			priv->p5_interface = state->interface;
@@ -2727,16 +2686,10 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		if (priv->p6_interface == state->interface)
 			break;
 
-		if (mt753x_mac_config(ds, port, mode, state) < 0)
-			goto unsupported;
+		mt753x_mac_config(ds, port, mode, state);
 
 		priv->p6_interface = state->interface;
 		break;
-	default:
-unsupported:
-		dev_err(ds->dev, "%s: unsupported %s port: %i\n",
-			__func__, phy_modes(state->interface), port);
-		return;
 	}
 
 	mcr_cur = mt7530_read(priv, MT7530_PMCR_P(port));
@@ -2820,7 +2773,6 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
 	struct mt7530_priv *priv = ds->priv;
 	phy_interface_t interface;
 	int speed;
-	int ret;
 
 	switch (port) {
 	case 5:
@@ -2845,9 +2797,8 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
 	else
 		speed = SPEED_1000;
 
-	ret = mt7531_mac_config(ds, port, MLO_AN_FIXED, interface);
-	if (ret)
-		return ret;
+	mt7531_mac_config(ds, port, MLO_AN_FIXED, interface);
+
 	mt7530_write(priv, MT7530_PMCR_P(port),
 		     PMCR_CPU_PORT_SETTING(priv->id));
 	mt753x_phylink_mac_link_up(ds, port, MLO_AN_FIXED, interface, NULL,
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 26a6d2160c08..4b47a5cac848 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -730,7 +730,7 @@ struct mt753x_info {
 	void (*mac_port_validate)(struct dsa_switch *ds, int port,
 				  phy_interface_t interface,
 				  unsigned long *supported);
-	int (*mac_port_config)(struct dsa_switch *ds, int port,
+	void (*mac_port_config)(struct dsa_switch *ds, int port,
 			       unsigned int mode,
 			       phy_interface_t interface);
 };
-- 
2.40.1



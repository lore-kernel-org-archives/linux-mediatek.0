Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1BFC48BEB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uebfHmMZMDkh/GdwwvzI+UQLlSxf7nUQm4phCbddyG8=; b=sMUGrGrS5oUiVgyqedhfzR9/I0
	y3t4I8YpaYVEQl1hqHbF97mNJOkH0G7g1h4y1suoPBdtXu6UpzfFmD57fsFrEDzTpH9q7z0Ld6uHT
	zz3hAp8RELKMIt2LnE1yONIfLVHyokLhq1Poc3Fal4sXZuuSummQ2FHr9DXraQbBv9bYdaE3unAm1
	S9f0Sg+ZWMuKmapoO4h9QRQ3qVr0VnpmE9KJP6L3/ag3ZcZTB3lIBZ0MNC2G/LxBx6JTMpszBBfEV
	f0xL5GO9nUFbVsGiyJ0ixHGAj7EELCt5Kj0xi5B5ASareBqlv1X1rRkedVf7A2ROW7o64atnrK/pd
	lkYQNLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raw2x-000000024oX-0E6t;
	Fri, 16 Feb 2024 11:06:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raw2Z-000000024RM-2Z7S;
	Fri, 16 Feb 2024 11:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=uebfHmMZMDkh/GdwwvzI+UQLlSxf7nUQm4phCbddyG8=; b=VGxNd6+HQt0W7M9FoCRaO8CTqK
	QzMPjsXG1KxMYcmJFCZyHRvKWxfwCyftLn/rGXyl7mYUKVaP6l5FpqUH6yc3xDVbpeNeaNtLXI00/
	hvSqnJIg7e0RjHntdA/Kj1F8vGN5nFAzbjLkS/vIRilO9kelKpnk2geNboAs2RUKT74m18/2KeN6o
	S67nRY5hnRclF6VsejHX811SA/dwITgWLiX5s3CNAvvrbnjbvIquPWEAC8uta8lsxuUEUXu7rbQ9G
	/L/bY2x+H4Ag6n531mOdgTmM6uCBwyKVWLtGd5xgGUy7afTiwBOFmg5ZIQrSZLdRI9RyoCUv/CTP2
	os5t78iA==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raw2V-0000000HS59-2ORT;
	Fri, 16 Feb 2024 11:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3DF40CE2AE3;
	Fri, 16 Feb 2024 11:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31B06C43330;
	Fri, 16 Feb 2024 11:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708081544;
	bh=04/0rCcowbZ6LhgeozKI78kK1WE+TDUCuzqyX4cOs54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=In+XUmzDUqnVgxXJ46aHfVc1FezSPbMtS1kxRpb4G346M52lWpWnu2IiTCTiWD7oy
	 ReNoji4Ql3sqnlrWO4XqBI6YRD6q2mmat50wZwH4oIt12V//UwhW08d+oWj6yHsXC3
	 rHTEsm5MU2ie3dMZnLpdRnNxLq279QAhWaMveRyRfzi0OCU7/Ac7cInd/FSHOO/J5J
	 T+rzGjYE3+J/838+Ne9zjr0ceVDlhiGfOT28dU0y5yDNdUYwLgHAHnQxrbDWgu/Xzs
	 JhcT1yVuAFywBQpBi/k6PUI5csOPOVQhiSgnAV4STbngG/FgQpiwbbk/2p7x9iB3rw
	 DdpUFZRwyyeFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B1FC48BF6;
	Fri, 16 Feb 2024 11:05:44 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 16 Feb 2024 14:05:32 +0300
Subject: [PATCH net-next v2 4/8] net: dsa: mt7530: get rid of useless error
 returns on phylink code path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240216-for-netnext-mt7530-improvements-3-v2-4-094cae3ff23b@arinc9.com>
References: <20240216-for-netnext-mt7530-improvements-3-v2-0-094cae3ff23b@arinc9.com>
In-Reply-To: <20240216-for-netnext-mt7530-improvements-3-v2-0-094cae3ff23b@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com, 
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708081540; l=6745;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=EL1vGonmNpBImZU3uthb96aDLRU2riphSBzoDbxXdI8=;
 b=YQwL4VvRatyXpfnXGPW9IetSxUnkNH6eigKYAzu0rfRUg9jvxRUlaEaCtz0RMh86/iHYu+AQ1
 YunXx+hyr9+BLFaZcCQG3bUGNv3FkHyny4T0EYLIOT9lUQ8l699WJ8v
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_110556_590908_1DE02184 
X-CRM114-Status: GOOD (  18.46  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

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
 drivers/net/dsa/mt7530.c | 81 ++++++++++--------------------------------------
 drivers/net/dsa/mt7530.h |  6 ++--
 2 files changed, 19 insertions(+), 68 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 296711fd5c43..c069bf273733 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2587,7 +2587,7 @@ static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 	}
 }
 
-static int
+static void
 mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
 {
@@ -2597,22 +2597,14 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
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
@@ -2640,20 +2632,14 @@ static int mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
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
@@ -2661,42 +2647,21 @@ mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
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
@@ -2725,17 +2690,11 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
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
@@ -2744,16 +2703,10 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
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
@@ -2836,7 +2789,6 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
 	struct mt7530_priv *priv = ds->priv;
 	phy_interface_t interface;
 	int speed;
-	int ret;
 
 	switch (port) {
 	case 5:
@@ -2861,9 +2813,8 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
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
index 26a6d2160c08..b1665de7f640 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -730,9 +730,9 @@ struct mt753x_info {
 	void (*mac_port_validate)(struct dsa_switch *ds, int port,
 				  phy_interface_t interface,
 				  unsigned long *supported);
-	int (*mac_port_config)(struct dsa_switch *ds, int port,
-			       unsigned int mode,
-			       phy_interface_t interface);
+	void (*mac_port_config)(struct dsa_switch *ds, int port,
+				unsigned int mode,
+				phy_interface_t interface);
 };
 
 /* struct mt7530_priv -	This is the main data structure for holding the state

-- 
2.40.1



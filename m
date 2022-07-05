Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD56BC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaMhBPinFc7SfDMKhd/cixK+yQqwVIsgsc3kCqlaJHM=; b=Hr44w61rRWpkA83M1noObPBVm+
	SpuBHfBG+PPO9GCRzVk79UG76EAugsyPyogEX73i/RIshlC7TAm156P7fAuGpUn/OOVAcQGW+BGRN
	sLnGROrAblycaI3FNaiyIcD4LPiHK7zvjakiTAC2OEH6e2tG05r+PiTITsbnLIGAcX5WujofVA7yS
	/ihJa32G9cZ2hBwaXVIQUHRZknV89/A1zRrEZa2/FxLXyrjMTNO9lI9d1ReKMNv801c7KstaFDJqT
	AfZZ0oDRsq5Jyan3ZAasICs7icudJZWPkTGGcCV/QseSJDJuZuOQ8wEEIX4ttFRfrYMZAYA9u455D
	A108xhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fAr-00GuKX-DX; Tue, 05 Jul 2022 09:48:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fA4-00Gtnn-B3; Tue, 05 Jul 2022 09:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WaMhBPinFc7SfDMKhd/cixK+yQqwVIsgsc3kCqlaJHM=; b=ct3g2FtN0T7n5SZ3O20Y31dvdD
	WEoCcph92MhZyaT6Iwm2EDhkMmUmjZRzE5r2OwvXkzORsKUOtsZWAD6L48DusjVEoaYbjmbE/1UC1
	ZHpZJVS9owERasH74oXScLyOg/IFRJpsqSG915z8MkVsReq8Jw+uP1wq7W6ZmuRVDe2ZTahuueBEA
	x88ESs3TMeGwF/hHgtx1NST4iPh+1pqDSs/YuZlmHI+PUW4fjfU7rzIkxCZYLEqQNvbNfd9gIByU3
	WK4rOwesIMUMVUvzl904Rrma1ir/XHeoU/7qoI6Kqh/JAUPiJgcH1U+IweEtmeThpCDFvWmtFVb+S
	WFLEBT5A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60650 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1o8f9s-00013C-UC; Tue, 05 Jul 2022 10:47:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1o8f9s-0059a6-3S; Tue, 05 Jul 2022 10:47:52 +0100
In-Reply-To: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Alvin __ipraga" <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: [PATCH RFC net-next 2/5] net: dsa: mv88e6xxx: report the default
 interface mode for the port
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1o8f9s-0059a6-3S@rmk-PC.armlinux.org.uk>
Date: Tue, 05 Jul 2022 10:47:52 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_024804_585461_7B2EA66B 
X-CRM114-Status: GOOD (  18.89  )
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

Report the maximum speed interface mode for the port, or if we don't
have that information, the hardware configured interface mode for
the port.

This allows phylink to know which interface mode CPU and DSA ports
are operating, which will be necessary when we want to select the
maximum speed for the port (required for such ports without a PHY or
fixed-link specified in firmware.)

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 83 +++++++++++++++++++++++---------
 drivers/net/dsa/mv88e6xxx/chip.h |  3 +-
 2 files changed, 62 insertions(+), 24 deletions(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index f98be98551ef..877407bc09de 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -578,7 +578,8 @@ static const u8 mv88e6185_phy_interface_modes[] = {
 };
 
 static void mv88e6095_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
-				       struct phylink_config *config)
+				       struct phylink_config *config,
+				       phy_interface_t *default_interface)
 {
 	u8 cmode = chip->ports[port].cmode;
 
@@ -588,23 +589,29 @@ static void mv88e6095_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
 		__set_bit(PHY_INTERFACE_MODE_MII, config->supported_interfaces);
 	} else {
 		if (cmode < ARRAY_SIZE(mv88e6185_phy_interface_modes) &&
-		    mv88e6185_phy_interface_modes[cmode])
+		    mv88e6185_phy_interface_modes[cmode]) {
 			__set_bit(mv88e6185_phy_interface_modes[cmode],
 				  config->supported_interfaces);
+			*default_interface =
+				mv88e6185_phy_interface_modes[cmode];
+		}
 
 		config->mac_capabilities |= MAC_1000FD;
 	}
 }
 
 static void mv88e6185_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
-				       struct phylink_config *config)
+				       struct phylink_config *config,
+				       phy_interface_t *default_interface)
 {
 	u8 cmode = chip->ports[port].cmode;
 
 	if (cmode < ARRAY_SIZE(mv88e6185_phy_interface_modes) &&
-	    mv88e6185_phy_interface_modes[cmode])
+	    mv88e6185_phy_interface_modes[cmode]) {
 		__set_bit(mv88e6185_phy_interface_modes[cmode],
 			  config->supported_interfaces);
+		*default_interface = mv88e6185_phy_interface_modes[cmode];
+	}
 
 	config->mac_capabilities = MAC_SYM_PAUSE | MAC_10 | MAC_100 |
 				   MAC_1000FD;
@@ -616,6 +623,7 @@ static const u8 mv88e6xxx_phy_interface_modes[] = {
 	[MV88E6XXX_PORT_STS_CMODE_GMII]		= PHY_INTERFACE_MODE_GMII,
 	[MV88E6XXX_PORT_STS_CMODE_RMII_PHY]	= PHY_INTERFACE_MODE_RMII,
 	[MV88E6XXX_PORT_STS_CMODE_RMII]		= PHY_INTERFACE_MODE_RMII,
+	[MV88E6XXX_PORT_STS_CMODE_RGMII]	= PHY_INTERFACE_MODE_RGMII,
 	[MV88E6XXX_PORT_STS_CMODE_100BASEX]	= PHY_INTERFACE_MODE_100BASEX,
 	[MV88E6XXX_PORT_STS_CMODE_1000BASEX]	= PHY_INTERFACE_MODE_1000BASEX,
 	[MV88E6XXX_PORT_STS_CMODE_SGMII]	= PHY_INTERFACE_MODE_SGMII,
@@ -625,22 +633,32 @@ static const u8 mv88e6xxx_phy_interface_modes[] = {
 	 */
 };
 
-static void mv88e6xxx_translate_cmode(u8 cmode, unsigned long *supported)
+static void mv88e6xxx_translate_cmode(u8 cmode, unsigned long *supported,
+				      phy_interface_t *default_interface)
 {
+	phy_interface_t interface;
+
 	if (cmode < ARRAY_SIZE(mv88e6xxx_phy_interface_modes) &&
-	    mv88e6xxx_phy_interface_modes[cmode])
-		__set_bit(mv88e6xxx_phy_interface_modes[cmode], supported);
-	else if (cmode == MV88E6XXX_PORT_STS_CMODE_RGMII)
-		phy_interface_set_rgmii(supported);
+	    mv88e6xxx_phy_interface_modes[cmode]) {
+		interface = mv88e6xxx_phy_interface_modes[cmode];
+		if (interface == PHY_INTERFACE_MODE_RGMII)
+			phy_interface_set_rgmii(supported);
+		else
+			__set_bit(interface, supported);
+		if (default_interface)
+			*default_interface = interface;
+	}
 }
 
 static void mv88e6250_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
-				       struct phylink_config *config)
+				       struct phylink_config *config,
+				       phy_interface_t *default_interface)
 {
 	unsigned long *supported = config->supported_interfaces;
 
 	/* Translate the default cmode */
-	mv88e6xxx_translate_cmode(chip->ports[port].cmode, supported);
+	mv88e6xxx_translate_cmode(chip->ports[port].cmode, supported,
+				  default_interface);
 
 	config->mac_capabilities = MAC_SYM_PAUSE | MAC_10 | MAC_100;
 }
@@ -676,13 +694,15 @@ static int mv88e6352_get_port4_serdes_cmode(struct mv88e6xxx_chip *chip)
 }
 
 static void mv88e6352_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
-				       struct phylink_config *config)
+				       struct phylink_config *config,
+				       phy_interface_t *default_interface)
 {
 	unsigned long *supported = config->supported_interfaces;
 	int err, cmode;
 
 	/* Translate the default cmode */
-	mv88e6xxx_translate_cmode(chip->ports[port].cmode, supported);
+	mv88e6xxx_translate_cmode(chip->ports[port].cmode, supported,
+				  default_interface);
 
 	config->mac_capabilities = MAC_SYM_PAUSE | MAC_10 | MAC_100 |
 				   MAC_1000FD;
@@ -702,19 +722,21 @@ static void mv88e6352_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
 			dev_err(chip->dev, "p%d: failed to read serdes cmode\n",
 				port);
 		else
-			mv88e6xxx_translate_cmode(cmode, supported);
+			mv88e6xxx_translate_cmode(cmode, supported, NULL);
 unlock:
 		mv88e6xxx_reg_unlock(chip);
 	}
 }
 
 static void mv88e6341_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
-				       struct phylink_config *config)
+				       struct phylink_config *config,
+				       phy_interface_t *default_interface)
 {
 	unsigned long *supported = config->supported_interfaces;
 
 	/* Translate the default cmode */
-	mv88e6xxx_translate_cmode(chip->ports[port].cmode, supported);
+	mv88e6xxx_translate_cmode(chip->ports[port].cmode, supported,
+				  default_interface);
 
 	/* No ethtool bits for 200Mbps */
 	config->mac_capabilities = MAC_SYM_PAUSE | MAC_10 | MAC_100 |
@@ -726,17 +748,21 @@ static void mv88e6341_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
 		__set_bit(PHY_INTERFACE_MODE_1000BASEX, supported);
 		__set_bit(PHY_INTERFACE_MODE_2500BASEX, supported);
 
+		*default_interface = PHY_INTERFACE_MODE_2500BASEX;
+
 		config->mac_capabilities |= MAC_2500FD;
 	}
 }
 
 static void mv88e6390_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
-				       struct phylink_config *config)
+				       struct phylink_config *config,
+				       phy_interface_t *default_interface)
 {
 	unsigned long *supported = config->supported_interfaces;
 
 	/* Translate the default cmode */
-	mv88e6xxx_translate_cmode(chip->ports[port].cmode, supported);
+	mv88e6xxx_translate_cmode(chip->ports[port].cmode, supported,
+				  default_interface);
 
 	/* No ethtool bits for 200Mbps */
 	config->mac_capabilities = MAC_SYM_PAUSE | MAC_10 | MAC_100 |
@@ -748,16 +774,19 @@ static void mv88e6390_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
 		__set_bit(PHY_INTERFACE_MODE_1000BASEX, supported);
 		__set_bit(PHY_INTERFACE_MODE_2500BASEX, supported);
 
+		*default_interface = PHY_INTERFACE_MODE_2500BASEX;
+
 		config->mac_capabilities |= MAC_2500FD;
 	}
 }
 
 static void mv88e6390x_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
-					struct phylink_config *config)
+					struct phylink_config *config,
+					phy_interface_t *default_interface)
 {
 	unsigned long *supported = config->supported_interfaces;
 
-	mv88e6390_phylink_get_caps(chip, port, config);
+	mv88e6390_phylink_get_caps(chip, port, config, default_interface);
 
 	/* For the 6x90X, ports 2-7 can be in automedia mode.
 	 * (Note that 6x90 doesn't support RXAUI nor XAUI).
@@ -783,18 +812,22 @@ static void mv88e6390x_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
 		__set_bit(PHY_INTERFACE_MODE_XAUI, supported);
 		__set_bit(PHY_INTERFACE_MODE_RXAUI, supported);
 
+		*default_interface = PHY_INTERFACE_MODE_XAUI;
+
 		config->mac_capabilities |= MAC_10000FD;
 	}
 }
 
 static void mv88e6393x_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
-					struct phylink_config *config)
+					struct phylink_config *config,
+					phy_interface_t *default_interface)
 {
 	unsigned long *supported = config->supported_interfaces;
 	bool is_6191x =
 		chip->info->prod_num == MV88E6XXX_PORT_SWITCH_ID_PROD_6191X;
 
-	mv88e6xxx_translate_cmode(chip->ports[port].cmode, supported);
+	mv88e6xxx_translate_cmode(chip->ports[port].cmode, supported,
+				  default_interface);
 
 	config->mac_capabilities = MAC_SYM_PAUSE | MAC_10 | MAC_100 |
 				   MAC_1000FD;
@@ -812,6 +845,8 @@ static void mv88e6393x_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
 			/* FIXME: USXGMII is not supported yet */
 			/* __set_bit(PHY_INTERFACE_MODE_USXGMII, supported); */
 
+			*default_interface = PHY_INTERFACE_MODE_10GBASER;
+
 			config->mac_capabilities |= MAC_2500FD | MAC_5000FD |
 				MAC_10000FD;
 		}
@@ -823,8 +858,10 @@ static void mv88e6xxx_get_caps(struct dsa_switch *ds, int port,
 			       phy_interface_t *default_interface)
 {
 	struct mv88e6xxx_chip *chip = ds->priv;
+	u8 cmode = chip->ports[port].cmode;
 
-	chip->info->ops->phylink_get_caps(chip, port, config);
+	chip->info->ops->phylink_get_caps(chip, port, config,
+					  default_interface);
 
 	/* Internal ports need GMII for PHYLIB */
 	if (mv88e6xxx_phy_is_internal(ds, port))
diff --git a/drivers/net/dsa/mv88e6xxx/chip.h b/drivers/net/dsa/mv88e6xxx/chip.h
index e693154cf803..4518c17c1b9b 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.h
+++ b/drivers/net/dsa/mv88e6xxx/chip.h
@@ -643,7 +643,8 @@ struct mv88e6xxx_ops {
 
 	/* Phylink */
 	void (*phylink_get_caps)(struct mv88e6xxx_chip *chip, int port,
-				 struct phylink_config *config);
+				 struct phylink_config *config,
+				 phy_interface_t *default_interface);
 
 	/* Max Frame Size */
 	int (*set_max_frame_size)(struct mv88e6xxx_chip *chip, int mtu);
-- 
2.30.2



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC0DC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 12:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sIKhG6scWWJybOlgoeOzmdOsTe/qdb2X9J3h0ukWoM=; b=uc5C0AiPPFkypdwnBGAfptEbr+
	GlPWpDsfHn9fvaV5zwEPgXOCea/dYEEgX5nWlEwTs4Ru0zGhy7HYTkXyGPD0N8UZC/SYkTd4q/3zW
	oGqjg7Uo8wBwAC1SfG9+IKdlFAGy0gu3dOZxOjIrn4jLZKLdew3QXA+kkPkDqolW+PnitFSDjyxAj
	rUZxN0i9jpEQcfPpBwhRo38TZmjYuioejlI0HZUE0GfQyqMfp9RQUMRtr+qJyC6ILEqXhQwyXFIBi
	1uJ2oPpJf1dwu4FUnD+MCZpPMVA90UJsvkcAjE3khlC8LwkuuhBOrkJhp0dmBrhyrzB7moWjQvYbl
	HSQ4iNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XDE-00Byyw-0X; Wed, 29 Jun 2022 12:54:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XAg-00BxgK-Cy; Wed, 29 Jun 2022 12:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5sIKhG6scWWJybOlgoeOzmdOsTe/qdb2X9J3h0ukWoM=; b=XfwQmATwVQsgB2kcO56SFCuCuz
	Ev6M90XhmSDQOyJVBnF1cqOZcb0FfHn9wfg+aBJAryNmvAQytDH8GYJyt2U2VKH+1ZpN0HvhVJbZJ
	ezqenA0GC5/X0DrJCVY/T6jMOav9nQkGeUjhR0VvIxbUInN0tNFyBc4jQk3Rn8UpYn7fTOa8/Spfw
	4RSMI5TdFmlqGCczZZi1rgRXUBQ8ywOGeVqqo0mZlZ4ew7ksefVCLuvAs50wTAcxHfZjTsixpcps5
	72HNbaf03FqzQdc6iGaJH7QaPs4lMgAC06N6lunOlRfKPdpKu51p4J3YXBjn/fZ7Ah009B34Cqm5T
	d6LVQFWg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35718 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1o6XAW-00037l-3r; Wed, 29 Jun 2022 13:51:44 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1o6XAV-004pW2-Ct; Wed, 29 Jun 2022 13:51:43 +0100
In-Reply-To: <YrxKdVmBzeMsVjsH@shell.armlinux.org.uk>
References: <YrxKdVmBzeMsVjsH@shell.armlinux.org.uk>
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
Subject: [PATCH RFC net-next 5/6] net: dsa: always use phylink for CPU and DSA
 ports
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1o6XAV-004pW2-Ct@rmk-PC.armlinux.org.uk>
Date: Wed, 29 Jun 2022 13:51:43 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_055154_515607_58120D22 
X-CRM114-Status: GOOD (  19.43  )
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

Currently, we only use phylink for CPU and DSA ports if there is a
fixed-link specification, or a PHY specified. The reason for this
behaviour is that when neither is specified, there was no way for
phylink to know the link parameters.

Now that we have phylink_set_max_link_speed() (which has become
possible through the addition of mac_capabilities) we now have the
ability to know the maximum link speed for a specific link, and can
now use phylink for this case as well.

However, we need DSA drivers to report the interface mode being used
on these ports so that we can select a maximum speed appropriate for
the interface mode that hardware may have configured for the port.

This is especially important with the conversion of DSA drivers to
phylink_pcs, as the PCS code only gets called if we are using
phylink for the port.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 41 ++++----------------------------
 net/dsa/port.c                   | 24 ++++++++++---------
 2 files changed, 18 insertions(+), 47 deletions(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 1c6b4b00d58d..e19732782742 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -3287,9 +3287,8 @@ static int mv88e6xxx_setup_port(struct mv88e6xxx_chip *chip, int port)
 {
 	struct device_node *phy_handle = NULL;
 	struct dsa_switch *ds = chip->ds;
-	phy_interface_t mode;
 	struct dsa_port *dp;
-	int tx_amp, speed;
+	int tx_amp;
 	int err;
 	u16 reg;
 
@@ -3298,40 +3297,10 @@ static int mv88e6xxx_setup_port(struct mv88e6xxx_chip *chip, int port)
 
 	dp = dsa_to_port(ds, port);
 
-	/* MAC Forcing register: don't force link, speed, duplex or flow control
-	 * state to any particular values on physical ports, but force the CPU
-	 * port and all DSA ports to their maximum bandwidth and full duplex.
-	 */
-	if (dsa_is_cpu_port(ds, port) || dsa_is_dsa_port(ds, port)) {
-		unsigned long caps = dp->pl_config.mac_capabilities;
-
-		if (chip->info->ops->port_max_speed_mode)
-			mode = chip->info->ops->port_max_speed_mode(port);
-		else
-			mode = PHY_INTERFACE_MODE_NA;
-
-		if (caps & MAC_10000FD)
-			speed = SPEED_10000;
-		else if (caps & MAC_5000FD)
-			speed = SPEED_5000;
-		else if (caps & MAC_2500FD)
-			speed = SPEED_2500;
-		else if (caps & MAC_1000)
-			speed = SPEED_1000;
-		else if (caps & MAC_100)
-			speed = SPEED_100;
-		else
-			speed = SPEED_10;
-
-		err = mv88e6xxx_port_setup_mac(chip, port, LINK_FORCED_UP,
-					       speed, DUPLEX_FULL,
-					       PAUSE_OFF, mode);
-	} else {
-		err = mv88e6xxx_port_setup_mac(chip, port, LINK_UNFORCED,
-					       SPEED_UNFORCED, DUPLEX_UNFORCED,
-					       PAUSE_ON,
-					       PHY_INTERFACE_MODE_NA);
-	}
+	err = mv88e6xxx_port_setup_mac(chip, port, LINK_UNFORCED,
+				       SPEED_UNFORCED, DUPLEX_UNFORCED,
+				       PAUSE_ON,
+				       PHY_INTERFACE_MODE_NA);
 	if (err)
 		return err;
 
diff --git a/net/dsa/port.c b/net/dsa/port.c
index 35b4e1f8dc05..34487e62eb03 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -1525,6 +1525,7 @@ int dsa_port_phylink_create(struct dsa_port *dp)
 {
 	struct dsa_switch *ds = dp->ds;
 	phy_interface_t mode, def_mode;
+	struct device_node *phy_np;
 	int err;
 
 	/* Presence of phylink_mac_link_state or phylink_mac_an_restart is
@@ -1559,6 +1560,13 @@ int dsa_port_phylink_create(struct dsa_port *dp)
 		return PTR_ERR(dp->pl);
 	}
 
+	if (dp->type == DSA_PORT_TYPE_CPU || dp->type == DSA_PORT_TYPE_DSA) {
+		phy_np = of_parse_phandle(dp->dn, "phy-handle", 0);
+		of_node_put(phy_np);
+		if (!phy_np)
+			err = phylink_set_max_fixed_link(dp->pl);
+	}
+
 	return 0;
 }
 
@@ -1663,20 +1671,14 @@ static int dsa_port_phylink_register(struct dsa_port *dp)
 int dsa_port_link_register_of(struct dsa_port *dp)
 {
 	struct dsa_switch *ds = dp->ds;
-	struct device_node *phy_np;
 	int port = dp->index;
 
 	if (!ds->ops->adjust_link) {
-		phy_np = of_parse_phandle(dp->dn, "phy-handle", 0);
-		if (of_phy_is_fixed_link(dp->dn) || phy_np) {
-			if (ds->ops->phylink_mac_link_down)
-				ds->ops->phylink_mac_link_down(ds, port,
-					MLO_AN_FIXED, PHY_INTERFACE_MODE_NA);
-			of_node_put(phy_np);
-			return dsa_port_phylink_register(dp);
-		}
-		of_node_put(phy_np);
-		return 0;
+		if (ds->ops->phylink_mac_link_down)
+			ds->ops->phylink_mac_link_down(ds, port,
+				MLO_AN_FIXED, PHY_INTERFACE_MODE_NA);
+
+		return dsa_port_phylink_register(dp);
 	}
 
 	dev_warn(ds->dev,
-- 
2.30.2



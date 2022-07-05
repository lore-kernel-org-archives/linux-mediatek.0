Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E028EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmwB/w2ODX+PhO2MIYPtuzhbVH60qFtgTIdGIGmVkNU=; b=KzbkcAnsdLrZf9jS8P7eaAAXnJ
	4fPAadNNI9VH0dBCUfLqqZe7bMSBRginwwpXFPS8d0HitVjBD72W4TojtpE+X2ciA2NUk6G6P8Mdg
	U2/JnyZOLw7zb6sCXHRbvXq/T8f6bVGCbmPBAIa2YsGsi76PvReIjymswIVwSjdOQYzxqfG9Px2Id
	CsTz6bY29L8jiipkF9prnD15Oe8M6aKMn4WZJNjLLjs8ch1Zb7ofVWDwfwenf/2bIDGx4iiE1ARzd
	goqUCY6oOWoRt3brFFuPM75NqsJSPt2mzAfCucm22JjOTjohV3R+073AsXs8EH/YIOlHRbehkMqrK
	X6WGJH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fAV-00Gu7A-JF; Tue, 05 Jul 2022 09:48:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fA3-00Gtka-Ou; Tue, 05 Jul 2022 09:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nmwB/w2ODX+PhO2MIYPtuzhbVH60qFtgTIdGIGmVkNU=; b=wB2LAHhppYezNRkU0nsYYKEKPU
	bxr1EWDL17XvtKMLG5aayBuqmxr3jAYxTyOz6ioHxzYCblEQGm3RQ/P7tdsHUIJS0JjyEgpEdsEOu
	qVsZUWxdzyDB7LeROZWc401EA0hhv7nwG/I5jENKLVnP78bb1iUcQQlBQk2AWTCiOdtDyZJlwHmBp
	8emoOMfVL26kBMuLbgad52kkXXG6+mrLJlqzxUHV2D1vz9scBtF2YazodxJjuIyjcwtqCDT8dPZnP
	FvzBXTmyfLa2Y+gJ3jqfBpU1nN73otXlY1t1kh9Une4nIEeLXyIj/LvCS4Fqv19teAHSgSa4V2Pak
	lVvLxWDQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60648 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1o8f9n-000133-Lk; Tue, 05 Jul 2022 10:47:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1o8f9m-0059a0-Ux; Tue, 05 Jul 2022 10:47:47 +0100
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
Subject: [PATCH RFC net-next 1/5] net: dsa: add support for retrieving the
 interface mode
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1o8f9m-0059a0-Ux@rmk-PC.armlinux.org.uk>
Date: Tue, 05 Jul 2022 10:47:46 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_024804_007556_E4C6FD20 
X-CRM114-Status: GOOD (  20.22  )
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

DSA port bindings allow for an optional phy interface mode. When an
interface mode is not specified, DSA uses the NA interface mode type.

However, phylink needs to know the parameters of the link, and this
will become especially important when using phylink for ports that
are devoid of all properties except the required "reg" property, so
that phylink can select the maximum supported link settings. Without
knowing the interface mode, phylink can't truely know the maximum
link speed.

Update the prototype for the phylink_get_caps method to allow drivers
to report this information back to DSA, and update all DSA
implementations function declarations to cater for this change. No
code is added to the implementations.

Reviewed-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/b53/b53_common.c       |  3 ++-
 drivers/net/dsa/bcm_sf2.c              |  3 ++-
 drivers/net/dsa/hirschmann/hellcreek.c |  3 ++-
 drivers/net/dsa/lantiq_gswip.c         |  6 ++++--
 drivers/net/dsa/microchip/ksz_common.c |  3 ++-
 drivers/net/dsa/mt7530.c               |  3 ++-
 drivers/net/dsa/mv88e6xxx/chip.c       |  3 ++-
 drivers/net/dsa/ocelot/felix.c         |  3 ++-
 drivers/net/dsa/qca/ar9331.c           |  3 ++-
 drivers/net/dsa/qca8k.c                |  3 ++-
 drivers/net/dsa/realtek/rtl8365mb.c    |  3 ++-
 drivers/net/dsa/sja1105/sja1105_main.c |  3 ++-
 drivers/net/dsa/xrs700x/xrs700x.c      |  3 ++-
 include/net/dsa.h                      |  3 ++-
 net/dsa/port.c                         | 23 +++++++++++++++++------
 15 files changed, 47 insertions(+), 21 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 48cf344750ff..fe75b84ab791 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1310,7 +1310,8 @@ void b53_port_event(struct dsa_switch *ds, int port)
 EXPORT_SYMBOL(b53_port_event);
 
 static void b53_phylink_get_caps(struct dsa_switch *ds, int port,
-				 struct phylink_config *config)
+				 struct phylink_config *config,
+				 phy_interface_t *default_interface)
 {
 	struct b53_device *dev = ds->priv;
 
diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index be0edfa093d0..18a3847bd82b 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -713,7 +713,8 @@ static u32 bcm_sf2_sw_get_phy_flags(struct dsa_switch *ds, int port)
 }
 
 static void bcm_sf2_sw_get_caps(struct dsa_switch *ds, int port,
-				struct phylink_config *config)
+				struct phylink_config *config,
+				phy_interface_t *default_interface)
 {
 	unsigned long *interfaces = config->supported_interfaces;
 	struct bcm_sf2_priv *priv = bcm_sf2_to_priv(ds);
diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hirschmann/hellcreek.c
index ac1f3b3a7040..ff78f580bb14 100644
--- a/drivers/net/dsa/hirschmann/hellcreek.c
+++ b/drivers/net/dsa/hirschmann/hellcreek.c
@@ -1462,7 +1462,8 @@ static void hellcreek_teardown(struct dsa_switch *ds)
 }
 
 static void hellcreek_phylink_get_caps(struct dsa_switch *ds, int port,
-				       struct phylink_config *config)
+				       struct phylink_config *config,
+				       phy_interface_t *default_interface)
 {
 	struct hellcreek *hellcreek = ds->priv;
 
diff --git a/drivers/net/dsa/lantiq_gswip.c b/drivers/net/dsa/lantiq_gswip.c
index e531b93f3cb2..a43dabfa5453 100644
--- a/drivers/net/dsa/lantiq_gswip.c
+++ b/drivers/net/dsa/lantiq_gswip.c
@@ -1492,7 +1492,8 @@ static int gswip_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 }
 
 static void gswip_xrx200_phylink_get_caps(struct dsa_switch *ds, int port,
-					  struct phylink_config *config)
+					  struct phylink_config *config,
+					  phy_interface_t *default_interface)
 {
 	switch (port) {
 	case 0:
@@ -1525,7 +1526,8 @@ static void gswip_xrx200_phylink_get_caps(struct dsa_switch *ds, int port,
 }
 
 static void gswip_xrx300_phylink_get_caps(struct dsa_switch *ds, int port,
-					  struct phylink_config *config)
+					  struct phylink_config *config,
+					  phy_interface_t *default_interface)
 {
 	switch (port) {
 	case 0:
diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
index 28d7cb2ce98f..4329e29a1695 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -721,7 +721,8 @@ static int ksz_check_device_id(struct ksz_device *dev)
 }
 
 static void ksz_phylink_get_caps(struct dsa_switch *ds, int port,
-				 struct phylink_config *config)
+				 struct phylink_config *config,
+				 phy_interface_t *default_interface)
 {
 	struct ksz_device *dev = ds->priv;
 
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 835807911be0..dab308e454e3 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2914,7 +2914,8 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
 }
 
 static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
-				    struct phylink_config *config)
+				    struct phylink_config *config,
+				    phy_interface_t *default_interface)
 {
 	struct mt7530_priv *priv = ds->priv;
 
diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 37b649501500..f98be98551ef 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -819,7 +819,8 @@ static void mv88e6393x_phylink_get_caps(struct mv88e6xxx_chip *chip, int port,
 }
 
 static void mv88e6xxx_get_caps(struct dsa_switch *ds, int port,
-			       struct phylink_config *config)
+			       struct phylink_config *config,
+			       phy_interface_t *default_interface)
 {
 	struct mv88e6xxx_chip *chip = ds->priv;
 
diff --git a/drivers/net/dsa/ocelot/felix.c b/drivers/net/dsa/ocelot/felix.c
index 859196898a7d..0c1ac902b110 100644
--- a/drivers/net/dsa/ocelot/felix.c
+++ b/drivers/net/dsa/ocelot/felix.c
@@ -937,7 +937,8 @@ static int felix_vlan_del(struct dsa_switch *ds, int port,
 }
 
 static void felix_phylink_get_caps(struct dsa_switch *ds, int port,
-				   struct phylink_config *config)
+				   struct phylink_config *config,
+				   phy_interface_t *default_interface)
 {
 	struct ocelot *ocelot = ds->priv;
 
diff --git a/drivers/net/dsa/qca/ar9331.c b/drivers/net/dsa/qca/ar9331.c
index 0796b7cf8cae..19e95dabe5b9 100644
--- a/drivers/net/dsa/qca/ar9331.c
+++ b/drivers/net/dsa/qca/ar9331.c
@@ -501,7 +501,8 @@ static enum dsa_tag_protocol ar9331_sw_get_tag_protocol(struct dsa_switch *ds,
 }
 
 static void ar9331_sw_phylink_get_caps(struct dsa_switch *ds, int port,
-				       struct phylink_config *config)
+				       struct phylink_config *config,
+				       phy_interface_t *default_interface)
 {
 	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100;
diff --git a/drivers/net/dsa/qca8k.c b/drivers/net/dsa/qca8k.c
index 1cbb05b0323f..beccd8338c81 100644
--- a/drivers/net/dsa/qca8k.c
+++ b/drivers/net/dsa/qca8k.c
@@ -1749,7 +1749,8 @@ qca8k_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 }
 
 static void qca8k_phylink_get_caps(struct dsa_switch *ds, int port,
-				   struct phylink_config *config)
+				   struct phylink_config *config,
+				   phy_interface_t *default_interface)
 {
 	switch (port) {
 	case 0: /* 1st CPU port */
diff --git a/drivers/net/dsa/realtek/rtl8365mb.c b/drivers/net/dsa/realtek/rtl8365mb.c
index da31d8b839ac..7bf420c2b083 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.c
+++ b/drivers/net/dsa/realtek/rtl8365mb.c
@@ -1024,7 +1024,8 @@ static int rtl8365mb_ext_config_forcemode(struct realtek_priv *priv, int port,
 }
 
 static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
-				       struct phylink_config *config)
+				       struct phylink_config *config,
+				       phy_interface_t *default_interface)
 {
 	const struct rtl8365mb_extint *extint =
 		rtl8365mb_get_port_extint(ds->priv, port);
diff --git a/drivers/net/dsa/sja1105/sja1105_main.c b/drivers/net/dsa/sja1105/sja1105_main.c
index b253e27bcfb4..e15033177643 100644
--- a/drivers/net/dsa/sja1105/sja1105_main.c
+++ b/drivers/net/dsa/sja1105/sja1105_main.c
@@ -1390,7 +1390,8 @@ static void sja1105_mac_link_up(struct dsa_switch *ds, int port,
 }
 
 static void sja1105_phylink_get_caps(struct dsa_switch *ds, int port,
-				     struct phylink_config *config)
+				     struct phylink_config *config,
+				     phy_interface_t *default_interface)
 {
 	struct sja1105_private *priv = ds->priv;
 	struct sja1105_xmii_params_entry *mii;
diff --git a/drivers/net/dsa/xrs700x/xrs700x.c b/drivers/net/dsa/xrs700x/xrs700x.c
index 3887ed33c5fe..214a1dd670c2 100644
--- a/drivers/net/dsa/xrs700x/xrs700x.c
+++ b/drivers/net/dsa/xrs700x/xrs700x.c
@@ -443,7 +443,8 @@ static void xrs700x_teardown(struct dsa_switch *ds)
 }
 
 static void xrs700x_phylink_get_caps(struct dsa_switch *ds, int port,
-				     struct phylink_config *config)
+				     struct phylink_config *config,
+				     phy_interface_t *default_interface)
 {
 	switch (port) {
 	case 0:
diff --git a/include/net/dsa.h b/include/net/dsa.h
index b902b31bebce..7c6870d2c607 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -852,7 +852,8 @@ struct dsa_switch_ops {
 	 * PHYLINK integration
 	 */
 	void	(*phylink_get_caps)(struct dsa_switch *ds, int port,
-				    struct phylink_config *config);
+				    struct phylink_config *config,
+				    phy_interface_t *default_interface);
 	void	(*phylink_validate)(struct dsa_switch *ds, int port,
 				    unsigned long *supported,
 				    struct phylink_link_state *state);
diff --git a/net/dsa/port.c b/net/dsa/port.c
index 3738f2d40a0b..35b4e1f8dc05 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -1524,13 +1524,9 @@ static const struct phylink_mac_ops dsa_port_phylink_mac_ops = {
 int dsa_port_phylink_create(struct dsa_port *dp)
 {
 	struct dsa_switch *ds = dp->ds;
-	phy_interface_t mode;
+	phy_interface_t mode, def_mode;
 	int err;
 
-	err = of_get_phy_mode(dp->dn, &mode);
-	if (err)
-		mode = PHY_INTERFACE_MODE_NA;
-
 	/* Presence of phylink_mac_link_state or phylink_mac_an_restart is
 	 * an indicator of a legacy phylink driver.
 	 */
@@ -1538,8 +1534,23 @@ int dsa_port_phylink_create(struct dsa_port *dp)
 	    ds->ops->phylink_mac_an_restart)
 		dp->pl_config.legacy_pre_march2020 = true;
 
+	def_mode = PHY_INTERFACE_MODE_NA;
 	if (ds->ops->phylink_get_caps)
-		ds->ops->phylink_get_caps(ds, dp->index, &dp->pl_config);
+		ds->ops->phylink_get_caps(ds, dp->index, &dp->pl_config,
+					  &def_mode);
+
+	err = of_get_phy_mode(dp->dn, &mode);
+	if (err) {
+		/* We must not set the default mode for user ports as a PHY
+		 * overrides the NA mode in phylink. Setting it here would
+		 * prevent the interface mode being updated.
+		 */
+		if (dp->type == DSA_PORT_TYPE_CPU ||
+		    dp->type == DSA_PORT_TYPE_DSA)
+			mode = def_mode;
+		else
+			mode = PHY_INTERFACE_MODE_NA;
+	}
 
 	dp->pl = phylink_create(&dp->pl_config, of_fwnode_handle(dp->dn),
 				mode, &dsa_port_phylink_mac_ops);
-- 
2.30.2



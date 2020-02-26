Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD4FC4BA0E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:28:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D96720801
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qrXSTRTd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KwFjuNlX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D96720801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:To
	:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFZD16GNZIdzlq7Bjs2Yo40a41nDsgVL+5QTcNvpu6c=; b=qrXSTRTdKIrLYV
	P1M81pA+scarkbchf0s0M7P2k02/dCFvWhjjqPYERlMI9zRQDCVMhv/Ah/q7budvH+oLPQ270ew/h
	IjSzSm21EIuPjU0nT8vsZ2F8GAKpMsN1095JvWAapgSJCPaiasU98x1ByZ4pWuXojN/37i4KrW8IC
	IECQFJ1u47Afo+0YPyylL1rdTnJB+1LsHYLE04Xjbp7a0mtyuS9cuhMvS7D5UW1QSdkX+ySB26Fav
	d5Ur46cSKpHCHHprvD/cqAZfOWZmXWUbL7sJWrEpZDXDGPsOJMW68avhgdk4/wEH8DIafuW6eCMcE
	dW+u1dJtIbFzCi7V/7aQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6tvB-0008Vv-CK; Wed, 26 Feb 2020 10:28:05 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6tuT-0005lQ-V5; Wed, 26 Feb 2020 10:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WVh0mDVT0AvsCjEpMsfO+46CCwapyPskyupNXD+4oCk=; b=KwFjuNlX1r6MSLvzeVuvG1VmdS
 8Dj86xVKZepumA1pFLx3C78L0vNnrHePa+5l/vWSkeYSaEmU6Ep2xxK4N0/ZvlMATNLeLKjCZfz4O
 jrdwOONql4hwX8nEtRwxUc4xybD4PlzW8PCYNUcJUDgpL/Y/VrS+fUSH+2UUd7TsIpmka2dZb9hZm
 kmcEJWb9XIngwP2FzzOJWRWgLMNX92k7k7vLs5yqu3WpeBtef5tuv0OFBf91ixMpZZGHkMM3XXgq/
 LSSkGVmBV1UpBmmnwdTJDJbtw1cvzhRSCW2YK2rgwruOa6HTh3t7wHstqbeARVefcxdXyZmtrZgQU
 S1sug/mw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41402 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6tr2-0006rj-G8; Wed, 26 Feb 2020 10:23:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6tr0-0003GE-FT; Wed, 26 Feb 2020 10:23:46 +0000
In-Reply-To: <20200226102312.GX25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 2/8] net: dsa: propagate resolved link config via
 mac_link_up()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1j6tr0-0003GE-FT@rmk-PC.armlinux.org.uk>
Date: Wed, 26 Feb 2020 10:23:46 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_022722_291177_EC97A055 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-doc@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Propagate the resolved link configuration down via DSA's
phylink_mac_link_up() operation to allow split PCS/MAC to work.

Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/b53/b53_common.c       | 4 +++-
 drivers/net/dsa/b53/b53_priv.h         | 4 +++-
 drivers/net/dsa/bcm_sf2.c              | 4 +++-
 drivers/net/dsa/lantiq_gswip.c         | 4 +++-
 drivers/net/dsa/mt7530.c               | 4 +++-
 drivers/net/dsa/mv88e6xxx/chip.c       | 4 +++-
 drivers/net/dsa/ocelot/felix.c         | 4 +++-
 drivers/net/dsa/qca/ar9331.c           | 4 +++-
 drivers/net/dsa/sja1105/sja1105_main.c | 4 +++-
 include/net/dsa.h                      | 4 +++-
 net/dsa/port.c                         | 3 ++-
 11 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 1a69286daa8d..ceafce446317 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1289,7 +1289,9 @@ EXPORT_SYMBOL(b53_phylink_mac_link_down);
 void b53_phylink_mac_link_up(struct dsa_switch *ds, int port,
 			     unsigned int mode,
 			     phy_interface_t interface,
-			     struct phy_device *phydev)
+			     struct phy_device *phydev,
+			     int speed, int duplex,
+			     bool tx_pause, bool rx_pause)
 {
 	struct b53_device *dev = ds->priv;
 
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index 3c30f3a7eb29..3d42318bc3f1 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -338,7 +338,9 @@ void b53_phylink_mac_link_down(struct dsa_switch *ds, int port,
 void b53_phylink_mac_link_up(struct dsa_switch *ds, int port,
 			     unsigned int mode,
 			     phy_interface_t interface,
-			     struct phy_device *phydev);
+			     struct phy_device *phydev,
+			     int speed, int duplex,
+			     bool tx_pause, bool rx_pause);
 int b53_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering);
 int b53_vlan_prepare(struct dsa_switch *ds, int port,
 		     const struct switchdev_obj_port_vlan *vlan);
diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 6feaf8cb0809..a1110133dadf 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -652,7 +652,9 @@ static void bcm_sf2_sw_mac_link_down(struct dsa_switch *ds, int port,
 static void bcm_sf2_sw_mac_link_up(struct dsa_switch *ds, int port,
 				   unsigned int mode,
 				   phy_interface_t interface,
-				   struct phy_device *phydev)
+				   struct phy_device *phydev,
+				   int speed, int duplex,
+				   bool tx_pause, bool rx_pause)
 {
 	struct bcm_sf2_priv *priv = bcm_sf2_to_priv(ds);
 	struct ethtool_eee *p = &priv->dev->ports[port].eee;
diff --git a/drivers/net/dsa/lantiq_gswip.c b/drivers/net/dsa/lantiq_gswip.c
index 0369c22fe3e1..cf6fa8fede33 100644
--- a/drivers/net/dsa/lantiq_gswip.c
+++ b/drivers/net/dsa/lantiq_gswip.c
@@ -1517,7 +1517,9 @@ static void gswip_phylink_mac_link_down(struct dsa_switch *ds, int port,
 static void gswip_phylink_mac_link_up(struct dsa_switch *ds, int port,
 				      unsigned int mode,
 				      phy_interface_t interface,
-				      struct phy_device *phydev)
+				      struct phy_device *phydev,
+				      int speed, int duplex,
+				      bool tx_pause, bool rx_pause)
 {
 	struct gswip_priv *priv = ds->priv;
 
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 022466ca1c19..86818ab3bb07 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1482,7 +1482,9 @@ static void mt7530_phylink_mac_link_down(struct dsa_switch *ds, int port,
 static void mt7530_phylink_mac_link_up(struct dsa_switch *ds, int port,
 				       unsigned int mode,
 				       phy_interface_t interface,
-				       struct phy_device *phydev)
+				       struct phy_device *phydev,
+				       int speed, int duplex,
+				       bool tx_pause, bool rx_pause)
 {
 	struct mt7530_priv *priv = ds->priv;
 
diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 4ec09cc8dcdc..fef3b5e0b291 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -655,7 +655,9 @@ static void mv88e6xxx_mac_link_down(struct dsa_switch *ds, int port,
 
 static void mv88e6xxx_mac_link_up(struct dsa_switch *ds, int port,
 				  unsigned int mode, phy_interface_t interface,
-				  struct phy_device *phydev)
+				  struct phy_device *phydev,
+				  int speed, int duplex,
+				  bool tx_pause, bool rx_pause)
 {
 	if (mode == MLO_AN_FIXED)
 		mv88e6xxx_mac_link_force(ds, port, LINK_FORCED_UP);
diff --git a/drivers/net/dsa/ocelot/felix.c b/drivers/net/dsa/ocelot/felix.c
index 35124ef7e75b..7e66821b05b4 100644
--- a/drivers/net/dsa/ocelot/felix.c
+++ b/drivers/net/dsa/ocelot/felix.c
@@ -263,7 +263,9 @@ static void felix_phylink_mac_link_down(struct dsa_switch *ds, int port,
 static void felix_phylink_mac_link_up(struct dsa_switch *ds, int port,
 				      unsigned int link_an_mode,
 				      phy_interface_t interface,
-				      struct phy_device *phydev)
+				      struct phy_device *phydev,
+				      int speed, int duplex,
+				      bool tx_pause, bool rx_pause)
 {
 	struct ocelot *ocelot = ds->priv;
 	struct ocelot_port *ocelot_port = ocelot->ports[port];
diff --git a/drivers/net/dsa/qca/ar9331.c b/drivers/net/dsa/qca/ar9331.c
index de25f99e995a..7c86056b9401 100644
--- a/drivers/net/dsa/qca/ar9331.c
+++ b/drivers/net/dsa/qca/ar9331.c
@@ -458,7 +458,9 @@ static void ar9331_sw_phylink_mac_link_down(struct dsa_switch *ds, int port,
 static void ar9331_sw_phylink_mac_link_up(struct dsa_switch *ds, int port,
 					  unsigned int mode,
 					  phy_interface_t interface,
-					  struct phy_device *phydev)
+					  struct phy_device *phydev,
+					  int speed, int duplex,
+					  bool tx_pause, bool rx_pause)
 {
 	struct ar9331_sw_priv *priv = (struct ar9331_sw_priv *)ds->priv;
 	struct regmap *regmap = priv->regmap;
diff --git a/drivers/net/dsa/sja1105/sja1105_main.c b/drivers/net/dsa/sja1105/sja1105_main.c
index 03ba6d25f7fe..c27cc7b37440 100644
--- a/drivers/net/dsa/sja1105/sja1105_main.c
+++ b/drivers/net/dsa/sja1105/sja1105_main.c
@@ -786,7 +786,9 @@ static void sja1105_mac_link_down(struct dsa_switch *ds, int port,
 static void sja1105_mac_link_up(struct dsa_switch *ds, int port,
 				unsigned int mode,
 				phy_interface_t interface,
-				struct phy_device *phydev)
+				struct phy_device *phydev,
+				int speed, int duplex,
+				bool tx_pause, bool rx_pause)
 {
 	sja1105_inhibit_tx(ds->priv, BIT(port), false);
 }
diff --git a/include/net/dsa.h b/include/net/dsa.h
index 63495e3443ac..7d3d84f0ef42 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -420,7 +420,9 @@ struct dsa_switch_ops {
 	void	(*phylink_mac_link_up)(struct dsa_switch *ds, int port,
 				       unsigned int mode,
 				       phy_interface_t interface,
-				       struct phy_device *phydev);
+				       struct phy_device *phydev,
+				       int speed, int duplex,
+				       bool tx_pause, bool rx_pause);
 	void	(*phylink_fixed_state)(struct dsa_switch *ds, int port,
 				       struct phylink_link_state *state);
 	/*
diff --git a/net/dsa/port.c b/net/dsa/port.c
index b2f5262b35cf..d4450a454249 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -504,7 +504,8 @@ static void dsa_port_phylink_mac_link_up(struct phylink_config *config,
 		return;
 	}
 
-	ds->ops->phylink_mac_link_up(ds, dp->index, mode, interface, phydev);
+	ds->ops->phylink_mac_link_up(ds, dp->index, mode, interface, phydev,
+				     speed, duplex, tx_pause, rx_pause);
 }
 
 const struct phylink_mac_ops dsa_port_phylink_mac_ops = {
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38418C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 23:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvah4gb6JfTRtcNM4GdmgGrH5+DJzSKUpsj4la1NmEU=; b=aN2hK+P6F0f1W/veeJsvHseL+I
	IFrQ0RCJJZVvyl4v3ujzHxDy2HO0fRaDHY3bnf5ZZaodMW7kc43UJkik5cHF8TQ+JV87HA5bd8ZWY
	wuiPuefJpOAMnsvKRImsPR0qxinJYFv0SK2nLCH28W5W9cwTKMHAszVqHnq4G44j2/L6/RZl7klha
	LUhmfzBOE7Vb1+JK7sfL2hYdxPkIWATPdnyeaaqh1a/hYwwKofqAP8ZVHiWEQBxZHnqwN8/EpOos9
	+JfxPQpbpkQMHGT+4RK/Qc8E2IfqUleK53kOoiJ74NRQZJv6H0x5yzz6+h5IwtB+J/TAU1lneWsVd
	mvkNRAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAJLJ-00HEuZ-2o; Tue, 27 Dec 2022 23:26:45 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAJ2l-00H6Wa-Rk; Tue, 27 Dec 2022 23:07:41 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 29B3416EC;
	Wed, 28 Dec 2022 00:07:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1672182450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zvah4gb6JfTRtcNM4GdmgGrH5+DJzSKUpsj4la1NmEU=;
	b=ezK3oi5PsWw9mo7Kayb5ARon1mvRK8YVrerHWdZdYutNd0UzVf7kBsxHzv7y3X/9azeFhk
	fg1UMFh8s5lBnWUpNtIXozB2f5qriHnKa1etKEnY1H6Na5wA1I2eZiRINewxrIQMxZ238o
	2xFnUTYEq09X4sbX+z497DmSJKg2uDbTQfiKeFOAY7rXoth3JyMeZ0sOYwjSUr20/b34W0
	j5wEFNvdy2+UJAC3GL1+69cT1D1dKZ7TSpQUFUs0Ef3PaHc6gaea6EZr/QOgxWjy7kbp/C
	Llg7dVNcgrycHoUrEZCVqBc8pKcar3HhoaxF3cRkf2xrRfmhDtGonux+5JQsiQ==
From: Michael Walle <michael@walle.cc>
Date: Wed, 28 Dec 2022 00:07:27 +0100
Subject: [PATCH RFC net-next v2 11/12] net: dsa: Separate C22 and C45 MDIO bus
 transaction methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221227-v6-2-rc1-c45-seperation-v2-11-ddb37710e5a7@walle.cc>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <michael@walle.cc>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_150736_389064_31F12902 
X-CRM114-Status: GOOD (  18.39  )
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

From: Andrew Lunn <andrew@lunn.ch>

By adding _c45 function pointers to the dsa_switch_op structure, the
dsa core can register an MDIO bus with C45 accessors.

The dsa-loop driver could in theory provide such accessors, since it
just passed requests to the MDIO bus it is on, but it seems unlikely
to be useful at the moment. It can however be added later.

mt7530 does support C45, but its uses a mix of registering its MDIO
bus and using the DSA core provided bus. This makes the change a bit
more complex.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
v2:
 - [al] Remove conditional c45, since all switches support c45
 - [al] Remove dsa core changes, they are not needed
 - [al] Add comment that DSA provided MDIO bus is C22 only.
---
 drivers/net/dsa/mt7530.c | 87 ++++++++++++++++++++++++------------------------
 drivers/net/dsa/mt7530.h | 15 ++++++---
 include/net/dsa.h        |  2 +-
 3 files changed, 56 insertions(+), 48 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 908fa89444c9..616b21c90d05 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -608,17 +608,29 @@ mt7530_mib_reset(struct dsa_switch *ds)
 	mt7530_write(priv, MT7530_MIB_CCR, CCR_MIB_ACTIVATE);
 }
 
-static int mt7530_phy_read(struct mt7530_priv *priv, int port, int regnum)
+static int mt7530_phy_read_c22(struct mt7530_priv *priv, int port, int regnum)
 {
 	return mdiobus_read_nested(priv->bus, port, regnum);
 }
 
-static int mt7530_phy_write(struct mt7530_priv *priv, int port, int regnum,
-			    u16 val)
+static int mt7530_phy_write_c22(struct mt7530_priv *priv, int port, int regnum,
+				u16 val)
 {
 	return mdiobus_write_nested(priv->bus, port, regnum, val);
 }
 
+static int mt7530_phy_read_c45(struct mt7530_priv *priv, int port,
+			       int devad, int regnum)
+{
+	return mdiobus_c45_read_nested(priv->bus, port, devad, regnum);
+}
+
+static int mt7530_phy_write_c45(struct mt7530_priv *priv, int port, int devad,
+				int regnum, u16 val)
+{
+	return mdiobus_c45_write_nested(priv->bus, port, devad, regnum, val);
+}
+
 static int
 mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 			int regnum)
@@ -670,7 +682,7 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int port, int devad,
 
 static int
 mt7531_ind_c45_phy_write(struct mt7530_priv *priv, int port, int devad,
-			 int regnum, u32 data)
+			 int regnum, u16 data)
 {
 	struct mii_bus *bus = priv->bus;
 	struct mt7530_dummy_poll p;
@@ -793,55 +805,36 @@ mt7531_ind_c22_phy_write(struct mt7530_priv *priv, int port, int regnum,
 }
 
 static int
-mt7531_ind_phy_read(struct mt7530_priv *priv, int port, int regnum)
+mt753x_phy_read_c22(struct mii_bus *bus, int port, int regnum)
 {
-	int devad;
-	int ret;
-
-	if (regnum & MII_ADDR_C45) {
-		devad = (regnum >> MII_DEVADDR_C45_SHIFT) & 0x1f;
-		ret = mt7531_ind_c45_phy_read(priv, port, devad,
-					      regnum & MII_REGADDR_C45_MASK);
-	} else {
-		ret = mt7531_ind_c22_phy_read(priv, port, regnum);
-	}
+	struct mt7530_priv *priv = bus->priv;
 
-	return ret;
+	return priv->info->phy_read_c22(priv, port, regnum);
 }
 
 static int
-mt7531_ind_phy_write(struct mt7530_priv *priv, int port, int regnum,
-		     u16 data)
+mt753x_phy_read_c45(struct mii_bus *bus, int port, int devad, int regnum)
 {
-	int devad;
-	int ret;
-
-	if (regnum & MII_ADDR_C45) {
-		devad = (regnum >> MII_DEVADDR_C45_SHIFT) & 0x1f;
-		ret = mt7531_ind_c45_phy_write(priv, port, devad,
-					       regnum & MII_REGADDR_C45_MASK,
-					       data);
-	} else {
-		ret = mt7531_ind_c22_phy_write(priv, port, regnum, data);
-	}
+	struct mt7530_priv *priv = bus->priv;
 
-	return ret;
+	return priv->info->phy_read_c45(priv, port, devad, regnum);
 }
 
 static int
-mt753x_phy_read(struct mii_bus *bus, int port, int regnum)
+mt753x_phy_write_c22(struct mii_bus *bus, int port, int regnum, u16 val)
 {
 	struct mt7530_priv *priv = bus->priv;
 
-	return priv->info->phy_read(priv, port, regnum);
+	return priv->info->phy_write_c22(priv, port, regnum, val);
 }
 
 static int
-mt753x_phy_write(struct mii_bus *bus, int port, int regnum, u16 val)
+mt753x_phy_write_c45(struct mii_bus *bus, int port, int devad, int regnum,
+		     u16 val)
 {
 	struct mt7530_priv *priv = bus->priv;
 
-	return priv->info->phy_write(priv, port, regnum, val);
+	return priv->info->phy_write_c45(priv, port, devad, regnum, val);
 }
 
 static void
@@ -2086,8 +2079,10 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
 	bus->priv = priv;
 	bus->name = KBUILD_MODNAME "-mii";
 	snprintf(bus->id, MII_BUS_ID_SIZE, KBUILD_MODNAME "-%d", idx++);
-	bus->read = mt753x_phy_read;
-	bus->write = mt753x_phy_write;
+	bus->read = mt753x_phy_read_c22;
+	bus->write = mt753x_phy_write_c22;
+	bus->read_c45 = mt753x_phy_read_c45;
+	bus->write_c45 = mt753x_phy_write_c45;
 	bus->parent = dev;
 	bus->phy_mask = ~ds->phys_mii_mask;
 
@@ -3182,8 +3177,10 @@ static const struct mt753x_info mt753x_table[] = {
 		.id = ID_MT7621,
 		.pcs_ops = &mt7530_pcs_ops,
 		.sw_setup = mt7530_setup,
-		.phy_read = mt7530_phy_read,
-		.phy_write = mt7530_phy_write,
+		.phy_read_c22 = mt7530_phy_read_c22,
+		.phy_write_c22 = mt7530_phy_write_c22,
+		.phy_read_c45 = mt7530_phy_read_c45,
+		.phy_write_c45 = mt7530_phy_write_c45,
 		.pad_setup = mt7530_pad_clk_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
 		.mac_port_config = mt7530_mac_config,
@@ -3192,8 +3189,10 @@ static const struct mt753x_info mt753x_table[] = {
 		.id = ID_MT7530,
 		.pcs_ops = &mt7530_pcs_ops,
 		.sw_setup = mt7530_setup,
-		.phy_read = mt7530_phy_read,
-		.phy_write = mt7530_phy_write,
+		.phy_read_c22 = mt7530_phy_read_c22,
+		.phy_write_c22 = mt7530_phy_write_c22,
+		.phy_read_c45 = mt7530_phy_read_c45,
+		.phy_write_c45 = mt7530_phy_write_c45,
 		.pad_setup = mt7530_pad_clk_setup,
 		.mac_port_get_caps = mt7530_mac_port_get_caps,
 		.mac_port_config = mt7530_mac_config,
@@ -3202,8 +3201,10 @@ static const struct mt753x_info mt753x_table[] = {
 		.id = ID_MT7531,
 		.pcs_ops = &mt7531_pcs_ops,
 		.sw_setup = mt7531_setup,
-		.phy_read = mt7531_ind_phy_read,
-		.phy_write = mt7531_ind_phy_write,
+		.phy_read_c22 = mt7531_ind_c22_phy_read,
+		.phy_write_c22 = mt7531_ind_c22_phy_write,
+		.phy_read_c45 = mt7531_ind_c45_phy_read,
+		.phy_write_c45 = mt7531_ind_c45_phy_write,
 		.pad_setup = mt7531_pad_setup,
 		.cpu_port_config = mt7531_cpu_port_config,
 		.mac_port_get_caps = mt7531_mac_port_get_caps,
@@ -3263,7 +3264,7 @@ mt7530_probe(struct mdio_device *mdiodev)
 	 * properly.
 	 */
 	if (!priv->info->sw_setup || !priv->info->pad_setup ||
-	    !priv->info->phy_read || !priv->info->phy_write ||
+	    !priv->info->phy_read_c22 || !priv->info->phy_write_c22 ||
 	    !priv->info->mac_port_get_caps ||
 	    !priv->info->mac_port_config)
 		return -EINVAL;
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index e8d966435350..6b2fc6290ea8 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -750,8 +750,10 @@ struct mt753x_pcs {
 /* struct mt753x_info -	This is the main data structure for holding the specific
  *			part for each supported device
  * @sw_setup:		Holding the handler to a device initialization
- * @phy_read:		Holding the way reading PHY port
- * @phy_write:		Holding the way writing PHY port
+ * @phy_read_c22:	Holding the way reading PHY port using C22
+ * @phy_write_c22:	Holding the way writing PHY port using C22
+ * @phy_read_c45:	Holding the way reading PHY port using C45
+ * @phy_write_c45:	Holding the way writing PHY port using C45
  * @pad_setup:		Holding the way setting up the bus pad for a certain
  *			MAC port
  * @phy_mode_supported:	Check if the PHY type is being supported on a certain
@@ -767,8 +769,13 @@ struct mt753x_info {
 	const struct phylink_pcs_ops *pcs_ops;
 
 	int (*sw_setup)(struct dsa_switch *ds);
-	int (*phy_read)(struct mt7530_priv *priv, int port, int regnum);
-	int (*phy_write)(struct mt7530_priv *priv, int port, int regnum, u16 val);
+	int (*phy_read_c22)(struct mt7530_priv *priv, int port, int regnum);
+	int (*phy_write_c22)(struct mt7530_priv *priv, int port, int regnum,
+			     u16 val);
+	int (*phy_read_c45)(struct mt7530_priv *priv, int port, int devad,
+			    int regnum);
+	int (*phy_write_c45)(struct mt7530_priv *priv, int port, int devad,
+			     int regnum, u16 val);
 	int (*pad_setup)(struct dsa_switch *ds, phy_interface_t interface);
 	int (*cpu_port_config)(struct dsa_switch *ds, int port);
 	void (*mac_port_get_caps)(struct dsa_switch *ds, int port,
diff --git a/include/net/dsa.h b/include/net/dsa.h
index 96086289aa9b..732c7bc261a9 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -858,7 +858,7 @@ struct dsa_switch_ops {
 	u32	(*get_phy_flags)(struct dsa_switch *ds, int port);
 
 	/*
-	 * Access to the switch's PHY registers.
+	 * Access to the switch's PHY registers. C22 only.
 	 */
 	int	(*phy_read)(struct dsa_switch *ds, int port, int regnum);
 	int	(*phy_write)(struct dsa_switch *ds, int port,

-- 
2.30.2


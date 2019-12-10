Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E21C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 08:15:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20F4B20663
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 08:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GP5X0/Os";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UJ5NATux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20F4B20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJ83F0TJukoqemHHG1VSRfKZlbR1Kl0vDlgVUzuSgwU=; b=GP5X0/OsoVI+Tq
	A1Ngv9cE2+H/XIFGCNXH2I53lN9+1lIya7jp2wQyVNzDvxT+kN0T40IDLU9wcvP+Z6wD2bPthlxSd
	CXum6CE6CbM19zYXqBwhDFhWx1uSd6in7Di/A/MSwqBvuSyPHHKIywd+1zUQXB9+sntfY52gFJUMK
	5aaZRfKiZ4OTyhrp7WkzreSsF37jeK4cls1ExKGirKFHoyyuWc291/CXK6hALIJmeiMgGQ4Z97sO0
	6qzNBLFa4uRUj2WsxpYcXHABt7B0xoQN1gZvYfBdwH4+b3ro5StKNPDqC5r+xrjUjolazEibihSiN
	t45ROsevGxpjqGU+G5Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieafc-0000Bc-NR; Tue, 10 Dec 2019 08:15:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieafV-0008U4-3T
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 08:14:55 +0000
X-UUID: ecc1e2f264e3470299b06e429cc8ae24-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=c2C/fEHYw/8uqadmiP2m2xa2hsUpAd52urXVJTPlYck=; 
 b=UJ5NATuxMtqHln5i6BTpWiLnxGKgWvp4DpRsKVO2xdnz2cJaT4XL8F/T5fK3CTF4nAai0EKPAcqp+rr8eCLq7uURJv5e5h+ZIzKLSAB4zgnchXesQLo0uFS8vs5w2yp49j6bez1z3v/uN+1+Lpq0uYid9awCqzvbnovrooEysu4=;
X-UUID: ecc1e2f264e3470299b06e429cc8ae24-20191210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 453972721; Tue, 10 Dec 2019 00:14:48 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 00:15:02 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 16:14:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 10 Dec 2019 16:14:26 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <vivien.didelot@savoirfairelinux.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Subject: [PATCH net-next 2/6] net: dsa: mt7530: Extend device data ready for
 adding a new hardware
Date: Tue, 10 Dec 2019 16:14:38 +0800
Message-ID: <2d546d6bb15ff8b4b75af2220e20db4e634f4145.1575914275.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1575914275.git.landen.chao@mediatek.com>
References: <cover.1575914275.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_001453_189137_E4EE9CF9 
X-CRM114-Status: GOOD (  14.88  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <landen.chao@mediatek.com>,
 frank-w@public-files.de, netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a structure holding required operations for each device such as device
initialization, PHY port read or write, a checker whether PHY interface is
supported on a certain port, MAC port setup for either bus pad or a
specific PHY interface.

The patch is done for ready adding a new hardware MT7531.

Signed-off-by: Landen Chao <landen.chao@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/dsa/mt7530.c | 231 +++++++++++++++++++++++++++++----------
 drivers/net/dsa/mt7530.h |  29 ++++-
 2 files changed, 203 insertions(+), 57 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index ed1ec10ec62b..9a648d1f5d09 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -425,7 +425,7 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
 }
 
 static int
-mt7530_pad_clk_setup(struct dsa_switch *ds, int mode)
+mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t mode)
 {
 	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, trgint, i, xtal;
@@ -1380,13 +1380,111 @@ mt7530_setup(struct dsa_switch *ds)
 	return 0;
 }
 
-static void mt7530_phylink_mac_config(struct dsa_switch *ds, int port,
+static bool mt7530_phy_supported(struct dsa_switch *ds, int port,
+				 const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	switch (port) {
+	case 0: /* Internal phy */
+	case 1:
+	case 2:
+	case 3:
+	case 4:
+		if (state->interface != PHY_INTERFACE_MODE_GMII)
+			goto unsupported;
+		break;
+	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
+		if (!phy_interface_mode_is_rgmii(state->interface) &&
+		    state->interface != PHY_INTERFACE_MODE_MII &&
+		    state->interface != PHY_INTERFACE_MODE_GMII)
+			goto unsupported;
+		break;
+	case 6: /* 1st cpu port */
+		if (state->interface != PHY_INTERFACE_MODE_RGMII &&
+		    state->interface != PHY_INTERFACE_MODE_TRGMII)
+			goto unsupported;
+		break;
+	default:
+		dev_err(priv->dev, "%s: unsupported port: %i\n", __func__,
+			port);
+		goto unsupported;
+	}
+
+	return true;
+
+unsupported:
+	return false;
+}
+
+static bool mt753x_phy_supported(struct dsa_switch *ds, int port,
+				 const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	return priv->info->phy_supported(ds, port, state);
+}
+
+static int
+mt7530_pad_setup(struct dsa_switch *ds, const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	/* Setup TX circuit incluing relevant PAD and driving */
+	mt7530_pad_clk_setup(ds, state->interface);
+
+	if (priv->id == ID_MT7530) {
+		/* Setup RX circuit, relevant PAD and driving on the
+		 * host which must be placed after the setup on the
+		 * device side is all finished.
+		 */
+		mt7623_pad_clk_setup(ds);
+	}
+
+	return 0;
+}
+
+static int
+mt753x_pad_setup(struct dsa_switch *ds, const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	return priv->info->pad_setup(ds, state);
+}
+
+static int
+mt7530_mac_setup(struct dsa_switch *ds, int port, unsigned int mode,
+		 const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	/* Only need to setup port5. */
+	if (port != 5)
+		return 0;
+
+	mt7530_setup_port5(priv->ds, state->interface);
+
+	return 0;
+}
+
+static int mt753x_mac_setup(struct dsa_switch *ds, int port, unsigned int mode,
+			    const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	return priv->info->mac_setup(ds, port, mode, state);
+}
+
+static void mt753x_phylink_mac_config(struct dsa_switch *ds, int port,
 				      unsigned int mode,
 				      const struct phylink_link_state *state)
 {
 	struct mt7530_priv *priv = ds->priv;
 	u32 mcr_cur, mcr_new;
 
+	if (!mt753x_phy_supported(ds, port, state))
+		return;
+
 	switch (port) {
 	case 0: /* Internal phy */
 	case 1:
@@ -1399,35 +1497,24 @@ static void mt7530_phylink_mac_config(struct dsa_switch *ds, int port,
 	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
 		if (priv->p5_interface == state->interface)
 			break;
-		if (!phy_interface_mode_is_rgmii(state->interface) &&
-		    state->interface != PHY_INTERFACE_MODE_MII &&
-		    state->interface != PHY_INTERFACE_MODE_GMII)
-			return;
 
-		mt7530_setup_port5(ds, state->interface);
+		if (mt753x_mac_setup(ds, port, mode, state) < 0)
+			goto unsupported;
+
 		break;
 	case 6: /* 1st cpu port */
 		if (priv->p6_interface == state->interface)
 			break;
 
-		if (state->interface != PHY_INTERFACE_MODE_RGMII &&
-		    state->interface != PHY_INTERFACE_MODE_TRGMII)
-			return;
-
-		/* Setup TX circuit incluing relevant PAD and driving */
-		mt7530_pad_clk_setup(ds, state->interface);
+		mt753x_pad_setup(ds, state);
 
-		if (priv->id == ID_MT7530) {
-			/* Setup RX circuit, relevant PAD and driving on the
-			 * host which must be placed after the setup on the
-			 * device side is all finished.
-			 */
-			mt7623_pad_clk_setup(ds);
-		}
+		if (mt753x_mac_setup(ds, port, mode, state) < 0)
+			goto unsupported;
 
 		priv->p6_interface = state->interface;
 		break;
 	default:
+unsupported:
 		dev_err(ds->dev, "%s: unsupported port: %i\n", __func__, port);
 		return;
 	}
@@ -1488,38 +1575,14 @@ static void mt7530_phylink_mac_link_up(struct dsa_switch *ds, int port,
 	mt7530_port_set_status(priv, port, 1);
 }
 
-static void mt7530_phylink_validate(struct dsa_switch *ds, int port,
+static void mt753x_phylink_validate(struct dsa_switch *ds, int port,
 				    unsigned long *supported,
 				    struct phylink_link_state *state)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
 
-	switch (port) {
-	case 0: /* Internal phy */
-	case 1:
-	case 2:
-	case 3:
-	case 4:
-		if (state->interface != PHY_INTERFACE_MODE_NA &&
-		    state->interface != PHY_INTERFACE_MODE_GMII)
-			goto unsupported;
-		break;
-	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
-		if (state->interface != PHY_INTERFACE_MODE_NA &&
-		    !phy_interface_mode_is_rgmii(state->interface) &&
-		    state->interface != PHY_INTERFACE_MODE_MII &&
-		    state->interface != PHY_INTERFACE_MODE_GMII)
-			goto unsupported;
-		break;
-	case 6: /* 1st cpu port */
-		if (state->interface != PHY_INTERFACE_MODE_NA &&
-		    state->interface != PHY_INTERFACE_MODE_RGMII &&
-		    state->interface != PHY_INTERFACE_MODE_TRGMII)
-			goto unsupported;
-		break;
-	default:
-		dev_err(ds->dev, "%s: unsupported port: %i\n", __func__, port);
-unsupported:
+	if (state->interface != PHY_INTERFACE_MODE_NA &&
+	    !mt753x_phy_supported(ds, port, state)) {
 		linkmode_zero(supported);
 		return;
 	}
@@ -1590,12 +1653,36 @@ mt7530_phylink_mac_link_state(struct dsa_switch *ds, int port,
 	return 1;
 }
 
+static int
+mt753x_setup(struct dsa_switch *ds)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	return priv->info->setup(ds);
+}
+
+static int
+mt753x_phy_read(struct dsa_switch *ds, int port, int regnum)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	return priv->info->phy_read(ds, port, regnum);
+}
+
+static int
+mt753x_phy_write(struct dsa_switch *ds, int port, int regnum, u16 val)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	return priv->info->phy_write(ds, port, regnum, val);
+}
+
 static const struct dsa_switch_ops mt7530_switch_ops = {
 	.get_tag_protocol	= mtk_get_tag_protocol,
-	.setup			= mt7530_setup,
+	.setup			= mt753x_setup,
 	.get_strings		= mt7530_get_strings,
-	.phy_read		= mt7530_phy_read,
-	.phy_write		= mt7530_phy_write,
+	.phy_read		= mt753x_phy_read,
+	.phy_write		= mt753x_phy_write,
 	.get_ethtool_stats	= mt7530_get_ethtool_stats,
 	.get_sset_count		= mt7530_get_sset_count,
 	.port_enable		= mt7530_port_enable,
@@ -1610,16 +1697,37 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.port_vlan_prepare	= mt7530_port_vlan_prepare,
 	.port_vlan_add		= mt7530_port_vlan_add,
 	.port_vlan_del		= mt7530_port_vlan_del,
-	.phylink_validate	= mt7530_phylink_validate,
+	.phylink_validate	= mt753x_phylink_validate,
 	.phylink_mac_link_state = mt7530_phylink_mac_link_state,
-	.phylink_mac_config	= mt7530_phylink_mac_config,
+	.phylink_mac_config	= mt753x_phylink_mac_config,
 	.phylink_mac_link_down	= mt7530_phylink_mac_link_down,
 	.phylink_mac_link_up	= mt7530_phylink_mac_link_up,
 };
 
+static const struct mt753x_info mt753x_table[] = {
+	[ID_MT7621] = {
+		.id = ID_MT7621,
+		.setup = mt7530_setup,
+		.phy_read = mt7530_phy_read,
+		.phy_write = mt7530_phy_write,
+		.phy_supported = mt7530_phy_supported,
+		.pad_setup = mt7530_pad_setup,
+		.mac_setup = mt7530_mac_setup,
+	},
+	[ID_MT7530] = {
+		.id = ID_MT7530,
+		.setup = mt7530_setup,
+		.phy_read = mt7530_phy_read,
+		.phy_write = mt7530_phy_write,
+		.phy_supported = mt7530_phy_supported,
+		.pad_setup = mt7530_pad_setup,
+		.mac_setup = mt7530_mac_setup,
+	},
+};
+
 static const struct of_device_id mt7530_of_match[] = {
-	{ .compatible = "mediatek,mt7621", .data = (void *)ID_MT7621, },
-	{ .compatible = "mediatek,mt7530", .data = (void *)ID_MT7530, },
+	{ .compatible = "mediatek,mt7621", .data = &mt753x_table[ID_MT7621], },
+	{ .compatible = "mediatek,mt7530", .data = &mt753x_table[ID_MT7530], },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mt7530_of_match);
@@ -1660,8 +1768,19 @@ mt7530_probe(struct mdio_device *mdiodev)
 	/* Get the hardware identifier from the devicetree node.
 	 * We will need it for some of the clock and regulator setup.
 	 */
-	priv->id = (unsigned int)(unsigned long)
-		of_device_get_match_data(&mdiodev->dev);
+	priv->info = of_device_get_match_data(&mdiodev->dev);
+	if (!priv->info)
+		return -EINVAL;
+
+	/* Sanity check if these required device operstaions are filled
+	 * properly.
+	 */
+	if (!priv->info->setup || !priv->info->phy_read ||
+	    !priv->info->phy_write || !priv->info->phy_supported ||
+	    !priv->info->pad_setup || !priv->info->mac_setup)
+		return -EINVAL;
+
+	priv->id = priv->info->id;
 
 	if (priv->id == ID_MT7530) {
 		priv->core_pwr = devm_regulator_get(&mdiodev->dev, "core");
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index ccb9da8cad0d..aac86e4fc148 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -11,7 +11,7 @@
 #define MT7530_NUM_FDB_RECORDS		2048
 #define MT7530_ALL_MEMBERS		0xff
 
-enum {
+enum mt753x_id {
 	ID_MT7530 = 0,
 	ID_MT7621 = 1,
 };
@@ -428,6 +428,32 @@ static const char *p5_intf_modes(unsigned int p5_interface)
 	}
 }
 
+/* struct mt753x_info -	This is the main data structure for holding the specific
+ *			part for each supported device
+ * @setup:		Holding the handler to a device initialization
+ * @phy_read:		Holding the way reading PHY port
+ * @phy_write:		Holding the way writing PHY port
+ * @phy_supported:	Check if the PHY type is being supported on a certain
+ *			port
+ * @pad_setup:		Holding the way setting up the bus pad for a certain MAC
+ *			port
+ * @mac_setup:		Holding the way setting up the PHY attribute for a
+ *			certain MAC port
+ */
+struct mt753x_info {
+	enum mt753x_id id;
+
+	int (*setup)(struct dsa_switch *ds);
+	int (*phy_read)(struct dsa_switch *ds, int port, int regnum);
+	int (*phy_write)(struct dsa_switch *ds, int port, int regnum, u16 val);
+	bool (*phy_supported)(struct dsa_switch *ds, int port,
+			      const struct phylink_link_state *state);
+	int (*pad_setup)(struct dsa_switch *ds,
+			 const struct phylink_link_state *state);
+	int (*mac_setup)(struct dsa_switch *ds, int port, unsigned int mode,
+			 const struct phylink_link_state *state);
+};
+
 /* struct mt7530_priv -	This is the main data structure for holding the state
  *			of the driver
  * @dev:		The device pointer
@@ -455,6 +481,7 @@ struct mt7530_priv {
 	struct regulator	*core_pwr;
 	struct regulator	*io_pwr;
 	struct gpio_desc	*reset;
+	const struct mt753x_info *info;
 	unsigned int		id;
 	bool			mcm;
 	phy_interface_t		p6_interface;
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

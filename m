Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB7CC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 13:50:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71BD020731
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 13:50:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RGp3g121";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="l9VBnQry"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71BD020731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ExOUOfpD1spEqmZy9Y9Vi1ewczqNVquvXlnDPDQmXIs=; b=RGp3g121+KoXxzMkMerrfS7Rv
	p+BnuPBmIJfqKhbfa+SYjXVoUWGpo5BxJy8xzGvSedrEiPJaXyiCZvWF1v1zD46zRgP6+J4o1B6UE
	VqZGRLjV/oPDhEPQH/D+wv4pnPuI3AOK7R+93tP1pTKTTvRMqp+vcdXAPpa9ERxtoqoeH6d33JrJI
	PRWqe7cqFGm+itZ21acmnQeIVVYrFOaQulWS27XkTScE8+BqOevXeusHBQpOxkjpRPtaZpj3te6uQ
	IUuwptZH4dMk9srynTcgiquQmPZLA3Aip+ObAJKRgznIHgCmu8HgXlCPlcVCV78y0didNiFdlv+Cm
	/BuP9XQow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGjRC-0004Df-PP; Fri, 11 Sep 2020 13:50:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGjQb-0003yY-2p; Fri, 11 Sep 2020 13:49:30 +0000
X-UUID: 2babf29dda6b481b9d3b32dc12b5d3d3-20200911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hdLgl5qYb7csFXTSLNcMefKqwSUXSPIFrjgHweGeq/I=; 
 b=l9VBnQryhtALQqIzCkMzjtbLtakGSwko4lj0Bi9OkGONMyvON1mkqm3gUxOKj5GRcJr/sUOzW5O+IhLqSD5s1kZ8YhcRQEAxdyDXAEuzuA0dkYakbWUiDlz9M3Zg0nb63+e2N58TMvGrljUVcTU/jNfmut4iFcxqewAaqGFWm7c=;
X-UUID: 2babf29dda6b481b9d3b32dc12b5d3d3-20200911
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1689923434; Fri, 11 Sep 2020 05:49:18 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 06:49:16 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 21:49:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Sep 2020 21:49:12 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Russell
 King" <linux@armlinux.org.uk>
Subject: [PATCH net-next v5 2/6] net: dsa: mt7530: Extend device data ready
 for adding a new hardware
Date: Fri, 11 Sep 2020 21:48:52 +0800
Message-ID: <163f6a4cd8d2a801e7372b3ff57ebb470b646e5b.1599829696.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1599829696.git.landen.chao@mediatek.com>
References: <cover.1599829696.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_094925_389748_21B25795 
X-CRM114-Status: GOOD (  20.32  )
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
Cc: devicetree@vger.kernel.org, dqfext@gmail.com, frank-w@public-files.de,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, Landen Chao <landen.chao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a structure holding required operations for each device such as device
initialization, PHY port read or write, a checker whether PHY interface is
supported on a certain port, MAC port setup for either bus pad or a
specific PHY interface.

The patch is done for ready adding a new hardware MT7531, and keep the
same setup logic of existing hardware.

Signed-off-by: Landen Chao <landen.chao@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/dsa/mt7530.c | 271 ++++++++++++++++++++++++++++-----------
 drivers/net/dsa/mt7530.h |  37 +++++-
 2 files changed, 234 insertions(+), 74 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 238417db26f9..9c6f80b3e5f5 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -372,8 +372,9 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
 		mt7530_write(priv, MT7530_ATA1 + (i * 4), reg[i]);
 }
 
+/* Setup TX circuit including relevant PAD and driving */
 static int
-mt7530_pad_clk_setup(struct dsa_switch *ds, int mode)
+mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, trgint, i, xtal;
@@ -387,7 +388,7 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, int mode)
 		return -EINVAL;
 	}
 
-	switch (mode) {
+	switch (interface) {
 	case PHY_INTERFACE_MODE_RGMII:
 		trgint = 0;
 		/* PLL frequency: 125MHz */
@@ -409,7 +410,8 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, int mode)
 		}
 		break;
 	default:
-		dev_err(priv->dev, "xMII mode %d not supported\n", mode);
+		dev_err(priv->dev, "xMII interface %d not supported\n",
+			interface);
 		return -EINVAL;
 	}
 
@@ -1349,47 +1351,116 @@ mt7530_setup(struct dsa_switch *ds)
 	return 0;
 }
 
-static void mt7530_phylink_mac_config(struct dsa_switch *ds, int port,
-				      unsigned int mode,
-				      const struct phylink_link_state *state)
+static bool
+mt7530_phy_mode_supported(struct dsa_switch *ds, int port,
+			  const struct phylink_link_state *state)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 mcr_cur, mcr_new;
 
 	switch (port) {
-	case 0: /* Internal phy */
-	case 1:
-	case 2:
-	case 3:
-	case 4:
+	case 0 ... 4: /* Internal phy */
 		if (state->interface != PHY_INTERFACE_MODE_GMII)
-			return;
+			return false;
 		break;
 	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
-		if (priv->p5_interface == state->interface)
-			break;
 		if (!phy_interface_mode_is_rgmii(state->interface) &&
 		    state->interface != PHY_INTERFACE_MODE_MII &&
 		    state->interface != PHY_INTERFACE_MODE_GMII)
-			return;
+			return false;
+		break;
+	case 6: /* 1st cpu port */
+		if (state->interface != PHY_INTERFACE_MODE_RGMII &&
+		    state->interface != PHY_INTERFACE_MODE_TRGMII)
+			return false;
+		break;
+	default:
+		dev_err(priv->dev, "%s: unsupported port: %i\n", __func__,
+			port);
+		return false;
+	}
+
+	return true;
+}
+
+static bool
+mt753x_phy_mode_supported(struct dsa_switch *ds, int port,
+			  const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	return priv->info->phy_mode_supported(ds, port, state);
+}
+
+static int
+mt753x_pad_setup(struct dsa_switch *ds, const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	return priv->info->pad_setup(ds, state->interface);
+}
+
+static int
+mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
+		  phy_interface_t interface)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	/* Only need to setup port5. */
+	if (port != 5)
+		return 0;
+
+	mt7530_setup_port5(priv->ds, interface);
+
+	return 0;
+}
+
+static int
+mt753x_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
+		  const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	return priv->info->mac_port_config(ds, port, mode, state->interface);
+}
+
+static void
+mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
+			  const struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+	u32 mcr_cur, mcr_new;
+
+	if (!mt753x_phy_mode_supported(ds, port, state))
+		goto unsupported;
+
+	switch (port) {
+	case 0 ... 4: /* Internal phy */
+		if (state->interface != PHY_INTERFACE_MODE_GMII)
+			goto unsupported;
+		break;
+	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
+		if (priv->p5_interface == state->interface)
+			break;
+
+		if (mt753x_mac_config(ds, port, mode, state) < 0)
+			goto unsupported;
 
-		mt7530_setup_port5(ds, state->interface);
 		break;
 	case 6: /* 1st cpu port */
 		if (priv->p6_interface == state->interface)
 			break;
 
-		if (state->interface != PHY_INTERFACE_MODE_RGMII &&
-		    state->interface != PHY_INTERFACE_MODE_TRGMII)
-			return;
+		mt753x_pad_setup(ds, state);
 
-		/* Setup TX circuit incluing relevant PAD and driving */
-		mt7530_pad_clk_setup(ds, state->interface);
+		if (mt753x_mac_config(ds, port, mode, state) < 0)
+			goto unsupported;
 
 		priv->p6_interface = state->interface;
 		break;
 	default:
-		dev_err(ds->dev, "%s: unsupported port: %i\n", __func__, port);
+unsupported:
+		dev_err(ds->dev, "%s: unsupported %s port: %i\n",
+			__func__, phy_modes(state->interface), port);
 		return;
 	}
 
@@ -1453,61 +1524,44 @@ static void mt7530_phylink_mac_link_up(struct dsa_switch *ds, int port,
 	mt7530_set(priv, MT7530_PMCR_P(port), mcr);
 }
 
-static void mt7530_phylink_validate(struct dsa_switch *ds, int port,
-				    unsigned long *supported,
-				    struct phylink_link_state *state)
+static void
+mt7530_mac_port_validate(struct dsa_switch *ds, int port,
+			 unsigned long *supported)
+{
+	if (port == 5)
+		phylink_set(supported, 1000baseX_Full);
+}
+
+static void
+mt753x_phylink_validate(struct dsa_switch *ds, int port,
+			unsigned long *supported,
+			struct phylink_link_state *state)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
+	struct mt7530_priv *priv = ds->priv;
 
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
+	    !mt753x_phy_mode_supported(ds, port, state)) {
 		linkmode_zero(supported);
 		return;
 	}
 
 	phylink_set_port_modes(mask);
-	phylink_set(mask, Autoneg);
 
-	if (state->interface == PHY_INTERFACE_MODE_TRGMII) {
-		phylink_set(mask, 1000baseT_Full);
-	} else {
+	if (state->interface != PHY_INTERFACE_MODE_TRGMII) {
 		phylink_set(mask, 10baseT_Half);
 		phylink_set(mask, 10baseT_Full);
 		phylink_set(mask, 100baseT_Half);
 		phylink_set(mask, 100baseT_Full);
-
-		if (state->interface != PHY_INTERFACE_MODE_MII) {
-			/* This switch only supports 1G full-duplex. */
-			phylink_set(mask, 1000baseT_Full);
-			if (port == 5)
-				phylink_set(mask, 1000baseX_Full);
-		}
+		phylink_set(mask, Autoneg);
 	}
 
+	/* This switch only supports 1G full-duplex. */
+	if (state->interface != PHY_INTERFACE_MODE_MII)
+		phylink_set(mask, 1000baseT_Full);
+
+	priv->info->mac_port_validate(ds, port, mask);
+
 	phylink_set(mask, Pause);
 	phylink_set(mask, Asym_Pause);
 
@@ -1555,12 +1609,45 @@ mt7530_phylink_mac_link_state(struct dsa_switch *ds, int port,
 	return 1;
 }
 
+static int
+mt753x_phylink_mac_link_state(struct dsa_switch *ds, int port,
+			      struct phylink_link_state *state)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	return priv->info->mac_port_get_state(ds, port, state);
+}
+
+static int
+mt753x_setup(struct dsa_switch *ds)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	return priv->info->sw_setup(ds);
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
@@ -1577,16 +1664,41 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.port_vlan_del		= mt7530_port_vlan_del,
 	.port_mirror_add	= mt7530_port_mirror_add,
 	.port_mirror_del	= mt7530_port_mirror_del,
-	.phylink_validate	= mt7530_phylink_validate,
-	.phylink_mac_link_state = mt7530_phylink_mac_link_state,
-	.phylink_mac_config	= mt7530_phylink_mac_config,
+	.phylink_validate	= mt753x_phylink_validate,
+	.phylink_mac_link_state	= mt753x_phylink_mac_link_state,
+	.phylink_mac_config	= mt753x_phylink_mac_config,
 	.phylink_mac_link_down	= mt7530_phylink_mac_link_down,
 	.phylink_mac_link_up	= mt7530_phylink_mac_link_up,
 };
 
+static const struct mt753x_info mt753x_table[] = {
+	[ID_MT7621] = {
+		.id = ID_MT7621,
+		.sw_setup = mt7530_setup,
+		.phy_read = mt7530_phy_read,
+		.phy_write = mt7530_phy_write,
+		.pad_setup = mt7530_pad_clk_setup,
+		.phy_mode_supported = mt7530_phy_mode_supported,
+		.mac_port_validate = mt7530_mac_port_validate,
+		.mac_port_get_state = mt7530_phylink_mac_link_state,
+		.mac_port_config = mt7530_mac_config,
+	},
+	[ID_MT7530] = {
+		.id = ID_MT7530,
+		.sw_setup = mt7530_setup,
+		.phy_read = mt7530_phy_read,
+		.phy_write = mt7530_phy_write,
+		.pad_setup = mt7530_pad_clk_setup,
+		.phy_mode_supported = mt7530_phy_mode_supported,
+		.mac_port_validate = mt7530_mac_port_validate,
+		.mac_port_get_state = mt7530_phylink_mac_link_state,
+		.mac_port_config = mt7530_mac_config,
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
@@ -1627,8 +1739,21 @@ mt7530_probe(struct mdio_device *mdiodev)
 	/* Get the hardware identifier from the devicetree node.
 	 * We will need it for some of the clock and regulator setup.
 	 */
-	priv->id = (unsigned int)(unsigned long)
-		of_device_get_match_data(&mdiodev->dev);
+	priv->info = of_device_get_match_data(&mdiodev->dev);
+	if (!priv->info)
+		return -EINVAL;
+
+	/* Sanity check if these required device operations are filled
+	 * properly.
+	 */
+	if (!priv->info->sw_setup || !priv->info->pad_setup ||
+	    !priv->info->phy_read || !priv->info->phy_write ||
+	    !priv->info->phy_mode_supported ||
+	    !priv->info->mac_port_validate ||
+	    !priv->info->mac_port_get_state || !priv->info->mac_port_config)
+		return -EINVAL;
+
+	priv->id = priv->info->id;
 
 	if (priv->id == ID_MT7530) {
 		priv->core_pwr = devm_regulator_get(&mdiodev->dev, "core");
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 14de60d0b9ca..44ac55433089 100644
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
@@ -443,6 +443,40 @@ static const char *p5_intf_modes(unsigned int p5_interface)
 	}
 }
 
+/* struct mt753x_info -	This is the main data structure for holding the specific
+ *			part for each supported device
+ * @sw_setup:		Holding the handler to a device initialization
+ * @phy_read:		Holding the way reading PHY port
+ * @phy_write:		Holding the way writing PHY port
+ * @pad_setup:		Holding the way setting up the bus pad for a certain
+ *			MAC port
+ * @phy_mode_supported:	Check if the PHY type is being supported on a certain
+ *			port
+ * @mac_port_validate:	Holding the way to set addition validate type for a
+ *			certan MAC port
+ * @mac_port_get_state: Holding the way getting the MAC/PCS state for a certain
+ *			MAC port
+ * @mac_port_config:	Holding the way setting up the PHY attribute to a
+ *			certain MAC port
+ */
+struct mt753x_info {
+	enum mt753x_id id;
+
+	int (*sw_setup)(struct dsa_switch *ds);
+	int (*phy_read)(struct dsa_switch *ds, int port, int regnum);
+	int (*phy_write)(struct dsa_switch *ds, int port, int regnum, u16 val);
+	int (*pad_setup)(struct dsa_switch *ds, phy_interface_t interface);
+	bool (*phy_mode_supported)(struct dsa_switch *ds, int port,
+				   const struct phylink_link_state *state);
+	void (*mac_port_validate)(struct dsa_switch *ds, int port,
+				  unsigned long *supported);
+	int (*mac_port_get_state)(struct dsa_switch *ds, int port,
+				  struct phylink_link_state *state);
+	int (*mac_port_config)(struct dsa_switch *ds, int port,
+			       unsigned int mode,
+			       phy_interface_t interface);
+};
+
 /* struct mt7530_priv -	This is the main data structure for holding the state
  *			of the driver
  * @dev:		The device pointer
@@ -468,6 +502,7 @@ struct mt7530_priv {
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

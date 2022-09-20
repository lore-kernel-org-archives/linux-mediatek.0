Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18CCC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 22:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=203wztzi7IYrkeXeNgm14dkzE36TutCtnYwoEZwd6wk=; b=ydSMlbZ04c7ulD9jsf5AvhrJAb
	GpRfgS124FKEJhaC6CGpiH80BOKLNVcPa09UFwMbHOXKy/RRogMuWQCSYHsh1v0rcgh9ngoxyunDX
	WRjbK58hrVYntH5q+2B0OiZpl6QJmOptDiadi8op2Fzm5LlGyNml923/mEcfPYqH3NIN+3GUDFQDq
	fkgGtwUru7Qrgz8NWLVJZ3yxJ62ri9MLSgIgfHN5uBtKbrzzK4whec2dKCIKocg3zmks3K2IOFsrH
	uMRV1AzIBts2e0E+QNWIgM+t5hn0QMq327U3o9g45PYYyuFRGbRxtWINn76Cajr87XjIGVz+ANoyK
	N/BjAtCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oalip-007Mwu-AM; Tue, 20 Sep 2022 22:28:07 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oalim-007Mvq-1L
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 22:28:05 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1oalie-0007fp-0i;
	Wed, 21 Sep 2022 00:27:56 +0200
Date: Tue, 20 Sep 2022 23:27:49 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Russell King <linux@armlinux.org.uk>,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexander 'lynxis' Couzens <lynxis@fe80.eu>
Subject: [PATCH v3] net: dsa: mt7530: add support for in-band link status
Message-ID: <Yyo+F080DpEhvFJ9@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_152804_175076_4AD48692 
X-CRM114-Status: GOOD (  18.34  )
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

Read link status from SGMII PCS for in-band managed 2500Base-X and
1000Base-X connection on a MAC port of the MT7531. This is needed to
get the SFP cage working which is connected to SGMII interface of
port 5 of the MT7531 switch IC on the Bananapi BPi-R3 board.
While at it also handle an_complete for both the autoneg and the
non-autoneg codepath.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: Use MLO_PAUSE_NONE and read an_complete from SGMII status register.
v3: Remove unused variable, read an_complete register only in autoneg
    codepath, set an_complete to link status bit in case of fixed
    speed link.

 drivers/net/dsa/mt7530.c | 50 +++++++++++++++++++++++++++++-----------
 drivers/net/dsa/mt7530.h |  1 +
 2 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 835807911be019..9734012f8e699e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2699,9 +2699,6 @@ mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 	case PHY_INTERFACE_MODE_NA:
 	case PHY_INTERFACE_MODE_1000BASEX:
 	case PHY_INTERFACE_MODE_2500BASEX:
-		if (phylink_autoneg_inband(mode))
-			return -EINVAL;
-
 		return mt7531_sgmii_setup_mode_force(priv, port, interface);
 	default:
 		return -EINVAL;
@@ -2777,13 +2774,6 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		return;
 	}
 
-	if (phylink_autoneg_inband(mode) &&
-	    state->interface != PHY_INTERFACE_MODE_SGMII) {
-		dev_err(ds->dev, "%s: in-band negotiation unsupported\n",
-			__func__);
-		return;
-	}
-
 	mcr_cur = mt7530_read(priv, MT7530_PMCR_P(port));
 	mcr_new = mcr_cur;
 	mcr_new &= ~PMCR_LINK_SETTINGS_MASK;
@@ -2922,6 +2912,9 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 				   MAC_10 | MAC_100 | MAC_1000FD;
 
+	if ((priv->id == ID_MT7531) && mt753x_is_mac_port(port))
+		config->mac_capabilities |= MAC_2500FD;
+
 	/* This driver does not make use of the speed, duplex, pause or the
 	 * advertisement in its mac_config, so it is safe to mark this driver
 	 * as non-legacy.
@@ -2987,6 +2980,7 @@ mt7531_sgmii_pcs_get_state_an(struct mt7530_priv *priv, int port,
 
 	status = mt7530_read(priv, MT7531_PCS_CONTROL_1(port));
 	state->link = !!(status & MT7531_SGMII_LINK_STATUS);
+	state->an_complete = !!(val & MT7531_SGMII_AN_COMPLETE);
 	if (state->interface == PHY_INTERFACE_MODE_SGMII &&
 	    (status & MT7531_SGMII_AN_ENABLE)) {
 		val = mt7530_read(priv, MT7531_PCS_SPEED_ABILITY(port));
@@ -3017,16 +3011,44 @@ mt7531_sgmii_pcs_get_state_an(struct mt7530_priv *priv, int port,
 	return 0;
 }
 
+static void
+mt7531_sgmii_pcs_get_state_inband(struct mt7530_priv *priv, int port,
+				  struct phylink_link_state *state)
+{
+	unsigned int val;
+
+	val = mt7530_read(priv, MT7531_PCS_CONTROL_1(port));
+	state->link = !!(val & MT7531_SGMII_LINK_STATUS);
+	if (!state->link)
+		return;
+
+	state->an_complete = state->link;
+
+	if (state->interface == PHY_INTERFACE_MODE_2500BASEX)
+		state->speed = SPEED_2500;
+	else
+		state->speed = SPEED_1000;
+
+	state->duplex = DUPLEX_FULL;
+	state->pause = MLO_PAUSE_NONE;
+}
+
 static void mt7531_pcs_get_state(struct phylink_pcs *pcs,
 				 struct phylink_link_state *state)
 {
 	struct mt7530_priv *priv = pcs_to_mt753x_pcs(pcs)->priv;
 	int port = pcs_to_mt753x_pcs(pcs)->port;
 
-	if (state->interface == PHY_INTERFACE_MODE_SGMII)
+	if (state->interface == PHY_INTERFACE_MODE_SGMII) {
 		mt7531_sgmii_pcs_get_state_an(priv, port, state);
-	else
-		state->link = false;
+		return;
+	} else if ((state->interface == PHY_INTERFACE_MODE_1000BASEX) ||
+		   (state->interface == PHY_INTERFACE_MODE_2500BASEX)) {
+		mt7531_sgmii_pcs_get_state_inband(priv, port, state);
+		return;
+	}
+
+	state->link = false;
 }
 
 static int mt753x_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
@@ -3067,6 +3089,8 @@ mt753x_setup(struct dsa_switch *ds)
 		priv->pcs[i].pcs.ops = priv->info->pcs_ops;
 		priv->pcs[i].priv = priv;
 		priv->pcs[i].port = i;
+		if (mt753x_is_mac_port(i))
+			priv->pcs[i].pcs.poll = 1;
 	}
 
 	ret = priv->info->sw_setup(ds);
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index e509af95c35414..e8d9664353504f 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -373,6 +373,7 @@ enum mt7530_vlan_port_acc_frm {
 #define  MT7531_SGMII_LINK_STATUS	BIT(18)
 #define  MT7531_SGMII_AN_ENABLE		BIT(12)
 #define  MT7531_SGMII_AN_RESTART	BIT(9)
+#define  MT7531_SGMII_AN_COMPLETE	BIT(21)
 
 /* Register for SGMII PCS_SPPED_ABILITY */
 #define MT7531_PCS_SPEED_ABILITY(p)	MT7531_SGMII_REG(p, 0x08)
-- 
2.37.3



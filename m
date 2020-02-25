Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640FAC35DF9
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 09:43:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3786220656
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 09:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hvM38/9/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="XaY8BbYd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3786220656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:To
	:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8+T3DGJYTbbmEycWBPJdI7W3Li9O/bSi6gBNJmmlic=; b=hvM38/9/xCvS6i
	0GRDCn638SX0DQMWvOyQSLN7ufHbXGh3a+anuT/yaFZ4GpqKELkGbSPdzGGloqGx4TxRZHl/srU+q
	+hKwaFPPf23HfioG/P3QIdWc6LVNvDMMg16/3/ep0Gf+w0gstWk2qEvPCQA6GTwd48Xhm31Xa/2xK
	7Pn1dDdL0vBOKaTsjjOww42UEvs1z3EVF/RyceKQlEnbXNf8BSq6UHHZSOYWBZZBOWF0C99abrMv1
	LmC0Snmgp5fajSS4mGxRr1ZKKvreEFzSnAWsDeFRPuQcbmhMxeGU30WXk2f0pNx8K/ZPgbhgzmGf/
	ZHpLHUEKjsmpSQh9V6Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Wjm-0000FF-QY; Tue, 25 Feb 2020 09:42:46 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Wic-0007JS-0G; Tue, 25 Feb 2020 09:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G8lpiHOZ+WUfp/iCKEL1UO+gAa/0Xygzi08CY28mEYI=; b=XaY8BbYdPHmGr+sxih1v7fD3at
 dquXraYroSJyxQdtRvuGmk8eYGP+pruO+T4kO/lmwDqnbrNVTiIe0IxCI1iW8X4yPpyY09tDTVfva
 /KikCjw3W17Z60oymq12XzlfrBVrMUhiv+ovp7tnRz1Ztw9HPDIPJ4/rA/qB7a8O3RCQB0fWFrhH9
 zQ+GdL2gKmo3JvVBdBfrziSczIia6yUGqLPYgRBLFYeszL3Wm0Nn7OJBeAFojF19dD+Tr8XAvErCa
 ivjT8CDg+eKauMF+m15N8hqagI2+BKChj6o/5ZfCk+X/CNvVV1hdBUw+UWbxofnHzveVxnofOrBQG
 TMEZwZdw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38828 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6Wgd-0008Pp-P7; Tue, 25 Feb 2020 09:39:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6WgV-0000Tk-Mu; Tue, 25 Feb 2020 09:39:23 +0000
In-Reply-To: <20200225093703.GS25745@shell.armlinux.org.uk>
References: <20200225093703.GS25745@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 8/8] net: mvpp2: use resolved link config in
 mac_link_up()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1j6WgV-0000Tk-Mu@rmk-PC.armlinux.org.uk>
Date: Tue, 25 Feb 2020 09:39:23 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_014134_408630_DD99F4E0 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: linux-doc@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
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

Convert the Marvell mvpp2 ethernet driver to use the finalised link
parameters in mac_link_up() rather than the parameters in mac_config().

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 83 +++++++++++--------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index ed8042d97e29..6b9c7ed2547e 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -4976,15 +4976,13 @@ static void mvpp2_gmac_config(struct mvpp2_port *port, unsigned int mode,
 	old_ctrl2 = ctrl2 = readl(port->base + MVPP2_GMAC_CTRL_2_REG);
 	old_ctrl4 = ctrl4 = readl(port->base + MVPP22_GMAC_CTRL_4_REG);
 
-	an &= ~(MVPP2_GMAC_CONFIG_MII_SPEED | MVPP2_GMAC_CONFIG_GMII_SPEED |
-		MVPP2_GMAC_AN_SPEED_EN | MVPP2_GMAC_FC_ADV_EN |
+	an &= ~(MVPP2_GMAC_AN_SPEED_EN | MVPP2_GMAC_FC_ADV_EN |
 		MVPP2_GMAC_FC_ADV_ASM_EN | MVPP2_GMAC_FLOW_CTRL_AUTONEG |
-		MVPP2_GMAC_CONFIG_FULL_DUPLEX | MVPP2_GMAC_AN_DUPLEX_EN |
-		MVPP2_GMAC_IN_BAND_AUTONEG | MVPP2_GMAC_IN_BAND_AUTONEG_BYPASS);
+		MVPP2_GMAC_AN_DUPLEX_EN | MVPP2_GMAC_IN_BAND_AUTONEG |
+		MVPP2_GMAC_IN_BAND_AUTONEG_BYPASS);
 	ctrl0 &= ~MVPP2_GMAC_PORT_TYPE_MASK;
 	ctrl2 &= ~(MVPP2_GMAC_INBAND_AN_MASK | MVPP2_GMAC_PORT_RESET_MASK |
 		   MVPP2_GMAC_PCS_ENABLE_MASK);
-	ctrl4 &= ~(MVPP22_CTRL4_RX_FC_EN | MVPP22_CTRL4_TX_FC_EN);
 
 	/* Configure port type */
 	if (phy_interface_mode_is_8023z(state->interface)) {
@@ -5014,31 +5012,20 @@ static void mvpp2_gmac_config(struct mvpp2_port *port, unsigned int mode,
 
 	/* Configure negotiation style */
 	if (!phylink_autoneg_inband(mode)) {
-		/* Phy or fixed speed - no in-band AN */
-		if (state->duplex)
-			an |= MVPP2_GMAC_CONFIG_FULL_DUPLEX;
-
-		if (state->speed == SPEED_1000 || state->speed == SPEED_2500)
-			an |= MVPP2_GMAC_CONFIG_GMII_SPEED;
-		else if (state->speed == SPEED_100)
-			an |= MVPP2_GMAC_CONFIG_MII_SPEED;
-
-		if (state->pause & MLO_PAUSE_TX)
-			ctrl4 |= MVPP22_CTRL4_TX_FC_EN;
-		if (state->pause & MLO_PAUSE_RX)
-			ctrl4 |= MVPP22_CTRL4_RX_FC_EN;
+		/* Phy or fixed speed - no in-band AN, nothing to do, leave the
+		 * configured speed, duplex and flow control as-is.
+		 */
 	} else if (state->interface == PHY_INTERFACE_MODE_SGMII) {
 		/* SGMII in-band mode receives the speed and duplex from
 		 * the PHY. Flow control information is not received. */
-		an &= ~(MVPP2_GMAC_FORCE_LINK_DOWN | MVPP2_GMAC_FORCE_LINK_PASS);
+		an &= ~(MVPP2_GMAC_FORCE_LINK_DOWN |
+			MVPP2_GMAC_FORCE_LINK_PASS |
+			MVPP2_GMAC_CONFIG_MII_SPEED |
+			MVPP2_GMAC_CONFIG_GMII_SPEED |
+			MVPP2_GMAC_CONFIG_FULL_DUPLEX);
 		an |= MVPP2_GMAC_IN_BAND_AUTONEG |
 		      MVPP2_GMAC_AN_SPEED_EN |
 		      MVPP2_GMAC_AN_DUPLEX_EN;
-
-		if (state->pause & MLO_PAUSE_TX)
-			ctrl4 |= MVPP22_CTRL4_TX_FC_EN;
-		if (state->pause & MLO_PAUSE_RX)
-			ctrl4 |= MVPP22_CTRL4_RX_FC_EN;
 	} else if (phy_interface_mode_is_8023z(state->interface)) {
 		/* 1000BaseX and 2500BaseX ports cannot negotiate speed nor can
 		 * they negotiate duplex: they are always operating with a fixed
@@ -5046,19 +5033,17 @@ static void mvpp2_gmac_config(struct mvpp2_port *port, unsigned int mode,
 		 * speed and full duplex here.
 		 */
 		ctrl0 |= MVPP2_GMAC_PORT_TYPE_MASK;
-		an &= ~(MVPP2_GMAC_FORCE_LINK_DOWN | MVPP2_GMAC_FORCE_LINK_PASS);
+		an &= ~(MVPP2_GMAC_FORCE_LINK_DOWN |
+			MVPP2_GMAC_FORCE_LINK_PASS |
+			MVPP2_GMAC_CONFIG_MII_SPEED |
+			MVPP2_GMAC_CONFIG_GMII_SPEED |
+			MVPP2_GMAC_CONFIG_FULL_DUPLEX);
 		an |= MVPP2_GMAC_IN_BAND_AUTONEG |
 		      MVPP2_GMAC_CONFIG_GMII_SPEED |
 		      MVPP2_GMAC_CONFIG_FULL_DUPLEX;
 
-		if (state->pause & MLO_PAUSE_AN && state->an_enabled) {
+		if (state->pause & MLO_PAUSE_AN && state->an_enabled)
 			an |= MVPP2_GMAC_FLOW_CTRL_AUTONEG;
-		} else {
-			if (state->pause & MLO_PAUSE_TX)
-				ctrl4 |= MVPP22_CTRL4_TX_FC_EN;
-			if (state->pause & MLO_PAUSE_RX)
-				ctrl4 |= MVPP22_CTRL4_RX_FC_EN;
-		}
 	}
 
 /* Some fields of the auto-negotiation register require the port to be down when
@@ -5155,18 +5140,44 @@ static void mvpp2_mac_link_up(struct phylink_config *config,
 	struct mvpp2_port *port = netdev_priv(dev);
 	u32 val;
 
-	if (!phylink_autoneg_inband(mode)) {
-		if (mvpp2_is_xlg(interface)) {
+	if (mvpp2_is_xlg(interface)) {
+		if (!phylink_autoneg_inband(mode)) {
 			val = readl(port->base + MVPP22_XLG_CTRL0_REG);
 			val &= ~MVPP22_XLG_CTRL0_FORCE_LINK_DOWN;
 			val |= MVPP22_XLG_CTRL0_FORCE_LINK_PASS;
 			writel(val, port->base + MVPP22_XLG_CTRL0_REG);
-		} else {
+		}
+	} else {
+		if (!phylink_autoneg_inband(mode)) {
 			val = readl(port->base + MVPP2_GMAC_AUTONEG_CONFIG);
-			val &= ~MVPP2_GMAC_FORCE_LINK_DOWN;
+			val &= ~(MVPP2_GMAC_FORCE_LINK_DOWN |
+				 MVPP2_GMAC_CONFIG_MII_SPEED |
+				 MVPP2_GMAC_CONFIG_GMII_SPEED |
+				 MVPP2_GMAC_CONFIG_FULL_DUPLEX);
 			val |= MVPP2_GMAC_FORCE_LINK_PASS;
+
+			if (speed == SPEED_1000 || speed == SPEED_2500)
+				val |= MVPP2_GMAC_CONFIG_GMII_SPEED;
+			else if (speed == SPEED_100)
+				val |= MVPP2_GMAC_CONFIG_MII_SPEED;
+
+			if (duplex == DUPLEX_FULL)
+				val |= MVPP2_GMAC_CONFIG_FULL_DUPLEX;
+
 			writel(val, port->base + MVPP2_GMAC_AUTONEG_CONFIG);
 		}
+
+		/* We can always update the flow control enable bits;
+		 * these will only be effective if flow control AN
+		 * (MVPP2_GMAC_FLOW_CTRL_AUTONEG) is disabled.
+		 */
+		val = readl(port->base + MVPP22_GMAC_CTRL_4_REG);
+		val &= ~(MVPP22_CTRL4_RX_FC_EN | MVPP22_CTRL4_TX_FC_EN);
+		if (tx_pause)
+			val |= MVPP22_CTRL4_TX_FC_EN;
+		if (rx_pause)
+			val |= MVPP22_CTRL4_RX_FC_EN;
+		writel(val, port->base + MVPP22_GMAC_CTRL_4_REG);
 	}
 
 	mvpp2_port_enable(port);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

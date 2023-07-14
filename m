Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988EBEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJuLCksgLvJDAz5qoS9X12ylOio4XU+lYiUwgiS84xw=; b=wrBLmrIwfuMuiIF4PKbdMmfAHD
	uJJ8wzfBALTHigFi/ayuyTahuwlhzCQ1HMpLdfF9F5dCl6VMn6mJID9BfuLj9v5VdRBE6GiC+Sw8b
	udtgAYunOxIX6ipD8u5b9vVrBQEgdHaqulSffvwLTdN2Mv2q08oo0ahYmo2KtogIrZfQVgb6r3nDe
	/WZMyUR9RPnfigE4B2BeEIym+ERnzIbbhyxdGUaZ3cfsifGtU+U8f9H7isiU1yNaF7LmPdHHOlL7F
	OL19VRMgQ5VBH/zIS4A2gYgMoAb4Mj1OTJVmjxElDAqihbv/L/loAj7MbDG8mBIVS9/6GZGtVpED4
	a9rDGQgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKEqW-005dp6-2C;
	Fri, 14 Jul 2023 09:12:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKEqT-005dnf-0G;
	Fri, 14 Jul 2023 09:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IJuLCksgLvJDAz5qoS9X12ylOio4XU+lYiUwgiS84xw=; b=aJI0qff6lREsuXPpxpTOCaev+i
	nZADaZ0Baxs+NuQ6cRU2zNENLH22O57s7hZcKFAWhmb3/KGQJDQT11Eo3e6FZMJgV7LkTDCBPY0zn
	aYTEPLYvq702BDCBM2xw9RDXTPwvlvbCjiqD8sfD/lthQN6qDVlXjAQGxim6dF0IXEoTOEveu5vu+
	XUAZsbHzl7c0vCqZ8gqawSNb/8x9zDvjuVxmWNcpvpM7b5yBR4lWqlOrKfV+7dOBLNdvNyIU4e6ks
	yoYH2hF2jTWCDe+qkZ+JdE3p1ayU3eKqOJPu+0mcEK0Nj9JQoHdargLkLeIVMkgsiD+Q3Nc364e2q
	FK9iD4FQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43770 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qKEqN-0000Np-1n;
	Fri, 14 Jul 2023 10:12:07 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qKEqN-00H0xV-Aw; Fri, 14 Jul 2023 10:12:07 +0100
In-Reply-To: <ZLERQ2OBrv44Ppyc@shell.armlinux.org.uk>
References: <ZLERQ2OBrv44Ppyc@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Ar__n__ __NAL" <arinc.unal@arinc9.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 1/3] net: dsa: remove legacy_pre_march2020 detection
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qKEqN-00H0xV-Aw@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Jul 2023 10:12:07 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_021213_118750_06346EF7 
X-CRM114-Status: GOOD (  13.91  )
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

All drivers are now updated for the March 2020 changes, and no longer
make use of the mac_pcs_get_state() or mac_an_restart() operations,
which are now NULL across all DSA drivers. All DSA drivers don't look
at speed, duplex, pause or advertisement in their phylink_mac_config()
method either.

Remove support for these operations from DSA, and stop marking DSA as
a legacy driver by default.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/net/dsa.h |  3 ---
 net/dsa/port.c    | 41 -----------------------------------------
 2 files changed, 44 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index d309ee7ed04b..0b9c6aa27047 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -873,8 +873,6 @@ struct dsa_switch_ops {
 	struct phylink_pcs *(*phylink_mac_select_pcs)(struct dsa_switch *ds,
 						      int port,
 						      phy_interface_t iface);
-	int	(*phylink_mac_link_state)(struct dsa_switch *ds, int port,
-					  struct phylink_link_state *state);
 	int	(*phylink_mac_prepare)(struct dsa_switch *ds, int port,
 				       unsigned int mode,
 				       phy_interface_t interface);
@@ -884,7 +882,6 @@ struct dsa_switch_ops {
 	int	(*phylink_mac_finish)(struct dsa_switch *ds, int port,
 				      unsigned int mode,
 				      phy_interface_t interface);
-	void	(*phylink_mac_an_restart)(struct dsa_switch *ds, int port);
 	void	(*phylink_mac_link_down)(struct dsa_switch *ds, int port,
 					 unsigned int mode,
 					 phy_interface_t interface);
diff --git a/net/dsa/port.c b/net/dsa/port.c
index 0ce8fd311c78..c63cbfbe6489 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -1568,27 +1568,6 @@ static void dsa_port_phylink_validate(struct phylink_config *config,
 		phylink_generic_validate(config, supported, state);
 }
 
-static void dsa_port_phylink_mac_pcs_get_state(struct phylink_config *config,
-					       struct phylink_link_state *state)
-{
-	struct dsa_port *dp = container_of(config, struct dsa_port, pl_config);
-	struct dsa_switch *ds = dp->ds;
-	int err;
-
-	/* Only called for inband modes */
-	if (!ds->ops->phylink_mac_link_state) {
-		state->link = 0;
-		return;
-	}
-
-	err = ds->ops->phylink_mac_link_state(ds, dp->index, state);
-	if (err < 0) {
-		dev_err(ds->dev, "p%d: phylink_mac_link_state() failed: %d\n",
-			dp->index, err);
-		state->link = 0;
-	}
-}
-
 static struct phylink_pcs *
 dsa_port_phylink_mac_select_pcs(struct phylink_config *config,
 				phy_interface_t interface)
@@ -1646,17 +1625,6 @@ static int dsa_port_phylink_mac_finish(struct phylink_config *config,
 	return err;
 }
 
-static void dsa_port_phylink_mac_an_restart(struct phylink_config *config)
-{
-	struct dsa_port *dp = container_of(config, struct dsa_port, pl_config);
-	struct dsa_switch *ds = dp->ds;
-
-	if (!ds->ops->phylink_mac_an_restart)
-		return;
-
-	ds->ops->phylink_mac_an_restart(ds, dp->index);
-}
-
 static void dsa_port_phylink_mac_link_down(struct phylink_config *config,
 					   unsigned int mode,
 					   phy_interface_t interface)
@@ -1700,11 +1668,9 @@ static void dsa_port_phylink_mac_link_up(struct phylink_config *config,
 static const struct phylink_mac_ops dsa_port_phylink_mac_ops = {
 	.validate = dsa_port_phylink_validate,
 	.mac_select_pcs = dsa_port_phylink_mac_select_pcs,
-	.mac_pcs_get_state = dsa_port_phylink_mac_pcs_get_state,
 	.mac_prepare = dsa_port_phylink_mac_prepare,
 	.mac_config = dsa_port_phylink_mac_config,
 	.mac_finish = dsa_port_phylink_mac_finish,
-	.mac_an_restart = dsa_port_phylink_mac_an_restart,
 	.mac_link_down = dsa_port_phylink_mac_link_down,
 	.mac_link_up = dsa_port_phylink_mac_link_up,
 };
@@ -1720,13 +1686,6 @@ int dsa_port_phylink_create(struct dsa_port *dp)
 	if (err)
 		mode = PHY_INTERFACE_MODE_NA;
 
-	/* Presence of phylink_mac_link_state or phylink_mac_an_restart is
-	 * an indicator of a legacy phylink driver.
-	 */
-	if (ds->ops->phylink_mac_link_state ||
-	    ds->ops->phylink_mac_an_restart)
-		dp->pl_config.legacy_pre_march2020 = true;
-
 	if (ds->ops->phylink_get_caps)
 		ds->ops->phylink_get_caps(ds, dp->index, &dp->pl_config);
 
-- 
2.30.2



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50150D3B7CA
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 09:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/SaYN5ixsZSGbz+KRnlynR+PwAA7B1T3Unbav9zZD0=; b=lT3oRrVBodxU0OuUCWtWFSNLvE
	wCMR5cPdFK58cGjVCIxVeTk65pG+rnASUuTr7ES0EZXBbqqsV3x/IqwkTh/4HWvkJTyNwf9+lojnq
	mej0ujVWkgrcIZikNCvnuUSnIEVPSP5iD5hCaP6XFP/+Vqn/1UpxtoCUqzAelj8PYkyqsILc7XhLU
	7QjyPPaCaKze4D7anJfUJLprilOGWpXcn+VqtSN/jZvjNW5dWVpzYPWLUXb9bjw/FotVDGTZusN3i
	i5eW2VyOXwMKACwZ5KpoR8xvqa0vfSvnRUh+y+IfjBRigli8lQgUieLkuydaVYg8rGEhlp/OEsSjh
	r0IHjm9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs09-0000000AB7r-1t0I;
	Tue, 26 Nov 2024 09:36:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFros-0000000A8aZ-3WCO;
	Tue, 26 Nov 2024 09:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d/SaYN5ixsZSGbz+KRnlynR+PwAA7B1T3Unbav9zZD0=; b=JmL4qWR8VpO2j/Csq6xn4np/Mk
	RksAJu2UIme7abwllYaKbsy75cpQ51onBnYlQ0hE0dWxCP4AOc4f/kO2A5StcQdDpSaFRWxKNzxP3
	8r7SRFsnAn7iYQLeO3julsMfpQEBr+i+5uWpix+K05vcsiSk1CNUzpk3SJhZQeikG/5AFP3sLtoIe
	vB6ewzMMd9ExR64ysc/XOhk2qqK4wo4AK3vrteTQoG21YjiPgsm718uMc/Um5YxsnPw1PqeaeT8fE
	ORFp66FQy2BKfU/Qm8+ZoK4ZQMY68XGxi8scdnWSN8waX81vXeXId6UCLrRCukrthvH044LsSQqO2
	dMZbJS9A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48388 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFroi-0006Ue-09;
	Tue, 26 Nov 2024 09:25:08 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFrog-005xQY-LH; Tue, 26 Nov 2024 09:25:06 +0000
In-Reply-To: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 10/16] net: mvneta: implement pcs_inband_caps()
 method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFrog-005xQY-LH@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:25:06 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012518_878060_EEC9950E 
X-CRM114-Status: GOOD (  14.26  )
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

Report the PCS in-band capabilities to phylink for Marvell NETA
interfaces.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/marvell/mvneta.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 1fb285fa0bdb..fe6261b81540 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -3960,20 +3960,27 @@ static struct mvneta_port *mvneta_pcs_to_port(struct phylink_pcs *pcs)
 	return container_of(pcs, struct mvneta_port, phylink_pcs);
 }
 
-static int mvneta_pcs_validate(struct phylink_pcs *pcs,
-			       unsigned long *supported,
-			       const struct phylink_link_state *state)
+static unsigned int mvneta_pcs_inband_caps(struct phylink_pcs *pcs,
+					   phy_interface_t interface)
 {
-	/* We only support QSGMII, SGMII, 802.3z and RGMII modes.
-	 * When in 802.3z mode, we must have AN enabled:
+	/* When operating in an 802.3z mode, we must have AN enabled:
 	 * "Bit 2 Field InBandAnEn In-band Auto-Negotiation enable. ...
 	 * When <PortType> = 1 (1000BASE-X) this field must be set to 1."
+	 * Therefore, inband is "required".
 	 */
-	if (phy_interface_mode_is_8023z(state->interface) &&
-	    !phylink_test(state->advertising, Autoneg))
-		return -EINVAL;
+	if (phy_interface_mode_is_8023z(interface))
+		return LINK_INBAND_ENABLE;
 
-	return 0;
+	/* QSGMII, SGMII and RGMII can be configured to use inband
+	 * signalling of the AN result. Indicate these as "possible".
+	 */
+	if (interface == PHY_INTERFACE_MODE_SGMII ||
+	    interface == PHY_INTERFACE_MODE_QSGMII ||
+	    phy_interface_mode_is_rgmii(interface))
+		return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
+
+	/* For any other modes, indicate that inband is not supported. */
+	return LINK_INBAND_DISABLE;
 }
 
 static void mvneta_pcs_get_state(struct phylink_pcs *pcs,
@@ -4071,7 +4078,7 @@ static void mvneta_pcs_an_restart(struct phylink_pcs *pcs)
 }
 
 static const struct phylink_pcs_ops mvneta_phylink_pcs_ops = {
-	.pcs_validate = mvneta_pcs_validate,
+	.pcs_inband_caps = mvneta_pcs_inband_caps,
 	.pcs_get_state = mvneta_pcs_get_state,
 	.pcs_config = mvneta_pcs_config,
 	.pcs_an_restart = mvneta_pcs_an_restart,
-- 
2.30.2



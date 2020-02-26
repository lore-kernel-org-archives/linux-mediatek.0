Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45C3C4BA0E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:27:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7234024673
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:27:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jri6Bf0y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KmVgZMAe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7234024673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:To
	:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NltA7/e9FyjZGmNoBWSbOhUkgvESEjaECSvAxf+3K5U=; b=jri6Bf0y1dvTNg
	0Z/jQmTctKtUS8uZ89L/MU1NLyAiFV4QJjTsYHWVywaYsD8Jo+4VnIJ6hclnT4rPeMQwy3wKAFYIC
	BztAf9kBVGglJYtp3SFuX9aQqLFnNm6gpqElnsoh2jE2g1JYin/2nhem81KSJ+YR4fsBXNzx6sTj8
	7b4P5L9jUSs5ux2CQxAn1dNap1EFt14CEEKD7Gh3HxQUfAGt0h77Ot6dtYyTPeUGUg2ksrOCKI9Tj
	JdG1uHkddsWI36EcqjkgEGWZnnsl/OBpdrVSens/19aRvBVgV70xkmYVdejcQZGl/C152lIWMq4xs
	rZ30NuFy+US/TpzZz8/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6tu7-0007Xw-QI; Wed, 26 Feb 2020 10:26:59 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6ttf-00071w-W2; Wed, 26 Feb 2020 10:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MvXRdKBQwWqpifCLpYCrvOQkEY6QAL9CbEYBlFLaB2Y=; b=KmVgZMAe1fxE5Zxf2Nc/df2ey4
 2APSIzPFVDdLPw8mC7f86bqQM/c5D3hECwLr91/OCaBMXKuXU7OETLtn4B8KAS3bXa3WQc0786zns
 sEDKiLsCh/nsIDeIqunmIMx4pcSY4NQ5Z+NqyyJa+a8m1C0IACnoe9+t4YVe5eWjbrItewvVGhX9f
 gYf/U+8ty23700lBYbzNDK+VcEuOoi98zHiUmmW17IVFBKh99vK/ErW1DfEU3uggDYZLZdjozZyFS
 4M7n23vNcTnrJ3xBiBvIyi1qbmpI6TZUm+09R1W5jxY00P3KaZvFx2nHdsxgKK9AMwb/879NluvDD
 E9xSSyRQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41412 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trX-0006sO-Gc; Wed, 26 Feb 2020 10:24:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trQ-0003Gu-1G; Wed, 26 Feb 2020 10:24:12 +0000
In-Reply-To: <20200226102312.GX25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 7/8] net: mvneta: use resolved link config in
 mac_link_up()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1j6trQ-0003Gu-1G@rmk-PC.armlinux.org.uk>
Date: Wed, 26 Feb 2020 10:24:12 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_022632_197825_3A15FB51 
X-CRM114-Status: GOOD (  10.69  )
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

Convert the Marvell mvneta ethernet driver to use the finalised link
parameters in mac_link_up() rather than the parameters in mac_config().

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/marvell/mvneta.c | 55 ++++++++++++++++++---------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 9af3f8d5b289..b22eeb5f8700 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -3830,13 +3830,9 @@ static void mvneta_mac_config(struct phylink_config *config, unsigned int mode,
 	new_clk = gmac_clk & ~MVNETA_GMAC_1MS_CLOCK_ENABLE;
 	new_an = gmac_an & ~(MVNETA_GMAC_INBAND_AN_ENABLE |
 			     MVNETA_GMAC_INBAND_RESTART_AN |
-			     MVNETA_GMAC_CONFIG_MII_SPEED |
-			     MVNETA_GMAC_CONFIG_GMII_SPEED |
 			     MVNETA_GMAC_AN_SPEED_EN |
 			     MVNETA_GMAC_ADVERT_SYM_FLOW_CTRL |
-			     MVNETA_GMAC_CONFIG_FLOW_CTRL |
 			     MVNETA_GMAC_AN_FLOW_CTRL_EN |
-			     MVNETA_GMAC_CONFIG_FULL_DUPLEX |
 			     MVNETA_GMAC_AN_DUPLEX_EN);
 
 	/* Even though it might look weird, when we're configured in
@@ -3851,24 +3847,20 @@ static void mvneta_mac_config(struct phylink_config *config, unsigned int mode,
 
 	if (phylink_test(state->advertising, Pause))
 		new_an |= MVNETA_GMAC_ADVERT_SYM_FLOW_CTRL;
-	if (state->pause & MLO_PAUSE_TXRX_MASK)
-		new_an |= MVNETA_GMAC_CONFIG_FLOW_CTRL;
 
 	if (!phylink_autoneg_inband(mode)) {
-		/* Phy or fixed speed */
-		if (state->duplex)
-			new_an |= MVNETA_GMAC_CONFIG_FULL_DUPLEX;
-
-		if (state->speed == SPEED_1000 || state->speed == SPEED_2500)
-			new_an |= MVNETA_GMAC_CONFIG_GMII_SPEED;
-		else if (state->speed == SPEED_100)
-			new_an |= MVNETA_GMAC_CONFIG_MII_SPEED;
+		/* Phy or fixed speed - nothing to do, leave the
+		 * configured speed, duplex and flow control as-is.
+		 */
 	} else if (state->interface == PHY_INTERFACE_MODE_SGMII) {
 		/* SGMII mode receives the state from the PHY */
 		new_ctrl2 |= MVNETA_GMAC2_INBAND_AN_ENABLE;
 		new_clk |= MVNETA_GMAC_1MS_CLOCK_ENABLE;
 		new_an = (new_an & ~(MVNETA_GMAC_FORCE_LINK_DOWN |
-				     MVNETA_GMAC_FORCE_LINK_PASS)) |
+				     MVNETA_GMAC_FORCE_LINK_PASS |
+				     MVNETA_GMAC_CONFIG_MII_SPEED |
+				     MVNETA_GMAC_CONFIG_GMII_SPEED |
+				     MVNETA_GMAC_CONFIG_FULL_DUPLEX)) |
 			 MVNETA_GMAC_INBAND_AN_ENABLE |
 			 MVNETA_GMAC_AN_SPEED_EN |
 			 MVNETA_GMAC_AN_DUPLEX_EN;
@@ -3877,7 +3869,8 @@ static void mvneta_mac_config(struct phylink_config *config, unsigned int mode,
 		new_ctrl0 |= MVNETA_GMAC0_PORT_1000BASE_X;
 		new_clk |= MVNETA_GMAC_1MS_CLOCK_ENABLE;
 		new_an = (new_an & ~(MVNETA_GMAC_FORCE_LINK_DOWN |
-				     MVNETA_GMAC_FORCE_LINK_PASS)) |
+				     MVNETA_GMAC_FORCE_LINK_PASS |
+				     MVNETA_GMAC_CONFIG_MII_SPEED)) |
 			 MVNETA_GMAC_INBAND_AN_ENABLE |
 			 MVNETA_GMAC_CONFIG_GMII_SPEED |
 			 /* The MAC only supports FD mode */
@@ -3977,8 +3970,36 @@ static void mvneta_mac_link_up(struct phylink_config *config,
 
 	if (!phylink_autoneg_inband(mode)) {
 		val = mvreg_read(pp, MVNETA_GMAC_AUTONEG_CONFIG);
-		val &= ~MVNETA_GMAC_FORCE_LINK_DOWN;
+		val &= ~(MVNETA_GMAC_FORCE_LINK_DOWN |
+			 MVNETA_GMAC_CONFIG_MII_SPEED |
+			 MVNETA_GMAC_CONFIG_GMII_SPEED |
+			 MVNETA_GMAC_CONFIG_FLOW_CTRL |
+			 MVNETA_GMAC_CONFIG_FULL_DUPLEX);
 		val |= MVNETA_GMAC_FORCE_LINK_PASS;
+
+		if (speed == SPEED_1000 || speed == SPEED_2500)
+			val |= MVNETA_GMAC_CONFIG_GMII_SPEED;
+		else if (speed == SPEED_100)
+			val |= MVNETA_GMAC_CONFIG_MII_SPEED;
+
+		if (duplex == DUPLEX_FULL)
+			val |= MVNETA_GMAC_CONFIG_FULL_DUPLEX;
+
+		if (tx_pause || rx_pause)
+			val |= MVNETA_GMAC_CONFIG_FLOW_CTRL;
+
+		mvreg_write(pp, MVNETA_GMAC_AUTONEG_CONFIG, val);
+	} else {
+		/* When inband doesn't cover flow control or flow control is
+		 * disabled, we need to manually configure it. This bit will
+		 * only have effect if MVNETA_GMAC_AN_FLOW_CTRL_EN is unset.
+		 */
+		val = mvreg_read(pp, MVNETA_GMAC_AUTONEG_CONFIG);
+		val &= ~MVNETA_GMAC_CONFIG_FLOW_CTRL;
+
+		if (tx_pause || rx_pause)
+			val |= MVNETA_GMAC_CONFIG_FLOW_CTRL;
+
 		mvreg_write(pp, MVNETA_GMAC_AUTONEG_CONFIG, val);
 	}
 
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

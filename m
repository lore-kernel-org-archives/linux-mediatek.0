Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D28C35DFB
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 09:41:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 271FC21927
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 09:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tAjY91So";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="yUVsWTn9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 271FC21927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:To
	:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VW0Dk3ISyc/RDBMQpJ5kLwK1hHW934GWnFNNOo3crZ8=; b=tAjY91SoIzyGoW
	F6gTe6Mez0ncD9ROWNNRzfXmD09Q8mxDudEt+TeB5PxQFOF5zsBaEAqLFvKxRJ2dfNFmtbIiWSl/x
	ousmJQwLEi613SpT2eA2VR15BooWkjxyi6QhX9sa6UQy1VuPpz9WCZp/FYXDJHgliuokJJ35rA4Rr
	fRMKRu+VKQZB4wF7JA++izVrUM9wcEcQ5iCja20w24PhWQHbEVq7dEK3nj+LW9E9kCfhRQ72sgs0r
	mjGq5H99btGGDiaKZadpgwO6dR2UZiGNmw9/M6jzOJo6OHm5a7DAWvNBL9EGe8Fuy4qSKVl0gwUKi
	aXh9XyXLuiNOcJrq5RnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6WiB-00077x-VV; Tue, 25 Feb 2020 09:41:07 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Wi1-0006nW-Dv; Tue, 25 Feb 2020 09:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fa4NZv5nNOs4Sh5tsn/w+0iIu7F1BQDsZ/B6zmpXUBw=; b=yUVsWTn96lhnki6+QXTztZ1txU
 iQTuFnPvavfgoeM7wX6AlQpZvqRcmNiiFRsTOP12rWpglRjvdY0qWHD+0yczZG6CW5AR/PEXPzrM8
 OY5+sJaf26d36FM36F32RxqnAJURuji8NKedWgmK3L0rbTtESYPEKAWn53Jim/L/JBsuzCcxJsbOs
 x3RoyEmCtl6wrgbAV7VsGvZAwXCTaaCe75Dt43C2pvYlSPMCq0jDFfRHEmCKIWt6k8NVamY9uaFLc
 C3ANgAWauj/Hl8vYZib5AQlKrdXyfd55L85LQZvrdV0vZOLHAL7O+OEz9VOKekBBLKq9gHX2CeQvB
 8fEuDVZA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:51282 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6Wg8-0008P5-Ok; Tue, 25 Feb 2020 09:39:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6Wg6-0000T3-3n; Tue, 25 Feb 2020 09:38:58 +0000
In-Reply-To: <20200225093703.GS25745@shell.armlinux.org.uk>
References: <20200225093703.GS25745@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 3/8] net: mv88e6xxx: use resolved link config in
 mac_link_up()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1j6Wg6-0000T3-3n@rmk-PC.armlinux.org.uk>
Date: Tue, 25 Feb 2020 09:38:58 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_014057_472228_5C57CF12 
X-CRM114-Status: GOOD (  13.10  )
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

Use the resolved link configuration to set the MAC configuration when
mac_link_up() for non-internal-PHY ports.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 75 +++++++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 16 deletions(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index fef3b5e0b291..4a4173e63fa5 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -632,25 +632,30 @@ static void mv88e6xxx_mac_config(struct dsa_switch *ds, int port,
 		dev_err(ds->dev, "p%d: failed to configure MAC\n", port);
 }
 
-static void mv88e6xxx_mac_link_force(struct dsa_switch *ds, int port, int link)
+static void mv88e6xxx_mac_link_down(struct dsa_switch *ds, int port,
+				    unsigned int mode,
+				    phy_interface_t interface)
 {
 	struct mv88e6xxx_chip *chip = ds->priv;
-	int err;
+	const struct mv88e6xxx_ops *ops;
+	int err = 0;
 
-	mv88e6xxx_reg_lock(chip);
-	err = chip->info->ops->port_set_link(chip, port, link);
-	mv88e6xxx_reg_unlock(chip);
+	ops = chip->info->ops;
 
-	if (err)
-		dev_err(chip->dev, "p%d: failed to force MAC link\n", port);
-}
+	/* Internal PHYs propagate their configuration directly to the MAC.
+	 * External PHYs depend on whether the PPU is enabled for this port.
+	 * FIXME: we should be using the PPU enable state here. What about
+	 * an automedia port?
+	 */
+	if (!mv88e6xxx_phy_is_internal(ds, port) && ops->port_set_link) {
+		mv88e6xxx_reg_lock(chip);
+		err = ops->port_set_link(chip, port, LINK_FORCED_DOWN);
+		mv88e6xxx_reg_unlock(chip);
 
-static void mv88e6xxx_mac_link_down(struct dsa_switch *ds, int port,
-				    unsigned int mode,
-				    phy_interface_t interface)
-{
-	if (mode == MLO_AN_FIXED)
-		mv88e6xxx_mac_link_force(ds, port, LINK_FORCED_DOWN);
+		if (err)
+			dev_err(chip->dev,
+				"p%d: failed to force MAC link down\n", port);
+	}
 }
 
 static void mv88e6xxx_mac_link_up(struct dsa_switch *ds, int port,
@@ -659,8 +664,46 @@ static void mv88e6xxx_mac_link_up(struct dsa_switch *ds, int port,
 				  int speed, int duplex,
 				  bool tx_pause, bool rx_pause)
 {
-	if (mode == MLO_AN_FIXED)
-		mv88e6xxx_mac_link_force(ds, port, LINK_FORCED_UP);
+	struct mv88e6xxx_chip *chip = ds->priv;
+	const struct mv88e6xxx_ops *ops;
+	int err = 0;
+
+	ops = chip->info->ops;
+
+	/* Internal PHYs propagate their configuration directly to the MAC.
+	 * External PHYs depend on whether the PPU is enabled for this port.
+	 * FIXME: we should be using the PPU enable state here. What about
+	 * an automedia port?
+	 */
+	if (!mv88e6xxx_phy_is_internal(ds, port)) {
+		mv88e6xxx_reg_lock(chip);
+		/* FIXME: for an automedia port, should we force the link
+		 * down here - what if the link comes up due to "other" media
+		 * while we're bringing the port up, how is the exclusivity
+		 * handled in the Marvell hardware? E.g. port 4 on 88E6532
+		 * shared between internal PHY and Serdes.
+		 */
+		if (ops->port_set_speed) {
+			err = ops->port_set_speed(chip, port, speed);
+			if (err && err != -EOPNOTSUPP)
+				goto error;
+		}
+
+		if (ops->port_set_duplex) {
+			err = ops->port_set_duplex(chip, port, duplex);
+			if (err && err != -EOPNOTSUPP)
+				goto error;
+		}
+
+		if (ops->port_set_link)
+			err = ops->port_set_link(chip, port, LINK_FORCED_UP);
+error:
+		mv88e6xxx_reg_unlock(chip);
+
+		if (err && err != -EOPNOTSUPP)
+			dev_err(ds->dev,
+				"p%d: failed to configure MAC link up\n", port);
+	}
 }
 
 static int mv88e6xxx_stats_snapshot(struct mv88e6xxx_chip *chip, int port)
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

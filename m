Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E548C4BA0E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:28:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D782420801
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:28:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XA7pMSDB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="hPTGRzY1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D782420801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:To
	:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmTSAEHeEzXfeAAihFJ5/Ou/H6OVZotL9RvWcGVticM=; b=XA7pMSDBDSRkNz
	jGvQMW7h3Mih2p24yUDZiTPq9o88q/ux8qMZtZ/xq7SowTcwXvMgQQAECH4qoX+CJiz7mzLAk03Nw
	1FeLMh9GEeiVOYd7l2a9Xtk0a57xtei9K0eAU4FNgLz2anMT+dnZAlBBzl1YiAQQ6OsR3Gcyq0p8i
	sgvbmy4jTRYGvEfkCzTgIEwqO1edNsPASDv0bcwQkpsyR3f/vg+CTh+Bc1+0tfOzijvIr9epmAkJ6
	B8lGETv5gns2TogaZF46TS/Up8ieeGXeRR63btqBp2YTCTm4ipVNO00H6ZFtd1YOluBIE9ap++/Tj
	kbwwMangFWyPwziAlqkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6tvl-0000cc-GU; Wed, 26 Feb 2020 10:28:41 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6tvP-00070w-Kv; Wed, 26 Feb 2020 10:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MaXmveAEbocIrvzuxQzVYXJgzwA3f1xZm8m+avj8bxY=; b=hPTGRzY1xDXXmPUrCqSVc+0YCx
 smrhkuvCyTZ0SxSWcxZHeeVThrFwBORyq6kWAGVgQQO0pWPGDSbmZsLlytC+CEz1N+XgnKHwPaXx4
 tlzkMBszGiEuecymD85kj+vflZvU4MbtdsdIwcQQ7a0OckiyYl2MKryEeUrIiLvjILAzVq2xK+GL1
 AAp4trnP0DhvzD4uMaYYqF6jGJXigmF2IgDb0/Bjdi+sbv5ViwInQSp1OGx7VDRXzVvd4Wlos3Yk/
 3KnHvconU9mf3fBnui+w/c6F7P+ZHgC7BDOxFUONzNBFyuSc7a8Oj+VTMVc9VCug6/FZKGEwPzV1r
 ryRxn0gw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:33272 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trK-0006sC-T1; Wed, 26 Feb 2020 10:24:07 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trF-0003Gg-QH; Wed, 26 Feb 2020 10:24:01 +0000
In-Reply-To: <20200226102312.GX25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 5/8] net: dpaa2-mac: use resolved link config in
 mac_link_up()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1j6trF-0003Gg-QH@rmk-PC.armlinux.org.uk>
Date: Wed, 26 Feb 2020 10:24:01 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_022819_699065_AB283180 
X-CRM114-Status: GOOD (  12.96  )
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
 linux-stm32@st-md-mailman.stormreply.com,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
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

Convert the DPAA2 ethernet driver to use the finalised link parameters
in mac_link_up() rather than the parameters in mac_config(), which are
more suited to the needs of the DPAA2 MC firmware than those available
via mac_config().

Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  | 54 +++++++++++--------
 .../net/ethernet/freescale/dpaa2/dpaa2-mac.h  |  1 +
 2 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
index 3a75c5b58f95..3ee236c5fc37 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
@@ -123,35 +123,16 @@ static void dpaa2_mac_config(struct phylink_config *config, unsigned int mode,
 	struct dpmac_link_state *dpmac_state = &mac->state;
 	int err;
 
-	if (state->speed != SPEED_UNKNOWN)
-		dpmac_state->rate = state->speed;
-
-	if (state->duplex != DUPLEX_UNKNOWN) {
-		if (!state->duplex)
-			dpmac_state->options |= DPMAC_LINK_OPT_HALF_DUPLEX;
-		else
-			dpmac_state->options &= ~DPMAC_LINK_OPT_HALF_DUPLEX;
-	}
-
 	if (state->an_enabled)
 		dpmac_state->options |= DPMAC_LINK_OPT_AUTONEG;
 	else
 		dpmac_state->options &= ~DPMAC_LINK_OPT_AUTONEG;
 
-	if (state->pause & MLO_PAUSE_RX)
-		dpmac_state->options |= DPMAC_LINK_OPT_PAUSE;
-	else
-		dpmac_state->options &= ~DPMAC_LINK_OPT_PAUSE;
-
-	if (!!(state->pause & MLO_PAUSE_RX) ^ !!(state->pause & MLO_PAUSE_TX))
-		dpmac_state->options |= DPMAC_LINK_OPT_ASYM_PAUSE;
-	else
-		dpmac_state->options &= ~DPMAC_LINK_OPT_ASYM_PAUSE;
-
 	err = dpmac_set_link_state(mac->mc_io, 0,
 				   mac->mc_dev->mc_handle, dpmac_state);
 	if (err)
-		netdev_err(mac->net_dev, "dpmac_set_link_state() = %d\n", err);
+		netdev_err(mac->net_dev, "%s: dpmac_set_link_state() = %d\n",
+			   __func__, err);
 }
 
 static void dpaa2_mac_link_up(struct phylink_config *config,
@@ -165,10 +146,37 @@ static void dpaa2_mac_link_up(struct phylink_config *config,
 	int err;
 
 	dpmac_state->up = 1;
+
+	if (mac->if_link_type == DPMAC_LINK_TYPE_PHY) {
+		/* If the DPMAC is configured for PHY mode, we need
+		 * to pass the link parameters to the MC firmware.
+		 */
+		dpmac_state->rate = speed;
+
+		if (duplex == DUPLEX_HALF)
+			dpmac_state->options |= DPMAC_LINK_OPT_HALF_DUPLEX;
+		else if (duplex == DUPLEX_FULL)
+			dpmac_state->options &= ~DPMAC_LINK_OPT_HALF_DUPLEX;
+
+		/* This is lossy; the firmware really should take the pause
+		 * enablement status rather than pause/asym pause status.
+		 */
+		if (rx_pause)
+			dpmac_state->options |= DPMAC_LINK_OPT_PAUSE;
+		else
+			dpmac_state->options &= ~DPMAC_LINK_OPT_PAUSE;
+
+		if (rx_pause ^ tx_pause)
+			dpmac_state->options |= DPMAC_LINK_OPT_ASYM_PAUSE;
+		else
+			dpmac_state->options &= ~DPMAC_LINK_OPT_ASYM_PAUSE;
+	}
+
 	err = dpmac_set_link_state(mac->mc_io, 0,
 				   mac->mc_dev->mc_handle, dpmac_state);
 	if (err)
-		netdev_err(mac->net_dev, "dpmac_set_link_state() = %d\n", err);
+		netdev_err(mac->net_dev, "%s: dpmac_set_link_state() = %d\n",
+			   __func__, err);
 }
 
 static void dpaa2_mac_link_down(struct phylink_config *config,
@@ -241,6 +249,8 @@ int dpaa2_mac_connect(struct dpaa2_mac *mac)
 		goto err_close_dpmac;
 	}
 
+	mac->if_link_type = attr.link_type;
+
 	dpmac_node = dpaa2_mac_get_node(attr.id);
 	if (!dpmac_node) {
 		netdev_err(net_dev, "No dpmac@%d node found.\n", attr.id);
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h
index 4da8079b9155..2130d9c7d40e 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h
@@ -20,6 +20,7 @@ struct dpaa2_mac {
 	struct phylink_config phylink_config;
 	struct phylink *phylink;
 	phy_interface_t if_mode;
+	enum dpmac_link_type if_link_type;
 };
 
 bool dpaa2_mac_is_type_fixed(struct fsl_mc_device *dpmac_dev,
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

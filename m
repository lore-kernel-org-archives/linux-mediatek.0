Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_RHS_DOB autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B08C4BA0E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:30:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2DD20801
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3aF3kQK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WGKMf57M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC2DD20801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:To
	:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTqFqz8LcxbCVmIEcskyae6P8mX/rrhNyX0dBke0knA=; b=b3aF3kQKeN127b
	QClbV3I3cAR5xlFb7jOUDnDVAyBC0v2lPZc6UUo8VVttOYNFxVZdG8FvxePQVLLlUsYjdvhGQeArV
	IpdyYL1SvOczAazVn/8RG4dvoeSRxMg08SX1mml1PnGGtCUD+d/srpNbDAcEWNjtpfd+SOZkCjK0h
	l0d/SGFYKyruaHcBsIppd+nZ1TvDZgZWZHBTq34UE9NwZGnO0zXrAsWUfABj/5t4thKh8rfZmTd1W
	CbVsckVKts2oibr7rqTqMvl5gxithFQAWjvjkZXrp1P5NdTcq1Kwfbq/5yn7ChfHVm3N2oijdKBdx
	mlHJn1AMSW9MCKAmuUVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6tx1-0000vZ-Ad; Wed, 26 Feb 2020 10:29:59 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6twn-0000mb-ST; Wed, 26 Feb 2020 10:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U2C389YDD9wIDLDhBEkkx1b5Jtw0Ypfhi+Dyxt33wDk=; b=WGKMf57M3uxeuGnW4MA5OtZ20w
 uVwwaa6C70SGiNKDzeRkKRcNtZ2mdzb2K/xNCN1DTQrUV1WnnEC37KZDPXdnUkpRkM4Zt6VTzWN7O
 xfEDKGbYGt9aozHA+lCnzlLrLu8u9SY99N2s778TcN/S+JSwRc5bLpK8zWV4zA8zGVNPEf0TQWqDi
 auP4RuavaH54f6zHu9AJAJG+jRFCk682Dn/8xQPQVRNF+Ptwu8Lf483CkX3NbIn5ZZU7qteqpcIAG
 p3lBrUgCKT7RAIwvefbYvaq8XVqcpCDtGxVgFSqLEm2RHe6iOlYILuGThsyFeWtpyhs0Ow0b7uZP6
 qjWhxV7w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41410 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trR-0006sI-A0; Wed, 26 Feb 2020 10:24:13 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trK-0003Gn-Ta; Wed, 26 Feb 2020 10:24:06 +0000
In-Reply-To: <20200226102312.GX25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 6/8] net: macb: use resolved link config in
 mac_link_up()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1j6trK-0003Gn-Ta@rmk-PC.armlinux.org.uk>
Date: Wed, 26 Feb 2020 10:24:06 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_022945_929141_485DC470 
X-CRM114-Status: GOOD (  11.84  )
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

Convert the macb ethernet driver to use the finalised link
parameters in mac_link_up() rather than the parameters in mac_config().

Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/cadence/macb.h      |  1 -
 drivers/net/ethernet/cadence/macb_main.c | 50 ++++++++++++++----------
 2 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index a3f0f27fc79a..ab827fb4b6b9 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1200,7 +1200,6 @@ struct macb {
 	unsigned int		dma_burst_length;
 
 	phy_interface_t		phy_interface;
-	int			speed;
 
 	/* AT91RM9200 transmit */
 	struct sk_buff *skb;			/* holds skb until xmit interrupt completes */
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 7ab0bef5e1bd..3a7c26b08607 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -571,37 +571,20 @@ static void macb_mac_config(struct phylink_config *config, unsigned int mode,
 
 	old_ctrl = ctrl = macb_or_gem_readl(bp, NCFGR);
 
-	/* Clear all the bits we might set later */
-	ctrl &= ~(MACB_BIT(SPD) | MACB_BIT(FD) | MACB_BIT(PAE));
-
 	if (bp->caps & MACB_CAPS_MACB_IS_EMAC) {
 		if (state->interface == PHY_INTERFACE_MODE_RMII)
 			ctrl |= MACB_BIT(RM9200_RMII);
 	} else {
-		ctrl &= ~(GEM_BIT(GBE) | GEM_BIT(SGMIIEN) | GEM_BIT(PCSSEL));
-
-		/* We do not support MLO_PAUSE_RX yet */
-		if (state->pause & MLO_PAUSE_TX)
-			ctrl |= MACB_BIT(PAE);
+		ctrl &= ~(GEM_BIT(SGMIIEN) | GEM_BIT(PCSSEL));
 
 		if (state->interface == PHY_INTERFACE_MODE_SGMII)
 			ctrl |= GEM_BIT(SGMIIEN) | GEM_BIT(PCSSEL);
 	}
 
-	if (state->speed == SPEED_1000)
-		ctrl |= GEM_BIT(GBE);
-	else if (state->speed == SPEED_100)
-		ctrl |= MACB_BIT(SPD);
-
-	if (state->duplex)
-		ctrl |= MACB_BIT(FD);
-
 	/* Apply the new configuration, if any */
 	if (old_ctrl ^ ctrl)
 		macb_or_gem_writel(bp, NCFGR, ctrl);
 
-	bp->speed = state->speed;
-
 	spin_unlock_irqrestore(&bp->lock, flags);
 }
 
@@ -635,10 +618,33 @@ static void macb_mac_link_up(struct phylink_config *config,
 	struct net_device *ndev = to_net_dev(config->dev);
 	struct macb *bp = netdev_priv(ndev);
 	struct macb_queue *queue;
+	unsigned long flags;
 	unsigned int q;
+	u32 ctrl;
+
+	spin_lock_irqsave(&bp->lock, flags);
+
+	ctrl = macb_or_gem_readl(bp, NCFGR);
+
+	ctrl &= ~(MACB_BIT(SPD) | MACB_BIT(FD));
+
+	if (speed == SPEED_100)
+		ctrl |= MACB_BIT(SPD);
+
+	if (duplex)
+		ctrl |= MACB_BIT(FD);
 
 	if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC)) {
-		macb_set_tx_clk(bp->tx_clk, bp->speed, ndev);
+		ctrl &= ~(GEM_BIT(GBE) | MACB_BIT(PAE));
+
+		if (speed == SPEED_1000)
+			ctrl |= GEM_BIT(GBE);
+
+		/* We do not support MLO_PAUSE_RX yet */
+		if (tx_pause)
+			ctrl |= MACB_BIT(PAE);
+
+		macb_set_tx_clk(bp->tx_clk, speed, ndev);
 
 		/* Initialize rings & buffers as clearing MACB_BIT(TE) in link down
 		 * cleared the pipeline and control registers.
@@ -651,6 +657,10 @@ static void macb_mac_link_up(struct phylink_config *config,
 				     bp->rx_intr_mask | MACB_TX_INT_FLAGS | MACB_BIT(HRESP));
 	}
 
+	macb_or_gem_writel(bp, NCFGR, ctrl);
+
+	spin_unlock_irqrestore(&bp->lock, flags);
+
 	/* Enable Rx and Tx */
 	macb_writel(bp, NCR, macb_readl(bp, NCR) | MACB_BIT(RE) | MACB_BIT(TE));
 
@@ -4432,8 +4442,6 @@ static int macb_probe(struct platform_device *pdev)
 	else
 		bp->phy_interface = interface;
 
-	bp->speed = SPEED_UNKNOWN;
-
 	/* IP specific init */
 	err = init(pdev);
 	if (err)
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

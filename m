Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6D2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+kFDMa365AHhZDT19KlGfml31/jAYTEOSu3nZmGrBcc=; b=hyQwtjSHtz2FiA
	1cfePt9UDpPv0zHTLDxPdD5ePDIcvZNdVEH/JfLxNzpmFS45mVB4KDWr2Gg2DDBeAjJQs9+qFO7EQ
	/5YUTx+VZiL9ZckBTdl/LXQvIo8xyXMUOMIB0LtIwqen2vCHXasrMH1wgvh8BJsq3lwynFSvYqFZG
	uNlFIeLEEWMeq/Rm0veI3RD32j8ByitKYchWTdvcbMCwbj+u/AdJkJ5jeexAkDfAfIWI3xzB5B2Pm
	7Hpel3UmYxDrItA/0hoH0omZHhYzTgvXYh43cTHf5NDBO/NcoRamLyKN+Mrk3eYbcEU4+20u/pQir
	oMOIj/uFc8zsL5O6ZhVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvJFA-00G26c-Pb; Thu, 09 Dec 2021 13:13:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvJDH-00G1Ba-M8; Thu, 09 Dec 2021 13:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JKvS/KA14bcpSgUA0JDFH8tgXL0cy7KsRvDRqDxv9eQ=; b=hl1fdooh6TFALQW2yf+pby5YLM
 ulIJUGrNMFaIRfX+kKvJ+7YBJYTR9Vf4RItojfniKHyp++baKcSCxFW7dChRxIrLuY/m0LfKTJauV
 ORZxhOsXbMaFTsa2WDOSdpBvwaGKEa656ODOrdnBGk9p/W678LSYq6X8kM3FOMJ63gcCqGLar/cUZ
 lk+pinuPnYofNwPG04AIJBaq10ln6FeR0QrB4saXWISAc+nbdf5q0k5DSRYNkqZBKMQkaEdOqFTnI
 JsmJDbcjYTYaPuSabWvzhLzPubqKG7AHoZNyUrJrs9opMgl4DhZbR5qgK6T/zCxvlA0C5bbbwhwe4
 KcO2MP1Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45536 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mvJDF-0008Ta-Qb; Thu, 09 Dec 2021 13:11:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mvJDF-00F94F-CI; Thu, 09 Dec 2021 13:11:53 +0000
In-Reply-To: <Ya+DGaGmGgWrlVkW@shell.armlinux.org.uk>
References: <Ya+DGaGmGgWrlVkW@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 5/5] net: ag71xx: remove unnecessary legacy methods
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mvJDF-00F94F-CI@rmk-PC.armlinux.org.uk>
Date: Thu, 09 Dec 2021 13:11:53 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_051155_788810_79D0A1F0 
X-CRM114-Status: GOOD (  11.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

ag71xx may have a PCS, but it does not appear to support configuration
of the PCS in the current code. The functions to get its state merely
report that the link is down, and the AN restart function is empty.

Since neither of these functions will be called unless phylink's legacy
flag is set, we can safely remove these functions and indicate this is
a modern driver.

Should PCS support be added later, it will need to be modelled using
the phylink_pcs support rather than operating as a legacy driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Resent with the correct cover-letter message-ID.

 drivers/net/ethernet/atheros/ag71xx.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index ff924f06581e..270c2935591b 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1024,17 +1024,6 @@ static void ag71xx_mac_config(struct phylink_config *config, unsigned int mode,
 	ag71xx_wr(ag, AG71XX_REG_FIFO_CFG3, ag->fifodata[2]);
 }
 
-static void ag71xx_mac_pcs_get_state(struct phylink_config *config,
-				     struct phylink_link_state *state)
-{
-	state->link = 0;
-}
-
-static void ag71xx_mac_an_restart(struct phylink_config *config)
-{
-	/* Not Supported */
-}
-
 static void ag71xx_mac_link_down(struct phylink_config *config,
 				 unsigned int mode, phy_interface_t interface)
 {
@@ -1098,8 +1087,6 @@ static void ag71xx_mac_link_up(struct phylink_config *config,
 
 static const struct phylink_mac_ops ag71xx_phylink_mac_ops = {
 	.validate = phylink_generic_validate,
-	.mac_pcs_get_state = ag71xx_mac_pcs_get_state,
-	.mac_an_restart = ag71xx_mac_an_restart,
 	.mac_config = ag71xx_mac_config,
 	.mac_link_down = ag71xx_mac_link_down,
 	.mac_link_up = ag71xx_mac_link_up,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

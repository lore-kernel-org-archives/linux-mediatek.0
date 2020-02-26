Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E1EC4BA0B
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:26:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF23620801
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F9q5FIzy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="J8FV8fyS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF23620801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:To
	:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRG7syUruV1R7dt/1ChjRFb5mUlxnVUTYkuvT+4KyZ4=; b=F9q5FIzy7u3XkZ
	URLsTjF1SmLbkiKRGD3qrmCYG5uu3UOjIfWG6zrSRGIrFgJUaL92UeEIAeBLCcMYtg7lAQ8wXShCm
	ZVqi4gVP9WLLOe514RSMC4vIi5L5GYEpkFj7qo62kQk1kr48bNlwJKz2Yy0nHO0Ossp1ewJGXAxUC
	fAjV/ZHBHEncKwRKuq3sMqkMjyxgxxFLH1t9zcNr0lXV7cKpcf1n6q6+ZJ6bbYqlKkPsqdcxWjO4+
	FBjM4K6AmxIQ3zxrMD7zKVnNv+eWy235sYBaL6NPgrUhkSHNv7M6bIPszZdjBswelK3V7awO73M20
	TCijtMh+WOq4EpyAYpmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6ttf-0007CS-Nj; Wed, 26 Feb 2020 10:26:31 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6ttV-0006zS-FH; Wed, 26 Feb 2020 10:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d3VDUs9GECL3V7Id9j1fk72SoO2qfr/Dzvti38P06AQ=; b=J8FV8fyS1ttsVp0GQ36eDoPiNb
 Mes6da/zElmMSd5Zk9n+yzS1yO4cqVw4+gRRNg09hoLP9wjPrKamVbHPCxfPaHKNRR2dp6CJjY5OX
 Q6fifb4sOQyRVQ82QXKN7Wy0HvHn8F0wGzCLlgD+NmY6TKY8RxHpBIJUYIEfNjg5PVDlTEdLOakdN
 FrRicJVTheCEahj18Tc9/Zjbv6wjhlgIgCB30GNt7ljOLe5n2HNUBQTmrqWhpCfY1mZD62XlFMG66
 g6Tn5iKBkZ3Kt5S91J4Ax2gt7i7Sipci2/b8JpZgwCtRh7rpu6VO3jwkCg10eAJQwWj+09bmgeITd
 /AW0XIVA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:53870 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trD-0006ry-Vp; Wed, 26 Feb 2020 10:24:00 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trA-0003GY-N1; Wed, 26 Feb 2020 10:23:56 +0000
In-Reply-To: <20200226102312.GX25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 4/8] net: axienet: use resolved link config in
 mac_link_up()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1j6trA-0003GY-N1@rmk-PC.armlinux.org.uk>
Date: Wed, 26 Feb 2020 10:23:56 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_022621_508173_E845F7B3 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

Convert the Xilinx AXI ethernet driver to use the finalised link
parameters in mac_link_up() rather than the parameters in mac_config().

Tested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 197740781157..c2f4c5ca2e80 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1440,6 +1440,22 @@ static void axienet_mac_an_restart(struct phylink_config *config)
 
 static void axienet_mac_config(struct phylink_config *config, unsigned int mode,
 			       const struct phylink_link_state *state)
+{
+	/* nothing meaningful to do */
+}
+
+static void axienet_mac_link_down(struct phylink_config *config,
+				  unsigned int mode,
+				  phy_interface_t interface)
+{
+	/* nothing meaningful to do */
+}
+
+static void axienet_mac_link_up(struct phylink_config *config,
+				struct phy_device *phy,
+				unsigned int mode, phy_interface_t interface,
+				int speed, int duplex,
+				bool tx_pause, bool rx_pause)
 {
 	struct net_device *ndev = to_net_dev(config->dev);
 	struct axienet_local *lp = netdev_priv(ndev);
@@ -1448,7 +1464,7 @@ static void axienet_mac_config(struct phylink_config *config, unsigned int mode,
 	emmc_reg = axienet_ior(lp, XAE_EMMC_OFFSET);
 	emmc_reg &= ~XAE_EMMC_LINKSPEED_MASK;
 
-	switch (state->speed) {
+	switch (speed) {
 	case SPEED_1000:
 		emmc_reg |= XAE_EMMC_LINKSPD_1000;
 		break;
@@ -1467,33 +1483,17 @@ static void axienet_mac_config(struct phylink_config *config, unsigned int mode,
 	axienet_iow(lp, XAE_EMMC_OFFSET, emmc_reg);
 
 	fcc_reg = axienet_ior(lp, XAE_FCC_OFFSET);
-	if (state->pause & MLO_PAUSE_TX)
+	if (tx_pause)
 		fcc_reg |= XAE_FCC_FCTX_MASK;
 	else
 		fcc_reg &= ~XAE_FCC_FCTX_MASK;
-	if (state->pause & MLO_PAUSE_RX)
+	if (rx_pause)
 		fcc_reg |= XAE_FCC_FCRX_MASK;
 	else
 		fcc_reg &= ~XAE_FCC_FCRX_MASK;
 	axienet_iow(lp, XAE_FCC_OFFSET, fcc_reg);
 }
 
-static void axienet_mac_link_down(struct phylink_config *config,
-				  unsigned int mode,
-				  phy_interface_t interface)
-{
-	/* nothing meaningful to do */
-}
-
-static void axienet_mac_link_up(struct phylink_config *config,
-				struct phy_device *phy,
-				unsigned int mode, phy_interface_t interface,
-				int speed, int duplex,
-				bool tx_pause, bool rx_pause)
-{
-	/* nothing meaningful to do */
-}
-
 static const struct phylink_mac_ops axienet_phylink_ops = {
 	.validate = axienet_validate,
 	.mac_pcs_get_state = axienet_mac_pcs_get_state,
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

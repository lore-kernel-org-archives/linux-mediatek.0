Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75002C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zAWC8ZFv677b5UrV9AWdudmnsJ9EqenyXE642yZxWI=; b=dOq2lCJz8rGPCV
	ZvmBzuL7f3MWRzP6n3bKemi0zSE1iYQenyD+caRcgaoUS0mYeFGmcbslGd2rIXjCmz+USU6bt87mU
	BpzpFxVjDr6KbQfKs8roIjlzLo19RFfNrljs8cShFV3ZoAeOtSqXYsy/mtmD82k/r7tqPdOqcrPbM
	CUFtSuGNFgxUDxz6EvVAgjIzzpXOsGU/SjpXLi5+hVMoSbbfg1l4z/cG00356ty+vI1fvHlXZyXrL
	VvgHmlsSHl6V2URecqW23Fz93dgFeRP9OnUD7z7QOBSebEx7ekQe/DOH5kabivRqJ+mv4M7qP7G5v
	IxcRntnufwpFbPJ28GLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFg1t-002FyK-0B; Thu, 03 Feb 2022 17:36:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFfxK-002E0K-K1; Thu, 03 Feb 2022 17:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=76SoDOg03I7BgZU6AriDqDSFS+C3AmwY34uv3P4T1Zk=; b=De/RaULJ6uf7xlxFKcjWLtSBWw
 6LbwMnzYNxDyt+HuWVH+py7B80fm0Hq65dCpXvOHGCDxA9nUp7ZJdA36Q+FKfgcmp9etrQexFzzSH
 SbOb1BgcGj0fJ9I+u20k9QZarpNRD9g60f70XyYS60XgG+GA5ispCSN2mE8k+9HPSmWHtH7zkAGEg
 ihlG4FwpDiUG5N9Jw5+g9PXIKsMmdTrkCGbxYNYCnb/LcOtFNr+DhzL8Vqba+0L5RNLmimiVjaYz7
 LZZx+kFY4nU/aEvSwX/Qlb2ciwimDvvBFNUCLvl7AhK/Jj9JBnjQ0AJL2LUu9cU1Lg53te4CNHzBv
 z7UMKxzQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54886 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nFfxF-0002zo-UH; Thu, 03 Feb 2022 17:31:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nFfxF-006X6w-BE; Thu, 03 Feb 2022 17:31:33 +0000
In-Reply-To: <YfwRN2ObqFbrw/fF@shell.armlinux.org.uk>
References: <YfwRN2ObqFbrw/fF@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next 4/7] net: dsa: mt7530: only indicate linkmodes
 that can be supported
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nFfxF-006X6w-BE@rmk-PC.armlinux.org.uk>
Date: Thu, 03 Feb 2022 17:31:33 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_093138_706204_F1DCCCEC 
X-CRM114-Status: GOOD (  13.71  )
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

Now that mt7530 is not using the basex helper, it becomes unnecessary to
indicate support for both 1000baseX and 2500baseX when one of the 803.3z
PHY interface modes is being selected. Ensure that the driver indicates
only those linkmodes that can actually be supported by the PHY interface
mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mt7530.c | 19 +++++++++++++------
 drivers/net/dsa/mt7530.h |  1 +
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index edfc2c6bae37..cbdf4a58e507 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2515,6 +2515,7 @@ static int mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
 }
 
 static void mt7531_sgmii_validate(struct mt7530_priv *priv, int port,
+				  phy_interface_t interface,
 				  unsigned long *supported)
 {
 	/* Port5 supports ethier RGMII or SGMII.
@@ -2526,9 +2527,12 @@ static void mt7531_sgmii_validate(struct mt7530_priv *priv, int port,
 			break;
 		fallthrough;
 	case 6:
-		phylink_set(supported, 1000baseX_Full);
-		phylink_set(supported, 2500baseX_Full);
-		phylink_set(supported, 2500baseT_Full);
+		if (interface == PHY_INTERFACE_MODE_2500BASEX) {
+			phylink_set(supported, 2500baseX_Full);
+			phylink_set(supported, 2500baseT_Full);
+		} else {
+			phylink_set(supported, 1000baseX_Full);
+		}
 	}
 }
 
@@ -2897,6 +2901,7 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 
 static void
 mt7530_mac_port_validate(struct dsa_switch *ds, int port,
+			 phy_interface_t interface,
 			 unsigned long *supported)
 {
 	if (port == 5)
@@ -2904,11 +2909,12 @@ mt7530_mac_port_validate(struct dsa_switch *ds, int port,
 }
 
 static void mt7531_mac_port_validate(struct dsa_switch *ds, int port,
+				     phy_interface_t interface,
 				     unsigned long *supported)
 {
 	struct mt7530_priv *priv = ds->priv;
 
-	mt7531_sgmii_validate(priv, port, supported);
+	mt7531_sgmii_validate(priv, port, interface, supported);
 }
 
 static void
@@ -2931,10 +2937,11 @@ mt753x_phylink_validate(struct dsa_switch *ds, int port,
 	}
 
 	/* This switch only supports 1G full-duplex. */
-	if (state->interface != PHY_INTERFACE_MODE_MII)
+	if (state->interface != PHY_INTERFACE_MODE_MII &&
+	    state->interface != PHY_INTERFACE_MODE_2500BASEX)
 		phylink_set(mask, 1000baseT_Full);
 
-	priv->info->mac_port_validate(ds, port, mask);
+	priv->info->mac_port_validate(ds, port, state->interface, mask);
 
 	phylink_set(mask, Pause);
 	phylink_set(mask, Asym_Pause);
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index cbebbcc76509..73cfd29fbb17 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -772,6 +772,7 @@ struct mt753x_info {
 	void (*mac_port_get_caps)(struct dsa_switch *ds, int port,
 				  struct phylink_config *config);
 	void (*mac_port_validate)(struct dsa_switch *ds, int port,
+				  phy_interface_t interface,
 				  unsigned long *supported);
 	int (*mac_port_get_state)(struct dsa_switch *ds, int port,
 				  struct phylink_link_state *state);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

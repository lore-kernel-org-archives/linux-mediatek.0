Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5017CC636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3b18SOiU1wzFlMvSIrOxzfJh3ik/knEPF8SzJAmnajs=; b=WFgKFIVWShDizjFE0LFAK24ZHa
	FjHZ5M7H97I3YUda2LFEmhcyXqpvMovLZ9q7f/kghe3uZQrkI+TLE6POqQURf1X+f78dbNVKJBEMT
	1QRAIInY6eCRjjOHzflMsyw3tx7Pe+epMfCYtPbgi9lu2yrgnwZBr0C6Rk4wIy9KGP2BRXfAsMyCA
	qB1MOe6pFyw4YMXlSsQOkcNzR9QMYJSOw0m4FkL/bXWNd2fNSydeIN2kXd/UgaxtueQSK9PoCyQXM
	by3WN61zCHM5+qqpe9DUdlyGu4ISOiJH8cEOx9ZFT2QKmN51WMLHD6ZNueJLW3XbWElE0oEefwuq5
	PJAGWCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU9GV-004vdF-3n; Mon, 20 Feb 2023 16:43:47 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU9Er-004ugm-RP; Mon, 20 Feb 2023 16:42:17 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pU9Ep-0002eH-2f;
	Mon, 20 Feb 2023 17:42:04 +0100
Date: Mon, 20 Feb 2023 16:41:59 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: [PATCH v9 07/12] net: ethernet: mtk_eth_soc: only write values if
 needed
Message-ID: <3e90ea2f9c2152160d9dc94a7721d0366b1f2195.1676910958.git.daniel@makrotopia.org>
References: <cover.1676910958.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1676910958.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_084206_125967_47CAE5AE 
X-CRM114-Status: GOOD (  13.85  )
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

Only restart auto-negotiation and write link timer if actually
necessary.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Tested-by: Bjørn Mork <bjorn@mork.no>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index d7e7352041a4f..61bd9986466a9 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -38,20 +38,16 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 			  const unsigned long *advertising,
 			  bool permit_pause_to_mac)
 {
+	bool mode_changed = false, changed, use_an;
 	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
 	unsigned int rgc3, sgm_mode, bmcr;
 	int advertise, link_timer;
-	bool changed, use_an;
 
 	advertise = phylink_mii_c22_pcs_encode_advertisement(interface,
 							     advertising);
 	if (advertise < 0)
 		return advertise;
 
-	link_timer = phylink_get_link_timer_ns(interface);
-	if (link_timer < 0)
-		return link_timer;
-
 	/* Clearing IF_MODE_BIT0 switches the PCS to BASE-X mode, and
 	 * we assume that fixes it's speed at bitrate = line rate (in
 	 * other words, 1000Mbps or 2500Mbps).
@@ -77,13 +73,16 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 	}
 
 	if (use_an) {
-		/* FIXME: Do we need to set AN_RESTART here? */
-		bmcr = SGMII_AN_RESTART | SGMII_AN_ENABLE;
+		bmcr = SGMII_AN_ENABLE;
 	} else {
 		bmcr = 0;
 	}
 
 	if (mpcs->interface != interface) {
+		link_timer = phylink_get_link_timer_ns(interface);
+		if (link_timer < 0)
+			return link_timer;
+
 		/* PHYA power down */
 		regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
 				   SGMII_PHYA_PWD, SGMII_PHYA_PWD);
@@ -106,16 +105,17 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 		regmap_update_bits(mpcs->regmap, mpcs->ana_rgc3,
 				   RG_PHY_SPEED_3_125G, rgc3);
 
+		/* Setup the link timer */
+		regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER, link_timer / 2 / 8);
+
 		mpcs->interface = interface;
+		mode_changed = true;
 	}
 
 	/* Update the advertisement, noting whether it has changed */
 	regmap_update_bits_check(mpcs->regmap, SGMSYS_PCS_ADVERTISE,
 				 SGMII_ADVERTISE, advertise, &changed);
 
-	/* Setup the link timer and QPHY power up inside SGMIISYS */
-	regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER, link_timer / 2 / 8);
-
 	/* Update the sgmsys mode register */
 	regmap_update_bits(mpcs->regmap, SGMSYS_SGMII_MODE,
 			   SGMII_REMOTE_FAULT_DIS | SGMII_SPEED_DUPLEX_AN |
@@ -123,7 +123,7 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 
 	/* Update the BMCR */
 	regmap_update_bits(mpcs->regmap, SGMSYS_PCS_CONTROL_1,
-			   SGMII_AN_RESTART | SGMII_AN_ENABLE, bmcr);
+			   SGMII_AN_ENABLE, bmcr);
 
 	/* Release PHYA power down state
 	 * Only removing bit SGMII_PHYA_PWD isn't enough.
@@ -137,7 +137,7 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 	usleep_range(50, 100);
 	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, 0);
 
-	return changed;
+	return changed || mode_changed;
 }
 
 static void mtk_pcs_restart_an(struct phylink_pcs *pcs)
-- 
2.39.2



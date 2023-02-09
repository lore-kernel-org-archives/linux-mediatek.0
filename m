Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81548C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 23:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bo2UqupZVGORqKGLa/v4ly5AS48pjf+J7Gb5hWOtr9U=; b=mdcT80Nsl3eY3+gyWJYPUaMnlF
	fuNJY2+HQv6Ueri5EfcXTCfJHo8gG4Wja21s6db0kKVeOUvWRrkWWZd2xuTMnuPyo5Guqj9ZSlXJs
	NiYS2DQIl100to/V7vB9BEIrEyQ5G5qFjTJEAS622ztOiNkuxyvMCpK5AOy7WckX85mEfEN4EaOLk
	yifl2WxAI9eef9YaxU+ViXQBi99rGaik2T64qqLph//UV5vBBSY8vsvYF7Yq/QcSJ4beDCVs0jNk7
	/vnjhEWtgetx7+lXBHDeDMGvy1p3nC7KsiJ1rpnFqv7ZUAItmKTFJ4hacflIhI2KeXTtonupCSOmS
	VKsFKn+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGQ5-003YIr-UV; Thu, 09 Feb 2023 23:33:37 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGQ2-003YH1-W3; Thu, 09 Feb 2023 23:33:37 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pQGQ1-0002H7-0A;
	Fri, 10 Feb 2023 00:33:33 +0100
Date: Thu, 9 Feb 2023 23:31:51 +0000
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
Subject: [PATCH v3 07/12] net: ethernet: mtk_eth_soc: only write values if
 needed
Message-ID: <655926d824fac09cf188d746ae18cfb823135525.1675984550.git.daniel@makrotopia.org>
References: <cover.1675984550.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1675984550.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_153335_055560_CCF1B9D1 
X-CRM114-Status: GOOD (  13.89  )
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

Tested-by: Bjørn Mork <bjorn@mork.no>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index d7e7352041a4..9a29cff4016d 100644
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
@@ -77,8 +73,7 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 	}
 
 	if (use_an) {
-		/* FIXME: Do we need to set AN_RESTART here? */
-		bmcr = SGMII_AN_RESTART | SGMII_AN_ENABLE;
+		bmcr = SGMII_AN_ENABLE;
 	} else {
 		bmcr = 0;
 	}
@@ -106,16 +101,21 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 		regmap_update_bits(mpcs->regmap, mpcs->ana_rgc3,
 				   RG_PHY_SPEED_3_125G, rgc3);
 
+		/* Setup the link timer and QPHY power up inside SGMIISYS */
+		link_timer = phylink_get_link_timer_ns(interface);
+		if (link_timer < 0)
+			return link_timer;
+
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
2.39.1



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED5FC77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+JRNPJ5cx2jMWG0IRYy24A0cOZNPYpGwtWM1ZXhhGY=; b=To1gtP3SPwD19a
	RirYiOLaCBES2l9ebufcLHU2cKQyPmYzEpiCwjk3B3czx2vXK1nelrgofbgn41Lr/0F9h29lMsqhY
	MYedk0+J6BCIMTKU0YQ37Bx64Kb9+ahJMC/FYaFXRnaqSAsjWjb1CfJVqxJX/nPIiBQlOcVURS/F2
	Cf/xn0zuR6qlE7kW2bBBun7gEhdK5qm8I586LCDmrBh+9Cpw9p/TuN7FZGpc6YNt3lVBs6CWYIrLh
	t2CMNB+bPX2qLWP0IGKxIoisx/8YPS3XcgJOh0YRoS0M/wVh7o9OqBrE51tXZZbuJa4afOXDaurVi
	GfL0JgkM0M1G0rOQ89PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TZ-006Q1A-0L;
	Mon, 22 May 2023 12:17:21 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14T7-006PZw-2j;
	Mon, 22 May 2023 12:16:55 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-95fde138693so719458966b.0;
        Mon, 22 May 2023 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757812; x=1687349812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+JRNPJ5cx2jMWG0IRYy24A0cOZNPYpGwtWM1ZXhhGY=;
        b=mKFqhMSx/xXAeZmR+tLG13hzarkfEAe/1HfDp2XnKwEbTHrdpdAA1KnoFi1k6GKiBD
         vBfNntGXR7wMJJvpx+n46YDY4oNL9zY9eD1RcUWdIRA8ByzBNRb6XZttJR0kWSY+CmI4
         fmmy/SJemYC43Djzi18JisnZvepnk0lLAcCAufKoH03Eux4AIGjhR0Ctf0WBgTQbXD59
         UuMAzUQHDGRovJW3qMREcv/ibsAsCdxDIH464s638ED4NcLV5PL1Zx1nTCySARc3dZmS
         4PZga7LAVOIpTlol+svUGokQfLjpaByY5oUA4tUAH8j/Gg3ZFjNe2fr+11dev6QDitru
         veig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757812; x=1687349812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+JRNPJ5cx2jMWG0IRYy24A0cOZNPYpGwtWM1ZXhhGY=;
        b=GVdiMjzJ2hnIRZFD26GKIy0nZycwY+CT/lFhZCPIAygUVYtZ8cPvj4TK39nsWLRd3i
         x9SfccLJLCevyE7LVGiCc32+nfeAE6fXbIWzAeeNwn54Agxz13Za3xf8f2CEbOZp+Zu2
         JSud5b0C/CD0fQCQ9nFYcleW7pcuLt72hHrjOfAx0tuUk/4f+LcIbAO/tdxplGORRJXH
         6YSFv4vmHqSGzdZvxU80hrEDusuLmz9nE6ugq/DM5tQV3QsVRdt+janb5jdZz3cfUWlp
         sar7SSjblnq5o0tOaQkq9rVkSYXRL1OAwFvJRC0yorcMnWwjNfXSZU0w9OkqbSsNzjq2
         UZCw==
X-Gm-Message-State: AC+VfDxiBzeGq3+MJG3T8hkoWGlMFxVw2Jhsv8kA4NxTpML1vvIq1NTs
	chfWISrw+qjaZQpYBYSd3NM=
X-Google-Smtp-Source: ACHHUZ74tzGrUpDgLxpoRmjLRyrJEfA9H60gIxyMad4XSXFKvHN8dQVencPxbwxKbgaUKz1iTRgnog==
X-Received: by 2002:a17:907:3da1:b0:958:46aa:7f99 with SMTP id he33-20020a1709073da100b0095846aa7f99mr9889877ejc.7.1684757812111;
        Mon, 22 May 2023 05:16:52 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:51 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 22/30] net: dsa: mt7530: rename p5_intf_sel and use only for MT7530 switch
Date: Mon, 22 May 2023 15:15:24 +0300
Message-Id: <20230522121532.86610-23-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051653_905740_D138693B 
X-CRM114-Status: GOOD (  19.97  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The p5_intf_sel pointer is used to store the information of whether PHY
muxing is used or not. PHY muxing is a feature specific to port 5 of the
MT7530 switch. Do not use it for other switch models.

Rename the pointer to p5_mode to store the mode the port is being used in.
Rename the p5_interface_select enum to mt7530_p5_mode, the string
representation to mt7530_p5_mode_str, and the enum elements.

If PHY muxing is not detected, the default mode, GMAC5, will be used.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 61 ++++++++++++++++------------------------
 drivers/net/dsa/mt7530.h | 15 +++++-----
 2 files changed, 32 insertions(+), 44 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 996b8c02cb05..19afcd914109 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -868,19 +868,15 @@ mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
 	return 0;
 }
 
-static const char *p5_intf_modes(unsigned int p5_interface)
-{
-	switch (p5_interface) {
-	case P5_DISABLED:
-		return "DISABLED";
-	case P5_INTF_SEL_PHY_P0:
-		return "PHY P0";
-	case P5_INTF_SEL_PHY_P4:
-		return "PHY P4";
-	case P5_INTF_SEL_GMAC5:
-		return "GMAC5";
+static const char *mt7530_p5_mode_str(unsigned int mode)
+{
+	switch (mode) {
+	case MUX_PHY_P0:
+		return "MUX PHY P0";
+	case MUX_PHY_P4:
+		return "MUX PHY P4";
 	default:
-		return "unknown";
+		return "GMAC5";
 	}
 }
 
@@ -897,23 +893,21 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 	val |= MHWTRAP_P5_MAC_SEL | MHWTRAP_P5_DIS;
 	val &= ~MHWTRAP_P5_RGMII_MODE & ~MHWTRAP_PHY0_SEL;
 
-	switch (priv->p5_intf_sel) {
-	case P5_INTF_SEL_PHY_P0:
-		/* MT7530_P5_MODE_GPHY_P0: 2nd GMAC -> P5 -> P0 */
+	switch (priv->p5_mode) {
+	case MUX_PHY_P0:
+		/* MUX_PHY_P0: P0 -> P5 -> SoC MAC */
 		val |= MHWTRAP_PHY0_SEL;
 		fallthrough;
-	case P5_INTF_SEL_PHY_P4:
-		/* MT7530_P5_MODE_GPHY_P4: 2nd GMAC -> P5 -> P4 */
+	case MUX_PHY_P4:
+		/* MUX_PHY_P4: P4 -> P5 -> SoC MAC */
 		val &= ~MHWTRAP_P5_MAC_SEL & ~MHWTRAP_P5_DIS;
 
 		/* Setup the MAC by default for the cpu port */
 		mt7530_write(priv, MT7530_PMCR_P(5), 0x56300);
 		break;
-	case P5_INTF_SEL_GMAC5:
-		/* MT7530_P5_MODE_GMAC: P5 -> External phy or 2nd GMAC */
-		val &= ~MHWTRAP_P5_DIS;
-		break;
 	default:
+		/* GMAC5: P5 -> SoC MAC or external PHY */
+		val &= ~MHWTRAP_P5_DIS;
 		break;
 	}
 
@@ -937,8 +931,8 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
-	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
-		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
+	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, mode=%s, phy-mode=%s\n", val,
+		mt7530_p5_mode_str(priv->p5_mode), phy_modes(interface));
 
 	mutex_unlock(&priv->reg_mutex);
 }
@@ -2254,13 +2248,11 @@ mt7530_setup(struct dsa_switch *ds)
 	if (ret)
 		return ret;
 
-	/* Setup port 5 */
-	if (!dsa_is_unused_port(ds, 5)) {
-		priv->p5_intf_sel = P5_INTF_SEL_GMAC5;
-	} else {
+	/* Check for PHY muxing on port 5 */
+	if (dsa_is_unused_port(ds, 5)) {
 		/* Scan the ethernet nodes. Look for GMAC1, lookup the used PHY.
-		 * Set priv->p5_intf_sel to the appropriate value if PHY muxing
-		 * is detected.
+		 * Set priv->p5_mode to the appropriate value if PHY muxing is
+		 * detected.
 		 */
 		for_each_child_of_node(dn, mac_np) {
 			if (!of_device_is_compatible(mac_np,
@@ -2284,17 +2276,17 @@ mt7530_setup(struct dsa_switch *ds)
 				}
 				id = of_mdio_parse_addr(ds->dev, phy_node);
 				if (id == 0)
-					priv->p5_intf_sel = P5_INTF_SEL_PHY_P0;
+					priv->p5_mode = MUX_PHY_P0;
 				if (id == 4)
-					priv->p5_intf_sel = P5_INTF_SEL_PHY_P4;
+					priv->p5_mode = MUX_PHY_P4;
 			}
 			of_node_put(mac_np);
 			of_node_put(phy_node);
 			break;
 		}
 
-		if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 ||
-		    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
+		if (priv->p5_mode == MUX_PHY_P0 ||
+		    priv->p5_mode == MUX_PHY_P4)
 			mt7530_setup_port5(ds, interface);
 	}
 
@@ -2433,9 +2425,6 @@ mt7531_setup(struct dsa_switch *ds)
 			   MT7531_EXT_P_MDIO_12);
 	}
 
-	if (!dsa_is_unused_port(ds, 5))
-		priv->p5_intf_sel = P5_INTF_SEL_GMAC5;
-
 	mt7530_rmw(priv, MT7531_GPIO_MODE0, MT7531_GPIO0_MASK,
 		   MT7531_GPIO0_INTERRUPT);
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index b7f80a487073..216081fb1c12 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -673,12 +673,11 @@ struct mt7530_port {
 	struct phylink_pcs *sgmii_pcs;
 };
 
-/* Port 5 interface select definitions */
-enum p5_interface_select {
-	P5_DISABLED,
-	P5_INTF_SEL_PHY_P0,
-	P5_INTF_SEL_PHY_P4,
-	P5_INTF_SEL_GMAC5,
+/* Port 5 mode definitions of the MT7530 switch */
+enum mt7530_p5_mode {
+	GMAC5,
+	MUX_PHY_P0,
+	MUX_PHY_P4,
 };
 
 struct mt7530_priv;
@@ -746,7 +745,7 @@ struct mt753x_info {
  *			is already configured
  * @p5_configured:	Flag for distinguishing if port 5 of the MT7531 switch
  *			is already configured
- * @p5_intf_sel:	Holding the current port 5 interface select
+ * @p5_mode:		Holding the current mode of port 5 of the MT7530 switch
  * @p5_sgmii:		Flag for distinguishing if port 5 of the MT7531 switch
  *			has got SGMII
  * @irq:		IRQ number of the switch
@@ -768,7 +767,7 @@ struct mt7530_priv {
 	bool			mcm;
 	bool			p6_configured;
 	bool			p5_configured;
-	enum p5_interface_select p5_intf_sel;
+	enum mt7530_p5_mode	p5_mode;
 	bool			p5_sgmii;
 	u8			mirror_rx;
 	u8			mirror_tx;
-- 
2.39.2



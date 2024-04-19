Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A8BC04FF6
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jh8i1jQ6oRMzUsdIGNA11LJ9bOW90YntKsK0UBjTk/A=; b=BYJ63QIqK13aqYsNs03IbGoPNW
	QH46O2KYIjJdthGEvJougHeMnlX41sB67+aK4gU2a/pgo11+NdpctczxTPRubO1l5FF4cIfXnQbij
	/zEgGdhZ7Ceqfzpy4+ArRZWTLpRnbrCwyI2IJ4J10WE96jZH15lJTDbczprKjOxO1n2NWzH1uXZZw
	M8rDgQImhkHErrEXOvUk7MLPqiq9uafjTD0m23VxbJuM1k09RJgA/1GIbWYZ0K52le9F4H19V5JyB
	4YSaQ5lEDdEbVlbCHwa+pLPbmJFPDkQUKrUgyuwH2BHYDfrOP8d8EdbNHQK92JroTqz0MxEpLrgIs
	s+DkZVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlC9-00000005EZU-3hOX;
	Fri, 19 Apr 2024 10:10:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlBb-00000005ECs-3jJ0;
	Fri, 19 Apr 2024 10:09:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C14B46195B;
	Fri, 19 Apr 2024 10:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D40CEC4AF0A;
	Fri, 19 Apr 2024 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713521377;
	bh=9aC2izf7pDmtSSitRHIY3XfQzKDzjBkTKbfmsq/v0JU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N8GDhT5iZg5kzgkwZtP3YEuxaF4E3iMqbumHLuCwvvdaxFO3mFuiIv7nUZxZV8450
	 A176TPrVQ+o/y4bqNG0/MfSPrZ/z4Y5J1quHYVe0XpnhSD2j9IePAR5/Az91I9g1nI
	 XvX8OGBlQx8gqZ0b8a//8M6WiOQAwzqjbYliszTe9ogD/SxtsQQxu+LYxQSVi+OOjE
	 h02BX2fUO4StBf8exKaDJikOzZvm+dnnGLC6cKbHsafTmy9sGm6DfDxcTWpucaYPPJ
	 gK9U+FoRGTYUj8SSaEo8XPaSGJghOqys+j2QmdewDhUlfWuvlUOn9ntpbXrlGyRhy7
	 WFvzoA4QBVE9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC031C04FF6;
	Fri, 19 Apr 2024 10:09:37 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 19 Apr 2024 13:09:30 +0300
Subject: [PATCH net-next 07/13] net: dsa: mt7530: move MT753X_MTRAP
 operations for MT7530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240419-for-netnext-mt7530-improvements-4-v1-7-6d852ca79b1d@arinc9.com>
References: <20240419-for-netnext-mt7530-improvements-4-v1-0-6d852ca79b1d@arinc9.com>
In-Reply-To: <20240419-for-netnext-mt7530-improvements-4-v1-0-6d852ca79b1d@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713521374; l=3575;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=00K+c7w7ciHtR3cg/Vn4V9kvHhcXqDMvGRmHgFwDD6g=;
 b=D1+kXUJAtGNwzmHs5kYKJ5HJ23tyiDDh8eH4aG2XtQ5JyJpgadsmiAogJdOjaNYwdoa082TZO
 JLYAWJ8lOJtDejMzAyJ6Er0pkW6F8erqc68SUXVo8HRZoztqYlwhvmT
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_030940_279533_5DC3994B 
X-CRM114-Status: GOOD (  14.85  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

On MT7530, the media-independent interfaces of port 5 and 6 are controlled
by the MT7530_P5_DIS and MT7530_P6_DIS bits of the hardware trap. Deal with
these bits only when the relevant port is being enabled or disabled. This
ensures that these ports will be disabled when they are not in use.

Do not set MT7530_CHG_TRAP on mt7530_setup_port5() as that's already being
done on mt7530_setup().

Instead of globally setting MT7530_P5_MAC_SEL, clear it, then set it only
on the appropriate case.

If PHY muxing is detected, clear MT7530_P5_DIS before calling
mt7530_setup_port5().

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 606516206fb9..83436723cb16 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -880,8 +880,7 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 
 	val = mt7530_read(priv, MT753X_MTRAP);
 
-	val |= MT7530_CHG_TRAP | MT7530_P5_MAC_SEL | MT7530_P5_DIS;
-	val &= ~MT7530_P5_RGMII_MODE & ~MT7530_P5_PHY0_SEL;
+	val &= ~MT7530_P5_PHY0_SEL & ~MT7530_P5_MAC_SEL & ~MT7530_P5_RGMII_MODE;
 
 	switch (priv->p5_mode) {
 	/* MUX_PHY_P0: P0 -> P5 -> SoC MAC */
@@ -891,15 +890,13 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 
 	/* MUX_PHY_P4: P4 -> P5 -> SoC MAC */
 	case MUX_PHY_P4:
-		val &= ~MT7530_P5_MAC_SEL & ~MT7530_P5_DIS;
-
 		/* Setup the MAC by default for the cpu port */
 		mt7530_write(priv, MT753X_PMCR_P(5), 0x56300);
 		break;
 
 	/* GMAC5: P5 -> SoC MAC or external PHY */
 	default:
-		val &= ~MT7530_P5_DIS;
+		val |= MT7530_P5_MAC_SEL;
 		break;
 	}
 
@@ -1193,6 +1190,14 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
 
 	mutex_unlock(&priv->reg_mutex);
 
+	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
+		return 0;
+
+	if (port == 5)
+		mt7530_clear(priv, MT753X_MTRAP, MT7530_P5_DIS);
+	else if (port == 6)
+		mt7530_clear(priv, MT753X_MTRAP, MT7530_P6_DIS);
+
 	return 0;
 }
 
@@ -1211,6 +1216,14 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
 		   PCR_MATRIX_CLR);
 
 	mutex_unlock(&priv->reg_mutex);
+
+	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
+		return;
+
+	if (port == 5)
+		mt7530_set(priv, MT753X_MTRAP, MT7530_P5_DIS);
+	else if (port == 6)
+		mt7530_set(priv, MT753X_MTRAP, MT7530_P6_DIS);
 }
 
 static int
@@ -2401,11 +2414,11 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
 			   RD_TAP_MASK, RD_TAP(16));
 
-	/* Enable port 6 */
-	val = mt7530_read(priv, MT753X_MTRAP);
-	val &= ~MT7530_P6_DIS & ~MT7530_PHY_INDIRECT_ACCESS;
-	val |= MT7530_CHG_TRAP;
-	mt7530_write(priv, MT753X_MTRAP, val);
+	/* Allow modifying the trap and directly access PHY registers via the
+	 * MDIO bus the switch is on.
+	 */
+	mt7530_rmw(priv, MT753X_MTRAP, MT7530_CHG_TRAP |
+		   MT7530_PHY_INDIRECT_ACCESS, MT7530_CHG_TRAP);
 
 	if ((val & MT7530_XTAL_MASK) == MT7530_XTAL_40MHZ)
 		mt7530_pll_setup(priv);
@@ -2488,8 +2501,11 @@ mt7530_setup(struct dsa_switch *ds)
 			break;
 		}
 
-		if (priv->p5_mode == MUX_PHY_P0 || priv->p5_mode == MUX_PHY_P4)
+		if (priv->p5_mode == MUX_PHY_P0 ||
+		    priv->p5_mode == MUX_PHY_P4) {
+			mt7530_clear(priv, MT753X_MTRAP, MT7530_P5_DIS);
 			mt7530_setup_port5(ds, interface);
+		}
 	}
 
 #ifdef CONFIG_GPIOLIB

-- 
2.40.1




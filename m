Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0273BC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 07:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jh8i1jQ6oRMzUsdIGNA11LJ9bOW90YntKsK0UBjTk/A=; b=VSze0Db4QKK36ReHhOxev24+Ta
	urhArPFDKTu6W5Z5VfWKOfagLI5P6c2bBJIXsC/2mCb2PRlkqsxRvCpGNvlb0uKJeNN0PGyK/tCI8
	R9iI02HwEvld/hqmdQ4mX7WKWHP96r4J3f65GBhosn4EP0KhoXC//U/uNjEq1OcaOYwaRimgo7b7K
	jPyY4o60IU+0/BwHlw4rMDhX06W5+JzD546MTUf65PFkv/7aX8vOC4RP/xtuAtny+wfTgaU8szjY8
	HheoeGDRt+PJlWVs7rQjcTKiZzv717hdwHWMmRo8DcS7ByJo/mU3RyMX3Mya1AL8akqH7f2kqbMqo
	HAQRSiDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynuX-0000000CNq8-1SDM;
	Mon, 22 Apr 2024 07:16:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryntm-0000000CNLd-20UD;
	Mon, 22 Apr 2024 07:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB82F60C7A;
	Mon, 22 Apr 2024 07:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE97DC4AF0E;
	Mon, 22 Apr 2024 07:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713770130;
	bh=9aC2izf7pDmtSSitRHIY3XfQzKDzjBkTKbfmsq/v0JU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H9WxVARkcobG5qCjw/w5KDIzb/Xd3HCkjFwNnc2HH0Du3MKbIB1r6DCmmKH8T1YF/
	 vmeFkc50JMD/fE11V+fhgLK7kb7QeJaCLwYGFInasYjoFTTtC+xBsqX/Pwq8IIToxu
	 komBQq8NSKfD2N4+QAxDAWirFznp3k7u+7/owW7A3mttXbsdYat3GO9lc2+VLgvyFu
	 CwJimmKOT/8CS7vs0qPFKh4LIjbGEmij5b8JVfICmzTd7etdX5slhctakzccLCuyam
	 D+ouXvuXayZf0gIMje9G/yKyAjiWmR4U6VkVewSCqwUrlQx1fAx8acPx35Y+sFDkky
	 leAylbsyPriKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1815C10F15;
	Mon, 22 Apr 2024 07:15:30 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 22 Apr 2024 10:15:14 +0300
Subject: [PATCH net-next v2 07/15] net: dsa: mt7530: move MT753X_MTRAP
 operations for MT7530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240422-for-netnext-mt7530-improvements-4-v2-7-a75157ba76ad@arinc9.com>
References: <20240422-for-netnext-mt7530-improvements-4-v2-0-a75157ba76ad@arinc9.com>
In-Reply-To: <20240422-for-netnext-mt7530-improvements-4-v2-0-a75157ba76ad@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713770127; l=3575;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=00K+c7w7ciHtR3cg/Vn4V9kvHhcXqDMvGRmHgFwDD6g=;
 b=iAFOJTEc2IUg4VptNYrkdDzK0KVfHzl0nrENTzHB8iCUFHLNebhthKeg5Z+6OC0LCdPu7JSCk
 rk2or1CHHFGBgISZslZ4GGPnV+O1AEghI6aKNwLMmme+il+Vl1C0c2L
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_001534_704889_9145E6CC 
X-CRM114-Status: GOOD (  15.02  )
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




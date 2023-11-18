Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35D0C5ACB3
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usciJlF0tBj+65L/MlcGZT5V9mSdub2woDEGmaEy00Q=; b=l83x8SyoEws+9+
	nGFhmv8RV1nM5nRZuYeo+FqEIogj8C8JANS33QBPH+0aMDFRxbnVvIT7/J4DaETPCMwPIn8Y5uSwY
	gAHpfcjZmmd1AG1Rn9izasdjsKJ/y5umNLiQdNb2h0el+RsqFZOV9QdUopNEtKfaPJdATJgi1SDYR
	uJoWkII84Jvo1PP5htBB3k5HdqIZWZHsZUgwmLupIcEKW3pXIPeKpc/YfTFecrOJonQmwXyg3HI+E
	nGtDXN7rKKnOKSHT3qCnnBseytUPxjClWG0BFAdcn+r+f5CRPwUNROHEaz82gyAJMRpb+QMWk1CvR
	BgDgn18ZVULiN16RHW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4L9x-008Wrr-2Q;
	Sat, 18 Nov 2023 13:14:53 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4L9u-008Wq4-1a;
	Sat, 18 Nov 2023 13:14:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8766D20003;
	Sat, 18 Nov 2023 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1700313288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=usciJlF0tBj+65L/MlcGZT5V9mSdub2woDEGmaEy00Q=;
	b=IUGvmTrE7zpTGuWVyUr1MAfWYeD72X5M9kUZK8NY93Gsl96zfAnW0ZR9hI6NrxtsJ6bt9Z
	+t8QADbxAftCTShuFDLuT44B41TzpUyUqNXH8yHpFMgmQyNrVgww07n18VGzVLY1HX7W9I
	bzPBr6TfnxuV4MWjw+87vEA4dygZnAzyiZO3e3sGkwK7FViaKLRTrPTdmXhn+3kUg7Ifcy
	hw2gZqdykB2UGeGfmOxz1cQdp2MUsgxB0sUun7IN78sRhBPxvWtdi7eEKml+/66xUskX7v
	o84kCnkBEEv+uRkiXrnKq+Wbhy024z8ckKegMzM9cRdzK8O3MTP8lNvd/XPWUA==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
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
Subject: [PATCH net-next 13/15] net: dsa: mt7530: simplify mt7530_setup_port6() and change to void
Date: Sat, 18 Nov 2023 16:13:15 +0300
Message-Id: <20231118131317.295591-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118123205.266819-1-arinc.unal@arinc9.com>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_051450_818141_DA96DB52 
X-CRM114-Status: GOOD (  18.49  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This code is from before this driver was converted to phylink API. Phylink
deals with the unsupported interface cases before mt7530_setup_port6() is
run. Therefore, the default case would never run. However, it must be
defined nonetheless to handle all the remaining enumeration values, the
phy-modes.

Switch to if statement for RGMII and return which simplifies the code and
saves an indent.

Do not set P6_INTF_MODE, which is the the three least significant bits of
the MT7530_P6ECR register, to 0 for RGMII as it will already be 0 after
reset.

Read XTAL after checking for RGMII as it's only needed for the TRGMII
interface mode.

Change mt7530_setup_port6() to void now that there're no error cases left.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 100 ++++++++++++++++-----------------------
 1 file changed, 40 insertions(+), 60 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2608b09d3295..f36f240231b5 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -414,72 +414,56 @@ mt753x_preferred_default_local_cpu_port(struct dsa_switch *ds)
 }
 
 /* Setup port 6 interface mode and TRGMII TX circuit */
-static int
+static void
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, trgint, xtal;
+	u32 ncpo1, ssc_delta, xtal;
 
 	mt7530_clear(priv, MT7530_MHWTRAP, MHWTRAP_P6_DIS);
 
+	if (interface == PHY_INTERFACE_MODE_RGMII)
+		return;
+
+	mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK, P6_INTF_MODE(1));
+
 	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
 
-	switch (interface) {
-	case PHY_INTERFACE_MODE_RGMII:
-		trgint = 0;
-		break;
-	case PHY_INTERFACE_MODE_TRGMII:
-		trgint = 1;
+	if (xtal == HWTRAP_XTAL_25MHZ)
+		ssc_delta = 0x57;
+	else
+		ssc_delta = 0x87;
+
+	if (priv->id == ID_MT7621) {
+		/* PLL frequency: 125MHz: 1.0GBit */
+		if (xtal == HWTRAP_XTAL_40MHZ)
+			ncpo1 = 0x0640;
 		if (xtal == HWTRAP_XTAL_25MHZ)
-			ssc_delta = 0x57;
-		else
-			ssc_delta = 0x87;
-		if (priv->id == ID_MT7621) {
-			/* PLL frequency: 125MHz: 1.0GBit */
-			if (xtal == HWTRAP_XTAL_40MHZ)
-				ncpo1 = 0x0640;
-			if (xtal == HWTRAP_XTAL_25MHZ)
-				ncpo1 = 0x0a00;
-		} else { /* PLL frequency: 250MHz: 2.0Gbit */
-			if (xtal == HWTRAP_XTAL_40MHZ)
-				ncpo1 = 0x0c80;
-			if (xtal == HWTRAP_XTAL_25MHZ)
-				ncpo1 = 0x1400;
-		}
-		break;
-	default:
-		dev_err(priv->dev, "xMII interface %d not supported\n",
-			interface);
-		return -EINVAL;
+			ncpo1 = 0x0a00;
+	} else { /* PLL frequency: 250MHz: 2.0Gbit */
+		if (xtal == HWTRAP_XTAL_40MHZ)
+			ncpo1 = 0x0c80;
+		if (xtal == HWTRAP_XTAL_25MHZ)
+			ncpo1 = 0x1400;
 	}
 
-	mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
-		   P6_INTF_MODE(trgint));
-
-	if (trgint) {
-		/* Disable the MT7530 TRGMII clocks */
-		core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
-
-		/* Setup the MT7530 TRGMII Tx Clock */
-		core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
-		core_write(priv, CORE_PLL_GROUP6, RG_LCDDS_PCW_NCPO0(0));
-		core_write(priv, CORE_PLL_GROUP10, RG_LCDDS_SSC_DELTA(ssc_delta));
-		core_write(priv, CORE_PLL_GROUP11, RG_LCDDS_SSC_DELTA1(ssc_delta));
-		core_write(priv, CORE_PLL_GROUP4,
-			   RG_SYSPLL_DDSFBK_EN | RG_SYSPLL_BIAS_EN |
-			   RG_SYSPLL_BIAS_LPF_EN);
-		core_write(priv, CORE_PLL_GROUP2,
-			   RG_SYSPLL_EN_NORMAL | RG_SYSPLL_VODEN |
-			   RG_SYSPLL_POSDIV(1));
-		core_write(priv, CORE_PLL_GROUP7,
-			   RG_LCDDS_PCW_NCPO_CHG | RG_LCCDS_C(3) |
-			   RG_LCDDS_PWDB | RG_LCDDS_ISO_EN);
+	/* Disable the MT7530 TRGMII clocks */
+	core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
 
-		/* Enable the MT7530 TRGMII clocks */
-		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
-	}
+	/* Setup the MT7530 TRGMII Tx Clock */
+	core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
+	core_write(priv, CORE_PLL_GROUP6, RG_LCDDS_PCW_NCPO0(0));
+	core_write(priv, CORE_PLL_GROUP10, RG_LCDDS_SSC_DELTA(ssc_delta));
+	core_write(priv, CORE_PLL_GROUP11, RG_LCDDS_SSC_DELTA1(ssc_delta));
+	core_write(priv, CORE_PLL_GROUP4, RG_SYSPLL_DDSFBK_EN |
+		   RG_SYSPLL_BIAS_EN | RG_SYSPLL_BIAS_LPF_EN);
+	core_write(priv, CORE_PLL_GROUP2, RG_SYSPLL_EN_NORMAL |
+		   RG_SYSPLL_VODEN | RG_SYSPLL_POSDIV(1));
+	core_write(priv, CORE_PLL_GROUP7, RG_LCDDS_PCW_NCPO_CHG |
+		   RG_LCCDS_C(3) | RG_LCDDS_PWDB | RG_LCDDS_ISO_EN);
 
-	return 0;
+	/* Enable the MT7530 TRGMII clocks */
+	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
 }
 
 static void
@@ -2597,15 +2581,11 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	int ret;
 
-	if (port == 5) {
+	if (port == 5)
 		mt7530_setup_port5(priv->ds, interface);
-	} else if (port == 6) {
-		ret = mt7530_setup_port6(priv->ds, interface);
-		if (ret)
-			return ret;
-	}
+	else if (port == 6)
+		mt7530_setup_port6(priv->ds, interface);
 
 	return 0;
 }
-- 
2.40.1



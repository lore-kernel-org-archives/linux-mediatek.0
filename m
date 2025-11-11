Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD070CCF9E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Nov 2025 08:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgClGoRUUCExaga3kY1+xG8HW2a8/5Ewtov/asu0Kgc=; b=2/bEx7ZoLsDI7N9QJXvDty/EUA
	Ylh4rXnYMYp1Xm6OdQC0WYpiTz/71s/pMOzTtTBAsZvnc7X+SjQQqEqcwS6jJMvZVgQ8M5dgar5Cu
	+u4VpPN2G9WEmpZ/Ak94f2DBaUJhGGFav/fgBzYg3asX8PfkUynIjD8F3WmX8nIHgDlg08CAl756P
	jxUe+fLIW8M66t05cSXMgcQ2EFNj3VdPh0eKZRnrLA9oj/jDwUWkBFz/zdCaKVBkMagVqyuKK9bx7
	yo4FVa9642y1Anx3+Zd9C1IPTWiSL9B8/2g6Ux6exIYwuwWcSftaGZo4O9XNvwfhC5J/ILgYW6nfq
	l/d1F8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjUL-00000006kun-0SoD;
	Tue, 11 Nov 2025 08:12:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjUI-00000006kr1-0xTP;
	Tue, 11 Nov 2025 08:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bgClGoRUUCExaga3kY1+xG8HW2a8/5Ewtov/asu0Kgc=; b=ArH964ZSq1X08IIjUFO51Dqx0A
	Bpc8gI/LywhRwzKGqzaT5dmp3zNWFHSjdv+MAKJxoji4GL/mjwoPLJQjgSuAIuUpGkhfgbKS1uyFy
	zud9yKIWiD0uH3IcV8VyXF+asM0hK9nw1b2aNtgF+vDOwKehFuiAqnJ2JAQo4jBu19HMWoiSuK/Cj
	LF0EBQUzsaDEWcYmflNz1AJ+96scbsC5OSgOgiVujxsFmQDU+1U4/MmNnKpemE/CrPkkfA+vjLqp2
	VbgSBxFg5unE1cMCjfX6jn2y3Hrq8N7gZbDRKwRIZEGTCDj4ebibjaZzEfgUYJ1LP+JV6RORV0S60
	rZfI1TKg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56306 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjU7-000000002Az-2D3g;
	Tue, 11 Nov 2025 08:12:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjU4-0000000DqtV-3qsX;
	Tue, 11 Nov 2025 08:12:12 +0000
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 06/13] net: stmmac: mediatek: simplify
 set_interface() methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vIjU4-0000000DqtV-3qsX@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:12 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_001226_276071_99CE730B 
X-CRM114-Status: GOOD (  11.56  )
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

Use the phy_intf_sel field value when deciding what other options to
apply for the configuration register.

Note that this will allow GMII as well as MII as the phy_intf_sel
value is the same for both.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 50 +++++--------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 0f32732efb75..1f2d7d19ca56 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -110,26 +110,13 @@ static const char * const mt8195_dwmac_clk_l[] = {
 static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
-	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
-	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
-	u32 intf_val;
+	u32 intf_val = phy_intf_sel;
 
-	intf_val = phy_intf_sel;
-
-	/* select phy interface in top control domain */
-	switch (plat->phy_mode) {
-	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= rmii_rxc | rmii_clk_from_mac;
-		break;
-	case PHY_INTERFACE_MODE_MII:
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-		break;
-	default:
-		dev_err(plat->dev, "phy interface not supported\n");
-		return -EINVAL;
+	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
+		if (plat->rmii_clk_from_mac)
+			intf_val |= RMII_CLK_SRC_INTERNAL;
+		if (plat->rmii_rxc)
+			intf_val |= RMII_CLK_SRC_RXC;
 	}
 
 	regmap_write(plat->peri_regmap, PERI_ETH_PHY_INTF_SEL, intf_val);
@@ -289,26 +276,13 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
-	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
-	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
-	u32 intf_val;
+	u32 intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
 
-	intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
-
-	/* select phy interface in top control domain */
-	switch (plat->phy_mode) {
-	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= rmii_rxc | rmii_clk_from_mac;
-		break;
-	case PHY_INTERFACE_MODE_MII:
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-		break;
-	default:
-		dev_err(plat->dev, "phy interface not supported\n");
-		return -EINVAL;
+	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
+		if (plat->rmii_clk_from_mac)
+			intf_val |= MT8195_RMII_CLK_SRC_INTERNAL;
+		if (plat->rmii_rxc)
+			intf_val |= MT8195_RMII_CLK_SRC_RXC;
 	}
 
 	/* MT8195 only support external PHY */
-- 
2.47.3



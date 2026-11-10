Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51995606A50D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zzPaTMJO;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qYijceWV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=In3mbPH+PeqpuZ21OoiKQ/lny0B5PiDRBDgVSuWiNFo=; b=zzPaTMJOiUSJTf
	JmasfgxLr0oteX494IgO+N545JAQOgeEivFbK98ASb6mW2+2B60XoHQEzmuFLxFi79kHqxJiEasw4
	3K6c+plZ2rk8+XRer+uaH6rxAq/HXvbVG4wlIpz4jCZF05zFfNxr7nAothdarvfMOZrPgqT9mFpMK
	y56t+oLBIPj7suaxG9WegTvJkHO+A185zXh03oXY7wgob3EKI6DYcjbGhJyjPgcc05uvatK+qyFuy
	mGnWXYsrF05VZVIaHY5u9fSg6s3IRAfTNSomzy/6Fob8yR4XFtn9TVZWuajAJ5Rqi2vsRSN1PR8FB
	srUcQ3DEifHuW2Eh6Hew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkf6-00000003l13-3sm8;
	Tue, 10 Nov 2026 12:09:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkev-00000003kkF-1dz5;
	Tue, 10 Nov 2026 12:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794312543;
	bh=VR1xLM9crmsR0B4dFSSC/PCirYYuO9+Cgyxo5eh1Zh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qYijceWV1lxuLppyHmsxwNL3o0V6zV2JsxGybjLS/DUm3d6Pl2eXyskgHck5D7rLf
	 xgcMcwPho538yZ5cUXtrMqbH+0yMJnXLI9PA7H/5k7+B8X64CcYJH0+Ne4XHoX4CwP
	 II+6Lw9NMu8+P4P816q/+7opGdCRBopcZ/uDOV+ArgYbXxT0UCCXnblSs5/qBFReIb
	 5iGEvrqGgshoeIPMxjri/sstHZ1rvx5rVzA0nGlvgq2x3wmII7wu2V0VcYvlErWXFX
	 6B2+kJvYCMAbdr0V7n+KGXR99SdCnEbelGc/Bv2FD230meOab2LybmHPbtyDVe3Eun
	 GpbPv1qnFv5LA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4677417E0F7F;
	Tue, 10 Nov 2026 13:09:02 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 10 Nov 2026 13:08:51 +0100
Subject: [PATCH net-next v5 04/10] net: stmmac: mediatek: simplify TX/RX
 delay handling in mt8195_set_delay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dwmac-mediatek-mt8189-v5-4-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794312537; l=7832;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=VR1xLM9crmsR0B4dFSSC/PCirYYuO9+Cgyxo5eh1Zh8=;
 b=xv9Klmfir4THlINKi7SEf0fD95t5j2kIeikhTmCMJsOsOVCwgzacVLFB0PQMdN3G6gv7XxErJ
 7KjgiYQc1dOCyXe7kvjpXwTIUdeynM4VlK9z/rSop673IKPbGLYhiGn
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_040905_631919_F426E2C6 
X-CRM114-Status: GOOD (  21.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The mt8195_set_delay function modifies at its beginning the TX and RX
internal delay variables, located in the driver data, by dividing
them by a constant (290) and restores their original values by
multiplying them again at the function end. It is done in order to
convert them into a step value, used by the hardware registers for
setting these delays.

But this is rather pointless to modify the driver data for that, while
it could be done locally in the function. The original delay values
cannot be used anymore (if needed) during mt8195_set_delay processing.
Finally, they are altered after the function call if they are not a
multiple of 290.

So, simplify these delay variable handling by using local variables to
convert them into the register value and use those in the write calls.
Also, remove the two private conversion functions, that are not useful
anymore and add definitions for MT8195 RX/TX delay maximum and divider
values.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 91 ++++++++++++----------
 1 file changed, 50 insertions(+), 41 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 30ae0dba7fff..ac473222213f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -63,6 +63,11 @@
 #define MT8195_DLY_RMII_TXC_ENABLE	BIT(5)
 #define MT8195_DLY_RMII_TXC_STAGES	GENMASK(4, 0)
 
+#define MT8195_MII_DLY_STAGE_DIV	290 /* 290ps per stage */
+#define MT8195_MII_DELAY_MAX		9280 /* 32 x 290ps */
+#define MT8195_RGMII_DLY_STAGE_DIV	290 /* 290ps per stage */
+#define MT8195_RGMII_DELAY_MAX		9280 /* 32 x 290ps */
+
 struct mac_delay_struct {
 	u32 tx_delay;
 	u32 rx_delay;
@@ -293,42 +298,39 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 	return 0;
 }
 
-static void mt8195_delay_ps2stage(struct mediatek_dwmac_plat_data *plat)
-{
-	struct mac_delay_struct *mac_delay = &plat->mac_delay;
-
-	/* 290ps per stage */
-	mac_delay->tx_delay /= 290;
-	mac_delay->rx_delay /= 290;
-}
-
-static void mt8195_delay_stage2ps(struct mediatek_dwmac_plat_data *plat)
-{
-	struct mac_delay_struct *mac_delay = &plat->mac_delay;
-
-	/* 290ps per stage */
-	mac_delay->tx_delay *= 290;
-	mac_delay->rx_delay *= 290;
-}
-
 static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
-	u32 gtxc_delay_val = 0, delay_val = 0, rmii_delay_val = 0;
-
-	mt8195_delay_ps2stage(plat);
+	u32 rx_delay_stage_val, tx_delay_stage_val;
+	u32 gtxc_delay_val = 0;
+	u32 rmii_delay_val = 0;
+	u32 delay_val = 0;
 
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
-		delay_val |= FIELD_PREP(MT8195_DLY_TXC_ENABLE, !!mac_delay->tx_delay);
-		delay_val |= FIELD_PREP(MT8195_DLY_TXC_STAGES, mac_delay->tx_delay);
+		rx_delay_stage_val = mac_delay->rx_delay
+				     / MT8195_MII_DLY_STAGE_DIV;
+		tx_delay_stage_val = mac_delay->tx_delay
+				     / MT8195_MII_DLY_STAGE_DIV;
+
+		delay_val |= FIELD_PREP(MT8195_DLY_TXC_ENABLE,
+					!!tx_delay_stage_val);
+		delay_val |= FIELD_PREP(MT8195_DLY_TXC_STAGES,
+					tx_delay_stage_val);
 		delay_val |= FIELD_PREP(MT8195_DLY_TXC_INV, mac_delay->tx_inv);
 
-		delay_val |= FIELD_PREP(MT8195_DLY_RXC_ENABLE, !!mac_delay->rx_delay);
-		delay_val |= FIELD_PREP(MT8195_DLY_RXC_STAGES, mac_delay->rx_delay);
+		delay_val |= FIELD_PREP(MT8195_DLY_RXC_ENABLE,
+					!!rx_delay_stage_val);
+		delay_val |= FIELD_PREP(MT8195_DLY_RXC_STAGES,
+					rx_delay_stage_val);
 		delay_val |= FIELD_PREP(MT8195_DLY_RXC_INV, mac_delay->rx_inv);
 		break;
 	case PHY_INTERFACE_MODE_RMII:
+		rx_delay_stage_val = mac_delay->rx_delay
+				     / MT8195_MII_DLY_STAGE_DIV;
+		tx_delay_stage_val = mac_delay->tx_delay
+				     / MT8195_MII_DLY_STAGE_DIV;
+
 		if (plat->rmii_clk_from_mac) {
 			/* case 1: mac provides the rmii reference clock,
 			 * and the clock output to TXC pin.
@@ -336,16 +338,16 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 			 * The ingress timing can be adjusted by RMII_RXC delay macro circuit.
 			 */
 			rmii_delay_val |= FIELD_PREP(MT8195_DLY_RMII_TXC_ENABLE,
-						     !!mac_delay->tx_delay);
+						     !!tx_delay_stage_val);
 			rmii_delay_val |= FIELD_PREP(MT8195_DLY_RMII_TXC_STAGES,
-						     mac_delay->tx_delay);
+						     tx_delay_stage_val);
 			rmii_delay_val |= FIELD_PREP(MT8195_DLY_RMII_TXC_INV,
 						     mac_delay->tx_inv);
 
 			rmii_delay_val |= FIELD_PREP(MT8195_DLY_RMII_RXC_ENABLE,
-						     !!mac_delay->rx_delay);
+						     !!rx_delay_stage_val);
 			rmii_delay_val |= FIELD_PREP(MT8195_DLY_RMII_RXC_STAGES,
-						     mac_delay->rx_delay);
+						     rx_delay_stage_val);
 			rmii_delay_val |= FIELD_PREP(MT8195_DLY_RMII_RXC_INV,
 						     mac_delay->rx_inv);
 		} else {
@@ -361,9 +363,9 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 				 * by RXC delay macro circuit.
 				 */
 				delay_val |= FIELD_PREP(MT8195_DLY_RXC_ENABLE,
-							!!mac_delay->rx_delay);
+							!!rx_delay_stage_val);
 				delay_val |= FIELD_PREP(MT8195_DLY_RXC_STAGES,
-							mac_delay->rx_delay);
+							rx_delay_stage_val);
 				delay_val |= FIELD_PREP(MT8195_DLY_RXC_INV,
 							mac_delay->rx_inv);
 			} else {
@@ -372,9 +374,9 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 				 * by TXC delay macro circuit.
 				 */
 				delay_val |= FIELD_PREP(MT8195_DLY_TXC_ENABLE,
-							!!mac_delay->rx_delay);
+							!!rx_delay_stage_val);
 				delay_val |= FIELD_PREP(MT8195_DLY_TXC_STAGES,
-							mac_delay->rx_delay);
+							rx_delay_stage_val);
 				delay_val |= FIELD_PREP(MT8195_DLY_TXC_INV,
 							mac_delay->rx_inv);
 			}
@@ -384,12 +386,21 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE, !!mac_delay->tx_delay);
-		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_STAGES, mac_delay->tx_delay);
+		rx_delay_stage_val = mac_delay->rx_delay
+				     / MT8195_RGMII_DLY_STAGE_DIV;
+		tx_delay_stage_val = mac_delay->tx_delay
+				     / MT8195_RGMII_DLY_STAGE_DIV;
+
+		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE,
+					     !!tx_delay_stage_val);
+		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_STAGES,
+					     tx_delay_stage_val);
 		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_INV, mac_delay->tx_inv);
 
-		delay_val |= FIELD_PREP(MT8195_DLY_RXC_ENABLE, !!mac_delay->rx_delay);
-		delay_val |= FIELD_PREP(MT8195_DLY_RXC_STAGES, mac_delay->rx_delay);
+		delay_val |= FIELD_PREP(MT8195_DLY_RXC_ENABLE,
+					!!rx_delay_stage_val);
+		delay_val |= FIELD_PREP(MT8195_DLY_RXC_STAGES,
+					rx_delay_stage_val);
 		delay_val |= FIELD_PREP(MT8195_DLY_RXC_INV, mac_delay->rx_inv);
 
 		break;
@@ -408,8 +419,6 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 	regmap_write(plat->peri_regmap, MT8195_PERI_ETH_CTRL1, delay_val);
 	regmap_write(plat->peri_regmap, MT8195_PERI_ETH_CTRL2, rmii_delay_val);
 
-	mt8195_delay_stage2ps(plat);
-
 	return 0;
 }
 
@@ -418,8 +427,8 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.dwmac_set_delay = mt8195_set_delay,
 	.clk_list = mt8195_dwmac_clk_l,
 	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
-	.rx_delay_max = 9280,
-	.tx_delay_max = 9280,
+	.rx_delay_max = MT8195_MII_DELAY_MAX,
+	.tx_delay_max = MT8195_MII_DELAY_MAX,
 	.dma_bit_mask = 35,
 };
 

-- 
2.56.0



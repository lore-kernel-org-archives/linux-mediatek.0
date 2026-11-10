Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA4606A332
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 12:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=miNXF/oZ;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=hUWOIrie
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ljb2ROakm/7yv3tvrmiWdL9P5YB+0wWTcdNkA0NOh5I=; b=miNXF/oZCeoJMD
	yP9szIoYz3p2QuHdlhbV774NtxJ5CoFLbpz56hPBSYYCCQDJUU3jv9mWgUQfYztwPJrAtj8YcbQtL
	xjBshJqoy1lmHNlTv4ZVT91Wl+r4Ee4tDrIr67ipPf0ofL6UUzLst9uknoigG0pBh4l3PsPkatgUh
	p4TYSPYjCu4knfk1Fhq8RWIQd5XOBHcrIw7BOwPu6X8vWufBq0VPXxuaS18OXD1UVxwy8VA05SJPe
	snpY+w0vn6tHUMmgVJ0YQ4/mopBaPbbD2Ppc09M+jLYCKXJE5IjHGnSI0XgNIE2lQ3uYxNX8q7oXX
	+uwQUBDXL1XAMR9Vd7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkfL-00000003lFL-2Jtn;
	Tue, 10 Nov 2026 12:09:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkex-00000003klg-2k2o;
	Tue, 10 Nov 2026 12:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794312545;
	bh=9zTfpFSOfSR7K4KelXmqsZfnPzJ3QJQHwaaNyOyw9oU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hUWOIrie0jZ8WzOerZkSwJOL+9GmmvTPA9WgduRFQOF23VX22i5UG4m5Ds2fuWRnJ
	 qHrUDuCF4AKEPZRUFuapMldSxLMHBfETaZOFJc0xjkwHdbPhrtHfMVjZskwCYEh7B4
	 oYfjv4WyDddOwlEG6YhwHA95TKlAcd/vhB1U7Vd2/fPwwN+3GOH2lxbBOlTV4RX/vm
	 598PceswMn3XuMkUGYhLmCYZCotuOWJToXqYGnk6NpACCIazOqNbesBOsGbdCZOmQa
	 G37QZKT9CaUwwZ6jEjubewmVaMFsnaowHN10Kz1rRM6uf0VZflExMobgTysvcxRnul
	 7PwufC7rzSdkA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6439017E1054;
	Tue, 10 Nov 2026 13:09:04 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 10 Nov 2026 13:08:53 +0100
Subject: [PATCH net-next v5 06/10] net: stmmac: mediatek: use standard
 internal delay properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dwmac-mediatek-mt8189-v5-6-7d99d6292962@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794312537; l=6869;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=9zTfpFSOfSR7K4KelXmqsZfnPzJ3QJQHwaaNyOyw9oU=;
 b=UjW5NzVt6aJGoFdhsBj3HAsHvhnfvWevTvJnmRLUfueCdauVQYkQQLcCUgLqoNHNLQQZzy9LL
 mMsK0SMRSQrBikN2co2I0WcT5c71GgL7fxLlcNZFAEIPMB4jpO8hOnC
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_040908_025306_533924CC 
X-CRM114-Status: GOOD (  16.73  )
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

Currently, the mediatek-dwmac driver uses the 'mediatek,rx-delay-ps'
and 'mediatek,tx-delay-ps' vendor properties for configuring the RX and
TX internal clock delays for all its supported PHY modes (MII, RMII,
and RGMII).

The generic Ethernet controller bindings provide 'rx-internal-delay-ps'
and 'tx-internal-delay-ps' standard properties to describe the RGMII RX
and TX internal clock delays. Their use is now recommended, rather than
existing vendor properties.
There is no equivalent standard properties for RMII and MII case at the
moment.

So, add in driver data separate config values for MII/RMII and RGMII
delays and modify mediatek_dwmac_config_dt, used to parse devicetree
to populate and check these configs with the following logic:
 - read vendor properties for MII and RMII delay timings
 - read standard properties for RGMII delay timings
 - if not available, fallback to vendor values

Also, modify mt2712/mt8195_set_delay to use these new separate config
values.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 81 ++++++++++++++++------
 1 file changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index cda3f3edde39..ee43d694099b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -76,6 +76,8 @@
 struct mac_delay_struct {
 	u32 tx_delay;
 	u32 rx_delay;
+	u32 rgmii_tx_delay;
+	u32 rgmii_rx_delay;
 	bool tx_inv;
 	bool rx_inv;
 };
@@ -103,8 +105,8 @@ struct mediatek_dwmac_variant {
 	const char * const *clk_list;
 	int num_clks;
 
-	u32 rx_delay_max;
-	u32 tx_delay_max;
+	u32 mii_delay_max;
+	u32 rgmii_delay_max;
 	u8 dma_bit_mask;
 };
 
@@ -223,9 +225,9 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		rx_delay_stage_val = mac_delay->rx_delay
+		rx_delay_stage_val = mac_delay->rgmii_rx_delay
 				     / MT2712_RGMII_DLY_STAGE_DIV;
-		tx_delay_stage_val = mac_delay->tx_delay
+		tx_delay_stage_val = mac_delay->rgmii_tx_delay
 				     / MT2712_RGMII_DLY_STAGE_DIV;
 
 		fine_val = ETH_FINE_DLY_GTXC | ETH_FINE_DLY_RXC;
@@ -257,8 +259,8 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 	.dwmac_set_delay = mt2712_set_delay,
 	.clk_list = mt2712_dwmac_clk_l,
 	.num_clks = ARRAY_SIZE(mt2712_dwmac_clk_l),
-	.rx_delay_max = MT2712_MII_DELAY_MAX,
-	.tx_delay_max = MT2712_MII_DELAY_MAX,
+	.mii_delay_max = MT2712_MII_DELAY_MAX,
+	.rgmii_delay_max = MT2712_RGMII_DELAY_MAX,
 	.dma_bit_mask = 33,
 };
 
@@ -370,9 +372,9 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		rx_delay_stage_val = mac_delay->rx_delay
+		rx_delay_stage_val = mac_delay->rgmii_rx_delay
 				     / MT8195_RGMII_DLY_STAGE_DIV;
-		tx_delay_stage_val = mac_delay->tx_delay
+		tx_delay_stage_val = mac_delay->rgmii_tx_delay
 				     / MT8195_RGMII_DLY_STAGE_DIV;
 
 		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE,
@@ -411,15 +413,18 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.dwmac_set_delay = mt8195_set_delay,
 	.clk_list = mt8195_dwmac_clk_l,
 	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
-	.rx_delay_max = MT8195_MII_DELAY_MAX,
-	.tx_delay_max = MT8195_MII_DELAY_MAX,
+	.mii_delay_max = MT8195_MII_DELAY_MAX,
+	.rgmii_delay_max = MT8195_RGMII_DELAY_MAX,
 	.dma_bit_mask = 35,
 };
 
 static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
-	u32 tx_delay_ps, rx_delay_ps;
+	u32 rgmii_tx_delay_ps = 0;
+	u32 rgmii_rx_delay_ps = 0;
+	u32 tx_delay_ps = 0;
+	u32 rx_delay_ps = 0;
 
 	plat->peri_regmap = syscon_regmap_lookup_by_phandle(plat->np, "mediatek,pericfg");
 	if (IS_ERR(plat->peri_regmap)) {
@@ -427,24 +432,58 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
 		return PTR_ERR(plat->peri_regmap);
 	}
 
-	if (!of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps)) {
-		if (tx_delay_ps < plat->variant->tx_delay_max) {
-			mac_delay->tx_delay = tx_delay_ps;
-		} else {
-			dev_err(plat->dev, "Invalid TX clock delay: %dps\n", tx_delay_ps);
+	of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps);
+	if (tx_delay_ps >= plat->variant->mii_delay_max) {
+		dev_err(plat->dev, "Invalid TX clock delay: %dps\n",
+			tx_delay_ps);
+		return -EINVAL;
+	}
+
+	/* Read RGMII TX internal delay standard property */
+	if (!of_property_read_u32(plat->np, "tx-internal-delay-ps",
+				  &rgmii_tx_delay_ps)) {
+		if (rgmii_tx_delay_ps >= plat->variant->rgmii_delay_max) {
+			dev_err(plat->dev, "Invalid RGMII TX clock delay: %dps\n",
+				rgmii_tx_delay_ps);
 			return -EINVAL;
 		}
+	} else {
+		/*
+		 * standard property value not available, fallback on vendor
+		 * value instead and cap it to max RGMII delay value
+		 */
+		rgmii_tx_delay_ps = min(tx_delay_ps,
+					plat->variant->rgmii_delay_max);
 	}
 
-	if (!of_property_read_u32(plat->np, "mediatek,rx-delay-ps", &rx_delay_ps)) {
-		if (rx_delay_ps < plat->variant->rx_delay_max) {
-			mac_delay->rx_delay = rx_delay_ps;
-		} else {
-			dev_err(plat->dev, "Invalid RX clock delay: %dps\n", rx_delay_ps);
+	of_property_read_u32(plat->np, "mediatek,rx-delay-ps", &rx_delay_ps);
+	if (rx_delay_ps >= plat->variant->mii_delay_max) {
+		dev_err(plat->dev, "Invalid RX clock delay: %dps\n",
+			rx_delay_ps);
+		return -EINVAL;
+	}
+
+	/* Read RGMII RX internal delay standard property */
+	if (!of_property_read_u32(plat->np, "rx-internal-delay-ps",
+				  &rgmii_rx_delay_ps)) {
+		if (rgmii_rx_delay_ps >= plat->variant->rgmii_delay_max) {
+			dev_err(plat->dev, "Invalid RGMII RX clock delay: %dps\n",
+				rgmii_rx_delay_ps);
 			return -EINVAL;
 		}
+	} else {
+		/*
+		 * standard property value not available, fallback on vendor
+		 * value instead and cap it to max RGMII delay value
+		 */
+		rgmii_rx_delay_ps = min(rx_delay_ps,
+					plat->variant->rgmii_delay_max);
 	}
 
+	mac_delay->rx_delay = rx_delay_ps;
+	mac_delay->tx_delay = tx_delay_ps;
+	mac_delay->rgmii_rx_delay = rgmii_rx_delay_ps;
+	mac_delay->rgmii_tx_delay = rgmii_tx_delay_ps;
 	mac_delay->tx_inv = of_property_read_bool(plat->np, "mediatek,txc-inverse");
 	mac_delay->rx_inv = of_property_read_bool(plat->np, "mediatek,rxc-inverse");
 	plat->rmii_rxc = of_property_read_bool(plat->np, "mediatek,rmii-rxc");

-- 
2.56.0



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87D7C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 07:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyLi655fRlGzISUNyT/xvu6TEKN5PJCN3blt5ogeZ+M=; b=qQeEzPlnHySBuh9pvxeGqfwMY+
	Nb49wUtW5O/JfA3jYydMRKri3wvqptcjLCNONVC7b8gXhXpfgZt7YVUmzGJcEz9nJaTOqBIQm5t/j
	iEexuSwkuj5HqiUa3Xz0cz7GeJ1xBbq/pnBU8U2rVxKDmT9uXRPHN/bwQ6NT1Pl7pDjuFBGFtwveL
	xpZVEATFGp15L6zGyY+GxN9AbTz4HbHuM4acjan3jjYOcUbAXKGW+U8Wy9FVn9W5k4qf5alM7/RyM
	5J5MUKjM56QBAmK3WKQ+QSw9Vf8WNDj/aMlx7yyZrDXIhXANY1rT5CbM1KQIVbcx8bJAQiYBLVADR
	cE1Vuyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAQUd-002aaX-HG; Wed, 28 Dec 2022 07:04:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAQUb-002aXd-8C; Wed, 28 Dec 2022 07:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gyLi655fRlGzISUNyT/xvu6TEKN5PJCN3blt5ogeZ+M=; b=XiHg2j3o+d78HuIt/siQNf+oHf
	emwUorbkAs1iKzokt7+wJcRnoGn/ho04h/FUPYPxQbjxGBQi6aCoa+obiBnWW+/rA/9K9/SAs+kCt
	8/CVw6z1dDrg/0heiA06dyGse8sFJxR0guxaRVFy7dUluMI9Sp/Xb3HknkI+XVJ+lvI+KMzN+oJG7
	/Q6R+VOVYwLyeKrVQlf7QzosVAlMjFoXLcduknIE3TXY3kgEnE6qu+m2hybW/6MKkpTkp73486xAD
	DMT3npn6XDldSW3qdjX+JlEi9DcHB7nvmLjG9AZjGFOo7mwPNypo6g+pbtD6fKiPbQSZTjhX78rF3
	xic+kBBg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pAQUQ-00Fv2x-2v;
	Wed, 28 Dec 2022 07:04:42 +0000
X-UUID: e61d94680c3d43e69117992d772338e4-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gyLi655fRlGzISUNyT/xvu6TEKN5PJCN3blt5ogeZ+M=;
	b=qqXPfTzdYAxeCqy+beYe6iL4oN38+oz4/WBmcBD39983I+jB1KHlaQBfCpegrGtZyNe6nw5jME4aVVnV6Jp4SjhRzFkGtwGlaJhscBkipJmN5ZM1bIlPxzQsidtIflyGUXErc8vbfI9djflrIVmufgN6PJoJc+WOpOIEmTn9aAY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:7f25dab8-15cb-4476-88e0-aa68fdd6c157,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:407a9c8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e61d94680c3d43e69117992d772338e4-20221228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 105234136; Wed, 28 Dec 2022 00:04:13 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 28 Dec 2022 14:33:35 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 28 Dec 2022 14:33:33 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Biao
 Huang" <biao.huang@mediatek.com>, <macpaul.lin@mediatek.com>
Subject: [PATCH v6 1/2] stmmac: dwmac-mediatek: remove the dwmac_fix_mac_speed
Date: Wed, 28 Dec 2022 14:33:29 +0800
Message-ID: <20221228063331.10756-2-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228063331.10756-1-biao.huang@mediatek.com>
References: <20221228063331.10756-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_070439_845068_06DD5FC6 
X-CRM114-Status: GOOD (  14.08  )
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

In current driver, MAC will always enable 2ns delay in RGMII mode,
but that's not the correct usage.

Remove the dwmac_fix_mac_speed() in driver, and recommend "rgmii-id"
for phy-mode in device tree.

Fixes: f2d356a6ab71 ("stmmac: dwmac-mediatek: add support for mt8195")
Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index d42e1afb6521..2f7d8e4561d9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -90,7 +90,6 @@ struct mediatek_dwmac_plat_data {
 struct mediatek_dwmac_variant {
 	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat);
 	int (*dwmac_set_delay)(struct mediatek_dwmac_plat_data *plat);
-	void (*dwmac_fix_mac_speed)(void *priv, unsigned int speed);
 
 	/* clock ids to be requested */
 	const char * const *clk_list;
@@ -443,32 +442,9 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 	return 0;
 }
 
-static void mt8195_fix_mac_speed(void *priv, unsigned int speed)
-{
-	struct mediatek_dwmac_plat_data *priv_plat = priv;
-
-	if ((phy_interface_mode_is_rgmii(priv_plat->phy_mode))) {
-		/* prefer 2ns fixed delay which is controlled by TXC_PHASE_CTRL,
-		 * when link speed is 1Gbps with RGMII interface,
-		 * Fall back to delay macro circuit for 10/100Mbps link speed.
-		 */
-		if (speed == SPEED_1000)
-			regmap_update_bits(priv_plat->peri_regmap,
-					   MT8195_PERI_ETH_CTRL0,
-					   MT8195_RGMII_TXC_PHASE_CTRL |
-					   MT8195_DLY_GTXC_ENABLE |
-					   MT8195_DLY_GTXC_INV |
-					   MT8195_DLY_GTXC_STAGES,
-					   MT8195_RGMII_TXC_PHASE_CTRL);
-		else
-			mt8195_set_delay(priv_plat);
-	}
-}
-
 static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.dwmac_set_phy_interface = mt8195_set_interface,
 	.dwmac_set_delay = mt8195_set_delay,
-	.dwmac_fix_mac_speed = mt8195_fix_mac_speed,
 	.clk_list = mt8195_dwmac_clk_l,
 	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
 	.dma_bit_mask = 35,
@@ -619,8 +595,6 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
 	plat->bsp_priv = priv_plat;
 	plat->init = mediatek_dwmac_init;
 	plat->clks_config = mediatek_dwmac_clks_config;
-	if (priv_plat->variant->dwmac_fix_mac_speed)
-		plat->fix_mac_speed = priv_plat->variant->dwmac_fix_mac_speed;
 
 	plat->safety_feat_cfg = devm_kzalloc(&pdev->dev,
 					     sizeof(*plat->safety_feat_cfg),
-- 
2.25.1



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93FAC46467
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 15:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyLi655fRlGzISUNyT/xvu6TEKN5PJCN3blt5ogeZ+M=; b=uvgvLke2WfNT5fV7Ib5pHdZ8m+
	yYKLh/Ek0QKa0RP4wtxLZiizF7E9tVI23VPJAHwr0bYCGwvseFalnTuKzeaR5LmM/jb8CX66wPdr3
	lO5+hE2Ftjt5uNGqgjbHVjSQbeA/qt0GZG8llLNpgiOs86E0fu+S4UoH/vUxE/sFw64Mn0Wpvxp4J
	Nz7L9tRpvSqOTTdqs/RP1lB/S2YR+x3C+/dTtI43YOiQQlgPOvMfhOF2x8Z3mhSbSgMU3BbMHelYa
	9sE8xb4kQko7qI4EE3MRtjukwR/oV2qEarvAAPj27yR6AJd3U7OgZM4tJOTG3EaFHJ8EiMo021Tul
	aky4veUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5Xo-00A32o-Jp; Wed, 04 Jan 2023 15:19:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0m0-008Koe-De; Wed, 04 Jan 2023 10:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gyLi655fRlGzISUNyT/xvu6TEKN5PJCN3blt5ogeZ+M=; b=cuqb0Qt9NdRmoX1m6/yrwKbtFH
	q5J3h2po8nY2UTHXV1eaWZt0KvDIHzma//Th7LB0mwlHbKNtb57GXBV1s+qeZvrQdu805ct6MliPC
	8PYpce9tSUBWLM5JHWOjzVUVZwtmqdOxq3zZw3GFwPU0l6lDUhmOn/yLl3HwtoFoac+EIMPLMjmpo
	r3Hv2TDq1d0lr3uCnzl/7P0Bn+wxQxgKzbiFQLZ5AiGU+9OUrT0eVsSMNiDMGt6DlAVKslcWdvXk+
	wLLHsba+QTE/jhkeZoTxex2Sm6576BcU5QeYVM3WoSLgYMPIr8gb5byWV08uwprtPIwVVY5Pv9DOg
	1JF9EY+g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pCzvR-000sGj-34;
	Wed, 04 Jan 2023 09:19:13 +0000
X-UUID: 6f226ed29ccd45519b1d4125a5826b48-20230104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gyLi655fRlGzISUNyT/xvu6TEKN5PJCN3blt5ogeZ+M=;
	b=qaQb4n7a1F6x73eMcXxbzxxabLfL+o+PAvg3LkVlsGirP326+fO4d4DR0GlSbXoAahj/iigrqrPIpPD7Pj9c+7/MJEt9ic3V8MV8KsXIarshVJLAMPPCoy+UAO5dUYukckkOQSKh2tIz6kz2ZXRbRj6yO58ujBkjAb9otDfMYrI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:5237fdc0-5e36-41d5-87ff-3b9c1f62a67f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:09771b1,CLOUDID:d7b7368b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 6f226ed29ccd45519b1d4125a5826b48-20230104
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1381700755; Wed, 04 Jan 2023 02:19:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 4 Jan 2023 16:59:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 4 Jan 2023 16:59:02 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Biao
 Huang <biao.huang@mediatek.com>, <macpaul.lin@mediatek.com>,
	<netdev@vger.kernel.org>
Subject: [PATCH v7 1/2] stmmac: dwmac-mediatek: remove the dwmac_fix_mac_speed
Date: Wed, 4 Jan 2023 16:58:56 +0800
Message-ID: <20230104085857.2410-2-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104085857.2410-1-biao.huang@mediatek.com>
References: <20230104085857.2410-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_091910_751082_27AAF831 
X-CRM114-Status: GOOD (  14.99  )
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



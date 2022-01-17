Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CDBC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 07:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ww1Z7PhjHSj+EPyd6S0HzFrqWO3kaNt4LO5LWuno0C8=; b=l3NfT7A/4eecFn
	qkbjWGI2RAimkPcnq+2+DuYc661XnSuEvgk8zIjQb3HwDIYAthiry/Ixp8i7riJDrhlTDshK0wiH5
	xhQhBO43jofOaupBH8SWJ8AjiPwp55gG1Uxx+Lr78uqRPFPuoBYX+EpY7YjA1QsYJxsYNnWl0mzsr
	FBzh8BgJDpukdgENjs2Xowy6tx7r5yJQNTRjPj6w6VCCUKHawfJK0RBKVhCXEioaanZvKHre+zSbX
	f75HyUCgCr+cWEGJIjVhEqPPSXm2755mIy47xVDBt73h6q7Xrp3siQdn5YD5geQ7pi6VGLD6MUb+S
	7VwYC6sJ3kEDS2oLRYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9MKo-00DqA6-Rg; Mon, 17 Jan 2022 07:21:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9MFg-00Dnk5-V5; Mon, 17 Jan 2022 07:16:34 +0000
X-UUID: 05fff5330aec49b399c070a77efad7bc-20220117
X-UUID: 05fff5330aec49b399c070a77efad7bc-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1866403132; Mon, 17 Jan 2022 00:16:17 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 23:07:14 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 17 Jan 2022 15:07:13 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 15:07:12 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <dkirjanov@suse.de>
Subject: [PATCH net-next v12 3/7] stmmac: dwmac-mediatek: re-arrange clock
 setting
Date: Mon, 17 Jan 2022 15:07:02 +0800
Message-ID: <20220117070706.17853-4-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117070706.17853-1-biao.huang@mediatek.com>
References: <20220117070706.17853-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_231629_067995_B73BF362 
X-CRM114-Status: GOOD (  22.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The rmii_internal clock is needed only when PHY
interface is RMII, and reference clock is from MAC.

Re-arrange the clock setting as following:
1. the optional "rmii_internal" is controlled by devm_clk_get(),
2. other clocks still be configured by devm_clk_bulk_get().

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 72 +++++++++++++------
 1 file changed, 49 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 8747aa4403e8..2678d2deb26a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -49,14 +49,15 @@ struct mac_delay_struct {
 struct mediatek_dwmac_plat_data {
 	const struct mediatek_dwmac_variant *variant;
 	struct mac_delay_struct mac_delay;
+	struct clk *rmii_internal_clk;
 	struct clk_bulk_data *clks;
-	struct device_node *np;
 	struct regmap *peri_regmap;
+	struct device_node *np;
 	struct device *dev;
 	phy_interface_t phy_mode;
-	int num_clks_to_config;
 	bool rmii_clk_from_mac;
 	bool rmii_rxc;
+	int num_clks;
 };
 
 struct mediatek_dwmac_variant {
@@ -74,7 +75,7 @@ struct mediatek_dwmac_variant {
 
 /* list of clocks required for mac */
 static const char * const mt2712_dwmac_clk_l[] = {
-	"axi", "apb", "mac_main", "ptp_ref", "rmii_internal"
+	"axi", "apb", "mac_main", "ptp_ref"
 };
 
 static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
@@ -83,23 +84,12 @@ static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
 	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
 	u32 intf_val = 0;
 
-	/* The clock labeled as "rmii_internal" in mt2712_dwmac_clk_l is needed
-	 * only in RMII(when MAC provides the reference clock), and useless for
-	 * RGMII/MII/RMII(when PHY provides the reference clock).
-	 * num_clks_to_config indicates the real number of clocks should be
-	 * configured, equals to (plat->variant->num_clks - 1) in default for all the case,
-	 * then +1 for rmii_clk_from_mac case.
-	 */
-	plat->num_clks_to_config = plat->variant->num_clks - 1;
-
 	/* select phy interface in top control domain */
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
 		intf_val |= PHY_INTF_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		if (plat->rmii_clk_from_mac)
-			plat->num_clks_to_config++;
 		intf_val |= (PHY_INTF_RMII | rmii_rxc | rmii_clk_from_mac);
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
@@ -314,18 +304,36 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
 static int mediatek_dwmac_clk_init(struct mediatek_dwmac_plat_data *plat)
 {
 	const struct mediatek_dwmac_variant *variant = plat->variant;
-	int i, num = variant->num_clks;
+	int i, ret;
+
+	plat->num_clks = variant->num_clks;
 
-	plat->clks = devm_kcalloc(plat->dev, num, sizeof(*plat->clks), GFP_KERNEL);
+	plat->clks = devm_kcalloc(plat->dev, plat->num_clks, sizeof(*plat->clks), GFP_KERNEL);
 	if (!plat->clks)
 		return -ENOMEM;
 
-	for (i = 0; i < num; i++)
+	for (i = 0; i < plat->num_clks; i++)
 		plat->clks[i].id = variant->clk_list[i];
 
-	plat->num_clks_to_config = variant->num_clks;
+	ret = devm_clk_bulk_get(plat->dev, plat->num_clks, plat->clks);
+	if (ret)
+		return ret;
+
+	/* The clock labeled as "rmii_internal" is needed only in RMII(when
+	 * MAC provides the reference clock), and useless for RGMII/MII or
+	 * RMII(when PHY provides the reference clock).
+	 * So, "rmii_internal" clock is got and configured only when
+	 * reference clock of RMII is from MAC.
+	 */
+	if (plat->rmii_clk_from_mac) {
+		plat->rmii_internal_clk = devm_clk_get(plat->dev, "rmii_internal");
+		if (IS_ERR(plat->rmii_internal_clk))
+			ret = PTR_ERR(plat->rmii_internal_clk);
+	} else {
+		plat->rmii_internal_clk = NULL;
+	}
 
-	return devm_clk_bulk_get(plat->dev, num, plat->clks);
+	return ret;
 }
 
 static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
@@ -350,20 +358,31 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
 		}
 	}
 
-	ret = clk_bulk_prepare_enable(plat->num_clks_to_config, plat->clks);
+	ret = clk_bulk_prepare_enable(plat->num_clks, plat->clks);
 	if (ret) {
 		dev_err(plat->dev, "failed to enable clks, err = %d\n", ret);
 		return ret;
 	}
 
+	ret = clk_prepare_enable(plat->rmii_internal_clk);
+	if (ret) {
+		dev_err(plat->dev, "failed to enable rmii internal clk, err = %d\n", ret);
+		goto err_clk;
+	}
+
 	return 0;
+
+err_clk:
+	clk_bulk_disable_unprepare(plat->num_clks, plat->clks);
+	return ret;
 }
 
 static void mediatek_dwmac_exit(struct platform_device *pdev, void *priv)
 {
 	struct mediatek_dwmac_plat_data *plat = priv;
 
-	clk_bulk_disable_unprepare(plat->num_clks_to_config, plat->clks);
+	clk_disable_unprepare(plat->rmii_internal_clk);
+	clk_bulk_disable_unprepare(plat->num_clks, plat->clks);
 }
 
 static int mediatek_dwmac_clks_config(void *priv, bool enabled)
@@ -372,13 +391,20 @@ static int mediatek_dwmac_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_bulk_prepare_enable(plat->num_clks_to_config, plat->clks);
+		ret = clk_bulk_prepare_enable(plat->num_clks, plat->clks);
 		if (ret) {
 			dev_err(plat->dev, "failed to enable clks, err = %d\n", ret);
 			return ret;
 		}
+
+		ret = clk_prepare_enable(plat->rmii_internal_clk);
+		if (ret) {
+			dev_err(plat->dev, "failed to enable rmii internal clk, err = %d\n", ret);
+			return ret;
+		}
 	} else {
-		clk_bulk_disable_unprepare(plat->num_clks_to_config, plat->clks);
+		clk_disable_unprepare(plat->rmii_internal_clk);
+		clk_bulk_disable_unprepare(plat->num_clks, plat->clks);
 	}
 
 	return ret;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

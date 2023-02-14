Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392D1C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ip9B6+gioiyo6SZ/raVVy5iaubJNXYv6TA895xO3I8=; b=1PrlSOuvzKdFhTX6isuN4LWg+l
	RKRgnyXjWPzPIDv7ArBk/cImt76geveIRiOoNWGO3NTeYV6LjkbYU5qZW8SWkU2d2r4LoWv+NNfT6
	SbPWbfEVy3VVc0VLrzewPzsXLwXMXAQJfcQR7744TAllI/Td3Mgbq0vbGiPstajHo0uGrct+fgf7r
	UcS8Pz+Q14axXE0xjcoL1bos9mWHWmQnZr7FHTKkPRouh4eSg0UFCsJycohaJ/072+SmrwxqqGgcC
	t479/wKaSfugGBUWfr2aMCEIv+eLVvXYbpxu5Rj9/qeU0d/hFWUdJF1wwmhs6hGBcht9nNkQSgemu
	csKIBqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvaS-001mM4-Fw; Tue, 14 Feb 2023 13:43:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvZ8-001laM-61; Tue, 14 Feb 2023 13:41:52 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A7CCC660216D;
	Tue, 14 Feb 2023 13:41:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676382108;
	bh=8FCYMfAOFtesOuQgR23iEJsH5DFbnIHYEwIdqw3++KI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=at+zjfObYId55dsjFa2epZ2YBlBrOIbCSJHQzUWQu3uwbKgpJcK//h6snfs1Uh3kW
	 6qly4csplWhZGjEZWrQriD7YCEdhs8Q66g11EEuIQVoSbC4gS2dmlljPOGfrOSzBBY
	 3OvPsLQcRfd2UeOYz7DTh2MhZg+A1lsbLjfg64khr37aapnWcF/S9l5XpYN9EHksw7
	 /2KA6PRAOvCb97Wr1YX4K44A+Cj1iY3/HKZd2MCHlQegfd2OepUCzyrfH393ElOerJ
	 SOisBXl3bLHRaTSrCEy66dSo7on1kmrdj7OaHs79tet/D8Rvxr6V/3AuVqVdCPTlCt
	 cSMNrEinzSN9A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 05/47] clk: mediatek: mt2712: Migrate topckgen/mcucfg to mtk_clk_simple_probe()
Date: Tue, 14 Feb 2023 14:40:45 +0100
Message-Id: <20230214134127.59273-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_054150_499911_23854F89 
X-CRM114-Status: GOOD (  14.77  )
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

Now that the common mtk_clk_simple_{probe,remove}() functions can deal
with divider clocks it is possible to migrate more clock drivers to it:
in this case, it's about topckgen.
While at it, also perform a fast migration for mcucfg.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt2712.c | 127 +++++-------------------------
 1 file changed, 21 insertions(+), 106 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index 94f8fc2a4f7b..db20c46e088b 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -36,14 +36,11 @@ static const struct mtk_fixed_clk top_fixed_clks[] = {
 	FIXED_CLK(CLK_TOP_CVBSPLL, "cvbspll", NULL, 108000000),
 };
 
-static const struct mtk_fixed_factor top_early_divs[] = {
+static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_SYS_26M, "sys_26m", "clk26m", 1,
 		1),
 	FACTOR(CLK_TOP_CLK26M_D2, "clk26m_d2", "sys_26m", 1,
 		2),
-};
-
-static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_ARMCA35PLL, "armca35pll_ck", "armca35pll", 1,
 		1),
 	FACTOR(CLK_TOP_ARMCA35PLL_600M, "armca35pll_600m", "armca35pll_ck", 1,
@@ -1295,114 +1292,30 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 	return r;
 }
 
-static struct clk_hw_onecell_data *top_clk_data;
-
-static void clk_mt2712_top_init_early(struct device_node *node)
-{
-	int r, i;
-
-	if (!top_clk_data) {
-		top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
-
-		for (i = 0; i < CLK_TOP_NR_CLK; i++)
-			top_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
-	}
-
-	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs),
-			top_clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, top_clk_data);
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
-}
-
-CLK_OF_DECLARE_DRIVER(mt2712_topckgen, "mediatek,mt2712-topckgen",
-			clk_mt2712_top_init_early);
-
-static int clk_mt2712_top_probe(struct platform_device *pdev)
-{
-	int r, i;
-	struct device_node *node = pdev->dev.of_node;
-	void __iomem *base;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		pr_err("%s(): ioremap failed\n", __func__);
-		return PTR_ERR(base);
-	}
-
-	if (!top_clk_data) {
-		top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
-	} else {
-		for (i = 0; i < CLK_TOP_NR_CLK; i++) {
-			if (top_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
-				top_clk_data->hws[i] = ERR_PTR(-ENOENT);
-		}
-	}
-
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-			top_clk_data);
-	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs),
-			top_clk_data);
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
-	mtk_clk_register_composites(&pdev->dev, top_muxes,
-				    ARRAY_SIZE(top_muxes), base,
-				    &mt2712_clk_lock, top_clk_data);
-	mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
-			&mt2712_clk_lock, top_clk_data);
-	mtk_clk_register_gates(&pdev->dev, node, top_clks,
-			       ARRAY_SIZE(top_clks), top_clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, top_clk_data);
-
-	if (r != 0)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
-
-	return r;
-}
-
-static int clk_mt2712_mcu_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-	void __iomem *base;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		pr_err("%s(): ioremap failed\n", __func__);
-		return PTR_ERR(base);
-	}
-
-	clk_data = mtk_alloc_clk_data(CLK_MCU_NR_CLK);
-
-	r = mtk_clk_register_composites(&pdev->dev, mcu_muxes,
-					ARRAY_SIZE(mcu_muxes), base,
-					&mt2712_clk_lock, clk_data);
-	if (r)
-		dev_err(&pdev->dev, "Could not register composites: %d\n", r);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-
-	if (r != 0)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
+static const struct mtk_clk_desc topck_desc = {
+	.clks = top_clks,
+	.num_clks = ARRAY_SIZE(top_clks),
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_divs,
+	.num_factor_clks = ARRAY_SIZE(top_divs),
+	.composite_clks = top_muxes,
+	.num_composite_clks = ARRAY_SIZE(top_muxes),
+	.divider_clks = top_adj_divs,
+	.num_divider_clks = ARRAY_SIZE(top_adj_divs),
+	.clk_lock = &mt2712_clk_lock,
+};
 
-	return r;
-}
+static const struct mtk_clk_desc mcu_desc = {
+	.composite_clks = mcu_muxes,
+	.num_composite_clks = ARRAY_SIZE(mcu_muxes),
+	.clk_lock = &mt2712_clk_lock,
+};
 
 static const struct of_device_id of_match_clk_mt2712[] = {
 	{
 		.compatible = "mediatek,mt2712-apmixedsys",
 		.data = clk_mt2712_apmixed_probe,
-	}, {
-		.compatible = "mediatek,mt2712-topckgen",
-		.data = clk_mt2712_top_probe,
-	}, {
-		.compatible = "mediatek,mt2712-mcucfg",
-		.data = clk_mt2712_mcu_probe,
 	}, {
 		/* sentinel */
 	}
@@ -1440,7 +1353,9 @@ static const struct mtk_clk_desc peri_desc = {
 
 static const struct of_device_id of_match_clk_mt2712_simple[] = {
 	{ .compatible = "mediatek,mt2712-infracfg", .data = &infra_desc },
+	{ .compatible = "mediatek,mt2712-mcucfg", .data = &mcu_desc },
 	{ .compatible = "mediatek,mt2712-pericfg", .data = &peri_desc, },
+	{ .compatible = "mediatek,mt2712-topckgen", .data = &topck_desc },
 	{ /* sentinel */ }
 };
 
-- 
2.39.1



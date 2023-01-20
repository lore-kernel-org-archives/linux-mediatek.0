Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0403BC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 09:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COhVf8sCWmuC74pu1bG2BoGrPm0EjXyjIG4ge9Ub83s=; b=sAfxTlbiq006l7Oy0s31KXRDgV
	ha2p+ONJzWTdsEijbDtTn1nM9fR2PHSGUdt29iDoohd9mcB92GyoK5Mlr8teABmK0DjFWUpP7QeF0
	VuGTjej7rd5x9PdAABIt6BN/dalN5/vsfeQ1Myl+WxCKleaGey8XsfZCrCnI+6puuRKeN6j2ItR15
	VuAviN0Si0resMgOIUcW56AUzjTCEgSIwgwbGQVZctv/jg1EqkphOTxiC3KGxB8xOj0j1GEU65K/Z
	FD6DHVxoBg2TLHOhBYRYChjEK9EzIaUNpO2PiQ1ZrUmIoFJ79HFbYtIp3ZSucbhxVhSy2V09nUcUL
	9H7feZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIo27-009X5g-6c; Fri, 20 Jan 2023 09:50:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInaY-009Jzr-PZ; Fri, 20 Jan 2023 09:21:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 956306602E39;
	Fri, 20 Jan 2023 09:21:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674206493;
	bh=8wZXrCMxoQHMeYBZ5eexWDTOyOVhEpLHJc+v3nva7D4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nH6+M9vzBnv4HAvXSJUwxEdIEBy1dLPB2MKBGFcZgMCYsSVFVCXSP2CPSq+owcox8
	 PLTNPpJInTFil+UbqC0OHzhNSkzYkSM75ntqeQ1xYRo8LQlUL7/qCmguPnqIydCuC2
	 dqeL2IiwcyQgYBw1gjY7i47bLAq/uhnZjzXH1Rp/Tj1VZOWcAuIo5IRl/SMJlwn5EK
	 1J7BTV8Wq1oqZ4Rf1OBa51ROv/6HRPmh8Bges9xScBYz916M+lUr1uX4pDR5dAfcQx
	 kRCMhyps+NVfBhVfoBpWGTnAXtfVK3hZqkuniGepDkuR5td5Z539DV4CPr6g4mDuNc
	 XgeyJHcVl1fDA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	fparent@baylibre.com,
	chun-jie.chen@mediatek.com,
	sam.shih@mediatek.com,
	y.oudjana@protonmail.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	ryder.lee@kernel.org,
	daniel@makrotopia.org,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	pablo.sun@mediatek.com,
	msp@baylibre.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v4 20/23] clk: mediatek: clk-mt8186-topckgen: Migrate to mtk_clk_simple_probe()
Date: Fri, 20 Jan 2023 10:20:50 +0100
Message-Id: <20230120092053.182923-21-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
References: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_012135_326749_79E1006C 
X-CRM114-Status: GOOD (  13.58  )
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

As done with MT8192, migrate MT8186 topckgen away from a custom probe
function and use mtk_clk_simple_{probe, remove}().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8186-topckgen.c | 103 ++++-----------------
 1 file changed, 19 insertions(+), 84 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8186-topckgen.c b/drivers/clk/mediatek/clk-mt8186-topckgen.c
index c1107b2b614c..c6786c8b315f 100644
--- a/drivers/clk/mediatek/clk-mt8186-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8186-topckgen.c
@@ -681,11 +681,6 @@ static struct mtk_composite top_muxes[] = {
 			0x0320, 4, 0x0334, 8, 0),
 };
 
-static const struct of_device_id of_match_clk_mt8186_topck[] = {
-	{ .compatible = "mediatek,mt8186-topckgen", },
-	{}
-};
-
 /* Register mux notifier for MFG mux */
 static int clk_mt8186_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
 {
@@ -708,88 +703,28 @@ static int clk_mt8186_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
 	return devm_mtk_clk_mux_notifier_register(dev, clk, mfg_mux_nb);
 }
 
-static int clk_mt8186_topck_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-	void __iomem *base;
-
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		r = PTR_ERR(base);
-		goto free_top_data;
-	}
-
-	r = mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-					clk_data);
-	if (r)
-		goto free_top_data;
-
-	r = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-	if (r)
-		goto unregister_fixed_clks;
-
-	r = mtk_clk_register_muxes(&pdev->dev, top_mtk_muxes,
-				   ARRAY_SIZE(top_mtk_muxes), node,
-				   &mt8186_clk_lock, clk_data);
-	if (r)
-		goto unregister_factors;
-
-	r = mtk_clk_register_composites(&pdev->dev, top_muxes,
-					ARRAY_SIZE(top_muxes), base,
-					&mt8186_clk_lock, clk_data);
-	if (r)
-		goto unregister_muxes;
-
-	r = clk_mt8186_reg_mfg_mux_notifier(&pdev->dev,
-					    clk_data->hws[CLK_TOP_MFG]->clk);
-	if (r)
-		goto unregister_composite_muxes;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_composite_muxes;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_composite_muxes:
-	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
-unregister_muxes:
-	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), clk_data);
-unregister_factors:
-	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-unregister_fixed_clks:
-	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), clk_data);
-free_top_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static int clk_mt8186_topck_remove(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
-	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), clk_data);
-	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), clk_data);
-	mtk_free_clk_data(clk_data);
+static const struct mtk_clk_desc topck_desc = {
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_divs,
+	.num_factor_clks = ARRAY_SIZE(top_divs),
+	.mux_clks = top_mtk_muxes,
+	.num_mux_clks = ARRAY_SIZE(top_mtk_muxes),
+	.composite_clks = top_muxes,
+	.num_composite_clks = ARRAY_SIZE(top_muxes),
+	.clk_lock = &mt8186_clk_lock,
+	.clk_notifier_func = clk_mt8186_reg_mfg_mux_notifier,
+	.mfg_clk_idx = CLK_TOP_MFG,
+};
 
-	return 0;
-}
+static const struct of_device_id of_match_clk_mt8186_topck[] = {
+	{ .compatible = "mediatek,mt8186-topckgen", .data = &topck_desc },
+	{ /* sentinel */ }
+};
 
 static struct platform_driver clk_mt8186_topck_drv = {
-	.probe = clk_mt8186_topck_probe,
-	.remove = clk_mt8186_topck_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-topck",
 		.of_match_table = of_match_clk_mt8186_topck,
-- 
2.39.0



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C9BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 13:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ia02SzbmniPBNUg/WobWpXWBWVT74pxZJ93PdfS56+U=; b=dbM/1eKTpI3N4AhRkJXRmC35Np
	SbP+m+Z77lIWjCpdN4EjCjal9pSWhyPvikufHQqF2UVsm96/9UOD/HhYV/OJCndUkgNp6nrDGB+YE
	UF9eOJWYs0rtgv0GQwmeThuBBkTJgBZFMtX7jzgsCtuhccH644NHOXYqDoplCPXKuU6KSD/l7zzDO
	FQrIVcThwJ4YcgVr8R1jrVb7upoCtUzPME8xuH5ddowbw+k9CYw2U6zhN+ekZ+90j6xe4NB8iP2JX
	a4FMXhNwkXLX1jZoYk49CZRCh7twIELmSV55GOHMt4D0QhvYdPSPWcZkjPIUIrViisT2bxvKKEnkx
	DsQSGF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8LIt-00CDSV-Ki; Thu, 22 Dec 2022 13:08:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K5A-00BXcv-1B; Thu, 22 Dec 2022 11:49:53 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 40C1D6602CF8;
	Thu, 22 Dec 2022 11:49:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671709790;
	bh=v4bpRy6DKVod2vAuX1EyO2724COnQa/afh1pvd8ocYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FrsQLoJofTCMYgIJrQfyPkRSDYicPjNPBtaKkJa/r8n75WbEuah3G+kP+KIMamQ4D
	 cvQ5Znz8ycsOGwOKR04Prl57jgCHjQaHzy6Au5ixDG25y2Xt3416psh7SZ7y/auuWg
	 7WP8dT7jrRao8oP5+P5BQWoqk3XmIXq+pExfMGV7XiZwcehPQBVosjhlltQm+Y6bLP
	 mOkkKTkC7iZ5IcUzEVbYKHJoc9wo6uxFUMq51iT0dDT6ZM7zKfIwl4AixgVfFerjz1
	 pmQjEEPGgHmg6bPwLYuuu0kNGSGYE+viCJ9guutyy7Q+Nu9V4bkKibkvry8gFoE1L9
	 48Y3kqNMpIMcg==
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
Subject: [PATCH v1 21/25] clk: mediatek: clk-mt8192: Migrate topckgen to mtk_clk_simple_probe()
Date: Thu, 22 Dec 2022 12:48:53 +0100
Message-Id: <20221222114857.120060-22-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034952_428522_3D11599D 
X-CRM114-Status: GOOD (  11.99  )
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

Since the common simple probe function for MediaTek clock drivers can
now register the MFG MUX notifier, it's possible to migrate MT8192's
topckgen to that, allowing for some code size reduction.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8192.c | 80 +++++++------------------------
 1 file changed, 17 insertions(+), 63 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index 702770326286..adde457e6277 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1064,66 +1064,6 @@ static int clk_mt8192_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
 	return devm_mtk_clk_mux_notifier_register(dev, clk, mfg_mux_nb);
 }
 
-static int clk_mt8192_top_probe(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *top_clk_data;
-	int r;
-	void __iomem *base;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
-	if (!top_clk_data)
-		return;
-
-	r = mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
-	if (r)
-		return r;
-
-	r = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
-	if (r)
-		goto unregister_fixed_clks;
-
-	r = mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
-				   &mt8192_clk_lock, top_clk_data, &pdev->dev);
-	if (r)
-		goto unregister_factors;
-
-	r = mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
-					&mt8192_clk_lock, top_clk_data, &pdev->dev);
-	if (r)
-		goto unregister_muxes;
-
-	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
-					    top_clk_data, &pdev->dev);
-	if (r)
-		goto unregister_top_composites;
-
-	r = clk_mt8192_reg_mfg_mux_notifier(&pdev->dev,
-					    top_clk_data->hws[CLK_TOP_MFG_PLL_SEL]->clk);
-	if (r)
-		goto unregister_gates;
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				      top_clk_data);
-
-unregister_gates:
-	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
-unregister_top_composites:
-	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
-unregister_muxes:
-	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
-unregister_factors:
-	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
-unregister_fixed_clks:
-	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-				      top_clk_data);
-	return r;
-}
-
 static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
@@ -1158,9 +1098,6 @@ static const struct of_device_id of_match_clk_mt8192[] = {
 	{
 		.compatible = "mediatek,mt8192-apmixedsys",
 		.data = clk_mt8192_apmixed_probe,
-	}, {
-		.compatible = "mediatek,mt8192-topckgen",
-		.data = clk_mt8192_top_probe,
 	}, {
 		/* sentinel */
 	}
@@ -1193,9 +1130,26 @@ static const struct mtk_clk_desc peri_desc = {
 	.num_clks = ARRAY_SIZE(peri_clks),
 };
 
+static const struct mtk_clk_desc topck_desc = {
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_divs,
+	.num_factor_clks = ARRAY_SIZE(top_divs),
+	.mux_clks = top_mtk_muxes,
+	.num_mux_clks = ARRAY_SIZE(top_mtk_muxes),
+	.composite_clks = top_muxes,
+	.num_composite_clks = ARRAY_SIZE(top_muxes),
+	.clks = top_clks,
+	.num_clks = ARRAY_SIZE(top_clks),
+	.clk_lock = &mt8192_clk_lock,
+	.clk_notifier_func = clk_mt8192_reg_mfg_mux_notifier,
+	.mfg_clk_idx = CLK_TOP_MFG_PLL_SEL,
+};
+
 static const struct of_device_id of_match_clk_mt8192_simple[] = {
 	{ .compatible = "mediatek,mt8192-infracfg", .data = &infra_desc },
 	{ .compatible = "mediatek,mt8192-pericfg", .data = &peri_desc },
+	{ .compatible = "mediatek,mt8192-topckgen", .data = &topck_desc },
 	{ /* sentinel */ }
 };
 
-- 
2.39.0



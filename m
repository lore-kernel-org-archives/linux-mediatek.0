Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C15C54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYb0Xm9LPCSrawUbK1oKBhMJPG8lzgCZ5q2y0yfwngM=; b=qsyta4VKQBV531IpQrGQL8GDPT
	21hJZnGjbGibC23/4a6XXuhDp3l+VeN5TlHzsqEjazz2mJXV/QQgCeUCzOUfAQGnjP/GKXaWy6E9H
	bixGmiVLUElxzyqYEQmGSSWeuZGMFQmhBF5zFCiAOD5B9OyvLBdFzR3/PrgH+sTsghzk6l5AGmfM6
	fK/hG5huBKODxE/PqYnmJCm/WhNXfnpRVvDOd7/VXaxT7D9pfU9hXR1nTly8yz6bSHJM3RTVcQFZw
	psl+2WjbZ7FdurFJLphjf/kvI2lGb/k9gI5SRffjhZLpqYjeW/9oe4Hl7cmOm/Z2B7uNpeSFq8B+/
	RXpPHydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIFJ-002B4g-N3; Fri, 13 Jan 2023 11:29:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHuG-0020lI-UL; Fri, 13 Jan 2023 11:07:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5C0C76602DCF;
	Fri, 13 Jan 2023 11:07:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673608051;
	bh=mSaL+tk5NnlZ0CFxycF9bNaEJv21sxA1ml6TJybXbpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tj7cifsqoyXS5yFVAziu5iWTV5G+/IS6CCnGSpUMlN20+zwtlCQRoAx+Wi8Ot1W5Q
	 rVdzzsAWOiYLE9vewdrGZ1n7yfhGmW5IgeMrYDAIJGvtwpgUpMjadTSYeshoYE90Ue
	 GMQWQn9Q+PZYWg/lwCO6csHFfiwlKZMTrmmxoBjVLp1esGxelH7UyNU1M4bxayjUkY
	 ky7XkyTmkZ4IwOqz6852msffvvaJ5SJVc9fz4rJWGn3o8cR7+aTWPBp2J8Oj1jyYh+
	 jt9WmtGGgkE+yBjtiGG6KuIyH79DvGNe93uBwsj6NlF9mTzMG3x2PXsZsPkTuuF5Tw
	 JCq2GnKBY+LDA==
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
Subject: [PATCH v3 21/23] clk: mediatek: clk-mt6795-topckgen: Migrate to mtk_clk_simple_probe()
Date: Fri, 13 Jan 2023 12:06:14 +0100
Message-Id: <20230113110616.111001-22-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
References: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_030733_301630_CB9D3C40 
X-CRM114-Status: GOOD (  12.96  )
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

Migrate away from custom probe functions and use the commonized
mtk_clk_simple_{probe, remove}().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt6795-topckgen.c | 86 ++++------------------
 1 file changed, 14 insertions(+), 72 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-topckgen.c b/drivers/clk/mediatek/clk-mt6795-topckgen.c
index 65fd8aa69afd..e80fa588e309 100644
--- a/drivers/clk/mediatek/clk-mt6795-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt6795-topckgen.c
@@ -523,88 +523,30 @@ static struct mtk_composite top_aud_divs[] = {
 	DIV_GATE(CLK_TOP_APLL2_DIV5, "apll2_div5", "apll2_div4", 0x12c, 21, 0x12c, 4, 4),
 };
 
+static const struct mtk_clk_desc topck_desc = {
+	.fixed_clks = fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(fixed_clks),
+	.factor_clks = top_divs,
+	.num_factor_clks = ARRAY_SIZE(top_divs),
+	.mux_clks = top_muxes,
+	.num_mux_clks = ARRAY_SIZE(top_muxes),
+	.composite_clks = top_aud_divs,
+	.num_composite_clks = ARRAY_SIZE(top_aud_divs),
+	.clk_lock = &mt6795_top_clk_lock,
+};
 
 static const struct of_device_id of_match_clk_mt6795_topckgen[] = {
-	{ .compatible = "mediatek,mt6795-topckgen" },
+	{ .compatible = "mediatek,mt6795-topckgen", .data = &topck_desc },
 	{ /* sentinel */ }
 };
 
-static int clk_mt6795_topckgen_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	void __iomem *base;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_fixed_clks(fixed_clks, ARRAY_SIZE(fixed_clks), clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-	if (ret)
-		goto unregister_fixed_clks;
-
-	ret = mtk_clk_register_muxes(&pdev->dev, top_muxes,
-				     ARRAY_SIZE(top_muxes), node,
-				     &mt6795_top_clk_lock, clk_data);
-	if (ret)
-		goto unregister_factors;
-
-	ret = mtk_clk_register_composites(&pdev->dev, top_aud_divs,
-					  ARRAY_SIZE(top_aud_divs), base,
-					  &mt6795_top_clk_lock, clk_data);
-	if (ret)
-		goto unregister_muxes;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_composites;
-
-	return 0;
-
-unregister_composites:
-	mtk_clk_unregister_composites(top_aud_divs, ARRAY_SIZE(top_aud_divs), clk_data);
-unregister_muxes:
-	mtk_clk_unregister_muxes(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
-unregister_factors:
-	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-unregister_fixed_clks:
-	mtk_clk_unregister_fixed_clks(fixed_clks, ARRAY_SIZE(fixed_clks), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return ret;
-}
-
-static int clk_mt6795_topckgen_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_composites(top_aud_divs, ARRAY_SIZE(top_aud_divs), clk_data);
-	mtk_clk_unregister_muxes(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
-	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-	mtk_clk_unregister_fixed_clks(fixed_clks, ARRAY_SIZE(fixed_clks), clk_data);
-	mtk_free_clk_data(clk_data);
-
-	return 0;
-}
-
 static struct platform_driver clk_mt6795_topckgen_drv = {
 	.driver = {
 		.name = "clk-mt6795-topckgen",
 		.of_match_table = of_match_clk_mt6795_topckgen,
 	},
-	.probe = clk_mt6795_topckgen_probe,
-	.remove = clk_mt6795_topckgen_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt6795_topckgen_drv);
 
-- 
2.39.0



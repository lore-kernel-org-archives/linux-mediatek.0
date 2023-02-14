Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C105FC05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 13:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GQwF9xMcNhdadx5t3Z1GET8jfM0kIPICikTw4DU2jI=; b=KGwHsRAFWyBLmbN2nNqpKiTdgn
	4xl5WxpsHlUIEFk20u8zxcnMhq0AN+zI8xhDfrKLE/a+OLyJUkLMzgIFv1WoI/499brb6HaycgxU4
	VvspfS6NVWupZgQ90bGfTh80+vdCAfRSW6Jw8+0ZT//JJKAoYupZMf+dl8G7/zw3Xe+rgNxc5qn/G
	SVjMfFveddT8POlQU9P2DXD1wITJH+P+wFhk+yxD3JwwlSBnS+T9e+qqCyTr33EE06My9/mGpOGor
	DuEgwKDFdm+Ln7keLgEqg7ok0CJE07WmYKaDMOfxADs+HCnEi4I6HmNjpEBi4LYyqWhU/exRZfbeV
	YR4T35lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvez-001ool-H9; Tue, 14 Feb 2023 13:47:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvZI-001leR-Gg; Tue, 14 Feb 2023 13:42:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 37F3E6602169;
	Tue, 14 Feb 2023 13:41:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676382119;
	bh=S6LWnlTWP4HmWArVQMMYf+rB+OddHeGvBHyv/Y5882o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nDHmpllu/rQrTW1lr2aKN+hc7jXSEUXP8CyPSjLenUYPDfnqca1w5Ka6x5Y+EaKxW
	 JXa7s+YVEOyoTgJZp4+QZK+JZ9Jt4DMZYdpsV0w4sJyslGrmoa5EZe9pZCPFB+u15e
	 LorktBfpsVueCHcGDFNr3wtt9qUhZ57lzaEqSHqKllPuT3XXRV89CNy2PaA9uZatMU
	 iqLT2CBf5HB6TSLj/uOQdenjPVV7Q2/ORywF/JAL98kvPudz7hLTylApWzjDNbbBtW
	 CF4yCNL6fJz0Z4Vt6r1j+7nMwELr6sEDSZGU2uZXTql1lUAyzPudD4MHVvFGUBR900
	 WwaThE9KMhupg==
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
Subject: [PATCH v2 13/47] clk: mediatek: mt8365: Convert to mtk_clk_simple_{probe,remove}()
Date: Tue, 14 Feb 2023 14:40:53 +0100
Message-Id: <20230214134127.59273-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_054200_839622_8D696338 
X-CRM114-Status: GOOD (  15.21  )
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

All clocks in this driver are supported by the common simple probe
mechanism and it's now possible to migrate to it.

While at it, also switch to using the module_platform_driver() macro.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8365.c | 241 +++++-------------------------
 1 file changed, 37 insertions(+), 204 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
index fef6c653c9ce..208cdc157918 100644
--- a/drivers/clk/mediatek/clk-mt8365.c
+++ b/drivers/clk/mediatek/clk-mt8365.c
@@ -752,220 +752,53 @@ static const struct mtk_gate peri_clks[] = {
 		 &mtk_clk_gate_ops_no_setclr),
 };
 
-static int clk_mt8365_top_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
-	int ret;
-	int i;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_fixed_clks(top_fixed_clks,
-					  ARRAY_SIZE(top_fixed_clks), clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs),
-				       clk_data);
-	if (ret)
-		goto unregister_fixed_clks;
-
-	ret = mtk_clk_register_muxes(&pdev->dev, top_muxes,
-				     ARRAY_SIZE(top_muxes), node,
-				     &mt8365_clk_lock, clk_data);
-	if (ret)
-		goto unregister_factors;
-
-	ret = mtk_clk_register_composites(&pdev->dev, top_misc_muxes,
-					  ARRAY_SIZE(top_misc_muxes), base,
-					  &mt8365_clk_lock, clk_data);
-	if (ret)
-		goto unregister_muxes;
-
-	ret = mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
-					base, &mt8365_clk_lock, clk_data);
-	if (ret)
-		goto unregister_composites;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, top_clk_gates,
-				     ARRAY_SIZE(top_clk_gates), clk_data);
-	if (ret)
-		goto unregister_dividers;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	return 0;
-unregister_gates:
-	mtk_clk_unregister_gates(top_clk_gates, ARRAY_SIZE(top_clk_gates), clk_data);
-unregister_dividers:
-	mtk_clk_unregister_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
-				    clk_data);
-unregister_composites:
-	mtk_clk_unregister_composites(top_misc_muxes,
-				      ARRAY_SIZE(top_misc_muxes), clk_data);
-unregister_muxes:
-	mtk_clk_unregister_muxes(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
-unregister_factors:
-	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-unregister_fixed_clks:
-	mtk_clk_unregister_fixed_clks(top_fixed_clks,
-				      ARRAY_SIZE(top_fixed_clks), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-
-	return ret;
-}
-
-static int clk_mt8365_infra_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int ret;
-
-	clk_data = mtk_alloc_clk_data(CLK_IFR_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, ifr_clks,
-				     ARRAY_SIZE(ifr_clks), clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	return 0;
-
-unregister_gates:
-	mtk_clk_unregister_gates(ifr_clks, ARRAY_SIZE(ifr_clks), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-
-	return ret;
-}
-
-static int clk_mt8365_peri_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct clk_hw_onecell_data *clk_data;
-	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_devm_alloc_clk_data(dev, CLK_PERI_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, peri_clks,
-				     ARRAY_SIZE(peri_clks), clk_data);
-	if (ret)
-		return ret;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-
-	return ret;
-}
-
-static int clk_mt8365_mcu_probe(struct platform_device *pdev)
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
-	clk_data = mtk_alloc_clk_data(CLK_MCU_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_composites(&pdev->dev, mcu_muxes,
-					  ARRAY_SIZE(mcu_muxes), base,
-					  &mt8365_clk_lock, clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_composites;
+static const struct mtk_clk_desc topck_desc = {
+	.clks = top_clk_gates,
+	.num_clks = ARRAY_SIZE(top_clk_gates),
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_divs,
+	.num_factor_clks = ARRAY_SIZE(top_divs),
+	.mux_clks = top_muxes,
+	.num_mux_clks = ARRAY_SIZE(top_muxes),
+	.composite_clks = top_misc_muxes,
+	.num_composite_clks = ARRAY_SIZE(top_misc_muxes),
+	.divider_clks = top_adj_divs,
+	.num_divider_clks = ARRAY_SIZE(top_adj_divs),
+	.clk_lock = &mt8365_clk_lock,
+};
 
-	return 0;
+static const struct mtk_clk_desc infra_desc = {
+	.clks = ifr_clks,
+	.num_clks = ARRAY_SIZE(ifr_clks),
+};
 
-unregister_composites:
-	mtk_clk_unregister_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes),
-				      clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
+static const struct mtk_clk_desc peri_desc = {
+	.clks = peri_clks,
+	.num_clks = ARRAY_SIZE(peri_clks),
+};
 
-	return ret;
-}
+static const struct mtk_clk_desc mcu_desc = {
+	.composite_clks = mcu_muxes,
+	.num_composite_clks = ARRAY_SIZE(mcu_muxes),
+	.clk_lock = &mt8365_clk_lock,
+};
 
 static const struct of_device_id of_match_clk_mt8365[] = {
-	{
-		.compatible = "mediatek,mt8365-topckgen",
-		.data = clk_mt8365_top_probe,
-	}, {
-		.compatible = "mediatek,mt8365-infracfg",
-		.data = clk_mt8365_infra_probe,
-	}, {
-		.compatible = "mediatek,mt8365-pericfg",
-		.data = clk_mt8365_peri_probe,
-	}, {
-		.compatible = "mediatek,mt8365-mcucfg",
-		.data = clk_mt8365_mcu_probe,
-	}, {
-		/* sentinel */
-	}
-};
-
-static int clk_mt8365_probe(struct platform_device *pdev)
-{
-	int (*clk_probe)(struct platform_device *pdev);
-	int ret;
-
-	clk_probe = of_device_get_match_data(&pdev->dev);
-	if (!clk_probe)
-		return -EINVAL;
-
-	ret = clk_probe(pdev);
-	if (ret)
-		dev_err(&pdev->dev,
-			"%s: could not register clock provider: %d\n",
-			pdev->name, ret);
-
-	return ret;
-}
+	{ .compatible = "mediatek,mt8365-topckgen", .data = &topck_desc },
+	{ .compatible = "mediatek,mt8365-infracfg", .data = &infra_desc },
+	{ .compatible = "mediatek,mt8365-pericfg", .data = &peri_desc },
+	{ .compatible = "mediatek,mt8365-mcucfg", .data = &mcu_desc },
+	{ /* sentinel */ }
+};
 
 static struct platform_driver clk_mt8365_drv = {
-	.probe = clk_mt8365_probe,
 	.driver = {
 		.name = "clk-mt8365",
 		.of_match_table = of_match_clk_mt8365,
 	},
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
-
-static int __init clk_mt8365_init(void)
-{
-	return platform_driver_register(&clk_mt8365_drv);
-}
-arch_initcall(clk_mt8365_init);
+module_platform_driver(clk_mt8365_drv);
 MODULE_LICENSE("GPL");
-- 
2.39.1



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF26C63797
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfkyL35Q87avz+YthEsjK3kkTCX1OXcSswA6mNUoIxY=; b=4yy53LqnQjKB+/WI1fbGUJtUOX
	/BqdrWgDnq7Qci+nIJj6+jOtu3Dh4hVpAZgU/Pwk8G0sHY20EyfZHknn6UKz3bZE5jmN1aUOnGf6U
	uFrGNqbzddA7o62r6efIiWttCoEhlIlD0S85+A0d6Jo8joACS/fxltPq8X0932ZNGyKNcyFdYh1zj
	r4rG5gWVjtgu4ejMxVXQzEAh/ZBlfg5RpnP0NeMyTc06+OHkNc+OLISR0erwl+D/YRFFoPj7vnrDU
	QbaX0KKHJgNDWys8/QG068n3WtQvlhGaMGPf7SwlCqFbamY7BOR9w1mJJ7J87ip2wao07wsXizG9A
	9HRhCCaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3oF-0095Yv-8e; Mon, 06 Feb 2023 15:53:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3Rw-008u5r-6G; Mon, 06 Feb 2023 15:30:33 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B147F6602F9E;
	Mon,  6 Feb 2023 15:30:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675697430;
	bh=CLknQX9SFUtoj2mggvrjYiI8IwHCqlwdtblptlQ1mvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CUjEfutNPBNJn9kp6rdEDbgiQYmiYBqtDmuDrDsSbER2UHXD4DjTY6UA/qS+ogsLS
	 BH1601JSCas/+bNHskg/PU/Rodue62Ipgnw5O0V+111foZKtLmY5xnQ5OMolc/pKvG
	 FDSDIxVgXuGYfT3qQwN9laouzgxXRo2WQ+UjaJjSfCAoJU7eXWwn0AXk8WxpviIEy2
	 VyQB1N4pSvGFMdfw63Qafe5TzAmwzY0RgvOJzdXVpEe1CFG+CVWwkoueQomnnAeKFl
	 9mYvxaoMgUYx+FV+NDMB1fXCRv71/6wVkSxkvrOzfqttl07Uud/caN2UUa90sZjB2g
	 B+UtZ4pQyxuNg==
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
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 32/45] clk: mediatek: mt8186-mcu: Migrate to common probe mechanism
Date: Mon,  6 Feb 2023 16:29:15 +0100
Message-Id: <20230206152928.918562-33-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073032_412915_BFE0231B 
X-CRM114-Status: GOOD (  12.05  )
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

Convert MT8186 MCUSYS clocks to the common mtk_clk_simple_probe().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8186-mcu.c | 68 +++++----------------------
 1 file changed, 13 insertions(+), 55 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8186-mcu.c b/drivers/clk/mediatek/clk-mt8186-mcu.c
index e52a2d986c99..895856df95df 100644
--- a/drivers/clk/mediatek/clk-mt8186-mcu.c
+++ b/drivers/clk/mediatek/clk-mt8186-mcu.c
@@ -43,67 +43,25 @@ static struct mtk_composite mcu_muxes[] = {
 	MUX(CLK_MCU_ARMPLL_BUS_SEL, "mcu_armpll_bus_sel", mcu_armpll_bus_parents, 0x2E0, 9, 2),
 };
 
-static const struct of_device_id of_match_clk_mt8186_mcu[] = {
-	{ .compatible = "mediatek,mt8186-mcusys", },
-	{}
+static const struct mtk_clk_desc mcu_desc = {
+	.composite_clks = mcu_muxes,
+	.num_composite_clks = ARRAY_SIZE(mcu_muxes),
 };
 
-static int clk_mt8186_mcu_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-	void __iomem *base;
-
-	clk_data = mtk_alloc_clk_data(CLK_MCU_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		r = PTR_ERR(base);
-		goto free_mcu_data;
-	}
-
-	r = mtk_clk_register_composites(&pdev->dev, mcu_muxes,
-					ARRAY_SIZE(mcu_muxes), base,
-					NULL, clk_data);
-	if (r)
-		goto free_mcu_data;
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
-	mtk_clk_unregister_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), clk_data);
-free_mcu_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static int clk_mt8186_mcu_remove(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), clk_data);
-	mtk_free_clk_data(clk_data);
-
-	return 0;
-}
+static const struct of_device_id of_match_clk_mt8186_mcu[] = {
+	{ .compatible = "mediatek,mt8186-mcusys", .data = &mcu_desc },
+	{ /* sentinel */}
+};
 
 static struct platform_driver clk_mt8186_mcu_drv = {
-	.probe = clk_mt8186_mcu_probe,
-	.remove = clk_mt8186_mcu_remove,
 	.driver = {
 		.name = "clk-mt8186-mcu",
 		.of_match_table = of_match_clk_mt8186_mcu,
 	},
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
-builtin_platform_driver(clk_mt8186_mcu_drv);
+module_platform_driver(clk_mt8186_mcu_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8186 mcusys clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.1



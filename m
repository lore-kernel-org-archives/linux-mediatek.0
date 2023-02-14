Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15895C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFrlDa7ejtDSgeM3H/TtlVpcOaefPpO46YuwSR4Eb6s=; b=COVO7vCU+AgsjvOJWmBOTAjW31
	eFrRjibuZZutaIppVN3D3oWjJBrKMevilL0Geats0Ielz9nT+myNmH9Tnh2h1mK7aop27hi7rRHdV
	WMUVGIei+mCpO9tKloA3l4+Voi6/7rLQHtcjMJTEeWTK9uphxIac3djmffcQ3dM12A48oTy1LLx6b
	geVR6ewINUr/6L4i4mScVH1Bw3pgEJLYyOmEDDDtdueyHl6oK78DqJ5RGeRV2KXuFZJhUzCFLkUDq
	GRpCijD0rs5ljILzGHEDNY5Gj+AeycsXPY0J0aRyTG6eQgWxKQVSd87Q+0ITGqCy+60sD91PqDBzO
	2BIaS1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvqV-001uSQ-M0; Tue, 14 Feb 2023 13:59:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvZY-001lnA-CQ; Tue, 14 Feb 2023 13:42:18 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0CF3B6602175;
	Tue, 14 Feb 2023 13:42:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676382135;
	bh=HS+75ThwZ7BguyKPJsdT2HgQ+Y5XXwVsQvcvJfoU1ow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H6okWA6gPnD9FexFdjZ3ErFATmMqmoiTFTqZja6Pqk8MLWTcbrtDsh3W0o+aTHW2J
	 c3feWyBDC0KC+kID6y7ja3LBX8UJddDSD8QQmC+DYesWaGfIRq38joDP6bYRsaA6WF
	 bWTdBzwU4+4NK6Z1e1yskljge6D6Zd98SDTfbV4sK7/JeBjiOjzt0N+hqta1tt68Rw
	 OfeMyyKZwmdtaq9af3rEXW1PN1eZv95w9FdTMCT2Yv03Pc/cM6vzGfamzbE3nyl/iA
	 4opA7wMyfs6Cy+6VCfkEUgp9jBOfVrbjrS9UCJtQmCptYEHQqd1K6Rr6DhhIMmHb6S
	 13TJlw1Sk9epQ==
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
Subject: [PATCH v2 25/47] clk: mediatek: mt7622: Convert to platform driver and simple probe
Date: Tue, 14 Feb 2023 14:41:05 +0100
Message-Id: <20230214134127.59273-26-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_054216_701147_899D6398 
X-CRM114-Status: GOOD (  13.17  )
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

Convert the MT7622 topckgen and pericfg clock drivers to platform
drivers and use the simple probe mechanism. This also allows to
build these clocks as modules.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt7622.c | 125 ++++++++----------------------
 1 file changed, 31 insertions(+), 94 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index fb813f8d3a7d..7a002b73fcaa 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -490,107 +490,44 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
 };
 
-static int mtk_topckgen_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
-
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-				    clk_data);
-
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs),
-				 clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_muxes,
-				    ARRAY_SIZE(top_muxes), base,
-				    &mt7622_clk_lock, clk_data);
-
-	mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
-				  base, &mt7622_clk_lock, clk_data);
-
-	mtk_clk_register_gates(&pdev->dev, node, top_clks,
-			       ARRAY_SIZE(top_clks), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
-
-static int mtk_pericfg_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, peri_clks,
-			       ARRAY_SIZE(peri_clks), clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, peri_muxes,
-				    ARRAY_SIZE(peri_muxes), base,
-				    &mt7622_clk_lock, clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		return r;
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-
-	return 0;
-}
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
+	.clk_lock = &mt7622_clk_lock,
+};
+
+static const struct mtk_clk_desc peri_desc = {
+	.clks = peri_clks,
+	.num_clks = ARRAY_SIZE(peri_clks),
+	.composite_clks = peri_muxes,
+	.num_composite_clks = ARRAY_SIZE(peri_muxes),
+	.rst_desc = &clk_rst_desc,
+	.clk_lock = &mt7622_clk_lock,
+};
 
 static const struct of_device_id of_match_clk_mt7622[] = {
-	{
-		.compatible = "mediatek,mt7622-topckgen",
-		.data = mtk_topckgen_init,
-	}, {
-		.compatible = "mediatek,mt7622-pericfg",
-		.data = mtk_pericfg_init,
-	}, {
-		/* sentinel */
-	}
-};
-
-static int clk_mt7622_probe(struct platform_device *pdev)
-{
-	int (*clk_init)(struct platform_device *);
-	int r;
-
-	clk_init = of_device_get_match_data(&pdev->dev);
-	if (!clk_init)
-		return -EINVAL;
-
-	r = clk_init(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
+	{ .compatible = "mediatek,mt7622-topckgen", .data = &topck_desc },
+	{ .compatible = "mediatek,mt7622-pericfg", .data = &peri_desc },
+	{ /* sentinel */ }
+};
 
 static struct platform_driver clk_mt7622_drv = {
-	.probe = clk_mt7622_probe,
 	.driver = {
 		.name = "clk-mt7622",
 		.of_match_table = of_match_clk_mt7622,
 	},
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
+module_platform_driver(clk_mt7622_drv)
 
-static int clk_mt7622_init(void)
-{
-	return platform_driver_register(&clk_mt7622_drv);
-}
-
-arch_initcall(clk_mt7622_init);
+MODULE_DESCRIPTION("MediaTek MT7622 clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.1



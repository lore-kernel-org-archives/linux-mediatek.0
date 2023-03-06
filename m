Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1D3C678D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 14:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUKdoVwMAZzoFKBUKkcgIT/Cet5Po4WSpRXoJ0kKs44=; b=plSaYhEF2q/hYz3jsdaIbUyenr
	PHGs7g/T01toOuEZxwkOhzSDiTovWX3XIEhpKbjjh8Ta0Tzs5dTFuJY8z/flc8OoZsLeamrdTO40x
	LKlkxIXV6keK47xgW/mpUg29B3W13h1U9b7T45BQ2L2Nr4eCRiKiwrkGuMa3jrUJiDYVd7rJpKO0R
	+UEQNdLajqUhWgQ9nnmNjaqVXek0wDub1KZb+ie2z44aJPsNdjmX2z9BiXYZ8iBb6snWCadfFJCC6
	BwdUQpuDK9eZZ8LDBt3E2/rmmFdmQeZivGw9kBdAd4Zv56XnQ+8coshfdAdFO9YoTONGl1Vk44qNf
	F7UP6oiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBpy-00DGED-U0; Mon, 06 Mar 2023 14:29:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBU9-00D3qJ-MU; Mon, 06 Mar 2023 14:06:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0974B6602FEA;
	Mon,  6 Mar 2023 14:06:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678111600;
	bh=WQcaXXwOq3O7Y+HQbtaOpT+Y4baqgZ5rlrg81xb5Vxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PuZZAHGGy3eI1AdxvNbapBbGNyCG56L8HWW8Sa5a0pFCfQBJ6YpJymEw+i5KdRTKX
	 fIB7v1UBzzLTnvmEti70wLMd0nH6qgGUt8U0THBF4jBmZyP/yXOaJjaBwY9ZW73hl6
	 YIIh/aig2B8zeDAZ30bEudPgvMgFxaFnu1kKJkcIMyX/Uolbybrk8Z3r4O7ka0SpXL
	 t6wj3COV98XKVDp8HAztKYUR1B7Mn1ZX9nab5xDuZ+B2ZyVC7sQf1qLQXqIxxt9JY5
	 QiLNteu/21+4gSM3W8J2vtJMQJ66l4ZOXBGlyICMQRBok26YJCJL9/ub1n7+YTejCH
	 5c/jjriXDRTXA==
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
Subject: [PATCH v6 33/54] clk: mediatek: mt7986-infracfg: Migrate to common probe mechanism
Date: Mon,  6 Mar 2023 15:05:22 +0100
Message-Id: <20230306140543.1813621-34-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_060641_960075_2FFBCCDC 
X-CRM114-Status: GOOD (  13.75  )
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

Convert this driver to use the common mtk_clk_simple_probe() mechanism.
While at it, also use module_platform_driver() instead, as this driver
just gained a .remove() callback during the conversion.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt7986-infracfg.c | 61 ++++++----------------
 1 file changed, 17 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-infracfg.c b/drivers/clk/mediatek/clk-mt7986-infracfg.c
index 0a4bf87ee160..0299faad0733 100644
--- a/drivers/clk/mediatek/clk-mt7986-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7986-infracfg.c
@@ -157,57 +157,30 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA2(CLK_INFRA_IPCIEB_CK, "infra_ipcieb", "sysaxi_sel", 15),
 };
 
-static int clk_mt7986_infracfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-	void __iomem *base;
-	int nr = ARRAY_SIZE(infra_divs) + ARRAY_SIZE(infra_muxes) +
-		 ARRAY_SIZE(infra_clks);
-
-	base = of_iomap(node, 0);
-	if (!base) {
-		pr_err("%s(): ioremap failed\n", __func__);
-		return -ENOMEM;
-	}
-
-	clk_data = mtk_alloc_clk_data(nr);
-
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_factors(infra_divs, ARRAY_SIZE(infra_divs), clk_data);
-	mtk_clk_register_muxes(&pdev->dev, infra_muxes,
-			       ARRAY_SIZE(infra_muxes), node,
-			       &mt7986_clk_lock, clk_data);
-	mtk_clk_register_gates(&pdev->dev, node, infra_clks,
-			       ARRAY_SIZE(infra_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-		goto free_infracfg_data;
-	}
-	return r;
-
-free_infracfg_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-
-}
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+	.factor_clks = infra_divs,
+	.num_factor_clks = ARRAY_SIZE(infra_divs),
+	.mux_clks = infra_muxes,
+	.num_mux_clks = ARRAY_SIZE(infra_muxes),
+	.clk_lock = &mt7986_clk_lock,
+};
 
 static const struct of_device_id of_match_clk_mt7986_infracfg[] = {
-	{ .compatible = "mediatek,mt7986-infracfg", },
-	{}
+	{ .compatible = "mediatek,mt7986-infracfg", .data = &infra_desc },
+	{ /* sentinel */ }
 };
 
 static struct platform_driver clk_mt7986_infracfg_drv = {
-	.probe = clk_mt7986_infracfg_probe,
 	.driver = {
 		.name = "clk-mt7986-infracfg",
 		.of_match_table = of_match_clk_mt7986_infracfg,
 	},
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
-builtin_platform_driver(clk_mt7986_infracfg_drv);
+module_platform_driver(clk_mt7986_infracfg_drv);
+
+MODULE_DESCRIPTION("MediaTek MT7986 infracfg clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2



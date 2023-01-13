Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D3BC54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 11:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIsP57YLXGg8hP5ovflaeOS4NTXL98+zNH2CpmbnDOw=; b=fW7KX8u5IU7ecNii/JNXiz04Rj
	wALDITWejZ5y+XDfBcfxt7S/KyXmx7dtTZduYl1WwYt2uvN35MHPUujRFR9BuJxnp9kt9wSIDFIh0
	189QsH4HXoHwLBQnnWqNMOhCV/W4JS+tcwNsfnkZFR+z+coX9zKCm9Lu7AzC2SHT0CWrhxnqpcVsi
	F0dtmIAxkD61Z4JAese4L5ufIBbcBPdqINjYCOYwTXqXrw7z9+0YE/9CLUnliB2aShgezE6BWvzRS
	me41llSeLPDxun7m8UFE31iX/zAco5me/KPObnP8CwNVvWqIvg59WeljXZiZi9LbAhU8NclfJBXNs
	+FORc7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIIx-002Cnh-0f; Fri, 13 Jan 2023 11:33:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHuJ-0020mO-To; Fri, 13 Jan 2023 11:07:44 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F9F26602A65;
	Fri, 13 Jan 2023 11:07:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673608054;
	bh=OR96jyfG6jmlGtj7KrVYH6mHMab9y7sfZFD/VnKDl1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F5+8FSGTCLUJQnG1Of1fWBSzc1RKou1ZivE0+Nd99L83XIGMENM7yhYAhDJ+2KmjN
	 h0a9wm+vvFtHXJLEL1qVrTZlAsDWJ2UZfZ6nQ1SRU4B/h4j7w1LU/TE/m+3l/jQsyI
	 j6z8XATxvDJda/xepGBfp9JDcGtrTh+A8oLJcyGAoWdBNU1OGVYkgNL+usceEWFojl
	 u+2TpWrZZAIctUV20cLNAizKWatfFIuVXk5eGgp+WvH5TBDhSg5JaR+rXaIYz1i7nt
	 /jvSkWKsnT9v3EIXoTWmwJ4PXTdJ1PpdP3OKcJjgoQFtP+5F/YsFwr06RDW5yXt0i3
	 /k3s8ZwDqoiFA==
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
Subject: [PATCH v3 23/23] clk: mediatek: clk-mt7986-topckgen: Migrate to mtk_clk_simple_probe()
Date: Fri, 13 Jan 2023 12:06:16 +0100
Message-Id: <20230113110616.111001-24-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
References: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_030743_432968_41C4FB3F 
X-CRM114-Status: GOOD (  13.42  )
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

There are no more non-common calls in clk_mt7986_topckgen_probe():
migrate this driver to mtk_clk_simple_probe().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt7986-topckgen.c | 55 +++++-----------------
 1 file changed, 13 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-topckgen.c b/drivers/clk/mediatek/clk-mt7986-topckgen.c
index 36553f0c13fe..dff9976fa689 100644
--- a/drivers/clk/mediatek/clk-mt7986-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt7986-topckgen.c
@@ -290,53 +290,24 @@ static const struct mtk_mux top_muxes[] = {
 			     0x1C4, 5),
 };
 
-static int clk_mt7986_topckgen_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-	void __iomem *base;
-	int nr = ARRAY_SIZE(top_fixed_clks) + ARRAY_SIZE(top_divs) +
-		 ARRAY_SIZE(top_muxes);
-
-	base = of_iomap(node, 0);
-	if (!base) {
-		pr_err("%s(): ioremap failed\n", __func__);
-		return -ENOMEM;
-	}
-
-	clk_data = mtk_alloc_clk_data(nr);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-				    clk_data);
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-	mtk_clk_register_muxes(&pdev->dev, top_muxes,
-			       ARRAY_SIZE(top_muxes), node,
-			       &mt7986_clk_lock, clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-
-	if (r) {
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-		goto free_topckgen_data;
-	}
-	return r;
-
-free_topckgen_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
+static const struct mtk_clk_desc topck_desc = {
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_divs,
+	.num_factor_clks = ARRAY_SIZE(top_divs),
+	.mux_clks = top_muxes,
+	.num_mux_clks = ARRAY_SIZE(top_muxes),
+	.clk_lock = &mt7986_clk_lock,
+};
 
 static const struct of_device_id of_match_clk_mt7986_topckgen[] = {
-	{ .compatible = "mediatek,mt7986-topckgen", },
-	{}
+	{ .compatible = "mediatek,mt7986-topckgen", .data = &topck_desc },
+	{ /* sentinel */ }
 };
 
 static struct platform_driver clk_mt7986_topckgen_drv = {
-	.probe = clk_mt7986_topckgen_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7986-topckgen",
 		.of_match_table = of_match_clk_mt7986_topckgen,
-- 
2.39.0



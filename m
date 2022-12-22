Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143D5C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 13:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fpn5AWlPGChog//uqkDOTK8QT0OpyfDoW2uTCXxTeUk=; b=2+cw0jcLx9OxyXEePIURM0FHS2
	UekAJGAGa3N7ZYDvOxSdtiAZdkpwF2IsucETuJEy4J/eHcirwoBnT2tmW+stg/RTYCuGPev8HEKwV
	EUkjOh2htT9UfFqoKl9xXqo70cYxHTKnU/lAd55HElwEgiAP2d09AUkiHueYk0PGumPkjQg6JBpkk
	Ahe/E+2rO3RswZRoF6R5nw44iax56VpJ17YH/i2HRXIlCvPuUfXpMnJWUyUdCAihxnp+ECGSUmegZ
	ZjeSwUZnTdFbE5L2ZiAe8Ky38SZwuNkVSa5i1x5MESgC614wIkeu2afwbV393RQuIeAacVJTKjkpD
	8ghpE4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8LPm-00CHKT-PK; Thu, 22 Dec 2022 13:15:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K5G-00BXi8-Ja; Thu, 22 Dec 2022 11:50:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E4D816602D1D;
	Thu, 22 Dec 2022 11:49:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671709797;
	bh=PXg/FppXIPAwQaA1oQS+Wf5hDsh7ZOHb0BNVjLOTW5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f9W6n2Y+3XLDFPStXfD7nv1eW8u2Cq6hou75Mr0KBNGbXgRhbFUvBDL0gRaXjmkg7
	 UMOAtHy9RpleUcKMqypwUm+7FAP+7WV94SPPDS+iflSM0R/3B0aYQ+zVzsCrD1kbCN
	 GLQRSRhrcBvuMao4KMZkkxqhvQDXv5uRUpuNxj/JtHPg+K9qzLfeMANU/PKqlwK/IW
	 jWq29M4zs7VdJhfxxuCcltCFciWJYoREentf1WHh1zoMt7+ZBmdnEzDUFeSiN8AEmd
	 crxVtp/VRrYmXTljITVZtiquORGQRHUQmrruNQeeitOGEvtUI2kb2G0cp9sMJ1mkVR
	 u8wQ8i1Fqflcw==
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
Subject: [PATCH v1 25/25] clk: mediatek: clk-mt7986-topckgen: Migrate to mtk_clk_simple_probe()
Date: Thu, 22 Dec 2022 12:48:57 +0100
Message-Id: <20221222114857.120060-26-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034958_821014_A1F6594E 
X-CRM114-Status: GOOD (  12.31  )
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
---
 drivers/clk/mediatek/clk-mt7986-topckgen.c | 52 +++++-----------------
 1 file changed, 12 insertions(+), 40 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-topckgen.c b/drivers/clk/mediatek/clk-mt7986-topckgen.c
index bf3088e6d9e3..286418aa00a0 100644
--- a/drivers/clk/mediatek/clk-mt7986-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt7986-topckgen.c
@@ -290,52 +290,24 @@ static const struct mtk_mux top_muxes[] = {
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
-	mtk_clk_register_muxes(top_muxes, ARRAY_SIZE(top_muxes), node,
-			       &mt7986_clk_lock, clk_data, &pdev->dev);
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
+	{ .compatible = "mediatek,mt7986-topckgen", .data = &topck_desc },
 	{}
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



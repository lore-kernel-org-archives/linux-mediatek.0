Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CEAC41535
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 09:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbcA6nkOcouKDhQKQQe0VTAwNGX21IQ3XB8tRUzGHGE=; b=XZzpOw7mFxgjsleebLWCmC4UVY
	PG+8k7/9+SXU5obDWYXo2A2JwkpzKlLRmEo8HbAqIpjesg/4YskTE/Dk/03LXlTDc4JLHlmNm97bO
	c5CFeTuQxfy4eDZeRnHwRjffkcR4s+hSKOnd1mJvNay8odi84sDtTIgIFMwLOkuYVwjQda8Eik5sg
	+eAuM3kdCYPJHfjgg6bEK/K96K9BxPykup+jXxxkyO0l+bGUyHRgVDMgni/nX5fGPHjahQARRG+oZ
	IDhCG7WnD0A0YT3PCP+yEd6SAF40KyokDkY1tRoo4s401QqeZ9p6V+lpBFjrCURD5ndG76mP07IE1
	K0PAgcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ebv-005tvM-Km; Fri, 23 Dec 2022 09:45:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ea5-005seP-SO; Fri, 23 Dec 2022 09:43:13 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5B7EC6602CE1;
	Fri, 23 Dec 2022 09:43:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671788588;
	bh=4EyQ1OjZT/baUayxYK+ueqc8j67gyi4x2llaOGk/ij8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N8rBp5+Td/KdXaiYh1HKJVsvFExiZTNHsA4pbwlj2Ib5yTsKddTj2iqzedjY949yg
	 7V16FMf2Y9RNJFRj4xZYP3/cpaX4VGGMRWnhWHz9WBakWMPKhi3RAiwbdhPep1rIAT
	 ZR+Kfx6LVN/14FoLLIY9VH2qlukGG7RoDAqCGa+QGWVT17kvsOlINu8sWQ6hCNZm0e
	 ons2Cx3HgBuTv6r/WiDWoSJ0UJapkS+RsCAWND78w3aK/eym2XsmymuWsUqQXtQSwe
	 AGZ1HJ36EFjFk2r2DIy3MUqtNx59UhMl7DXftMgo2roTd+WIab8HYpSR1ftVE0vlUC
	 //DeYYDMtMFUw==
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
Subject: [PATCH v2 01/23] clk: mediatek: mt8192: Correctly unregister and free clocks on failure
Date: Fri, 23 Dec 2022 10:42:37 +0100
Message-Id: <20221223094259.87373-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_014310_433696_1FA5DCBF 
X-CRM114-Status: GOOD (  10.44  )
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

If anything fails during probe of the clock controller(s), unregister
(and kfree!) whatever we have previously registered to leave with a
clean state and prevent leaks.

Fixes: 710573dee31b ("clk: mediatek: Add MT8192 basic clocks support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8192.c | 72 ++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index 0e88588b2c49..eff66ca6c6a7 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1100,27 +1100,61 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
-	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
-	mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node, &mt8192_clk_lock,
-			       top_clk_data);
-	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base, &mt8192_clk_lock,
-				    top_clk_data);
-	mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base, &mt8192_clk_lock,
-				    top_clk_data);
-	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	r = mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
 	if (r)
 		return r;
 
+	r = mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
+	if (r)
+		goto unregister_fixed_clks;
+
+	r = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+	if (r)
+		goto unregister_early_factors;
+
+	r = mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
+				   &mt8192_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_factors;
+
+	r = mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
+					&mt8192_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_muxes;
+
+	r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
+					&mt8192_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_top_composites;
+
+	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	if (r)
+		goto unregister_adj_divs_composites;
+
 	r = clk_mt8192_reg_mfg_mux_notifier(&pdev->dev,
 					    top_clk_data->hws[CLK_TOP_MFG_PLL_SEL]->clk);
 	if (r)
-		return r;
-
+		goto unregister_gates;
 
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
 				      top_clk_data);
+
+unregister_gates:
+	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+unregister_adj_divs_composites:
+	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
+unregister_top_composites:
+	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
+unregister_muxes:
+	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
+unregister_factors:
+	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+unregister_early_factors:
+	mtk_clk_unregister_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
+unregister_fixed_clks:
+	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
+				      top_clk_data);
+	return r;
 }
 
 static int clk_mt8192_infra_probe(struct platform_device *pdev)
@@ -1139,14 +1173,16 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
 
 	r = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
 	if (r)
-		goto free_clk_data;
+		goto unregister_gates;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-		goto free_clk_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(infra_clks, ARRAY_SIZE(infra_clks), clk_data);
 free_clk_data:
 	mtk_free_clk_data(clk_data);
 	return r;
@@ -1168,10 +1204,12 @@ static int clk_mt8192_peri_probe(struct platform_device *pdev)
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-		goto free_clk_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(peri_clks, ARRAY_SIZE(peri_clks), clk_data);
 free_clk_data:
 	mtk_free_clk_data(clk_data);
 	return r;
@@ -1194,10 +1232,12 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-		goto free_clk_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
 free_clk_data:
 	mtk_free_clk_data(clk_data);
 	return r;
-- 
2.39.0



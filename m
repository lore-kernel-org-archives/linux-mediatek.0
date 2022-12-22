Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6DCC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1iS2XgY/3O6EWd+pIgwtxYUXmFhfzGHv81EyQIS6/Y=; b=RM9DgWmaATzfPerXhfv/OhR/cK
	IjUhcizuMTRSHjJq+kmbN2NTD4B5MC/SOvynOuAykuh1XBv6PmD+A0/ISNAX5lm594Dc17O41wdC7
	pQLVt56jlemyyX2mdEAymlUnFEsD9ukaK73QFIqnGD6PYL8UHbK2gmqBvHgKPUCClhluqrnXmbsh4
	eyOhTZVprap2ubxjWuZ3wYXwd2df71n1LYf8njhgzGmIjLdL6L5wkB/8zoBIe9xzkDDEfaCSQSisH
	UkXlowe9mk6ztaX7mwdFB+KnFCV9JgCHngK6ZBzCqhqDIkLKgZpCg7xxKIlU1WEwZjkJEcdYUMM7U
	+VdZKxzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8LA0-00C8U2-41; Thu, 22 Dec 2022 12:58:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K54-00BXaA-U2; Thu, 22 Dec 2022 11:49:49 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3AF5E6602CE9;
	Thu, 22 Dec 2022 11:49:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671709785;
	bh=qJD6neFrISC/cTuT2H409HfAsDBdlpEBNGJzQ7fGoL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQ6i7/p/X2N18uW9UmKy3encsmFK+vs1JcjTvnOwhPQh9H+2+Z+XXTfT3iNGGGNJb
	 gZt4r+VauOAsQP3YGlpSZu2aROIGI3L6MQ5Oa97PfVCBfBP4ikupCHY5452/F1WSdV
	 pSW8HX7r9FY5Vhs4pNV1Y6vu10lc+x9kmIcLPuabLfv2WznQRI/iRgVYEgfAAsxpG7
	 ngrVpEc5Da/1G/X2pDim62CitaCFAopRV3hLw8Os8+YWjSDniMgCUJITQcEAb2IjPv
	 6bTxod4orqdIZHfFYS+C6Iz9xn7mupIX85VtVBT/PEsdE6Vg3GSKnt4DJNYC+sDm/2
	 oSbjIfxfd5O9Q==
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
Subject: [PATCH v1 18/25] clk: mediatek: mt8186: Join top_adj_div and top_muxes
Date: Thu, 22 Dec 2022 12:48:50 +0100
Message-Id: <20221222114857.120060-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034947_151618_3EFB180B 
X-CRM114-Status: GOOD (  10.91  )
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

Like done for MT8192, join the two to register them in one shot, as
there's no point in doing that separately from one another.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8186-topckgen.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8186-topckgen.c b/drivers/clk/mediatek/clk-mt8186-topckgen.c
index d05143891b69..63befb1f492d 100644
--- a/drivers/clk/mediatek/clk-mt8186-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8186-topckgen.c
@@ -669,9 +669,6 @@ static struct mtk_composite top_muxes[] = {
 	MUX(CLK_TOP_APLL_I2S4_MCK_SEL, "apll_i2s4_mck_sel", apll_mck_parents, 0x0320, 19, 1),
 	MUX(CLK_TOP_APLL_TDMOUT_MCK_SEL, "apll_tdmout_mck_sel", apll_mck_parents,
 		0x0320, 20, 1),
-};
-
-static const struct mtk_composite top_adj_divs[] = {
 	DIV_GATE(CLK_TOP_APLL12_CK_DIV0, "apll12_div0", "apll_i2s0_mck_sel",
 			0x0320, 0, 0x0328, 8, 0),
 	DIV_GATE(CLK_TOP_APLL12_CK_DIV1, "apll12_div1", "apll_i2s1_mck_sel",
@@ -747,26 +744,19 @@ static int clk_mt8186_topck_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_muxes;
 
-	r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
-					&mt8186_clk_lock, clk_data, &pdev->dev);
-	if (r)
-		goto unregister_composite_muxes;
-
 	r = clk_mt8186_reg_mfg_mux_notifier(&pdev->dev,
 					    clk_data->hws[CLK_TOP_MFG]->clk);
 	if (r)
-		goto unregister_composite_divs;
+		goto unregister_composite_muxes;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-		goto unregister_composite_divs;
+		goto unregister_composite_muxes;
 
 	platform_set_drvdata(pdev, clk_data);
 
 	return r;
 
-unregister_composite_divs:
-	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), clk_data);
 unregister_composite_muxes:
 	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
 unregister_muxes:
@@ -787,7 +777,6 @@ static int clk_mt8186_topck_remove(struct platform_device *pdev)
 
 	of_clk_del_provider(node);
 	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), clk_data);
-	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
 	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), clk_data);
 	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
 	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), clk_data);
-- 
2.39.0



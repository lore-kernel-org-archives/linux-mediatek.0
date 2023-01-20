Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF7AC25B4E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjxtQm9yGz6MJPuXyRMk0bzwYVSnoLlNx3J1i1Kq8ro=; b=NvSWzK/2KMLyYKgvuJnubiin6Z
	25id4QuTVFdYxjceWC9Gszc7YHyoKRvymkpCDoUBRPpMJvP/CAnRG3DsFzoW9Mj4TdhDsE5Gt5zla
	wYRH7zWnCY8C5cPLt4hBRrPPyNlUocqyHsS9QHIEV2rsCVDM5BRKpjuU7tvFwdzgIghl9KzladXbj
	NnrDwvcr/VfbjsWZ8ulYf4UIp9P8CYiiSzp49Oz0/GJXCwGRwb4bVAy2qKBX+wNIwQiw3go032iso
	93rm4FW0iii+lFI94mDsKiRZOXMxXNKwnRTspGNH6/z7n6A5qo04zW8edDs3TxGczBIo+Ai5UE7dR
	R4NrMlug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInxM-009Up0-Bz; Fri, 20 Jan 2023 09:45:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInaO-009JuN-Gt; Fri, 20 Jan 2023 09:21:31 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 997906602E8E;
	Fri, 20 Jan 2023 09:21:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674206483;
	bh=TXsvpuYEwVayUGP6yTdMIQtVttt74SBr+RVJGfEefQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KnpU2UKUHHOdVtqDj350MN+FIuePsNaXgLcilcaOUEQsYyFgwXj076hIe2ck5QZDn
	 F/wVTYuThbymeWjdhfV1eTD0OIw3gPkLCvkfeFdNTyah5Q+ESNA0Z7+homEytIGpNz
	 UiPTgMK/Vq6yShR01/rG06xiU3GPpc6+rPWlDiJokY3iedxyU9gB33kGFo5JqfxznM
	 QnOOxIiVHk6d2b5XGAyDRhW4p33pxN0NAhEfSVJyc8pQ+w8HZpwPM+EenqrchXMbI/
	 gnPq1cyIV0VhwWpj5Oemu9xoeluXsOv4u0gn8NszP6I5lGecOaiqZQ4gUkZ5S0vsKh
	 cw43oMzeCUNKw==
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
Subject: [PATCH v4 14/23] clk: mediatek: clk-mt8192: Move CLK_TOP_CSW_F26M_D2 in top_divs
Date: Fri, 20 Jan 2023 10:20:44 +0100
Message-Id: <20230120092053.182923-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
References: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_012124_961316_58145629 
X-CRM114-Status: GOOD (  15.41  )
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

This driver is registered early in clk_mt8192_top_init_early() and
then again in clk_mt8192_top_probe(): the difference between the
two is that the early one is probed with CLK_OF_DECLARE_DRIVER and
the latter is regularly probed as a platform_driver.

Knowing that it is not necessary for this platform to register the
TOP_CSW_F26M_D2 clock that early, move it to top_divs and register
it with the others during platform_driver probe for topckgen;

While at it, since the only reason why the early probe existed was
to register that clock, remove that entirely - leaving this driver
to use only platform_driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8192.c | 39 ++++++-------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index ea4164c0995e..d012a229274e 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -26,10 +26,6 @@ static const struct mtk_fixed_clk top_fixed_clks[] = {
 	FIXED_CLK(CLK_TOP_ULPOSC, "ulposc", NULL, 260000000),
 };
 
-static const struct mtk_fixed_factor top_early_divs[] = {
-	FACTOR(CLK_TOP_CSW_F26M_D2, "csw_f26m_d2", "clk26m", 1, 2),
-};
-
 static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR_FLAGS(CLK_TOP_MAINPLL_D3, "mainpll_d3", "mainpll", 1, 3, 0),
 	FACTOR_FLAGS(CLK_TOP_MAINPLL_D4, "mainpll_d4", "mainpll", 1, 4, 0),
@@ -95,6 +91,7 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_OSC_D10, "osc_d10", "ulposc", 1, 10),
 	FACTOR(CLK_TOP_OSC_D16, "osc_d16", "ulposc", 1, 16),
 	FACTOR(CLK_TOP_OSC_D20, "osc_d20", "ulposc", 1, 20),
+	FACTOR(CLK_TOP_CSW_F26M_D2, "csw_f26m_d2", "clk26m", 1, 2),
 	FACTOR(CLK_TOP_ADSPPLL, "adsppll_ck", "adsppll", 1, 1),
 	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M, "univpll_192m", "univpll", 1, 13, 0),
 	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M_D2, "univpll_192m_d2", "univpll_192m", 1, 2, 0),
@@ -1047,27 +1044,6 @@ static const struct mtk_pll_data plls[] = {
 	      0, 0, 32, 0x0330, 24, 0, 0, 0, 0x0334, 0),
 };
 
-static struct clk_hw_onecell_data *top_clk_data;
-
-static void clk_mt8192_top_init_early(struct device_node *node)
-{
-	int i;
-
-	top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
-	if (!top_clk_data)
-		return;
-
-	for (i = 0; i < CLK_TOP_NR_CLK; i++)
-		top_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
-
-	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
-
-	of_clk_add_hw_provider(node, of_clk_hw_onecell_get, top_clk_data);
-}
-
-CLK_OF_DECLARE_DRIVER(mt8192_topckgen, "mediatek,mt8192-topckgen",
-		      clk_mt8192_top_init_early);
-
 /* Register mux notifier for MFG mux */
 static int clk_mt8192_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
 {
@@ -1093,6 +1069,7 @@ static int clk_mt8192_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
 static int clk_mt8192_top_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
+	struct clk_hw_onecell_data *top_clk_data;
 	int r;
 	void __iomem *base;
 
@@ -1100,17 +1077,17 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+	if (!top_clk_data)
+		return;
+
 	r = mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
 	if (r)
 		return r;
 
-	r = mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
-	if (r)
-		goto unregister_fixed_clks;
-
 	r = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
 	if (r)
-		goto unregister_early_factors;
+		goto unregister_fixed_clks;
 
 	r = mtk_clk_register_muxes(&pdev->dev, top_mtk_muxes,
 				   ARRAY_SIZE(top_mtk_muxes), node,
@@ -1156,8 +1133,6 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
 unregister_factors:
 	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
-unregister_early_factors:
-	mtk_clk_unregister_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
 unregister_fixed_clks:
 	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
 				      top_clk_data);
-- 
2.39.0



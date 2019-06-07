From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v1] clk: mediatek: mt8183: Register 13MHz clock earlier for clocksource
Date: Fri, 7 Jun 2019 11:11:52 +0800
Message-ID: <1559877112-21064-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, Dehui Sun <dehui.sun@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

The 13MHz clock should be registered before clocksource driver is
initialized. Use CLK_OF_DECLARE_DRIVER() to guarantee.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8183.c | 49 ++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 9d86510..a8f50bc 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -25,9 +25,11 @@
 	FIXED_CLK(CLK_TOP_UNIVP_192M, "univpll_192m", "univpll", 192000000),
 };
 
+static const struct mtk_fixed_factor top_early_divs[] = {
+	FACTOR(CLK_TOP_CLK13M, "clk13m", "clk26m", 1, 2),
+};
+
 static const struct mtk_fixed_factor top_divs[] = {
-	FACTOR(CLK_TOP_CLK13M, "clk13m", "clk26m", 1,
-		2),
 	FACTOR(CLK_TOP_F26M_CK_D2, "csw_f26m_ck_d2", "clk26m", 1,
 		2),
 	FACTOR(CLK_TOP_SYSPLL_CK, "syspll_ck", "mainpll", 1,
@@ -1167,37 +1169,62 @@ static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
 	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 }
 
+static struct clk_onecell_data *top_clk_data;
+
+static void clk_mt8183_top_init_early(struct device_node *node)
+{
+	int i;
+
+	if (!top_clk_data) {
+		top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+
+		for (i = 0; i < CLK_TOP_NR_CLK; i++)
+			top_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
+	}
+
+	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs),
+			top_clk_data);
+
+	of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
+}
+
+CLK_OF_DECLARE_DRIVER(mt8183_topckgen, "mediatek,mt8183-topckgen",
+			clk_mt8183_top_init_early);
+
 static int clk_mt8183_top_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	void __iomem *base;
-	struct clk_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
 	base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+	if (!top_clk_data)
+		top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
 
 	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-		clk_data);
+		top_clk_data);
+
+	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs),
+		top_clk_data);
 
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
+	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
 
 	mtk_clk_register_muxes(top_muxes, ARRAY_SIZE(top_muxes),
-		node, &mt8183_clk_lock, clk_data);
+		node, &mt8183_clk_lock, top_clk_data);
 
 	mtk_clk_register_composites(top_aud_muxes, ARRAY_SIZE(top_aud_muxes),
-		base, &mt8183_clk_lock, clk_data);
+		base, &mt8183_clk_lock, top_clk_data);
 
 	mtk_clk_register_composites(top_aud_divs, ARRAY_SIZE(top_aud_divs),
-		base, &mt8183_clk_lock, clk_data);
+		base, &mt8183_clk_lock, top_clk_data);
 
 	mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
-		clk_data);
+		top_clk_data);
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
 }
 
 static int clk_mt8183_infra_probe(struct platform_device *pdev)
-- 
1.8.1.1.dirty

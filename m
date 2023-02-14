Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675D9C05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 14:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/35oDriVVNzxvaCPdsH2b5PV5FdYhPE9khD1gQtgcF4=; b=Qjhk7YwyI0/Bv2TYKz/boJfjqN
	Fw4+ZNeeE4me+E86MyLjo/J83pBv8WobGhZVVk3LqF5z6aiRp+OX7Ck5LlUP3h6AklPa2+fB901aL
	0cjlU5+0xCRmv28S1w7dNPdL8ZTiPsWFpJwaWvbctqk2a8uD+EjzywvLGacjSa+XyuT212Kx5fCzN
	62YUc1+FnTussBc77R7ocUe5rTFfEL2VsnKgEYHAa9gDdqImQgSKKag9hnbOHp9VxNl4ukD8NtLMN
	O3DO+O6YTs9MNNSxnMHv0hi8yWTAsl+M/+EQ0Sxkw5YJXY56qtvGsOyZgN0cs06I2uykcuXdM+2ep
	J73x1GTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvrv-001vG4-Qk; Tue, 14 Feb 2023 14:01:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvZb-001log-1W; Tue, 14 Feb 2023 13:42:20 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A91ED6602171;
	Tue, 14 Feb 2023 13:42:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676382137;
	bh=ZKQUkviCIe14DWtYqRN5l1Its7pOWT7mbgicOkjgtd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N51Y36i1dxM3KfOd8OfwBw3Nu7DruFdzfbtjMGZB/RPDZinkS5l/jGwKvrm9c3nDb
	 6RJAFYh2KAZP1fUp8ZLbwHQZitVmnMhWHowCf8cprH7ASNZTPFpSX9r9aY58g5o9vZ
	 +IKI0ZHfNL6CqxZWTXft9QLMlPSVJA+XR/dJOvvF3Wh7/STbfAA7JmbbyjgJN+0Jh7
	 KrtKixukgi67XICYMdrLsNr9eZwbw4+LCP6QRNpY2qdvx8/4z4fhN8mINBY49pcmFQ
	 hMzL+lnn60bV8140Z3DDDwuqQlpbmdbHKsQYMZs3Tz/J3Bcy5FppViJetBVc3YbmNg
	 NCOvTCkZ8wL2A==
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
Subject: [PATCH v2 27/47] clk: mediatek: mt8516: Convert to platform driver and simple probe
Date: Tue, 14 Feb 2023 14:41:07 +0100
Message-Id: <20230214134127.59273-28-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_054219_395970_5E5E7244 
X-CRM114-Status: GOOD (  13.43  )
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

Convert the MT8516 clock drivers to be platform drivers and use the
common probe mechanism.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8516-aud.c | 35 ++++++-----
 drivers/clk/mediatek/clk-mt8516.c     | 88 +++++++++++----------------
 2 files changed, 57 insertions(+), 66 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8516-aud.c b/drivers/clk/mediatek/clk-mt8516-aud.c
index a6ae8003b9ff..119dbbd0c3e0 100644
--- a/drivers/clk/mediatek/clk-mt8516-aud.c
+++ b/drivers/clk/mediatek/clk-mt8516-aud.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2019 MediaTek Inc.
  * Author: James Liao <jamesjj.liao@mediatek.com>
  *         Fabien Parent <fparent@baylibre.com>
+ * Copyright (c) 2023 Collabora Ltd.
  */
 
 #include <linux/clk-provider.h>
@@ -25,7 +26,7 @@ static const struct mtk_gate_regs aud_cg_regs = {
 #define GATE_AUD(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &aud_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
 
-static const struct mtk_gate aud_clks[] __initconst = {
+static const struct mtk_gate aud_clks[] = {
 	GATE_AUD(CLK_AUD_AFE, "aud_afe", "clk26m_ck", 2),
 	GATE_AUD(CLK_AUD_I2S, "aud_i2s", "i2s_infra_bck", 6),
 	GATE_AUD(CLK_AUD_22M, "aud_22m", "rg_aud_engen1", 8),
@@ -41,19 +42,25 @@ static const struct mtk_gate aud_clks[] __initconst = {
 	GATE_AUD(CLK_AUD_TML, "aud_tml", "aud_afe", 27),
 };
 
-static void __init mtk_audsys_init(struct device_node *node)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_AUD_NR_CLK);
+static const struct mtk_clk_desc aud_desc = {
+	.clks = aud_clks,
+	.num_clks = ARRAY_SIZE(aud_clks),
+};
 
-	mtk_clk_register_gates(NULL, node, aud_clks, ARRAY_SIZE(aud_clks), clk_data);
+static const struct of_device_id of_match_clk_mt8516_aud[] = {
+	{ .compatible = "mediatek,mt8516-audsys", .data = &aud_desc },
+	{ /* sentinel */ }
+};
 
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
+static struct platform_driver clk_mt8516_aud_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8516-aud",
+		.of_match_table = of_match_clk_mt8516_aud,
+	},
+};
+builtin_platform_driver(clk_mt8516_aud_drv);
 
-}
-CLK_OF_DECLARE(mtk_audsys, "mediatek,mt8516-audsys", mtk_audsys_init);
+MODULE_DESCRIPTION("MediaTek MT8516 audiosys clocks driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
index 51e6948cb54b..ad59e932d4aa 100644
--- a/drivers/clk/mediatek/clk-mt8516.c
+++ b/drivers/clk/mediatek/clk-mt8516.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2019 MediaTek Inc.
  * Author: James Liao <jamesjj.liao@mediatek.com>
  *         Fabien Parent <fparent@baylibre.com>
+ * Copyright (c) 2023 Collabora Ltd.
  */
 
 #include <linux/delay.h>
@@ -10,6 +11,7 @@
 #include <linux/of_address.h>
 #include <linux/slab.h>
 #include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
 
 #include "clk-gate.h"
 #include "clk-mtk.h"
@@ -638,59 +640,41 @@ static const struct mtk_gate top_clks[] __initconst = {
 	GATE_TOP5(CLK_TOP_APLL12_DIV6, "apll12_div6", "apll12_ck_div6", 8),
 };
 
-static void __init mtk_topckgen_init(struct device_node *node)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	void __iomem *base;
-
-	base = of_iomap(node, 0);
-	if (!base) {
-		pr_err("%s(): ioremap failed\n", __func__);
-		return;
-	}
+static const struct mtk_clk_desc topck_desc = {
+	.clks = top_clks,
+	.num_clks = ARRAY_SIZE(top_clks),
+	.fixed_clks = fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(fixed_clks),
+	.factor_clks = top_divs,
+	.num_factor_clks = ARRAY_SIZE(top_divs),
+	.composite_clks = top_muxes,
+	.num_composite_clks = ARRAY_SIZE(top_muxes),
+	.divider_clks = top_adj_divs,
+	.num_divider_clks = ARRAY_SIZE(top_adj_divs),
+	.clk_lock = &mt8516_clk_lock,
+};
 
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+static const struct mtk_clk_desc infra_desc = {
+	.composite_clks = ifr_muxes,
+	.num_composite_clks = ARRAY_SIZE(ifr_muxes),
+	.clk_lock = &mt8516_clk_lock,
+};
 
-	mtk_clk_register_fixed_clks(fixed_clks, ARRAY_SIZE(fixed_clks),
-				    clk_data);
-	mtk_clk_register_gates(NULL, node, top_clks, ARRAY_SIZE(top_clks), clk_data);
+static const struct of_device_id of_match_clk_mt8516[] = {
+	{ .compatible = "mediatek,mt8516-topckgen", .data = &topck_desc },
+	{ .compatible = "mediatek,mt8516-infracfg", .data = &infra_desc },
+	{ /* sentinel */ }
+};
 
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-	mtk_clk_register_composites(NULL, top_muxes,
-				    ARRAY_SIZE(top_muxes), base,
-				    &mt8516_clk_lock, clk_data);
-	mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
-				base, &mt8516_clk_lock, clk_data);
+static struct platform_driver clk_mt8516_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8516",
+		.of_match_table = of_match_clk_mt8516,
+	},
+};
+module_platform_driver(clk_mt8516_drv);
 
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
-}
-CLK_OF_DECLARE(mtk_topckgen, "mediatek,mt8516-topckgen", mtk_topckgen_init);
-
-static void __init mtk_infracfg_init(struct device_node *node)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	void __iomem *base;
-
-	base = of_iomap(node, 0);
-	if (!base) {
-		pr_err("%s(): ioremap failed\n", __func__);
-		return;
-	}
-
-	clk_data = mtk_alloc_clk_data(CLK_IFR_NR_CLK);
-
-	mtk_clk_register_composites(NULL, ifr_muxes,
-				    ARRAY_SIZE(ifr_muxes), base,
-				    &mt8516_clk_lock, clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
-}
-CLK_OF_DECLARE(mtk_infracfg, "mediatek,mt8516-infracfg", mtk_infracfg_init);
+MODULE_DESCRIPTION("MediaTek MT8516 clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.1



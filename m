From: matthias.bgg@kernel.org
Subject: [PATCH v3 2/3] clk: mediatek: Add flags to mtk_gate
Date: Tue,  8 Jan 2019 13:12:07 +0100
Message-ID: <20190108121208.2473-3-matthias.bgg@kernel.org>
References: <20190108121208.2473-1-matthias.bgg@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108121208.2473-1-matthias.bgg@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, kevin-cw.chen@mediatek.com, mars.cheng@mediatek.com
Cc: sean.wang@mediatek.com, matthias.bgg@gmail.com, jasu@njomotys.info, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Jasper Mattsson <jasu@njomotys.info>

This is required to mark gates as CLK_IS_CRITICAL.

Signed-off-by: Jasper Mattsson <jasu@njomotys.info>
Acked-by: Mars Cheng <mars.cheng@mediatek.com>
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/clk/mediatek/clk-gate.c | 4 +++-
 drivers/clk/mediatek/clk-gate.h | 3 ++-
 drivers/clk/mediatek/clk-mtk.c  | 2 +-
 drivers/clk/mediatek/clk-mtk.h  | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 934bf0e45e26..9628d4e7690b 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -157,7 +157,8 @@ struct clk *mtk_clk_register_gate(
 		int clr_ofs,
 		int sta_ofs,
 		u8 bit,
-		const struct clk_ops *ops)
+		const struct clk_ops *ops,
+		unsigned long flags)
 {
 	struct mtk_clk_gate *cg;
 	struct clk *clk;
@@ -172,6 +173,7 @@ struct clk *mtk_clk_register_gate(
 	init.parent_names = parent_name ? &parent_name : NULL;
 	init.num_parents = parent_name ? 1 : 0;
 	init.ops = ops;
+	init.flags = flags;
 
 	cg->regmap = regmap;
 	cg->set_ofs = set_ofs;
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 72ef89b3ad7b..9f766dfe1d57 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -47,6 +47,7 @@ struct clk *mtk_clk_register_gate(
 		int clr_ofs,
 		int sta_ofs,
 		u8 bit,
-		const struct clk_ops *ops);
+		const struct clk_ops *ops,
+		unsigned long flags);
 
 #endif /* __DRV_CLK_GATE_H */
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 9c0ae4278a94..ef410413bb0b 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -130,7 +130,7 @@ int mtk_clk_register_gates(struct device_node *node,
 				gate->regs->set_ofs,
 				gate->regs->clr_ofs,
 				gate->regs->sta_ofs,
-				gate->shift, gate->ops);
+				gate->shift, gate->ops, gate->flags);
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %ld\n",
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index daab6ee94788..987ff2855249 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -162,6 +162,7 @@ struct mtk_gate {
 	const struct mtk_gate_regs *regs;
 	int shift;
 	const struct clk_ops *ops;
+	unsigned long flags;
 };
 
 int mtk_clk_register_gates(struct device_node *node,
-- 
2.20.1

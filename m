From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 2/3] clk: mediatek: Add support for clk-mux using regmap
Date: Tue, 16 Jun 2015 16:23:34 +0200
Message-ID: <1434464615-9080-3-git-send-email-matthias.bgg@gmail.com>
References: <1434464615-9080-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1434464615-9080-1-git-send-email-matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: mturquette-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

This patches adds support for the mediatek clocks to be able to register
and use a clk-mux wich relies on regmap.

Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clk/mediatek/clk-mtk.c | 37 +++++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h | 26 ++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 18444ae..cf953a8 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -111,6 +111,43 @@ int mtk_clk_register_gates(struct device_node *node, const struct mtk_gate *clks
 	return 0;
 }
 
+int mtk_clk_regm_register_mux(struct device_node *node,
+		const struct mtk_regm_mux *clks, int num,
+		struct clk_onecell_data *clk_data)
+{
+	int i;
+	struct clk *clk;
+	struct regmap *regmap;
+
+	if (!clk_data)
+		return -ENOMEM;
+
+	regmap = syscon_node_to_regmap(node);
+	if (IS_ERR(regmap)) {
+		pr_err("Cannot find regmap for %s: %ld\n", node->full_name,
+				PTR_ERR(regmap));
+		return PTR_ERR(regmap);
+	}
+
+	for (i = 0; i < num; i++) {
+		const struct mtk_regm_mux *mux = &clks[i];
+
+		clk = clk_regm_register_mux(NULL, mux->name, mux->parent_names,
+					mux->num_parents, 0, regmap,
+					mux->mux_offset, mux->mux_shift,
+					mux->mux_width, mux->flags, NULL);
+		if (IS_ERR(clk)) {
+			pr_err("Failed to register clk mux %s: %ld\n",
+					mux->name, PTR_ERR(clk));
+			continue;
+		}
+
+		clk_data->clks[mux->id] = clk;
+	}
+
+	return 0;
+}
+
 struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 9dda9d8..6fe85ca 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -156,6 +156,32 @@ void __init mtk_clk_register_plls(struct device_node *node,
 		const struct mtk_pll_data *plls, int num_plls,
 		struct clk_onecell_data *clk_data);
 
+struct mtk_regm_mux {
+	int id;
+	const char *name;
+	const char * const *parent_names;
+	u8 num_parents;
+	unsigned flags;
+	uint32_t mux_offset;
+	uint32_t mux_shift;
+	uint32_t mux_width;
+};
+
+int __init mtk_clk_regm_register_mux(struct device_node *node,
+		const struct mtk_regm_mux *clks, int num,
+		struct clk_onecell_data *clk_data);
+
+#define MUX_REGMAP(_id, _name, _parents, _offset, _shift, _width) {	\
+		.id = _id,						\
+		.name = _name,						\
+		.parent_names = _parents,				\
+		.num_parents = ARRAY_SIZE(_parents),			\
+		.flags = CLK_SET_RATE_PARENT,				\
+		.mux_offset = _offset,					\
+		.mux_shift = _shift,					\
+		.mux_width = _width,					\
+	}
+
 #ifdef CONFIG_RESET_CONTROLLER
 void mtk_register_reset_controller(struct device_node *np,
 			unsigned int num_regs, int regofs);
-- 
1.9.1

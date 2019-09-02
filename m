From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v1 1/3] clk: mediatek: Register clock gate with device
Date: Mon, 2 Sep 2019 16:35:08 +0800
Message-ID: <1567413310-2589-2-git-send-email-weiyi.lu@mediatek.com>
References: <1567413310-2589-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567413310-2589-1-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, CK Hu <ck.hu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Allow those clocks under a power domain to do the runtime pm operation
by forwarding the struct device pointer from clock provider.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-gate.c |  5 +++--
 drivers/clk/mediatek/clk-gate.h |  3 ++-
 drivers/clk/mediatek/clk-mtk.c  | 16 +++++++++++++---
 drivers/clk/mediatek/clk-mtk.h  |  5 +++++
 4 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 803bf0a..a35cf0b 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -150,7 +150,8 @@ struct clk *mtk_clk_register_gate(
 		int sta_ofs,
 		u8 bit,
 		const struct clk_ops *ops,
-		unsigned long flags)
+		unsigned long flags,
+		struct device *dev)
 {
 	struct mtk_clk_gate *cg;
 	struct clk *clk;
@@ -174,7 +175,7 @@ struct clk *mtk_clk_register_gate(
 
 	cg->hw.init = &init;
 
-	clk = clk_register(NULL, &cg->hw);
+	clk = clk_register(dev, &cg->hw);
 	if (IS_ERR(clk))
 		kfree(cg);
 
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index e05c736..3c3329e 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -40,7 +40,8 @@ struct clk *mtk_clk_register_gate(
 		int sta_ofs,
 		u8 bit,
 		const struct clk_ops *ops,
-		unsigned long flags);
+		unsigned long flags,
+		struct device *dev);
 
 #define GATE_MTK_FLAGS(_id, _name, _parent, _regs, _shift,	\
 			_ops, _flags) {				\
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index d28790c..cec1c8a 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/clkdev.h>
 #include <linux/mfd/syscon.h>
+#include <linux/device.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
@@ -93,9 +94,10 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 	}
 }
 
-int mtk_clk_register_gates(struct device_node *node,
+int mtk_clk_register_gates_with_dev(struct device_node *node,
 		const struct mtk_gate *clks,
-		int num, struct clk_onecell_data *clk_data)
+		int num, struct clk_onecell_data *clk_data,
+		struct device *dev)
 {
 	int i;
 	struct clk *clk;
@@ -122,7 +124,7 @@ int mtk_clk_register_gates(struct device_node *node,
 				gate->regs->set_ofs,
 				gate->regs->clr_ofs,
 				gate->regs->sta_ofs,
-				gate->shift, gate->ops, gate->flags);
+				gate->shift, gate->ops, gate->flags, dev);
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %ld\n",
@@ -136,6 +138,14 @@ int mtk_clk_register_gates(struct device_node *node,
 	return 0;
 }
 
+int mtk_clk_register_gates(struct device_node *node,
+		const struct mtk_gate *clks,
+		int num, struct clk_onecell_data *clk_data)
+{
+	return mtk_clk_register_gates_with_dev(node,
+		clks, num, clk_data, NULL);
+}
+
 struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 733a11d..0f8ada7 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -169,6 +169,11 @@ int mtk_clk_register_gates(struct device_node *node,
 			const struct mtk_gate *clks, int num,
 			struct clk_onecell_data *clk_data);
 
+int mtk_clk_register_gates_with_dev(struct device_node *node,
+		const struct mtk_gate *clks,
+		int num, struct clk_onecell_data *clk_data,
+		struct device *dev);
+
 struct mtk_clk_divider {
 	int id;
 	const char *name;
-- 
1.8.1.1.dirty

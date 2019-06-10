From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [RFC v1] clk: core: support clocks that need to be enabled during re-parent
Date: Mon, 10 Jun 2019 11:44:53 +0800
Message-ID: <1560138293-4163-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, Biao Huang <biao.huang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

When using property assigned-clock-parents to assign parent clocks,
core clocks might still be disabled during re-parent.
Add flag 'CLK_OPS_CORE_ENABLE' for those clocks must be enabled
during re-parent.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/clk.c            | 9 +++++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 443711f..b2e6fe3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1717,6 +1717,10 @@ static struct clk_core *__clk_set_parent_before(struct clk_core *core,
 		clk_core_prepare_enable(parent);
 	}
 
+	/* enable core if CLK_OPS_CORE_ENABLE is set */
+	if (core->flags & CLK_OPS_CORE_ENABLE)
+		clk_core_prepare_enable(core);
+
 	/* migrate prepare count if > 0 */
 	if (core->prepare_count) {
 		clk_core_prepare_enable(parent);
@@ -1744,6 +1748,10 @@ static void __clk_set_parent_after(struct clk_core *core,
 		clk_core_disable_unprepare(old_parent);
 	}
 
+	/* re-balance ref counting if CLK_OPS_CORE_ENABLE is set */
+	if (core->flags & CLK_OPS_CORE_ENABLE)
+		clk_core_disable_unprepare(core);
+
 	/* re-balance ref counting if CLK_OPS_PARENT_ENABLE is set */
 	if (core->flags & CLK_OPS_PARENT_ENABLE) {
 		clk_core_disable_unprepare(parent);
@@ -2973,6 +2981,7 @@ static int clk_dump_show(struct seq_file *s, void *data)
 	ENTRY(CLK_IS_CRITICAL),
 	ENTRY(CLK_OPS_PARENT_ENABLE),
 	ENTRY(CLK_DUTY_CYCLE_PARENT),
+	ENTRY(CLK_OPS_CORE_ENABLE),
 #undef ENTRY
 };
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index bb6118f..39a1fed 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -34,6 +34,7 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+#define CLK_OPS_CORE_ENABLE	BIT(14)	/* core need enable during re-parent */
 
 struct clk;
 struct clk_hw;
-- 
1.8.1.1.dirty

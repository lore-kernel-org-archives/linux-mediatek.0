From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 2/9] clocksource/drivers/mediatek: Use GPT as sched clock source
Date: Mon, 19 Oct 2015 22:59:21 +0200
Message-ID: <1445288368-6440-2-git-send-email-daniel.lezcano@linaro.org>
References: <56255943.6060807@linaro.org>
 <1445288368-6440-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445288368-6440-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek
	SoC..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

From: Yingjoe Chen <yingjoe.chen@mediatek.com>

When cpu is in deep idle, arch timer will stop counting. Setup GPT as
sched clock source so it can keep counting in idle.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Stephen Boyd <sboyd@codeaurora.org>
Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/clocksource/mtk_timer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index c8badc4..fbfc746 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -24,6 +24,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/sched_clock.h>
 #include <linux/slab.h>
 
 #define GPT_IRQ_EN_REG		0x00
@@ -59,6 +60,13 @@ struct mtk_clock_event_device {
 	struct clock_event_device dev;
 };
 
+static void __iomem *gpt_sched_reg __read_mostly;
+
+static u64 notrace mtk_read_sched_clock(void)
+{
+	return readl_relaxed(gpt_sched_reg);
+}
+
 static inline struct mtk_clock_event_device *to_mtk_clk(
 				struct clock_event_device *c)
 {
@@ -230,6 +238,8 @@ static void __init mtk_timer_init(struct device_node *node)
 	mtk_timer_setup(evt, GPT_CLK_SRC, TIMER_CTRL_OP_FREERUN);
 	clocksource_mmio_init(evt->gpt_base + TIMER_CNT_REG(GPT_CLK_SRC),
 			node->name, rate, 300, 32, clocksource_mmio_readl_up);
+	gpt_sched_reg = evt->gpt_base + TIMER_CNT_REG(GPT_CLK_SRC);
+	sched_clock_register(mtk_read_sched_clock, 32, rate);
 
 	/* Configure clock event */
 	mtk_timer_setup(evt, GPT_CLK_EVT, TIMER_CTRL_OP_REPEAT);
-- 
1.9.1
